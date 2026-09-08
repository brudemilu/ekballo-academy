# -*- coding: utf-8 -*-
"""Remonta um capítulo do Stott a partir do stream de preview do Dropbox.

Layout da coletânea Perspectivas: abertura com título, assinatura, capitular
e caixa de bio do autor; demais páginas em duas colunas; caixa de "Perguntas
para estudo" ocupando a largura inteira no fim; notas de rodapé em corpo menor.
"""
import json, io, re

CORTE_COLUNA = 245.0
TOPO, RODAPE = 630.0, 12.0
CORTE_ABERTURA = 185.0
ZONA_CABECALHO = 560.0   # acima disto, na abertura: título, assinatura, nº do capítulo
ALTURA_NOTA = 9.0          # abaixo disso é nota de rodapé / legenda
ESPACO_LINHA = 12.3

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
        runs = sorted(g["runs"], key=lambda i: i["r"][0])
        out.append({"y": g["y"],
                    "x": min(r["r"][0] for r in runs),
                    "x1": max(r["r"][0] + r["r"][2] for r in runs),
                    "h": max(r["h"] for r in runs),
                    "fontes": {r["f"] for r in runs},
                    "texto": re.sub(r"\s+", " ", "".join(r["t"] for r in runs)).strip()})
    return [l for l in out if l["texto"]]

def paragrafos(ls, negrito):
    """agrupa linhas em parágrafos: recuo de primeira linha, salto vertical
    ou mudança de fonte (o cabeçalho vem em negrito) abrem parágrafo novo"""
    if not ls:
        return []
    base = min(l["x"] for l in ls)
    ps, atual, y_ant = [], [], None
    for l in ls:
        titulo = bool(l["fontes"] & negrito)
        recuado = l["x"] - base > 4
        salto = y_ant is not None and (y_ant - l["y"]) > ESPACO_LINHA * 1.5
        muda_papel = atual and atual[-1]["titulo"] != titulo
        if atual and (recuado or salto or muda_papel):
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
            elif txt.endswith("-") and re.search(r"[a-zà-ÿ]-$", txt):
                txt = txt[:-1] + t
            else:
                txt += " " + t
        if txt.strip():
            saida.append({"texto": txt.strip(), "titulo": p[0]["titulo"]})
    return saida

def montar(caminho, abertura=True):
    """Devolve (corpo, bio, caixa_perguntas, notas) já em parágrafos.

    abertura=False para um PDF que é continuação do capítulo: a primeira
    página dele não traz título, assinatura, capitular nem caixa de bio.
    """
    d = json.load(io.open(caminho, encoding="utf-8"))
    t = d["text"]
    negrito = {i for i, f in enumerate(t["fonts"]) if "Bold" in f["n"]}

    corpo, bio, caixa, notas = [], [], [], []
    for pno in sorted(t["pages"], key=int):
        itens = [i for i in t["pages"][pno] if RODAPE < i["r"][1] < TOPO]
        primeira = int(pno) == 0 and abertura

        # corpo menor = nota de rodapé; na abertura é a caixa de bio do autor,
        # que fica na coluna lateral abaixo do cabeçalho
        miudo = [i for i in itens if i["h"] < ALTURA_NOTA]
        itens = [i for i in itens if i["h"] >= ALTURA_NOTA]
        if primeira:
            bio += linhas([i for i in miudo if i["r"][0] < CORTE_ABERTURA
                           and i["r"][1] < ZONA_CABECALHO])
            notas += linhas([i for i in miudo if not (i["r"][0] < CORTE_ABERTURA
                             and i["r"][1] < ZONA_CABECALHO)])
        else:
            notas += linhas(miudo)

        # a caixa "Perguntas para estudo" atravessa as duas colunas: o título
        # vem centralizado, e tudo abaixo dele pertence à caixa
        cab_caixa = next((i for i in itens if i["h"] > 11
                          and i["r"][0] > CORTE_ABERTURA and "Perguntas" in i["t"]), None)
        if cab_caixa:
            limite = cab_caixa["r"][1] + 3
            caixa += paragrafos(linhas([i for i in itens if i["r"][1] <= limite]), negrito)
            itens = [i for i in itens if i["r"][1] > limite]

        if primeira:
            # A abertura tem três zonas. Em cima, atravessando a página: o
            # título, a assinatura do autor e o número do capítulo — a
            # assinatura fica à esquerda e o número à direita, na MESMA linha,
            # então não dá pra separá-las pela coluna. Embaixo, a caixa de bio
            # na lateral e o corpo à direita.
            cabeca = [i for i in itens if i["r"][1] >= ZONA_CABECALHO
                      and not (i["h"] > 40 and i["t"].strip().isdigit())]
            resto = [i for i in itens if i["r"][1] < ZONA_CABECALHO]
            for l in linhas(cabeca):
                corpo.append({"texto": l["texto"], "titulo": True,
                              "altura": round(l["h"], 1)})

            bio += linhas([i for i in resto if i["r"][0] < CORTE_ABERTURA])
            principal = [i for i in resto if i["r"][0] >= CORTE_ABERTURA]
            # capitular: LETRA solta e grande que abre o capítulo (o número do
            # capítulo também é grande e solto, por isso exigimos letra)
            capital = next((i for i in principal
                            if 20 < i["h"] <= 40 and len(i["t"].strip()) == 1
                            and i["t"].strip().isalpha()), None)
            if capital:
                principal = [i for i in principal if i is not capital]
            ps = paragrafos(linhas(principal), negrito)
            if capital and ps:
                # o espaço do capitular importa: "A " abre palavra própria
                # ("A Bíblia"), "S" continua a palavra ("S" + "em" = "Sem")
                ps[0]["texto"] = capital["t"] + ps[0]["texto"].lstrip()
            corpo += ps
        else:
            corpo += paragrafos(linhas([i for i in itens if i["r"][0] < CORTE_COLUNA]), negrito)
            corpo += paragrafos(linhas([i for i in itens if i["r"][0] >= CORTE_COLUNA]), negrito)

    return corpo, bio, caixa, notas
