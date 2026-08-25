#!/usr/bin/env python3
"""Reextrai "O Pastor Imperfeito" (Zack Eswine) e gera a migration 204.

Por que este livro tem gerador próprio (e em Python, fora do padrão .mjs):

1. A extração antiga foi feita com outra ferramenta e saiu corrompida — comia o
   "s" das passagens em itálico ("pa tor", "exi tem") e trocava as versaletes por
   blocos de glifos Sinhala. Também duplicou 8 capítulos (as "aulas" de ordem
   20 a 27 repetiam texto das de ordem 3 a 12), despejou a bibliografia inteira
   numa aula de 205 mil caracteres e perdeu o capítulo 16.
2. Este PDF (gerado pelo calibre a partir do ebook) NÃO tem cabeçalho corrido
   nem número de página, e o texto atravessa a quebra de página no meio da
   frase. A lógica página-a-página de scripts/gerar-livros-lote5.mjs quebraria
   um parágrafo a cada página.

Solução: PyMuPDF, que já devolve os parágrafos agrupados em blocos com
geometria. Parágrafo cortado pela virada de página é remendado quando o bloco
anterior não termina em pontuação e o seguinte começa em minúscula.

    python3 scripts/gerar-pastor-imperfeito.py
"""

import re
import unicodedata
from pathlib import Path

import fitz  # PyMuPDF

PDF = Path.home() / "Library/Mobile Documents/com~apple~CloudDocs/Livros/O Pastor Imperfeito - Zack Eswine.pdf"
SAIDA = Path(__file__).parent.parent / "supabase/migrations/204_pastor_imperfeito_reextracao.sql"

SLUG = "o-pastor-imperfeito"
TITULO = "O Pastor Imperfeito"
AUTOR = "Zack Eswine"
CAPA = "/capas/o-pastor-imperfeito.jpg"
DESCRICAO = (
    "Leitura guiada de O Pastor Imperfeito, de Zack Eswine. Em vinte mesas, o autor "
    "trata das tentações do ministério — querer estar em todo lugar, consertar tudo, saber "
    "tudo e resolver tudo agora — e propõe um caminho de volta ao ritmo humano e local do "
    "próprio Jesus: cuidar dos enfermos e dos pecadores, conhecer o próprio lugar e liderar "
    "sem pressa. Cada mesa traz a transcrição do texto, sem perguntas de reflexão."
)

# (título, primeira página, última página, ordem antiga a reaproveitar ou None)
# Páginas são índices 0-based do PyMuPDF. A "ordem antiga" preserva o id da aula
# (e portanto o progresso dos alunos) — None = aula que não existia no banco.
SECOES = [
    ("Agradecimentos", 9, 10, 1),
    ("Apresentação à Edição em Português", 11, 16, 2),
    ("Introdução", 17, 17, 3),
    ("PRIMEIRA PARTE | A Chamada que seguimos", 18, 19, 4),
    ("1 | Desejo", 20, 37, 5),
    ("2 | Reconquistando nossa humanidade", 38, 50, 6),
    ("3 | Saindo de casa", 51, 62, 7),
    ("4 | Invisível", 63, 76, 8),
    # As aberturas da 2ª, 3ª e 4ª partes (págs. 77, 144 e 205) trazem só o título,
    # sem uma linha de texto — virariam mesas vazias e ficam de fora. A abertura da
    # 1ª parte entra porque tem o poema "Vocação" (pág. 19).
    ("5 | Estar em todo lugar para todos", 78, 94, 9),
    ("6 | Consertar tudo", 95, 111, 10),
    ("7 | Saber tudo", 112, 126, 11),
    ("8 | Imediatismo", 127, 143, 12),
    ("9 | Uma nova ambição", 145, 164, 13),
    ("10 | Contemplando Deus", 165, 185, 14),
    ("11 | Encontrando o nosso ritmo", 186, 204, 15),
    ("12 | Cuidando dos enfermos", 206, 218, 16),
    ("13 | Cuidando dos pecadores", 219, 234, 17),
    ("14 | Conhecimento Local", 235, 253, 18),
    ("15 | Liderança", 254, 271, 19),
    ("16 | Realismo Romântico", 272, 282, None),
]

FIM_DE_FRASE = tuple('.!?…:"”»)]›’')


# A fonte de VERSALETES do livro (nomes citados nas epígrafes, "Senhor" nas
# citações bíblicas) não tem ToUnicode: as minúsculas saem remapeadas para o
# bloco Sinhala, num deslocamento linear a partir de U+0D89 ("a"). Sem desfazer
# isso, "Bernardo de Claraval" vira "Bඍකඖඉකඌ඗ ඌඍ Cඔඉකඉඞඉඔ" — foi o que sujou a
# carga anterior. A maiúscula inicial já vem correta da fonte normal.
VERSALETES = {chr(0x0D89 + i): chr(ord("a") + i) for i in range(26)}
# Acentuadas ficam fora da faixa linear. No livro inteiro só aparece uma:
VERSALETES["\u0dbe"] = "ö"  # "Dag Hammarskjöld"


def normalizar(texto: str) -> str:
    texto = texto.translate(str.maketrans(VERSALETES))
    texto = texto.replace("ﬁ", "fi").replace("ﬂ", "fl").replace("­", "")
    texto = texto.replace("\n", " ")
    texto = re.sub(r"([a-zà-ÿ])-\s+", r"\1", texto)  # rejunta hifenização de fim de linha
    texto = re.sub(r"\s+([,.;:!?])", r"\1", texto)
    texto = re.sub(r"\s+", " ", texto)
    return unicodedata.normalize("NFC", texto).strip()


def paragrafos(doc, ini: int, fim: int, titulo: str) -> list[str]:
    paras: list[str] = []
    for pagina in range(ini, fim + 1):
        primeiro_da_pagina = True
        for bloco in sorted(doc[pagina].get_text("blocks"), key=lambda b: (b[1], b[0])):
            if bloco[6] != 0:  # 0 = texto, 1 = imagem
                continue
            texto = normalizar(bloco[4])
            if not texto:
                continue
            # remenda parágrafo cortado pela virada de página
            if (
                primeiro_da_pagina
                and paras
                and not paras[-1].endswith(FIM_DE_FRASE)
                and texto[:1].islower()
            ):
                paras[-1] = f"{paras[-1]} {texto}"
            else:
                paras.append(texto)
            primeiro_da_pagina = False

    # tira a linha de título repetida no começo do capítulo (pode vir quebrada)
    alvo = re.sub(r"\s+", " ", titulo.replace("|", "")).strip().lower()
    while paras:
        cabeca = re.sub(r"\s+", " ", paras[0].replace("|", "")).strip().lower()
        if cabeca and (alvo.startswith(cabeca) or cabeca == alvo):
            paras.pop(0)
        else:
            break
    return paras


def dollar(tag: str, valor: str) -> str:
    if f"${tag}$" in valor:
        raise SystemExit(f"conteúdo contém o delimitador ${tag}$")
    return f"${tag}${valor}${tag}$"


def main() -> None:
    doc = fitz.open(PDF)
    aulas = []
    for ordem, (titulo, ini, fim, antiga) in enumerate(SECOES, start=1):
        corpo = "\n\n".join(paragrafos(doc, ini, fim, titulo))
        if not corpo:
            raise SystemExit(f"seção vazia: {titulo}")
        aulas.append({"ordem": ordem, "titulo": titulo, "conteudo": corpo, "antiga": antiga})

    blocos = []
    for a in aulas:
        conteudo = dollar("conteudo", a["conteudo"])
        if a["antiga"] is None:
            blocos.append(
                f"""  -- {a['titulo']} (nova no banco)
  insert into public.aulas (curso_id, titulo, ordem, conteudo)
  values (v_curso_id, {dollar('t', a['titulo'])}, {a['ordem']},
{conteudo});"""
            )
        else:
            blocos.append(
                f"""  -- {a['titulo']} (reaproveita a aula de ordem {a['antiga']}: preserva o progresso)
  update public.aulas
  set titulo = {dollar('t', a['titulo'])},
      ordem = {a['ordem']},
      conteudo =
{conteudo},
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = {-a['antiga']};"""
            )

    corpo_sql = "\n\n".join(blocos)
    SAIDA.write_text(
        f"""-- {TITULO} ({AUTOR}) — reextração do PDF-fonte.
--
-- A carga anterior veio de uma extração corrompida: comia o "s" das passagens em
-- itálico, trocava versaletes por glifos Sinhala, duplicava 8 capítulos (aulas de
-- ordem 20 a 27 repetiam o texto das de ordem 3 a 12), despejava a bibliografia
-- inteira numa aula de 205 mil caracteres e não tinha o capítulo 16.
--
-- Esta migration reescreve o livro inteiro a partir do PDF (script
-- scripts/gerar-pastor-imperfeito.py): 23 mesas na ordem do sumário, incluindo as
-- quatro aberturas de parte e o capítulo 16. As 19 aulas legítimas são
-- REAPROVEITADAS pelo id (o progresso e as matrículas dos alunos sobrevivem); as
-- 9 aulas-lixo são apagadas. Todo audio_leitura_url é zerado — o áudio existente
-- foi narrado em cima do texto corrompido e precisa ser regerado.

do $migration$
declare
  v_curso_id uuid;
  v_aulas int;
begin
  select id into v_curso_id from public.cursos where slug = '{SLUG}';
  if v_curso_id is null then
    raise exception 'curso {SLUG} não encontrado';
  end if;

  update public.cursos
  set titulo = {dollar('titulo', TITULO)},
      descricao = {dollar('desc', DESCRICAO)},
      imagem_url = '{CAPA}',
      categoria = 'ensino',
      publicado = true,
      audio_status = 'nenhum',
      audio_progresso = 0,
      audio_total = {len(aulas)},
      audio_falhas = 0,
      audio_lock_ate = null,
      audio_pronto_em = null
  where id = v_curso_id;

  -- 1) fora as aulas-lixo da extração velha (duplicatas + bibliografia)
  delete from public.aulas where curso_id = v_curso_id and ordem >= 20;

  -- 2) desloca as legítimas pra faixa negativa, pra remapear a ordem sem colidir
  update public.aulas set ordem = -ordem where curso_id = v_curso_id and ordem > 0;

  -- 3) reescreve cada mesa (update reaproveita o id; insert só onde faltava)
{corpo_sql}

  select count(*) into v_aulas from public.aulas where curso_id = v_curso_id;
  if v_aulas <> {len(aulas)} then
    raise exception 'esperado {len(aulas)} aulas, encontrado %', v_aulas;
  end if;
  if exists (select 1 from public.aulas where curso_id = v_curso_id and ordem < 1) then
    raise exception 'sobrou aula com ordem negativa (mapeamento incompleto)';
  end if;
end;
$migration$;
""",
        encoding="utf-8",
    )

    total = sum(len(a["conteudo"]) for a in aulas)
    print(f"✓ {SAIDA.name}  ({len(aulas)} mesas, {total:,} caracteres)")
    for a in aulas:
        print(f"   {a['ordem']:2d}. {a['titulo'][:46]:<46} {len(a['conteudo']):>7,} chars")


if __name__ == "__main__":
    main()
