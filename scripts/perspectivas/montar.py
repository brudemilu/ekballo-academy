# -*- coding: utf-8 -*-
"""Monta o conteudo da Licao 1 de Perspectivas no formato do acervo:
paragrafos separados por linha em branco, CAIXA ALTA = secao,
Caixa de Titulo = subsecao, "[cite] " = box destacado do guia."""
import re, io, unicodedata

def limpar(s):
    s = s.replace("­", "")
    s = s.replace("ﬁ", "fi").replace("ﬂ", "fl").replace("ﬀ", "ff")
    s = re.sub(r"[ \t]+", " ", s)
    return s.strip()

def juntar(linhas):
    """junta linhas de um bloco desfazendo hifenizacao de fim de linha"""
    out = ""
    for ln in linhas:
        ln = ln.strip()
        if not out:
            out = ln
        elif out.endswith("-") and re.search(r"[a-zà-ú]-$", out):
            out = out[:-1] + ln
        else:
            out += " " + ln
    return limpar(out)

def blocos(texto):
    """quebra em blocos (separados por linha em branco) guardando o recuo"""
    bs, atual = [], []
    for ln in texto.split("\n"):
        if ln.strip() == "":
            if atual:
                bs.append(atual); atual = []
        else:
            atual.append(ln)
    if atual:
        bs.append(atual)
    return bs

def recuo(linhas):
    return min(len(l) - len(l.lstrip()) for l in linhas)

CABECALHO = re.compile(r"^(LIÇÃO 1 –|Guia de Estudo –)")

def pagina_util(pag):
    """tira cabecalho corrido e numero de pagina solto"""
    linhas = []
    for ln in pag.split("\n"):
        t = ln.strip()
        if CABECALHO.match(t):
            continue
        if re.fullmatch(r"\d{1,2}", t):
            continue
        if t == ".":
            continue
        linhas.append(ln)
    return "\n".join(linhas)

# --- classificacao dos blocos ---------------------------------------------
NUMERADO = re.compile(r"^\d+\.\s+[A-ZÀ-Ú0-9 ,\-—\"']+$")   # "1. A PROMESSA..."
LETRA    = re.compile(r"^([A-G])\.\s+(.+)$")                    # "A. A Promessa de Deus"
CAIXA    = re.compile(r"^[^a-zà-ú]+$")

# blocos recuados que sao box do guia ("Leia...", "Abra sua Bíblia...")
def eh_box(linhas, r):
    t = juntar(linhas)
    if r >= 15:
        return True
    if re.match(r"^(Leia\b|Abra sua Bíblia|Resumo do|O Propósito Final|A Estratégia Dupla|Com respeito a)", t) and r >= 4:
        return True
    return False

def montar_pagina(texto, saida):
    for linhas in blocos(texto):
        r = recuo(linhas)
        primeira = linhas[0].strip()

        # bloco em caixa alta numerado -> titulo de secao
        if NUMERADO.match(primeira) and len(linhas) == 1:
            saida.append(limpar(primeira))
            continue
        if len(linhas) == 1 and CAIXA.match(primeira) and 3 < len(primeira) <= 70 and r < 25:
            saida.append(limpar(primeira))
            continue

        if eh_box(linhas, r):
            saida.append("[cite] " + juntar(linhas))
            continue

        # bloco comum: pode comecar com "A. Subtitulo" na 1a linha
        m = LETRA.match(primeira)
        if m and len(linhas) > 1:
            saida.append(limpar(primeira))     # literal, com o "A." do original
            linhas = linhas[1:]
        elif m and len(linhas) == 1:
            saida.append(limpar(primeira))
            continue

        # lista numerada dentro do bloco: cada item vira paragrafo
        itens, atual = [], []
        for ln in linhas:
            if re.match(r"^\s*\d+\.\s", ln) and atual:
                itens.append(atual); atual = [ln]
            else:
                atual.append(ln)
        if atual:
            itens.append(atual)
        for it in itens:
            t = juntar(it)
            if t:
                saida.append(t)

# --- montagem -------------------------------------------------------------
def ler(p):
    return io.open(p, encoding="utf-8").read()

saida = []

# Pagina 1: coluna da direita (abertura) e depois a caixa de objetivos.
dir1 = ler("p1-dir.txt")
dir1 = re.sub(r"^.*?\n\n", "", dir1, count=1, flags=re.S)  # tira cabecalho/titulo
dir1 = pagina_util(dir1)
abertura, chave = dir1.split("Palavra chave:")
for linhas in blocos(abertura):
    t = juntar(linhas)
    if t and t not in ("um Deus", "nário", "um Deus nário"):
        saida.append(t)

esq = pagina_util(ler("p1-esq.txt"))
esq = esq[esq.index("ESTUDAR ESTA LIÇÃO O AJUDARÁ:"):]
saida.append("ESTUDAR ESTA LIÇÃO O AJUDARÁ:")
for linhas in blocos(esq):
    t = juntar(linhas)
    if t.startswith("ESTUDAR ESTA"):
        continue
    if t.startswith("NO NÍVEL AVANÇADO"):
        saida.append("NO NÍVEL AVANÇADO:")
        continue
    saida.append(t)

saida.append("Palavra chave:")
saida.append("[cite] " + juntar([l for l in chave.split("\n") if l.strip()]))

# Paginas 2 a 10
for pag in ler("p2-10.txt").split("\f"):
    if not pag.strip():
        continue
    montar_pagina(pagina_util(pag), saida)

# junta paragrafo cortado pela quebra de pagina (linha que continua frase)
final = []
for p in saida:
    if (final and not p.startswith("[cite] ") and not final[-1].startswith("[cite] ")
            and re.search(r"[a-zà-ú,;]$", final[-1]) and re.match(r"^[a-zà-ú(]", p)):
        final[-1] = final[-1] + " " + p
    else:
        final.append(p)

io.open("licao01-conteudo.txt", "w", encoding="utf-8").write("\n\n".join(final) + "\n")
print("paragrafos:", len(final))
