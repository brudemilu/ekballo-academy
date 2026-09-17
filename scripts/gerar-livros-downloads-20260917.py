#!/usr/bin/env python3
"""Gera os JSONs de importacao dos livros baixados em 17/09/2026.

Os PDFs permanecem em Downloads. Os TXT em tmp/pdfs/novos-2026-09-17 sao
produzidos com pdftotext; os dois PDFs com camada textual ruim usam os TXT de
OCR gerados com Tesseract. Cada intervalo abaixo segue o sumario da obra.
"""

from __future__ import annotations

import json
import re
import unicodedata
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tmp/pdfs/novos-2026-09-17"
DEST = ROOT / "tmp/livros"


BOOKS = [
    {
        "slug": "oito-maneiras-de-manter-o-diabo-debaixo-dos-seus-pes",
        "titulo": "Oito Maneiras de Manter o Diabo Debaixo dos Seus Pés",
        "autor": "Joyce Meyer",
        "categoria": "espiritual",
        "source": "8-maneiras-de-manter-o-diabo-debaixo-layout.txt",
        "lessons": [
            ("Introdução", 9, 18),
            ("Capítulo 1 - Tome posse da terra", 19, 26),
            ("Capítulo 2 - Você quer realmente ser curado?", 27, 40),
            ("Capítulo 3 - Seja alguém que faz, não apenas alguém que ouve", 41, 62),
            ("Introdução à segunda parte", 63, 66),
            ("Capítulo 4 - Permaneça em paz na tempestade", 67, 84),
            ("Capítulo 5 - Passe tempo com Deus", 85, 100),
            ("Capítulo 6 - Vigie sua boca", 101, 122),
            ("Capítulo 7 - Submeta-se a Deus", 123, 140),
            ("Capítulo 8 - Ande em amor", 141, 154),
            ("Capítulo 9 - Saiba a diferença entre ser e fazer", 155, 162),
            ("Capítulo 10 - Pense no que você está pensando", 163, 168),
            ("Capítulo 11 - Ore em todo o tempo", 169, 178),
            ("Conclusão e orações", 179, 190),
        ],
    },
    {
        "slug": "a-criacao-de-filhos-no-poder-do-evangelho",
        "titulo": "A Criação de Filhos no Poder do Evangelho",
        "autor": "William P. Farley",
        "categoria": "pastoral",
        "source": "a-criac-ao-de-filhos-no-poder-do-evangelho-layout.txt",
        "lessons": [
            ("Introdução", 10, 18),
            ("Capítulo 1 - Submarinos intelectuais", 19, 63),
            ("Capítulo 2 - Criação de filhos no poder do evangelho", 64, 92),
            ("Capítulo 3 - Temor do evangelho", 93, 125),
            ("Capítulo 4 - Um pai santo", 126, 160),
            ("Capítulo 5 - Um pai gracioso", 161, 197),
            ("Capítulo 6 - O primeiro princípio da criação de filhos", 198, 236),
            ("Capítulo 7 - Pais do evangelho", 237, 277),
            ("Capítulo 8 - Fundamentos da disciplina", 278, 310),
            ("Capítulo 9 - A disciplina que prega", 311, 334),
            ("Capítulo 10 - Alimento para o faminto", 335, 375),
            ("Capítulo 11 - O amor do evangelho", 376, 418),
            ("Capítulo 12 - Preciosa graça", 419, 441),
        ],
    },
    {
        "slug": "ideologia-de-genero",
        "titulo": "Ideologia de Gênero",
        "autor": "Adriel Lemos e Robson Carvalho",
        "categoria": "cultura",
        "source": "ideologia-de-g-enero-layout.txt",
        "lessons": [
            ("Prefácio e introdução", 11, 21),
            ("Capítulo 1 - Origem, mitos e verdades", 22, 34),
            ("Capítulo 2 - Influência histórica e atual", 35, 51),
            ("Capítulo 3 - Teorias de quê mesmo?", 52, 63),
            ("Capítulo 4 - As estratégias dos defensores da ideologia de gênero", 64, 77),
            ("Capítulo 5 - O que a ciência diz sobre a ideologia de gênero?", 78, 104),
            ("Capítulo 6 - O que a Bíblia diz sobre a ideologia de gênero?", 105, 120),
            ("Capítulo 7 - Tornamo-nos alvos", 121, 147),
            ("Capítulo 8 - O papel da família", 148, 170),
            ("Capítulo 9 - O papel da igreja", 171, 196),
            ("Capítulo 10 - O papel e a responsabilidade do cidadão e da sociedade", 197, 211),
            ("Conclusão e referências", 212, 229),
        ],
    },
    {
        "slug": "jesus-a-vida-completa",
        "titulo": "Jesus: A Vida Completa",
        "autor": "Juanribe Pagliarin",
        "categoria": "ensino",
        "source": "jesus-a-vida-completa-layout.txt",
        "lessons": [
            ("Apresentação - As quatro testemunhas", 3, 9),
            ("Do tempo antes do tempo ao início do ministério", 10, 34),
            ("Os primeiros ensinos e sinais", 35, 59),
            ("Parábolas, curas e chamado", 60, 84),
            ("O pão da vida e a identidade de Jesus", 85, 109),
            ("O caminho do discipulado", 110, 134),
            ("A entrada em Jerusalém e os confrontos finais", 135, 159),
            ("A última ceia e as promessas aos discípulos", 160, 184),
            ("Prisão, julgamento e crucificação", 185, 209),
            ("Ressurreição, aparições e ascensão", 210, 222),
            ("Dicionário teológico - Parte 1", 223, 242),
            ("Dicionário teológico - Parte 2", 243, 262),
            ("Dicionário teológico - Parte 3", 263, 282),
            ("Dicionário teológico - Parte 4", 283, 298),
            ("Referências cronológicas dos Evangelhos", 299, 318),
        ],
    },
    {
        "slug": "que-bom-se-meu-marido-orasse-comigo",
        "titulo": "Que Bom se Meu Marido Orasse Comigo",
        "autor": "Larry Keefauver",
        "categoria": "pastoral",
        "source": "larry-keefauver-que-bom-se-meu-marido-orasse-comigo-160-layout.txt",
        "lessons": [
            ("Introdução", 4, 5),
            ("Capítulo 1 - Você está dormindo ou orando?", 6, 13),
            ("Capítulo 2 - Se você não é o sacerdote da casa, quem é?", 14, 33),
            ("Capítulo 3 - Expectativas não satisfeitas", 34, 60),
            ("Capítulo 4 - Necessidades não satisfeitas", 61, 83),
            ("Capítulo 5 - Mágoas não saradas", 84, 104),
            ("Capítulo 6 - Pecados não confessados", 105, 131),
            ("Capítulo 7 - Confissão: arrependimento que cura o casamento", 132, 148),
            ("Capítulo 8 - Uma oração final", 149, 156),
        ],
    },
    {
        "slug": "o-que-voce-precisa-saber-sobre-batalha-espiritual",
        "titulo": "O Que Você Precisa Saber sobre Batalha Espiritual",
        "autor": "Augustus Nicodemus Lopes",
        "categoria": "espiritual",
        "source": "o-que-voc-e-precisa-saber-sobre-batalha-layout.txt",
        "lessons": [
            ("Apresentação e introdução", 7, 10),
            ("Capítulo 1 - Nós estamos em guerra", 11, 28),
            ("Capítulo 2 - Origem e difusão do movimento de batalha espiritual", 29, 34),
            ("Capítulo 3 - Os principais ensinos do movimento", 35, 48),
            ("Capítulo 4 - O que nos preocupa na batalha espiritual", 49, 92),
            ("Capítulo 5 - A vitória de Cristo e suas implicações", 93, 108),
            ("Capítulo 6 - Batalha espiritual como resistência", 109, 118),
            ("Capítulo 7 - Batalha espiritual como proclamação", 119, 128),
            ("Capítulo 8 - O erro religioso", 129, 148),
            ("Capítulo 9 - Paulo e Satanás", 149, 172),
            ("Capítulo 10 - A armadura para o dia mau", 173, 190),
            ("Capítulo 11 - Objetos que trazem bênção e maldição", 191, 210),
            ("Capítulo 12 - Coisas sacrificadas a demônios", 211, 222),
        ],
    },
    {
        "slug": "servir-ou-ser-visto",
        "titulo": "Servir ou Ser Visto?",
        "autor": "Thiago Benetti",
        "categoria": "discipulado",
        "source": "servir-x-ser-visto-ocr.txt",
        "lessons": [
            ("Introdução", 6, 7),
            ("Capítulo 1 - Servo por escolha", 8, 13),
            ("Capítulo 2 - Uma vida servil e um lindo chamado", 14, 24),
            ("Capítulo 3 - E se eu não quiser?", 25, 31),
            ("Capítulo 4 - O poder do não", 32, 36),
            ("Capítulo 5 - Diga-me com quem andas...", 37, 39),
            ("Capítulo 6 - Sirva no secreto", 40, 43),
            ("Capítulo 7 - Servir ou ser visto?", 44, 56),
        ],
    },
    {
        "slug": "sexualidade-sem-censura",
        "titulo": "Sexualidade sem Censura",
        "autor": "Cláudio Duarte",
        "categoria": "pastoral",
        "source": "sexualidade-sem-censura-layout.txt",
        "lessons": [
            ("Introdução", 9, 15),
            ("Capítulo 1 - A motivação para o ato sexual", 16, 29),
            ("Capítulo 2 - A importância da liberdade na vida do casal", 30, 44),
            ("Capítulo 3 - Isso pode?", 45, 54),
            ("Capítulo 4 - Coisas vitais num relacionamento a dois", 55, 73),
            ("Capítulo 5 - Edificando a casa sobre a rocha", 74, 88),
            ("Capítulo 6 - Um casamento à prova de tempestades", 89, 103),
            ("Capítulo 7 - Quão bom e agradável é viver em união!", 104, 122),
        ],
    },
    {
        "slug": "tempestade-a-vista",
        "titulo": "Tempestade à Vista",
        "autor": "Billy Graham",
        "categoria": "espiritual",
        "source": "tempestade-a-vista-ocr.txt",
        "lessons": [
            ("Prólogo", 5, 7),
            ("Capítulo 1 - Ventos de mudanças", 8, 19),
            ("Capítulo 2 - Sinais dos tempos", 20, 27),
            ("Capítulo 3 - Cenário que muda", 28, 37),
            ("Capítulo 4 - Dentro do Apocalipse", 38, 44),
            ("Capítulo 5 - Nossa única esperança", 45, 53),
            ("Capítulo 6 - Ao que vencer", 54, 70),
            ("Capítulo 7 - Diante de Deus", 71, 76),
            ("Capítulo 8 - Fuga do paraíso", 77, 83),
            ("Capítulo 9 - Fraude espiritual", 84, 95),
            ("Capítulo 10 - O mundo material", 96, 104),
            ("Capítulo 11 - Portador da guerra", 105, 113),
            ("Capítulo 12 - Fome na terra", 114, 131),
            ("Capítulo 13 - Sombra da morte", 132, 145),
            ("Capítulo 14 - Esperança para o mundo", 146, 156),
            ("Capítulo 15 - Uma voz na tempestade", 157, 168),
            ("Capítulo 16 - A promessa de paz", 169, 179),
            ("Capítulo 17 - Pós-escrito: nova aurora", 180, 182),
        ],
    },
]


REPLACEMENTS = str.maketrans({"ﬁ": "fi", "ﬂ": "fl", "­": "", "\u00a0": " "})


def clean_page(page: str, book_title: str) -> list[str]:
    lines = page.translate(REPLACEMENTS).splitlines()
    cleaned: list[str] = []
    title_key = simplify(book_title)
    for raw in lines:
        line = re.sub(r"[ \t]+", " ", raw).strip()
        if not line:
            cleaned.append("")
            continue
        key = simplify(line)
        if re.fullmatch(r"\d+", line):
            continue
        if re.fullmatch(r"(?:juanribe pagliarin|jesus a vida completa) \d+", key):
            continue
        if key == title_key:
            continue
        cleaned.append(line)
    return cleaned


def simplify(value: str) -> str:
    value = unicodedata.normalize("NFKD", value).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", " ", value.lower()).strip()


def paragraphs_from_pages(pages: list[str], title: str) -> str:
    paragraphs: list[str] = []
    current: list[str] = []

    def flush() -> None:
        if not current:
            return
        text = ""
        for line in current:
            if text and re.search(r"[a-zà-ÿ]-$", text) and re.match(r"^[a-zà-ÿ]", line):
                text = text[:-1] + line
            else:
                text += (" " if text else "") + line
        text = re.sub(r"\s+([,.;:!?])", r"\1", text)
        text = re.sub(r"\s+", " ", text).strip()
        if text:
            paragraphs.append(text)
        current.clear()

    for page in pages:
        for line in clean_page(page, title):
            if line:
                current.append(line)
            else:
                flush()
        flush()
    return "\n\n".join(paragraphs).strip()


def main() -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    for book in BOOKS:
        pages = (SOURCE / book["source"]).read_text(encoding="utf-8", errors="ignore").split("\f")
        aulas = []
        for ordem, (titulo, start, end) in enumerate(book["lessons"], 1):
            conteudo = paragraphs_from_pages(pages[start - 1 : end], book["titulo"])
            if len(conteudo) < 300:
                raise ValueError(f"Conteudo curto: {book['slug']} / {titulo}: {len(conteudo)}")
            aulas.append({"ordem": ordem, "titulo": titulo, "conteudo": conteudo})
        data = {
            "slug": book["slug"],
            "titulo": book["titulo"],
            "autor": book["autor"],
            "categoria": book["categoria"],
            "capa": f"/capas/{book['slug']}.jpg",
            "aulas": aulas,
        }
        output = DEST / f"{book['slug']}.json"
        output.write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")
        chars = sum(len(a["conteudo"]) for a in aulas)
        print(f"{book['slug']}: {len(aulas)} aulas, {chars:,} caracteres")


if __name__ == "__main__":
    main()
