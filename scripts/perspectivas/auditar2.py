# -*- coding: utf-8 -*-
"""Auditoria insensível à ordem.

A remontagem reordena de propósito (coluna da esquerda antes da direita, caixa
que atravessa a página por último), então o diff sequencial acusa reordenação
como se fosse perda. O que precisa ser verdade é: todo caractere da fonte
aparece no gravado. Comparar o CONJUNTO de caracteres pega perda de verdade e
ignora ordem."""
import collections, io, re
from auditar import normalizar, fonte_json, fonte_txt

# mobília de página que sai de propósito: cabeçalho corrido, número de página
# e a marca da gráfica no pé
MOBILIA = [
    r"PERSPECTIVASBRASIL", r"Perspectivas-Prova3\.indb", r"Artigo-Bênçãocomotransformação",
    r"GuiadeEstudo-PerspectivasnoMovimentoCristãoMundial", r"LIÇÃO1-DeuséumDeusMissionário",
    r"\d{1,2}/\d{1,2}/\d{4}", r"\d{2}:\d{2}:\d{2}",
]

def sem_mobilia(t):
    for p in MOBILIA:
        t = re.sub(p, "", t)
    return t

def auditar(nome, fonte, gravado):
    a = sem_mobilia(normalizar(fonte))
    b = sem_mobilia(normalizar(gravado))
    ca, cb = collections.Counter(a), collections.Counter(b)
    faltando = ca - cb          # caracteres que a fonte tem e o gravado não
    sobrando = cb - ca
    print(f"\n== {nome}")
    print(f"   fonte {len(a)} car. | gravado {len(b)} car. | diferença {len(b)-len(a):+d}")
    if faltando:
        print(f"   FALTANDO {sum(faltando.values())} car.: {dict(faltando.most_common(12))}")
    else:
        print("   nada faltando — todo caractere da fonte está no gravado")
    if sobrando:
        print(f"   a mais {sum(sobrando.values())} car.: {dict(sobrando.most_common(8))}")
    return sum(faltando.values())
