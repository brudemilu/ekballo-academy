# -*- coding: utf-8 -*-
"""Transcrição literal de uma leitura, no formato do acervo.

Nada de reescrita: só desfaz o que a EXTRAÇÃO quebrou — espaço perdido entre
palavras, ligadura devolvida como glifo + espaço, hifenização de fim de linha,
ordem das colunas. Nenhum rótulo inventado, nenhuma correção de erro do
original, caixa e pontuação como no PDF. O marcador "[cite] " é só instrução
de renderização; sai do texto antes de exibir."""
import io, re, sys
from remontar_generico import montar, juntar_partidos

# vãos que a extração perdeu, conferidos um a um contra a página renderizada
ESPACOS_PERDIDOS = {
    "BakerAcademic": "Baker Academic",
    "filhodeDavi": "filho de Davi",
    "filhodeAbraão": "filho de Abraão",
    "ProclamarSeu": "Proclamar Seu",
}

def consertar_espacos(t):
    for errado, certo in ESPACOS_PERDIDOS.items():
        t = t.replace(errado, certo)
    return t

def conteudo(caminho):
    corpo, info = montar(caminho)
    corpo = juntar_partidos(corpo)
    saida = []
    for p in corpo:
        t = consertar_espacos(p["texto"]).strip()
        if t:
            saida.append(t)
    return saida, info

if __name__ == "__main__":
    ps, info = conteudo(sys.argv[1])
    io.open(sys.argv[2], "w", encoding="utf-8").write("\n\n".join(ps) + "\n")
    print(f"{sys.argv[2]}: {len(ps)} parágrafos, "
          f"{sum(len(p) for p in ps)} caracteres, {info['paginas']} páginas")
