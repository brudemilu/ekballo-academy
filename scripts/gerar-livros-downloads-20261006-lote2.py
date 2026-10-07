#!/usr/bin/env python3
"""Gera a segunda leva de livros deixada em Downloads em 06/10/2026 (issue #233).

Quatro leituras. Reaproveita o gerador da primeira leva
(gerar-livros-downloads-20261006.py): este arquivo so descreve os livros. Em
tres deles a lista de mesas sai do proprio arquivo (sumario embutido ou
marcador "N° Dia"), porque o capitulo comeca no meio da pagina e o que
delimita a mesa e o titulo, nao a pagina.

Uso: python3 scripts/gerar-livros-downloads-20261006-lote2.py [slug ...]
"""

from __future__ import annotations

import importlib.util
import re
from pathlib import Path

import fitz

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("livros_base", ROOT / "scripts/gerar-livros-downloads-20261006.py")
if spec is None or spec.loader is None:
    raise RuntimeError("Nao foi possivel carregar o gerador da primeira leva")
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)

NOMES_SANTOS = r"\b(deus|cristo|jesus|senhor|bíblia|espírito santo)\b"


def exato(titulo: str) -> str:
    # O sumario embutido e o miolo nem sempre compoem o acento do mesmo jeito
    # (NFC x NFD): tudo que nao e letra sem acento ou algarismo vira curinga.
    miolo = re.sub(r"[^A-Za-z0-9]+", lambda m: ".{1,%d}" % (2 * len(m.group(0))), titulo)
    # Em alguns capitulos o numero, o titulo e a primeira frase vieram na
    # mesma linha ("12 Amando a Quem nao Merece Nosso Amor Era um lindo...").
    return r"^(?:\d{1,2}\s+)?" + miolo + r"(?:$|\s+(?=(?-i:[A-ZÀ-Ý—“])))"


def sumario(arquivo: str) -> list[tuple[str, int]]:
    doc = fitz.open(base.achar_arquivo(arquivo))
    return [(titulo.strip(), pagina) for nivel, titulo, pagina in doc.get_toc() if nivel == 1]


def cinco_linguagens() -> list[tuple]:
    """Capitulos pelo sumario embutido; cada um vai do seu titulo ao seguinte."""
    itens = sumario("As 5 Linguagens do Amor - Gary")
    inicio = next(i for i, (t, _) in enumerate(itens) if t.startswith("O que Acontece"))
    fim = next(i for i, (t, _) in enumerate(itens) if t.startswith("Guia de Estudo"))
    aulas = []
    for n, i in enumerate(range(inicio, fim), 1):
        titulo, pagina = itens[i]
        proximo, proxima_pagina = itens[i + 1]
        aulas.append((
            f"Capítulo {n} - {titulo}",
            pagina,
            proxima_pagina + 1,
            {"de": exato(titulo), "ate": exato(proximo)},
        ))
    return aulas


def marca(dia: int) -> str:
    # O arquivo alterna "4° Dia" e "4º Dia".
    return rf"^{dia}\s*[°ºo]\s*dia$"


def desafio_de_amar() -> list[tuple]:
    """Quarenta dias, cada um aberto por uma linha "N° Dia" e o titulo logo abaixo."""
    doc = fitz.open(base.achar_arquivo("O desafio de Amar"))
    dias = {}
    apendices = {}
    for n in range(doc.page_count):
        linhas = base.linhas_da_pagina(doc[n])
        for i, linha in enumerate(linhas):
            achou = re.fullmatch(r"(\d{1,2})\s*[°ºo]\s*dia", linha["texto"], re.IGNORECASE)
            if achou:
                # "0 Amor e bondoso": zero no lugar do O em um dos titulos.
                titulo = re.sub(r"^0 ", "O ", linhas[i + 1]["texto"].strip())
                dias[int(achou.group(1))] = (n + 1, titulo)
            apendice = re.fullmatch(r"Apêndice (I{1,3}|IV)", linha["texto"])
            if apendice:
                apendices[apendice.group(1)] = (n + 1, linhas[i + 1]["texto"].strip())
    if sorted(dias) != list(range(1, 41)):
        raise ValueError(f"Esperava os dias 1 a 40, achei {sorted(dias)}")
    aulas = [("Apresentação", 2, dias[1][0], {"ate": marca(1), "pular": 1})]
    for dia in range(1, 41):
        pagina, titulo = dias[dia]
        fim = dias[dia + 1][0] if dia < 40 else apendices["I"][0]
        opts = {"de": marca(dia), "pular": 1, "ate": marca(dia + 1) if dia < 40 else r"^Apêndice I$"}
        aulas.append((f"Dia {dia} - {titulo}", pagina, fim, opts))
    ordem = ["I", "II", "III", "IV"]
    if sorted(apendices) != sorted(ordem):
        raise ValueError(f"Esperava quatro apendices, achei {sorted(apendices)}")
    for k, numero in enumerate(ordem):
        pagina, titulo = apendices[numero]
        opts = {"de": rf"^Apêndice {numero}$", "pular": 1}
        if k + 1 < len(ordem):
            opts["ate"] = rf"^Apêndice {ordem[k + 1]}$"
            fim = apendices[ordem[k + 1]][0]
        else:
            fim = doc.page_count
        aulas.append((f"Apêndice {numero} - {titulo}", pagina, fim, opts))
    return aulas


def enquanto_estivermos_juntos() -> list[tuple]:
    itens = sumario("Enquanto Estivermos Juntos")
    inicio = next(i for i, (t, _) in enumerate(itens) if t == "Prefácio")
    fim = next(i for i, (t, _) in enumerate(itens) if t == "Sobre o autor" and i > inicio)
    aulas = []
    for i in range(inicio, fim):
        titulo, pagina = itens[i]
        capitulo = re.fullmatch(r"(\d+)\. (.+)", titulo)
        if capitulo:
            # A linha "CAPITULO N" ja sai como cabecalho repetido; sobra o titulo.
            nome, pular = f"Capítulo {capitulo.group(1)} - {capitulo.group(2)}", 1
        else:
            nome, pular = titulo, 1
        aulas.append((nome.replace("‑", "-"), pagina, itens[i + 1][1] - 1, {"pular": pular}))
    return aulas


def deus_esta_no_controle() -> list[tuple]:
    """Setenta e cinco leituras de umas tres mil letras: sete por mesa."""
    itens = sumario("Deus está no controle")
    inicio = next(i for i, (t, _) in enumerate(itens) if t == "O valor de mil palavras")
    fim = next(i for i, (t, _) in enumerate(itens) if t == "Autoras")
    leituras = itens[inicio:fim]
    aulas = []
    for k in range(0, len(leituras), 7):
        grupo = leituras[k : k + 7]
        ultima = itens[inicio + k + len(grupo)][1] - 1
        aulas.append((f"Leituras {k + 1} a {k + len(grupo)}", grupo[0][1], ultima))
    return aulas


BOOKS = [
    {
        "migration": 342,
        "slug": "as-cinco-linguagens-do-amor",
        "titulo": "As Cinco Linguagens do Amor",
        "autor": "Gary Chapman",
        "categoria": "pastoral",
        "arquivo": "As 5 Linguagens do Amor - Gary",
        "resumo": "Gary Chapman mostra que cada pessoa expressa e recebe amor de um jeito — palavras de afirmação, qualidade de tempo, presentes, formas de servir, toque físico — e como falar a linguagem do cônjuge para manter cheio o seu tanque de amor.",
        "aulas": cinco_linguagens(),
        "corpo_por_pagina": True,
        "salto_exige_frase": True,
        "nota_em_span": True,
        "trocas": [(r"(?<=[.”!?])\d{1,2}$", "")],
    },
    {
        "migration": 343,
        "slug": "o-desafio-de-amar",
        "titulo": "O Desafio de Amar",
        "autor": "Stephen e Alex Kendrick",
        "categoria": "pastoral",
        "arquivo": "O desafio de Amar",
        "resumo": "A jornada de quarenta dias do filme Prova de Fogo: a cada dia, um traço do amor de 1 Coríntios 13 e um desafio prático para vivê-lo no casamento.",
        "aulas": desafio_de_amar(),
        "centralizado": True,
        "sem_titulo_negrito": True,
        "minimo": 500,
        "descartar": [r"^[_\s]{5,}$"],
        "pagina_capa": 1,
    },
    {
        "migration": 344,
        "slug": "enquanto-estivermos-juntos",
        "titulo": "Enquanto Estivermos Juntos",
        "autor": "Jeremy Camp",
        "categoria": "leitura",
        "arquivo": "Enquanto Estivermos Juntos",
        "resumo": "O cantor Jeremy Camp conta a própria história: a infância pobre, o chamado para a música, o casamento com Melissa e a morte dela poucos meses depois, e a fé que permaneceu.",
        "aulas": enquanto_estivermos_juntos(),
        "abre_em_caixa_alta": True,
        "trocas": [(r"\s?\[\d+\]", "")],
    },
    {
        "migration": 345,
        "slug": "deus-esta-no-controle",
        "titulo": "Deus Está no Controle",
        "autor": "Stormie Omartian e outras autoras",
        "categoria": "espiritual",
        "arquivo": "Deus está no controle",
        "resumo": "Setenta e cinco leituras curtas de oito autoras — entre elas Elizabeth George, Kay Arthur e Lysa TerKeurst —, escritas para mulheres, sobre confiar em Deus na rotina, nas provações e nas decisões. Cada aula reúne sete leituras, na ordem do livro.",
        "aulas": deus_esta_no_controle(),
        "manter_abertura": True,
        "minimo": 5000,
    },
]


def abertura_em_frase(conteudo: str) -> str:
    """O capitulo abre com algumas palavras em versalete, que o arquivo traz em
    CAIXA ALTA ("NOSSA FAMILIA NAO ERA APENAS POBRE, mas superpobre"). Sozinhas
    num paragrafo o leitor as mostraria como titulo; voltam a ser frase."""
    paragrafos = conteudo.split("\n\n")
    primeiro = paragrafos[0]
    if primeiro.upper() == primeiro and len(paragrafos) > 1 and len(primeiro) < 90:
        primeiro = primeiro + " " + paragrafos.pop(1)
    corrida = re.match(r"^(?:[^a-zà-ÿ\s]+\s+)*[^a-zà-ÿ\s]+(?![A-Za-zÀ-ÿ])", primeiro)
    if corrida and len(corrida.group(0)) > 3:
        trecho = corrida.group(0)
        frase = trecho[0] + trecho[1:].lower()
        frase = re.sub(r"(?<=[.!?] )([a-zà-ÿ])", lambda m: m.group(1).upper(), frase)
        frase = re.sub(NOMES_SANTOS, lambda m: m.group(0).title(), frase)
        primeiro = frase + primeiro[len(trecho) :]
    paragrafos[0] = primeiro
    return "\n\n".join(paragrafos)


_aula_original = base.Livro.aula


def _aula(self, ordem, inicio, fim, opts):
    conteudo = _aula_original(self, ordem, inicio, fim, opts)
    if self.book.get("abre_em_caixa_alta"):
        conteudo = abertura_em_frase(conteudo)
    return conteudo


if __name__ == "__main__":
    base.Livro.aula = _aula
    base.BOOKS = BOOKS
    base.ISSUE = 233
    base.NUMEROS.update({11: "onze", 14: "quatorze", 24: "vinte e quatro", 45: "quarenta e cinco"})
    base.main()
