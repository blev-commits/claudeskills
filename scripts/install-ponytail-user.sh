#!/usr/bin/env bash
# Install ponytail for this machine's user, so it is active in every project
# rather than only in this repository. Reverse it with --uninstall.
#
# Copies the skills, hooks and slash commands from this repo into the Claude
# config directory ($CLAUDE_CONFIG_DIR, or ~/.claude) and registers the three
# lifecycle hooks in its settings.json. Re-running is safe: files are
# overwritten, hook entries are added only once.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
SKILLS=(ponytail ponytail-audit ponytail-debt ponytail-gain ponytail-help ponytail-review)

command -v node >/dev/null 2>&1 || {
  echo "error: node is not on PATH, and ponytail's hooks are Node scripts." >&2
  echo "       Install Node (and make sure it is on the non-interactive" >&2
  echo "       shell's PATH, which is what runs hooks), then re-run this." >&2
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

mode=install
case "${1:-}" in
  --uninstall) mode=uninstall ;;
  "") ;;
  *) echo "usage: $(basename "$0") [--uninstall]" >&2; exit 2 ;;
esac

# Checked before anything is copied, so an unparseable settings.json leaves the
# config directory exactly as it was rather than half-installed.
if [ -f "$TARGET/settings.json" ]; then
  SETTINGS="$TARGET/settings.json" node -e '
    const f = process.env.SETTINGS;
    try {
      JSON.parse(require("fs").readFileSync(f, "utf8").replace(/^﻿/, ""));
    } catch (e) {
      console.error(`error: ${f} is not valid JSON (${e.message}).`);
      console.error("       Fix or move it, then re-run. Nothing was changed.");
      process.exit(1);
    }
  '
fi

if [ "$mode" = install ]; then
  mkdir -p "$TARGET/hooks" "$TARGET/commands" "$TARGET/skills"

  cp "$REPO"/.claude/hooks/ponytail-*.js "$TARGET/hooks/"
  cp "$REPO"/.claude/hooks/ponytail-statusline.sh "$REPO"/.claude/hooks/ponytail-statusline.ps1 "$TARGET/hooks/"
  chmod +x "$TARGET"/hooks/ponytail-*.js "$TARGET/hooks/ponytail-statusline.sh"

  cp "$REPO"/.claude/commands/ponytail*.md "$TARGET/commands/"

  # The skills go in beside the hooks, not as symlinks into this repo: the repo
  # may move or be deleted, and ponytail-instructions.js reads the ruleset from
  # ../skills/ponytail/SKILL.md relative to the hooks directory. Copying keeps
  # the hooks emitting the real skill body instead of their terser fallback.
  #
  # A symlink already there is left alone: link-skills.sh puts one per skill so
  # `npx skills update` in the repo reaches the user-level install, and the
  # hooks read the ruleset through it just as well. Replacing it with a copy
  # would quietly cut that skill off from updates.
  for s in "${SKILLS[@]}"; do
    if [ -L "$TARGET/skills/$s" ] && [ -f "$TARGET/skills/$s/SKILL.md" ]; then
      continue
    fi
    rm -rf "$TARGET/skills/$s"
    cp -R "$REPO/.agents/skills/$s" "$TARGET/skills/$s"
  done
else
  rm -f "$TARGET"/hooks/ponytail-*.js "$TARGET"/hooks/ponytail-statusline.sh "$TARGET"/hooks/ponytail-statusline.ps1
  rm -f "$TARGET"/commands/ponytail*.md
  # Only copies this script made are removed. A symlink belongs to
  # link-skills.sh, which manages all 45 skills, not just ponytail's.
  for s in "${SKILLS[@]}"; do
    [ -L "$TARGET/skills/$s" ] || rm -rf "$TARGET/skills/$s"
  done
  # State ponytail writes outside its own files: the active-mode flag the
  # statusline reads, and the marker for the statusline setup offer.
  rm -f "$TARGET/.ponytail-active" "$TARGET/.ponytail-statusline-nudged"
fi

# settings.json is edited rather than written: it is the user's own file and
# usually already holds their hooks, plugins and preferences. The hooks path is
# left as shell syntax so a moved config directory keeps working. STATUSLINE=1
# also wires the ponytail badge, which only makes sense per-user: in managed
# settings it would override every account's own statusline.
MODE="$mode" SETTINGS="$TARGET/settings.json" STATUSLINE=1 \
  HOOKS_DIR='${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks' \
  NODE_BIN="$NODE_BIN" node "$REPO/scripts/lib/merge-ponytail-hooks.js"

if [ "$mode" = install ]; then
  cat <<EOF

ponytail installed for this user in $TARGET
  skills:   ${#SKILLS[@]} (ponytail, -review, -audit, -debt, -gain, -help)
  commands: /ponytail, /ponytail-review, /ponytail-audit, /ponytail-debt, /ponytail-gain, /ponytail-help
  hooks:    SessionStart, SubagentStart, UserPromptSubmit
  status:   [PONYTAIL] badge, unless you already had a statusLine

Active in every project from the next session on. Turn it off with
/ponytail off, or permanently with PONYTAIL_DEFAULT_MODE=off in your
environment. Reverse this install with: $(basename "$0") --uninstall
EOF
else
  echo
  echo "ponytail removed from $TARGET"
  echo "A statusLine you set yourself is left alone — only ponytail's own entry is removed."
fi
