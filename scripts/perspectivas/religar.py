# -*- coding: utf-8 -*-
"""Religa palavra partida por hífen e junta frase cortada entre parágrafos.

Etapa obrigatória do pipeline de foto: o critério de recuo fragmenta em página
fotografada, porque a perspectiva move o início de cada linha. Tentei trocar o
critério por fim-de-linha-curta e PIOROU (medido); então a religação ficou.

A guarda de título custou uma rodada: eu protegia título de ser colado ao texto
testando "curto, começa em maiúscula, não fecha em pontuação" — e frase cortada
no meio tem exatamente essas três marcas, então a guarda barrava justamente as
junções necessárias. Título só é título se o parágrafo SEGUINTE começa em
maiúscula.
"""
import re

MARCADOR = re.compile(r"^\[(figura|cite|quadro)\]")
PARTE = re.compile(r"^PARTE \d+ DE \d+$")
FECHADO = re.compile(r"[.!?:;»\"”')\]]\s*$")
INICIO_NOVO = re.compile(r"^(\[|[0-9]+[.)]\s|[•·–—-]\s|[A-ZÀ-Ú]\.\s)")


def _e_titulo(p):
    if len(p) > 90:
        return False
    if p.isupper():
        return True
    return bool(re.match(r"^[A-ZÀ-Ú][^.!?]*$", p)) and len(p) < 70


def religar(texto):
    out = []
    for p in (x.strip() for x in texto.split("\n\n")):
        if not p:
            continue
        if not out:
            out.append(p)
            continue
        ant = out[-1]
        if (MARCADOR.match(p) or MARCADOR.match(ant) or INICIO_NOVO.match(p)
                or PARTE.match(ant) or PARTE.match(p)):
            out.append(p)
            continue
        # hífen de quebra: sempre religa — linha terminada em hífen não é título
        if ant.endswith("-") and re.match(r"[a-zà-ú]", p):
            out[-1] = ant[:-1] + p
            continue
        continua_minuscula = bool(re.match(r"[a-zà-ú]", p))
        if not continua_minuscula and (_e_titulo(ant) or _e_titulo(p)):
            out.append(p)
            continue
        if not FECHADO.search(ant) and re.match(r"[a-zà-ú(“\"]", p):
            out[-1] = ant + " " + p
            continue
        out.append(p)
    return "\n\n".join(re.sub(r"\s{2,}", " ", x).strip() for x in out)
