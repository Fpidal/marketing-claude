#!/usr/bin/env python3
"""
Generador de PDFs a partir de reportes markdown de marketing.
Uso: python3 generar_pdf.py reporte.md [salida.pdf]
"""

import sys
import re
import os

def check_reportlab():
    try:
        import reportlab
        return True
    except ImportError:
        print("Error: reportlab no esta instalado.")
        print("Instalar con: pip install reportlab")
        return False

def md_to_pdf(md_path, pdf_path=None):
    if not check_reportlab():
        sys.exit(1)

    from reportlab.lib.pagesizes import A4
    from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
    from reportlab.lib.units import cm
    from reportlab.lib.colors import HexColor
    from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, PageBreak
    from reportlab.lib import colors

    if pdf_path is None:
        pdf_path = md_path.replace('.md', '.pdf')

    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()

    doc = SimpleDocTemplate(
        pdf_path,
        pagesize=A4,
        rightMargin=2*cm,
        leftMargin=2*cm,
        topMargin=2*cm,
        bottomMargin=2*cm
    )

    styles = getSampleStyleSheet()

    styles.add(ParagraphStyle(
        'TituloReporte',
        parent=styles['Title'],
        fontSize=22,
        spaceAfter=20,
        textColor=HexColor('#1a1a2e'),
        fontName='Helvetica-Bold'
    ))

    styles.add(ParagraphStyle(
        'Subtitulo',
        parent=styles['Heading2'],
        fontSize=14,
        spaceAfter=10,
        spaceBefore=15,
        textColor=HexColor('#16213e'),
        fontName='Helvetica-Bold'
    ))

    styles.add(ParagraphStyle(
        'TextoNormal',
        parent=styles['Normal'],
        fontSize=10,
        spaceAfter=6,
        leading=14,
        fontName='Helvetica'
    ))

    styles.add(ParagraphStyle(
        'Bullet',
        parent=styles['Normal'],
        fontSize=10,
        spaceAfter=4,
        leftIndent=20,
        bulletIndent=10,
        leading=14,
        fontName='Helvetica'
    ))

    elements = []
    lines = content.split('\n')

    for line in lines:
        line = line.strip()

        if not line:
            elements.append(Spacer(1, 6))
            continue

        # Titulos
        if line.startswith('# '):
            # Limpiar emojis comunes
            text = re.sub(r'[^\w\s\-—/|:.,()%+\[\]\'\"&]', '', line[2:]).strip()
            elements.append(Paragraph(text, styles['TituloReporte']))
        elif line.startswith('## '):
            text = re.sub(r'[^\w\s\-—/|:.,()%+\[\]\'\"&]', '', line[3:]).strip()
            elements.append(Paragraph(text, styles['Subtitulo']))
        elif line.startswith('### '):
            text = re.sub(r'[^\w\s\-—/|:.,()%+\[\]\'\"&]', '', line[4:]).strip()
            elements.append(Paragraph(f'<b>{text}</b>', styles['TextoNormal']))
        # Tablas (lineas con |)
        elif '|' in line and not line.startswith('|--') and not line.startswith('| --'):
            cells = [c.strip() for c in line.split('|') if c.strip()]
            if cells and not all(c.replace('-', '').strip() == '' for c in cells):
                # Simplificar: agregar como texto tabulado
                row_text = ' | '.join(cells)
                elements.append(Paragraph(row_text, styles['TextoNormal']))
        # Separadores
        elif line.startswith('---'):
            elements.append(Spacer(1, 10))
        # Bullets
        elif line.startswith('- ') or line.startswith('* '):
            text = line[2:]
            # Convertir **bold** a <b>bold</b>
            text = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', text)
            elements.append(Paragraph(f'• {text}', styles['Bullet']))
        # Listas numeradas
        elif re.match(r'^\d+\.', line):
            text = re.sub(r'^\d+\.\s*', '', line)
            text = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', text)
            elements.append(Paragraph(text, styles['Bullet']))
        # Texto con formato bold
        elif '**' in line:
            text = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', line)
            elements.append(Paragraph(text, styles['TextoNormal']))
        # Texto normal
        else:
            # Ignorar lineas de codigo (```)
            if line.startswith('```'):
                continue
            elements.append(Paragraph(line, styles['TextoNormal']))

    if elements:
        doc.build(elements)
        print(f"PDF generado: {pdf_path}")
    else:
        print("Error: No se encontro contenido para generar el PDF.")
        sys.exit(1)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Uso: python3 generar_pdf.py <archivo.md> [salida.pdf]")
        print("Ejemplo: python3 generar_pdf.py auditoria-sitio.md")
        sys.exit(1)

    md_file = sys.argv[1]
    pdf_file = sys.argv[2] if len(sys.argv) > 2 else None

    if not os.path.exists(md_file):
        print(f"Error: No se encontro el archivo {md_file}")
        sys.exit(1)

    md_to_pdf(md_file, pdf_file)
