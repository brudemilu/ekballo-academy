# =============================================================
# A Imitação de Cristo (Tomás de Kempis) — carga do acervo
#
# A edição de origem é a ilustrada da Baixe Livros (2026): tradução clássica
# brasileira de domínio público, revisada, com 114 capítulos em quatro livros
# e 103 gravuras no miolo.
#
# O que este script resolve, que o pdftotext sozinho não resolve:
#
#  1. CAPÍTULO COMEÇA NO MEIO DA PÁGINA. A extração é por marcador
#     "C A P Í T U L O  N" (as letras vêm espaçadas no PDF), não por faixa de
#     páginas — o mesmo caso de "A Quem Enviarei?".
#  2. FIGURA ANCORADA. Cada gravura entra no ponto em que está na página
#     impressa, e não empilhada no fim da mesa: texto e imagem são ordenados
#     pela coordenada vertical (y) na página, então a sequência que sai daqui
#     é a ordem de leitura real.
#  3. PARÁGRAFO ATRAVESSA A PÁGINA. O número do parágrafo abre um bloco; um
#     bloco sem número no topo da página seguinte é continuação do anterior.
#  4. HIFENIZAÇÃO vs. ÊNCLISE. O fim de linha usa hífen para as duas coisas:
#     "adverti-dos" (juntar) e "é-lhe" (manter). Quem decide é o vocabulário
#     do próprio livro, com os pronomes enclíticos como desempate.
#  5. RUBRICAS DE DIÁLOGO. No Livro III as falas são marcadas "J E S U S" e
#     "A  A L MA"; no IV, "Voz do Amado" / "Voz do discípulo". Vêm com o
#     espaçamento da fonte versalete e precisam voltar a ser palavra.
#
# Uso:
#   python3 scripts/gerar-imitacao-de-cristo.py
#
# Escreve: supabase/migrations/282_curso_imitacao_de_cristo.sql
#          public/figuras/imitacao-de-cristo/*.jpg
# =============================================================

import re
import unicodedata
from pathlib import Path

import fitz  # PyMuPDF

RAIZ = Path(__file__).resolve().parent.parent
PDF = Path.home() / "Downloads" / "imitacao-de-cristo-ilustrado.pdf"
SLUG = "imitacao-de-cristo"
DEST_FIGS = RAIZ / "public" / "figuras" / SLUG
SAIDA = RAIZ / "supabase" / "migrations" / "282_curso_imitacao_de_cristo.sql"

# Faixas da edição (páginas do PDF, não as impressas).
P_INTRO = (10, 14)
P_CORPO = (15, 285)
P_NOTAS = (286, 287)

LIVROS = {
    1: ("LIVRO I", "AVISOS ÚTEIS PARA A VIDA ESPIRITUAL", 25),
    2: ("LIVRO II", "EXORTAÇÕES À VIDA INTERIOR", 12),
    3: ("LIVRO III", "DA CONSOLAÇÃO INTERIOR", 59),
    4: ("LIVRO IV", "DO SACRAMENTO DO ALTAR", 18),
}

# Cabeçalho corrido das páginas — sai fora.
CABECALHO = re.compile(
    r"^(L\s*I\s*V\s*R\s*O|A\s+I\s*M\s*I\s*T\s*A\s*Ç\s*Ã\s*O|I\s*N\s*T\s*R\s*O\s*D\s*U\s*Ç\s*Ã\s*O)\b"
)
CAPITULO = re.compile(r"^C\s*A\s*P\s*Í\s*T\s*U\s*L\s*O\s+([\d\s]+)$")

# Pronomes que o hífen de fim de linha pode estar prendendo ao verbo. Sem esta
# lista, "é-lhe" viraria "élhe".
ENCLITICOS = {
    "lhe", "lhes", "me", "te", "se", "nos", "vos", "o", "a", "os", "as",
    "lo", "la", "los", "las", "no", "na", "ns", "nas", "ei", "á", "ás",
    "ia", "emos", "ão", "ei-lo", "ás-me",
}


# Erros de composição da edição-fonte, corrigidos um a um e listados aqui para
# que a diferença em relação ao PDF fique registrada — a carga é literal, e
# toda alteração precisa estar escrita em algum lugar.
CORRECOES_DA_FONTE = {
    # Livro IV, título do capítulo 2: falta o espaço antes de "de Deus".
    "bondade e caridadede Deus": "bondade e caridade de Deus",
}


def corrigir_fonte(texto: str) -> str:
    for errado, certo in CORRECOES_DA_FONTE.items():
        texto = texto.replace(errado, certo)
    return texto


def normaliza(texto: str) -> str:
    """Espaço em branco do PDF (NBSP, quebra fina) vira espaço comum."""
    return texto.replace("\xa0", " ").replace(" ", " ").replace("​", "")


def desespacar(trecho: str) -> str:
    """
    "J E S U S" -> "JESUS", "A  A L MA" -> "A ALMA".

    A fonte versalete sai do PDF com espaço entre as letras, e nem sempre
    regular (o "A L MA" acima é literal). A regra: numa sequência em que
    quase toda "palavra" tem uma letra só, os espaços internos são
    tipográficos e o espaço duplo é que separa palavra de palavra.
    """
    partes = re.split(r"\s{2,}", trecho.strip())
    saida = []
    for parte in partes:
        palavras = parte.split()
        if len(palavras) > 1 and sum(len(p) for p in palavras) / len(palavras) < 1.6:
            saida.append("".join(palavras))
        else:
            saida.append(parte)
    return " ".join(saida)


def elementos_da_pagina(pagina):
    """
    Blocos de texto e imagens da página, na ordem de leitura (por y).

    É aqui que a figura ganha seu lugar: a coordenada do topo da imagem entra
    na mesma ordenação dos blocos de texto, então uma gravura no meio da
    página fica no meio do texto, e não no fim da mesa.
    """
    itens = []
    for bloco in pagina.get_text("blocks"):
        x0, y0, x1, y1, texto, _, tipo = bloco
        if tipo != 0 or not texto.strip():
            continue
        itens.append((y0, "texto", normaliza(texto)))
    for imagem in pagina.get_images(full=True):
        xref = imagem[0]
        for retangulo in pagina.get_image_rects(xref):
            itens.append((retangulo.y0, "figura", xref))
    itens.sort(key=lambda item: item[0])
    return itens


def vocabulario(doc, faixa):
    """Palavras inteiras do livro — o juiz da hifenização de fim de linha."""
    vocab = set()
    for numero in range(faixa[0], faixa[1] + 1):
        for palavra in re.findall(r"[\wÀ-ÿ]+(?:-[\wÀ-ÿ]+)*", doc[numero - 1].get_text()):
            vocab.add(palavra.lower())
    return vocab


def juntar_linhas(linhas, vocab):
    """
    Une as linhas de um parágrafo desfazendo a quebra de linha.

    O hífen no fim da linha é ambíguo: pode ser hifenização silábica
    ("adverti-dos", que se junta) ou hífen de verdade ("é-lhe", que fica).
    A decisão é do vocabulário do próprio volume, e os enclíticos desempatam
    quando nenhuma das formas aparece inteira em outro lugar.
    """
    texto = ""
    for linha in linhas:
        linha = linha.strip()
        if not linha:
            continue
        if not texto:
            texto = linha
            continue
        if texto.endswith("-"):
            radical = texto[:-1]
            cabeca = re.split(r"[\s,.;:!?]", linha, maxsplit=1)[0].lower()
            ultima = re.split(r"[\s]", radical)[-1].lower()
            ultima = re.sub(r"^[^\wÀ-ÿ-]+", "", ultima)
            junto = f"{ultima}{cabeca}"
            com_hifen = f"{ultima}-{cabeca}"
            if com_hifen in vocab and junto not in vocab:
                texto = f"{texto}{linha}"
            elif junto in vocab:
                texto = f"{radical}{linha}"
            elif cabeca in ENCLITICOS:
                texto = f"{texto}{linha}"
            else:
                texto = f"{radical}{linha}"
        else:
            texto = f"{texto} {linha}"
    return re.sub(r"\s+", " ", texto).strip()


def bloco_e_numero(texto):
    """
    Separa o número do parágrafo do corpo, quando o bloco abre com um.

    Devolve (numero, linhas). Bloco sem número devolve (None, linhas) — é
    continuação do parágrafo que ficou na página anterior.
    """
    linhas = [l for l in texto.split("\n") if l.strip()]
    if linhas and re.fullmatch(r"\d{1,2}", linhas[0].strip()):
        return int(linhas[0].strip()), linhas[1:]
    return None, linhas


def extrair(doc):
    """
    Percorre o corpo do livro e devolve os capítulos, cada um com sua
    sequência de parágrafos e figuras já na ordem de leitura.
    """
    vocab = vocabulario(doc, (P_INTRO[0], P_NOTAS[1]))
    capitulos = []
    atual = None
    esperando_titulo = False
    figuras = []  # xrefs na ordem de aparição, para nomear os arquivos

    for numero_pagina in range(P_CORPO[0], P_CORPO[1] + 1):
        pagina = doc[numero_pagina - 1]
        impressa = numero_pagina - 9  # a p16 do PDF é a 7 impressa
        for _, tipo, valor in elementos_da_pagina(pagina):
            if tipo == "figura":
                if atual is not None:
                    figuras.append(valor)
                    atual["blocos"].append({"tipo": "figura", "xref": valor})
                continue

            texto = valor.strip()
            if not texto:
                continue
            uma_linha = re.sub(r"\s+", " ", texto).strip()

            # Cabeçalho corrido e número de página impressa: fora.
            if CABECALHO.match(uma_linha):
                continue
            if re.fullmatch(r"\d{1,3}", uma_linha) and int(uma_linha) == impressa:
                continue

            achou = CAPITULO.match(uma_linha)
            if achou:
                numero = int(re.sub(r"\s", "", achou.group(1)))
                atual = {"numero": numero, "titulo": "", "blocos": [], "pagina": numero_pagina}
                capitulos.append(atual)
                esperando_titulo = True
                continue

            if atual is None:
                continue  # abertura de livro; o cabeçalho é montado depois

            rubrica = so_rubrica(texto)
            if rubrica:
                # A rubrica fecha o título (Livro IV) e entra como bloco
                # próprio, em caixa alta: é assim que o leitor a estiliza.
                esperando_titulo = False
                atual["blocos"].append({"tipo": "rubrica", "texto": rubrica})
                continue

            if esperando_titulo:
                # O título pode ocupar mais de um bloco quando quebra em duas
                # linhas ("...vaidades do / mundo").
                numero, linhas = bloco_e_numero(texto)
                if numero is None:
                    parcial = juntar_linhas(linhas, vocab)
                    atual["titulo"] = corrigir_fonte(f"{atual['titulo']} {parcial}".strip())
                    continue
                esperando_titulo = False

            numero, linhas = bloco_e_numero(texto)
            cru = juntar_linhas(linhas, vocab)
            if not cru:
                continue
            # Um bloco que começa com rubrica é um turno novo do diálogo, e é
            # a comparação com o texto cru que revela isso.
            abre_fala = desespacar_rubrica(cru) != cru
            corpo = corrigir_fonte(desespacar_rubrica(cru))
            if (
                numero is None
                and not abre_fala
                and atual["blocos"]
                and atual["blocos"][-1]["tipo"] == "paragrafo"
            ):
                # Parágrafo que atravessou a virada de página. A fala que abre
                # com rubrica fica de fora: ela é um turno novo do diálogo e
                # merece parágrafo próprio, ainda que a edição não a numere.
                anterior = atual["blocos"][-1]
                anterior["texto"] = juntar_linhas([anterior["texto"], corpo], vocab)
            else:
                atual["blocos"].append({"tipo": "paragrafo", "numero": numero, "texto": corpo})

    return capitulos, figuras


# As rubricas de diálogo abrem o parágrafo em versalete espaçado.
RUBRICAS = [
    (re.compile(r"^J\s*E\s*S\s*U\s*S\s+"), "JESUS"),
    (re.compile(r"^A\s+A\s*L\s*M\s*A\s+"), "A ALMA"),
    (re.compile(r"^O\s+D\s*I\s*S\s*C\s*Í\s*P\s*U\s*L\s*O\s+"), "O DISCÍPULO"),
    # O Livro IV traz estas duas em versalete MAIÚSCULO, e o Livro III as suas
    # em versalete sobre caixa alta — daí o IGNORECASE.
    (re.compile(r"^V\s*O\s*Z\s+D\s*O\s+A\s*M\s*A\s*D\s*O\s+", re.I), "VOZ DO AMADO"),
    (re.compile(r"^V\s*O\s*Z\s+D\s*O\s+D\s*I\s*S\s*C\s*Í\s*P\s*U\s*L\s*O\s+", re.I), "VOZ DO DISCÍPULO"),
    (re.compile(r"^O\s+S\s*E\s*N\s*H\s*O\s*R\s+", re.I), "O SENHOR"),
]


def so_rubrica(texto):
    """
    Bloco que traz apenas a rubrica de diálogo, sem texto atrás.

    É como o Livro IV marca quem fala: a rubrica ocupa uma linha própria
    entre o título do capítulo e o primeiro parágrafo. No Livro III ela vem
    colada ao texto do parágrafo, e quem cuida disso é desespacar_rubrica.
    """
    limpo = re.sub(r"\s+", " ", texto).strip()
    for padrao, nome in RUBRICAS:
        achou = padrao.match(f"{limpo} ")
        # Tem de consumir o bloco inteiro. Casar só o começo confundiria a
        # fala que ABRE com a rubrica ("A ALMA  Senhor, em que devo...") com
        # a rubrica sozinha, e o texto da fala seria descartado.
        if achou and achou.end() >= len(limpo):
            return nome
    return None


def desespacar_rubrica(texto):
    """Devolve a rubrica de diálogo como palavra, seguida de travessão."""
    for padrao, nome in RUBRICAS:
        if padrao.match(texto):
            return padrao.sub(f"{nome} — ", texto, count=1)
    return texto


def extrair_faixa_simples(doc, faixa, vocab, pular_titulo=False):
    """Introdução e notas do revisor: texto corrido, sem numeração."""
    partes = []
    for numero_pagina in range(faixa[0], faixa[1] + 1):
        pagina = doc[numero_pagina - 1]
        impressa = numero_pagina - 9
        for _, tipo, valor in elementos_da_pagina(pagina):
            if tipo != "texto":
                continue
            uma_linha = re.sub(r"\s+", " ", valor).strip()
            if not uma_linha or CABECALHO.match(uma_linha):
                continue
            if re.fullmatch(r"\d{1,3}", uma_linha) and int(uma_linha) == impressa:
                continue
            linhas = [l for l in valor.split("\n") if l.strip()]
            texto = juntar_linhas(linhas, vocab)
            if texto:
                partes.append(desespacar(texto) if len(texto) < 60 else texto)
    return partes


def salvar_figuras(doc, xrefs):
    """
    Grava as gravuras em public/figuras/<slug>/ na ordem de aparição.

    O nome é o número de ordem, e não a página: se a edição for reimportada
    com outra paginação, o caminho gravado no banco continua valendo.
    """
    DEST_FIGS.mkdir(parents=True, exist_ok=True)
    caminhos = {}
    for indice, xref in enumerate(xrefs, start=1):
        info = doc.extract_image(xref)
        nome = f"{indice:03d}.{info['ext']}"
        (DEST_FIGS / nome).write_bytes(info["image"])
        caminhos[xref] = f"/figuras/{SLUG}/{nome}"
    return caminhos


def montar_conteudo(capitulo, caminhos, cabecalho=None):
    """Monta o texto da mesa no formato do acervo (blocos por linha em branco)."""
    blocos = []
    if cabecalho:
        blocos.extend(cabecalho)
    blocos.append(f"CAPÍTULO {capitulo['numero']}")
    if capitulo["titulo"]:
        blocos.append(capitulo["titulo"])
    for bloco in capitulo["blocos"]:
        if bloco["tipo"] == "figura":
            blocos.append(f"[figura] {caminhos[bloco['xref']]}")
        elif bloco["tipo"] == "rubrica":
            blocos.append(bloco["texto"])
        else:
            numero = bloco.get("numero")
            blocos.append(f"{numero}. {bloco['texto']}" if numero else bloco["texto"])
    return "\n\n".join(blocos)


def sql_literal(texto, tag):
    """Dollar-quoting, com o cuidado de a tag não aparecer no próprio texto."""
    assert f"${tag}$" not in texto, f"a tag ${tag}$ colide com o conteúdo"
    return f"${tag}${texto}${tag}$"


def gerar_sql(mesas, descricao):
    linhas = [
        "-- =============================================================",
        "-- 282 · A Imitação de Cristo (Tomás de Kempis) — curso de leitura",
        "--",
        "-- Transcrição literal da edição ilustrada da Baixe Livros (2026):",
        "-- tradução clássica brasileira de domínio público, os quatro livros e os",
        "-- 114 capítulos com a numeração de parágrafos da tradição, mais a",
        "-- introdução e as notas do revisor.",
        "--",
        "-- As 103 gravuras do miolo entram ancoradas no ponto da página em que",
        "-- estão impressas; os arquivos vão em public/figuras/imitacao-de-cristo/",
        "-- e aparecem no site com o rebuild da imagem.",
        "--",
        "-- Gerada por scripts/gerar-imitacao-de-cristo.py. Resolve #91.",
        "-- =============================================================",
        "",
        "do $migration$",
        "declare",
        "  v_curso_id uuid;",
        "  v_aula_id uuid;",
        "  v_next_ordem int;",
        "begin",
        f"  select id into v_curso_id from public.cursos where slug = '{SLUG}';",
        "",
        "  if v_curso_id is null then",
        "    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;",
        "    insert into public.cursos",
        "      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)",
        "    values (",
        f"      '{SLUG}',",
        "      $titulo$A Imitação de Cristo$titulo$,",
        f"      {sql_literal(descricao, 'desc')},",
        f"      'capas/{SLUG}.jpg',",
        "      false,",
        "      0,",
        "      'ensino',",
        "      v_next_ordem,",
        "      true",
        "    )",
        "    returning id into v_curso_id;",
        "  else",
        "    update public.cursos",
        "    set titulo = $titulo$A Imitação de Cristo$titulo$,",
        f"        descricao = {sql_literal(descricao, 'desc')},",
        f"        imagem_url = 'capas/{SLUG}.jpg',",
        "        categoria = 'ensino',",
        "        publicado = true",
        "    where id = v_curso_id;",
        "  end if;",
        "",
    ]

    for ordem, (titulo, conteudo) in enumerate(mesas, start=1):
        linhas += [
            f"  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = {ordem};",
            "  if v_aula_id is null then",
            "    insert into public.aulas (curso_id, titulo, ordem, conteudo)",
            f"    values (v_curso_id, {sql_literal(titulo, 't')}, {ordem},",
            f"{sql_literal(conteudo, 'conteudo')})",
            "    returning id into v_aula_id;",
            "  else",
            "    update public.aulas",
            f"    set titulo = {sql_literal(titulo, 't')},",
            f"        conteudo = {sql_literal(conteudo, 'conteudo')}",
            "    where id = v_aula_id;",
            "  end if;",
            "",
        ]

    linhas += ["end", "$migration$;", ""]
    return "\n".join(linhas)


def main():
    doc = fitz.open(PDF)
    vocab = vocabulario(doc, (P_INTRO[0], P_NOTAS[1]))
    capitulos, xrefs = extrair(doc)

    esperado = sum(quantos for _, _, quantos in LIVROS.values())
    assert len(capitulos) == esperado, f"esperava {esperado} capítulos, achei {len(capitulos)}"

    caminhos = salvar_figuras(doc, xrefs)

    mesas = []

    intro = extrair_faixa_simples(doc, P_INTRO, vocab)
    mesas.append(("Introdução — A Imitação de Cristo à luz de Santo Tomás de Aquino",
                  "\n\n".join(intro)))

    # Cada capítulo vira uma mesa. O número do livro não existe como coluna em
    # `aulas` (a lista é plana), então ele vive no título — é o que deixa a
    # lista de 116 mesas navegável.
    indice = 0
    for numero_livro in sorted(LIVROS):
        rotulo, subtitulo, quantos = LIVROS[numero_livro]
        for posicao in range(quantos):
            capitulo = capitulos[indice]
            indice += 1
            cabecalho = [rotulo, subtitulo] if posicao == 0 else None
            titulo = f"{rotulo} · {capitulo['numero']}. {capitulo['titulo']}"
            mesas.append((titulo, montar_conteudo(capitulo, caminhos, cabecalho)))

    notas = extrair_faixa_simples(doc, P_NOTAS, vocab)
    mesas.append(("Notas do revisor", "\n\n".join(notas)))

    descricao = (
        "Leitura guiada de A Imitação de Cristo, de Tomás de Kempis (c. 1380-1471), "
        "na tradução clássica brasileira de domínio público. Os quatro livros e os "
        "114 capítulos, um por mesa, com a numeração de parágrafos da tradição e as "
        "gravuras da edição ilustrada: avisos úteis para a vida espiritual, "
        "exortações à vida interior, o diálogo da consolação interior entre Jesus e "
        "a alma, e o Sacramento do Altar. Cada mesa traz a transcrição do texto, "
        "sem perguntas de reflexão."
    )

    SAIDA.write_text(gerar_sql(mesas, descricao), encoding="utf-8")
    print(f"mesas: {len(mesas)}  figuras: {len(caminhos)}")
    print(f"migration: {SAIDA.relative_to(RAIZ)}  ({SAIDA.stat().st_size // 1024} kB)")


if __name__ == "__main__":
    main()
