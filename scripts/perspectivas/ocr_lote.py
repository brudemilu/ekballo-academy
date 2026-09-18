# -*- coding: utf-8 -*-
"""Primeira passada num lote de páginas: mede a ORIENTAÇÃO de cada página e
corrige antes de ler. Sem isso o OCR devolve letra embaralhada — na Lição 4
foram 15 páginas de 61, na 7 foram 3 de 57.

Uso: python3 ocr_lote.py <arquivo.pdf> <pasta-destino> [dpi]
"""
import json
import re
import subprocess
import sys
from pathlib import Path

import fitz
from PIL import Image

pdf, destino = sys.argv[1], Path(sys.argv[2])
dpi = int(sys.argv[3]) if len(sys.argv) > 3 else 200
destino.mkdir(parents=True, exist_ok=True)

doc = fitz.open(pdf)
giro = {}
for i in range(doc.page_count):
    bruto = destino / f"p{i + 1:03d}_bruto.png"
    doc[i].get_pixmap(dpi=dpi).save(bruto)
    osd = subprocess.run(["tesseract", str(bruto), "stdout", "--psm", "0"],
                         capture_output=True, text=True).stdout
    m = re.search(r"Rotate: (\d+)", osd)
    g = int(m.group(1)) if m else 0
    im = Image.open(bruto)
    if g in (90, 180, 270):
        im = im.rotate(-g, expand=True)
    alvo = destino / f"p{i + 1:03d}.png"
    im.save(alvo)
    bruto.unlink()
    giro[str(i + 1)] = g
    subprocess.run(["tesseract", str(alvo), str(alvo)[:-4], "-l", "por", "--psm", "3"],
                   capture_output=True)
    print(f"  pág {i + 1} giro={g}", flush=True)

(destino / "giro.json").write_text(json.dumps(giro))
tortas = {k: v for k, v in giro.items() if v}
print(f"TORTAS: {len(tortas)} de {doc.page_count} -> {tortas}")
print("OCR COMPLETO")
