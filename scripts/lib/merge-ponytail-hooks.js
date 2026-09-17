#!/usr/bin/env node
// Adds or removes ponytail's three lifecycle hooks in a Claude Code settings
// file, leaving everything else in it alone. Used by both installers:
// install-ponytail-user.sh (per-user settings.json) and
// install-ponytail-machine.sh (managed-settings.json, all accounts).
//
// Environment:
//   SETTINGS   path to the settings file (created if absent)
//   HOOKS_DIR  directory holding the ponytail-*.js hooks, as it should appear
//              in the command strings — may contain shell syntax such as
//              ${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks, which the shell that
//              runs the hook expands
//   MODE       "install" (default) or "uninstall"

const fs = require('fs');

const file = process.env.SETTINGS;
const hooksDir = process.env.HOOKS_DIR;
const uninstalling = process.env.MODE === 'uninstall';

if (!file || !hooksDir) {
  console.error('error: SETTINGS and HOOKS_DIR must both be set.');
  process.exit(2);
}

// Uninstalling what was never installed is a no-op, not an error. The install
// side creates the settings directory before calling this; the uninstall side
// does not, and must not -- removing ponytail should never create a system
// directory. Without this the write below dies on ENOENT, which is the normal
// case for the machine-wide installer: /etc/claude-code and its macOS
// equivalent do not exist until something puts them there.
if (uninstalling && !fs.existsSync(file)) {
  console.log(`Nothing to remove, ${file} does not exist`);
  process.exit(0);
}

const isPonytail = (h) => typeof h.command === 'string' && /ponytail-[a-z-]+\.js/.test(h.command);
const hook = (script, statusMessage) => ({
  type: 'command',
  command: `node "${hooksDir}/${script}"`,
  timeout: 5,
  statusMessage,
});

const entries = {
  SessionStart: {
    matcher: 'startup|resume|clear|compact',
    hooks: [hook('ponytail-activate.js', 'Loading ponytail mode...')],
  },
  SubagentStart: {
    hooks: [hook('ponytail-subagent.js', 'Loading ponytail mode...')],
  },
  UserPromptSubmit: {
    hooks: [hook('ponytail-mode-tracker.js', 'Tracking ponytail mode...')],
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

// HOOKS=0 registers nothing and removes nothing, leaving only the statusLine
// below. Claude Code runs managed and per-user hooks additively, so an account
// on a machine that already has the machine-wide install would otherwise end up
// running all three hooks twice per session -- the whole ruleset injected into
// context twice. Uninstall honours the same gate, so a --no-hooks install is
// reversed by a --no-hooks uninstall and never strips the machine's entries
// from an account that cannot see them anyway.
const doHooks = process.env.HOOKS !== '0';

for (const [event, entry] of (doHooks ? Object.entries(entries) : [])) {
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

// statusLine: the ponytail badge, wired to the copy under HOOKS_DIR rather than
// to a git working tree, so the command stays valid across branch switches.
// Only ever touch an entry that is ours: a statusLine the user set themselves
// is left exactly as it is, and uninstall removes only ponytail's own.
//
// Off unless STATUSLINE is set, which the per-user installer does and the
// machine-wide one deliberately does not: in managed settings a statusLine
// would override the one every account had chosen for itself.
if (process.env.STATUSLINE) {
  const ourStatusLine = `bash "${hooksDir}/ponytail-statusline.sh"`;
  const isOurStatusLine = (s) =>
    s && typeof s.command === 'string' && /ponytail-statusline\.(sh|ps1)/.test(s.command);

  if (uninstalling) {
    if (isOurStatusLine(settings.statusLine)) {
      delete settings.statusLine;
      changed.push('statusLine');
    }
  } else if (!settings.statusLine) {
    settings.statusLine = { type: 'command', command: ourStatusLine };
    changed.push('statusLine');
  }
}

fs.writeFileSync(file, `${JSON.stringify(settings, null, 2)}\n`);

const verb = uninstalling ? 'Removed' : 'Registered';
console.log(changed.length
  ? `${verb}: ${changed.join(', ')}`
  : `Hooks already ${uninstalling ? 'absent' : 'registered'}, ${file} left as it was`);
