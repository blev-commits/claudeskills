#!/usr/bin/env bash
# CLAUDE_CONFIG_DIR overrides ~/.claude, matching where the hooks write the flag (issue #34)
#
# LOCAL PATCH -- diverges from upstream DietrichGebert/ponytail. See README.
# A repo that runs ponytail as project hooks keeps its mode flag inside the repo
# (.claude/.ponytail/active), so check that first, using the project directory
# Claude Code passes on stdin. Falls back to upstream's user-level flag whenever
# there is no stdin, no project_dir, or no repo-local flag -- so an ordinary
# user-level install behaves exactly as before.
input=$(cat 2>/dev/null || true)
project_dir=$(printf '%s' "$input" \
  | sed -n 's/.*"project_dir"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' \
  | head -n1)

flag="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/.ponytail-active"
if [ -n "$project_dir" ] && [ -f "$project_dir/.claude/.ponytail/active" ]; then
    flag="$project_dir/.claude/.ponytail/active"
fi
[ -f "$flag" ] || exit 0

mode=$(head -n1 "$flag" | tr -d '[:space:]')

# ultra is the high-intensity mode; flag it amber so it stands out from the
# default green at a glance. The level is still in the text, so color is a
# redundant cue, not the only one.
color=108
[ "$mode" = "ultra" ] && color=173

if [ -z "$mode" ] || [ "$mode" = "full" ]; then
    printf '\033[38;5;%sm[PONYTAIL]\033[0m' "$color"
else
    printf '\033[38;5;%sm[PONYTAIL:%s]\033[0m' "$color" "$(printf '%s' "$mode" | tr '[:lower:]' '[:upper:]')"
fi
