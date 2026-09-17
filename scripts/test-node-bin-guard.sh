#!/usr/bin/env bash
# Checks the root-ownership guard in install-ponytail-machine.sh, which decides
# whether an interpreter is safe to register for every account on the machine.
# Getting it wrong is a local privilege escalation, so it gets a test even
# though this repo otherwise has none.
#
# Run: bash scripts/test-node-bin-guard.sh
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALLER="$REPO/scripts/install-ponytail-machine.sh"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Test the shipped code rather than a copy: pull the guard straight out of the
# installer. If that extraction ever stops matching, fail loudly instead of
# silently testing an empty file.
GUARD="$TMP/guard.sh"
awk '/^if \[ "\$NODE_BIN" != node \]; then$/,/^fi$/' "$INSTALLER" > "$GUARD"
grep -q 'is not root-owned' "$GUARD" || {
  echo "error: could not extract the guard from $INSTALLER." >&2
  echo "       The block moved or was rewritten; update this test." >&2
  exit 1
}

# A root-owned binary in a root-owned directory is the shape the guard accepts.
# Everything in $TMP is owned by whoever runs this, so when that is not root
# the "good" cases cannot be built and are skipped rather than reported as
# failures.
ROOT_OK=0
if [ "$(id -u)" -eq 0 ]; then
  ROOT_OK=1
  mkdir -p "$TMP/rootbin"
  printf '#!/bin/sh\n' > "$TMP/rootbin/node"
  chmod +x "$TMP/rootbin/node"
  ln -sfn "$TMP/rootbin/node" "$TMP/link-to-root"
fi

# A path owned by someone other than root. Prefer a real one; fall back to a
# path this (non-root) run owns.
UNOWNED=""
for c in /opt/node22/bin/node /opt/node20/bin/node; do
  [ -e "$c" ] && [ "$(stat -L -c %u "$c" 2>/dev/null || stat -L -f %u "$c" 2>/dev/null)" != 0 ] && { UNOWNED="$c"; break; }
done
if [ -z "$UNOWNED" ] && [ "$(id -u)" -ne 0 ]; then
  printf '#!/bin/sh\n' > "$TMP/mine"; chmod +x "$TMP/mine"; UNOWNED="$TMP/mine"
fi
ln -sfn "${UNOWNED:-/nonexistent}" "$TMP/link-to-user"

fails=0
check() { # name, NODE_BIN, expected
  local got
  if NODE_BIN="$2" bash "$GUARD" >/dev/null 2>&1; then got=allowed; else got=refused; fi
  if [ "$got" = "$3" ]; then
    printf 'PASS  %-32s %s\n' "$1" "$got"
  else
    printf 'FAIL  %-32s %s (wanted %s)\n' "$1" "$got" "$3"
    fails=$((fails + 1))
  fi
}

check "bare 'node' is left alone"      node          allowed
check "nonexistent path"               /nope/node    refused
[ -n "$UNOWNED" ] && {
  check "user-owned binary"            "$UNOWNED"    refused
  # The regression this test exists for: stat without -L reports the link's
  # owner, so a root-owned symlink used to sail past while the binary it points
  # at stayed user-writable.
  check "root symlink -> user binary"  "$TMP/link-to-user" refused
}
[ "$ROOT_OK" -eq 1 ] && {
  check "root binary in root dir"      "$TMP/rootbin/node"  allowed
  check "root symlink -> root binary"  "$TMP/link-to-root"  allowed
}
[ "$ROOT_OK" -eq 0 ] && echo "SKIP  root-owned cases (re-run as root to cover them)"

echo
[ "$fails" -eq 0 ] && { echo "all good"; exit 0; }
echo "$fails failing"; exit 1
