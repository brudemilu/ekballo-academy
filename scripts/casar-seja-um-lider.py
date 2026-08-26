#!/usr/bin/env python3
"""Casa o texto limpo do rascunho com a paragrafação do PDF.

O problema que este script resolve: as duas versões do livro são boas em
coisas diferentes.

- O rascunho de scripts/_seja-um-lider-draft/ passou por correção de OCR à mão
  e por modernização ortográfica. É o texto LIMPO. Mas grudou parágrafos (o
  cap. 7 tem 142 onde o livro tem 181) e, no cap. 11, perdeu 51 parágrafos.
- A reextração direta do PDF (scripts/gerar-seja-um-lider.py) tem a
  paragrafação certa e o texto completo, mas carrega o OCR cru do PDF, que em
  alguns trechos está corrompido (o cap. 1 tem 17 marcas de corrupção contra 1
  do rascunho).

Trocar um pelo outro é perder de um lado pra ganhar do outro. Este script fica
com os dois: alinha as duas sequências de palavras com difflib, usa o texto do
RASCUNHO onde as duas concordam (herdando a limpeza) e o texto do PDF só onde o
rascunho não tem nada (os parágrafos perdidos), cortando os parágrafos nos
limites que o PDF indica.

    python3 scripts/casar-seja-um-lider.py --migration 229_seja_um_lider_casamento.sql
"""

import argparse
import difflib
import re
import unicodedata
from pathlib import Path

RAIZ = Path(__file__).parent.parent
LIMPO = RAIZ / "scripts/_seja-um-lider-draft"
PDF_MD = RAIZ / "scripts/_seja-um-lider-reextraido"
SLUG = "seja-um-lider-de-verdade"

# (ordem, arquivo do rascunho limpo)
CAPITULOS = [
    (1, "02-cap01-chamado.md"), (2, "03-cap02-visao.md"), (3, "04-cap03-metas.md"),
    (4, "05-cap04-amor.md"), (5, "06-cap05-humildade.md"), (6, "07-cap06-autocontrole.md"),
    (7, "08-cap07-comunicacao.md"), (8, "09-cap08-investimento.md"),
    (9, "10-cap09-oportunidade.md"), (10, "11-cap10-energia.md"),
    (11, "12-cap11-persistencia.md"), (12, "13-cap12-autoridade.md"),
    (13, "14-cap13-conscientizacao.md"),
]


def paragrafos(texto: str) -> list[str]:
    saida = []
    for p in re.split(r"\n\s*\n", texto):
        p = p.strip()
        if not p or p.startswith("#"):
            continue
        saida.append(re.sub(r"\s+", " ", p.replace("**", "").replace("> ", "")))
    return saida


def tokens(paras: list[str]) -> tuple[list[str], list[tuple[int, int]]]:
    """Palavras normalizadas + de qual (parágrafo, palavra) cada uma veio."""
    palavras, origem = [], []
    for pi, p in enumerate(paras):
        for wi, w in enumerate(p.split()):
            k = unicodedata.normalize("NFD", w.lower())
            k = "".join(c for c in k if unicodedata.category(c) != "Mn")
            k = re.sub(r"[^a-z0-9]", "", k)
            if k:
                palavras.append(k)
                origem.append((pi, wi))
    return palavras, origem



def _k(texto: str) -> str:
    t = unicodedata.normalize("NFD", texto.lower())
    t = "".join(c for c in t if unicodedata.category(c) != "Mn")
    return " ".join(re.findall(r"[a-z0-9]+", t))



def _ja_existe(paragrafo: str, palavras_base: list[str]) -> bool:
    """O trecho do PDF já está no rascunho?

    Comparar só o começo não basta: variação de OCR na primeira linha fazia
    passar por "novo" um parágrafo que o rascunho já tinha, e ele entrava duas
    vezes. Aqui mede-se o maior trecho em comum com o texto limpo inteiro — se
    cobre 60% do parágrafo, é o mesmo texto.
    """
    alvo = _k(paragrafo).split()
    if not alvo:
        return True
    m = difflib.SequenceMatcher(None, alvo, palavras_base, autojunk=False)
    return m.find_longest_match(0, len(alvo), 0, len(palavras_base)).size >= 0.6 * len(alvo)


def casar(limpo: list[str], pdf: list[str]) -> list[str]:
    """Reconstrói o capítulo: texto do rascunho, parágrafos do PDF.

    A reconstrução é uma PARTIÇÃO da sequência de palavras do rascunho: cada
    palavra limpa entra em exatamente um parágrafo de saída, na ordem original.
    Isso é o que garante que o casamento não perca nem duplique nada — uma
    versão anterior, que recortava por min/max das palavras casadas, atravessava
    a fronteira do parágrafo e fazia as duas coisas.

    Os cortes vêm do PDF: cada parágrafo dele é ancorado na primeira palavra do
    rascunho com que casou. Parágrafo do PDF que não casa com nada é um trecho
    que o rascunho perdeu, e entra com o texto do PDF, sem consumir palavra
    limpa nenhuma.
    """
    tl, _ = tokens(limpo)
    tp, op = tokens(pdf)
    sm = difflib.SequenceMatcher(None, tp, tl, autojunk=False)

    correspondente: dict[int, int] = {}
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == "equal":
            for d in range(i2 - i1):
                correspondente[i1 + d] = j1 + d

    # âncora de cada parágrafo do PDF na sequência limpa
    palavras_base = _k(" ".join(limpo)).split()
    ancoras: list[tuple[int, str]] = []  # (índice limpo, texto do PDF se for novo)
    piso = 0
    for pi in range(len(pdf)):
        faixa = [i for i, (p_, _) in enumerate(op) if p_ == pi]
        if not faixa:
            continue
        casadas = sorted(correspondente[i] for i in faixa if i in correspondente)
        # só aceita âncora que não ande pra trás (alinhamento monotônico)
        casadas = [j for j in casadas if j >= piso]
        # limiar de 1 palavra: título curto ("SUMÁRIO") jamais alcançaria 3
        # e caía na regra de inserção, duplicando.
        if len(casadas) >= max(1, 0.5 * len(faixa)):
            piso = casadas[0]
            ancoras.append((casadas[0], ""))
        else:
            # Só é "trecho perdido" se de fato não estiver no rascunho. Sem esta
            # trava, parágrafo curto e título — que falham no alinhamento por
            # terem poucas palavras — entravam de novo pelo PDF e duplicavam
            # (eram 14 duplicações no cap. 13, 8 no cap. 11).
            if not _ja_existe(pdf[pi], palavras_base):
                ancoras.append((piso, pdf[pi]))

    palavras_limpo = [w for p_ in limpo for w in p_.split()]
    saida: list[str] = []
    for idx, (inicio, novo) in enumerate(ancoras):
        if novo:
            saida.append(novo)
            continue
        # até a próxima âncora que consome texto limpo
        fim = len(palavras_limpo)
        for j in range(idx + 1, len(ancoras)):
            if not ancoras[j][1]:
                fim = ancoras[j][0]
                break
        if fim > inicio:
            saida.append(" ".join(palavras_limpo[inicio:fim]))

    # nada do texto limpo pode ficar de fora: o que sobrar antes da 1ª âncora
    primeira = next((a for a, n in ancoras if not n), 0)
    if primeira > 0:
        saida.insert(0, " ".join(palavras_limpo[:primeira]))
    return [x for x in saida if x.strip()]


def dollar(tag: str, valor: str) -> str:
    if f"${tag}$" in valor:
        raise SystemExit(f"conteúdo contém ${tag}$")
    return f"${tag}${valor}${tag}$"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--migration", default=None)
    ap.add_argument("--relatorio", action="store_true")
    args = ap.parse_args()

    sujo = re.compile(r"\w\^\w|\b[a-zà-ÿ]{2,}[A-ZÀ-Ý][a-zà-ÿ]+\b|[a-zà-ÿ]\.[a-zà-ÿ]{2,}"
                      r"|[a-zà-ÿ]-[A-ZÀ-Ý]|[a-zà-ÿ]\d[a-zà-ÿ]")
    print(f"{'cap':>4} {'par':>5} {'palavras':>9} {'do PDF':>7} {'sujeira':>8}")
    resultado = {}
    for ordem, arquivo in CAPITULOS:
        limpo = paragrafos((LIMPO / arquivo).read_text(encoding="utf-8"))
        pdf = paragrafos((PDF_MD / f"cap{ordem:02d}.md").read_text(encoding="utf-8"))
        saida = casar(limpo, pdf)
        corpo = "\n\n".join(saida)
        resultado[ordem] = corpo
        do_pdf = sum(1 for s in saida if s in pdf)
        print(f"{ordem:>4} {len(saida):>5} {len(corpo.split()):>9} {do_pdf:>7} "
              f"{len(sujo.findall(corpo)):>8}")

    if args.relatorio:
        print("\n(relatório apenas)")
        return

    saida_dir = RAIZ / "scripts/_seja-um-lider-final"
    saida_dir.mkdir(exist_ok=True)
    for ordem, corpo in resultado.items():
        (saida_dir / f"cap{ordem:02d}.md").write_text(corpo + "\n", encoding="utf-8")

    if args.migration:
        blocos = [
            f"""  update public.aulas
  set conteudo =
{dollar('conteudo', corpo)},
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = {ordem};"""
            for ordem, corpo in sorted(resultado.items())
        ]
        alvo = RAIZ / "supabase/migrations" / args.migration
        alvo.write_text(
            f"""-- Seja um Líder de Verdade — casa o texto limpo com a paragrafação do PDF.
--
-- A migration 228 trocou o texto do rascunho (que passara por correção de OCR à
-- mão) pela reextração crua do PDF. Ganhou a paragrafação certa e os 51
-- parágrafos que faltavam no cap. 11, mas trouxe junto o OCR corrompido do PDF:
-- 47 marcas de corrupção contra 12 do rascunho, concentradas no cap. 1.
--
-- Esta migration fica com o melhor dos dois: alinha as duas versões palavra a
-- palavra e usa o texto LIMPO onde ambas concordam, recorrendo ao PDF só nos
-- trechos que o rascunho não tinha. Parágrafos cortados onde o PDF corta.
-- Script: scripts/casar-seja-um-lider.py

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = '{SLUG}';
  if v_curso_id is null then
    raise exception 'curso {SLUG} não encontrado';
  end if;

{chr(10).join(blocos)}
end
$migration$;
""",
            encoding="utf-8",
        )
        print(f"\ngravado {alvo.relative_to(RAIZ)}")


if __name__ == "__main__":
    main()
