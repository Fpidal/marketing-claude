# Marketing Suite para Claude Code

Suite completa de marketing digital para **Claude Code**. Analiza sitios web, genera reportes, crea contenido y automatiza tareas de marketing desde la terminal.

Pensada para el **mercado argentino**: voseo, pesos, WhatsApp Business, Google Mi Negocio y contexto local.

---

## Comandos disponibles

| Comando | Descripcion |
|---------|-------------|
| `/marketing audit <url>` | Auditoria completa de marketing digital (puntaje 0-100) |
| `/marketing copy <url>` | Analisis y optimizacion de copywriting |
| `/marketing seo <url>` | Auditoria SEO tecnica y de contenido |
| `/marketing landing <url>` | Optimizacion de landing pages (CRO) |
| `/marketing competitors <url>` | Analisis competitivo y benchmarking |
| `/marketing brand <url>` | Analisis de marca, voz y posicionamiento |
| `/marketing social <tema>` | Calendario de redes sociales (30 dias) |
| `/marketing emails <tema>` | Secuencias de email marketing |
| `/marketing ads <url/tema>` | Creatividades para Meta Ads y Google Ads |
| `/marketing proposal <cliente>` | Propuesta comercial lista para presentar |
| `/marketing report <url/tema>` | Reporte ejecutivo en markdown |

---

## Instalacion

### Opcion 1: Instalacion rapida (recomendada)

```bash
curl -fsSL https://raw.githubusercontent.com/franciscopidal/marketing-claude/main/install.sh | bash
```

### Opcion 2: Instalacion manual

```bash
git clone https://github.com/franciscopidal/marketing-claude.git
cd marketing-claude
chmod +x install.sh
./install.sh
```

### Desinstalar

```bash
curl -fsSL https://raw.githubusercontent.com/franciscopidal/marketing-claude/main/uninstall.sh | bash
```

---

## Como funciona

### Auditoria de marketing (`/marketing audit`)

La auditoria analiza 6 dimensiones con pesos ponderados:

| Dimension | Peso |
|-----------|------|
| Contenido y mensajes | 25% |
| Optimizacion de conversion | 20% |
| SEO y descubrimiento | 20% |
| Posicionamiento competitivo | 15% |
| Confianza y credibilidad | 10% |
| Estrategia de crecimiento | 10% |

**Resultado:** Puntaje de 0 a 100 con clasificacion:

| Rango | Nivel |
|-------|-------|
| 90-100 | Excelente |
| 75-89 | Bueno |
| 60-74 | Aceptable |
| 40-59 | Necesita trabajo |
| 0-39 | Critico |

### Ejemplo de uso

```
> /marketing audit https://ejemplo.com.ar

Analizando sitio web...
Generando reporte...

Auditoria de Marketing — Ejemplo
Puntaje general: 62/100 — Aceptable

[Reporte completo guardado en auditoria-ejemplo.md]
```

---

## Estructura del repositorio

```
marketing-claude/
├── market/
│   └── SKILL.md              # Orquestador principal (router)
├── skills/
│   ├── marketing-audit/      # Auditoria completa
│   ├── marketing-copy/       # Copywriting
│   ├── marketing-seo/        # SEO
│   ├── marketing-landing/    # Landing pages
│   ├── marketing-competitors/# Competencia
│   ├── marketing-brand/      # Marca
│   ├── marketing-social/     # Redes sociales
│   ├── marketing-emails/     # Email marketing
│   ├── marketing-ads/        # Publicidad
│   ├── marketing-proposal/   # Propuestas comerciales
│   └── marketing-report/     # Reportes ejecutivos
├── templates/
│   ├── propuesta-comercial.md
│   ├── calendario-contenido.md
│   ├── email-bienvenida.md
│   ├── email-lanzamiento.md
│   └── checklist-lanzamiento.md
├── scripts/
│   └── generar_pdf.py        # Generador de PDFs
├── install.sh
├── uninstall.sh
├── .gitignore
├── LICENSE
└── README.md
```

---

## Contexto argentino

Esta suite esta adaptada al mercado argentino:

- **Idioma:** Espanol con voseo natural
- **Moneda:** Pesos argentinos ($ 1.234,56) con ajuste por IPC
- **Plataformas priorizadas:** Instagram, WhatsApp Business, Meta Ads, Google Mi Negocio
- **SEO local:** Keywords en espanol argentino ("pileta" no "piscina", "departamento" no "piso")
- **Horarios optimos:** Adaptados a la zona horaria argentina
- **Mobile first:** Considerando que >70% del trafico argentino es mobile

---

## Uso en Claude Cowork / claude.ai

Los prompts tambien se pueden usar fuera de Claude Code:

1. Crear un **Proyecto** en claude.ai llamado "Marketing Digital"
2. Copiar el contenido de `market/SKILL.md` en las instrucciones del proyecto
3. Usar los prompts de cada skill como mensajes

El archivo `comandos-marketing.md` (incluido en templates) tiene todos los prompts listos para copiar y pegar.

---

## Requisitos

- [Claude Code](https://claude.ai/claude-code) instalado
- Python 3.8+ (opcional, para generacion de PDFs)
- `reportlab` (opcional): `pip install reportlab`

---

## Licencia

MIT License - Usa, modifica y distribuye libremente.

---

Desarrollado por **Francisco Pidal** | Adaptado para el mercado argentino
