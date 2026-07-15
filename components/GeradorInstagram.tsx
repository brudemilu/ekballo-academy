"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { TEMAS, TEMA_PADRAO, type TemaKey } from "@/lib/instagram-render";

// Fontes pra prévia ao vivo (mesmas do servidor). Carregadas via @font-face.
const FONT_FACES = `
@font-face { font-family: 'AntonPv'; src: url('/fonts/anton.ttf'); }
@font-face { font-family: 'BebasPv'; src: url('/fonts/bebas.ttf'); }
@font-face { font-family: 'DMSerifPv'; src: url('/fonts/dm-serif.ttf'); }
@font-face { font-family: 'CormorantPv'; src: url('/fonts/cormorant-italic.ttf'); font-style: italic; }
`;
type Modo = "circulo" | "grifo" | "marca" | "dourado" | "nenhum";
type Fonte = "anton" | "bebas" | "dm-serif" | "cormorant";
type Tipo = "carrossel" | "unico" | "upload";

type Upload = { url: string; preview: string; enviando: boolean; erro?: boolean };

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

/**
 * Roteiro vindo de fora (ex.: uma sugestão da IA) pra pré-preencher o editor.
 * `nonce` muda a cada "usar ideia" pra disparar o preenchimento mesmo quando o
 * conteúdo é igual ao anterior.
 */
export type RoteiroInicial = {
  nonce: number;
  conteudo: string;
  legenda: string;
  slides: { texto: string; prompt: string; modo: Modo; cor: string }[];
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

function ogSrc(s: Slide, tema: TemaKey): string {
  const p = new URLSearchParams({
    verso: s.texto,
    prompt: s.prompt,
    modo: s.modo,
    realce: s.modo,
    tema, // a cor vem do TEMA (não mais do hex do modelo)
    fonte: s.fonte,
    seed: String(s.seed),
  });
  if (s.top.trim()) p.set("top", s.top.trim());
  if (s.ref.trim()) p.set("ref", s.ref.trim());
  return `/api/og/instagram?${p.toString()}`;
}

// Prévia WYSIWYG: renderiza a imagem REAL da rota OG (template papel 4:5),
// com debounce. Evita divergência preview×Satori. A foto (Flux) é cacheada por
// prompt+seed, então editar só o texto re-renderiza rápido (sem regenerar foto).
function SlidePreview({ slide, tema, index, total, size = 300 }: { slide: Slide; tema: TemaKey; index: number; total: number; size?: number }) {
  const W = size;
  const H = Math.round(size * 1.25); // retrato 4:5
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
        <img
          src={src}
          alt=""
          width={W}
          height={H}
          onLoad={() => setCarregando(false)}
          onError={() => setCarregando(false)}
          style={{ width: W, height: H, objectFit: "cover", display: "block" }}
        />
        {carregando && (
          <div style={{ position: "absolute", inset: 0, display: "flex", alignItems: "center", justifyContent: "center", background: "rgba(244,234,203,0.55)", color: "#1B2A4A", fontSize: 13, fontWeight: 600 }}>
            gerando arte…
          </div>
        )}
      </div>
      <div className="mt-2 text-center text-xs text-mesa-500">
        {total > 1 ? `Slide ${index + 1} de ${total}` : "Imagem única"}
      </div>
    </div>
  );
}

export function GeradorInstagram({ roteiroInicial }: { roteiroInicial?: RoteiroInicial } = {}) {
  const router = useRouter();
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
  const [agendarData, setAgendarData] = useState("");
  const [agendando, setAgendando] = useState(false);
  const [agendadoOk, setAgendadoOk] = useState(false);
  const [uploads, setUploads] = useState<Upload[]>([]);
  const uploadsRef = useRef<Upload[]>([]);
  const [tema, setTema] = useState<TemaKey>(TEMA_PADRAO); // cor do post (opção)

  // Pré-preenche o editor quando chega um roteiro de fora (sugestão da IA).
  useEffect(() => {
    if (!roteiroInicial) return;
    const novos: Slide[] = roteiroInicial.slides.map((s) => ({
      texto: s.texto,
      prompt: s.prompt,
      modo: s.modo || "circulo",
      cor: s.cor || "#C9A961",
      fonte: "anton" as Fonte,
      top: "",
      ref: "",
      seed: novoSeed(),
    }));
    setTipo(novos.length === 1 ? "unico" : "carrossel");
    setSlides(novos);
    setLegenda(roteiroInicial.legenda || "");
    setConteudo(roteiroInicial.conteudo || "");
    setSalvo(false);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [roteiroInicial?.nonce]);

  // Slides que vão pro servidor: no modo upload, viram {imageUrl}; senão, os da IA.
  function slidesParaEnvio() {
    if (tipo === "upload") {
      return uploads
        .filter((u) => u.url)
        .map((u) => ({ imageUrl: u.url, texto: "", prompt: "", modo: "nenhum", cor: "#C9A961", fonte: "anton", top: "", ref: "", seed: 0, tema }));
    }
    // injeta o tema em cada slide pra persistir/publicar com a cor escolhida.
    return slides.map((s) => ({ ...s, tema }));
  }

  async function enviarArquivos(files: FileList | null) {
    if (!files?.length) return;
    setSalvo(false);
    setErro(null);
    for (const file of Array.from(files)) {
      const preview = URL.createObjectURL(file);
      const idx = uploadsRef.current.length;
      uploadsRef.current = [...uploadsRef.current, { url: "", preview, enviando: true }];
      setUploads([...uploadsRef.current]);
      try {
        const fd = new FormData();
        fd.append("file", file);
        const res = await fetch("/api/admin/instagram/upload", { method: "POST", body: fd });
        const data = await res.json();
        if (!res.ok) throw new Error(data?.error || "Falha no upload.");
        uploadsRef.current = uploadsRef.current.map((u, i) => (i === idx ? { ...u, url: data.url, enviando: false } : u));
      } catch (e) {
        uploadsRef.current = uploadsRef.current.map((u, i) => (i === idx ? { ...u, enviando: false, erro: true } : u));
        setErro(e instanceof Error ? e.message : "Falha no upload.");
      }
      setUploads([...uploadsRef.current]);
    }
  }
  function removerUpload(i: number) {
    uploadsRef.current = uploadsRef.current.filter((_, idx) => idx !== i);
    setUploads([...uploadsRef.current]);
  }

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
    a.href = `${ogSrc(s, tema)}&dl=1`;
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
        const r = await fetch(`${ogSrc(slides[idx], tema)}&dl=1`);
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
        body: JSON.stringify({ conteudo, slides: slidesParaEnvio(), legenda, tipo }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao salvar.");
      setSalvo(true);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao salvar.");
    } finally {
      setSalvando(false);
    }
  }

  async function publicar() {
    const envio = slidesParaEnvio();
    const qtd = envio.length;
    if (!qtd) {
      setErro("Nada pra publicar.");
      return;
    }
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
        body: JSON.stringify({ slides: envio, legenda }),
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

  async function agendar() {
    if (!agendarData) {
      setErro("Escolha a data e a hora do agendamento.");
      return;
    }
    const quando = new Date(agendarData);
    if (quando.getTime() < Date.now()) {
      setErro("Escolha uma data/hora no futuro.");
      return;
    }
    const ok = window.confirm(
      `Agendar publicação para ${quando.toLocaleString("pt-BR")}?\n\nNa hora marcada, o post vai ao ar automaticamente.`,
    );
    if (!ok) return;
    setAgendando(true);
    setErro(null);
    setAgendadoOk(false);
    try {
      const res = await fetch("/api/admin/instagram", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ conteudo, slides: slidesParaEnvio(), legenda, agendadoPara: quando.toISOString() }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao agendar.");
      setAgendadoOk(true);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao agendar.");
    } finally {
      setAgendando(false);
    }
  }

  const temSlides = slides.length > 0;
  const temConteudo = tipo === "upload" ? uploads.length > 0 : temSlides;

  return (
    <div className="space-y-8">
      <style>{FONT_FACES}</style>
      {/* Entrada */}
      <div className="rounded-2xl border border-mesa-200 bg-white p-6">
        {/* tipo de post */}
        <div className="mb-4 flex gap-2">
          {([
            { v: "carrossel", label: "📚 Carrossel (IA)" },
            { v: "unico", label: "🖼️ Imagem única (IA)" },
            { v: "upload", label: "⬆️ Enviar minhas imagens" },
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

        {/* tema de cor (opção do sistema) */}
        <div className="mb-4 flex flex-wrap items-center gap-2">
          <span className="text-sm font-medium text-mesa-700">🎨 Cor:</span>
          {(Object.keys(TEMAS) as TemaKey[]).map((k) => (
            <button
              key={k}
              onClick={() => setTema(k)}
              title={TEMAS[k].label}
              className={`flex items-center gap-2 rounded-full border px-3 py-1.5 text-xs font-medium transition ${
                tema === k ? "border-mesa-700 bg-mesa-50 text-mesa-800" : "border-mesa-200 text-mesa-600 hover:bg-mesa-100"
              }`}
            >
              <span className="h-4 w-4 rounded-full" style={{ backgroundColor: TEMAS[k].cor }} />
              {TEMAS[k].label}
            </button>
          ))}
        </div>

        {tipo !== "upload" ? (
          <>
            <label className="mb-2 block text-sm font-medium text-mesa-700">Seu conteúdo</label>
            <textarea
              value={conteudo}
              onChange={(e) => setConteudo(e.target.value)}
              rows={5}
              placeholder="Ex.: Essa nova estação não será construída apenas por estratégias humanas. Ela será sustentada pela glória de Deus…"
              className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50 p-4 text-mesa-800 outline-none focus:border-laranja-400"
            />
            <div className="mt-4 flex items-center gap-3">
              <button
                onClick={montar}
                disabled={montando || conteudo.trim().length < 8}
                className="rounded-full bg-laranja-500 px-6 py-2.5 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-40"
              >
                {montando ? "Montando com IA…" : tipo === "unico" ? "✨ Gerar imagem com IA" : "✨ Montar carrossel com IA"}
              </button>
              {erro && <span className="text-sm text-red-600">{erro}</span>}
            </div>
          </>
        ) : (
          <>
            <label className="mb-2 block text-sm font-medium text-mesa-700">
              Suas imagens <span className="text-mesa-400">— JPG/PNG/WEBP, até 10 (vira carrossel)</span>
            </label>
            <label className="flex cursor-pointer items-center justify-center rounded-xl border-2 border-dashed border-mesa-300 bg-mesa-50 px-6 py-8 text-sm font-medium text-mesa-600 transition hover:border-mesa-400 hover:bg-mesa-100">
              ⬆️ Clique para escolher imagens (ou arraste aqui)
              <input
                type="file"
                accept="image/jpeg,image/png,image/webp"
                multiple
                onChange={(e) => {
                  enviarArquivos(e.target.files);
                  e.target.value = "";
                }}
                className="hidden"
              />
            </label>
            {erro && <p className="mt-3 text-sm text-red-600">{erro}</p>}
          </>
        )}
      </div>

      {/* Imagens enviadas (modo upload) */}
      {tipo === "upload" && uploads.length > 0 && (
        <div className="flex flex-wrap gap-3">
          {uploads.map((u, i) => (
            <div key={i} className="relative">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src={u.preview} alt={`imagem ${i + 1}`} className="h-32 w-32 rounded-xl object-cover shadow" />
              {u.enviando && (
                <div className="absolute inset-0 flex items-center justify-center rounded-xl bg-black/45 text-xs text-white">enviando…</div>
              )}
              {u.erro && (
                <div className="absolute inset-0 flex items-center justify-center rounded-xl bg-red-900/60 text-xs text-white">falhou</div>
              )}
              <button
                onClick={() => removerUpload(i)}
                className="absolute -right-2 -top-2 flex h-6 w-6 items-center justify-center rounded-full bg-mesa-800 text-xs text-white"
                title="Remover"
              >
                ✕
              </button>
              <div className="mt-1 text-center text-xs text-mesa-400">{i + 1}</div>
            </div>
          ))}
        </div>
      )}

      {/* Slides (IA) + ações */}
      {temConteudo && (
        <div className="space-y-6">
          {tipo !== "upload" && slides.map((s, i) => (
            <div key={i} className="flex flex-col gap-5 rounded-2xl border border-mesa-200 bg-white p-5 md:flex-row">
              <SlidePreview slide={s} tema={tema} index={i} total={slides.length} />

              <div className="flex-1 space-y-3">
                <div>
                  <label className="mb-1 block text-xs font-medium text-mesa-600">
                    Texto <span className="text-mesa-400">— a palavra entre {"{ }"} vira o destaque</span>
                  </label>
                  <input
                    value={s.texto}
                    onChange={(e) => patch(i, { texto: e.target.value })}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
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
                      className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
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
                    className="w-44 rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-xs text-mesa-800 outline-none focus:border-laranja-400"
                  />
                  <input
                    value={s.ref}
                    onChange={(e) => patch(i, { ref: e.target.value })}
                    placeholder="Rodapé / referência (opcional)"
                    className="w-44 rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-xs text-mesa-800 outline-none focus:border-laranja-400"
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
              className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50 p-4 text-sm text-mesa-800 outline-none focus:border-laranja-400"
            />
          </div>

          {/* Ações */}
          <div className="flex flex-wrap items-center gap-3">
            {tipo !== "upload" && (
              <>
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
              </>
            )}
            <button
              onClick={salvar}
              disabled={salvando}
              className="rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-40"
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

          {/* Agendamento */}
          <div className="flex flex-wrap items-center gap-3 rounded-xl border border-mesa-200 bg-mesa-50 px-4 py-3">
            <span className="text-sm font-medium text-mesa-700">🗓️ Ou agende:</span>
            <input
              type="datetime-local"
              value={agendarData}
              onChange={(e) => {
                setAgendarData(e.target.value);
                setAgendadoOk(false);
              }}
              className="rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800"
            />
            <button
              onClick={agendar}
              disabled={agendando}
              className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-mesa-800 disabled:opacity-40"
            >
              {agendando ? "Agendando…" : "Agendar publicação"}
            </button>
            {agendadoOk && (
              <span className="text-sm font-medium text-oliveira-700">
                Agendado ✓ — vai ao ar sozinho na hora marcada
              </span>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
