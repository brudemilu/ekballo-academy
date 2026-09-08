# -*- coding: utf-8 -*-
"""Transcrição literal do guia de estudo de uma lição do Perspectivas.

O guia tem sempre a mesma diagramação: abertura em duas colunas (a caixa de
objetivos à esquerda, a prosa à direita), e da página 2 em diante coluna única
com boxes recuados ("Leia ...", definições, resumos). O texto sai palavra por
palavra: só se desfaz o que a extração quebrou.

Uso: python3 montar-guia.py <pdf> <numero-da-licao> <saida.txt>
"""
import io, re, subprocess, sys, os

def pdftotext(pdf, args):
    saida = "/tmp/_guia_tmp.txt"
    subprocess.run(["pdftotext", "-layout", *args, pdf, saida], check=True)
    return io.open(saida, encoding="utf-8").read()

def limpar(s):
    s = s.replace("­", "")
    for a, b in (("ﬁ","fi"),("ﬂ","fl"),("ﬀ","ff"),("ﬃ","ffi"),("ﬄ","ffl")):
        s = s.replace(a, b)
    # o PDF parte a ligadura "ti"/"fi" com um espaço ("Perspecti vas")
    s = re.sub(r"(?<=[A-Za-zÀ-ÿ])(ti|fi) (?=[a-zà-ÿ])", r"\1", s)
    return re.sub(r"[ \t]+", " ", s).strip()

def juntar(linhas):
    out = ""
    for ln in linhas:
        ln = ln.strip()
        if not out:
            out = ln
        elif re.search(r"[a-zà-ÿ]-$", out):
            out = out[:-1] + ln
        else:
            out += " " + ln
    return limpar(out)

def blocos(texto):
    bs, atual = [], []
    for ln in texto.split("\n"):
        if ln.strip() == "":
            if atual:
                bs.append(atual); atual = []
        else:
            atual.append(ln)
    if atual:
        bs.append(atual)
    return bs

def recuo(ls):
    return min(len(l) - len(l.lstrip()) for l in ls)

NUMERADO = re.compile(r"^\d+\.\s+[A-ZÀ-Ú0-9 ,\-—\"'?!]+$")
LETRA = re.compile(r"^[A-Z]\.\s+.+$")
CAIXA = re.compile(r"^[^a-zà-ú]+$")
BOX = re.compile(r"^(Leia\b|Abra sua Bíblia|Resumo do|Assista|Ouça|Veja )")

def montar(pdf, licao):
    cabecalho = re.compile(rf"^(LIÇÃO {licao} [–-]|Guia de Estudo [–-])")

    def util(pag):
        fora = []
        for ln in pag.split("\n"):
            t = ln.strip()
            if cabecalho.match(t) or re.fullmatch(r"\d{1,2}", t) or t == ".":
                continue
            fora.append(ln)
        return "\n".join(fora)

    saida = []
    # --- abertura: coluna da direita (prosa), depois a caixa de objetivos ---
    dir1 = util(pdftotext(pdf, ["-f","1","-l","1","-x","265","-y","0","-W","400","-H","900"]))
    dir1 = re.sub(r"^.*?\n\n", "", dir1, count=1, flags=re.S)   # tira o título da capa
    abertura, _, chave = dir1.partition("Palavra chave:")
    for ls in blocos(abertura):
        t = juntar(ls)
        if len(t) > 12:
            saida.append(t)

    esq = util(pdftotext(pdf, ["-f","1","-l","1","-x","0","-y","0","-W","262","-H","900"]))
    m = re.search(r"ESTUDAR ESTA LIÇÃO O AJUDARÁ[^\n]*", esq)
    if m:
        esq = esq[m.start():]
    for ls in blocos(esq):
        t = juntar(ls)
        if t:
            saida.append(t)

    if chave.strip():
        saida.append("Palavra chave:")
        saida.append("[cite] " + juntar([l for l in chave.split("\n") if l.strip()]))

    # --- páginas 2 em diante: coluna única ---
    for pag in pdftotext(pdf, ["-f","2","-l","999"]).split("\f"):
        if not pag.strip():
            continue
        for ls in blocos(util(pag)):
            r, primeira = recuo(ls), ls[0].strip()
            if len(ls) == 1 and (NUMERADO.match(primeira)
                                 or (CAIXA.match(primeira) and 3 < len(primeira) <= 70 and r < 25)):
                saida.append(limpar(primeira)); continue
            if r >= 15 or (BOX.match(juntar(ls)) and r >= 4):
                saida.append("[cite] " + juntar(ls)); continue
            if LETRA.match(primeira) and len(ls) > 1:
                saida.append(limpar(primeira)); ls = ls[1:]
            elif LETRA.match(primeira):
                saida.append(limpar(primeira)); continue
            itens, atual = [], []
            for ln in ls:
                if re.match(r"^\s*\d+\.\s", ln) and atual:
                    itens.append(atual); atual = [ln]
                else:
                    atual.append(ln)
            if atual:
                itens.append(atual)
            for it in itens:
                t = juntar(it)
                if t:
                    saida.append(t)

    # junta parágrafo cortado pela quebra de página
    final = []
    for p in saida:
        if (final and not p.startswith("[cite] ") and not final[-1].startswith("[cite] ")
                and re.search(r"[a-zà-ÿ,;]$", final[-1]) and re.match(r"^[a-zà-ÿ(]", p)):
            final[-1] += " " + p
        else:
            final.append(p)
    return final

if __name__ == "__main__":
    pdf, licao, saida = sys.argv[1], sys.argv[2], sys.argv[3]
    ps = montar(pdf, licao)
    io.open(saida, "w", encoding="utf-8").write("\n\n".join(ps) + "\n")
    print(f"{saida}: {len(ps)} parágrafos, {sum(len(p) for p in ps)} caracteres")
