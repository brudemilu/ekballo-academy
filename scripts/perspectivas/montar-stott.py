# -*- coding: utf-8 -*-
"""Fecha o capítulo no formato do acervo: CAIXA ALTA = seção, "[cite] " =
bloco destacado. Conserta ligadura, assinatura e parágrafo partido na virada
de coluna."""
import re, io, sys
from remontar_stott import montar

LIGADURAS = {"ﬁ": "fi", "ﬂ": "fl", "ﬀ": "ff", "ﬃ": "ffi", "ﬄ": "ffl"}
# mesmo defeito em letras normais — lista fechada, pra não colar palavra
# legítima ("senti a dor" não pode virar "sentia dor")
COLADAS = {"Christi an": "Christian", "Christi anity": "Christianity",
           "Cristi anismo": "Cristianismo", "Insti tute": "Institute",
           "Patt aya": "Pattaya", "conti nentes": "continentes",
           "desti no": "destino", "Estudanti s": "Estudantis",
           "Contemporary Christi": "Contemporary Christi"}

def limpar(t):
    for glifo, letras in LIGADURAS.items():
        t = re.sub(glifo + r" (?=[a-zà-ÿ])", letras, t)
        t = t.replace(glifo, letras)
    for errado, certo in COLADAS.items():
        t = t.replace(errado, certo)
    return re.sub(r"\s+", " ", t).strip()

def juntar_partidos(ps):
    """parágrafo que continua na coluna ou página seguinte volta a ser um só"""
    out = []
    for p in ps:
        anterior = out[-1] if out else None
        if (anterior and not anterior["titulo"] and not p["titulo"]
                and not re.search(r'[.!?:;"]$', anterior["texto"])
                and re.match(r'^[a-zà-ÿ("]', p["texto"])):
            if re.search(r"[a-zà-ÿ]-$", anterior["texto"]):
                anterior["texto"] = anterior["texto"][:-1] + p["texto"]
            else:
                anterior["texto"] += " " + p["texto"]
        else:
            out.append(dict(p))
    return out

def conteudo(caminho, titulo, abertura=True):
    corpo, bio, caixa, notas = montar(caminho, abertura)
    for lista in (corpo, caixa):
        for p in lista:
            p["texto"] = limpar(p["texto"])
    corpo = juntar_partidos(corpo)

    # a assinatura abre o capítulo; o dígito colado é a chamada da nota
    for p in corpo[:3]:
        m = re.match(r"^(\d?)(John R\. W\. Stott)\s*(.*)$", p["texto"])
        if m:
            p["texto"] = m.group(2)
            if m.group(3):
                corpo.insert(corpo.index(p) + 1, {"texto": m.group(3), "titulo": False})
            break

    saida = [titulo] if titulo else []
    for p in corpo:
        t = p["texto"]
        if len(t) < 3:            # sobra de diagramação
            continue
        saida.append(t)

    # a caixa "Perguntas para estudo" fica no pé da última página, atravessando
    # as duas colunas; entra aqui com o texto que o PDF traz
    for p in caixa:
        if p["texto"]:
            saida.append(p["texto"])

    texto_notas = limpar(" ".join(l["texto"] for l in notas))
    texto_notas = re.sub(r"^1\s+1\s*", "", texto_notas).strip()
    if len(texto_notas) > 10:
        saida.append("[cite] " + texto_notas)

    texto_bio = limpar(" ".join(l["texto"] for l in bio))
    if titulo:
        texto_bio = re.sub(r"^" + re.escape(titulo) + r"\s*", "", texto_bio, flags=re.I)
    texto_bio = texto_bio.strip()
    if texto_bio:
        saida.append("[cite] " + texto_bio)
    return saida

if __name__ == "__main__":
    ps = conteudo(sys.argv[1], sys.argv[2])
    io.open(sys.argv[3], "w", encoding="utf-8").write("\n\n".join(ps) + "\n")
    print(f"{sys.argv[3]}: {len(ps)} parágrafos, {sum(len(p) for p in ps)} caracteres")
