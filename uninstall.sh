#!/bin/bash

# Marketing Suite para Claude Code — Desinstalador

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

SKILLS_DIR="$HOME/.claude/skills"

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Marketing Suite — Desinstalador${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

SKILLS=(
    "marketing"
    "marketing-audit"
    "marketing-copy"
    "marketing-emails"
    "marketing-social"
    "marketing-seo"
    "marketing-competitors"
    "marketing-landing"
    "marketing-ads"
    "marketing-brand"
    "marketing-proposal"
    "marketing-report"
)

REMOVED=0
for skill in "${SKILLS[@]}"; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        rm -rf "$SKILLS_DIR/$skill"
        echo -e "  ${RED}-${NC} $skill eliminado"
        ((REMOVED++))
    fi
done

echo ""
if [ "$REMOVED" -gt 0 ]; then
    echo -e "${GREEN}Se eliminaron $REMOVED skills de marketing.${NC}"
else
    echo -e "${YELLOW}No se encontraron skills de marketing instalados.${NC}"
fi
echo ""
