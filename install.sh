#!/usr/bin/env bash
set -euo pipefail
dest="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
src="$(cd "$(dirname "$0")" && pwd)/skills"
mkdir -p "$dest"
for d in "$src"/*/; do
  cp -R "${d%/}" "$dest/"
  echo "Installed $(basename "$d")"
done
