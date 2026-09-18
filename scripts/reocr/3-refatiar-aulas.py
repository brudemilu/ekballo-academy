import json,re,unicodedata,sys
def norm(t):
    t=unicodedata.normalize("NFD",t); t="".join(c for c in t if unicodedata.category(c)!="Mn")
    return re.findall(r"[a-z]+",t.lower())

def faixas(slug,velho,aulas):
    pags=open(velho,encoding="utf-8",errors="replace").read().split("\f")
    seq=[" ".join(norm(a["conteudo"])) for a in aulas]
    mapa={}
    for i,p in enumerate(pags):
        w=norm(p)
        if len(w)<25: continue
        sh=" ".join(w[len(w)//3:len(w)//3+10])
        hits=[j for j,c in enumerate(seq) if sh in c]
        if len(hits)==1: mapa[i+1]=hits[0]
    out=[]
    for j in range(len(aulas)):
        ps=sorted(p for p,k in mapa.items() if k==j)
        # maior bloco contíguo (descarta página de sumário que casou por acaso)
        melhor=cur=[ps[0]] if ps else []
        for p in ps[1:]:
            if p-cur[-1]<=3: cur.append(p)
            else:
                if len(cur)>len(melhor): melhor=cur
                cur=[p]
        if len(cur)>len(melhor): melhor=cur
        out.append((melhor[0],melhor[-1]) if melhor else None)
    # fecha buracos: fim de uma = início da próxima - 1
    for j in range(len(out)-1):
        if out[j] and out[j+1]: out[j]=(out[j][0],out[j+1][0]-1)
    return out

def paragrafos(txt):
    blocos=[]; atual=[]
    for ln in txt.split("\n"):
        if ln.strip(): atual.append(ln.strip())
        elif atual: blocos.append(" ".join(atual)); atual=[]
    if atual: blocos.append(" ".join(atual))
    return "\n\n".join(blocos)

d=json.load(open("db/livros.json"))
saida=[]
for slug,velho,novo in [
  ("sexualidade-sem-censura","pdfs/sexualidade.txt","ocr/sexualidade.txt"),
  ("o-que-voce-precisa-saber-sobre-batalha-espiritual","pdfs/batalha-espiritual.txt","ocr/batalha.txt")]:
    aulas=sorted([a for a in d if a["slug"]==slug],key=lambda x:x["ordem"])
    fx=faixas(slug,velho,aulas)
    pn=open(novo,encoding="utf-8",errors="replace").read().split("\f")
    print(f"=== {slug} ===")
    for a,f in zip(aulas,fx):
        if not f: print(f"  [{a['ordem']}] SEM FAIXA — pulada"); continue
        ini,fim=f
        txt=paragrafos("\n".join(pn[ini-1:fim]))
        print(f"  [{a['ordem']:2}] p{ini}–{fim}  {len(a['conteudo']):6}ch -> {len(txt):6}ch")
        saida.append({"slug":slug,"id":a["id"],"ordem":a["ordem"],"titulo":a["titulo"],"conteudo":txt})
    print()
json.dump(saida,open("db/reocr.json","w"),ensure_ascii=False)
print(f"{len(saida)} aulas gravadas em db/reocr.json")
