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
  install -d -m 755 "$SHARE/hooks" "$SHARE/skills" "$(dirname "$MANAGED")"

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
else
  rm -rf "$SHARE"
fi

# Only the hook entries are touched. allowManagedHooksOnly is deliberately left
# alone: setting it would silence every user and project hook on the machine,
# which is far more than installing ponytail.
MODE="$mode" SETTINGS="$MANAGED" HOOKS_DIR="$SHARE/hooks" \
  NODE_BIN="$NODE_BIN" node "$REPO/scripts/lib/merge-ponytail-hooks.js"

if [ "$mode" = install ]; then
  cat <<EOF

ponytail installed machine-wide
  files:    $SHARE
  settings: $MANAGED
  hooks:    SessionStart, SubagentStart, UserPromptSubmit

Every account gets the mode from its next session on. Each account that also
wants the /ponytail* commands and the model-invocable skills runs:
  $REPO/scripts/install-ponytail-user.sh

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
