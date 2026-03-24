#!/bin/bash

# Marketing Suite para Claude Code — Instalador
# https://github.com/franciscopidal/marketing-claude

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"
REPO_URL="https://github.com/Fpidal/marketing-claude.git"

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Marketing Suite para Claude Code${NC}"
echo -e "${BLUE}  Instalador v1.0${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Detectar si se ejecuta via curl o localmente
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" 2>/dev/null)" && pwd 2>/dev/null)"

if [ ! -f "$SCRIPT_DIR/market/SKILL.md" ]; then
    echo -e "${YELLOW}Descargando repositorio...${NC}"
    TEMP_DIR=$(mktemp -d)
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR/marketing-claude" 2>/dev/null
    SCRIPT_DIR="$TEMP_DIR/marketing-claude"
    CLEANUP_TEMP=true
else
    CLEANUP_TEMP=false
fi

# Verificar que Claude Code existe
if [ ! -d "$CLAUDE_DIR" ]; then
    echo -e "${YELLOW}Creando directorio .claude...${NC}"
    mkdir -p "$CLAUDE_DIR"
fi

# Crear directorio de skills si no existe
mkdir -p "$SKILLS_DIR"

# Instalar skill principal (orquestador)
echo -e "${GREEN}Instalando orquestador principal...${NC}"
mkdir -p "$SKILLS_DIR/marketing"
cp "$SCRIPT_DIR/market/SKILL.md" "$SKILLS_DIR/marketing/SKILL.md"

# Instalar sub-skills
SKILLS=(
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

INSTALLED=0
for skill in "${SKILLS[@]}"; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$SKILLS_DIR/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$SKILLS_DIR/$skill/SKILL.md"
        echo -e "  ${GREEN}+${NC} $skill"
        ((INSTALLED++))
    else
        echo -e "  ${YELLOW}!${NC} $skill (no encontrado, omitido)"
    fi
done

# Instalar scripts Python si existen
if [ -d "$SCRIPT_DIR/scripts" ]; then
    echo ""
    echo -e "${GREEN}Instalando scripts utilitarios...${NC}"
    SCRIPTS_INSTALLED=0
    for script in "$SCRIPT_DIR/scripts"/*.py; do
        if [ -f "$script" ]; then
            chmod +x "$script"
            echo -e "  ${GREEN}+${NC} $(basename "$script")"
            ((SCRIPTS_INSTALLED++))
        fi
    done
fi

# Verificar Python (opcional)
echo ""
if command -v python3 &> /dev/null; then
    echo -e "${GREEN}Python 3 detectado${NC}"
    if python3 -c "import reportlab" 2>/dev/null; then
        echo -e "${GREEN}reportlab disponible (PDFs habilitados)${NC}"
    else
        echo -e "${YELLOW}reportlab no instalado. Para generar PDFs: pip install reportlab${NC}"
    fi
else
    echo -e "${YELLOW}Python 3 no encontrado. Los scripts de PDF no estaran disponibles.${NC}"
fi

# Limpiar temp si fue descargado
if [ "$CLEANUP_TEMP" = true ] && [ -n "$TEMP_DIR" ]; then
    rm -rf "$TEMP_DIR"
fi

# Resumen
echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}Instalacion completada${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "  Skills instalados: ${GREEN}$INSTALLED${NC}"
echo ""
echo -e "  Comandos disponibles:"
echo -e "    ${BLUE}/marketing audit <url>${NC}       Auditoria completa"
echo -e "    ${BLUE}/marketing copy <url>${NC}        Analisis de copywriting"
echo -e "    ${BLUE}/marketing seo <url>${NC}         Auditoria SEO"
echo -e "    ${BLUE}/marketing landing <url>${NC}     Optimizacion de landing"
echo -e "    ${BLUE}/marketing competitors <url>${NC} Analisis competitivo"
echo -e "    ${BLUE}/marketing brand <url>${NC}       Analisis de marca"
echo -e "    ${BLUE}/marketing social <tema>${NC}     Calendario de redes"
echo -e "    ${BLUE}/marketing emails <tema>${NC}     Secuencias de email"
echo -e "    ${BLUE}/marketing ads <tema>${NC}        Creatividades publicitarias"
echo -e "    ${BLUE}/marketing proposal <cliente>${NC} Propuesta comercial"
echo -e "    ${BLUE}/marketing report <tema>${NC}     Reporte ejecutivo"
echo ""
echo -e "  ${YELLOW}Abre Claude Code y proba: /marketing audit https://tusitio.com${NC}"
echo ""
