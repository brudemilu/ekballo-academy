import json,re,unicodedata,sys
def norm(t):
    t=unicodedata.normalize("NFD",t)
    t="".join(c for c in t if unicodedata.category(c)!="Mn")
    return re.findall(r"[a-z]+",t.lower())

slug,velho=sys.argv[1],sys.argv[2]
d=json.load(open("db/livros.json"))
aulas=sorted([a for a in d if a["slug"]==slug],key=lambda x:x["ordem"])
pags=open(velho,encoding="utf-8",errors="replace").read().split("\f")
conte=[set(norm(a["conteudo"])) for a in aulas]
cont_seq=[" ".join(norm(a["conteudo"])) for a in aulas]
print(f"{slug}: {len(aulas)} aulas | extração velha tem {len(pags)} páginas")
mapa={}
for i,p in enumerate(pags):
    w=norm(p)
    if len(w)<25: continue
    # shingle do meio da página, procurado em cada aula
    sh=" ".join(w[len(w)//3:len(w)//3+10])
    hits=[j for j,c in enumerate(cont_seq) if sh in c]
    if len(hits)==1: mapa[i+1]=hits[0]
# consolida faixas
print("\n  aula -> páginas da extração velha")
for j,a in enumerate(aulas):
    ps=sorted(p for p,k in mapa.items() if k==j)
    faixa=f"{ps[0]}–{ps[-1]}" if ps else "NÃO ENCONTRADA"
    print(f"  [{a['ordem']:2}] {a['titulo'][:42]:42} {faixa:12} ({len(ps)} pág casadas)")
