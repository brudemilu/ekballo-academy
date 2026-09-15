# -*- coding: utf-8 -*-
"""Acha diagramas e quadros numa página, com ou sem camada de texto.

O detector antigo media densidade de vetores, e só servia em PDF de texto.
Aqui a ideia é outra e vale para os dois casos: o OCR devolve a caixa de cada
palavra; tinta que cai FORA de toda caixa de palavra é desenho — gráfico,
quadro, linha do tempo. Uma faixa horizontal com muita tinta e pouca palavra
é candidata a figura.
"""
import fitz, io, csv, subprocess, sys, os
from PIL import Image

def faixas_graficas(pdf, pagina, dpi=150, limiar=0.35):
    d = fitz.open(pdf)
    pm = d[pagina].get_pixmap(dpi=dpi, colorspace=fitz.csGRAY)
    im = Image.open(io.BytesIO(pm.tobytes("png")))
    L, A = im.size
    base = f"_fig_{os.getpid()}"
    im.save(base + ".png")
    subprocess.run(["tesseract", base + ".png", base, "-l", "por", "--psm", "3", "tsv"],
                   capture_output=True)
    caixas = []
    with io.open(base + ".tsv", encoding="utf-8", errors="replace") as fh:
        for l in csv.DictReader(fh, delimiter="\t", quoting=csv.QUOTE_NONE):
            if (l.get("text") or "").strip() and float(l["conf"]) > 30:
                x, y, w, h = (int(l["left"]), int(l["top"]), int(l["width"]), int(l["height"]))
                caixas.append((x, y, x + w, y + h))
    px = im.load()
    faixas = []
    passo = max(1, A // 120)
    for y0 in range(0, A, passo):
        y1 = min(A, y0 + passo)
        tinta = fora = 0
        for y in range(y0, y1, 2):
            for x in range(0, L, 3):
                if px[x, y] < 128:
                    tinta += 1
                    if not any(cx0 <= x <= cx1 and cy0 <= y <= cy1 for cx0, cy0, cx1, cy1 in caixas):
                        fora += 1
        if tinta > 40 and fora / tinta > limiar:
            faixas.append((y0, y1, tinta, fora / tinta))
    for f in (base + ".png", base + ".tsv"):
        if os.path.exists(f): os.remove(f)
    # junta faixas contíguas
    juntas = []
    for y0, y1, t, r in faixas:
        if juntas and y0 - juntas[-1][1] <= passo * 2:
            juntas[-1] = (juntas[-1][0], y1, juntas[-1][2] + t, max(juntas[-1][3], r))
        else:
            juntas.append((y0, y1, t, r))
    return [(y0, y1, t, r) for y0, y1, t, r in juntas if (y1 - y0) > A * 0.04], A

if __name__ == "__main__":
    pdf = sys.argv[1]
    d = fitz.open(pdf)
    for p in range(d.page_count):
        fx, A = faixas_graficas(pdf, p)
        for y0, y1, t, r in fx:
            print(f"  {os.path.basename(pdf)} pág {p+1}: faixa y {y0}-{y1} de {A} "
                  f"({100*(y1-y0)/A:.0f}% da altura), {100*r:.0f}% da tinta fora de palavra")
