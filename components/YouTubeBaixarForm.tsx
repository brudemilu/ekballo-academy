"use client";

import { useState } from "react";

type Meta = {
  videoId: string;
  title: string;
  author: string;
  durationSec: number;
  thumbnailUrl: string;
};

function fmtDuracao(seg: number): string {
  const h = Math.floor(seg / 3600);
  const m = Math.floor((seg % 3600) / 60);
  const s = seg % 60;
  if (h) return `${h}h${String(m).padStart(2, "0")}min`;
  return `${m}:${String(s).padStart(2, "0")}`;
}

export function YouTubeBaixarForm() {
  const [url, setUrl] = useState("");
  const [meta, setMeta] = useState<Meta | null>(null);
  const [loadingMeta, setLoadingMeta] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [dica, setDica] = useState<string | null>(null);

  async function consultar() {
    setError(null);
    setDica(null);
    setMeta(null);
    if (!url.trim()) return;
    setLoadingMeta(true);
    try {
      const res = await fetch(
        `/api/admin/youtube-meta?url=${encodeURIComponent(url)}`,
      );
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || "Erro ao consultar o vídeo");
        if (data.dica) setDica(data.dica);
      } else {
        setMeta(data.meta);
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : "Erro de rede");
    } finally {
      setLoadingMeta(false);
    }
  }

  const downloadHref = meta
    ? `/api/admin/youtube-mp3?url=${encodeURIComponent(url)}`
    : "";

  return (
    <div className="space-y-4">
      <div className="flex flex-col gap-2 sm:flex-row">
        <input
          type="url"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter") {
              e.preventDefault();
              consultar();
            }
          }}
          placeholder="https://www.youtube.com/watch?v=..."
          className="flex-1 rounded-xl border border-mesa-200 bg-white px-4 py-3 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
        />
        <button
          type="button"
          onClick={consultar}
          disabled={!url.trim() || loadingMeta}
          className="rounded-xl bg-mesa-700 px-6 py-3 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:cursor-not-allowed disabled:opacity-50"
        >
          {loadingMeta ? "Consultando…" : "Consultar"}
        </button>
      </div>

      {error && (
        <div className="rounded-xl border border-red-300 bg-red-50 p-4 text-sm text-red-900">
          <p className="font-medium">Erro: {error}</p>
          {dica && <p className="mt-1 text-xs">💡 {dica}</p>}
          <div className="mt-3 flex flex-wrap gap-2">
            <button
              type="button"
              onClick={consultar}
              className="rounded-full bg-red-700 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-800"
            >
              🔄 Tentar de novo
            </button>
            {(error.toLowerCase().includes("bot") ||
              error.toLowerCase().includes("sign in")) && (
              <span className="text-xs text-red-700">
                Bloqueio do YouTube no servidor. Tente algumas vezes ou abra no
                seu Mac em <code>npm run dev</code>.
              </span>
            )}
          </div>
        </div>
      )}

      {meta && (
        <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white shadow-sm">
          <div className="flex flex-col sm:flex-row">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={meta.thumbnailUrl}
              alt={meta.title}
              className="h-48 w-full object-cover sm:h-auto sm:w-72"
            />
            <div className="flex-1 p-5">
              <p className="mb-1 text-xs font-medium uppercase tracking-wider text-mesa-500">
                {meta.author} · {fmtDuracao(meta.durationSec)}
              </p>
              <h2 className="mb-4 font-serif text-xl font-semibold text-mesa-800">
                {meta.title}
              </h2>
              <a
                href={downloadHref}
                className="inline-flex items-center gap-2 rounded-full bg-laranja-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-laranja-700"
              >
                ⬇ Baixar MP3 (128 kbps)
              </a>
              <p className="mt-3 text-xs text-mesa-500">
                Vídeos longos podem levar 1-5 minutos pra processar. Não feche a
                aba.
              </p>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
