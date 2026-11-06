#!/usr/bin/env python3
"""Gera a leva de livros deixada em Downloads em 06/10/2026 (issue #230).

Doze leituras: nove livros e tres textos curtos de John Wesley. Os arquivos
ficam fora do repositorio — o script procura em ~/Downloads/Livros subidos e,
se nao achar, na raiz de ~/Downloads.

Diferente das levas de setembro, o texto sai direto do PDF pelo PyMuPDF (sem
passar por pdftotext): com a posicao e o corpo de cada linha da para separar
paragrafo de verdade (recuo, linha curta, espaco vertical) em vez de quebrar
na virada de pagina, e para reconhecer subtitulo pelo tamanho da letra. O
subtitulo vai em CAIXA ALTA num paragrafo proprio, que e a forma que
lib/estrutura-livro.ts reconhece como titulo de secao.

Saidas:
  tmp/livros/<slug>.json                 formato de scripts/importar-livros.mjs
  supabase/migrations/NNN_curso_<slug>.sql
  public/capas/<slug>.jpg                (requalificar com sips antes do commit)

Uso: python3 scripts/gerar-livros-downloads-20261006.py [slug ...]
"""

from __future__ import annotations

import json
import re
import sys
import unicodedata
from collections import Counter
from pathlib import Path

import fitz

ROOT = Path(__file__).resolve().parents[1]
ORIGENS = [Path.home() / "Downloads" / "Livros subidos", Path.home() / "Downloads"]
DEST = ROOT / "tmp/livros"
COVERS = ROOT / "public/capas"
MIGRATIONS = ROOT / "supabase/migrations"
ISSUE = 230  # as levas seguintes reaproveitam este modulo e trocam BOOKS e ISSUE

fitz.TOOLS.mupdf_display_errors(False)  # epub sem a fonte embutida enche o terminal de aviso

# (titulo da mesa, primeira pagina, ultima pagina) — paginas do PDF, base 1.
BOOKS = [
    {
        "migration": 330,
        "slug": "a-travessia",
        "titulo": "A Travessia",
        "autor": "William P. Young",
        "categoria": "leitura",
        "arquivo": "A-Travessia",
        "resumo": "No romance do autor de A Cabana, Tony Spencer, um empresário egoísta, entra em coma e desperta numa terra que espelha a sua própria alma — e recebe a chance de voltar para curar uma única pessoa.",
        "aulas": [
            ("Capítulo 1 - Uma tempestade se aproxima", 9, 27),
            ("Capítulo 2 - Do pó ao pó", 28, 36),
            ("Capítulo 3 - Era uma vez...", 37, 58),
            ("Capítulo 4 - O lar é onde está o coração", 59, 73),
            ("Capítulo 5 - Eis que surge um homem", 74, 94),
            ("Capítulo 6 - Discussões acaloradas", 95, 105),
            ("Capítulo 7 - Deixando-se levar", 106, 116),
            ("Capítulo 8 - O que é a alma de um homem?", 117, 130),
            ("Capítulo 9 - Alvoroço na congregação", 131, 148),
            ("Capítulo 10 - Duas mentes", 149, 163),
            ("Capítulo 11 - Entre dois mundos", 164, 174),
            ("Capítulo 12 - A trama se complica", 175, 191),
            ("Capítulo 13 - A guerra interna", 192, 223),
            ("Capítulo 14 - Cara a cara", 224, 244),
            ("Capítulo 15 - O Templo", 245, 252),
            ("Capítulo 16 - Uma fatia de torta", 253, 266),
            ("Capítulo 17 - Portas trancadas", 267, 282),
            ("Capítulo 18 - A travessia", 283, 284),
            ("Capítulo 19 - A dádiva", 285, 300),
            ("Capítulo 20 - Agora", 301, 302),
            ("Nota ao leitor e agradecimentos", 303, 307),
        ],
        "minimo": 300,
        "descartar": [r"^kl$"],
    },
    {
        "migration": 331,
        "slug": "de-volta-a-cabana",
        "titulo": "De Volta à Cabana",
        "autor": "C. Baxter Kruger",
        "categoria": "ensino",
        "arquivo": "A cabana - De volta",
        "resumo": "O teólogo C. Baxter Kruger percorre a teologia por trás do romance A Cabana: quem é o Pai, a Trindade como relacionamento e o lugar da humanidade no amor do Deus trino.",
        "descartar": [r"^q$"],
        # Neste PDF o capitulo comeca no meio da pagina: a mesa vai do seu
        # titulo ("de") ate o titulo seguinte ("ate").
        "aulas": [
            ("Apresentação, por William P. Young", 5, 8, {"de": r"^apresentação$", "ate": r"^introdução$"}),
            ("Introdução", 8, 17, {"de": r"^introdução$", "ate": r"^parte i+$"}),
            ("Parte I - A surpresa", 17, 20, {"de": r"^A surpresa$", "ate": r"^O Deus que dança$"}),
            ("Parte I - O Deus que dança", 20, 23, {"de": r"^O Deus que dança$", "ate": r"^A luz de Lewis$"}),
            ("Parte I - A luz de Lewis", 23, 26, {"de": r"^A luz de Lewis$", "ate": r"^O que existe em um nome\?$"}),
            ("Parte I - O que existe em um nome?", 26, 29, {"de": r"^O que existe em um nome\?$", "ate": r"^Os dois deuses$"}),
            ("Parte I - Os dois deuses", 29, 34, {"de": r"^Os dois deuses$", "ate": r"^parte i+$"}),
            ("Parte II - A história maior", 34, 37, {"de": r"^A história maior$", "ate": r"^Jesus e seu Pai$"}),
            ("Parte II - Jesus e seu Pai", 37, 41, {"de": r"^Jesus e seu Pai$", "ate": r"^O Espírito Santo$"}),
            ("Parte II - O Espírito Santo", 41, 49, {"de": r"^O Espírito Santo$", "ate": r"^A unidade do Pai, do Filho e do Espírito Santo$"}),
            ("Parte II - A unidade do Pai, do Filho e do Espírito Santo", 49, 52, {"de": r"^A unidade do Pai, do Filho e do Espírito Santo$", "ate": r"^O amor do Deus Trino$"}),
            ("Parte II - O amor do Deus Trino", 52, 57, {"de": r"^O amor do Deus Trino$", "ate": r"^O Jesus verdadeiro$"}),
            ("Parte II - O Jesus verdadeiro", 57, 64, {"de": r"^O Jesus verdadeiro$", "ate": r"^parte i+$"}),
            ("Parte III - O grande quadro", 64, 66, {"de": r"^O grande quadro$", "ate": r"^O ventre da encarnação$"}),
            ("Parte III - O ventre da encarnação", 66, 69, {"de": r"^O ventre da encarnação$", "ate": r"^Graça$"}),
            ("Parte III - Graça", 69, 71, {"de": r"^Graça$", "ate": r"^Adão e Israel$"}),
            ("Parte III - Adão e Israel", 71, 73, {"de": r"^Adão e Israel$", "ate": r"^A rejeição do Filho ungido$"}),
            ("Parte III - A rejeição do Filho ungido", 73, 79, {"de": r"^A rejeição do Filho ungido$", "ate": r"^A maravilhosa troca$"}),
            ("Parte III - A maravilhosa troca", 79, 82, {"de": r"^A maravilhosa troca$", "ate": r"^O segredo$"}),
            ("Parte III - O segredo", 82, 88, {"de": r"^O segredo$", "ate": r"^Permaneça em mim$"}),
            ("Parte III - Permaneça em mim", 88, 91, {"de": r"^Permaneça em mim$", "ate": r"^O Espírito da adoção$"}),
            ("Parte III - O Espírito da adoção", 91, 102, {"de": r"^O Espírito da adoção$", "ate": r"^Agradecimentos$"}),
            ("Apêndice - Citações sobre nossa inclusão na morte de Jesus", 104, 107, {"de": r"^nossa inclusão na morte de Jesus$", "ate": r"^Sugestões para outros estudos$"}),
        ],
    },
    {
        "migration": 332,
        "slug": "as-mentiras-que-nos-contaram-sobre-deus",
        "titulo": "As Mentiras que nos Contaram sobre Deus",
        "autor": "William P. Young",
        "categoria": "ensino",
        "arquivo": "As mentiras que nos contaram",
        "resumo": "William P. Young examina vinte e oito frases que se repetem sobre Deus — \"Deus está no controle\", \"Deus está decepcionado comigo\" — e as confronta com o Deus que se revela em Jesus.",
        "titulo_min": 1.3,
        "aulas": [
            ("Introdução", 7, 10),
            ("1. “Deus nos ama, mas não gosta de nós.”", 11, 14),
            ("2. “Deus é bom. Eu não sou.”", 15, 19),
            ("3. “Deus está no controle.”", 20, 24),
            ("4. “Deus não se submete.”", 25, 28),
            ("5. “Deus é cristão.”", 29, 33),
            ("6. “Deus quer me usar.”", 34, 37),
            ("7. “Deus é mais masculino do que feminino.”", 38, 44),
            ("8. “Deus quer ser prioridade na sua vida.”", 45, 48),
            ("9. “Deus é um mágico.”", 49, 55),
            ("10. “Deus não gosta de sexo.”", 56, 59),
            ("11. “Deus abençoa meus políticos.”", 60, 64),
            ("12. “Deus criou a (minha) religião.”", 65, 69),
            ("13. “Você precisa ser salvo.”", 70, 74),
            ("14. “Deus não liga para o que eu amo fazer.”", 75, 79),
            ("15. “O inferno é a separação de Deus.”", 80, 83),
            ("16. “Deus não é bondoso.”", 84, 88),
            ("17. “A Cruz foi ideia de Deus.”", 89, 92),
            ("18. “Aquilo foi mera coincidência.”", 93, 98),
            ("19. “Deus exige o sacrifício de crianças.”", 99, 103),
            ("20. “Deus é um Papai Noel divino.”", 104, 108),
            ("21. “A morte é mais poderosa do que Deus.”", 109, 113),
            ("22. “Deus não está presente em meu sofrimento.”", 114, 118),
            ("23. “Você nunca encontrará Deus numa caixa.”", 119, 122),
            ("24. “Nem todo mundo é filho de Deus.”", 123, 126),
            ("25. “Deus está decepcionado comigo.”", 127, 131),
            ("26. “Deus me ama por meu potencial.”", 132, 135),
            ("27. “O pecado nos separa de Deus.”", 136, 141),
            ("28. “Deus é apenas Um.”", 142, 145),
            ("Uma catena - O drama da redenção de Deus", 146, 151),
            ("Posfácio, por C. Baxter Kruger", 152, 158),
            ("Últimas palavras, por Dietrich Bonhoeffer", 159, 160),
        ],
        "minimo": 500,
    },
    {
        "migration": 333,
        "slug": "anjos-heiser",
        "titulo": "Anjos",
        "autor": "Michael S. Heiser",
        "categoria": "ensino",
        "arquivo": "ANJOS",
        "resumo": "Michael S. Heiser reúne o que a Bíblia realmente diz sobre o exército celestial de Deus — os termos do Antigo Testamento, o judaísmo do Segundo Templo, o Novo Testamento — e desfaz mitos populares sobre os anjos.",
        "nota_em_span": True,
        # Dois quadros de tres colunas so com referencias (termos e passagens)
        # que o PDF nao deixa reconstruir com seguranca.
        "omitir": [
            (116, 595, 120, 600, "[O quadro comparativo do original — termos da Bíblia Hebraica, dos textos do Segundo Templo e da Septuaginta, com as respectivas passagens — não foi reproduzido nesta transcrição.]"),
            (124, 80, 128, 190, "[O quadro do original — passagens em que a Septuaginta traduz “deuses” e “filhos de Deus” por “anjos” e passagens em que preserva o plural — não foi reproduzido nesta transcrição.]"),
        ],
        "aulas": [
            ("Introdução", 15, 25, {"pular": 1}),
            ("Capítulo 1 - Terminologia do Antigo Testamento para o exército celestial", 26, 57),
            ("Capítulo 2 - O exército celestial a serviço de Deus", 58, 93),
            ("Capítulo 3 - Anjos importantes", 94, 114),
            ("Capítulo 4 - A linguagem do exército celestial no judaísmo do Segundo Templo", 115, 131, {"pular": 3}),
            ("Capítulo 5 - Angelologia judaica do Segundo Templo", 132, 165),
            ("Capítulo 6 - O exército celestial no Novo Testamento", 166, 191),
            ("Capítulo 7 - Tópicos especiais na angelologia do Novo Testamento", 192, 218),
            ("Capítulo 8 - Mitos e perguntas sobre anjos", 219, 235),
        ],
        "pular_linhas_iniciais": 2,
    },
    {
        "migration": 334,
        "slug": "anjos-e-demonios",
        "titulo": "Anjos e Demônios",
        "autor": "Benny Hinn",
        "categoria": "espiritual",
        "arquivo": "Benny Hinn",
        "resumo": "Benny Hinn apresenta o que as Escrituras dizem sobre os seres angelicais, sobre os demônios e sobre a batalha espiritual, até a agenda de Deus para o fim dos tempos.",
        "descartar": [r"^cap[ií]tulo \d+$", r"^parte i+$"],
        "aulas": [
            ("Introdução", 7, 8),
            ("Capítulo 1 - Os surpreendentes seres angelicais de Deus", 12, 22),
            ("Capítulo 2 - O serafim com seis asas", 23, 25),
            ("Capítulo 3 - O querubim com quatro rostos", 26, 31),
            ("Capítulo 4 - Os seres viventes", 32, 37),
            ("Capítulo 5 - Os arcanjos da autoridade", 38, 50),
            ("Capítulo 6 - Os anjos “comuns”", 51, 60),
            ("Capítulo 7 - O maravilhoso trabalho dos anjos", 61, 86),
            ("Capítulo 8 - Face a face com os demônios", 90, 106),
            ("Capítulo 9 - Os gigantes na terra", 107, 115),
            ("Capítulo 10 - Cuidado com o grande impostor", 116, 129),
            ("Capítulo 11 - Os 12 espíritos", 130, 142),
            ("Capítulo 12 - Arranque a armadura do Diabo", 143, 154),
            ("Capítulo 13 - A arma secreta contra o Inimigo", 155, 173),
            ("Capítulo 14 - A agenda de Deus relacionada ao fim dos tempos", 177, 188),
        ],
    },
    {
        "migration": 335,
        "slug": "em-defesa-do-criador",
        "titulo": "Em Defesa do Criador",
        "autor": "Lee Strobel",
        "categoria": "cultura",
        "arquivo": "Em defesa dO Criador",
        "resumo": "O jornalista Lee Strobel entrevista cientistas e filósofos sobre cosmologia, física, astronomia, bioquímica, informação biológica e consciência, e pergunta se as evidências apontam para um Criador.",
        "aulas": [
            ("Capítulo 1 - Cientistas de jaleco branco versus pregadores de batina", 10, 26),
            ("Capítulo 2 - As imagens da evolução", 27, 47),
            ("Capítulo 3 - Dúvidas sobre o darwinismo", 48, 110),
            ("Capítulo 4 - Onde a ciência encontra a fé", 111, 149),
            ("Capítulo 5 - As evidências da cosmologia: começando com uma explosão", 150, 199),
            ("Capítulo 6 - As evidências da física: o cosmos no fio da navalha", 200, 244),
            ("Capítulo 7 - As evidências da astronomia: o planeta privilegiado", 245, 309),
            ("Capítulo 8 - As evidências da bioquímica: a complexidade das máquinas moleculares", 310, 350),
            ("Capítulo 9 - As evidências da informação biológica: o desafio do DNA e a origem da vida", 351, 395),
            ("Capítulo 10 - As evidências da consciência: o enigma da mente", 396, 438),
            ("Capítulo 11 - O caso cumulativo para um Criador", 439, 470),
            ("Apêndice - Um resumo de Em Defesa de Cristo", 471, 479),
        ],
        # O arquivo traz o titulo do capitulo com erros de traducao ("PREDADORES
        # DE TONA PRETA", "GRANDE ESTRINDO"); o titulo certo ja esta na mesa.
        "pular_titulo_caixa_alta": True,
    },
    {
        "migration": 336,
        "slug": "o-verdadeiro-evangelho",
        "titulo": "O Verdadeiro Evangelho",
        "autor": "Paul Washer",
        "categoria": "ensino",
        "arquivo": "O Verdadeiro Evangelho",
        "resumo": "A partir de Romanos 3, Paul Washer expõe a mensagem central da Escritura: a pecaminosidade humana, a justiça de Deus e a cruz em que Cristo foi feito pecado por nós.",
        "corpo_min": 9.5,
        "aulas": [
            ("Prefácio", 8, 13),
            ("Introdução", 14, 21),
            ("Capítulo 1 - A extrema pecaminosidade humana", 22, 39),
            ("Capítulo 2 - Deus odeia o pecado e o pecador", 40, 53),
            ("Capítulo 3 - Completamente justos", 54, 65),
            ("Capítulo 4 - O maior problema das Escrituras", 66, 77),
            ("Capítulo 5 - Deus o fez pecado por nós", 78, 97),
            ("Conclusão - Ele é o Rei da glória", 98, 107),
            ("Apêndice - Um modelo de pregação do evangelho", 108, 115),
        ],
    },
    {
        "migration": 337,
        "slug": "quando-pecadores-dizem-sim",
        "titulo": "Quando Pecadores Dizem “Sim”",
        "autor": "Dave Harvey",
        "categoria": "pastoral",
        "arquivo": "QUANDO PECADORES",
        "resumo": "Dave Harvey mostra que o casamento une dois pecadores e que é o evangelho — misericórdia, perdão, graça perseverante — que sustenta a vida a dois.",
        "ligadura_fi": True,
        "sem_capitular": True,
        # As capitulares deste PDF sao desenho, nao texto: o capitulo comeca em
        # "ocê pode estar curioso". O capitulo 3 (ordem 5) abre com data, sem capitular.
        "capitulares": {1: "E", 2: "V", 3: "F", 4: "A", 6: "Q", 7: "G", 8: "O ", 9: "D", 10: "S", 11: "N", 12: "E"},
        "aulas": [
            ("Apresentação", 8, 9),
            ("Prefácio", 10, 13),
            ("Capítulo 1 - O que realmente importa no casamento", 14, 28),
            ("Capítulo 2 - Acordando com o pior dos pecadores", 29, 39),
            ("Capítulo 3 - A névoa da guerra e a lei do pecado", 40, 53),
            ("Capítulo 4 - Colocando a doutrina em prática", 54, 67),
            ("Capítulo 5 - A misericórdia triunfa sobre o juízo", 68, 87),
            ("Capítulo 6 - Perdão, pleno e gratuito", 88, 105),
            ("Capítulo 7 - O cirurgião, o bisturi e o cônjuge em pecado", 106, 123),
            ("Capítulo 8 - Graça resoluta", 124, 138),
            ("Capítulo 9 - Sobre sexo", 139, 155),
            ("Capítulo 10 - Quando pecadores dizem adeus", 156, 169),
        ],
    },
    {
        "migration": 338,
        "slug": "desconforme-se",
        "titulo": "Desconforme-se",
        "autor": "Richarde Guerra",
        "categoria": "cultura",
        "arquivo": "Desconforme-se",
        "resumo": "Richarde Guerra confronta as cosmovisões que moldam a nossa época — relativismo, cientificismo, individualismo, consumismo, pragmatismo — com a mente renovada de Romanos 12.",
        "aulas": [
            ("Prefácio", 5, 7, {"de": r"^pref[aá]cio$"}),
            ("O chamado para desconformar-se", 8, 16),
            ("Capítulo 1 - Cada cabeça, uma sentença", 17, 40),
            ("Capítulo 2 - O Senhor de fato(s)", 41, 64),
            ("Capítulo 3 - Um vazio do tamanho de Deus", 65, 86),
            ("Capítulo 4 - O novo d(EU)s", 87, 111),
            ("Capítulo 5 - Tenho, logo existo", 112, 135),
            ("Capítulo 6 - Isso não funciona!", 136, 160),
            ("Um passo além do desconformismo", 161, 169),
        ],
    },
    {
        "migration": 339,
        "slug": "a-predestinacao-wesley",
        "titulo": "A Predestinação",
        "autor": "John Wesley",
        "categoria": "espiritual",
        "arquivo": "John Wesley - Porque os que dantes",
        "resumo": "No sermão 58, sobre Romanos 8.29-30 (\"os que dantes conheceu\"), John Wesley explica presciência, predestinação, chamado, justificação e glorificação.",
        "aulas": [("A Predestinação", 4, 24, {"ate": r"^sobre o autor"})],
        "descartar": [r"^projecto wesley\b"],
    },
    {
        "migration": 340,
        "slug": "salvacao-pela-fe-wesley",
        "titulo": "Salvação pela Fé",
        "autor": "John Wesley",
        "categoria": "espiritual",
        "arquivo": "John Wesley - Salva",
        "resumo": "Pregado em Oxford em 18 de junho de 1738, o sermão de John Wesley sobre Efésios 2.8 trata de que fé é essa que salva, de que salvação ela traz e das objeções que se levantam contra ela.",
        "aulas": [("Salvação pela Fé", 4, 25)],
        "descartar": [r"^bibliotecaarminiana\b"],
    },
    {
        "migration": 341,
        "slug": "romanos-9-wesley",
        "titulo": "Romanos 9",
        "autor": "John Wesley",
        "categoria": "ensino",
        "arquivo": "John Wesley - Romanos 9",
        "resumo": "As notas de John Wesley, versículo a versículo, sobre Romanos 9: a rejeição de Israel, a recepção dos gentios e por que o capítulo não trata de eleição ou reprovação pessoais.",
        "sem_titulo_negrito": True,
        "corpo_min": 10.5,
        "trocas": [(r"\d+\[\d+\]", "")],
        "aulas": [("Romanos 9", 3, 8)],
        "descartar": [r"^http://projectowesley"],
        "pular_linhas_iniciais": 2,
    },
]

NUMEROS = {
    1: "uma", 9: "nove", 10: "dez", 12: "doze", 15: "quinze", 21: "vinte e uma",
    23: "vinte e três", 32: "trinta e duas",
}
TRANSLATE = str.maketrans({"ﬁ": "fi", "ﬂ": "fl", "­": "", " ": " ", " ": " ", "​": ""})
CLITICOS = {
    "se", "me", "te", "lhe", "lhes", "nos", "vos", "o", "a", "os", "as", "lo", "la",
    "los", "las", "no", "na", "nas", "lo-á", "se-á",
}
FIM_DE_FRASE = tuple(".!?…:;”\"»)’'")


def simplify(value: str) -> str:
    value = unicodedata.normalize("NFKD", value).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", " ", value.lower()).strip()


def achar_arquivo(prefixo: str) -> Path:
    alvo = simplify(prefixo)
    for origem in ORIGENS:
        if not origem.is_dir():
            continue
        achados = [
            p for p in origem.iterdir()
            if p.suffix.lower() in (".pdf", ".mobi", ".epub") and simplify(p.name).startswith(alvo)
        ]
        if len(achados) == 1:
            return achados[0]
        if len(achados) > 1:
            raise ValueError(f"Mais de um arquivo para {prefixo!r}: {achados}")
    raise FileNotFoundError(f"Nenhum arquivo para {prefixo!r} em {ORIGENS}")


def linhas_da_pagina(page: fitz.Page, nota_em_span: bool = False) -> list[dict]:
    """Linhas visuais da pagina, com posicao, corpo dominante e negrito."""
    brutas = []
    for block in page.get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            if any(s["text"].strip() for s in line["spans"]):
                brutas.append((tuple(line["bbox"]), line["spans"]))
    brutas.sort(key=lambda item: item[0][1])
    alturas = sorted(b[3] - b[1] for b, _ in brutas)
    mediana = alturas[len(alturas) // 2] if alturas else 0

    # O PyMuPDF as vezes entrega a mesma linha visual em pedacos; junta os que
    # se sobrepoem na vertical. Capitular (bem mais alta) fica de fora, senao
    # engoliria as duas ou tres linhas que ela acompanha.
    grupos: list[list] = []
    for bbox, spans in brutas:
        alta = bbox[3] - bbox[1] > 1.6 * mediana
        if grupos and not alta and not grupos[-1][2]:
            y0, y1 = grupos[-1][0][1], grupos[-1][0][3]
            sobreposicao = min(y1, bbox[3]) - max(y0, bbox[1])
            if sobreposicao > 0.6 * min(y1 - y0, bbox[3] - bbox[1]):
                grupos[-1][0] = (min(grupos[-1][0][0], bbox[0]), min(y0, bbox[1]),
                                 max(grupos[-1][0][2], bbox[2]), max(y1, bbox[3]))
                grupos[-1][1].append((bbox, spans))
                continue
        grupos.append([bbox, [(bbox, spans)], alta])

    linhas = []
    for bbox, pedacos, _ in grupos:
        pedacos.sort(key=lambda item: item[0][0])
        tamanhos: Counter[float] = Counter()
        for _, spans in pedacos:
            for span in spans:
                tamanhos[round(span["size"], 1)] += len(span["text"].strip())
        dominante = tamanhos.most_common(1)[0][0]
        texto = ""
        negrito = 0
        total = 0
        fim_anterior = None
        for pbbox, spans in pedacos:
            if fim_anterior is not None and pbbox[0] - fim_anterior > 1.5 and not texto.endswith(" "):
                texto += " "
            for span in spans:
                t = span["text"].translate(TRANSLATE)
                miolo = t.strip()
                if miolo.isdigit() and len(miolo) <= 3:
                    # Chamada de nota: algarismo sobrescrito, bem menor que a
                    # linha ou (calibre) num span proprio colado na palavra.
                    colado = bool(texto) and not texto.endswith(" ") and not t.startswith(" ")
                    if span["flags"] & 1 or span["size"] < 0.8 * dominante or (nota_em_span and colado):
                        continue
                texto += t
                total += len(miolo)
                if "bold" in span["font"].lower() or span["flags"] & 16:
                    negrito += len(miolo)
            fim_anterior = pbbox[2]
        texto = re.sub(r"\s+", " ", texto).strip()
        if not texto:
            continue
        linhas.append({
            "x0": bbox[0], "y0": bbox[1], "x1": bbox[2], "y1": bbox[3],
            "texto": texto,
            "tamanho": dominante,
            "negrito": total > 0 and negrito >= 0.9 * total,
        })
    return linhas


def juntar(partes: list[str], vocab: Counter) -> str:
    """Junta as linhas de um paragrafo. Hifen no fim da linha pode ser quebra
    de silaba ("fos-" + "se") ou hifen de verdade ("tornou-" + "se"); quem
    decide e o proprio livro: vale a forma que aparece no meio de alguma linha."""
    texto = ""
    for parte in partes:
        if not texto:
            texto = parte
            continue
        if texto.endswith("-") and parte.startswith("-"):
            texto = texto[:-1] + parte  # "menciona-" + "-las": hifen repetido na quebra
        elif texto.endswith("-") and re.match(r"^[a-zà-ÿ]", parte):
            antes = re.search(r"[A-Za-zÀ-ÿ]+(?:-[A-Za-zÀ-ÿ]+)*-$", texto)
            depois = re.match(r"^[a-zà-ÿ]+(?:-[a-zà-ÿ]+)*", parte).group(0)
            esquerda = antes.group(0)[:-1].lower() if antes else ""
            if esquerda and (esquerda + depois) in vocab:
                texto = texto[:-1] + parte
            elif esquerda and (f"{esquerda}-{depois}" in vocab or (depois in CLITICOS and esquerda in vocab)):
                texto += parte
            else:
                texto = texto[:-1] + parte
        else:
            texto += " " + parte
    texto = re.sub(r"\s+([,.;:!?])", r"\1", texto)
    return re.sub(r"\s+", " ", texto).strip()


class Livro:
    def __init__(self, book: dict):
        self.book = book
        self.doc = fitz.open(achar_arquivo(book["arquivo"]))
        self.paginas = {}
        primeira = min(a[1] for a in book["aulas"])
        ultima = max(a[2] for a in book["aulas"])
        for n in range(primeira, ultima + 1):
            self.paginas[n] = linhas_da_pagina(self.doc[n - 1], book.get("nota_em_span", False))
        self.altura = self.doc[primeira - 1].rect.height
        tamanhos: Counter[float] = Counter()
        self.vocab: Counter[str] = Counter()
        for linhas in self.paginas.values():
            for linha in linhas:
                tamanhos[linha["tamanho"]] += len(linha["texto"])
                palavras = re.findall(r"[A-Za-zÀ-ÿ]+(?:-[A-Za-zÀ-ÿ]+)*", linha["texto"])
                if linha["texto"].endswith("-") and palavras:
                    palavras = palavras[:-1]
                self.vocab.update(w.lower() for w in palavras)
        self.corpo = tamanhos.most_common(1)[0][0]
        # Conversao que muda o corpo do texto no meio do livro: o que e titulo
        # passa a ser medido contra o corpo dominante de cada pagina.
        self.corpo_livro = self.corpo
        self.corpo_pagina = {}
        if book.get("corpo_por_pagina"):
            for n, linhas in self.paginas.items():
                da_pagina: Counter[float] = Counter()
                for linha in linhas:
                    da_pagina[linha["tamanho"]] += len(linha["texto"])
                if sum(da_pagina.values()) >= 300:
                    self.corpo_pagina[n] = da_pagina.most_common(1)[0][0]
        self.titulo_min = book.get("titulo_min", 1.12)
        self.corpo_min = book.get("corpo_min", 0)
        self.descartar = [re.compile(p, re.IGNORECASE) for p in book.get("descartar", [])]
        self._cabecalhos()
        self._margens()
        if book.get("figuras"):
            self._figuras()

    def _figuras(self) -> None:
        """Livro ilustrado: cada ilustracao vira um arquivo em public/figuras e
        entra no texto, na altura em que aparece na pagina, como um paragrafo
        "[figura] caminho" — o marcador que lib/estrutura-livro.ts ja conhece."""
        pasta = ROOT / "public/figuras" / self.book["slug"]
        pasta.mkdir(parents=True, exist_ok=True)
        for n, linhas in self.paginas.items():
            pagina = self.doc[n - 1]
            imagens = [i for i in pagina.get_image_info() if i["bbox"][2] - i["bbox"][0] > 120]
            imagens.sort(key=lambda i: i["bbox"][1])
            for k, imagem in enumerate(imagens):
                caixa = fitz.Rect(imagem["bbox"]) & pagina.rect
                nome = f"p{n:03d}.jpg" if len(imagens) == 1 else f"p{n:03d}-{k + 1}.jpg"
                # Recorte da pagina (e nao o arquivo embutido): ja sai sobre
                # fundo branco, sem depender de mascara de transparencia.
                escala = min(imagem["width"], 760) / caixa.width
                pix = pagina.get_pixmap(matrix=fitz.Matrix(escala, escala), clip=caixa, colorspace=fitz.csGRAY, alpha=False)
                (pasta / nome).write_bytes(pix.tobytes("jpeg", jpg_quality=72))
                linhas.append({
                    "x0": caixa.x0, "y0": caixa.y0, "x1": caixa.x1, "y1": caixa.y1,
                    "texto": f"[figura] /figuras/{self.book['slug']}/{nome}",
                    "tamanho": self.corpo, "negrito": False, "nota": True,
                })

    def _cabecalhos(self) -> None:
        """Cabecalho corrido e rodape: linha curta nas faixas de cima/baixo
        que se repete (sem contar o numero da pagina) em varias paginas."""
        contagem: Counter[str] = Counter()
        for linhas in self.paginas.values():
            vistos = set()
            for linha in linhas:
                if self._na_borda(linha) and len(linha["texto"]) < 90:
                    vistos.add(re.sub(r"\d+", "", simplify(linha["texto"])).strip())
            contagem.update(v for v in vistos if v)
        limite = max(4, len(self.paginas) // 25)
        self.repetidos = {chave for chave, n in contagem.items() if n >= limite}

    def _eh_corpo(self, tamanho: float) -> bool:
        # Ha livro que alterna 10.0 e 10.4 de um capitulo para o outro.
        return abs(tamanho - self.corpo) <= 0.5

    def _na_borda(self, linha: dict) -> bool:
        return linha["y1"] < 0.105 * self.altura or linha["y0"] > 0.9 * self.altura

    def _margens(self) -> None:
        """Margem direita por pagina (par e impar nao batem) e se o livro e
        justificado — so ai "linha curta" quer dizer fim de paragrafo."""
        self.direita = {}
        cheias = 0
        total = 0
        for n, linhas in self.paginas.items():
            self.corpo = self.corpo_pagina.get(n, self.corpo_livro)
            xs = [round(l["x1"]) for l in linhas if self._eh_corpo(l["tamanho"]) and len(l["texto"]) > 40]
            if not xs:
                self.direita[n] = 0
                continue
            # Linha que termina em espaco avanca uns pontos alem da margem;
            # a moda e a margem de verdade.
            self.direita[n] = Counter(xs).most_common(1)[0][0]
            cheias += sum(1 for x in xs if abs(x - self.direita[n]) <= 4)
            total += len(xs)
        self.justificado = total > 0 and cheias / total > 0.55
        self.corpo = self.corpo_livro
        # Livro em espaco duplo ("espaco_duplo"): o espaco entre linhas do
        # mesmo paragrafo ja passa do limite normal, entao o limite sobe junto
        # com a entrelinha medida no proprio livro.
        saltos = []
        for linhas in self.paginas.values():
            corpo = [l for l in linhas if self._eh_corpo(l["tamanho"]) and len(l["texto"]) > 40]
            for a, b in zip(corpo, corpo[1:]):
                if 0 <= b["y0"] - a["y1"] < 3 * (a["y1"] - a["y0"]):
                    saltos.append((b["y0"] - a["y1"]) / max(a["y1"] - a["y0"], 1))
        saltos.sort()
        mediana = saltos[len(saltos) // 2] if saltos else 0
        self.salto = mediana + 0.4 if self.book.get("espaco_duplo") else self.book.get("salto", 0.45)

    def _ruido(self, linha: dict) -> bool:
        texto = linha["texto"]
        if re.fullmatch(r"(?:p[aá]gina\s+)?\d{1,4}", texto, re.IGNORECASE):
            return True
        if any(p.search(texto) for p in self.descartar):
            return True
        if linha["tamanho"] < self.corpo_min:
            return True  # nota de rodape
        if self._na_borda(linha) and len(texto) < 90:
            chave = re.sub(r"\d+", "", simplify(texto)).strip()
            if chave in self.repetidos:
                return True
            # "22 O Verdadeiro Evangelho" / "Introducao 15": cabecalho com o
            # numero da pagina, em corpo diferente do texto.
            if not self._eh_corpo(linha["tamanho"]) and re.search(r"^\d{1,3}\s+\S|\S\s+\d{1,3}$", texto):
                return True
        return False

    def _titulo(self, linha: dict) -> bool:
        if linha["tamanho"] >= self.corpo * self.titulo_min:
            return True
        if self.book.get("sem_titulo_negrito"):
            return False
        return (
            linha["negrito"]
            and len(linha["texto"]) <= 90
            and not linha["texto"].endswith((".", ",", ";"))
            and linha["tamanho"] >= self.corpo * 0.98
        )

    def _capitular(self, letra: str, linha: dict) -> None:
        """Cola a capitular na linha que ela abre: "V" + "ocê", mas "A" + " primeira"."""
        primeira = re.match(r"^[a-zà-ÿ]+", linha["texto"])
        colada = (letra + primeira.group(0)).lower() if primeira else ""
        if letra.upper() in "AEOÉÀ" and colada not in self.vocab:
            linha["texto"] = f"{letra} {linha['texto']}"
        else:
            linha["texto"] = letra + linha["texto"]

    def aula(self, ordem: int, inicio: int, fim: int, opts: dict) -> str:
        paragrafos: list[dict] = []  # {"tipo": "p"|"h", "linhas": [...], "ultima": linha}
        pular = opts.get("pular", self.book.get("pular_linhas_iniciais", 0))
        omitir = self.book.get("omitir", [])
        de = re.compile(opts["de"], re.IGNORECASE) if opts.get("de") else None
        ate = re.compile(opts["ate"], re.IGNORECASE) if opts.get("ate") else None
        abertura = True  # ainda no bloco de titulo que abre o capitulo
        acabou = False
        for n in range(inicio, fim + 1):
            if acabou:
                break
            self.corpo = self.corpo_pagina.get(n, self.corpo_livro)
            linhas = [l for l in self.paginas[n] if not self._ruido(l)]
            # Corte pela posicao que o sumario embutido aponta: a mesa pode
            # comecar e terminar no meio da pagina.
            if n == inicio and "y_ini" in opts:
                linhas = [l for l in linhas if l["y0"] >= opts["y_ini"] - 3]
            if n == fim and "y_fim" in opts:
                linhas = [l for l in linhas if l["y0"] < opts["y_fim"] - 3]
            # Trecho que nao vira prosa (tabela de referencias): sai, e fica
            # uma nota no lugar para o leitor saber que havia algo ali.
            for p0, y0, p1, y1, nota in omitir:
                dentro = [l for l in linhas if (n, l["y0"]) >= (p0, y0) and (n, l["y0"]) < (p1, y1)]
                if dentro:
                    linhas = [l for l in linhas if l not in dentro]
                    if n == p0:
                        linhas.append({**dentro[0], "texto": nota, "x1": dentro[0]["x0"] + 1, "nota": True})
            limpas = []
            capitular = ""
            for linha in linhas:
                # Capitular solta (uma letra grande numa linha propria).
                if (
                    not self.book.get("sem_capitular")
                    and len(linha["texto"]) == 1
                    and linha["texto"].isalpha()
                    and linha["tamanho"] >= self.corpo * 1.5
                ):
                    capitular = linha["texto"]
                    continue
                limpas.append(dict(linha))
            limpas.sort(key=lambda l: (l["y0"], l["x0"]))
            if capitular:
                for linha in limpas:
                    if not self._titulo(linha) and re.match(r"^[a-zà-ÿ]", linha["texto"]):
                        self._capitular(capitular, linha)
                        break

            corpo_x = [round(l["x0"]) for l in limpas if not self._titulo(l) and len(l["texto"]) > 40]
            margem = min(Counter(corpo_x).most_common(2), key=lambda par: par[0])[0] if corpo_x else 0
            direita = self.direita.get(n, 0)
            anterior = None
            for linha in limpas:
                if de is not None:
                    achou = de.search(linha["texto"])
                    if not achou:
                        continue
                    de = None
                    # Conversao que achatou o titulo na primeira linha do texto:
                    # o que sobra depois do titulo ja e o capitulo.
                    resto = linha["texto"][achou.end():].strip()
                    if not resto:
                        continue
                    linha["texto"] = resto
                if ate is not None and ate.search(linha["texto"]):
                    acabou = True
                    break
                if pular:
                    pular -= 1
                    continue
                eh_titulo = self._titulo(linha)
                if abertura:
                    if self.book.get("manter_abertura"):
                        pass  # coletanea: o titulo de cada leitura fica no texto
                    elif eh_titulo or (
                        self.book.get("pular_titulo_caixa_alta")
                        and linha["texto"].upper() == linha["texto"]
                        and len(linha["texto"]) < 80
                    ):
                        continue  # o titulo do capitulo ja e o titulo da mesa
                    abertura = False
                    letra = self.book.get("capitulares", {}).get(ordem)
                    if letra:
                        linha["texto"] = letra + linha["texto"]
                tipo = "h" if eh_titulo else "p"
                meio = (margem + direita) / 2
                centrada = (
                    linha["x0"] > margem + 12 and linha["x1"] < direita - 12
                    and abs((linha["x0"] + linha["x1"]) / 2 - meio) < 25
                )
                marcador = linha.get("nota", False) or bool(re.match(r"^(?:[•●▪■◦]|\d{1,2}\.\s?[“\"A-ZÀ-Ý])", linha["texto"]))
                novo = True
                if paragrafos and anterior is not None:
                    ultimo = paragrafos[-1]
                    altura = max(anterior["y1"] - anterior["y0"], 1)
                    espaco = linha["y0"] - anterior["y1"]
                    mesmo_corpo = abs(linha["tamanho"] - anterior["tamanho"]) <= 0.6
                    if tipo != ultimo["tipo"]:
                        novo = True
                    elif tipo == "h":
                        novo = espaco > 1.6 * altura or not mesmo_corpo
                    elif anterior.get("nota") or marcador:
                        novo = True
                    elif anterior["texto"].endswith("-") and re.match(r"^[-a-zà-ÿ]", linha["texto"]):
                        novo = False  # palavra partida nao atravessa paragrafo
                    elif self.book.get("centralizado"):
                        # Livro inteiro centralizado: nao ha margem nem recuo. Fecha
                        # paragrafo a linha curta que termina frase, ou a que
                        # termina na referencia do versiculo ("Efesios 4:2").
                        maior = max(l["x1"] - l["x0"] for l in limpas)
                        curta = anterior["x1"] - anterior["x0"] < 0.8 * maior
                        fecha = anterior["texto"].endswith(FIM_DE_FRASE) and curta
                        versiculo = re.search(r"\d:\d+(?:-\d+)?\)?$", anterior["texto"])
                        novo = espaco > self.salto * altura or fecha or bool(versiculo)
                    elif (not self._eh_corpo(linha["tamanho"]) and mesmo_corpo) or (centrada and ultimo["centrada"]):
                        # Destaque em corpo proprio ou epigrafe centralizada: so o espaco separa.
                        novo = espaco > self.salto * altura
                    else:
                        # Recuo pendente de item de lista nao abre paragrafo.
                        pendente = ultimo["marcador"] and len(ultimo["linhas"]) == 1
                        recuo = linha["x0"] - anterior["x0"] > 4 and not pendente
                        # "Curta" e relativa a largura do trecho: citacao em
                        # bloco tem margem direita propria.
                        largura = min(direita, max(ultimo["x1"], linha["x1"]))
                        curta = self.justificado and anterior["x1"] < largura - 0.1 * (largura - margem)
                        salto = espaco > self.salto * altura
                        if self.book.get("salto_exige_frase"):
                            # Conversao com entrelinha irregular: espaco no meio da
                            # frase nao e paragrafo.
                            salto = salto and (
                                anterior["texto"].endswith(FIM_DE_FRASE)
                                or not re.match(r"^[a-zà-ÿ]", linha["texto"])
                            )
                        novo = recuo or curta or salto
                elif paragrafos and anterior is None:
                    # Virada de pagina: continua o paragrafo se ele ficou aberto.
                    ultimo = paragrafos[-1]
                    if tipo == "p" and ultimo["tipo"] == "p" and not marcador and not ultimo["nota"]:
                        aberto = not ultimo["linhas"][-1].endswith(FIM_DE_FRASE) or ultimo["linhas"][-1].endswith("-")
                        sem_recuo = linha["x0"] - margem < 4
                        cheia = self.justificado and ultimo["cheia"]
                        novo = not (aberto or (sem_recuo and cheia and re.match(r"^[a-zà-ÿ]", linha["texto"])))
                if novo:
                    paragrafos.append({
                        "tipo": tipo, "linhas": [linha["texto"]], "x1": linha["x1"],
                        "marcador": marcador, "centrada": centrada, "nota": linha.get("nota", False),
                        "menor": linha["tamanho"] < 0.85 * self.corpo,
                    })
                else:
                    paragrafos[-1]["linhas"].append(linha["texto"])
                    paragrafos[-1]["x1"] = max(paragrafos[-1]["x1"], linha["x1"])
                    paragrafos[-1]["centrada"] = paragrafos[-1]["centrada"] and centrada
                    paragrafos[-1]["menor"] = paragrafos[-1]["menor"] and linha["tamanho"] < 0.85 * self.corpo
                paragrafos[-1]["cheia"] = linha["x1"] >= direita - 6
                anterior = linha

        if self.book.get("tirar_notas_finais"):
            # Notas no fim do capitulo, em corpo menor e ja sem o numero.
            while paragrafos and paragrafos[-1]["menor"]:
                paragrafos.pop()

        saida: list[str] = []
        for i, paragrafo in enumerate(paragrafos):
            texto = juntar(paragrafo["linhas"], self.vocab)
            texto = re.sub(r"^([•●▪■◦])\s*", "• ", texto)
            texto = re.sub(r"^(\d{1,2}\.)(?=[“\"A-ZÀ-Ý])", r"\1 ", texto)
            if self.book.get("ligadura_fi"):
                texto = re.sub(r"(f[il]) (?=[a-zà-ÿ])", r"\1", texto)
            for padrao, troca in self.book.get("trocas", []):
                texto = re.sub(padrao, troca, texto)
            if len(texto) < 200 and len(re.findall(r"\b\w*[a-zà-ÿ][A-ZÀ-Ý]\w*", texto)) >= 2:
                # Versalete com mapa de caixa quebrado ("eNQuANto o PeCAdo"):
                # volta para frase comum, devolvendo a maiuscula dos nomes santos.
                texto = texto[0].upper() + texto[1:].lower()
                texto = re.sub(r"\b(deus|cristo|jesus|senhor|bíblia|espírito santo)\b", lambda m: m.group(0).title(), texto)
            texto = texto.strip()
            if not texto:
                continue
            if paragrafo["tipo"] == "h":
                seguinte = paragrafos[i + 1] if i + 1 < len(paragrafos) else None
                if seguinte and seguinte["tipo"] == "p" and re.match(r"^[a-zà-ÿ]", seguinte["linhas"][0]):
                    # Abertura de capitulo em versalete/negrito, nao subtitulo:
                    # volta para dentro do paragrafo que ela comeca.
                    if texto.upper() == texto:
                        texto = texto[0] + texto[1:].lower()
                    seguinte["linhas"].insert(0, texto)
                    continue
                texto = texto.upper()
            saida.append(texto)
        return "\n\n".join(saida)


def por_extenso(n: int) -> str:
    return NUMEROS.get(n, str(n))


def descricao(book: dict, n: int) -> str:
    mesas = "numa única aula" if n == 1 else f"Em {por_extenso(n)} aulas"
    if n == 1:
        return (
            f"Leitura de {book['titulo']}, de {book['autor']}, {mesas}. {book['resumo']} "
            "A aula traz a transcrição do texto, sem perguntas de reflexão."
        )
    return (
        f"Leitura guiada de {book['titulo']}, de {book['autor']}. {mesas}: {book['resumo']} "
        "Cada aula traz a transcrição do texto, sem perguntas de reflexão."
    )


def migration_sql(book: dict, aulas: list[dict], desc: str) -> str:
    for trecho in [desc, book["titulo"], *(a["titulo"] for a in aulas), *(a["conteudo"] for a in aulas)]:
        if "$conteudo$" in trecho or "$t$" in trecho or "$desc$" in trecho or "$titulo$" in trecho:
            raise ValueError(f"Texto de {book['slug']} colide com o dollar-quoting")
    slug = book["slug"]
    capa = f"/capas/{slug}.jpg"
    partes = [
        f"-- Curso: {book['titulo']} ({book['autor']}) — transcrição sem perguntas. Issue #{ISSUE}.",
        "do $migration$",
        "declare",
        "  v_curso_id uuid;",
        "  v_aula_id uuid;",
        "  v_next_ordem int;",
        "begin",
        f"  select id into v_curso_id from public.cursos where slug = '{slug}';",
        "",
        "  if v_curso_id is null then",
        "    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;",
        "    insert into public.cursos",
        "      (slug, titulo, autor, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)",
        "    values (",
        f"      '{slug}',",
        f"      $titulo${book['titulo']}$titulo$,",
        f"      $titulo${book['autor']}$titulo$,",
        f"      $desc${desc}$desc$,",
        f"      '{capa}',",
        "      false,",
        "      0,",
        f"      '{book['categoria']}',",
        "      v_next_ordem,",
        "      true",
        "    )",
        "    returning id into v_curso_id;",
        "  else",
        "    update public.cursos",
        f"    set titulo = $titulo${book['titulo']}$titulo$,",
        f"        autor = $titulo${book['autor']}$titulo$,",
        f"        descricao = $desc${desc}$desc$,",
        f"        imagem_url = '{capa}',",
        f"        categoria = '{book['categoria']}',",
        "        publicado = true",
        "    where id = v_curso_id;",
        "  end if;",
    ]
    for aula in aulas:
        partes += [
            "",
            f"  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = {aula['ordem']};",
            "  if v_aula_id is null then",
            "    insert into public.aulas (curso_id, titulo, ordem, conteudo)",
            f"    values (v_curso_id, $t${aula['titulo']}$t$, {aula['ordem']},",
            f"$conteudo${aula['conteudo']}$conteudo$)",
            "    returning id into v_aula_id;",
            "  end if;",
        ]
    partes += ["end;", "$migration$;", ""]
    return "\n".join(partes)


def capa(book: dict, livro: Livro) -> None:
    destino = COVERS / f"{book['slug']}.jpg"
    if destino.exists():
        return  # capa ja requalificada e commitada; nao regravar por cima
    pagina = livro.doc[book.get("pagina_capa", 1) - 1]
    pix = pagina.get_pixmap(matrix=fitz.Matrix(2, 2), alpha=False)
    destino.write_bytes(pix.tobytes("jpeg", jpg_quality=88))


def main() -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    COVERS.mkdir(parents=True, exist_ok=True)
    pedidos = set(sys.argv[1:])
    for book in BOOKS:
        if pedidos and book["slug"] not in pedidos:
            continue
        livro = Livro(book)
        aulas = []
        for ordem, (titulo, inicio, fim, *resto) in enumerate(book["aulas"], 1):
            conteudo = livro.aula(ordem, inicio, fim, resto[0] if resto else {})
            if len(conteudo) < book.get("minimo", 800):
                raise ValueError(f"Conteudo curto: {book['slug']} / {titulo}: {len(conteudo)}")
            aulas.append({"ordem": ordem, "titulo": titulo, "conteudo": conteudo})
        desc = descricao(book, len(aulas))
        dados = {
            "slug": book["slug"],
            "titulo": book["titulo"],
            "autor": book["autor"],
            "categoria": book["categoria"],
            "capa": f"/capas/{book['slug']}.jpg",
            "aulas": aulas,
        }
        # Indentado e com quebra final: e o formato que o Biome cobra no CI.
        (DEST / f"{book['slug']}.json").write_text(
            json.dumps(dados, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
        )
        nome = f"{book['migration']}_curso_{book['slug'].replace('-', '_')}.sql"
        (MIGRATIONS / nome).write_text(migration_sql(book, aulas, desc), encoding="utf-8")
        capa(book, livro)
        total = sum(len(a["conteudo"]) for a in aulas)
        print(
            f"{book['slug']}: {len(aulas)} aulas, {total:,} caracteres "
            f"(corpo {livro.corpo}, justificado={livro.justificado})"
        )


if __name__ == "__main__":
    main()
