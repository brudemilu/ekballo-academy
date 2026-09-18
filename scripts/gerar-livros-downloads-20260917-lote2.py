#!/usr/bin/env python3
"""Gera a segunda leva de livros adicionados a Downloads em 17/09/2026.

Os PDFs permanecem fora do repositorio. O texto intermediario fica em
tmp/pdfs/novos-2026-09-17-lote2 e os JSONs finais seguem o formato consumido
por scripts/importar-livros.mjs. As aulas respeitam inicios de capitulos
detectaveis; obras sem marcadores confiaveis sao divididas em partes por
paginas, sem descartar o texto do miolo.
"""

from __future__ import annotations

import json
import re
import unicodedata
from collections import Counter
from pathlib import Path

import fitz


ROOT = Path(__file__).resolve().parents[1]
DOWNLOADS = Path.home() / "Downloads"
SOURCE = ROOT / "tmp/pdfs/novos-2026-09-17-lote2"
DEST = ROOT / "tmp/livros"
COVERS = ROOT / "public/capas"


BOOKS = [
    ("a-experiencia-da-mesa", "A Experiência da Mesa", "Devi Titus", "pastoral", "@BibliotecaCrista - EXPER*NCIA NA MESA*", 8, None, 24, 65000),
    ("mais-forte-e-corajosa", "Mais Forte e Corajosa", "Karina Bacchi", "discipulado", "Mais forte e corajosa*", 19, None, 20, 55000),
    ("cartas-de-c-s-lewis", "Cartas de C. S. Lewis", "C. S. Lewis", "leitura", "C. S. Lewis - Cartas de C. S. Lewis*", 12, 616, 24, 70000),
    ("mulheres-improvaveis", "Mulheres Improváveis", "Viviane Martinello", "discipulado", "Mulheres improvaveis*", 11, None, 24, 65000),
    ("mulheres-enraizadas", "Mulheres Enraizadas", "Viviane Martinello", "discipulado", "Mulheres Enraizadas*", 12, None, 12, 45000),
    ("a-escolha-do-verao", "A Escolha do Verão", "Sara Gusella", "leitura", "A Escolha do Verao*", 9, None, 24, 70000),
    ("o-poder-das-palavras", "O Poder das Palavras", "Márcio Valadão", "discipulado", "O poder das palavras*", 5, None, 40, 70000),
    ("o-deus-que-se-revela", "O Deus que se Revela", "Francis A. Schaeffer", "ensino", "O Deus que se revela*", 5, None, 20, 60000),
    ("o-coracao-e-a-mente-do-lider", "O Coração e a Mente do Líder", "John C. Maxwell", "lideranca", "O Corac*ao e a Mente do Lider*", 10, None, 16, 50000),
    ("marido-assuma-sua-culpa", "Marido, Assuma Sua Culpa", "Tiago Baía", "pastoral", "Marido assuma sua culpa*", 5, None, 20, 70000),
    ("quero-casar-certo", "Quero Casar Certo", "Josué Gonçalves e Douglas Gonçalves", "pastoral", "Quero Casar Certo*", 4, None, 14, 55000),
    ("o-poder-do-evangelho-e-sua-mensagem", "O Poder do Evangelho e Sua Mensagem", "Paul Washer", "ensino", "O Poder do Evangelho e sua Mens*", 9, None, 22, 70000),
    ("prepare-se-para-a-guerra", "Prepare-se para a Guerra", "Rebecca Brown", "espiritual", "Prepare-se para a Guerra*", 4, None, 20, 65000),
    ("louvor", "Louvor", "D. A. Carson, Mark Ashton, R. Kent Hughes e Timothy Keller", "espiritual", "Louvor*", 6, None, 28, 75000),
    ("uma-mulher-sabia", "Uma Mulher Sábia", "Erin Thiele", "pastoral", "Mulher Sa*bia*", 4, None, 24, 65000),
    ("nao-tenho-fe-suficiente-para-ser-ateu", "Não Tenho Fé Suficiente para Ser Ateu", "Norman Geisler e Frank Turek", "cultura", "Na*o tenho fe* suficiente para ser ateu*", 4, None, 22, 70000),
    ("o-sentido-ultimo-da-verdadeira-feminilidade", "O Sentido Último da Verdadeira Feminilidade", "John Piper", "pastoral", "Verdadeira-Feminilidade-Piper*", 2, None, 20, 70000),
    ("oracao-e-batalha-espiritual", "Oração e Batalha Espiritual", "Ministério Atos Dois", "espiritual", "orac*a*o e batalha espiritual-1*", 2, None, 14, 55000),
    ("um-jovem-segundo-o-coracao-de-deus", "Um Jovem Segundo o Coração de Deus", "Jim George", "discipulado", "UM JOVEM SEGUNDO CORAC*AO  DE DEUS*", 4, None, 16, 55000),
    ("senhor-ensina-nos-a-orar", "Senhor... Ensina-nos a Orar", "Paulo César Palhano", "espiritual", "Senhor ensina-nos a orar*", 6, None, 14, 50000),
    ("o-poder-da-esposa-que-ora", "O Poder da Esposa que Ora", "Stormie Omartian", "pastoral", "O poder da esposa que ora*", 6, None, 16, 50000),
    ("os-tesouros-de-davi-volume-2", "Os Tesouros de Davi — Volume 2", "Charles Spurgeon", "ensino", "Os tesouros de Davi Charles Spurgeon*", 10, None, 28, 90000),
    ("sete-necessidades-basicas-da-crianca", "Sete Necessidades Básicas da Criança", "John Drescher", "pastoral", "Sete necessidades ba*sicas das crianc*as*", 8, 184, 22, 65000),
    ("a-visao-de-ossos-secos", "A Visão de Ossos Secos", "Robert Murray M'Cheyne", "espiritual", "A Visa*o de Ossos secos*", 4, 12, 20, 70000),
]


LIGATURES = str.maketrans({"ﬁ": "fi", "ﬂ": "fl", "­": "", "\u00a0": " "})
HEADING = re.compile(
    r"^(?:pref[aá]cio|introdu[cç][aã]o|pr[oó]logo|conclus[aã]o|"
    r"cap[ií]tulo\s+(?:\d+|[ivxlcdm]+|um|dois|tr[eê]s|quatro|cinco|seis|sete|oito|nove|dez)\b.*|"
    r"parte\s+(?:\d+|[ivxlcdm]+|um|dois|tr[eê]s)\b.*|"
    r"dia\s+\d+\b.*|princ[ií]pio\s+(?:\d+|[ivxlcdm]+)\b.*|salmo\s+\d+)$",
    re.IGNORECASE,
)


def simplify(value: str) -> str:
    value = unicodedata.normalize("NFKD", value).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", " ", value.lower()).strip()


def find_one(root: Path, pattern: str, suffix: str) -> Path:
    candidates = [p for p in root.glob(pattern) if p.suffix.lower() == suffix]
    if not candidates:
        # O glob do macOS pode divergir na composicao dos acentos. Compara a
        # versao ASCII do prefixo para manter o script reproduzivel.
        prefix = simplify(pattern.split("*")[0])
        candidates = [p for p in root.iterdir() if p.suffix.lower() == suffix and simplify(p.name).startswith(prefix)]
    if len(candidates) != 1:
        raise ValueError(f"Esperado um arquivo para {pattern!r} em {root}, encontrados: {candidates}")
    return candidates[0]


def source_text(pattern: str) -> Path:
    if pattern.startswith("O Deus que se revela"):
        return find_one(SOURCE, "O Deus que se revela*-ocr*", ".txt")
    return find_one(SOURCE, pattern, ".txt")


def repeated_lines(pages: list[str]) -> set[str]:
    counts: Counter[str] = Counter()
    for page in pages:
        seen = {simplify(line) for line in page.splitlines() if 4 <= len(simplify(line)) <= 90}
        counts.update(seen)
    threshold = max(8, len(pages) // 5)
    return {line for line, count in counts.items() if count >= threshold}


def raw_lines(page: str) -> list[str]:
    clean_page = "".join(
        char
        for char in page.translate(LIGATURES)
        if ord(char) in (9, 10, 13) or ord(char) >= 32
    )
    return [re.sub(r"[ \t]+", " ", line).strip() for line in clean_page.splitlines()]


def page_heading(page: str) -> str | None:
    lines = [line for line in raw_lines(page) if line]
    for index, line in enumerate(lines[:18]):
        candidate = re.sub(r"[|•]+$", "", line).strip()
        # Referencias como "capítulo 9" no inicio de um paragrafo nao sao
        # titulos. Nos PDFs desta leva os marcadores reais começam em maiuscula.
        if re.match(r"(?i)^(?:cap[ií]tulo|parte)\b", candidate) and not candidate[:1].isupper():
            continue
        if re.match(r"(?i)^cap[ií]tulo\s+\d+[.:]", candidate) and len(candidate) > 30:
            continue
        if len(candidate) <= 120 and HEADING.match(candidate):
            # Cabecalhos genericos ganham o subtitulo logo abaixo, quando houver.
            if re.match(r"(?i)^(?:cap[ií]tulo|parte|dia|princ[ií]pio)\b", candidate):
                for next_line in lines[index + 1 : index + 5]:
                    if (
                        6 <= len(simplify(next_line))
                        and len(next_line) <= 70
                        and len(next_line.split()) <= 8
                        and not next_line.endswith((".", ";"))
                        and not re.fullmatch(r"\d+", next_line)
                    ):
                        if simplify(next_line) != simplify(candidate):
                            return f"{candidate} — {next_line}"
            return candidate
    return None


def page_text(page: str, repeated: set[str], book_title: str, author: str) -> str:
    paragraphs: list[str] = []
    current: list[str] = []
    title_key = simplify(book_title)
    author_key = simplify(author)

    def flush() -> None:
        if not current:
            return
        text = ""
        for line in current:
            if text and text.endswith("-") and re.match(r"^[a-zà-ÿ]", line):
                text = text[:-1] + line
            else:
                text += (" " if text else "") + line
        text = re.sub(r"\s+([,.;:!?])", r"\1", text)
        text = re.sub(r"\s+", " ", text).strip()
        if text:
            paragraphs.append(text)
        current.clear()

    for line in raw_lines(page):
        if not line:
            flush()
            continue
        key = simplify(line)
        if re.fullmatch(r"(?:p[aá]gina\s+)?\d+", line, re.IGNORECASE):
            continue
        if key in repeated or key == title_key or key == author_key:
            continue
        current.append(line)
    flush()
    return "\n\n".join(paragraphs)


def make_groups(pages: list[str], start: int, end: int | None, max_pages: int, max_chars: int, title: str, author: str) -> list[tuple[str | None, list[str]]]:
    selected = pages[start - 1 : end]
    repeated = repeated_lines(selected)
    groups: list[tuple[str | None, list[str]]] = []
    heading: str | None = None
    current: list[str] = []
    chars = 0

    def flush() -> None:
        nonlocal heading, current, chars
        if current:
            groups.append((heading, current))
        heading = None
        current = []
        chars = 0

    for page in selected:
        text = page_text(page, repeated, title, author)
        found = page_heading(page)
        if len(text) < 80:
            if found:
                if current and chars >= 800:
                    flush()
                heading = found
                if text:
                    current.append(text)
                    chars += len(text)
            continue
        if current and found and chars >= 800:
            flush()
        elif current and (len(current) >= max_pages or chars + len(text) > max_chars):
            flush()
        if not current and found:
            heading = found
        current.append(text)
        chars += len(text)
    flush()

    # Paginas divisorias e aberturas de capitulo podem ter apenas um titulo.
    # Une qualquer fragmento curto a aula seguinte (ou a anterior, se for o
    # ultimo), preservando o marcador estrutural sem criar aula vazia.
    merged: list[tuple[str | None, list[str]]] = []
    pending = list(groups)
    while pending:
        group_heading, group_pages = pending.pop(0)
        if sum(len(part) for part in group_pages) < 1500 and pending:
            next_heading, next_pages = pending[0]
            pending[0] = (group_heading or next_heading, group_pages + next_pages)
            continue
        if sum(len(part) for part in group_pages) < 1500 and merged:
            previous_heading, previous_pages = merged[-1]
            merged[-1] = (previous_heading or group_heading, previous_pages + group_pages)
            continue
        merged.append((group_heading, group_pages))
    return merged


def render_cover(pdf: Path, slug: str) -> None:
    doc = fitz.open(pdf)
    page = doc[0]
    pix = page.get_pixmap(matrix=fitz.Matrix(1.7, 1.7), alpha=False)
    (COVERS / f"{slug}.jpg").write_bytes(pix.tobytes("jpeg", jpg_quality=86))
    doc.close()


def main() -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    COVERS.mkdir(parents=True, exist_ok=True)
    for slug, title, author, category, pattern, start, end, max_pages, max_chars in BOOKS:
        text_path = source_text(pattern)
        pdf_path = find_one(DOWNLOADS, pattern, ".pdf")
        pages = text_path.read_text(encoding="utf-8", errors="ignore").split("\f")
        groups = make_groups(pages, start, end, max_pages, max_chars, title, author)
        aulas = []
        used_titles: Counter[str] = Counter()
        for order, (found_heading, group_pages) in enumerate(groups, 1):
            lesson_title = found_heading or f"Parte {order}"
            used_titles[lesson_title] += 1
            if used_titles[lesson_title] > 1:
                lesson_title = f"{lesson_title} — continuação {used_titles[lesson_title]}"
            content = "\n\n".join(group_pages).strip()
            if len(content) < 300:
                raise ValueError(f"Conteudo curto: {slug} / {lesson_title}: {len(content)}")
            aulas.append({"ordem": order, "titulo": lesson_title, "conteudo": content})
        data = {
            "slug": slug,
            "titulo": title,
            "autor": author,
            "categoria": category,
            "capa": f"/capas/{slug}.jpg",
            "aulas": aulas,
        }
        (DEST / f"{slug}.json").write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")
        render_cover(pdf_path, slug)
        total = sum(len(aula["conteudo"]) for aula in aulas)
        print(f"{slug}: {len(aulas)} aulas, {total:,} caracteres")


if __name__ == "__main__":
    main()
