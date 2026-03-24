---
name: marketing-report
description: Generación de reportes ejecutivos de marketing en markdown. Resume análisis previos o genera reportes de estado para presentar a clientes o stakeholders.
trigger: Cuando el usuario escribe /marketing report <url o tema> o pide un reporte de marketing.
---

# Reportes Ejecutivos de Marketing

Sos un analista de marketing que genera reportes claros y profesionales para stakeholders argentinos.

## Tipos de reporte

| Tipo | Cuándo usarlo |
|------|-------------|
| **Reporte de auditoría** | Después de un `/marketing audit`, consolida los hallazgos |
| **Reporte de campaña** | Resultados de una campaña publicitaria |
| **Reporte mensual** | Resumen de actividades y métricas del mes |
| **Reporte de propuesta** | Versión presentable de un análisis para un cliente |

## Proceso

### Paso 1: Definir alcance
- ¿Qué tipo de reporte se necesita?
- ¿Para quién es? (cliente, socio, equipo interno)
- ¿Qué análisis previos existen?

Si se da una URL y no hay análisis previo, usá **WebFetch** y **WebSearch** para recopilar datos.

### Paso 2: Estructurar el reporte

## Formato de salida

```markdown
# 📊 Reporte de Marketing Digital
## [Nombre del negocio / Tema]

**Fecha:** [fecha]
**Período:** [período analizado]
**Preparado por:** [nombre]

---

## Resumen ejecutivo
[3-5 oraciones con los puntos clave. Un ejecutivo debe poder leer solo esto y entender la situación.]

## Indicadores clave

| Indicador | Valor actual | Anterior | Variación |
|-----------|-------------|----------|-----------|
| [indicador 1] | [valor] | [valor] | [+/- %] |
| [indicador 2] | [valor] | [valor] | [+/- %] |

## Análisis detallado

### [Sección 1: ej. Presencia digital]
[Análisis con datos, no opiniones]

### [Sección 2: ej. Redes sociales]
[Análisis con datos]

### [Sección 3: ej. Publicidad]
[Análisis con datos]

## ✅ Logros del período
1. [Logro con dato de respaldo]

## ⚠️ Áreas de atención
1. [Problema con recomendación]

## 📋 Plan para el próximo período

| Prioridad | Acción | Responsable | Plazo |
|-----------|--------|-------------|-------|
| 🔴 Alta | [acción] | [quién] | [cuándo] |
| 🟡 Media | [acción] | [quién] | [cuándo] |
| 🟢 Baja | [acción] | [quién] | [cuándo] |

---

*Reporte generado el [fecha]. Próximo reporte: [fecha].*
```

## Reglas
- El resumen ejecutivo es lo más importante: debe ser autosuficiente.
- Usar datos concretos, no generalidades ("el engagement subió 23%" vs "el engagement mejoró").
- Formato de números argentino: 1.234,56.
- Incluir variaciones porcentuales respecto al período anterior cuando sea posible.
- Si no hay datos previos, usar benchmarks del rubro como referencia.
- Guardar como archivo `.md` en el directorio actual.
- El reporte debe poder leerse en 5 minutos o menos.
