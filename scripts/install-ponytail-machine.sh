#!/usr/bin/env bash
# Install ponytail for every account on this machine, through Claude Code's
# managed settings. Needs root. Reverse it with --uninstall.
#
# Managed settings are the admin tier: users cannot override or remove what is
# registered here from their own settings.json. They can still turn the mode
# off for themselves — see the closing notes — because that switch is read by
# ponytail's own scripts, not by settings precedence.
#
# Scope, and why it differs from the per-user installer: Claude Code reads
# skills and slash commands from per-account directories only, and managed
# settings have no equivalent. So this registers the hooks, which is what makes
# the mode persistent: they inject the full ruleset at session start and into
# every subagent. What each account does NOT get from here is the /ponytail*
# slash commands and the model-invocable skills; for those, that account runs
# install-ponytail-user.sh as well.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SHARE="${PONYTAIL_SHARE_DIR:-/usr/local/share/ponytail}"
SKILLS=(ponytail ponytail-audit ponytail-debt ponytail-gain ponytail-help ponytail-review)

if [ -n "${PONYTAIL_MANAGED_SETTINGS:-}" ]; then
  MANAGED="$PONYTAIL_MANAGED_SETTINGS"
else
  case "$(uname -s)" in
    Linux)  MANAGED=/etc/claude-code/managed-settings.json ;;
    Darwin) MANAGED="/Library/Application Support/ClaudeCode/managed-settings.json" ;;
    *)
      echo "error: no managed-settings path known for $(uname -s)." >&2
      echo "       On Windows the file is C:\\Program Files\\ClaudeCode\\managed-settings.json;" >&2
      echo "       install there by hand, or set PONYTAIL_MANAGED_SETTINGS to its path." >&2
      exit 1 ;;
  esac
fi

mode=install
case "${1:-}" in
  --uninstall) mode=uninstall ;;
  "") ;;
  *) echo "usage: sudo $(basename "$0") [--uninstall]" >&2; exit 2 ;;
esac

command -v node >/dev/null 2>&1 || {
  echo "error: node is not on PATH, and ponytail's hooks are Node scripts." >&2
  exit 1
}

# Which node the hooks can reach is not the one on your PATH: they run in a
# non-interactive shell, whose PATH is narrower under nvm, Homebrew on Apple
# Silicon or Nix. Bare "node" when it resolves there, the absolute path when it
# does not, so the hooks work without a symlink into /usr/local/bin.
NODE_BIN=node
if [ -z "$(env -i /bin/sh -c 'command -v node' 2>/dev/null)" ]; then
  NODE_BIN="$(command -v node)"
fi

# That absolute path goes into root-owned managed settings, which every account
# runs at every session start and cannot override. A node owned by a regular
# user -- the normal case under nvm, and what sudo hands us when it keeps the
# caller's PATH -- would let that user run code in everyone else's sessions, as
# them. Refuse rather than warn: the whole point of the managed tier is that
# users cannot opt out of what is registered here.
if [ "$NODE_BIN" != node ]; then
  # Resolve symlinks first: a root-owned link pointing at a user-owned binary
  # passes an un-dereferenced check while still running the user's code, and
  # /usr/local/bin/node is usually exactly that link. Resolved with readlink,
  # never by executing $NODE_BIN -- at this point we are root and it is the
  # thing under suspicion.
  real_node="$(readlink -f "$NODE_BIN" 2>/dev/null || echo "$NODE_BIN")"
  # The directory counts too: a root-owned binary in a user-owned directory can
  # simply be replaced.
  for p in "$real_node" "$(dirname "$real_node")"; do
    uid="$(stat -L -c %u "$p" 2>/dev/null || stat -L -f %u "$p" 2>/dev/null || echo unknown)"
    if [ "$uid" != 0 ]; then
      echo "error: $p is not root-owned (uid $uid)." >&2
      echo "       Every account runs this interpreter at session start and cannot" >&2
      echo "       override it, so whoever owns that path could execute code in" >&2
      echo "       their sessions, as them." >&2
      echo "       Install node system-wide -- the binary AND its directory owned" >&2
      echo "       by root -- then re-run. A symlink from a root-owned directory" >&2
      echo "       does not help while the target stays user-owned." >&2
      echo "       The per-user installer has no such restriction." >&2
      exit 1
    fi
  done
fi

# Every account's sessions will run these hooks, so the files and the managed
# settings must be root-owned. Without root the install would either fail
# halfway or land somewhere users could edit.
[ "$(id -u)" -eq 0 ] || {
  echo "error: this writes $MANAGED and $SHARE, so it needs root." >&2
  echo "       Re-run it as: sudo $0 ${1:-}" >&2
  exit 1
}

# Checked before anything is copied, so an unparseable file leaves the machine
# exactly as it was rather than half-installed.
if [ -f "$MANAGED" ]; then
  SETTINGS="$MANAGED" node -e '
    const f = process.env.SETTINGS;
    try {
      JSON.parse(require("fs").readFileSync(f, "utf8").replace(/^\uFEFF/, ""));
    } catch (e) {
      console.error(`error: ${f} is not valid JSON (${e.message}).`);
      console.error("       Fix or move it, then re-run. Nothing was changed.");
      process.exit(1);
    }
  '
fi

if [ "$mode" = install ]; then
  install -d -m 755 "$SHARE/hooks" "$SHARE/skills"
  # Created only when absent: install -d also chmods an existing directory, and
  # an admin who deliberately locked down the managed settings directory should
  # not have it relaxed to 755 as a side effect of installing ponytail.
  [ -d "$(dirname "$MANAGED")" ] || install -d -m 755 "$(dirname "$MANAGED")"

  install -m 755 "$REPO"/.claude/hooks/ponytail-*.js "$SHARE/hooks/"
  install -m 755 "$REPO/.claude/hooks/ponytail-statusline.sh" "$SHARE/hooks/"
  install -m 644 "$REPO/.claude/hooks/ponytail-statusline.ps1" "$SHARE/hooks/"

  # ponytail-instructions.js reads the ruleset from ../skills/ponytail/SKILL.md
  # relative to the hooks directory, so the skills ship beside them. They are
  # the hooks' data here, not skills Claude Code lists: that is per-account.
  for s in "${SKILLS[@]}"; do
    rm -rf "$SHARE/skills/$s"
    cp -R "$REPO/.agents/skills/$s" "$SHARE/skills/$s"
  done
  chmod -R a+rX "$SHARE"
fi

# Only the hook entries are touched. allowManagedHooksOnly is deliberately left
# alone: setting it would silence every user and project hook on the machine,
# which is far more than installing ponytail.
#
# On uninstall this runs BEFORE $SHARE is deleted: if it failed after the files
# were gone, every account on the machine would be left with managed hooks
# pointing at scripts that no longer exist.
MODE="$mode" SETTINGS="$MANAGED" HOOKS_DIR="$SHARE/hooks" \
  NODE_BIN="$NODE_BIN" node "$REPO/scripts/lib/merge-ponytail-hooks.js"

if [ "$mode" = uninstall ]; then
  rm -rf "$SHARE"
fi

if [ "$mode" = install ]; then
  cat <<EOF

ponytail installed machine-wide
  files:    $SHARE
  settings: $MANAGED
  hooks:    SessionStart, SubagentStart, UserPromptSubmit

Every account gets the mode from its next session on. Each account that also
wants the /ponytail* commands and the model-invocable skills runs:
  $REPO/scripts/install-ponytail-user.sh --no-hooks

--no-hooks matters: the hooks above already run for every account, and Claude
Code runs managed and per-user hooks additively, so registering them per-account
as well would run each one twice per session.

node must be on the non-interactive shell's PATH for every account, not just
yours — that is the shell that runs hooks.

Per-account opt-out, which managed settings do not block: PONYTAIL_DEFAULT_MODE=off
in the environment, {"defaultMode":"off"} in ~/.config/ponytail/config.json, or
/ponytail off for one session.

Reverse this with: sudo $(basename "$0") --uninstall
EOF
else
  cat <<EOF

ponytail removed machine-wide ($SHARE deleted, hooks unregistered from $MANAGED)

Per-account leftovers are not touched, since they live in each home directory:
~/.claude/.ponytail-active, ~/.claude/.ponytail-statusline-nudged and
~/.config/ponytail/config.json. An account that also ran the per-user installer
reverses it with: install-ponytail-user.sh --uninstall
EOF
fi
