"use client";

import { useState } from "react";

type Resultado = {
  videoId: string;
  title: string;
  link: string;
  durationSec: number;
  filesize?: number;
};

function fmtDuracao(seg: number): string {
  if (!seg) return "";
  const h = Math.floor(seg / 3600);
  const m = Math.floor((seg % 3600) / 60);
  const s = seg % 60;
  if (h) return `${h}h${String(m).padStart(2, "0")}min`;
  return `${m}:${String(s).padStart(2, "0")}`;
}

function fmtTamanho(bytes?: number): string {
  if (!bytes) return "";
  return `${(bytes / 1024 / 1024).toFixed(1)} MB`;
}

export function YouTubeBaixarForm() {
  const [url, setUrl] = useState("");
  const [resultado, setResultado] = useState<Resultado | null>(null);
  const [carregando, setCarregando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function buscar() {
    setErro(null);
    setResultado(null);
    if (!url.trim()) return;
    setCarregando(true);
    try {
      const res = await fetch(`/api/admin/youtube-mp3?url=${encodeURIComponent(url)}`);
      const data = await res.json();
      if (!res.ok) {
        setErro(data.error || "Erro ao processar o vídeo");
      } else {
        setResultado(data);
      }
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro de rede");
    } finally {
      setCarregando(false);
    }
  }

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
              buscar();
            }
          }}
          placeholder="Cole o link do YouTube aqui…"
          className="flex-1 rounded-xl border border-mesa-200 bg-white px-4 py-3 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
        />
        <button
          type="button"
          onClick={buscar}
          disabled={!url.trim() || carregando}
          className="rounded-xl bg-laranja-600 px-6 py-3 text-sm font-medium text-white hover:bg-laranja-700 disabled:cursor-not-allowed disabled:opacity-50"
        >
          {carregando ? "Convertendo…" : "Converter em MP3"}
        </button>
      </div>

      {carregando && (
        <p className="text-sm text-mesa-500">
          Convertendo o áudio… pode levar de 5 a 30 segundos.
        </p>
      )}

      {erro && (
        <div className="rounded-xl border border-red-300 bg-red-50 p-4 text-sm text-red-900">
          <p className="font-medium">Não deu certo</p>
          <p className="mt-1">{erro}</p>
          <button
            type="button"
            onClick={buscar}
            className="mt-3 rounded-full bg-red-700 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-800"
          >
            🔄 Tentar de novo
          </button>
        </div>
      )}

      {resultado && (
        <div className="rounded-2xl border border-oliveira-200 bg-oliveira-50 p-5">
          <p className="mb-1 text-xs font-medium uppercase tracking-wider text-oliveira-700">
            Pronto pra baixar
            {resultado.durationSec ? ` · ${fmtDuracao(resultado.durationSec)}` : ""}
            {resultado.filesize ? ` · ${fmtTamanho(resultado.filesize)}` : ""}
          </p>
          <h2 className="mb-4 font-serif text-xl font-semibold text-mesa-800">
            {resultado.title}
          </h2>
          <a
            href={resultado.link}
            download
            target="_blank"
            rel="noreferrer"
            className="inline-flex items-center gap-2 rounded-full bg-laranja-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-laranja-700"
          >
            ⬇ Baixar MP3
          </a>
          <p className="mt-3 text-xs text-mesa-500">
            Se o áudio abrir tocando em vez de baixar, clique com o botão direito
            no link e escolha &ldquo;Salvar como&rdquo;.
          </p>
        </div>
      )}
    </div>
  );
}
