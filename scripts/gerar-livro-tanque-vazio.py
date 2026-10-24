#!/usr/bin/env python3
"""Gera Andando com o Tanque Vazio?, de Wayne Cordeiro (issue #278), a partir do OCR.

A única fonte é um flipbook do FlipHTML5 com o livro ESCANEADO (183 páginas, a
camada de texto do leitor vem vazia). O texto sai do OCR do próprio macOS
(Vision), guardado por página em tmp/ocr/andando-com-o-tanque-vazio/pNNN.json
com a posição de cada linha. Para refazer o OCR do zero:

  1. baixar as páginas: a lista decifrada sai de `window.fliphtml5_pages` com o
     livro aberto no navegador (Playwright); cada uma está em
     https://online.fliphtml5.com/nudoi/qwyy/files/large/<arquivo>.webp
  2. swiftc -O scripts/ocr-vision.swift -o /tmp/ocr-vision
     /tmp/ocr-vision pNNN.webp > tmp/ocr/andando-com-o-tanque-vazio/pNNN.json

O que a montagem resolve (a diagramação é cheia de armadilhas):
- caixa de citação ao lado do texto, que troca de lado entre página par e
  ímpar: onde há duas colunas na mesma altura, o texto é a coluna alinhada à
  esquerda e a caixa é a centralizada. A caixa vira parágrafo próprio, entre
  dois parágrafos do texto (“citação” — AUTOR);
- nota de rodapé: bloco no pé da página, depois de um vão, em letra menor
  (medida pela largura média dos caracteres, não pela altura da linha);
- abertura de capítulo: título em letra grande sai; a epígrafe vira o
  primeiro parágrafo;
- subtítulo interno já vem em CAIXA ALTA, que é como o leitor o reconhece;
- acento que o OCR perde (sobretudo o "í" nesta fonte fina): só corrige
  palavra que o corretor pt_BR do macOS acusa como errada e cuja sugestão
  difere só no acento (tmp/ocr/andando-com-o-tanque-vazio/acentos.json, gerado
  por scripts/acentos-ptbr.swift a partir de `--palavras`), mais uma lista
  conferida à mão de formas que coincidem com verbo ("lideres", "capitulo").

Uso: python3 scripts/gerar-livro-tanque-vazio.py [--palavras]
"""

from __future__ import annotations

import importlib.util
import json
import re
import statistics
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SLUG = "andando-com-o-tanque-vazio"
OCR = ROOT / "tmp/ocr" / SLUG
MIGRATION = 377
ISSUE = 278

LIVRO = {
    "migration": MIGRATION,
    "slug": SLUG,
    "titulo": "Andando com o Tanque Vazio?",
    "autor": "Wayne Cordeiro",
    "categoria": "lideranca",
    "resumo": "Pastor de uma grande igreja no Havaí, Wayne Cordeiro conta como chegou ao burnout em pleno ministério e o caminho que fez de volta — as lições duramente aprendidas sobre descanso, limites, solidão e uma vida intencional, para que o líder encha o tanque e renove a paixão antes de parar na estrada.",
}

# (título da mesa, primeira e última página da imagem)
MESAS = [
    ("Prólogo - Bob Buford", 3, 6),
    ("Prefácio e Introdução", 7, 11),
    ("Capítulo 1 - Quando o ponteiro aponta para o zero", 12, 25),
    ("Capítulo 2 - Forçando os limites", 26, 36),
    ("Capítulo 3 - Poder aperfeiçoado na fraqueza", 37, 50),
    ("Capítulo 4 - Primeiros sinais de advertência", 51, 58),
    ("Capítulo 5 - Refinamento solitário", 59, 75),
    ("Capítulo 6 - A descoberta das águas tranquilas", 76, 86),
    ("Capítulo 7 - A nova perspectiva", 87, 96),
    ("Capítulo 8 - Sete lições duramente aprendidas", 97, 125),
    ("Capítulo 9 - Encontrando o caminho de volta para casa", 126, 143),
    ("Capítulo 10 - A vida intencional", 144, 159),
    ("Capítulo 11 - Encontrando a solidão nos sabáticos", 160, 178),
    ("Epílogo", 179, 181),
]
ABERTURA = {3, 7, 9, 12, 26, 37, 51, 59, 76, 87, 97, 126, 144, 160, 179}
FIM_DE_FRASE = tuple(".!?…:;”\"»)’'")

# Formas sem acento que coincidem com palavra válida (o corretor não acusa),
# conferidas no contexto deste livro.
ACENTOS_A_MAO = {
    "lider": "líder", "lideres": "líderes", "LIDER": "LÍDER",
    "capitulo": "capítulo", "inicio": "início", "principio": "princípio",
    "Africa": "África", "dé": "dê", "burout": "burnout",
}
# Notas do painel dos 12 mostradores que o OCR não leu (conferidas na imagem
# das páginas 155 e 156).
NOTAS_FALTANTES = {"4. Vida administrativa": "C-", "5. Vida no computador": "C", "9. Atitudes": "B"}
# Linhas que o OCR pulou, conferidas na imagem: (página, começo da linha seguinte, texto que falta antes dela).
LINHAS_PERDIDAS = [
    (127, "agora se une a seus irmãos", "Em vista disso tudo, estamos fazendo um acordo, por escrito, e assinado por nossos líderes, nossos levitas e nossos sacerdotes. [...] O restante do povo [...]"),
]
# Exercício de preencher (duas colunas em branco na página 84 do livro).
EXERCICIO_ENCHE_ESVAZIA = "(No livro, aqui há duas colunas em branco, “Enche” e “Esvazia”, com seis linhas cada, para o leitor escrever.)"
# Sugestões do corretor que NÃO valem aqui.
ACENTOS_RECUSADOS = {"heroicos"}  # grafia atual, sem acento


def linhas(n: int) -> list[dict]:
    L = json.loads((OCR / f"p{n:03d}.json").read_text(encoding="utf-8"))
    for l in L:
        # O fundo cinza das caixas gera letras com ponto embaixo ("ẠỊAli") e
        # "*" no lugar da aspa de abertura.
        t = re.sub(r"[^\x20-\x7E\xA0-\xFF–—‘’“”•…]", "", l["t"]).strip()
        l["t"] = re.sub(r"^\*(?=[A-ZÀ-Ý])", "“", t)
        l["h"] = l["y1"] - l["y0"]
    return sorted([l for l in L if l["t"]], key=lambda l: (l["y0"], l["x0"]))


def caixa_lateral(L: list[dict]) -> set[int]:
    """Índices das linhas da caixa lateral. Onde há duas colunas na mesma
    altura, uma é o texto (alinhado à esquerda) e a outra a caixa (centralizada)."""
    estreitas = [i for i, l in enumerate(L) if l["x1"] - l["x0"] < 0.6]

    def blocos(esquerda: bool) -> list[list[int]]:
        idx = sorted(
            (i for i in estreitas if (L[i]["x0"] < 0.4) == esquerda),
            key=lambda i: L[i]["y0"],
        )
        out: list[list[int]] = []
        for i in idx:
            if out and L[i]["y0"] - L[out[-1][-1]]["y0"] < 0.045:
                out[-1].append(i)
            else:
                out.append([i])
        return out

    def centralizado(bloco: list[int], outro: list[int]) -> float:
        # Na caixa centralizada o meio das linhas é fixo e o início varia; no
        # texto o início é fixo. A caixa ainda tem letra um pouco menor.
        def mad(xs: list[float]) -> float:
            med = statistics.median(xs)
            return statistics.median([abs(x - med) for x in xs])

        inicio = mad([L[i]["x0"] for i in bloco])
        meio = mad([(L[i]["x0"] + L[i]["x1"]) / 2 for i in bloco])
        letra = statistics.median([L[i]["h"] for i in outro]) - statistics.median([L[i]["h"] for i in bloco])
        return inicio - meio + 0.5 * letra

    marcadas: set[int] = set()
    for esq in blocos(True):
        for dir_ in blocos(False):
            a0, a1 = L[esq[0]]["y0"], L[esq[-1]]["y1"]
            b0, b1 = L[dir_[0]]["y0"], L[dir_[-1]]["y1"]
            if min(a1, b1) - max(a0, b0) < 0.02 or len(esq) < 2 or len(dir_) < 2:
                continue
            # A caixa traz o autor numa linha em CAIXA ALTA; sem isso, decide o alinhamento.
            def assinada(bloco: list[int]) -> bool:
                return any(
                    len(L[i]["t"].split()) <= 6 and re.search(r"[A-ZÀ-Ý]{3}", L[i]["t"]) and not re.search(r"[a-zà-ÿ]", L[i]["t"])
                    for i in bloco
                )

            if assinada(esq) != assinada(dir_):
                caixa, texto = (esq, dir_) if assinada(esq) else (dir_, esq)
            else:
                caixa, texto = (esq, dir_) if centralizado(esq, dir_) > centralizado(dir_, esq) else (dir_, esq)
            # Só a faixa de altura em que existem as duas colunas: a última
            # linha do parágrafo de cima pode estar colada à caixa.
            topo, fundo = L[texto[0]]["y0"] - 0.02, L[texto[-1]]["y1"] + 0.005
            marcadas.update(i for i in caixa if topo <= L[i]["y0"] <= fundo)
    return marcadas


def limpar_pagina(n: int) -> tuple[list[dict], list[list[str]], str]:
    """(linhas do texto, caixas laterais, epígrafe da abertura)."""
    L = [l for l in linhas(n) if l["y0"] > 0.05]  # cabeçalho corrido
    L = [l for l in L if not (l["y0"] > 0.92 and re.fullmatch(r"[\W_]*\d{1,3}[\W_]*", l["t"]))]  # número da página ("_ 46")
    if L:
        passo = statistics.median([b["y0"] - a["y0"] for a, b in zip(L, L[1:])] or [0.025])
        for i in range(len(L) - 1, 0, -1):
            if L[i]["y0"] < 0.6:
                break
            if L[i]["y0"] - L[i - 1]["y0"] > 1.8 * passo:
                bloco = L[i:]
                # Só é nota o bloco com marca de nota ou cara de referência:
                # letra menor sozinha não basta (os depoimentos "Reflexões"
                # também vêm em letra menor).
                marcada = re.match(r"^[\d¹²³⁴⁵⁶⁷⁸⁹*/°]{1,2}\s", bloco[0]["t"]) or any(
                    re.search(
                        r"\[N\. do|Dispon[íi]vel em|Acesso em|^[A-ZÀ-Ý]{3,}[A-ZÀ-Ý .]*, [A-ZÀ-Ý]|"
                        r"\b[A-ZÀ-Ý][a-zà-ÿ]+(?: [A-ZÀ-Ý][a-zà-ÿ]+)*(?:, [A-Z]{2})?: [A-ZÀ-Ý][^,]*, \d{4}",
                        l["t"],
                    )
                    for l in bloco
                )
                if marcada:
                    L = L[:i]  # nota de rodapé
                break
    # Painel dos 12 mostradores: a nota (B+, A-) fica à direita, na linha do item.
    for nota in [l for l in L if re.fullmatch(r"[A-F][+-]?", l["t"]) and l["x0"] > 0.4]:
        item = min((l for l in L if l is not nota and l["x0"] < 0.3), key=lambda l: abs(l["y0"] - nota["y0"]), default=None)
        if item is not None and abs(item["y0"] - nota["y0"]) < 0.03:
            item["t"] += f" — nota {nota['t']}"
            L.remove(nota)
    for pagina, comeco, falta in LINHAS_PERDIDAS:
        for l in L:
            if n == pagina and l["t"].startswith(comeco):
                l["t"] = f"{falta} {l['t']}"
    for l in L:
        if l["t"] in NOTAS_FALTANTES:
            l["t"] += f" — nota {NOTAS_FALTANTES[l['t']]}"
    epigrafe = ""
    if n in ABERTURA:
        L = [
            l for l in L
            if l["h"] < 0.028
            and l["t"] != "Bob Buford"
            and not re.match(r"^(cap[ií]tulo\s*\d+|pr[óo]logo|pref[áa]cio|introdu[çc][ãa]o|ep[íi]logo)$", l["t"], re.I)
        ]
        inicio = next((i for i, l in enumerate(L) if l["x0"] < 0.25), len(L))
        epigrafe = " ".join(l["t"] for l in L[:inicio])
        L = L[inicio:]
    marcadas = caixa_lateral(L)
    caixas: list[list[str]] = []
    ultimo_y = None
    for i in sorted(marcadas, key=lambda i: L[i]["y0"]):
        if ultimo_y is None or L[i]["y0"] - ultimo_y > 0.045:
            caixas.append([])
        caixas[-1].append(L[i]["t"])
        ultimo_y = L[i]["y0"]
    return [l for i, l in enumerate(L) if i not in marcadas], caixas, epigrafe


def juntar(partes: list[str], vocab: Counter) -> str:
    texto = ""
    for parte in partes:
        if not texto:
            texto = parte
        elif texto.endswith("-") and parte.startswith("-"):
            texto = texto[:-1] + parte  # "manter-" + "-se"
        elif texto.endswith("-") and re.match(r"^[a-zà-ÿ]", parte):
            antes = re.search(r"([A-Za-zÀ-ÿ]+)-$", texto)
            depois = re.match(r"^[a-zà-ÿ]+", parte).group(0)
            composta = antes and f"{antes.group(1)}-{depois}".lower() in vocab
            colada = antes and (antes.group(1) + depois).lower() in vocab
            texto = texto + parte if composta and not colada else texto[:-1] + parte
        else:
            texto += " " + parte
    return re.sub(r"\s+", " ", texto).strip()


def montar(inicio: int, fim: int) -> list[tuple[str, str]]:
    """Parágrafos da mesa como (tipo, texto); tipo é "p", "h" ou "citacao"."""
    paginas = {n: limpar_pagina(n) for n in range(inicio, fim + 1)}
    vocab: Counter = Counter()
    for corpo, caixas, _ in paginas.values():
        for t in [l["t"] for l in corpo] + [t for c in caixas for t in c]:
            vocab.update(w.lower() for w in re.findall(r"[A-Za-zÀ-ÿ]+(?:-[A-Za-zÀ-ÿ]+)*", t))

    saida: list[tuple[str, list[str]]] = []
    pendentes: list[str] = []

    def soltar_caixas() -> None:
        # A citação lateral entra entre um parágrafo e outro.
        while pendentes:
            saida.append(("citacao", [pendentes.pop(0)]))

    for n in range(inicio, fim + 1):
        corpo, caixas, epigrafe = paginas[n]
        if epigrafe:
            saida.append(("citacao", [epigrafe]))
        pendentes.extend(juntar(c, vocab) for c in caixas)
        anterior = None
        larguras: list[float] = []  # fim das linhas do parágrafo em curso
        for l in corpo:
            # Margem da coluna da linha: ao lado da caixa o texto corre numa
            # coluna estreita.
            vizinhas = [v for v in corpo if v is not l and abs(v["y0"] - l["y0"]) < 0.08 and abs(v["x0"] - l["x0"]) < 0.2]
            margem = min([v["x0"] for v in vizinhas] + [l["x0"]])
            dialogo = bool(re.match(r"^[-–—]\s", l["t"]))
            marcador = l["t"].startswith(("•", "*")) or bool(re.match(r"^\d{1,2}\.\s+[A-ZÀ-Ý]", l["t"]))
            titulo = (len(re.findall(r"[A-ZÀ-Ý]", l["t"])) >= 4 and not re.search(r"[a-zà-ÿ]", l["t"])) or l["t"] == "Reflexões"
            # Assinatura de depoimento ("- PASTOR DA CALIFÓRNIA") ou autor de
            # citação ("BILLY GRAHAM"): vai colada ao parágrafo de cima.
            assinatura = titulo and saida and saida[-1][0] == "p" and (
                dialogo or (len(l["t"].split()) <= 4 and saida[-1][1][-1].rstrip().endswith(("”", '"', "“", "*")))
            )
            if assinatura:
                saida[-1][1].append("— " + re.sub(r"^[-–—]\s*", "", l["t"]))
                anterior = None
                continue
            if not saida or saida[-1][0] != "p" or (anterior is None and n == inicio) or titulo:
                novo = True
            elif re.match(r"^[a-zà-ÿ]", l["t"]):
                novo = False  # todo parágrafo do livro começa em maiúscula, aspas, travessão ou marcador
            elif anterior is None:
                novo = l["x0"] - margem > 0.025 or dialogo or marcador  # virada de página
            else:
                vao = l["y0"] - anterior["y1"]
                # Recuo em relação à linha de cima, não à margem: a citação
                # recuada tem todas as linhas no mesmo recuo.
                recuo = l["x0"] - anterior["x0"] > 0.025
                volta = anterior["x0"] - l["x0"] > 0.025 and l["x0"] - margem > 0.025
                # Curta em relação ao próprio parágrafo (quadro de destaque é estreito).
                curta = anterior["x1"] < max(larguras + [l["x1"]]) - 0.12 and anterior["t"].endswith(FIM_DE_FRASE)
                novo = recuo or volta or dialogo or marcador or curta or vao > 1.2 * anterior["h"]
            if novo:
                soltar_caixas()
                saida.append(("h" if titulo else "p", [l["t"]]))
                larguras = []
            else:
                saida[-1][1].append(l["t"])
            larguras.append(l["x1"])
            anterior = l
    soltar_caixas()
    out = []
    for tipo, partes in saida:
        texto = " ".join(partes) if tipo == "h" else juntar(partes, vocab)
        if texto.strip():
            out.append((tipo, texto))
    return out


def aspas_das_caixas(p: str, vocab: Counter) -> str:
    """No fundo cinza das caixas o OCR lê a aspa como "i" ("iA quietude",
    "imaginamii BILLY GRAHAM", "medoi CORRIE TEN BOOM")."""
    p = re.sub(r"(^|\s)i(?=[A-ZÀ-Ý](?:[a-zà-ÿ]|\s))", r"\1“", p)

    def dupla(m: re.Match) -> str:
        w = m.group(1)
        return (w if w.lower() in vocab or not w[:-1].lower() in vocab else w[:-1]) + "”"

    p = re.sub(r"\b([A-Za-zÀ-ÿ]+)ii\b", dupla, p)

    def antes_do_autor(m: re.Match) -> str:
        # Logo antes do nome do autor em CAIXA ALTA, o "i" é a aspa de
        # fechamento lida errado; só "aqui", "ali" e afins terminam em "i".
        w = m.group(1)
        return w if w.lower() in {"aqui", "ali", "daqui", "dali", "ti", "si"} else w[:-1] + "”"

    p = re.sub(r"\b([a-zà-ÿ]+i)(?=\s+[A-ZÀ-Ý]{2,})", antes_do_autor, p)

    def no_fim(m: re.Match) -> str:
        # Fala que fecha o parágrafo: "ter-se cuidado melhori" -> "melhor”".
        w = m.group(1)
        return w[:-1] + "”" if vocab[w.lower()] <= 2 and w[:-1].lower() in vocab and ("“" in p or '"' in p) else w

    return re.sub(r"\b([a-zà-ÿ]+i)$", no_fim, p)


def aspas(p: str) -> str:
    p = re.sub(r'(^|[\s(\[—])"', r"\1“", p)
    return p.replace('"', "”")


def citacao(p: str) -> str:
    """“Frase.” — AUTOR, obra"""
    p = aspas(p).strip()
    # Caixa cujas aspas o OCR perdeu: "... qualquer infortúnio WILLIAM JAMES".
    sem_aspas = re.match(r"^“?([^“”]*[a-zà-ÿ.!?…])\s+([A-ZÀ-Ý]{2,}(?:\s[A-ZÀ-Ý.]{2,})+)”?$", p)
    if sem_aspas:
        p = f"“{sem_aspas.group(1)}” {sem_aspas.group(2)}"
    # Autor em CAIXA ALTA depois da aspa de fechamento.
    achou = re.match(r"^“?(.+?)”\s*(?:—\s*)?([A-ZÀ-Ý][A-ZÀ-Ý.]+(?:\s.*)?)$", p)
    if achou:
        frase = achou.group(1).strip()
        if not frase.endswith((".", "!", "?", "…")):
            frase += "."
        return f"“{frase}” — {achou.group(2).strip(' ”')}"
    if p.startswith("“"):
        return p if p.endswith("”") else p + "”"
    return p


def acabamento(tipo: str, p: str, acentos: dict[str, str], vocab: Counter) -> str:
    if tipo == "h":
        return re.sub(r"['’]$", "", p)  # chamada de nota colada no subtítulo
    if re.fullmatch(r"(Esvazia|Enche) (Esvazia|Enche)", p):
        return EXERCICIO_ENCHE_ESVAZIA
    p = re.sub(r"^[-–]\s*", "— ", p)  # travessão de diálogo
    p = re.sub(r"\s[-–]\s", " — ", p)
    p = re.sub(r"(?<=[a-zà-ÿ][.,;:!?”\"])\d{1,2}(?=\s|$)", "", p)  # chamada de nota
    p = re.sub(r"(?<=burnout)'", "", p)
    p = p.replace(":!", ":")  # chamada de nota lida como "!"
    # Pontuação que o OCR troca: reticências viram "..", vírgula vira ponto
    # ("Seja qual for a dificuldade. diga adiante"), aspa vira "*".
    p = re.sub(r"(?<=[A-Za-zÀ-ÿ])\.\.(?!\.)", "...", p)
    p = re.sub(r"(?<=\b[a-zà-ÿ]{3})(?<![.\d])\.(?= [a-zà-ÿ])", ",", p)
    p = re.sub(r"(?<=[a-zà-ÿ][a-zà-ÿ][a-zà-ÿ][a-zà-ÿ])\.(?= [a-zà-ÿ])", ",", p)
    p = re.sub(r"(?<=[a-zà-ÿ.!?”])[*^](?=\s+(?:[A-ZÀ-Ý]{2,}|\()|$)", "”", p)
    p = re.sub(r"”+", "”", p)
    p = re.sub(r"^>\s+|(?<=\.)\s>\s+", lambda m: "• " if m.group(0).startswith(">") else " • ", p)  # marcador lido como ">"
    p = p.replace("¡", "[").replace("¿lanos", "“planos").replace("Suw sonscape.org>", "www.sonscape.org")
    p = re.sub(r"(?<=[.!?]) • ", "\n\n• ", p)  # dois itens de lista na mesma linha
    p = aspas_das_caixas(p, vocab)
    p = re.sub(r"\b[A-Za-zÀ-ÿ]+\b", lambda m: acentos.get(m.group(0), m.group(0)), p)
    p = p.replace("num pais ", "num país ")
    p = re.sub(r"\s+([,.;:!?])", r"\1", p)
    if tipo == "citacao" or (p.startswith(("“", '"')) and re.search(r"[”\"]\s+[A-ZÀ-Ý][A-ZÀ-Ý.]+(?:\s|$)", p)):
        return citacao(p)
    sem_aspas = re.match(r"^(.*[a-zà-ÿ.!?…])\s+([A-ZÀ-Ý]{2,}(?:\s[A-ZÀ-Ý.]{2,})+)$", p)
    if sem_aspas and len(p) < 400:
        return citacao(p)
    return aspas(p)


def subtitulos_em_negrito(ps: list[str]) -> list[str]:
    """Parte dos subtítulos é negrito em caixa baixa ("Grandes perdas",
    "Insônia"), e o OCR não vê negrito: parágrafo curto, sem pontuação final,
    entre dois parágrafos, sobe para CAIXA ALTA (como o leitor reconhece)."""
    saida = []
    for i, p in enumerate(ps):
        if (
            0 < i < len(ps) - 1
            and len(p) < 60
            and p[:1].isupper()
            and not re.search(r"[.!?…:;,”\"»)*]$", p)
            and not re.search(r"[“”*]", p)
            and not p.startswith(("•", "—"))
            and not re.match(r"^\d", p)
        ):
            p = p.upper()
        saida.append(p)
    return saida


def carregar_acentos() -> dict[str, str]:
    arquivo = OCR / "acentos.json"
    sugeridos = json.loads(arquivo.read_text(encoding="utf-8")) if arquivo.exists() else {}
    # "ajudá" vem de "ajudá-lo": a palavra foi partida no hífen, não está errada.
    validos = {k: v for k, v in sugeridos.items() if not re.search(r"[áéêô]$", k) and k not in ACENTOS_RECUSADOS and k != v}
    return {**validos, **ACENTOS_A_MAO}


def carregar_base():
    spec = importlib.util.spec_from_file_location("livros_base", ROOT / "scripts/gerar-livros-downloads-20261006.py")
    if spec is None or spec.loader is None:
        raise RuntimeError("Não foi possível carregar o gerador base")
    base = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(base)
    base.ISSUE = ISSUE
    base.NUMEROS.update({14: "quatorze"})
    return base


def main() -> None:
    if "--palavras" in sys.argv:
        palavras = set()
        for _, a, b in MESAS:
            for _, p in montar(a, b):
                palavras.update(re.findall(r"[A-Za-zÀ-ÿ]+", p))
        print("\n".join(sorted(palavras)))
        return
    acentos = carregar_acentos()
    mesas = [montar(a, b) for _, a, b in MESAS]
    vocab = Counter(w.lower() for ps in mesas for _, p in ps for w in re.findall(r"[A-Za-zÀ-ÿ]+", p))
    aulas = []
    for ordem, ((titulo, _, _), ps) in enumerate(zip(MESAS, mesas), 1):
        conteudo = "\n\n".join(subtitulos_em_negrito([acabamento(tipo, p, acentos, vocab) for tipo, p in ps]))
        if len(conteudo) < 3000:
            raise ValueError(f"Conteúdo curto: {titulo}: {len(conteudo)}")
        aulas.append({"ordem": ordem, "titulo": titulo, "conteudo": conteudo})
    base = carregar_base()
    desc = base.descricao(LIVRO, len(aulas))
    sql = base.migration_sql(LIVRO, aulas, desc)
    # Sem capa de verdade no flipbook (a primeira página é a folha de rosto):
    # capa tipográfica da rota OG.
    sql = sql.replace(f"'/capas/{SLUG}.jpg'", f"'/api/og/curso/{SLUG}'")
    nome = f"{MIGRATION}_curso_{SLUG.replace('-', '_')}.sql"
    (ROOT / "supabase/migrations" / nome).write_text(sql, encoding="utf-8")
    dados = {**{k: LIVRO[k] for k in ("slug", "titulo", "autor", "categoria")}, "capa": f"/api/og/curso/{SLUG}", "aulas": aulas}
    (ROOT / "tmp/livros" / f"{SLUG}.json").write_text(json.dumps(dados, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    total = sum(len(a["conteudo"]) for a in aulas)
    print(f"{SLUG}: {len(aulas)} aulas, {total:,} caracteres -> {nome}")


if __name__ == "__main__":
    main()
