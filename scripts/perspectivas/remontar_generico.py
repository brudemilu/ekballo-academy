# -*- coding: utf-8 -*-
"""Remonta um texto a partir do stream de preview do Dropbox, sem supor o
layout: descobre colunas, cabeçalho corrido e recuo de parágrafo a partir do
próprio documento. Serve pros artigos da coletânea Perspectivas, que vêm em
diagramações diferentes (A5 em coluna única, A4 em Arial, duas colunas...)."""
import json, io, re, collections

# --- conserto de caracteres -----------------------------------------------
LIGADURAS = {"ﬁ": "fi", "ﬂ": "fl", "ﬀ": "ff", "ﬃ": "ffi", "ﬄ": "ffl"}
# alguns PDFs devolvem a ligadura "ti" como caractere de substituição
EXCECOES_SUBST = {"bene� cios": "benefícios", "bene�cios": "benefícios"}

def consertar(t):
    for errado, certo in EXCECOES_SUBST.items():
        t = t.replace(errado, certo)
    t = re.sub(r"� (?=[a-zà-ÿ])", "ti", t)
    t = t.replace("�", "ti")
    for glifo, letras in LIGADURAS.items():
        t = re.sub(glifo + r" (?=[a-zà-ÿ])", letras, t)
        t = t.replace(glifo, letras)
    t = t.replace("“", '"').replace("”", '"').replace("’", "'")
    return re.sub(r"[ \t]+", " ", t).strip()

# --- linhas ---------------------------------------------------------------
def _vaos(runs):
    vaos, fim = [], None
    for r in runs:
        x, _, w, _ = r["r"]
        if fim is not None:
            vaos.append(round(x - fim, 2))
        fim = x + w
    return vaos

def _cortes(runs):
    """cortes candidatos, do salto mais nítido pro menos: cada salto na
    distribuição dos vãos separa 'kerning entre letras' de 'espaço entre
    palavras'. O tracking do título é diferente do corpo, então o corte não
    pode ser fixo."""
    cand = sorted(v for v in _vaos(runs) if 0 <= v <= 20)
    saltos = sorted(((b - a, (a + b) / 2) for a, b in zip(cand, cand[1:])
                     if b - a >= 0.5 and 0.4 <= (a + b) / 2 <= 12), reverse=True)
    alturas = [r["h"] for r in runs] or [10.0]
    return [c for _, c in saltos] + [max(2.6, 0.32 * max(alturas))]

def _montar_texto(runs, limiar):
    txt, fim = "", None
    for r in runs:
        x, _, w, _ = r["r"]
        if (txt and fim is not None and x - fim > limiar
                and not txt.endswith(" ") and not r["t"].startswith(" ")):
            txt += " "
        txt += r["t"]
        fim = x + w
    return txt

def _defeitos(txt):
    """quantos defeitos esse corte deixou, nos dois sentidos: 'palavra'
    comprida demais pra existir (corte alto demais gruda palavras) e letra
    solta (corte baixo demais estilhaça a palavra). Devolve (grudadas,
    estilhaçadas) pra dar pra ordenar do menos pior."""
    grudadas = len(re.findall(r"[A-Za-zÀ-ÿ]{15,}", txt))
    fichas = [p for p in txt.split() if p]
    soltas = sum(1 for p in fichas if len(p) == 1)
    excesso = max(0, soltas - max(2, int(0.30 * len(fichas))))
    return grudadas, excesso

def juntar_runs(runs):
    """concatena os trechos de uma linha. Alguns PDFs mandam cada letra como um
    trecho separado, SEM espaço: o espaço tem de sair do vão horizontal. O
    corte não pode ser fixo (o tracking do título é diferente do corpo), então
    testamos os candidatos e ficamos com o primeiro sem defeito — ou, se todos
    tiverem, com o menos pior. Uma linha que é uma palavra só não tem vão de
    palavra nenhum pra achar: aí qualquer corte baixo estilhaça, e o que
    salva é justamente a contagem de letras soltas."""
    runs = sorted(runs, key=lambda i: i["r"][0])
    if len(runs) < 3:
        return _montar_texto(runs, 2.6)
    if sum(1 for r in runs if " " in r["t"]) > len(runs) / 3:
        return _montar_texto(runs, 2.6)   # o PDF já traz os espaços
    tentativas = []
    for limiar in _cortes(runs)[:8]:
        txt = _montar_texto(runs, limiar)
        d = _defeitos(txt)
        if d == (0, 0):
            return txt
        tentativas.append((d, txt))
    return min(tentativas, key=lambda x: x[0])[1]

def linhas(itens, tol=2.6):
    grupos = []
    for it in sorted(itens, key=lambda i: (-i["r"][1], i["r"][0])):
        for g in grupos:
            if abs(g["y"] - it["r"][1]) <= tol:
                g["runs"].append(it); break
        else:
            grupos.append({"y": it["r"][1], "runs": [it]})
    out = []
    for g in grupos:
        runs = g["runs"]
        out.append({"y": g["y"],
                    "x": min(r["r"][0] for r in runs),
                    "x1": max(r["r"][0] + r["r"][2] for r in runs),
                    "h": max(r["h"] for r in runs),
                    "fontes": {r["f"] for r in runs},
                    "texto": consertar(juntar_runs(runs))})
    return [l for l in out if l["texto"]]

# --- estrutura da página --------------------------------------------------
def descobrir_colunas(paginas, largura):
    """duas colunas deixam um vão vertical no meio da página que quase
    nenhuma linha atravessa"""
    meio = largura / 2
    atravessam = total = 0
    for ls in paginas:
        for l in ls:
            if l["x1"] - l["x"] > largura * 0.25:
                total += 1
                if l["x"] < meio - 10 and l["x1"] > meio + 10:
                    atravessam += 1
    if total and atravessam / total < 0.15:
        return meio
    return None

def cabecalhos(paginas):
    """linha que se repete em quase toda página, sempre na mesma altura"""
    conta = collections.Counter()
    for ls in paginas:
        for l in ls:
            chave = (re.sub(r"\d+", "#", l["texto"])[:60], round(l["y"] / 20))
            conta[chave] += 1
    limite = max(2, len(paginas) * 0.6)
    return {c for c, n in conta.items() if n >= limite}

def ehcabecalho(l, marcados):
    return (re.sub(r"\d+", "#", l["texto"])[:60], round(l["y"] / 20)) in marcados

# --- parágrafos -----------------------------------------------------------
def paragrafos(ls, negrito, espaco):
    if not ls:
        return []
    base = min(l["x"] for l in ls)
    corpo = collections.Counter(round(l["h"]) for l in ls).most_common(1)[0][0]
    ps, atual, y_ant = [], [], None
    for l in ls:
        titulo = bool(l["fontes"] & negrito) or l["h"] > corpo + 2.5
        recuado = l["x"] - base > 4
        salto = y_ant is not None and (y_ant - l["y"]) > espaco * 1.45
        muda = atual and atual[-1]["titulo"] != titulo
        if atual and (recuado or salto or muda):
            ps.append(atual); atual = []
        l = dict(l); l["titulo"] = titulo
        atual.append(l); y_ant = l["y"]
    if atual:
        ps.append(atual)

    saida = []
    for p in ps:
        txt = ""
        for l in p:
            t = l["texto"]
            if not txt:
                txt = t
            elif re.search(r"[a-zà-ÿ]-$", txt):
                txt = txt[:-1] + t
            else:
                txt += " " + t
        if txt.strip():
            saida.append({"texto": txt.strip(), "titulo": p[0]["titulo"],
                          "altura": round(max(l["h"] for l in p), 1)})
    return saida

def montar(caminho):
    d = json.load(io.open(caminho, encoding="utf-8"))
    t = d["text"]
    largura, altura = d["metadata"]["dimensions"][0][:2]
    negrito = {i for i, f in enumerate(t["fonts"]) if "Bold" in f["n"]}

    paginas = [linhas(t["pages"][p]) for p in sorted(t["pages"], key=int)]
    marcados = cabecalhos(paginas)
    paginas = [[l for l in ls if not ehcabecalho(l, marcados)
                and not re.fullmatch(r"\d{1,3}", l["texto"])] for ls in paginas]

    # espaçamento normal entre linhas do corpo
    vaos = []
    for ls in paginas:
        for a, b in zip(ls, ls[1:]):
            v = round(a["y"] - b["y"], 1)
            if 4 < v < 40:
                vaos.append(v)
    espaco = collections.Counter(vaos).most_common(1)[0][0] if vaos else 12.0

    corte = descobrir_colunas(paginas, largura)
    corpo = []
    for ls in paginas:
        if corte:
            corpo += paragrafos([l for l in ls if l["x"] < corte], negrito, espaco)
            corpo += paragrafos([l for l in ls if l["x"] >= corte], negrito, espaco)
        else:
            corpo += paragrafos(ls, negrito, espaco)
    return corpo, {"largura": largura, "altura": altura, "colunas": 2 if corte else 1,
                   "espaco": espaco, "paginas": len(paginas)}

def juntar_partidos(ps):
    out = []
    for p in ps:
        ant = out[-1] if out else None
        if (ant and not ant["titulo"] and not p["titulo"]
                and not re.search(r'[.!?:;"]$', ant["texto"])
                and re.match(r'^[a-zà-ÿ("]', p["texto"])):
            if re.search(r"[a-zà-ÿ]-$", ant["texto"]):
                ant["texto"] = ant["texto"][:-1] + p["texto"]
            else:
                ant["texto"] += " " + p["texto"]
        else:
            out.append(dict(p))
    return out
