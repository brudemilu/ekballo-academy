# -*- coding: utf-8 -*-
"""Confere se a transcrição perdeu conteúdo.

Compara a FONTE com o que foi gravado, ignorando espaço em branco: assim a
comparação não é atrapalhada pelos espaços que a extração perdeu e que a
remontagem devolveu. Sobra é o que eu tirei de propósito (cabeçalho corrido,
número de página, marcador de renderização); falta é defeito de verdade."""
import json, io, re, sys, difflib, unicodedata

# "[cite] " é só marcador: sai o marcador, o texto FICA.
# "[figura] caminho | legenda" é linha inteira minha: sai toda.
FIGURA = re.compile(r"\[figura\][^\n]*", re.I)
CITE = re.compile(r"\[(cite|quadro)\]\s*", re.I)

def normalizar(t):
    t = FIGURA.sub("", t)
    t = CITE.sub("", t)
    t = unicodedata.normalize("NFC", t)
    for a, b in (("ﬁ","fi"),("ﬂ","fl"),("ﬀ","ff"),("ﬃ","ffi"),("ﬄ","ffl"),
                 ("�","ti"),("“",'"'),("”",'"'),("’","'"),("‘","'"),
                 ("–","-"),("—","-"),("­","")):
        t = t.replace(a, b)
    return re.sub(r"\s+", "", t)

def fonte_json(caminho):
    d = json.load(io.open(caminho, encoding="utf-8"))
    return "".join(i["t"] for p in d["text"]["pages"].values() for i in p)

def fonte_txt(caminho):
    return io.open(caminho, encoding="utf-8").read()

def auditar(nome, texto_fonte, texto_gravado):
    a, b = normalizar(texto_fonte), normalizar(texto_gravado)
    sm = difflib.SequenceMatcher(None, a, b, autojunk=False)
    faltando, sobrando = [], []
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag in ("delete", "replace") and i2 - i1 > 0:
            faltando.append(a[i1:i2])
        if tag in ("insert", "replace") and j2 - j1 > 0:
            sobrando.append(b[j1:j2])
    igual = sum(bl.size for bl in sm.get_matching_blocks())
    print(f"\n== {nome}: fonte {len(a)} car. | gravado {len(b)} car. | "
          f"coincidem {igual} ({100*igual/max(len(a),1):.2f}% da fonte)")
    tot_falta = sum(len(x) for x in faltando)
    print(f"   faltando {tot_falta} car. em {len(faltando)} trechos | "
          f"sobrando {sum(len(x) for x in sobrando)} car.")
    for x in sorted(faltando, key=len, reverse=True)[:8]:
        if len(x) >= 3:
            print(f"      falta({len(x):4}): {x[:90]}")
    return tot_falta
