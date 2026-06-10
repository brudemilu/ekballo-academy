"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { TEMAS, TEMA_PADRAO, type TemaKey } from "@/lib/instagram-render";

/**
 * Reel por UPLOAD: sobe um vídeo pronto DIRETO pro Supabase Storage (via URL
 * assinada, sem passar pelo limite do Vercel) e publica/agenda como Reel.
 * Cobre "pessoas falando" (clipe de pregação/testemunho) e "subir pra agendar".
 * Nada vai ao ar sem clique explícito (window.confirm).
 */
const MAX_MB = 200;

export function GeradorReel() {
  const router = useRouter();
  const [videoUrl, setVideoUrl] = useState("");
  const [previewLocal, setPreviewLocal] = useState("");
  const [enviando, setEnviando] = useState(false);
  const [legenda, setLegenda] = useState("");
  const [erro, setErro] = useState<string | null>(null);
  const [publicando, setPublicando] = useState(false);
  const [publicado, setPublicado] = useState(false);
  const [agendarData, setAgendarData] = useState("");
  const [agendando, setAgendando] = useState(false);
  const [agendadoOk, setAgendadoOk] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);
  // modo "ia": gera vídeo de fundo (Pexels) + texto animado
  const [modo, setModo] = useState<"upload" | "ia">("upload");
  const [textoIA, setTextoIA] = useState("");
  const [cenaIA, setCenaIA] = useState("");
  const [temaIA, setTemaIA] = useState<TemaKey>(TEMA_PADRAO);
  const [gerando, setGerando] = useState(false);
  // música
  const [faixas, setFaixas] = useState<{ nome: string; url: string }[]>([]);
  const [musicaUrl, setMusicaUrl] = useState("");
  const [enviandoMusica, setEnviandoMusica] = useState(false);

  async function carregarFaixas() {
    try {
      const r = await fetch("/api/admin/instagram/musicas");
      const d = await r.json();
      if (r.ok) setFaixas(d.faixas || []);
    } catch { /* ignora */ }
  }
  useEffect(() => { if (modo === "ia") carregarFaixas(); }, [modo]);

  async function enviarMusica(file: File) {
    setErro(null);
    if (!/\.(mp3|m4a|aac|wav|ogg)$/i.test(file.name) && !file.type.startsWith("audio/")) {
      setErro("Envie um áudio (.mp3, .m4a, .wav).");
      return;
    }
    setEnviandoMusica(true);
    try {
      const ext = (file.name.split(".").pop() || "mp3").toLowerCase();
      const res = await fetch("/api/admin/instagram/musicas", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ext, nome: file.name.replace(/\.[^.]+$/, "") }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao preparar upload.");
      const supabase = createClient();
      const { error } = await supabase.storage.from("instagram").uploadToSignedUrl(data.path, data.token, file, { contentType: file.type || "audio/mpeg" });
      if (error) throw new Error(error.message);
      await carregarFaixas();
      // seleciona a recém-enviada
      const pub = supabase.storage.from("instagram").getPublicUrl(data.path).data.publicUrl;
      setMusicaUrl(pub);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha no upload da música.");
    } finally {
      setEnviandoMusica(false);
    }
  }

  async function gerarComIA() {
    if (textoIA.trim().length < 3) {
      setErro("Escreva a mensagem do Reel.");
      return;
    }
    setErro(null);
    setGerando(true);
    setVideoUrl("");
    setPreviewLocal("");
    setPublicado(false);
    setAgendadoOk(false);
    try {
      const res = await fetch("/api/admin/instagram/reel-gerar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ texto: textoIA, tema: temaIA, cena: cenaIA || textoIA, musicaUrl, seed: Math.floor(Math.random() * 100000), duracao: 9 }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao gerar o Reel.");
      setVideoUrl(data.videoUrl);
      setPreviewLocal(data.videoUrl); // mostra o MP4 gerado no preview
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao gerar.");
    } finally {
      setGerando(false);
    }
  }

  async function enviarVideo(file: File) {
    setErro(null);
    setPublicado(false);
    setAgendadoOk(false);
    if (!/\.(mp4|mov)$/i.test(file.name) && !file.type.startsWith("video/")) {
      setErro("Envie um vídeo .mp4 ou .mov.");
      return;
    }
    if (file.size > MAX_MB * 1024 * 1024) {
      setErro(`Vídeo muito grande (máx ${MAX_MB}MB).`);
      return;
    }
    setEnviando(true);
    setPreviewLocal(URL.createObjectURL(file));
    try {
      // 1) pede uma URL assinada (servidor, service-role)
      const ext = /\.mov$/i.test(file.name) ? "mov" : "mp4";
      const res = await fetch("/api/admin/instagram/upload-video", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ext }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao preparar upload.");
      // 2) sobe DIRETO pro Supabase (sem passar pelo Vercel)
      const supabase = createClient();
      const { error } = await supabase.storage
        .from("instagram")
        .uploadToSignedUrl(data.path, data.token, file, { contentType: file.type || "video/mp4" });
      if (error) throw new Error(error.message);
      setVideoUrl(data.publicUrl);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha no upload.");
      setPreviewLocal("");
    } finally {
      setEnviando(false);
    }
  }

  async function publicar() {
    if (!videoUrl) {
      setErro("Envie um vídeo primeiro.");
      return;
    }
    if (!window.confirm("Publicar AGORA como Reel no Instagram?\n\nVai ao ar de verdade no perfil. O processamento do vídeo pode levar alguns segundos.")) return;
    setPublicando(true);
    setErro(null);
    setPublicado(false);
    try {
      const res = await fetch("/api/admin/instagram/publicar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ tipo: "reel", videoUrl, legenda }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao publicar.");
      setPublicado(true);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao publicar.");
    } finally {
      setPublicando(false);
    }
  }

  async function agendar() {
    if (!videoUrl) {
      setErro("Envie um vídeo primeiro.");
      return;
    }
    if (!agendarData) {
      setErro("Escolha a data e a hora do agendamento.");
      return;
    }
    const quando = new Date(agendarData);
    if (quando.getTime() < Date.now()) {
      setErro("Escolha uma data/hora no futuro.");
      return;
    }
    if (!window.confirm(`Agendar Reel para ${quando.toLocaleString("pt-BR")}?\n\nNa hora marcada vai ao ar automaticamente.`)) return;
    setAgendando(true);
    setErro(null);
    setAgendadoOk(false);
    try {
      const res = await fetch("/api/admin/instagram", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ tipo: "reel", videoUrl, legenda, agendadoPara: quando.toISOString() }),
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

  return (
    <div className="space-y-6">
      {/* modo: subir vídeo OU gerar com IA */}
      <div className="flex gap-2">
        {([
          { v: "upload", label: "⬆️ Subir vídeo" },
          { v: "ia", label: "✨ Gerar com IA (vídeo + texto)" },
        ] as { v: "upload" | "ia"; label: string }[]).map((opt) => (
          <button
            key={opt.v}
            onClick={() => { setModo(opt.v); setErro(null); }}
            className={`rounded-full border px-4 py-2 text-sm font-medium transition ${
              modo === opt.v ? "border-laranja-600 bg-laranja-50 text-laranja-700" : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
            }`}
          >
            {opt.label}
          </button>
        ))}
      </div>

      {modo === "ia" && (
        <div className="rounded-2xl border border-mesa-200 bg-white p-6 space-y-4">
          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">Mensagem do Reel <span className="text-mesa-400">— UMA frase por linha (aparecem em sequência no vídeo). {"{palavra}"} destaca; ((frase)) vira manuscrita</span></label>
            <textarea
              value={textoIA}
              onChange={(e) => setTextoIA(e.target.value)}
              rows={4}
              placeholder={"Descanse no {Senhor}\nEle cuida de você\nEntregue o seu {fardo}"}
              className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50 p-3 text-sm text-mesa-800 outline-none focus:border-mesa-400"
            />
          </div>
          <div className="flex flex-wrap items-end gap-4">
            <div className="grow">
              <label className="mb-1 block text-xs font-medium text-mesa-600">Cena do vídeo (inglês) <span className="text-mesa-400">— opcional; senão usa a mensagem</span></label>
              <input
                value={cenaIA}
                onChange={(e) => setCenaIA(e.target.value)}
                placeholder="golden mountains clouds"
                className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400"
              />
            </div>
          </div>
          <div className="flex flex-wrap items-center gap-2">
            <span className="text-sm font-medium text-mesa-700">🎨 Cor:</span>
            {(Object.keys(TEMAS) as TemaKey[]).map((k) => (
              <button key={k} onClick={() => setTemaIA(k)} title={TEMAS[k].label}
                className={`flex items-center gap-2 rounded-full border px-3 py-1.5 text-xs font-medium transition ${temaIA === k ? "border-mesa-700 bg-mesa-50 text-mesa-800" : "border-mesa-200 text-mesa-600 hover:bg-mesa-100"}`}>
                <span className="h-4 w-4 rounded-full" style={{ backgroundColor: TEMAS[k].cor }} />
                {TEMAS[k].label}
              </button>
            ))}
          </div>

          {/* seletor de música */}
          <div className="space-y-2">
            <div className="flex flex-wrap items-center gap-2">
              <span className="text-sm font-medium text-mesa-700">🎵 Música:</span>
              <button
                onClick={() => setMusicaUrl("")}
                className={`rounded-full border px-3 py-1.5 text-xs font-medium transition ${musicaUrl === "" ? "border-mesa-700 bg-mesa-50 text-mesa-800" : "border-mesa-200 text-mesa-600 hover:bg-mesa-100"}`}
              >
                Sem música
              </button>
              {faixas.map((f) => (
                <button
                  key={f.url}
                  onClick={() => setMusicaUrl(f.url)}
                  className={`rounded-full border px-3 py-1.5 text-xs font-medium transition ${musicaUrl === f.url ? "border-laranja-600 bg-laranja-50 text-laranja-700" : "border-mesa-200 text-mesa-600 hover:bg-mesa-100"}`}
                >
                  🎵 {f.nome}
                </button>
              ))}
              <label className="cursor-pointer rounded-full border border-dashed border-mesa-300 px-3 py-1.5 text-xs font-medium text-mesa-600 transition hover:bg-mesa-100">
                {enviandoMusica ? "enviando…" : "+ Subir faixa"}
                <input type="file" accept="audio/*,.mp3,.m4a,.wav" className="hidden"
                  onChange={(e) => { const f = e.target.files?.[0]; if (f) enviarMusica(f); e.target.value = ""; }} />
              </label>
            </div>
            {musicaUrl && (
              // eslint-disable-next-line jsx-a11y/media-has-caption
              <audio src={musicaUrl} controls className="h-9 w-full max-w-sm" />
            )}
          </div>

          <button
            onClick={gerarComIA}
            disabled={gerando || textoIA.trim().length < 3}
            className="rounded-full bg-laranja-600 px-6 py-2.5 text-sm font-semibold text-white transition hover:bg-laranja-700 disabled:opacity-40"
          >
            {gerando ? "Gerando o Reel… (pode levar ~20s)" : "✨ Gerar Reel"}
          </button>
          {erro && <p className="text-sm text-red-600">{erro}</p>}
        </div>
      )}

      {modo === "upload" && (
      <div className="rounded-2xl border border-mesa-200 bg-white p-6">
        <label className="mb-2 block text-sm font-medium text-mesa-700">
          Vídeo do Reel <span className="text-mesa-400">— .mp4 ou .mov, vertical 9:16, até {MAX_MB}MB</span>
        </label>
        <label className="flex cursor-pointer items-center justify-center rounded-xl border-2 border-dashed border-mesa-300 bg-mesa-50 px-6 py-10 text-sm font-medium text-mesa-600 transition hover:border-mesa-400 hover:bg-mesa-100">
          {enviando ? "Enviando vídeo…" : videoUrl ? "✅ Vídeo enviado — clique pra trocar" : "🎬 Clique para escolher o vídeo"}
          <input
            ref={inputRef}
            type="file"
            accept="video/mp4,video/quicktime,.mp4,.mov"
            onChange={(e) => {
              const f = e.target.files?.[0];
              if (f) enviarVideo(f);
              e.target.value = "";
            }}
            className="hidden"
          />
        </label>
        {erro && <p className="mt-3 text-sm text-red-600">{erro}</p>}
      </div>
      )}

      {previewLocal && (
        <div className="flex flex-col items-center gap-3 rounded-2xl border border-mesa-200 bg-white p-5">
          {/* eslint-disable-next-line jsx-a11y/media-has-caption */}
          <video src={previewLocal} controls playsInline className="max-h-[480px] w-auto rounded-xl bg-black" style={{ aspectRatio: "9 / 16" }} />
          <p className="text-xs text-mesa-400">{enviando ? "subindo pro servidor…" : "pré-visualização"}</p>
        </div>
      )}

      {videoUrl && (
        <>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <label className="mb-2 block text-sm font-medium text-mesa-700">Legenda do Reel</label>
            <textarea
              value={legenda}
              onChange={(e) => setLegenda(e.target.value)}
              rows={5}
              placeholder="Escreva a legenda… (pode usar hashtags no fim)"
              className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50 p-4 text-sm text-mesa-800 outline-none focus:border-mesa-400"
            />
          </div>

          <div className="flex flex-wrap items-center gap-3">
            <button
              onClick={publicar}
              disabled={publicando}
              className="rounded-full bg-gradient-to-r from-pink-600 to-purple-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:opacity-90 disabled:opacity-40"
            >
              {publicando ? "Publicando…" : "📲 Publicar Reel agora"}
            </button>
            {publicado && <span className="text-sm font-medium text-oliveira-700">Reel publicado ✓</span>}
          </div>

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
              {agendando ? "Agendando…" : "Agendar Reel"}
            </button>
            {agendadoOk && (
              <span className="text-sm font-medium text-oliveira-700">Agendado ✓ — vai ao ar sozinho na hora marcada</span>
            )}
          </div>
        </>
      )}
    </div>
  );
}
