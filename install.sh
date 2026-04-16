#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "=== Interactive Skill Creator: Installation ==="
echo ""

SKILL_TARGET="$HOME/.agents/skills/interactive-skill-creator"
mkdir -p "$SKILL_TARGET"

cp -r "$REPO_ROOT/skill/"* "$SKILL_TARGET/"

echo "Skill installed to: $SKILL_TARGET"
echo ""
echo "=== Installation Complete ==="
echo ""
echo "Next steps:"
echo "  1. Restart your AI tool"
echo "  2. Say 'create an interactive skill' to start building"
echo ""
