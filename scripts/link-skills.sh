#!/bin/sh
# Link every skill in this repo into the user-level skill directories, so they
# load in any project, not only in sessions started inside this repo.
# Symlinks, so `npx skills update` here reaches the user-level install too.
# Re-runnable: existing entries are left alone.
set -eu

src=$(CDPATH= cd -- "$(dirname -- "$0")/../.agents/skills" && pwd)
linked=0
skipped=0

for dir in "$src"/*/; do
  name=$(basename "$dir")
  for target in "$HOME/.agents/skills" "$HOME/.claude/skills"; do
    mkdir -p "$target"
    if [ -e "$target/$name" ] || [ -L "$target/$name" ]; then
      skipped=$((skipped + 1))
    else
      ln -s "$dir" "$target/$name"
      linked=$((linked + 1))
    fi
  done
done

broken=$(find "$HOME/.agents/skills" "$HOME/.claude/skills" -maxdepth 1 -xtype l | wc -l)
echo "linked $linked, skipped $skipped already present, broken $broken"
[ "$broken" -eq 0 ]
