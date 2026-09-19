#!/usr/bin/env python3
"""Gera os cinco livros novos adicionados a Downloads em 18-19/09/2026.

Os PDFs permanecem fora do repositorio. Dois arquivos do mesmo periodo
(A Vida Crucificada e A Isca de Satanas) ja existem no acervo e, por isso,
nao fazem parte desta carga.
"""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import fitz


ROOT = Path(__file__).resolve().parents[1]
DOWNLOADS = Path.home() / "Downloads"
SOURCE = ROOT / "tmp/pdfs/novos-2026-09-19"
DEST = ROOT / "tmp/livros"
COVERS = ROOT / "public/capas"
BASE_SCRIPT = ROOT / "scripts/gerar-livros-downloads-20260917-lote2.py"

spec = importlib.util.spec_from_file_location("livros_base", BASE_SCRIPT)
if spec is None or spec.loader is None:
    raise RuntimeError(f"Nao foi possivel carregar {BASE_SCRIPT}")
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)


BOOKS = [
    {
        "slug": "perdao-total-na-igreja",
        "titulo": "Perdão Total na Igreja",
        "autor": "Maurício Zágari",
        "categoria": "pastoral",
        "pdf": "Perd* Total Na Igreja*",
        "txt": "Perdão Total Na Igreja.txt",
        "aulas": [
            ("Prefácio e uma palavra inicial", 14, 31),
            ("Capítulo 1 - Egolatria", 32, 45),
            ("Capítulo 2 - Prioridades invertidas", 46, 53),
            ("Capítulo 3 - Deslealdade", 54, 62),
            ("Capítulo 4 - Falsos ensinamentos", 63, 69),
            ("Capítulo 5 - Falta de amor", 70, 82),
            ("Capítulo 6 - O grande culpado", 83, 89),
            ("Capítulo 7 - Examine a si mesmo", 90, 95),
            ("Capítulo 8 - Expectativas irreais", 96, 107),
            ("Capítulo 9 - O problema sempre existiu", 108, 120),
            ("Capítulo 10 - Da amargura e da ira para a bondade e a compaixão", 121, 127),
            ("Capítulo 11 - Soluções que não solucionam", 128, 151),
            ("Capítulo 12 - Perdão total: a cura", 152, 162),
            ("Capítulo 13 - Perdoar exige fé e esforço", 163, 171),
            ("Capítulo 14 - O grande segredo para conseguir perdoar", 172, 184),
            ("Capítulo 15 - Perdoar e ser perdoado", 185, 196),
            ("Capítulo 16 - Perdão aconteceu", 197, 215),
            ("Ore comigo", 216, 218),
        ],
    },
    {
        "slug": "de-todo-o-coracao",
        "titulo": "De Todo o Coração",
        "autor": "Luciano Subirá",
        "categoria": "discipulado",
        "pdf": "De todo cora*o_Luciano Subir*",
        "txt": "De todo coração_Luciano Subirá.txt",
        "aulas": [
            ("Prefácio", 24, 26),
            ("Capítulo 1 - O primeiro mandamento", 27, 52),
            ("Capítulo 2 - Tu me amas?", 53, 76),
            ("Capítulo 3 - Escravos por amor", 77, 112),
            ("Capítulo 4 - Dívida de gratidão", 113, 141),
            ("Capítulo 5 - Doando-se a Deus", 142, 163),
            ("Capítulo 6 - Amor incorruptível", 164, 184),
            ("Capítulo 7 - Voltando ao primeiro amor", 185, 217),
            ("Capítulo 8 - Amor e obediência", 218, 243),
            ("Capítulo 9 - Transbordando o amor", 244, 261),
        ],
    },
    {
        "slug": "maes-de-joelhos-filhos-de-pe",
        "titulo": "Mães de Joelhos, Filhos de Pé",
        "autor": "Nina Targino",
        "categoria": "pastoral",
        "pdf": "livro m*es de joelhos filhos de p*",
        "txt": "livro mães de joelhos filhos de pé-ocr.txt",
        "aulas": [
            ("Apresentação, prefácio e introdução", 8, 23),
            ("Capítulo 1 - De joelhos", 24, 37),
            ("Capítulo 2 - Ore bem", 38, 54),
            ("Capítulo 3 - Perigo à vista", 55, 70),
            ("Capítulo 4 - Mantenha-se alerta", 71, 84),
            ("Capítulo 5 - Faça a coisa certa", 85, 97),
            ("Capítulo 6 - Seja específica", 98, 112),
            ("Capítulo 7 - Além da oração", 113, 126),
            ("Conclusão", 127, 131),
            ("Plano anual de oração em favor dos filhos", 132, 139),
        ],
    },
    {
        "slug": "as-obras-da-carne-e-o-fruto-do-espirito",
        "titulo": "As Obras da Carne e o Fruto do Espírito",
        "autor": "Osiel Gomes",
        "categoria": "espiritual",
        "pdf": "As Obras da Carne e o Fruto do Esp*rito - Osie*",
        "txt": "As Obras da Carne e o Fruto do Espírito - Osiel-ocr.txt",
        "aulas": [
            ("Capítulo 1 - As obras da carne versus fruto do Espírito", 9, 22),
            ("Capítulo 2 - O propósito do fruto do Espírito Santo", 23, 34),
            ("Capítulo 3 - O perigo das obras da carne", 35, 42),
            ("Capítulo 4 - Alegria e inveja", 43, 60),
            ("Capítulo 5 - Paz versus inimizade", 61, 72),
            ("Capítulo 6 - Paciência versus dissensões", 73, 87),
            ("Capítulo 7 - Benignidade versus porfias", 88, 97),
            ("Capítulo 8 - Bondade versus homicídio", 98, 107),
            ("Capítulo 9 - Fidelidade versus idolatria e heresias", 108, 126),
            ("Capítulo 10 - Mansidão versus pelejas", 127, 135),
            ("Capítulo 11 - Temperança versus prostituição e glutonaria", 136, 144),
            ("Capítulo 12 - Quem ama cumpre a lei", 145, 152),
            ("Capítulo 13 - Uma vida de frutificação", 153, 160),
        ],
    },
    {
        "slug": "loucos-por-jesus",
        "titulo": "Loucos por Jesus - Volume 1",
        "autor": "Lúcio Barreto Jr.",
        "categoria": "espiritual",
        "pdf": "Loucos por Jesus - Pr. Lucinho Barreto*",
        "txt": "Loucos por Jesus - Pr. Lucinho Barreto.txt",
        "aulas": [
            ("Jesus Freak", 8, 10),
            ("Testemunhas da Igreja Primitiva", 11, 20),
            ("Fiéis até a morte", 21, 30),
            ("Da perseguição ao testemunho", 31, 40),
            ("Vozes da Idade Média e da Reforma", 41, 50),
            ("Coragem em tempos de mudança", 51, 60),
            ("Missionários e mártires modernos", 61, 70),
            ("Loucos por Jesus até o fim", 71, 76),
        ],
    },
]


def render_cover(pdf: Path, slug: str) -> None:
    doc = fitz.open(pdf)
    pix = doc[0].get_pixmap(matrix=fitz.Matrix(1.7, 1.7), alpha=False)
    (COVERS / f"{slug}.jpg").write_bytes(pix.tobytes("jpeg", jpg_quality=86))
    doc.close()


def main() -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    COVERS.mkdir(parents=True, exist_ok=True)
    for book in BOOKS:
        pages = (SOURCE / book["txt"]).read_text(encoding="utf-8", errors="ignore").split("\f")
        first = min(start for _, start, _ in book["aulas"])
        last = max(end for _, _, end in book["aulas"])
        repeated = base.repeated_lines(pages[first - 1 : last])
        aulas = []
        for ordem, (lesson_title, start, end) in enumerate(book["aulas"], 1):
            parts = [
                base.page_text(page, repeated, book["titulo"], book["autor"])
                for page in pages[start - 1 : end]
            ]
            content = "\n\n".join(part for part in parts if part).strip()
            if len(content) < 800:
                raise ValueError(f"Conteudo curto: {book['slug']} / {lesson_title}: {len(content)}")
            aulas.append({"ordem": ordem, "titulo": lesson_title, "conteudo": content})
        data = {
            "slug": book["slug"],
            "titulo": book["titulo"],
            "autor": book["autor"],
            "categoria": book["categoria"],
            "capa": f"/capas/{book['slug']}.jpg",
            "aulas": aulas,
        }
        (DEST / f"{book['slug']}.json").write_text(
            json.dumps(data, ensure_ascii=False), encoding="utf-8"
        )
        pdf = base.find_one(DOWNLOADS, book["pdf"], ".pdf")
        render_cover(pdf, book["slug"])
        total = sum(len(aula["conteudo"]) for aula in aulas)
        print(f"{book['slug']}: {len(aulas)} aulas, {total:,} caracteres")


if __name__ == "__main__":
    main()
