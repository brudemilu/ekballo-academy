#!/usr/bin/env python3
"""Gera a leva de livros deixada em Downloads em 14/10/2026 (issue #270).

Duas leituras. Reaproveita o gerador de 06/10
(gerar-livros-downloads-20261006.py): este arquivo so descreve os livros.

- O Poder Secreto do Jejum e da Oracao (Mahesh Chavda): ebook digitalizado,
  cada capitulo abre pagina nova. O OCR trocou o "O" maiusculo por zero em
  varios lugares ("0 Senhor"); volta a ser letra.
- Memorias de Charles G. Finney: documento do Word, capitulo comeca no meio
  da pagina. A mesa vai da linha "CAPITULO N" ate a do seguinte, achadas no
  proprio arquivo. Sem capa no PDF (so folha de rosto): entra com a capa
  tipografica da rota OG.

Uso: python3 scripts/gerar-livros-downloads-20261014.py [slug ...]
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

CHAVDA = "E book do Livro  O Poder Secreto do Jejum"
FINNEY = "MEMÓRIAS DE CHARLES G. FINNEY"

ROMANOS = [
    "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
    "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
    "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",
    "XXXI", "XXXII", "XXXIII",
]

# Titulos do arquivo estao em CAIXA ALTA; aqui, como se escrevem.
TITULOS_FINNEY = [
    "Nascimento e pré-educação",
    "Conversão a Cristo",
    "Princípio do ministério",
    "Educação doutrinária e outras experiências em Adams",
    "Pregando como missionário",
    "Avivamento em Evans' Mills e seus resultados específicos",
    "Apontamentos específicos sobre educação ministerial",
    "Avivamento em Antwerp",
    "Retorno a Evans' Mills",
    "Reavivamento em Gouverneur",
    "Avivamento em De Kalb",
    "Avivamento em Western",
    "O avivamento em Roma",
    "O avivamento em Utica, Nova Iorque",
    "O avivamento em Auburn em 1826",
    "O avivamento em Tróia e no Novo Líbano",
    "O avivamento em Stephentown",
    "Os avivamentos em Wilmington e na Filadélfia",
    "O avivamento em Reading",
    "Os avivamentos em Columbia e na cidade de Nova Iorque",
    "O avivamento em Rochester, 1830",
    "O avivamento em Auburn, Buffalo, Providence e Boston",
    "As obras na cidade de Nova Iorque, de 1832 em diante",
    "O início do trabalho em Oberlin",
    "Obras em Boston e Providence",
    "O avivamento em Rochester em 1842",
    "Mais um inverno em Boston",
    "A primeira visita à Inglaterra",
    "As obras no Tabernáculo, em Moorfields, Londres",
    "As obras em Hartford e em Syracuse",
    "Obras em D'Oeste e em Roma, 1854-1855",
    "O avivamento em Rochester em 1855",
    "Os avivamentos em Boston, em 1856-57-58",
]


# Estes dois saem no arquivo com ponto final ("...E NA FILADELFIA.").
PONTO_FINAL = {
    "Os avivamentos em Wilmington e na Filadélfia",
    "O avivamento em Auburn, Buffalo, Providence e Boston",
}


def marca(romano: str) -> str:
    return rf"^CAP[IÍ]TULO {romano}\.?$"


def finney() -> list[tuple]:
    doc = fitz.open(base.achar_arquivo(FINNEY))
    paginas = {}
    for n in range(doc.page_count):
        for linha in base.linhas_da_pagina(doc[n]):
            achou = re.fullmatch(r"CAP[IÍ]TULO ([IVXL]+)\.?", linha["texto"].strip())
            if achou:
                paginas[achou.group(1)] = n + 1
    if list(paginas) != ROMANOS:
        raise ValueError(f"Esperava os capitulos I a XXXIII em ordem, achei {list(paginas)}")
    aulas = []
    for k, romano in enumerate(ROMANOS):
        opts = {"de": marca(romano)}
        if TITULOS_FINNEY[k] in PONTO_FINAL:
            opts["pular"] = 1  # titulo terminado em ponto nao passa por titulo
        if k + 1 < len(ROMANOS):
            opts["ate"] = marca(ROMANOS[k + 1])
            fim = paginas[ROMANOS[k + 1]]
        else:
            fim = doc.page_count
        aulas.append((f"Capítulo {k + 1} - {TITULOS_FINNEY[k]}", paginas[romano], fim, opts))
    return aulas


# No Chavda o titulo do capitulo tem o mesmo corpo do texto: a linha logo
# abaixo de "Capitulo N" (descartada) e o titulo, que ja e o da mesa.
TITULO = {"pular": 1}

BOOKS = [
    {
        "migration": 373,
        "slug": "o-poder-secreto-do-jejum-e-da-oracao",
        "titulo": "O Poder Secreto do Jejum e da Oração",
        "autor": "Mahesh Chavda",
        "categoria": "espiritual",
        "arquivo": CHAVDA,
        "resumo": "Mahesh Chavda conta o que viu em décadas de ministério sustentado por jejum e oração — curas, libertações, avivamentos — e ensina por que o jejum, longe de ser fora de moda, é o caminho da humildade e do poder de Deus na igreja.",
        "aulas": [
            ("Prefácio e Introdução", 7, 9),
            ("Capítulo 1 - Qual é a solução para Stevie?", 11, 19, TITULO),
            ("Capítulo 2 - Jesus, o nosso maior exemplo", 20, 29, TITULO),
            ("Capítulo 3 - As transformações e os benefícios do jejum", 30, 41, TITULO),
            ("Capítulo 4 - Qual é a natureza de seu ministério?", 42, 50, TITULO),
            ("Capítulo 5 - Humildade: a posição de triunfo", 51, 61, TITULO),
            ("Capítulo 6 - Duas causas de acidentes no ministério", 62, 73, TITULO),
            ("Capítulo 7 - Flechas de dor, flechas de triunfo", 74, 82, TITULO),
            ("Capítulo 8 - Os pioneiros da oração e do jejum", 83, 94, TITULO),
            ("Capítulo 9 - Oração corporativa e o avivamento do tempo do fim", 95, 106, TITULO),
            ("Capítulo 10 - Como liberar a unção apostólica", 107, 120, TITULO),
        ],
        "descartar": [r"^Cap[ií]tulo \d+$", r"^Fim$"],
        # OCR: zero no lugar do O maiusculo ("0 Senhor", "JESUS, 0 NOSSO").
        "trocas": [(r"(?<![\d.,])\b0(?=\s+[A-Za-zÀ-ÿ])", "O"), (r"\(J1 (?=\d)", "(Jl "), (r"chama- do", "chamado")],
        "capa_xref": 7,
        "subtitulos_sem_marca": True,
    },
    {
        "migration": 374,
        "slug": "memorias-de-charles-finney",
        "titulo": "Memórias de Charles G. Finney",
        "autor": "Charles G. Finney",
        "categoria": "leitura",
        "arquivo": FINNEY,
        "resumo": "O próprio Finney narra a sua conversão, o chamado ao ministério e os avivamentos que acompanhou nos Estados Unidos e na Inglaterra no século XIX, com as doutrinas e os meios que usou para alcançar os perdidos.",
        "aulas": finney(),
        "capa_og": True,
    },
]


def capa(book: dict, livro) -> None:
    if book.get("capa_og"):
        return  # capa tipografica: app/api/og/curso/[slug]/route.tsx
    destino = base.COVERS / f"{book['slug']}.jpg"
    if destino.exists():
        return
    pix = fitz.Pixmap(livro.doc, book["capa_xref"])
    if pix.n - pix.alpha > 3:
        pix = fitz.Pixmap(fitz.csRGB, pix)
    destino.write_bytes(pix.tobytes("jpeg", jpg_quality=88))


def subtitulos_sem_marca(conteudo: str) -> str:
    """O OCR do Chavda perdeu o negrito: subtitulo e texto vem na mesma fonte.
    Paragrafo curto sem pontuacao final e subtitulo; sobe para CAIXA ALTA,
    que e como o leitor reconhece subtitulo. Item de lista numerada e
    citacao que nao fecha as aspas ficam como estao."""
    saida = []
    for paragrafo in conteudo.split("\n\n"):
        citacao_aberta = paragrafo.startswith(("\"", "“")) and paragrafo.count("\"") + paragrafo.count("”") < 2
        if (
            len(paragrafo) < 90
            and not re.search(r"[.!?…:;\"”»),]$", paragrafo)
            and not re.match(r"^\d", paragrafo)
            and not citacao_aberta
        ):
            paragrafo = paragrafo.upper()
        saida.append(paragrafo)
    return "\n\n".join(saida)


_aula_original = base.Livro.aula


def _aula(self, ordem, inicio, fim, opts):
    conteudo = _aula_original(self, ordem, inicio, fim, opts)
    # A primeira mesa (prefacio e introducao) termina em assinaturas, nao em subtitulos.
    if self.book.get("subtitulos_sem_marca") and ordem > 1:
        conteudo = subtitulos_sem_marca(conteudo)
    return conteudo


_migration_original = base.migration_sql


def migration_sql(book: dict, aulas: list[dict], desc: str) -> str:
    sql = _migration_original(book, aulas, desc)
    if book.get("capa_og"):
        sql = sql.replace(f"'/capas/{book['slug']}.jpg'", f"'/api/og/curso/{book['slug']}'")
    return sql


if __name__ == "__main__":
    base.Livro.aula = _aula
    base.BOOKS = BOOKS
    base.ISSUE = 270
    base.capa = capa
    base.migration_sql = migration_sql
    base.NUMEROS.update({11: "onze", 33: "trinta e três"})
    base.main()
