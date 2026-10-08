#!/usr/bin/env python3
"""Gera a leva de livros deixada em Downloads em 08/10/2026 (issue #244).

Dezesseis leituras: onze de C. S. Lewis e cinco de outros autores. Reaproveita
o gerador de 06/10 (gerar-livros-downloads-20261006.py); este arquivo so
descreve os livros.

Quase todos sao PDF convertido de ebook e trazem o sumario embutido, com a
pagina e a altura em que cada capitulo comeca. A lista de mesas sai dai: cada
mesa vai do ponto que o sumario aponta ate o ponto da entrada seguinte, e
nada e mapeado a mao por numero de pagina.

Uso: python3 scripts/gerar-livros-downloads-20261008.py [slug ...]
"""

from __future__ import annotations

import importlib.util
import re
from pathlib import Path

import fitz

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("livros_base", ROOT / "scripts/gerar-livros-downloads-20261006.py")
if spec is None or spec.loader is None:
    raise RuntimeError("Nao foi possivel carregar o gerador base")
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)

# Letras que estes arquivos trazem trocadas:
# - versalete das edicoes Thomas Nelson cai no bloco cingales (U+0D89 = "a");
# - versalete de outra fonte cai na area de uso privado (U+F700 + ASCII);
# - ligaduras "Th", "fi", "fl" e "ft" viram letras soltas de outro alfabeto;
# - chamada de nota em algarismo sobrescrito Unicode.
# A versalete volta como maiuscula ("LEWIS", "RINK:"), que e como ela se le.
LETRAS = {chr(0x0D89 + i): chr(ord("A") + i) for i in range(26)}
LETRAS.update({chr(0xF700 + c): chr(c).upper() for c in range(0x20, 0x7F)})
LETRAS.update({"": "Th", "": "Th", "": "Th", "": "Th", "": "ft"})
LETRAS.update({"Ż": "fi", "ż": "fi", "Ž": "fl", "ž": "fl", "ŷ": "Th"})
LETRAS.update({c: "" for c in "⁰¹²³⁴⁵⁶⁷⁸⁹"})


def sumario(arquivo: str) -> tuple[fitz.Document, list[dict]]:
    doc = fitz.open(base.achar_arquivo(arquivo))
    itens = []
    for nivel, titulo, pagina, destino in doc.get_toc(simple=False):
        ponto = destino.get("to")
        itens.append({
            "nivel": nivel,
            "titulo": re.sub(r"\s+", " ", titulo).strip(),
            "pagina": pagina,
            "y": ponto.y if ponto is not None else 0,
        })
    return doc, itens


def achar(itens: list[dict], comeco: str, a_partir: int = 0) -> int:
    for i in range(a_partir, len(itens)):
        if itens[i]["titulo"].startswith(comeco):
            return i
    raise ValueError(f"Sumario sem entrada comecando por {comeco!r}")


def mesa(itens: list[dict], i: int, titulo: str, fim: int | None = None, ate: int | None = None, **opts) -> tuple:
    """Da entrada i ate a entrada `ate` (padrao: a seguinte) ou ate a pagina `fim`."""
    opts = {"y_ini": itens[i]["y"], **opts}
    if fim is not None:
        return (titulo, itens[i]["pagina"], fim, opts)
    j = i + 1 if ate is None else ate
    opts["y_fim"] = itens[j]["y"]
    return (titulo, itens[i]["pagina"], itens[j]["pagina"], opts)


def nome(titulo: str) -> str:
    """ "Capítulo 1 | A eficácia" e "Capítulo 1. O mal" -> "Capítulo 1 - ..." """
    titulo = re.sub(r"^(Cap[ií]tulo \d+)\s*[|.]\s*", r"\1 - ", titulo)
    titulo = re.sub(r"^(Apêndice)\s*[|.]\s*", r"\1 - ", titulo)
    return re.sub(r"^(\d+)\.\s+", r"Capítulo \1 - ", titulo)


def faixa(itens: list[dict], de: str, ate: str, fim_ultimo: int | None = None, pular: tuple = (), **opts) -> list[tuple]:
    """Uma mesa por entrada do sumario, de `de` ate (sem incluir) `ate`."""
    i0, i1 = achar(itens, de), achar(itens, ate, achar(itens, de) + 1)
    aulas = []
    for i in range(i0, i1):
        if any(itens[i]["titulo"].startswith(p) for p in pular):
            continue
        if i + 1 == i1 and fim_ultimo is not None:
            aulas.append(mesa(itens, i, nome(itens[i]["titulo"]), fim=fim_ultimo, **opts))
        else:
            aulas.append(mesa(itens, i, nome(itens[i]["titulo"]), **opts))
    return aulas


def em_grupos(itens: list[dict], indices: list[int], tamanho: int, rotulo, limite: int, **opts) -> list[tuple]:
    """Livro de textos curtos: junta `tamanho` entradas por mesa. `limite` e o
    indice da entrada que vem depois da ultima."""
    grupos = [indices[k : k + tamanho] for k in range(0, len(indices), tamanho)]
    if len(grupos) > 1 and len(grupos[-1]) <= tamanho // 2:
        sobra = grupos.pop()  # sobra pequena entra na mesa anterior
        grupos[-1] += sobra
    aulas = []
    primeiro = 1
    for k, grupo in enumerate(grupos):
        seguinte = grupos[k + 1][0] if k + 1 < len(grupos) else limite
        aulas.append(mesa(itens, grupo[0], rotulo(primeiro, primeiro + len(grupo) - 1), ate=seguinte, **opts))
        primeiro += len(grupo)
    return aulas


# ---------------------------------------------------------------- C. S. Lewis


def torre_sombria() -> list[tuple]:
    doc, itens = sumario("04 - A Torre Sombria")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio, por Walter Hooper")]
    # A novela que da nome ao livro tem 83 paginas e sete capitulos marcados
    # so por um algarismo solto na linha; o sumario nao os traz.
    i = achar(itens, "I. A Torre Sombria")
    fim = itens[i + 1]
    marcas = []
    for n in range(itens[i]["pagina"], fim["pagina"]):
        for linha in base.linhas_da_pagina(doc[n - 1]):
            if re.fullmatch(r"[1-9]", linha["texto"]) and int(linha["texto"]) == len(marcas) + 1:
                marcas.append((n, linha["y0"]))
    if len(marcas) < 5:
        raise ValueError(f"A Torre Sombria: esperava os capitulos numerados, achei {len(marcas)}")
    for k, (pagina, y) in enumerate(marcas):
        opts = {"y_ini": y + 4}
        if k + 1 < len(marcas):
            proxima, opts["y_fim"] = marcas[k + 1]
        else:
            proxima, opts["y_fim"] = fim["pagina"], fim["y"]
        aulas.append((f"A Torre Sombria - capítulo {k + 1}", pagina, proxima, opts))
    aulas.append(mesa(itens, i + 1, "Uma nota sobre A Torre Sombria"))
    for comeco in ("II.", "III.", "IV.", "V."):
        j = achar(itens, comeco)
        aulas.append(mesa(itens, j, re.sub(r"^[IVX]+\.\s*", "", itens[j]["titulo"])))
    j = achar(itens, "VI.")
    aulas.append(mesa(itens, j, "Depois de dez anos"))
    aulas.append(mesa(itens, j + 1, "Notas sobre Depois de dez anos", fim=174))
    return aulas


def ultima_noite() -> list[tuple]:
    _, itens = sumario("05 - A última noite")
    return faixa(itens, "Capítulo 1", "Outros livros", fim_ultimo=87)


def tenhamos_rostos() -> list[tuple]:
    _, itens = sumario("06 - Até que tenhamos rostos")
    aulas = []
    for parte, rotulo in (("Parte I", "Parte I"), ("Parte II", "Parte II")):
        i = achar(itens, parte) if parte == "Parte I" else achar(itens, "Parte II")
        j = i + 1
        while itens[j]["nivel"] == 2:
            aulas.append(mesa(itens, j, f"{rotulo} - capítulo {itens[j]['titulo'].lower()}"))
            j += 1
    aulas.append(mesa(itens, achar(itens, "Nota"), "Nota do autor", fim=308))
    return aulas


def banco_dos_reus() -> list[tuple]:
    _, itens = sumario("07 - DEUS NO BANCO")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio, por Walter Hooper")]
    numeral = {"Parte I": "I", "Parte II": "II", "Parte III": "III"}
    parte = ""
    for i, item in enumerate(itens):
        if item["titulo"] in numeral:
            parte = numeral[item["titulo"]]
        elif item["nivel"] == 2 and item["titulo"].startswith("Capítulo") and parte:
            titulo = re.sub(r"^Capítulo (\d+)\.\s*", rf"Parte {parte}, {r'\1'} - ", item["titulo"])
            aulas.append(mesa(itens, i, titulo))
    return aulas


def cartas_a_malcolm() -> list[tuple]:
    _, itens = sumario("09 - Cartas a Malcolm")
    # "Cartas a Malcolm" aparece duas vezes no sumario (rosto e contracapa).
    return faixa(itens[achar(itens, "Nota sobre") :], "Carta I", "Cartas a Malcolm", fim_ultimo=126)


def diario() -> list[tuple]:
    _, itens = sumario("11 - Todo meu caminho")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio"), mesa(itens, achar(itens, "Introdução"), "Introdução")]
    ano = ""
    for i, item in enumerate(itens):
        if item["nivel"] == 2 and re.fullmatch(r"19\d\d", item["titulo"]):
            ano = item["titulo"]
        elif item["nivel"] == 3 and ano:
            aulas.append(mesa(itens, i, f"{ano} - {item['titulo']}"))
    return aulas


def critica_literaria() -> list[tuple]:
    _, itens = sumario("13_Um_experimento")
    return faixa(itens, "Capítulo 1", "Outros livros", fim_ultimo=114)


def regresso_do_peregrino() -> list[tuple]:
    _, itens = sumario("15 - O regresso do Peregrino")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio à terceira edição", ate=achar(itens, "LIVRO 1"))]
    livros = [i for i, item in enumerate(itens) if item["nivel"] == 1 and item["titulo"].startswith("LIVRO")]
    for k, i in enumerate(livros):
        numero, titulo = re.fullmatch(r"LIVRO (\d+) — (.+)", itens[i]["titulo"]).groups()
        titulo = f"Livro {numero} - {titulo[0]}{titulo[1:].lower()}"
        if k + 1 < len(livros):
            aulas.append(mesa(itens, i, titulo, ate=livros[k + 1]))
        else:
            aulas.append(mesa(itens, i, titulo, fim=381))
    return aulas


def sobre_historias() -> list[tuple]:
    _, itens = sumario("16 - Sobre histórias")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio, por Walter Hooper")]
    return aulas + faixa(itens, "Capítulo 1", "Outros livros", fim_ultimo=183)


def reflexoes_sobre_salmos() -> list[tuple]:
    _, itens = sumario("18 - Reflexões sobre Salmos")
    i = achar(itens, "Introdução")
    return faixa(itens[i:], "Introdução", "Apêndice")


def macdonald() -> list[tuple]:
    _, itens = sumario("24 - George Macdonald")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio, por C. S. Lewis")]
    # O sumario embutido pula alguns dos 365 trechos; o corte usa os que ele
    # traz e o rotulo usa o numero do proprio trecho.
    trechos = [i for i, item in enumerate(itens) if item["nivel"] == 2 and re.match(r"^\d+ ", item["titulo"])]
    numero = lambda i: int(itens[i]["titulo"].split()[0])
    if numero(trechos[0]) != 1 or numero(trechos[-1]) != 365:
        raise ValueError("MacDonald: o sumario nao vai do trecho 1 ao 365")
    grupos = [trechos[k] for k in range(0, len(trechos), 30)]
    for k, i in enumerate(grupos):
        if k + 1 < len(grupos):
            aulas.append(mesa(itens, i, f"Trechos {numero(i)} a {numero(grupos[k + 1]) - 1}", ate=grupos[k + 1]))
        else:
            aulas.append(mesa(itens, i, f"Trechos {numero(i)} a 365", fim=400))
    return aulas


# ------------------------------------------------------------ outros autores


def misericordia() -> list[tuple]:
    _, itens = sumario("MINISTÉRIO DE MISERICÓRDIA")
    aulas = [
        mesa(itens, achar(itens, "Prólogo"), "Prólogo - Aquele que teve misericórdia"),
        mesa(itens, achar(itens, "Introdução"), "Introdução - Quem é o meu próximo?"),
    ]
    capitulos = [i for i, item in enumerate(itens) if item["nivel"] == 2]
    for i in capitulos[:-1]:
        aulas.append(mesa(itens, i, nome(itens[i]["titulo"])))
    aulas.append(mesa(itens, capitulos[-1], nome(itens[capitulos[-1]]["titulo"]), fim=621))
    return aulas


def desafio_da_pregacao() -> list[tuple]:
    _, itens = sumario("O desafio da pregação")
    aulas = [
        mesa(itens, achar(itens, "Introdução"), "Introdução"),
        mesa(itens, achar(itens, "Prefácio"), "Prefácio"),
    ]
    for i in range(achar(itens, "1. Desafios"), achar(itens, "Apêndice 2")):
        titulo = re.sub(r"^(\d+)\.?\s+", r"Capítulo \1 - ", itens[i]["titulo"])
        aulas.append(mesa(itens, i, titulo.replace("Apêndice 1:", "Apêndice -")))
    return aulas


def talmidim() -> list[tuple]:
    _, itens = sumario("O passo a passo de Jesus")
    dias = [i for i, item in enumerate(itens) if re.match(r"^\d{3}\. ", item["titulo"])]
    if len(dias) != 365:
        raise ValueError(f"Talmidim: esperava 365 dias, achei {len(dias)}")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio")]
    return aulas + em_grupos(itens, dias, 7, lambda a, b: f"Dias {a} a {b}", achar(itens, "Bibliografia"))


def pequeno_peregrino() -> list[tuple]:
    _, itens = sumario("O pequeno peregrino")
    aulas = [mesa(itens, achar(itens, "Prefácio"), "Prefácio")]
    um, dois, fim = achar(itens, "Parte um"), achar(itens, "Parte dois"), achar(itens, "Compartilhe")
    primeira = list(range(um + 1, dois))
    segunda = list(range(dois + 1, fim))
    aulas += em_grupos(itens, primeira, 5, lambda a, b: f"Cristão - capítulos {a} a {b}", dois)
    # A primeira mesa de cada parte comeca na pagina de abertura da parte, que
    # traz o titulo e uma ilustracao de pagina inteira.
    def desde(aula: tuple, i: int) -> tuple:
        return (aula[0], itens[i]["pagina"], aula[2], {**aula[3], "y_ini": itens[i]["y"]})

    aulas[1] = desde(aulas[1], um)
    base_n = len(primeira)
    grupos = em_grupos(itens, segunda[:-1], 5, lambda a, b: f"Cristiana - capítulos {a + base_n} a {b + base_n}", segunda[-1])
    ultimo = grupos.pop()
    inicio_do_grupo = base_n + 1 + 5 * len(grupos)
    # Depois do ultimo capitulo (pagina 326) ha seis paginas so de ilustracao.
    grupos.append((f"Cristiana - capítulos {inicio_do_grupo} a {base_n + len(segunda)}", ultimo[1], 332, {"y_ini": ultimo[3]["y_ini"]}))
    grupos[0] = desde(grupos[0], dois)
    return aulas + grupos


def ocupado_demais() -> list[tuple]:
    """Unico sem sumario embutido: o capitulo abre com o numero sozinho na
    primeira linha da pagina e o titulo logo abaixo."""
    doc = fitz.open(base.achar_arquivo("Ocupado demais"))
    capitulos = []
    for n in range(4, doc.page_count):
        linhas = [l.strip() for l in doc[n].get_text().splitlines() if l.strip()]
        if len(linhas) > 2 and re.fullmatch(r"\d{1,2}", linhas[0]) and int(linhas[0]) == len(capitulos) + 1:
            capitulos.append((n + 1, linhas[1]))
    if len(capitulos) != 15:
        raise ValueError(f"Hybels: esperava 15 capitulos, achei {len(capitulos)}")
    aulas = []
    for k, (pagina, titulo) in enumerate(capitulos):
        fim = capitulos[k + 1][0] - 1 if k + 1 < len(capitulos) else 120
        aulas.append((f"Capítulo {k + 1} - {titulo}", pagina, fim, {"pular": 1}))
    return aulas


LEWIS = "C. S. Lewis"
NOTAS = [(r"\s?\[\s?\d+\s?\]", "")]
# Linha que abre o capitulo em corpo de texto ("CAPÍTULO | 1", "LIVRO 2"): sem
# ela o titulo grande que vem logo abaixo e reconhecido e sai tambem.
ABERTURAS = [r"^(?:CAP[IÍ]TULO|LIVRO|CARTA)\s*\|?\s*(?:\d+|[IVXL]+)$", r"^PREF[AÁ]CIO$", r"^INTRODU[CÇ][AÃ]O$"]
# Edicoes Thomas Nelson: corpo 15 e nota de rodape em 11,2 no pe da pagina.
TN = {"nota_em_span": True, "corpo_min": 12.5, "descartar": ABERTURAS}

BOOKS = [
    {
        "migration": 346, "slug": "a-torre-sombria", "titulo": "A Torre Sombria e Outras Histórias",
        "autor": LEWIS, "categoria": "leitura", "arquivo": "04 - A Torre Sombria",
        "resumo": "A ficção curta de Lewis reunida por Walter Hooper: a novela inacabada A Torre Sombria, quatro contos e o fragmento Depois de dez anos, com as notas de quem conviveu com o autor.",
        "aulas": torre_sombria(), **TN, "minimo": 600,
    },
    {
        "migration": 347, "slug": "a-ultima-noite-do-mundo", "titulo": "A Última Noite do Mundo",
        "autor": LEWIS, "categoria": "ensino", "arquivo": "05 - A última noite",
        "resumo": "Sete ensaios sobre a eficácia da oração, a obstinação na fé, cultura e religião, o brinde de Maldanado, boas obras e a segunda vinda de Cristo.",
        "aulas": ultima_noite(), **TN,
    },
    {
        "migration": 348, "slug": "ate-que-tenhamos-rostos", "titulo": "Até que Tenhamos Rostos",
        "autor": LEWIS, "categoria": "leitura", "arquivo": "06 - Até que tenhamos rostos",
        "resumo": "O último romance de Lewis reconta o mito de Cupido e Psique pela voz de Orual, a irmã feia que acusa os deuses — e descobre o que há por trás da própria queixa.",
        "aulas": tenhamos_rostos(), **TN,
    },
    {
        "migration": 349, "slug": "deus-no-banco-dos-reus", "titulo": "Deus no Banco dos Réus",
        "autor": LEWIS, "categoria": "ensino", "arquivo": "07 - DEUS NO BANCO",
        "resumo": "Quarenta e oito ensaios de teologia e ética reunidos por Walter Hooper: milagres, dogma e ciência, apologética, o problema do mal, o Natal, a pena e o castigo — o homem moderno julgando Deus, e não o contrário.",
        "aulas": banco_dos_reus(), **TN, "trocas": NOTAS,
    },
    {
        "migration": 350, "slug": "cartas-a-malcolm", "titulo": "Cartas a Malcolm",
        "autor": LEWIS, "categoria": "espiritual", "arquivo": "09 - Cartas a Malcolm",
        "resumo": "Em vinte e duas cartas a um amigo imaginário, Lewis conversa sobre a oração: a liturgia, a petição, o louvor, a distração, o purgatório e a ressurreição.",
        "aulas": cartas_a_malcolm(), **TN, "espaco_duplo": True,
    },
    {
        "migration": 351, "slug": "todo-meu-caminho-diante-de-mim", "titulo": "Todo Meu Caminho Diante de Mim",
        "autor": LEWIS, "categoria": "leitura", "arquivo": "11 - Todo meu caminho",
        "resumo": "O diário que Lewis manteve de 1922 a 1927, ainda ateu: os estudos em Oxford, a vida doméstica com a Sra. Moore, os amigos e as leituras. Cada aula é um mês do diário.",
        "aulas": diario(), **TN, "trocas": NOTAS,
    },
    {
        "migration": 352, "slug": "um-experimento-em-critica-literaria", "titulo": "Um Experimento em Crítica Literária",
        "autor": LEWIS, "categoria": "cultura", "arquivo": "13_Um_experimento",
        "resumo": "Lewis propõe julgar os livros pelo modo como são lidos, e não o contrário: o que distingue quem usa a literatura de quem a recebe.",
        "aulas": critica_literaria(), **TN,
    },
    {
        "migration": 353, "slug": "o-regresso-do-peregrino", "titulo": "O Regresso do Peregrino",
        "autor": LEWIS, "categoria": "leitura", "arquivo": "15 - O regresso do Peregrino",
        "resumo": "A primeira obra de ficção de Lewis depois da conversão: a alegoria de John, que deixa Puritânia em busca da ilha desejada e atravessa as filosofias do seu tempo até voltar para casa.",
        "aulas": regresso_do_peregrino(), **TN,
    },
    {
        "migration": 354, "slug": "sobre-historias", "titulo": "Sobre Histórias",
        "autor": LEWIS, "categoria": "cultura", "arquivo": "16 - Sobre histórias",
        "resumo": "Vinte ensaios e resenhas sobre a arte de contar histórias: contos de fadas, ficção científica, Tolkien, Orwell, Dorothy Sayers e como nasceram as Crônicas de Nárnia.",
        "aulas": sobre_historias(), **TN,
    },
    {
        "migration": 355, "slug": "reflexoes-sobre-salmos", "titulo": "Reflexões sobre Salmos",
        "autor": LEWIS, "categoria": "ensino", "arquivo": "18 - Reflexões sobre Salmos",
        "resumo": "Lewis lê os Salmos como leigo que escreve para leigos: o julgamento, as maldições, a morte, o louvor, a beleza da Lei e os segundos sentidos que apontam para Cristo.",
        "aulas": reflexoes_sobre_salmos(), **TN, "trocas": NOTAS,
    },
    {
        "migration": 356, "slug": "george-macdonald-uma-antologia", "titulo": "George MacDonald: Uma Antologia",
        "autor": "George MacDonald (seleção de C. S. Lewis)", "categoria": "espiritual", "arquivo": "24 - George Macdonald",
        "resumo": "Trezentos e sessenta e cinco trechos de George MacDonald escolhidos por Lewis, que o chamava de mestre. Cada aula reúne trinta trechos, na ordem do livro.",
        "aulas": macdonald(), **TN, "manter_abertura": True, "minimo": 3000, "trocas": [(r"^(\d+) \|\s*", r"\1. ")],
    },
    {
        "migration": 357, "slug": "ministerios-de-misericordia", "titulo": "Ministérios de Misericórdia",
        "autor": "Timothy Keller", "categoria": "pastoral", "arquivo": "MINISTÉRIO DE MISERICÓRDIA",
        "resumo": "A partir da parábola do bom samaritano, Timothy Keller mostra por que o cuidado com o necessitado é parte do evangelho e como uma igreja local organiza, na prática, o seu ministério de misericórdia.",
        "aulas": misericordia(), "nota_em_span": True, "tirar_notas_finais": True, "salto": 0.65,
    },
    {
        "migration": 358, "slug": "o-desafio-da-pregacao", "titulo": "O Desafio da Pregação",
        "autor": "John Stott", "categoria": "ensino", "arquivo": "O desafio da pregação",
        "resumo": "A edição condensada do clássico de John Stott sobre a pregação: os desafios de hoje, os fundamentos teológicos, a pregação como construção de pontes, o estudo, o preparo do sermão e o caráter do pregador.",
        "aulas": desafio_da_pregacao(), "nota_em_span": True, "abre_em_caixa_alta": True,
    },
    {
        "migration": 359, "slug": "o-passo-a-passo-de-jesus", "titulo": "O Passo a Passo de Jesus (Talmidim)",
        "autor": "Ed René Kivitz", "categoria": "discipulado", "arquivo": "O passo a passo de Jesus",
        "resumo": "Trezentas e sessenta e cinco meditações curtas de Ed René Kivitz sobre seguir Jesus como talmid, discípulo, do Sermão do Monte à cruz. Cada aula reúne sete dias.",
        "aulas": talmidim(), "manter_abertura": True, "minimo": 3000, "descartar": [r"^Veja o vídeo"],
    },
    {
        "migration": 360, "slug": "o-pequeno-peregrino", "titulo": "O Pequeno Peregrino",
        "autor": "Helen L. Taylor", "categoria": "infantil", "arquivo": "O pequeno peregrino",
        "resumo": "O Peregrino de John Bunyan recontado para crianças por Helen L. Taylor: a viagem do pequeno Cristão até a Cidade Celestial e, depois, a de Cristiana e seus amigos. Cada aula reúne cinco capítulos curtos.",
        "aulas": pequeno_peregrino(), "manter_abertura": True, "minimo": 1000, "figuras": True,
    },
    {
        "migration": 361, "slug": "ocupado-demais-para-deixar-de-orar", "titulo": "Ocupado Demais para Deixar de Orar",
        "autor": "Bill Hybels", "categoria": "espiritual", "arquivo": "Ocupado demais",
        "resumo": "Bill Hybels trata da oração para gente sem tempo: a presença e o poder de Deus, um padrão para orar, as barreiras da oração não respondida e como desacelerar para ouvir a Deus.",
        "aulas": ocupado_demais(),
    },
]


def abertura_em_frase(conteudo: str) -> str:
    """O capitulo abre com palavras em versalete, que o arquivo traz em CAIXA
    ALTA ("A PREGAçãO É INDISPENSÁVEL ao cristianismo"); voltam a ser frase."""
    paragrafos = conteudo.split("\n\n")
    palavras = paragrafos[0].split(" ")
    n = 0
    while n < len(palavras):
        letras = [c for c in palavras[n] if c.isalpha()]
        maiusculas = sum(1 for c in letras if c.isupper())
        if letras and maiusculas < max(1, 0.6 * len(letras)):
            break
        n += 1
    if n >= 2:
        frase = " ".join(palavras[:n])
        frase = frase[0] + frase[1:].lower()
        frase = re.sub(r"\b(deus|cristo|jesus|senhor|john stott|all souls|bíblia)\b", lambda m: m.group(0).title(), frase)
        paragrafos[0] = " ".join([frase] + palavras[n:])
    return "\n\n".join(paragrafos)


def figura_depois_do_paragrafo(conteudo: str) -> str:
    """Ilustracao no meio de um paragrafo (a frase continua depois dela, ou na
    pagina seguinte): o paragrafo e emendado e a figura vai logo abaixo."""
    blocos = conteudo.split("\n\n")
    saida: list[str] = []
    i = 0
    while i < len(blocos):
        bloco = blocos[i]
        if bloco.startswith("[figura]") and saida and i + 1 < len(blocos):
            anterior, seguinte = saida[-1], blocos[i + 1]
            aberto = not anterior.startswith("[figura]") and not anterior.endswith(base.FIM_DE_FRASE) and anterior.upper() != anterior
            if aberto and not seguinte.startswith("[figura]"):
                emenda = anterior[:-1] + seguinte if anterior.endswith("-") else f"{anterior} {seguinte}"
                saida[-1] = emenda
                blocos[i + 1] = bloco  # a figura passa para depois do paragrafo emendado
                i += 1
                continue
        saida.append(bloco)
        i += 1
    return "\n\n".join(saida)


_aula_original = base.Livro.aula


def _aula(self, ordem, inicio, fim, opts):
    conteudo = _aula_original(self, ordem, inicio, fim, opts)
    if self.book.get("figuras"):
        conteudo = figura_depois_do_paragrafo(conteudo)
    if self.book.get("abre_em_caixa_alta"):
        conteudo = abertura_em_frase(conteudo)
    return conteudo


if __name__ == "__main__":
    base.Livro.aula = _aula
    base.BOOKS = BOOKS
    base.ISSUE = 244
    base.TRANSLATE.update(str.maketrans(LETRAS))
    base.main()
