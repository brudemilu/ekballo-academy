# -*- coding: utf-8 -*-
"""Confere o texto montado contra a IMAGEM da página, via OCR.

A auditoria por contagem de caracteres compara o texto montado com o stream de
texto do visualizador — prova que nada se perdeu no meu caminho, mas é cega ao
que o próprio stream deixou de capturar (versalete, por exemplo). Esta aqui lê
a página renderizada e procura trechos que existem na imagem e não no montado.

O OCR erra, então o alvo não é igualdade: é achar SEQUÊNCIAS LONGAS presentes
na página e ausentes do texto — o sinal de conteúdo perdido, não de ruído.
"""
import re, sys, glob, subprocess, os, unicodedata

def normalizar(t):
    t = unicodedata.normalize("NFKD", t)
    t = "".join(c for c in t if not unicodedata.combining(c))
    return re.sub(r"[^A-Za-z0-9]", "", t).lower()

def ocr_paginas(prefixo, pasta="ocr"):
    os.makedirs(pasta, exist_ok=True)
    textos = []
    for png in sorted(glob.glob(f"{prefixo}-pag*.png")):
        base = os.path.join(pasta, os.path.basename(png)[:-4])
        if not os.path.exists(base + ".txt"):
            subprocess.run(["tesseract", png, base, "-l", "por+eng", "--psm", "3"],
                           capture_output=True)
        textos.append(open(base + ".txt", encoding="utf-8", errors="replace").read())
    return textos

def perdidos(montado, paginas_ocr, minimo=24):
    """trechos contínuos da página que não aparecem no texto montado"""
    alvo = normalizar(montado)
    achados = []
    for pag in paginas_ocr:
        for linha in pag.split("\n"):
            n = normalizar(linha)
            if len(n) < minimo:
                continue
            if n in alvo:
                continue
            # a linha pode estar partida no montado; tenta pedaços dela
            pedaco = n
            while len(pedaco) >= minimo and pedaco not in alvo:
                pedaco = pedaco[:-1]
            if len(pedaco) < minimo:
                achados.append(linha.strip())
    return achados

if __name__ == "__main__":
    prefixo, arquivo = sys.argv[1], sys.argv[2]
    montado = open(arquivo, encoding="utf-8").read()
    paginas = ocr_paginas(prefixo)
    faltando = perdidos(montado, paginas)
    vistos = set(); unicos = []
    for f in faltando:
        k = normalizar(f)
        if k not in vistos:
            vistos.add(k); unicos.append(f)
    print(f"{arquivo}: {len(paginas)} páginas OCR | {len(unicos)} linha(s) da página ausentes do texto")
    for f in unicos[:12]:
        print(f"   FALTA: {f[:96]}")
