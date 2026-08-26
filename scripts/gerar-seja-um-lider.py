#!/usr/bin/env python3
"""Reextrai "Seja um Líder de Verdade" (John Haggai) do PDF-fonte.

Por que existe: a carga atual (migration 054, rascunhos em
scripts/_seja-um-lider-draft/) não é transcrição — foi gerada lendo o PDF e
reescrevendo, e por isso condensou parágrafos. A estrutura de seções sobreviveu
inteira, mas o corpo de cada seção perdeu texto. O sintoma aparece na densidade:
o capítulo 11 tem 77,9 palavras por parágrafo contra 56,4 do capítulo 4 — menos
parágrafos, cada um mais gordo, que é a assinatura de texto resumido.

Este script transcreve palavra por palavra, sem passar por modelo nenhum:
PyMuPDF devolve os parágrafos já agrupados em blocos com geometria, e o único
tratamento é mecânico (ligaduras, hifenização de fim de linha, cabeçalho
corrido, parágrafo cortado pela virada de página).

    # 1) confere onde o script achou cada capítulo, sem gravar nada
    python3 scripts/gerar-seja-um-lider.py --pdf "~/Downloads/livro.pdf" --relatorio

    # 2) reextrai só o capítulo 11 (Bruno está lendo esse)
    python3 scripts/gerar-seja-um-lider.py --pdf "..." --cap 11

    # 3) o livro inteiro
    python3 scripts/gerar-seja-um-lider.py --pdf "..."
"""

import argparse
import re
import sys
import unicodedata
from pathlib import Path

import fitz  # PyMuPDF

RAIZ = Path(__file__).parent.parent
DRAFT = RAIZ / "scripts/_seja-um-lider-draft"
SAIDA_MD = RAIZ / "scripts/_seja-um-lider-reextraido"
SLUG = "seja-um-lider-de-verdade"

# (ordem, título da aula, arquivo do rascunho atual, página, índice do bloco)
# Onde cada capítulo COMEÇA, 1-based na página e 0-based no bloco do PyMuPDF.
# Faixa de página não serve para este livro: o texto corre contínuo e vários
# capítulos abrem no meio da página (o 2 abre no bloco 6 da pág. 21, logo depois
# do SUMÁRIO do capítulo 1). Os marcadores foram achados varrendo os blocos
# atrás do título de abertura ("O Princípio da VISÃO" etc.), ignorando o sumário
# do livro na pág. 7. Cada capítulo termina no bloco anterior ao início do
# seguinte; o 13 termina onde começam as Notas (pág. 221).
CAPITULOS = [
    (1,  "1. Um Chamado à Liderança",                 "02-cap01-chamado.md",          11, 0),
    (2,  "2. O Princípio da Visão",                    "03-cap02-visao.md",            21, 6),
    (3,  "3. O Princípio do Estabelecimento de Metas", "04-cap03-metas.md",            36, 0),
    (4,  "4. O Princípio do Amor",                     "05-cap04-amor.md",             57, 0),
    (5,  "5. O Princípio da Humildade",                "06-cap05-humildade.md",        72, 9),
    (6,  "6. O Princípio do Autocontrole",             "07-cap06-autocontrole.md",     86, 6),
    (7,  "7. O Princípio da Comunicação",              "08-cap07-comunicacao.md",     100, 4),
    (8,  "8. O Princípio do Investimento",             "09-cap08-investimento.md",    122, 6),
    (9,  "9. O Princípio da Oportunidade",             "10-cap09-oportunidade.md",    141, 9),
    (10, "10. O Princípio da Energia",                 "11-cap10-energia.md",         157, 0),
    (11, "11. O Princípio do Poder da Persistência",   "12-cap11-persistencia.md",    172, 0),
    (12, "12. O Princípio da Autoridade",              "13-cap12-autoridade.md",      191, 1),
    (13, "13. O Princípio da Conscientização",         "14-cap13-conscientizacao.md", 204, 3),
]
FIM_DO_LIVRO = (221, 0)  # início das Notas


FIM_DE_FRASE = tuple('.!?…:"”»)]›’')


def normalizar(texto: str) -> str:
    """Limpeza puramente mecânica — nada aqui reescreve o texto do autor."""
    texto = texto.replace("ﬁ", "fi").replace("ﬂ", "fl").replace("ﬀ", "ff")
    texto = texto.replace("­", "")               # hífen suave
    texto = re.sub(r"\bf ([il])", r"f\1", texto)  # ligadura quebrada: "signif icado"
    texto = texto.replace("\n", " ")
    texto = re.sub(r"([a-zà-ÿ])-\s+", r"\1", texto)  # rejunta hifenização de fim de linha
    texto = re.sub(r"\s+([,.;:!?])", r"\1", texto)
    texto = re.sub(r"\s+", " ", texto)
    return unicodedata.normalize("NFC", texto).strip()


def eh_cabecalho(texto: str) -> bool:
    """Cabeçalho corrido / número de página solto."""
    if re.fullmatch(r"\d{1,3}", texto):
        return True
    if len(texto) < 60 and re.search(r"SEJA UM L[IÍ]DER DE VERDADE", texto, re.I):
        return True
    return False


def chave(titulo: str) -> str:
    """Título sem número, sem acento, minúsculo — pra casar com o PDF."""
    t = re.sub(r"^\d+\.\s*", "", titulo).lower()
    t = unicodedata.normalize("NFD", t)
    t = "".join(c for c in t if unicodedata.category(c) != "Mn")
    return re.sub(r"[^a-z ]", "", t).strip()




def titulos_secao(arquivo: str) -> list[str]:
    """Títulos de seção do rascunho atual, usados como gabarito.

    A carga da 054 condensou o CORPO de cada seção, mas preservou a ESTRUTURA:
    os 18 subtítulos do capítulo 11 estão lá, na ordem certa. Então o rascunho é
    fonte confiável para "o que é título" — só não é para "o que o autor
    escreveu". É isso que separa um título de um parágrafo partido pela virada
    de página, coisa que fonte e geometria não resolvem neste PDF (as seções ora
    saem em itálico, ora no mesmo corpo 15 do texto).
    """
    t = (DRAFT / arquivo).read_text(encoding="utf-8")
    return [re.sub(r"^#+\s*", "", l).strip() for l in t.splitlines() if l.startswith("##")]



def modernizar(texto: str) -> str:
    """Grafia de 1990 -> Acordo Ortográfico, mecanicamente.

    O livro é da Betânia/1990 e usa trema e acento em ditongo aberto de
    paroxítona. A carga anterior já vinha modernizada; transcrever cru
    regrediria a grafia do livro inteiro, então normalizamos aqui. As duas
    regras não trocam nenhuma palavra — só tiram sinal gráfico abolido:

    - trema: sempre cai ("freqüentemente" -> "frequentemente");
    - ditongo aberto ÉI/ÓI só perde o acento em PAROXÍTONA, por isso os padrões
      exigem sílaba depois ("idéia" -> "ideia", "Coréia" -> "Coreia"). Oxítonas
      e monossílabos mantêm o acento e ficam intactos: "céu", "hotéis",
      "papéis", "destrói", "herói".
    """
    texto = texto.replace("ü", "u").replace("Ü", "U")
    texto = re.sub(r"éi(?=[aeiou])", "ei", texto)
    texto = re.sub(r"ÉI(?=[AEIOU])", "EI", texto)
    texto = re.sub(r"ói(?=[aeiou]|c[oa]s?\b)", "oi", texto)
    return texto


def eh_lixo(texto: str) -> bool:
    if len(texto) <= 2 and not texto[:1].isalnum():
        return True
    return eh_cabecalho(texto)


def tira_notas(texto: str) -> str:
    """Remove a chamada de nota final grudada na pontuação ("praticante.35")."""
    return re.sub(r"([.,;:!?”\"’])\d{1,3}(?=\s|$)", r"\1", texto)


def blocos_do_livro(doc) -> list[tuple[int, int, str]]:
    """Todos os blocos de texto do PDF em ordem de leitura: (página, índice, texto)."""
    saida = []
    for pagina in range(doc.page_count):
        ordenados = sorted(doc[pagina].get_text("blocks"), key=lambda b: (b[1], b[0]))
        for i, b in enumerate(ordenados):
            if b[6] == 0:  # 0 = texto, 1 = imagem
                saida.append((pagina + 1, i, b[4]))
    return saida


def paragrafos(doc, todos, ini: tuple[int, int], fim: tuple[int, int],
               titulo: str, gabarito: list[str]) -> list[str]:
    """Transcreve os blocos entre os marcadores [ini, fim) em parágrafos."""
    chaves = {chave(t) for t in gabarito if chave(t)}
    alvo_cap = chave(titulo)
    i0 = next(i for i, (pg, bi, _) in enumerate(todos) if (pg, bi) == ini)
    i1 = next(i for i, (pg, bi, _) in enumerate(todos) if (pg, bi) == fim)

    brutos: list[tuple[str, bool]] = []
    for _, _, cru in todos[i0:i1]:
        texto = modernizar(tira_notas(normalizar(cru)))
        if not texto or eh_lixo(texto):
            continue
        k = chave(texto)
        if not brutos and k and (k in alvo_cap or alvo_cap in k):
            continue  # linha de título do próprio capítulo
        brutos.append((texto, k in chaves))

    paras: list[str] = []
    ultimo_titulo = False
    for texto, titulo_aqui in brutos:
        if (
            paras
            and not titulo_aqui
            and not ultimo_titulo
            and not paras[-1].endswith(FIM_DE_FRASE)
        ):
            paras[-1] = f"{paras[-1]} {texto}"  # parágrafo partido pela virada de página
        else:
            paras.append(texto)
        ultimo_titulo = titulo_aqui
    return paras


def stats_draft(arquivo: str) -> tuple[int, int]:
    t = (DRAFT / arquivo).read_text(encoding="utf-8")
    blocos = [x.strip() for x in re.split(r"\n\s*\n", t) if x.strip() and not x.startswith("#")]
    return len(t.split()), len(blocos)


def dollar(tag: str, valor: str) -> str:
    if f"${tag}$" in valor:
        raise SystemExit(f"conteúdo contém o delimitador ${tag}$")
    return f"${tag}${valor}${tag}$"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--pdf", required=True, help="caminho do PDF-fonte")
    ap.add_argument("--cap", type=int, action="append",
                    help="só este(s) capítulo(s); repetível. Sem isso, o livro inteiro")
    ap.add_argument("--relatorio", action="store_true",
                    help="só mostra o que achou; não grava nada")
    ap.add_argument("--migration", default=None, help="nome do .sql de saída")
    args = ap.parse_args()

    pdf = Path(args.pdf).expanduser()
    if not pdf.exists():
        raise SystemExit(f"PDF não encontrado: {pdf}")

    doc = fitz.open(pdf)
    todos = blocos_do_livro(doc)
    alvos = args.cap or [c[0] for c in CAPITULOS]
    # cada capítulo vai do seu marcador até o marcador do seguinte
    inicios = [(c[3], c[4]) for c in CAPITULOS] + [FIM_DO_LIVRO]

    print(f"{'cap':>3} {'págs':>9} {'novo pal':>9} {'novo par':>9} "
          f"{'atual pal':>10} {'atual par':>10} {'ganho':>7}")
    extraidos = {}
    for idx, (ordem, titulo, arquivo, pag, bloco) in enumerate(CAPITULOS):
        if ordem not in alvos:
            continue
        ini, fim = inicios[idx], inicios[idx + 1]
        paras = paragrafos(doc, todos, ini, fim, titulo, titulos_secao(arquivo))
        corpo = "\n\n".join(paras)
        if not corpo:
            raise SystemExit(f"capítulo {ordem} saiu vazio")
        extraidos[ordem] = (titulo, corpo)
        npal, npar = len(corpo.split()), len(paras)
        apal, apar = stats_draft(arquivo)
        ganho = f"{(npal / apal - 1) * 100:+.0f}%" if apal else "—"
        print(f"{ordem:>3} {f'{ini[0]}-{fim[0]}':>9} {npal:>9} {npar:>9} "
              f"{apal:>10} {apar:>10} {ganho:>7}")

    if args.relatorio:
        print("\n(relatório apenas — nada foi gravado)")
        return

    SAIDA_MD.mkdir(exist_ok=True)
    for ordem, (titulo, corpo) in sorted(extraidos.items()):
        destino = SAIDA_MD / f"cap{ordem:02d}.md"
        destino.write_text(f"# {titulo}\n\n{corpo}\n", encoding="utf-8")
        print(f"gravado {destino.relative_to(RAIZ)}")

    nome = args.migration or "NNN_seja_um_lider_reextracao.sql"
    saida = RAIZ / "supabase/migrations" / nome
    blocos = []
    for ordem, (titulo, corpo) in sorted(extraidos.items()):
        blocos.append(
            f"""  -- {titulo}
  update public.aulas
  set conteudo =
{dollar('conteudo', corpo)},
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = {ordem};"""
        )

    saida.write_text(
        f"""-- Seja um Líder de Verdade (John Haggai) — reextração do PDF-fonte.
--
-- A carga da migration 054 não era transcrição: o texto foi lido e reescrito, e
-- saiu condensado (parágrafos inteiros perdidos dentro de cada seção, embora a
-- estrutura de subtítulos tenha sobrevivido). Esta migration substitui o
-- conteúdo pelo texto transcrito palavra por palavra do PDF, via PyMuPDF, sem
-- passar por modelo nenhum (script scripts/gerar-seja-um-lider.py).
--
-- Os ids das aulas não mudam — matrículas e progresso dos alunos sobrevivem.
-- audio_leitura_url é zerado nos capítulos tocados: o MP3 existente foi narrado
-- em cima do texto condensado e precisa ser regerado.

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = '{SLUG}';
  if v_curso_id is null then
    raise exception 'curso {SLUG} não encontrado';
  end if;

{chr(10).join(blocos)}

  update public.cursos
  set audio_status = 'nenhum', audio_progresso = 0
  where id = v_curso_id;
end
$migration$;
""",
        encoding="utf-8",
    )
    print(f"gravado {saida.relative_to(RAIZ)}")


if __name__ == "__main__":
    main()
