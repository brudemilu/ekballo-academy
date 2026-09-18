#!/usr/bin/env python3
"""Gera a terceira leva de livros adicionados a Downloads em 17/09/2026."""

from __future__ import annotations

import importlib.util
import json
import re
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tmp/pdfs/novos-2026-09-17-lote3"
BASE_SCRIPT = ROOT / "scripts/gerar-livros-downloads-20260917-lote2.py"

spec = importlib.util.spec_from_file_location("livros_lote2", BASE_SCRIPT)
if spec is None or spec.loader is None:
    raise RuntimeError(f"Nao foi possivel carregar {BASE_SCRIPT}")
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)


base.SOURCE = SOURCE
base.BOOKS = [
    ("quebrando-a-ignorancia", "Quebrando a Ignorância", "Camila Barros", "discipulado", "LIVRO DIGITAL - QUEBRANDO A IGNOR_NCIA*", 3, 16, 20, 70000),
    ("mulheres-do-secreto", "Mulheres do Secreto", "Viviane Martinello", "discipulado", "Mulheres do Secreto - Viviane Martinello*", 10, 440, 20, 65000),
    ("viva-uma-jornada-de-fe-esperanca-e-milagres", "Viva: Uma Jornada de Fé, Esperança e Milagres", "Raquel Lima", "discipulado", "Viva uma jornada de fe* esperanc*a e milagres*", 13, 136, 18, 60000),
    ("lendo-a-biblia-de-modo-sobrenatural", "Lendo a Bíblia de Modo Sobrenatural", "John Piper", "ensino", "Lendo a Biblia de Modo Sobrenat*", 21, 980, 28, 75000),
    ("como-ter-um-coracao-de-maria-no-mundo-de-marta", "Como Ter um Coração de Maria no Mundo de Marta", "Joanna Weaver", "pastoral", "Como ter Um Corac*ao de Maria no Mundo de Marta*", 11, 167, 20, 65000),
    ("mulher-unica", "Mulher Única", "Edwin Louis Cole e Nancy Corbett Cole", "pastoral", "1_4940719790776910310*", 8, 247, 20, 65000),
    ("a-coragem-de-ser-imperfeito", "A Coragem de Ser Imperfeito", "Brené Brown", "cultura", "Brene*_Brown_a_Coragem_de_Ser_Imperfeito*", 8, 173, 20, 65000),
    ("o-reino-de-ponta-cabeca", "O Reino de Ponta-Cabeça", "Donald B. Kraybill", "ensino", "O Reino de ponta cabec*a*", 13, 376, 24, 75000),
    ("as-cinco-linguagens-do-perdao", "As Cinco Linguagens do Perdão", "Gary Chapman e Jennifer M. Thomas", "pastoral", "As cinco linguagens do perdao*", 5, 158, 18, 60000),
    ("eu-e-minha-boca-grande", "Eu e Minha Boca Grande", "Joyce Meyer", "discipulado", "Joyce Meyer - Eu e Minha Boca Grande.doc*", 6, 96, 14, 55000),
    ("desmascarando-o-espirito-de-jezabel", "Desmascarando o Espírito de Jezabel", "John Paul Jackson", "espiritual", "1_4949866911476220102*", 4, 86, 14, 55000),
    ("as-cinco-linguagens-do-amor-das-criancas", "As Cinco Linguagens do Amor das Crianças", "Gary Chapman e Ross Campbell", "pastoral", "1_5048613505305936059*", 8, 252, 20, 65000),
    ("quem-mexeu-no-meu-queijo", "Quem Mexeu no Meu Queijo?", "Spencer Johnson", "lideranca", "1_5161174633809969337*", 10, 48, 20, 65000),
    ("os-cacadores-de-deus", "Os Caçadores de Deus", "Tommy Tenney", "espiritual", "1_5091461043943637357*", 6, 183, 20, 65000),
    ("dons-espirituais", "Dons Espirituais", "Sam Storms", "espiritual", "1_4931631369395634310*", 7, 195, 20, 65000),
    ("descubra-o-seu-destino", "Descubra o Seu Destino", "Tiago Brunet", "discipulado", "1_4907143802336051588*", 5, 153, 18, 60000),
    ("o-amor-mais-louco-da-historia", "O Amor Mais Louco da História", "Deive Leonardo", "discipulado", "1_4949564584433287362*", 9, 121, 16, 55000),
    ("o-salmo-23-sob-o-olhar-de-um-pastor", "O Salmo 23 sob o Olhar de um Pastor", "W. Phillip Keller", "espiritual", "1_5075951616390070725*", 2, 62, 10, 45000),
]


base.HEADING = re.compile(
    r"^(?:pref[aá]cio|introdu[cç][aã]o|pr[oó]logo|ep[ií]logo|conclus[aã]o|"
    r"cap(?:[ií]tulo)?\s*(?:\d+|[ivxlcdm]+|um|dois|tr[eê]s|quatro|cinco|seis|sete|oito|nove|dez)\b.*|"
    r"parte\s+(?:\d+|[ivxlcdm]+|um|dois|tr[eê]s)\b.*)$",
    re.IGNORECASE,
)


def source_text(pattern: str) -> Path:
    if pattern.startswith("Mulheres do Secreto"):
        return base.find_one(SOURCE, "Mulheres do Secreto*-ocr*", ".txt")
    if pattern.startswith("1_494071"):
        return base.find_one(SOURCE, "Mulher Unica-ocr*", ".txt")
    return base.find_one(SOURCE, pattern, ".txt")


def title_cover() -> None:
    """Cria uma capa tipografica para o PDF do Salmo 23, que veio sem capa."""
    width, height = 900, 1350
    image = Image.new("RGB", (width, height), "#19382f")
    draw = ImageDraw.Draw(image)
    for y in range(height):
        ratio = y / height
        color = (
            int(25 + 70 * ratio),
            int(56 + 72 * ratio),
            int(47 + 48 * ratio),
        )
        draw.line((0, y, width, y), fill=color)
    serif = "/System/Library/Fonts/Supplemental/Georgia.ttf"
    serif_bold = "/System/Library/Fonts/Supplemental/Georgia Bold.ttf"
    title_font = ImageFont.truetype(serif_bold, 82)
    small_font = ImageFont.truetype(serif, 34)
    author_font = ImageFont.truetype(serif_bold, 38)
    draw.text((width / 2, 220), "O SALMO 23", font=title_font, anchor="mm", fill="#f3ead0")
    draw.text((width / 2, 325), "sob o olhar de um pastor", font=small_font, anchor="mm", fill="#d9cda8")
    draw.ellipse((330, 535, 570, 700), fill="#e9dfc1")
    draw.ellipse((510, 565, 635, 680), fill="#e9dfc1")
    draw.ellipse((550, 535, 585, 590), fill="#e9dfc1")
    draw.ellipse((600, 535, 635, 590), fill="#e9dfc1")
    for x in (365, 430, 520, 570):
        draw.rounded_rectangle((x, 675, x + 28, 790), radius=12, fill="#e9dfc1")
    draw.text((width / 2, 1100), "W. PHILLIP KELLER", font=author_font, anchor="mm", fill="#f3ead0")
    output = base.COVERS / "o-salmo-23-sob-o-olhar-de-um-pastor.jpg"
    image.save(output, quality=90)


def fix_ocr_titles() -> None:
    titles = {
        1: "Quem são elas?",
        2: "Cavernas e palácios",
        3: "Treinadas no lugar secreto",
        4: "Mesas e talheres",
        5: "Fraldas e coque",
        6: "Estacionamento e compras",
        7: "Uma conversa entre Marta e Maria",
        8: "O secreto é intencional",
        9: "Chamadas e enviadas",
        10: "Este capítulo é seu",
    }
    output = base.DEST / "mulheres-do-secreto.json"
    data = json.loads(output.read_text(encoding="utf-8"))
    for lesson in data["aulas"]:
        match = re.match(r"(?i)^cap[ií]tulo\s+(\d+)", lesson["titulo"])
        if match and int(match.group(1)) in titles:
            number = int(match.group(1))
            lesson["titulo"] = f"Capítulo {number} - {titles[number]}"
    output.write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")


base.source_text = source_text
base.main()
fix_ocr_titles()
title_cover()
