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
  for s in "${SKILLS[@]}"; do
    rm -rf "$TARGET/skills/$s"
    cp -R "$REPO/.agents/skills/$s" "$TARGET/skills/$s"
  done
else
  rm -f "$TARGET"/hooks/ponytail-*.js "$TARGET"/hooks/ponytail-statusline.sh "$TARGET"/hooks/ponytail-statusline.ps1
  rm -f "$TARGET"/commands/ponytail*.md
  for s in "${SKILLS[@]}"; do rm -rf "$TARGET/skills/$s"; done
  # State ponytail writes outside its own files: the active-mode flag the
  # statusline reads, and the marker for the statusline setup offer.
  rm -f "$TARGET/.ponytail-active" "$TARGET/.ponytail-statusline-nudged"
fi

# settings.json is edited rather than written: it is the user's own file and
# usually already holds their hooks, plugins and preferences.
MODE="$mode" SETTINGS="$TARGET/settings.json" node - <<'JS'
const fs = require('fs');

const file = process.env.SETTINGS;
const uninstalling = process.env.MODE === 'uninstall';
const dir = '${CLAUDE_CONFIG_DIR:-$HOME/.claude}'; // resolved by the shell that runs the hook
const isPonytail = (h) => typeof h.command === 'string' && /ponytail-[a-z-]+\.js/.test(h.command);

const entries = {
  SessionStart: {
    matcher: 'startup|resume|clear|compact',
    hooks: [{
      type: 'command',
      command: `node "${dir}/hooks/ponytail-activate.js"`,
      timeout: 5,
      statusMessage: 'Loading ponytail mode...',
    }],
  },
  SubagentStart: {
    hooks: [{
      type: 'command',
      command: `node "${dir}/hooks/ponytail-subagent.js"`,
      timeout: 5,
      statusMessage: 'Loading ponytail mode...',
    }],
  },
  UserPromptSubmit: {
    hooks: [{
      type: 'command',
      command: `node "${dir}/hooks/ponytail-mode-tracker.js"`,
      timeout: 5,
      statusMessage: 'Tracking ponytail mode...',
    }],
  },
};

let settings = {};
if (fs.existsSync(file)) {
  // Strip a UTF-8 BOM: some editors prepend one and it breaks JSON.parse.
  const raw = fs.readFileSync(file, 'utf8').replace(/^﻿/, '');
  try {
    settings = JSON.parse(raw);
  } catch (e) {
    console.error(`error: ${file} is not valid JSON (${e.message}).`);
    console.error('       Fix or move it, then re-run. Nothing was changed.');
    process.exit(1);
  }
  fs.copyFileSync(file, `${file}.bak`);
}

settings.hooks = settings.hooks || {};
const changed = [];

for (const [event, entry] of Object.entries(entries)) {
  const groups = Array.isArray(settings.hooks[event]) ? settings.hooks[event] : [];

  if (uninstalling) {
    const kept = groups
      .map((g) => ({ ...g, hooks: (g.hooks || []).filter((h) => !isPonytail(h)) }))
      .filter((g) => g.hooks.length > 0);
    if (kept.length !== groups.length) changed.push(event);
    if (kept.length) settings.hooks[event] = kept;
    else delete settings.hooks[event];
    continue;
  }

  if (groups.some((g) => (g.hooks || []).some(isPonytail))) continue; // already registered
  settings.hooks[event] = [...groups, entry];
  changed.push(event);
}

if (uninstalling && !Object.keys(settings.hooks).length) delete settings.hooks;

fs.writeFileSync(file, `${JSON.stringify(settings, null, 2)}\n`);

const verb = uninstalling ? 'Removed' : 'Registered';
console.log(changed.length
  ? `${verb} hooks: ${changed.join(', ')}`
  : `Hooks already ${uninstalling ? 'absent' : 'registered'}, settings.json left as it was`);
JS

if [ "$mode" = install ]; then
  cat <<EOF

ponytail installed for this user in $TARGET
  skills:   ${#SKILLS[@]} (ponytail, -review, -audit, -debt, -gain, -help)
  commands: /ponytail, /ponytail-review, /ponytail-audit, /ponytail-debt, /ponytail-gain, /ponytail-help
  hooks:    SessionStart, SubagentStart, UserPromptSubmit

Active in every project from the next session on. Turn it off with
/ponytail off, or permanently with PONYTAIL_DEFAULT_MODE=off in your
environment. Reverse this install with: $(basename "$0") --uninstall
EOF
else
  echo
  echo "ponytail removed from $TARGET"
  echo "A statusLine entry, if you accepted that setup offer, is left alone — it is yours."
fi
