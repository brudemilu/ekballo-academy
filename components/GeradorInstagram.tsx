"use client";

import { useEffect, useState } from "react";

// Fontes pra prévia ao vivo (mesmas do servidor). Carregadas via @font-face.
const FONT_FACES = `
@font-face { font-family: 'AntonPv'; src: url('/fonts/anton.ttf'); }
@font-face { font-family: 'BebasPv'; src: url('/fonts/bebas.ttf'); }
@font-face { font-family: 'DMSerifPv'; src: url('/fonts/dm-serif.ttf'); }
@font-face { font-family: 'CormorantPv'; src: url('/fonts/cormorant-italic.ttf'); font-style: italic; }
`;
const CREAM = "#F5EDDE";
const INK = "#0B0F1A";
const SOMBRA = "0 2px 12px rgba(0,0,0,0.92), 0 0 36px rgba(0,0,0,0.65)";
const FONT_CSS: Record<string, { fam: string; upper: boolean; style: string }> = {
  anton: { fam: "AntonPv", upper: true, style: "normal" },
  bebas: { fam: "BebasPv", upper: true, style: "normal" },
  "dm-serif": { fam: "DMSerifPv", upper: false, style: "normal" },
  cormorant: { fam: "CormorantPv", upper: false, style: "italic" },
};

type Modo = "circulo" | "grifo" | "marca" | "dourado" | "nenhum";
type Fonte = "anton" | "bebas" | "dm-serif" | "cormorant";
type Tipo = "carrossel" | "unico";

type Slide = {
  texto: string;
  prompt: string;
  modo: Modo;
  cor: string;
  fonte: Fonte;
  top: string;
  ref: string;
  seed: number;
};

const MODOS: { v: Modo; label: string }[] = [
  { v: "circulo", label: "Círculo" },
  { v: "grifo", label: "Grifo" },
  { v: "marca", label: "Marca-texto" },
  { v: "dourado", label: "Só cor" },
  { v: "nenhum", label: "Sem destaque" },
];

const FONTES: { v: Fonte; label: string }[] = [
  { v: "anton", label: "Anton" },
  { v: "bebas", label: "Bebas Neue" },
  { v: "dm-serif", label: "DM Serif" },
  { v: "cormorant", label: "Cormorant" },
];

function novoSeed() {
  return Math.floor(Math.random() * 1_000_000);
}

function ogSrc(s: Slide): string {
  const p = new URLSearchParams({
    verso: s.texto,
    prompt: s.prompt,
    modo: s.modo,
    realce: s.modo,
    cor: s.cor,
    fonte: s.fonte,
    seed: String(s.seed),
    n: "1",
    i: "0",
  });
  if (s.top.trim()) p.set("top", s.top.trim());
  if (s.ref.trim()) p.set("ref", s.ref.trim());
  return `/api/og/instagram?${p.toString()}`;
}

// Prévia AO VIVO: um quadro 1080px (igual ao servidor) escalado pra `size`.
// Texto/destaque/cor/fonte = CSS do navegador (instantâneo). Só o FUNDO (imagem
// Flux) vai ao servidor — e só quando muda o prompt/seed.
function SlidePreview({ slide, index, total, size = 300 }: { slide: Slide; index: number; total: number; size?: number }) {
  const scale = size / 1080;
  const f = FONT_CSS[slide.fonte] || FONT_CSS.anton;
  const cor = slide.cor;

  // fundo: só depende de prompt+seed (texto não refaz a imagem). Debounce no prompt.
  const alvoBg = `/api/og/instagram?bg=1&fonte=anton&prompt=${encodeURIComponent(slide.prompt)}&seed=${slide.seed}`;
  const [bg, setBg] = useState(alvoBg);
  const [carregando, setCarregando] = useState(true);
  useEffect(() => {
    const t = setTimeout(() => setBg(alvoBg), 500);
    return () => clearTimeout(t);
  }, [alvoBg]);
  useEffect(() => { setCarregando(true); }, [bg]);

  // tamanho do texto (mesma fórmula do servidor)
  const plain = slide.texto.replace(/[{}]/g, "");
  const base = f.upper ? 132 : 84;
  const len = plain.length;
  const fs = len > 60 ? base * 0.62 : len > 36 ? base * 0.78 : len > 18 ? base * 0.92 : base;

  // palavras (marca {chave})
  const words: { t: string; accent: boolean }[] = [];
  for (const seg of slide.texto.split(/(\{[^}]*\})/)) {
    if (!seg) continue;
    const accent = seg.startsWith("{") && seg.endsWith("}");
    const inner = accent ? seg.slice(1, -1) : seg;
    for (const w of inner.split(/\s+/)) if (w) words.push({ t: f.upper ? w.toUpperCase() : w, accent });
  }

  const baseW = { fontFamily: f.fam, fontStyle: f.style, fontSize: fs, letterSpacing: f.upper ? 2 : -0.5, lineHeight: 1, color: CREAM, textShadow: SOMBRA } as const;

  function palavra(w: { t: string; accent: boolean }, k: number) {
    if (w.accent && slide.modo === "circulo")
      return <span key={k} style={{ display: "inline-flex", alignItems: "center", padding: "16px 34px", border: `6px solid ${cor}`, borderRadius: 56, transform: "rotate(-3deg)" }}><span style={{ ...baseW, display: "inline-block", transform: "rotate(3deg)" }}>{w.t}</span></span>;
    if (w.accent && slide.modo === "grifo")
      return <span key={k} style={{ display: "inline-flex", flexDirection: "column", alignItems: "center" }}><span style={baseW}>{w.t}</span><span style={{ alignSelf: "stretch", height: 7, marginTop: -fs * 0.14, borderRadius: 3, background: cor }} /></span>;
    if (w.accent && slide.modo === "marca")
      return <span key={k} style={{ ...baseW, color: INK, background: cor, padding: "0 16px", borderRadius: 4 }}>{w.t}</span>;
    if (w.accent && slide.modo === "dourado")
      return <span key={k} style={{ ...baseW, color: cor }}>{w.t}</span>;
    return <span key={k} style={baseW}>{w.t}</span>;
  }

  return (
    <div className="shrink-0">
      <div style={{ width: size, height: size, position: "relative", overflow: "hidden", borderRadius: 14, background: INK, boxShadow: "0 8px 30px rgba(0,0,0,0.45)" }}>
        <div style={{ position: "absolute", top: 0, left: 0, width: 1080, height: 1080, transform: `scale(${scale})`, transformOrigin: "top left" }}>
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src={bg} alt="" width={1080} height={1080} onLoad={() => setCarregando(false)} onError={() => setCarregando(false)} style={{ position: "absolute", top: 0, left: 0, width: 1080, height: 1080, objectFit: "cover" }} />
          <div style={{ position: "absolute", top: 0, left: 0, width: 1080, height: 1080, background: "linear-gradient(180deg, rgba(8,11,20,0.80) 0%, rgba(8,11,20,0.45) 26%, rgba(8,11,20,0.50) 50%, rgba(8,11,20,0.45) 74%, rgba(8,11,20,0.90) 100%)" }} />
          <div style={{ position: "absolute", top: 0, left: 0, width: 1080, height: 1080, background: "radial-gradient(ellipse 70% 42% at 50% 50%, rgba(6,9,15,0.62) 0%, rgba(6,9,15,0.32) 55%, rgba(6,9,15,0) 100%)" }} />
          <div style={{ position: "absolute", top: 0, left: 0, width: 1080, height: 1080, padding: "96px 80px", display: "flex", flexDirection: "column", justifyContent: "space-between", alignItems: "center", textAlign: "center", boxSizing: "border-box" }}>
            <div style={{ width: 7, height: 7, borderRadius: 999, background: cor }} />
            <div style={{ flex: 1, display: "flex", alignItems: "center", justifyContent: "center", padding: "30px 0" }}>
              <div style={{ display: "flex", flexWrap: "wrap", alignItems: "center", justifyContent: "center", columnGap: fs * 0.24, rowGap: fs * 0.12, maxWidth: "100%" }}>
                {words.map((w, k) => palavra(w, k))}
              </div>
            </div>
            <div style={{ width: 6, height: 6, borderRadius: 999, background: cor }} />
          </div>
        </div>
        {carregando && (
          <div style={{ position: "absolute", inset: 0, display: "flex", alignItems: "center", justifyContent: "center", background: "rgba(0,0,0,0.35)", color: "#fff", fontSize: 13, fontWeight: 500 }}>
            gerando fundo…
          </div>
        )}
      </div>
      <div className="mt-2 text-center text-xs text-mesa-500">
        {total > 1 ? `Slide ${index + 1} de ${total}` : "Imagem única"}
      </div>
    </div>
  );
}

export function GeradorInstagram() {
  const [tipo, setTipo] = useState<Tipo>("carrossel");
  const [conteudo, setConteudo] = useState("");
  const [montando, setMontando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [slides, setSlides] = useState<Slide[]>([]);
  const [legenda, setLegenda] = useState("");
  const [salvando, setSalvando] = useState(false);
  const [salvo, setSalvo] = useState(false);
  const [publicando, setPublicando] = useState(false);
  const [publicado, setPublicado] = useState<string | null>(null);

  async function montar() {
    setErro(null);
    setMontando(true);
    setSalvo(false);
    try {
      const res = await fetch("/api/admin/instagram/montar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ conteudo, tipo }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao montar.");
      const novos: Slide[] = (data.slides || []).map(
        (s: { texto: string; prompt: string; modo: Modo; cor: string }) => ({
          texto: s.texto,
          prompt: s.prompt,
          modo: s.modo || "circulo",
          cor: s.cor || "#C9A961",
          fonte: "anton" as Fonte,
          top: "",
          ref: "",
          seed: novoSeed(),
        }),
      );
      setSlides(novos);
      setLegenda(data.legenda || "");
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro inesperado.");
    } finally {
      setMontando(false);
    }
  }

  function patch(i: number, p: Partial<Slide>) {
    setSlides((prev) => prev.map((s, idx) => (idx === i ? { ...s, ...p } : s)));
    setSalvo(false);
  }
  function regerar(i: number) {
    patch(i, { seed: novoSeed() });
  }
  function removerSlide(i: number) {
    setSlides((prev) => prev.filter((_, idx) => idx !== i));
  }
  function adicionarSlide() {
    setSlides((prev) => [
      ...prev,
      { texto: "Novo {slide}", prompt: "soft golden light in darkness", modo: "circulo", cor: "#C9A961", fonte: "anton", top: "", ref: "", seed: novoSeed() },
    ]);
  }

  function baixarUm(s: Slide, idx: number) {
    const a = document.createElement("a");
    a.href = `${ogSrc(s)}&dl=1`;
    a.download = `slide-${idx + 1}.png`;
    document.body.appendChild(a);
    a.click();
    a.remove();
  }

  function baixarTodas() {
    slides.forEach((s, idx) => {
      setTimeout(() => baixarUm(s, idx), idx * 600);
    });
  }

  // Celular (iPhone): baixar várias de uma vez não salva na galeria. A bandeja
  // de compartilhar permite "Salvar imagens" todas de uma vez só.
  async function salvarNoCelular() {
    setErro(null);
    try {
      const files: File[] = [];
      for (let idx = 0; idx < slides.length; idx++) {
        const r = await fetch(`${ogSrc(slides[idx])}&dl=1`);
        if (!r.ok) throw new Error("falha");
        const b = await r.blob();
        files.push(new File([b], `slide-${idx + 1}.png`, { type: "image/png" }));
      }
      const nav = navigator as Navigator & {
        canShare?: (d: { files: File[] }) => boolean;
        share?: (d: { files: File[]; title?: string }) => Promise<void>;
      };
      if (nav.canShare && nav.share && nav.canShare({ files })) {
        await nav.share({ files, title: "Carrossel Ekballo" });
        return;
      }
      baixarTodas(); // sem Web Share: cai no download normal
    } catch (e) {
      if (e instanceof DOMException && e.name === "AbortError") return; // usuário cancelou
      baixarTodas();
    }
  }

  const podeCompartilhar =
    typeof navigator !== "undefined" &&
    typeof (navigator as Navigator & { share?: unknown }).share === "function";

  async function salvar() {
    setSalvando(true);
    setErro(null);
    try {
      const res = await fetch("/api/admin/instagram", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ conteudo, slides, legenda, tipo }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao salvar.");
      setSalvo(true);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao salvar.");
    } finally {
      setSalvando(false);
    }
  }

  async function publicar() {
    const qtd = slides.length;
    const ok = window.confirm(
      `Publicar AGORA no Instagram?\n\n${qtd === 1 ? "1 imagem" : `Carrossel de ${qtd} imagens`} + legenda.\nIsso vai ao ar no perfil de verdade.`,
    );
    if (!ok) return;
    setPublicando(true);
    setErro(null);
    setPublicado(null);
    try {
      const res = await fetch("/api/admin/instagram/publicar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ slides, legenda }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao publicar.");
      setPublicado(data.id || "ok");
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao publicar.");
    } finally {
      setPublicando(false);
    }
  }

  const temSlides = slides.length > 0;

  return (
    <div className="space-y-8">
      <style>{FONT_FACES}</style>
      {/* Entrada */}
      <div className="rounded-2xl border border-mesa-200 bg-white p-6">
        {/* tipo de post */}
        <div className="mb-4 flex gap-2">
          {([
            { v: "carrossel", label: "📚 Carrossel (vários slides)" },
            { v: "unico", label: "🖼️ Imagem única" },
          ] as { v: Tipo; label: string }[]).map((opt) => (
            <button
              key={opt.v}
              onClick={() => setTipo(opt.v)}
              className={`rounded-full border px-4 py-2 text-sm font-medium transition ${
                tipo === opt.v
                  ? "border-laranja-600 bg-laranja-50 text-laranja-700"
                  : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
              }`}
            >
              {opt.label}
            </button>
          ))}
        </div>

        <label className="mb-2 block text-sm font-medium text-mesa-700">Seu conteúdo</label>
        <textarea
          value={conteudo}
          onChange={(e) => setConteudo(e.target.value)}
          rows={5}
          placeholder="Ex.: Essa nova estação não será construída apenas por estratégias humanas. Ela será sustentada pela glória de Deus…"
          className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50 p-4 text-mesa-800 outline-none focus:border-mesa-400"
        />
        <div className="mt-4 flex items-center gap-3">
          <button
            onClick={montar}
            disabled={montando || conteudo.trim().length < 8}
            className="rounded-full bg-laranja-600 px-6 py-2.5 text-sm font-semibold text-white transition hover:bg-laranja-700 disabled:opacity-40"
          >
            {montando ? "Montando com IA…" : tipo === "unico" ? "✨ Gerar imagem com IA" : "✨ Montar carrossel com IA"}
          </button>
          {erro && <span className="text-sm text-red-600">{erro}</span>}
        </div>
      </div>

      {/* Slides */}
      {temSlides && (
        <div className="space-y-6">
          {slides.map((s, i) => (
            <div key={i} className="flex flex-col gap-5 rounded-2xl border border-mesa-200 bg-white p-5 md:flex-row">
              <SlidePreview slide={s} index={i} total={slides.length} />

              <div className="flex-1 space-y-3">
                <div>
                  <label className="mb-1 block text-xs font-medium text-mesa-600">
                    Texto <span className="text-mesa-400">— a palavra entre {"{ }"} vira o destaque</span>
                  </label>
                  <input
                    value={s.texto}
                    onChange={(e) => patch(i, { texto: e.target.value })}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400"
                  />
                </div>
                <div>
                  <label className="mb-1 block text-xs font-medium text-mesa-600">
                    Imagem (descrição em inglês) — o que aparece de fundo
                  </label>
                  <div className="flex gap-2">
                    <input
                      value={s.prompt}
                      onChange={(e) => patch(i, { prompt: e.target.value })}
                      className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400"
                    />
                    <button
                      onClick={() => regerar(i)}
                      title="Gerar outra imagem"
                      className="shrink-0 rounded-lg border border-mesa-200 px-3 py-2 text-sm text-mesa-700 transition hover:bg-mesa-100"
                    >
                      🔄 Regerar
                    </button>
                  </div>
                </div>
                <div className="flex flex-wrap items-end gap-3">
                  <div>
                    <label className="mb-1 block text-xs font-medium text-mesa-600">Destaque</label>
                    <select
                      value={s.modo}
                      onChange={(e) => patch(i, { modo: e.target.value as Modo })}
                      className="rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800"
                    >
                      {MODOS.map((m) => (
                        <option key={m.v} value={m.v}>{m.label}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="mb-1 block text-xs font-medium text-mesa-600">Cor</label>
                    <input
                      type="color"
                      value={s.cor}
                      onChange={(e) => patch(i, { cor: e.target.value })}
                      className="h-9 w-14 rounded border border-mesa-200 bg-white"
                    />
                  </div>
                  <div>
                    <label className="mb-1 block text-xs font-medium text-mesa-600">Fonte</label>
                    <select
                      value={s.fonte}
                      onChange={(e) => patch(i, { fonte: e.target.value as Fonte })}
                      className="rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800"
                    >
                      {FONTES.map((ft) => (
                        <option key={ft.v} value={ft.v}>{ft.label}</option>
                      ))}
                    </select>
                  </div>
                  <div className="grow" />
                  <button
                    onClick={() => baixarUm(s, i)}
                    title="Baixar esta imagem (PNG 1080×1080)"
                    className="rounded-lg border border-mesa-200 px-3 py-2 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100"
                  >
                    ⬇️ Baixar
                  </button>
                  {slides.length > 1 && (
                    <button
                      onClick={() => removerSlide(i)}
                      className="rounded-lg px-3 py-2 text-sm text-red-500 transition hover:bg-red-50"
                    >
                      Remover
                    </button>
                  )}
                </div>
                <div className="flex flex-wrap gap-3">
                  <input
                    value={s.top}
                    onChange={(e) => patch(i, { top: e.target.value })}
                    placeholder="Rótulo do topo (opcional)"
                    className="w-44 rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-xs text-mesa-800 outline-none focus:border-mesa-400"
                  />
                  <input
                    value={s.ref}
                    onChange={(e) => patch(i, { ref: e.target.value })}
                    placeholder="Rodapé / referência (opcional)"
                    className="w-44 rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-xs text-mesa-800 outline-none focus:border-mesa-400"
                  />
                </div>
              </div>
            </div>
          ))}

          {tipo === "carrossel" && (
            <button
              onClick={adicionarSlide}
              className="rounded-full border border-dashed border-mesa-300 px-5 py-2.5 text-sm font-medium text-mesa-600 transition hover:bg-mesa-100"
            >
              + Adicionar slide
            </button>
          )}

          {/* Legenda */}
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <label className="mb-2 block text-sm font-medium text-mesa-700">Legenda do post</label>
            <textarea
              value={legenda}
              onChange={(e) => {
                setLegenda(e.target.value);
                setSalvo(false);
              }}
              rows={5}
              className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50 p-4 text-sm text-mesa-800 outline-none focus:border-mesa-400"
            />
          </div>

          {/* Ações */}
          <div className="flex flex-wrap items-center gap-3">
            <button
              onClick={baixarTodas}
              className="rounded-full border border-mesa-300 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100"
            >
              ⬇️ Baixar {slides.length > 1 ? "todas as imagens" : "a imagem"}
            </button>
            {podeCompartilhar && (
              <button
                onClick={salvarNoCelular}
                title="Abre a bandeja do celular para salvar na galeria"
                className="rounded-full border border-mesa-300 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100"
              >
                📤 Salvar {slides.length > 1 ? "imagens" : "imagem"} (celular)
              </button>
            )}
            <button
              onClick={salvar}
              disabled={salvando}
              className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-mesa-800 disabled:opacity-40"
            >
              {salvando ? "Salvando…" : "💾 Salvar rascunho"}
            </button>
            {salvo && <span className="text-sm text-oliveira-700">Rascunho salvo ✓</span>}
            <button
              onClick={publicar}
              disabled={publicando}
              className="rounded-full bg-gradient-to-r from-pink-600 to-purple-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:opacity-90 disabled:opacity-40"
            >
              {publicando ? "Publicando…" : "📲 Publicar no Instagram"}
            </button>
            {publicado && (
              <span className="text-sm font-medium text-oliveira-700">Publicado no Instagram ✓</span>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
