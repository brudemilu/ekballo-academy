#!/usr/bin/env python3
"""
Importa as respostas da planilha antiga do Teste de Dons (Google Forms
"DONS MINISTERIAIS (Efésios 4.11) (respostas).xlsx") — issue #289.

    python3 -I scripts/importar-dons-planilha.py <planilha.xlsx> > importar.sql
    python3 -I scripts/importar-dons-planilha.py <planilha.xlsx> --json > conferir.json

O SQL sai na saída padrão e NÃO deve entrar no repositório: ele tem
nome, idade e telefone das pessoas (o repo é público). Gere no
scratchpad, aplique no banco do box e apague.

Idempotente: os ids são derivados do conteúdo (uuid5), e os INSERT usam
`on conflict (id) do nothing`. Rodar duas vezes não duplica nada.

A regra de pontuação aqui ESPELHA lib/dons.ts. Se uma mudar, a outra
tem de mudar junto — por isso a saída --json existe: ela permite
conferir este script contra a rota real (/api/dons/<token>) em modo
mock, que usa o código TypeScript.

Depende de openpyxl (já presente no Python desta máquina).
"""

import json
import re
import sys
import unicodedata
import uuid
from datetime import timezone, timedelta

import openpyxl

VERSAO = "efesios-4-11-v1"  # = VERSAO_TESTE em lib/dons.ts
NS = uuid.UUID("7d1f3c2a-9b8e-4f6a-a1d2-3c4b5e6f7089")
SP = timezone(timedelta(hours=-3))  # Brasil sem horário de verão desde 2019

DONS = [
    ("apostolo", "Apóstolo"),
    ("profeta", "Profeta"),
    ("pastor", "Pastor"),
    ("mestre", "Mestre"),
    ("evangelista", "Evangelista"),
]
FAIXAS_DOM = [
    (0, 45, "Indica que este não é o seu dom ministerial."),
    (46, 65, "Indica que você tem alguma influência neste dom ministerial."),
    (66, 85, "Indica que você pode se aperfeiçoar neste dom e fluir nele."),
    (86, 105, "Indica que você tem um encargo neste dom ministerial."),
    (106, 120, "Indica que você tem um chamado específico para este dom; você tem autoridade e o ofício."),
]
FAIXAS_VIDA = [
    (0, 10, "Indica que você precisa de ajuda urgente de seu pastor ou líder."),
    (11, 20, "Indica que você está com deficiências espirituais e precisa ser treinado e discipulado."),
    (21, 30, "Indica que você precisa evoluir para seu crescimento ministerial (procure um mentoreamento)."),
    (31, 35, "Indica que você tem uma capacidade espiritual adequada para assumir responsabilidades ministeriais."),
    (36, 40, "Indica que você tem autoridade espiritual."),
]


def faixa(p, faixas):
    for a, b, t in faixas:
        if a <= p <= b:
            return t
    return faixas[0][2] if p < faixas[0][0] else faixas[-1][2]


def pontuar(r):
    dons = {k: 0 for k, _ in DONS}
    for i, v in enumerate(r[10:160]):
        dons[DONS[i % 5][0]] += v
    return {"vida": sum(r[:10]), "dons": dons}


def pontuar_como_planilha(r):
    """A planilha somava, para Apóstolo, a pergunta 148 no lugar da 146."""
    p = pontuar(r)
    p["dons"]["apostolo"] += r[10 + 147] - r[10 + 145]
    return p


def resultado(p):
    nome = dict(DONS)
    valores = sorted({p["dons"][k] for k, _ in DONS}, reverse=True)
    prim = [k for k, _ in DONS if p["dons"][k] == valores[0]]
    sec = [] if len(prim) > 1 or len(valores) < 2 else [k for k, _ in DONS if p["dons"][k] == valores[1]]
    return {
        "versao": VERSAO,
        "vida": {"pontos": p["vida"], "maximo": 40, "faixa": faixa(p["vida"], FAIXAS_VIDA)},
        "dons": [
            {"dom": k, "nome": n, "pontos": p["dons"][k], "maximo": 120, "faixa": faixa(p["dons"][k], FAIXAS_DOM)}
            for k, n in DONS
        ],
        "primarios": [nome[k] for k in prim],
        "secundarios": [nome[k] for k in sec],
    }


def arrumar_nome(n):
    menores = {"de", "da", "do", "das", "dos", "e"}
    partes = re.sub(r"\s+", " ", n.strip()).split(" ")
    out = []
    for i, p in enumerate(partes):
        l = p.lower()
        out.append(l if i > 0 and l in menores else l[:1].upper() + l[1:])
    return " ".join(out)


def sem_acento(s):
    return "".join(c for c in unicodedata.normalize("NFD", s) if unicodedata.category(c) != "Mn").lower().strip()


def telefone(v):
    """Igual a normalizeTelefoneBR: E.164 sem '+', ou None."""
    if v is None:
        return None
    d = re.sub(r"\D+", "", str(int(v)) if isinstance(v, float) else str(v))
    if d.startswith("55") and len(d) in (12, 13):
        d = d[2:]
    return "55" + d if len(d) in (10, 11) else None


def idade(v):
    m = re.sub(r"\D+", "", str(int(v)) if isinstance(v, float) else str(v or ""))
    if not m:
        return None
    n = int(m)
    return n if 5 <= n <= 120 else None


def ler(caminho):
    ws = openpyxl.load_workbook(caminho, data_only=True)["Formulário Completo"]
    linhas = []
    for row in ws.iter_rows(min_row=2, values_only=True):
        if not row[0] or not row[1]:
            continue
        notas = row[4:164]
        if len(notas) != 160 or any(v is None for v in notas):
            print(f"-- ignorada (incompleta): {row[1]!r}", file=sys.stderr)
            continue
        r = [int(v) for v in notas]
        if any(v < 0 or v > 4 for v in r):
            print(f"-- ignorada (nota fora de 0–4): {row[1]!r}", file=sys.stderr)
            continue
        linhas.append({
            "quando": row[0].replace(tzinfo=SP),
            "nome": arrumar_nome(str(row[1])),
            "idade": idade(row[2]),
            "telefone": telefone(row[3]),
            "respostas": r,
        })
    return linhas


def agrupar(linhas):
    """Mesmo telefone E mesmo primeiro nome = mesma pessoa (lib/dons.ts → mesmaPessoa)."""
    grupos = {}
    for l in linhas:
        primeiro = sem_acento(l["nome"]).split(" ")[0]
        chave = f"{l['telefone']}|{primeiro}" if l["telefone"] else f"sem-tel|{sem_acento(l['nome'])}"
        grupos.setdefault(chave, []).append(l)
    return grupos


def q(v):
    if v is None:
        return "null"
    if isinstance(v, (int,)):
        return str(v)
    return "'" + str(v).replace("'", "''") + "'"


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    linhas = ler(sys.argv[1])

    if "--json" in sys.argv:
        json.dump([
            {**{k: l[k] for k in ("nome", "idade", "respostas")}, "telefone": l["telefone"],
             "resultado": resultado(pontuar(l["respostas"]))}
            for l in linhas
        ], sys.stdout, ensure_ascii=False)
        return

    grupos = agrupar(linhas)
    print("-- Importação da planilha antiga do Teste de Dons (issue #289). NÃO versionar.")
    print(f"-- {len(linhas)} respostas, {len(grupos)} pessoas.")
    print("begin;")
    for chave, ls in grupos.items():
        ls.sort(key=lambda l: l["quando"])
        pid = uuid.uuid5(NS, "pessoa:" + chave)
        nome = max((l["nome"] for l in ls), key=len)  # o nome mais completo
        print(
            "insert into public.dons_pessoas (id, nome, telefone, criado_em) values "
            f"({q(str(pid))}, {q(nome)}, {q(ls[0]['telefone'])}, {q(ls[0]['quando'].isoformat())}) "
            "on conflict (id) do nothing;"
        )
        for l in ls:
            rid = uuid.uuid5(NS, f"resposta:{l['quando'].isoformat()}:{l['nome']}")
            p = pontuar(l["respostas"])
            cols = {
                "id": q(str(rid)),
                "pessoa_id": q(str(pid)),
                "respondido_em": q(l["quando"].isoformat()),
                "nome_informado": q(l["nome"]),
                "idade": q(l["idade"]),
                "telefone_informado": q(l["telefone"]),
                "versao": q(VERSAO),
                "respostas": q("{" + ",".join(map(str, l["respostas"])) + "}") + "::smallint[]",
                "pontuacao": q(json.dumps(p, ensure_ascii=False)) + "::jsonb",
                "resultado_exibido": q(json.dumps(resultado(p), ensure_ascii=False)) + "::jsonb",
                "pontuacao_planilha": q(json.dumps(pontuar_como_planilha(l["respostas"]), ensure_ascii=False)) + "::jsonb",
                "origem": q("planilha"),
                # Respostas antigas não chegam como "novas" no painel.
                "vista_em": q(l["quando"].isoformat()),
            }
            print(
                f"insert into public.dons_respostas ({', '.join(cols)}) values ({', '.join(cols.values())}) "
                "on conflict (id) do nothing;"
            )
    print("commit;")


if __name__ == "__main__":
    main()
