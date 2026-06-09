"use client";

import { useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

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
