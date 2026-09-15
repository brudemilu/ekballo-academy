# -*- coding: utf-8 -*-
"""Monta um guia de estudo a partir de OCR, quando o PDF é escaneado.

Diferente dos outros guias, este NÃO vem de camada de texto: a fonte é a
imagem da página. Por isso a garantia é menor e o script existe à parte —
para que ninguém confunda a procedência de uma aula com a das demais.
"""
import io, re, sys

CABECALHO = re.compile(r"^(Guia de Estudo|LIÇÃO \d+)", re.I)
NUMERADO = re.compile(r"^\d+\.\s+[A-ZÀ-Ú0-9 ,\-—?!:]+$")
LETRA = re.compile(r"^[A-G]\.\s+[A-ZÀ-Ú]")
BOX = re.compile(r"^(Leia\b|Continue lendo|Assista|Ouça)", re.I)

def util(linha):
    t = linha.strip()
    if not t or CABECALHO.match(t) or re.fullmatch(r"\d{1,3}", t):
        return None
    return t

def paragrafos(texto):
    """junta linhas soltas em parágrafos; linha em branco separa"""
    blocos, atual = [], []
    for linha in texto.split("\n"):
        t = util(linha)
        if t is None:
            if atual:
                blocos.append(" ".join(atual)); atual = []
            continue
        # título e box começam parágrafo novo
        if atual and (NUMERADO.match(t) or LETRA.match(t) or BOX.match(t)):
            blocos.append(" ".join(atual)); atual = []
        atual.append(t)
        if NUMERADO.match(t) or LETRA.match(t):
            blocos.append(" ".join(atual)); atual = []
    if atual:
        blocos.append(" ".join(atual))
    return [re.sub(r"\s+", " ", b).strip() for b in blocos if b.strip()]

def montar(arquivos):
    saida = []
    for arq in arquivos:
        texto = io.open(arq, encoding="utf-8", errors="replace").read()
        for p in paragrafos(texto):
            if len(p) < 3:
                continue
            saida.append("[cite] " + p if BOX.match(p) else p)
    # junta parágrafo cortado na virada de página
    final = []
    for p in saida:
        if (final and not p.startswith("[cite] ") and not final[-1].startswith("[cite] ")
                and re.search(r"[a-zà-ÿ,;]$", final[-1]) and re.match(r"^[a-zà-ÿ(]", p)):
            final[-1] += " " + p
        else:
            final.append(p)
    return final

if __name__ == "__main__":
    ps = montar(sys.argv[2:])
    io.open(sys.argv[1], "w", encoding="utf-8").write("\n\n".join(ps) + "\n")
    print(f"{sys.argv[1]}: {len(ps)} parágrafos, {sum(len(p) for p in ps)} caracteres")
