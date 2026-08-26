#!/usr/bin/env python3
"""Diagnostica, para cada livro do acervo, o que a carga original deixou de fora.

O padrão descoberto ao corrigir os três primeiros livros à mão:

- O texto corrido quase nunca falta. O que se perdeu foram as NOTAS de rodapé
  (as citações), as FIGURAS e os ornamentos de abertura.
- A assinatura das notas é tipográfica: o miolo tem um corpo dominante (o texto)
  e um corpo menor que carrega as notas. Seções curtas sem nota batem 100%
  enquanto os capítulos ficam em 86-95% — é diferença sistemática, não perda
  capítulo a capítulo.
- PEGADINHA (achada em "Aqueles da Bíblia"): o corpo menor nem sempre é só nota.
  Pode carregar também as CITAÇÕES RECUADAS, que já fazem parte do texto e já
  estão no banco. Anexar sem conferir duplica prosa. Por isso todo bloco passa
  por checagem de contenção contra o texto ao vivo antes de entrar.

Este script só MEDE. Não escreve no banco.

    python3 scripts/analisar-livros.py --slug <slug> --pdf <arquivo>
"""

import argparse
import collections
import difflib
import json
import re
import unicodedata
import warnings

import fitz

warnings.filterwarnings("ignore")


def chave(s: str) -> list[str]:
    s = unicodedata.normalize("NFD", s.lower())
    s = "".join(c for c in s if unicodedata.category(c) != "Mn")
    return re.findall(r"[a-z0-9]+", s)


def perfil_de_corpo(doc, ini: int, fim: int) -> list[tuple[float, int]]:
    """Quantos caracteres em cada corpo de fonte, do mais usado ao menos."""
    tam = collections.Counter()
    for p in range(ini - 1, min(fim, doc.page_count)):
        for b in doc[p].get_text("dict")["blocks"]:
            if b.get("type") != 0:
                continue
            for l in b["lines"]:
                for s in l["spans"]:
                    if s["text"].strip():
                        tam[round(s["size"], 1)] += len(s["text"])
    return sorted(tam.items(), key=lambda x: -x[1])


def blocos_no_corpo(doc, ini: int, fim: int, alvo: float, tol: float) -> list[str]:
    """Blocos de texto cujo corpo de fonte fica perto de `alvo`."""
    out = []
    for p in range(ini - 1, min(fim, doc.page_count)):
        for b in sorted(doc[p].get_text("dict")["blocks"], key=lambda b: b.get("bbox", [0, 0])[1]):
            if b.get("type") != 0:
                continue
            linhas = []
            for l in b["lines"]:
                sz = [s["size"] for s in l["spans"] if s["text"].strip()]
                if sz and abs(sum(sz) / len(sz) - alvo) < tol:
                    linhas.append("".join(s["text"] for s in l["spans"]).strip())
            if linhas:
                txt = re.sub(r"\s+", " ", " ".join(linhas)).strip()
                txt = re.sub(r"([a-zà-ÿ])-\s+", r"\1", txt)
                if txt:
                    out.append(txt)
    return out


def ja_no_texto(bloco: str, base: list[str], limiar: float = 0.6) -> bool:
    """O bloco já está no texto ao vivo? (evita duplicar citação recuada)"""
    alvo = chave(bloco)
    if len(alvo) < 3:
        return True
    m = difflib.SequenceMatcher(None, alvo, base, autojunk=False)
    return m.find_longest_match(0, len(alvo), 0, len(base)).size >= limiar * len(alvo)


def inventario_de_imagens(doc, ini: int, fim: int) -> dict:
    """Separa ornamento de abertura de figura de conteúdo pelo tamanho na página."""
    import hashlib

    vistos, conteudo, ornamento = set(), [], []
    for p in range(ini - 1, min(fim, doc.page_count)):
        pr = doc[p].rect
        for im in doc[p].get_images(full=True):
            try:
                x = doc.extract_image(im[0])
            except Exception:
                continue
            h = hashlib.md5(x["image"]).hexdigest()[:8]
            if h in vistos:
                continue
            vistos.add(h)
            try:
                r = doc[p].get_image_rects(im[0])[0]
                frac = (r.width * r.height) / (pr.width * pr.height)
            except Exception:
                frac = 0
            reg = {"pg": p + 1, "xref": im[0], "frac": round(frac, 2)}
            (conteudo if frac >= 0.10 else ornamento).append(reg)
    return {"conteudo": conteudo, "ornamento": ornamento}


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--pdf", required=True)
    ap.add_argument("--secoes", required=True,
                    help='JSON: [[ordem, ini, fim, chars_no_banco], ...]')
    ap.add_argument("--texto", help="arquivo com o conteúdo atual (para contenção)")
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args()

    doc = fitz.open(args.pdf)
    secoes = json.loads(args.secoes)

    ini_geral = min(s[1] for s in secoes)
    fim_geral = max(s[2] for s in secoes)
    perfil = perfil_de_corpo(doc, ini_geral, fim_geral)
    corpo_texto = perfil[0][0] if perfil else 0
    menores = [t for t, _ in perfil[1:4] if t < corpo_texto * 0.85]
    corpo_nota = menores[0] if menores else None

    vivo = {}
    if args.texto:
        raw = open(args.texto, encoding="utf-8").read()
        for b in raw.split("§"):
            if "‡" not in b:
                continue
            cab, c = b.split("‡", 1)
            o = cab.strip().split("\n")[-1].strip()
            if o.isdigit():
                vivo[int(o)] = c

    res = {"corpo_texto": corpo_texto, "corpo_nota": corpo_nota, "secoes": []}
    for ordem, i, f, db in secoes:
        pdf = sum(len(doc[p].get_text("text")) for p in range(i - 1, min(f, doc.page_count)))
        lacuna = pdf - db
        novos = []
        if corpo_nota:
            base = chave(vivo.get(ordem, "")) if vivo else None
            for blo in blocos_no_corpo(doc, i, f, corpo_nota, max(0.6, corpo_nota * 0.2)):
                if base is not None and ja_no_texto(blo, base):
                    continue
                novos.append(blo)
        res["secoes"].append({
            "ordem": ordem, "pdf": pdf, "db": db, "lacuna": lacuna,
            "cobertura": round(db / max(pdf, 1), 3),
            "notas_novas": len(novos), "notas_chars": sum(len(x) for x in novos),
            "notas": novos,
        })
    res["imagens"] = inventario_de_imagens(doc, ini_geral, fim_geral)

    if args.json:
        print(json.dumps(res, ensure_ascii=False))
        return
    print(f"corpo do texto: {corpo_texto} | corpo das notas: {corpo_nota}")
    print(f"{'mesa':>5} {'cobert':>7} {'lacuna':>8} {'notas':>7} {'chars':>8}")
    for s in res["secoes"]:
        print(f"{s['ordem']:>5} {s['cobertura']*100:>6.0f}% {s['lacuna']:>8} "
              f"{s['notas_novas']:>7} {s['notas_chars']:>8}")
    im = res["imagens"]
    print(f"\nimagens: {len(im['conteudo'])} de conteúdo, {len(im['ornamento'])} ornamento")


if __name__ == "__main__":
    main()
