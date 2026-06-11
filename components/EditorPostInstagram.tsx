"use client";

import { useEffect, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { TEMAS, TEMA_PADRAO, type TemaKey } from "@/lib/instagram-render";

/**
 * Painel para VER e EDITAR um post já salvo/agendado (imagens, vídeo e textos).
 * Aparece embutido em cada item da lista de "Agendados e rascunhos".
 *
 * - Carrossel/imagem (IA): edita texto, descrição da imagem (prompt), destaque,
 *   cor, fonte, rótulos; "regerar" troca a arte; dá pra remover/adicionar slide.
 * - Carrossel por upload: cada slide tem `imageUrl` pronta — dá pra trocar a foto.
 * - Reel: troca o vídeo e edita a legenda.
 * Salva via PATCH /api/admin/instagram (não mexe no agendamento nem no status).
 */

const FONT_FACES = `
@font-face { font-family: 'AntonPv'; src: url('/fonts/anton.ttf'); }
@font-face { font-family: 'BebasPv'; src: url('/fonts/bebas.ttf'); }
@font-face { font-family: 'DMSerifPv'; src: url('/fonts/dm-serif.ttf'); }
@font-face { font-family: 'CormorantPv'; src: url('/fonts/cormorant-italic.ttf'); font-style: italic; }
`;

type Modo = "circulo" | "grifo" | "marca" | "dourado" | "nenhum";
type Fonte = "anton" | "bebas" | "dm-serif" | "cormorant";

export type EdSlide = {
  texto?: string;
  prompt?: string;
  modo?: string;
  cor?: string;
  fonte?: string;
  top?: string;
  ref?: string;
  seed?: number;
  tema?: string;
  imageUrl?: string; // upload pronto
};

type Item = {
  id: string;
  tipo?: "carrossel" | "reel";
  legenda: string;
  slides?: unknown[];
  video_url?: string;
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

function ogSrc(s: EdSlide, tema: TemaKey): string {
  const p = new URLSearchParams({
    verso: s.texto || "",
    prompt: s.prompt || "",
    modo: s.modo || "circulo",
    realce: s.modo || "circulo",
    tema,
    fonte: s.fonte || "anton",
    seed: String(s.seed ?? 0),
  });
  if (s.top?.trim()) p.set("top", s.top.trim());
  if (s.ref?.trim()) p.set("ref", s.ref.trim());
  return `/api/og/instagram?${p.toString()}`;
}

// Prévia WYSIWYG da arte da IA (debounce pra não re-renderizar a cada tecla).
function SlidePreview({ slide, tema, size = 240 }: { slide: EdSlide; tema: TemaKey; size?: number }) {
  const W = size;
  const H = Math.round(size * 1.25);
  const alvo = ogSrc(slide, tema);
  const [src, setSrc] = useState(alvo);
  const [carregando, setCarregando] = useState(true);
  useEffect(() => {
    setCarregando(true);
    const t = setTimeout(() => setSrc(alvo), 600);
    return () => clearTimeout(t);
  }, [alvo]);
  return (
    <div className="shrink-0">
      <div style={{ width: W, height: H, position: "relative", overflow: "hidden", borderRadius: 14, background: "#F4EACB", boxShadow: "0 8px 30px rgba(0,0,0,0.25)" }}>
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img src={src} alt="" width={W} height={H} onLoad={() => setCarregando(false)} onError={() => setCarregando(false)} style={{ width: W, height: H, objectFit: "cover", display: "block" }} />
        {carregando && (
          <div style={{ position: "absolute", inset: 0, display: "flex", alignItems: "center", justifyContent: "center", background: "rgba(244,234,203,0.55)", color: "#1B2A4A", fontSize: 13, fontWeight: 600 }}>
            gerando arte…
          </div>
        )}
      </div>
    </div>
  );
}

export function EditorPostInstagram({ item, onSaved }: { item: Item; onSaved?: (patch: { legenda: string; slides: EdSlide[]; video_url?: string }) => void }) {
  const isReel = item.tipo === "reel";
  const slidesIniciais = (Array.isArray(item.slides) ? item.slides : []) as EdSlide[];
  const temaInicial = (slidesIniciais.find((s) => s.tema)?.tema as TemaKey) || TEMA_PADRAO;

  const [slides, setSlides] = useState<EdSlide[]>(slidesIniciais);
  const [legenda, setLegenda] = useState(item.legenda || "");
  const [tema, setTema] = useState<TemaKey>(temaInicial);
  const [videoUrl, setVideoUrl] = useState(item.video_url || "");
  const [salvando, setSalvando] = useState(false);
  const [salvo, setSalvo] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [enviando, setEnviando] = useState(false);
  const addRef = useRef<HTMLInputElement>(null);

  function dirty() {
    setSalvo(false);
  }
  function patch(i: number, p: Partial<EdSlide>) {
    setSlides((prev) => prev.map((s, idx) => (idx === i ? { ...s, ...p } : s)));
    dirty();
  }
  function regerar(i: number) {
    patch(i, { seed: novoSeed() });
  }
  function removerSlide(i: number) {
    setSlides((prev) => prev.filter((_, idx) => idx !== i));
    dirty();
  }

  // Upload de imagem (trocar slide existente OU adicionar novo).
  async function subirImagem(file: File, alvoIndex: number | "novo") {
    setErro(null);
    setEnviando(true);
    try {
      const fd = new FormData();
      fd.append("file", file);
      const res = await fetch("/api/admin/instagram/upload", { method: "POST", body: fd });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha no upload.");
      if (alvoIndex === "novo") {
        setSlides((prev) => [...prev, { imageUrl: data.url, texto: "", prompt: "", modo: "nenhum", cor: "#C9A961", fonte: "anton", seed: 0 }]);
      } else {
        patch(alvoIndex, { imageUrl: data.url });
      }
      dirty();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha no upload.");
    } finally {
      setEnviando(false);
    }
  }

  // Troca o vídeo do Reel (sobe direto pro Storage via URL assinada).
  async function trocarVideo(file: File) {
    setErro(null);
    if (!/\.(mp4|mov)$/i.test(file.name) && !file.type.startsWith("video/")) {
      setErro("Envie um vídeo .mp4 ou .mov.");
      return;
    }
    setEnviando(true);
    try {
      const ext = /\.mov$/i.test(file.name) ? "mov" : "mp4";
      const res = await fetch("/api/admin/instagram/upload-video", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ext }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao preparar upload.");
      const supabase = createClient();
      const { error } = await supabase.storage.from("instagram").uploadToSignedUrl(data.path, data.token, file, { contentType: file.type || "video/mp4" });
      if (error) throw new Error(error.message);
      setVideoUrl(data.publicUrl);
      dirty();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha no upload do vídeo.");
    } finally {
      setEnviando(false);
    }
  }

  async function salvar() {
    setSalvando(true);
    setErro(null);
    try {
      // injeta o tema escolhido em cada slide (igual ao gerador) pra persistir a cor.
      const slidesEnvio = slides.map((s) => (s.imageUrl ? s : { ...s, tema }));
      const body: Record<string, unknown> = { id: item.id, legenda };
      if (isReel) {
        if (!videoUrl) throw new Error("O Reel precisa de um vídeo.");
        body.videoUrl = videoUrl;
      } else {
        if (!slidesEnvio.length) throw new Error("O post precisa de pelo menos uma imagem.");
        body.slides = slidesEnvio;
      }
      const res = await fetch("/api/admin/instagram", {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(data?.error || "Falha ao salvar.");
      setSalvo(true);
      onSaved?.({ legenda, slides: slidesEnvio, video_url: videoUrl });
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao salvar.");
    } finally {
      setSalvando(false);
    }
  }

  return (
    <div className="mt-3 space-y-4 border-t border-mesa-100 pt-4">
      <style>{FONT_FACES}</style>

      {/* Reel: vídeo + troca */}
      {isReel ? (
        <div className="flex flex-col items-start gap-3 sm:flex-row">
          {videoUrl ? (
            // eslint-disable-next-line jsx-a11y/media-has-caption
            <video src={videoUrl} controls playsInline className="max-h-[360px] w-auto rounded-xl bg-black" style={{ aspectRatio: "9 / 16" }} />
          ) : (
            <div className="flex h-48 w-32 items-center justify-center rounded-xl bg-mesa-100 text-xs text-mesa-400">sem vídeo</div>
          )}
          <label className="cursor-pointer rounded-lg border border-mesa-300 bg-white px-4 py-2 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100">
            {enviando ? "Enviando vídeo…" : "🎬 Trocar vídeo"}
            <input type="file" accept="video/mp4,video/quicktime,.mp4,.mov" className="hidden"
              onChange={(e) => { const f = e.target.files?.[0]; if (f) trocarVideo(f); e.target.value = ""; }} />
          </label>
        </div>
      ) : (
        <>
          {/* Cor do tema (afeta os slides de IA) */}
          {slides.some((s) => !s.imageUrl) && (
            <div className="flex flex-wrap items-center gap-2">
              <span className="text-xs font-medium text-mesa-700">🎨 Cor:</span>
              {(Object.keys(TEMAS) as TemaKey[]).map((k) => (
                <button key={k} onClick={() => { setTema(k); dirty(); }} title={TEMAS[k].label}
                  className={`flex items-center gap-2 rounded-full border px-3 py-1 text-xs font-medium transition ${tema === k ? "border-mesa-700 bg-mesa-50 text-mesa-800" : "border-mesa-200 text-mesa-600 hover:bg-mesa-100"}`}>
                  <span className="h-3.5 w-3.5 rounded-full" style={{ backgroundColor: TEMAS[k].cor }} />
                  {TEMAS[k].label}
                </button>
              ))}
            </div>
          )}

          {/* Slides */}
          <div className="space-y-4">
            {slides.map((s, i) => (
              <div key={i} className="flex flex-col gap-4 rounded-xl border border-mesa-200 bg-mesa-50/40 p-4 md:flex-row">
                {s.imageUrl ? (
                  <div className="shrink-0">
                    {/* eslint-disable-next-line @next/next/no-img-element */}
                    <img src={s.imageUrl} alt={`slide ${i + 1}`} className="h-[300px] w-[240px] rounded-xl object-cover shadow" />
                  </div>
                ) : (
                  <SlidePreview slide={s} tema={tema} />
                )}

                <div className="flex-1 space-y-3">
                  <div className="text-xs font-medium text-mesa-500">
                    {slides.length > 1 ? `Slide ${i + 1} de ${slides.length}` : "Imagem única"}
                  </div>

                  {s.imageUrl ? (
                    <label className="inline-block cursor-pointer rounded-lg border border-mesa-300 bg-white px-3 py-2 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100">
                      {enviando ? "Enviando…" : "🖼️ Trocar imagem"}
                      <input type="file" accept="image/jpeg,image/png,image/webp" className="hidden"
                        onChange={(e) => { const f = e.target.files?.[0]; if (f) subirImagem(f, i); e.target.value = ""; }} />
                    </label>
                  ) : (
                    <>
                      <div>
                        <label className="mb-1 block text-xs font-medium text-mesa-600">
                          Texto <span className="text-mesa-400">— a palavra entre {"{ }"} vira o destaque</span>
                        </label>
                        <input value={s.texto || ""} onChange={(e) => patch(i, { texto: e.target.value })}
                          className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400" />
                      </div>
                      <div>
                        <label className="mb-1 block text-xs font-medium text-mesa-600">Imagem (descrição em inglês) — o fundo</label>
                        <div className="flex gap-2">
                          <input value={s.prompt || ""} onChange={(e) => patch(i, { prompt: e.target.value })}
                            className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400" />
                          <button onClick={() => regerar(i)} title="Gerar outra imagem"
                            className="shrink-0 rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-700 transition hover:bg-mesa-100">
                            🔄 Regerar
                          </button>
                        </div>
                      </div>
                      <div className="flex flex-wrap items-end gap-3">
                        <div>
                          <label className="mb-1 block text-xs font-medium text-mesa-600">Destaque</label>
                          <select value={s.modo || "circulo"} onChange={(e) => patch(i, { modo: e.target.value })}
                            className="rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800">
                            {MODOS.map((m) => <option key={m.v} value={m.v}>{m.label}</option>)}
                          </select>
                        </div>
                        <div>
                          <label className="mb-1 block text-xs font-medium text-mesa-600">Fonte</label>
                          <select value={(s.fonte as Fonte) || "anton"} onChange={(e) => patch(i, { fonte: e.target.value })}
                            className="rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800">
                            {FONTES.map((ft) => <option key={ft.v} value={ft.v}>{ft.label}</option>)}
                          </select>
                        </div>
                      </div>
                      <div className="flex flex-wrap gap-3">
                        <input value={s.top || ""} onChange={(e) => patch(i, { top: e.target.value })} placeholder="Rótulo do topo (opcional)"
                          className="w-44 rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs text-mesa-800 outline-none focus:border-mesa-400" />
                        <input value={s.ref || ""} onChange={(e) => patch(i, { ref: e.target.value })} placeholder="Rodapé / referência (opcional)"
                          className="w-44 rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs text-mesa-800 outline-none focus:border-mesa-400" />
                      </div>
                    </>
                  )}

                  {slides.length > 1 && (
                    <button onClick={() => removerSlide(i)} className="rounded-lg px-3 py-1.5 text-sm text-red-500 transition hover:bg-red-50">
                      Remover slide
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>

          {/* Adicionar imagem (upload) */}
          <div>
            <label className="inline-block cursor-pointer rounded-full border border-dashed border-mesa-300 px-4 py-2 text-sm font-medium text-mesa-600 transition hover:bg-mesa-100">
              {enviando ? "Enviando…" : "+ Adicionar imagem (upload)"}
              <input ref={addRef} type="file" accept="image/jpeg,image/png,image/webp" className="hidden"
                onChange={(e) => { const f = e.target.files?.[0]; if (f) subirImagem(f, "novo"); e.target.value = ""; }} />
            </label>
          </div>
        </>
      )}

      {/* Legenda */}
      <div>
        <label className="mb-1 block text-sm font-medium text-mesa-700">Legenda</label>
        <textarea value={legenda} onChange={(e) => { setLegenda(e.target.value); dirty(); }} rows={4}
          className="w-full resize-y rounded-xl border border-mesa-200 bg-white p-3 text-sm text-mesa-800 outline-none focus:border-mesa-400" />
      </div>

      {/* Ações */}
      <div className="flex flex-wrap items-center gap-3">
        <button onClick={salvar} disabled={salvando || enviando}
          className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-mesa-800 disabled:opacity-40">
          {salvando ? "Salvando…" : "💾 Salvar alterações"}
        </button>
        {salvo && <span className="text-sm font-medium text-oliveira-700">Alterações salvas ✓</span>}
        {erro && <span className="text-sm text-red-600">{erro}</span>}
      </div>
    </div>
  );
}
