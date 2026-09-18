# -*- coding: utf-8 -*-
"""Remontagem de página FOTOGRAFADA ou escaneada, em duas colunas ou mista.

Reúne o que foi aprendido carregando as Lições 2 a 7. Estava num diretório
temporário e se perdeu; mora aqui agora.

O que cada decisão custou para ser descoberta:

1. CALHA POR VALE DE DENSIDADE, com limiar 0.65 do típico. Em 0.35 (o primeiro
   palpite) cinco das 18 páginas do Blincoe eram tratadas como coluna única e
   saíam com as duas colunas emendadas linha a linha.

2. O vale sozinho não basta: marcador de lista com comprimentos variados também
   cria vale, e isso partiu ao meio o quadro "Os benefícios de crer". A calha de
   verdade é um CORREDOR VERTICAL livre de tinta em quase toda a altura.

3. LEIAUTE DECIDIDO FAIXA POR FAIXA, não pela página. Página mista (duas colunas
   em cima, caixa larga embaixo) é comum e quebra qualquer decisão global.

4. CABEÇALHO CORRIDO DESCARTADO antes de agrupar linhas. Ele fica na mesma altura
   da primeira linha da outra coluna e o agrupador funde os dois, produzindo
   "Como as águas cobrem o mar casa e redige um artigo".

5. ORIENTAÇÃO MEDIDA POR PÁGINA. Na Lição 4, 15 de 61 páginas vieram tortas.
"""
import collections
import csv
import io as _io
import re
import subprocess

from PIL import Image


def palavras(png):
    """Caixas de palavra do tesseract. Descarta a régua vertical entre colunas,
    que vinha como '|' e entrava no meio das palavras."""
    t = subprocess.run(
        ["tesseract", png, "stdout", "-l", "por", "--psm", "6", "tsv"],
        capture_output=True, text=True,
    ).stdout
    vogais = set("aeiouáàâãéêíóôõú")
    out = []
    for r in csv.DictReader(_io.StringIO(t), delimiter="\t", quoting=csv.QUOTE_NONE):
        s = (r["text"] or "").strip().strip("|")
        if not s or re.fullmatch(r"[\W_]+", s):
            continue
        try:
            cf = float(r["conf"])
        except ValueError:
            continue
        if cf < 40 and not (set(s.lower()) & vogais):
            continue
        out.append(dict(t=s, x=int(r["left"]), y=int(r["top"]),
                        w=int(r["width"]), h=int(r["height"]), c=cf))
    return out


def linhas(ws):
    ws = sorted(ws, key=lambda p: (p["y"], p["x"]))
    out, cur = [], []
    for p in ws:
        if not cur:
            cur = [p]
            continue
        ref = sum(q["y"] for q in cur) / len(cur)
        alt = sum(q["h"] for q in cur) / len(cur)
        if abs(p["y"] - ref) <= alt * 0.6:
            cur.append(p)
        else:
            out.append(sorted(cur, key=lambda q: q["x"]))
            cur = [p]
    if cur:
        out.append(sorted(cur, key=lambda q: q["x"]))
    return out


def _vale(ws, L):
    cob = [0] * (L + 1)
    for p in ws:
        for x in range(max(0, p["x"]), min(L, p["x"] + p["w"])):
            cob[x] += 1
    faixa = max(1, L // 80)
    n = L // faixa
    perfil = [sum(cob[i * faixa:(i + 1) * faixa]) / faixa for i in range(n)]
    tipico = sorted(perfil)[int(n * 0.6)]
    if tipico <= 0:
        return None
    a, b = int(n * 0.25), int(n * 0.65)
    jan = perfil[a:b]
    if not jan:
        return None
    k = jan.index(min(jan)) + a
    if perfil[k] > tipico * 0.65:
        return None
    d = max(2, n // 16)
    esq = max(perfil[max(0, k - d):k] or [0])
    dir_ = max(perfil[k + 1:min(n, k + d + 1)] or [0])
    if min(esq, dir_) < perfil[k] * 1.35:
        return None
    return int((k + 0.5) * faixa)


def calha(ws, L):
    """Calha só quando há vale E o corredor está livre em quase toda a altura."""
    if len(ws) < 12:
        return None
    c = _vale(ws, L)
    if c is None:
        return None
    alt = sum(p["h"] for p in ws) / len(ws)
    faixa = max(1, int(alt * 0.7))
    ys = {p["y"] // faixa for p in ws}
    if not ys:
        return None
    m = max(4, int(alt * 0.35))
    cruza = {p["y"] // faixa for p in ws
             if p["x"] < c - m and p["x"] + p["w"] > c + m}
    return None if len(cruza) / len(ys) > 0.12 else c


def sem_cabecalho(ws, A):
    """Corta a faixa do cabeçalho corrido: primeiro respiro abaixo do topo."""
    if not ws:
        return ws
    topo = min(p["y"] for p in ws)
    alt = sum(p["h"] for p in ws) / len(ws)
    faixa = max(1, int(alt * 0.6))
    ocupa = collections.Counter((p["y"] - topo) // faixa for p in ws)
    limite = int(A * 0.12 / faixa)
    for k in range(1, max(2, limite)):
        if ocupa.get(k, 0) == 0 and ocupa.get(k - 1, 0) > 0:
            corte = topo + (k + 1) * faixa
            return ws if corte > A * 0.13 else [p for p in ws if p["y"] >= corte]
    return ws


def blocos_da_pagina(png):
    """Faixas horizontais; cada uma decide sozinha se tem calha."""
    L, A = Image.open(png).size
    ws = sem_cabecalho(palavras(png), A)
    if not ws:
        return []
    alt = sum(p["h"] for p in ws) / len(ws)
    BAL = max(1, int(alt * 0.55))
    ocupa = collections.Counter(p["y"] // BAL for p in ws)
    ch = sorted(ocupa)
    faixas, ini, ant = [], ch[0], ch[0]
    for k in ch[1:]:
        if k - ant > 2:
            faixas.append((ini, ant))
            ini = k
        ant = k
    faixas.append((ini, ant))
    juntas = []
    for f in faixas:
        if juntas and (f[1] - f[0] < 3 or juntas[-1][1] - juntas[-1][0] < 3):
            juntas[-1] = (juntas[-1][0], f[1])
        else:
            juntas.append(f)
    grupos = []
    for a, z in juntas:
        bloco = [p for p in ws if a <= p["y"] // BAL <= z]
        if not bloco:
            continue
        c = calha(bloco, L)
        if c is None:
            grupos.append(linhas(bloco))
        else:
            grupos.append(linhas([p for p in bloco if p["x"] + p["w"] / 2 < c]))
            grupos.append(linhas([p for p in bloco if p["x"] + p["w"] / 2 >= c]))
    return [g for g in grupos if g]


def paragrafos(grupo):
    """Linha recuada em relação à margem da coluna começa parágrafo."""
    if not grupo:
        return []
    esq = [ln[0]["x"] for ln in grupo]
    margem = collections.Counter(round(x / 12) * 12 for x in esq).most_common(1)[0][0]
    alt = (sum(p["h"] for ln in grupo for p in ln)
           / sum(len(ln) for ln in grupo))
    ps, cur = [], ""
    for ln in grupo:
        txt = " ".join(p["t"] for p in ln)
        recuada = ln[0]["x"] > margem + alt * 0.55
        if recuada and cur:
            ps.append(cur)
            cur = txt
        elif cur.endswith("-"):
            cur = cur[:-1] + txt if not re.match(r"[A-ZÀ-Ú]", txt) else cur + txt
        elif cur:
            cur += " " + txt
        else:
            cur = txt
    if cur:
        ps.append(cur)
    return ps
