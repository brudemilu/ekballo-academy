# =============================================================
# Conferência palavra a palavra da carga de A Imitação de Cristo.
#
# A carga promete transcrição literal; esta é a prova. O texto do PDF e o
# texto que foi para o banco são reduzidos à mesma forma canônica (só as
# palavras, minúsculas, sem pontuação nem hífen de fim de linha) e comparados
# com difflib. O que sobrar de diferença é relatado — nada é escondido.
#
# Ruído esperado e descontado: cabeçalho corrido, número de página impressa,
# marcador "CAPÍTULO N", rótulo de livro e o "[figura]" que a carga insere.
#
#   python3 scripts/conferir-imitacao-de-cristo.py
# =============================================================

import difflib
import re
from pathlib import Path

import fitz

RAIZ = Path(__file__).resolve().parent.parent
PDF = Path.home() / "Downloads" / "imitacao-de-cristo-ilustrado.pdf"
SQL = RAIZ / "supabase" / "migrations" / "282_curso_imitacao_de_cristo.sql"

CABECALHO = re.compile(
    r"^(L\s*I\s*V\s*R\s*O|A\s+I\s*M\s*I\s*T\s*A\s*Ç\s*Ã\s*O|I\s*N\s*T\s*R\s*O\s*D\s*U\s*Ç\s*Ã\s*O)\b"
)


# Linhas que são estrutura da página, não texto do autor: o marcador de
# capítulo, o rótulo do livro, a legenda "Capítulos N a M" da folha de abertura
# e a rubrica de diálogo. Existem dos dois lados, em tipografia diferente
# (versalete espaçado no PDF, caixa alta na carga), e comparar tipografia não é
# o objetivo — some com elas nos dois e o que resta é o texto.
ESTRUTURA = re.compile(
    r"^(?:"
    r"c\s*a\s*p\s*[íi]\s*t\s*u\s*l\s*o[\s\d]*"
    r"|l\s*i\s*v\s*r\s*o[\si]*"
    r"|cap[íi]tulos\s+\d+\s+a\s+\d+"
    r"|j\s*e\s*s\s*u\s*s"
    r"|a\s+a?\s*l\s*m?\s*a"
    r"|o?\s*d\s*i\s*s\s*c\s*[íi]\s*p\s*u\s*l\s*o"
    r"|v\s*o\s*z\s+d\s*o\s+(?:a\s*m\s*a\s*d\s*o|d\s*i\s*s\s*c\s*[íi]\s*p\s*u\s*l\s*o)"
    r"|o\s+s\s*e\s*n\s*h\s*o\s*r"
    r")\s*$"
)


INICIO_RUBRICA = re.compile(
    r"^(?:j\s*e\s*s\s*u\s*s|a\s+a?\s*l\s*m?\s*a"
    r"|o?\s*d\s*i\s*s\s*c\s*[íi]\s*p\s*u\s*l\s*o"
    r"|v\s*o\s*z\s+d\s*o\s+(?:a\s*m\s*a\s*d\s*o|d\s*i\s*s\s*c\s*[íi]\s*p\s*u\s*l\s*o)"
    r"|o\s+s\s*e\s*n\s*h\s*o\s*r)(?![a-zà-ÿ])\s*(?:—\s*)?(?=[a-zà-ÿ])"
)


def palavras(texto):
    """
    Reduz os dois lados à mesma forma: uma lista de palavras minúsculas, sem
    pontuação, sem hífen e sem as linhas de estrutura da página.

    O hífen some e as partes se colam ("é-lhe" e "é-\nlhe" viram "élhe"),
    porque o que se confere é a palavra, não a decisão tipográfica de manter
    o hífen na quebra de linha.
    """
    texto = texto.replace("\xa0", " ")
    texto = re.sub(r"\[figura\][^\n]*", " ", texto)
    texto = re.sub(r"-\s*\n\s*", "", texto)     # hifenização de fim de linha
    guardadas = []
    for linha in texto.lower().split("\n"):
        limpa = re.sub(r"\s+", " ", linha).strip()
        if not limpa or ESTRUTURA.match(limpa):
            continue
        # No Livro III a rubrica não ocupa linha própria: abre o parágrafo,
        # colada ao texto ("J E S U S   Filho, anda..."). Sai daqui também.
        limpa = INICIO_RUBRICA.sub("", limpa)
        if limpa:
            guardadas.append(limpa)
    junto = " ".join(guardadas).replace("-", "")
    return re.findall(r"[0-9a-zà-ÿ]+", junto)


def do_pdf(inicio, fim):
    doc = fitz.open(PDF)
    linhas = []
    for numero in range(inicio, fim + 1):
        impressa = numero - 9
        for linha in doc[numero - 1].get_text().split("\n"):
            limpa = re.sub(r"\s+", " ", linha).strip()
            if not limpa or CABECALHO.match(limpa):
                continue
            if re.fullmatch(r"\d{1,3}", limpa) and int(limpa) == impressa:
                continue
            linhas.append(linha)
    return "\n".join(linhas)


def do_banco():
    sql = SQL.read_text(encoding="utf-8")
    vistos, ordem = set(), []
    for conteudo in re.findall(r"\$conteudo\$(.*?)\$conteudo\$", sql, re.S):
        if conteudo not in vistos:
            vistos.add(conteudo)
            ordem.append(conteudo)
    # A primeira mesa é a introdução e a última são as notas do revisor; o
    # corpo do livro, que é o que se compara com as páginas 15-285, é o miolo.
    return "\n\n".join(ordem[1:-1])


def main():
    # O corpo: da abertura do Livro I ao fim do Livro IV.
    esquerda = palavras(do_pdf(15, 285))
    direita = palavras(do_banco())

    # O rótulo do livro e o subtítulo entram uma vez por livro na carga e
    # aparecem na abertura no PDF; o "capítulo N" existe nos dois lados.
    faltando, sobrando = [], []
    matcher = difflib.SequenceMatcher(None, esquerda, direita, autojunk=False)
    for tag, i1, i2, j1, j2 in matcher.get_opcodes():
        if tag == "equal":
            continue
        if tag in ("delete", "replace"):
            faltando.append((i1, esquerda[i1:i2]))
        if tag in ("insert", "replace"):
            sobrando.append((j1, direita[j1:j2]))

    print(f"palavras no PDF (corpo):   {len(esquerda)}")
    print(f"palavras na carga (corpo): {len(direita)}")
    perdidas = sum(len(p) for _, p in faltando)
    extras = sum(len(p) for _, p in sobrando)
    print(f"não transcritas: {perdidas}   acrescentadas: {extras}")
    print(f"fidelidade: {100 * (len(esquerda) - perdidas) / len(esquerda):.4f}%")

    if faltando:
        print("\n-- trechos do PDF que não foram para o banco --")
        for pos, trecho in faltando[:25]:
            print(f"  [{pos}] {' '.join(trecho)[:120]}")
    if sobrando:
        print("\n-- trechos no banco que não estão no PDF --")
        for pos, trecho in sobrando[:25]:
            print(f"  [{pos}] {' '.join(trecho)[:120]}")


if __name__ == "__main__":
    main()
