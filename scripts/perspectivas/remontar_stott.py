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

def calha(itens, inicio, fim, largura_minima=6.0):
    """Acha a CALHA entre duas colunas: a faixa vertical de x que nenhum trecho
    de texto atravessa. Substitui o corte fixo, que era medido num capítulo e
    não valia nos outros — a coletânea muda a posição da coluna de um capítulo
    pro outro, e um corte errado por 8 pontos parte o texto no meio da palavra.
    Devolve None quando não há calha (página de coluna única)."""
    coberto = []
    for i in itens:
        x0, x1 = i["r"][0], i["r"][0] + i["r"][2]
        if x1 > inicio and x0 < fim:
            coberto.append((max(x0, inicio), min(x1, fim)))
    if not coberto:
        return None
    coberto.sort()
    vaos, ponta = [], coberto[0][1]
    for a, b in coberto[1:]:
        if a - ponta >= largura_minima:
            vaos.append((a - ponta, ponta + (a - ponta) / 2))
        ponta = max(ponta, b)
    return max(vaos)[1] if vaos else None

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
                # o hífen de fim de linha some ao religar a palavra; mas se a
                # continuação começa com MAIÚSCULA ele pertence ao NOME
                # ("Lo-Ruama", "nação-Estado") e tem de ficar
                txt = (txt + t) if re.match(r"[A-ZÀ-Ý]", t) else (txt[:-1] + t)
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

    # Corpo miúdo = nota de rodapé, MAS a classificação é por LINHA, nunca por
    # trecho. O versalete (o sobrenome nas bibliografias) é um trecho pequeno
    # DENTRO de uma linha de tamanho normal: arrancá-lo dali decapitava o nome
    # — "KEENER, Craig S." virava "K, Craig S." em toda bibliografia.
    miuda = lambda ls: [l for l in ls if l["h"] < ALTURA_NOTA]
    grauda = lambda ls: [l for l in ls if l["h"] >= ALTURA_NOTA]

    corpo, bio, caixa, notas = [], [], [], []
    for pno in sorted(t["pages"], key=int):
        itens = [i for i in t["pages"][pno] if RODAPE < i["r"][1] < TOPO]
        primeira = int(pno) == 0 and abertura

        # O corte entre colunas vem da CALHA da própria página. Era fixo, e a
        # coletânea muda a posição da coluna de um capítulo pro outro: um corte
        # errado por poucos pontos partia o texto no meio da palavra.
        corte_lado = (calha([i for i in itens if i["r"][1] < ZONA_CABECALHO], 90, 260)
                      or CORTE_ABERTURA)
        # Sem calha, a página é de COLUNA ÚNICA (bibliografia, fim de capítulo)
        # e não pode ser dividida — um corte fixo rasga cada linha ao meio.
        corte_col = calha(itens, 150, 330)

        # a caixa "Perguntas para estudo" atravessa a página: o título vem
        # centralizado, e tudo abaixo dele pertence à caixa
        cab_caixa = next((i for i in itens if i["h"] > 11
                          and i["r"][0] > corte_lado and "Perguntas" in i["t"]), None)
        if cab_caixa:
            limite = cab_caixa["r"][1] + 3
            caixa += paragrafos(grauda(linhas([i for i in itens if i["r"][1] <= limite])), negrito)
            itens = [i for i in itens if i["r"][1] > limite]

        if primeira:
            # A abertura tem três zonas. Em cima, atravessando a página: título,
            # assinatura e número do capítulo — assinatura à esquerda e número à
            # direita, na MESMA linha, então a coluna não as separa. Embaixo, a
            # caixa de bio na lateral e o corpo do capítulo ao lado.
            cabeca = [i for i in itens if i["r"][1] >= ZONA_CABECALHO
                      and not (i["h"] > 40 and i["t"].strip().isdigit())]
            resto = [i for i in itens if i["r"][1] < ZONA_CABECALHO]
            for l in linhas(cabeca):
                corpo.append({"texto": l["texto"], "titulo": True,
                              "altura": round(l["h"], 1)})

            lado = linhas([i for i in resto if i["r"][0] < corte_lado])
            bio += lado                       # a bio é miúda por natureza
            principal = [i for i in resto if i["r"][0] >= corte_lado]
            # capitular: LETRA solta e grande que abre o capítulo (o número do
            # capítulo também é grande e solto, por isso exigimos letra)
            capital = next((i for i in principal
                            if 20 < i["h"] <= 40 and len(i["t"].strip()) == 1
                            and i["t"].strip().isalpha()), None)
            if capital:
                principal = [i for i in principal if i is not capital]
            ls = linhas(principal)
            notas += miuda(ls)
            ps = paragrafos(grauda(ls), negrito)
            if capital and ps:
                # o espaço do capitular importa: "A " abre palavra própria
                # ("A Bíblia"), "S" continua a palavra ("S" + "em" = "Sem")
                ps[0]["texto"] = capital["t"] + ps[0]["texto"].lstrip()
            corpo += ps
        elif corte_col is None:
            ls = linhas(itens)
            notas += miuda(ls)
            corpo += paragrafos(grauda(ls), negrito)
        else:
            for faixa in ([i for i in itens if i["r"][0] < corte_col],
                          [i for i in itens if i["r"][0] >= corte_col]):
                ls = linhas(faixa)
                notas += miuda(ls)
                corpo += paragrafos(grauda(ls), negrito)

    return corpo, bio, caixa, notas
