"use client";

import { use, useCallback, useEffect, useMemo, useRef, useState } from "react";
import Link from "next/link";
import { getLivro, getAudioBlob, type LivroOffline } from "@/lib/offline-db";

// Leitor OFFLINE imersivo + player de áudio flutuante. Lê tudo do IndexedDB — abre
// e funciona sem internet. Dá pra LER e OUVIR ao mesmo tempo. Tema claro/escuro.

const VELOCIDADES = [1, 1.25, 1.5, 2];

function tempo(s: number) {
  if (!isFinite(s)) return "0:00";
  const m = Math.floor(s / 60);
  const seg = Math.floor(s % 60);
  return `${m}:${seg.toString().padStart(2, "0")}`;
}

// Renderiza o conteúdo: parágrafos justificados (ABNT) e sub-títulos em CAIXA-ALTA.
function Conteudo({ texto, escuro }: { texto: string; escuro: boolean }) {
  const blocos = useMemo(
    () => texto.split(/\n{2,}/).map((b) => b.trim()).filter(Boolean),
    [texto]
  );
  const ehTitulo = (l: string) =>
    l.length >= 2 && l.length <= 70 && l === l.toUpperCase() && /[A-ZÀ-Ú]/.test(l) && !l.startsWith("•");
  return (
    <div lang="pt-BR" className="space-y-5">
      {blocos.map((b, i) =>
        ehTitulo(b) ? (
          <h3
            key={i}
            className={`pt-2 font-serif text-lg font-semibold ${escuro ? "text-white" : "text-mesa-800"}`}
          >
            {b.charAt(0) + b.slice(1).toLowerCase()}
          </h3>
        ) : (
          <p
            key={i}
            className={`text-justify hyphens-auto leading-[1.75] ${escuro ? "text-bege-200" : "text-mesa-700"}`}
          >
            {b}
          </p>
        )
      )}
    </div>
  );
}

export default function LeitorOffline({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = use(params);
  const [livro, setLivro] = useState<LivroOffline | null | undefined>(undefined);
  const [idx, setIdx] = useState(0);
  const [escuro, setEscuro] = useState(true);
  const [menuCaps, setMenuCaps] = useState(false);

  // player
  const audioRef = useRef<HTMLAudioElement>(null);
  const [src, setSrc] = useState<string | null>(null);
  const [tocando, setTocando] = useState(false);
  const [vel, setVel] = useState(1);
  const [cur, setCur] = useState(0);
  const [dur, setDur] = useState(0);

  useEffect(() => {
    getLivro(slug).then((l) => setLivro(l ?? null));
  }, [slug]);

  const aula = livro?.aulas[idx];

  // Carrega o áudio da aula atual (object URL do blob no IndexedDB).
  useEffect(() => {
    let url: string | null = null;
    setSrc(null);
    setCur(0);
    setDur(0);
    if (livro && aula?.temAudio) {
      getAudioBlob(slug, aula.ordem).then((blob) => {
        if (blob) {
          url = URL.createObjectURL(blob);
          setSrc(url);
        }
      });
    }
    return () => {
      if (url) URL.revokeObjectURL(url);
    };
  }, [livro, slug, aula?.ordem, aula?.temAudio]);

  useEffect(() => {
    if (audioRef.current) audioRef.current.playbackRate = vel;
  }, [vel, src]);

  const irPara = useCallback((novo: number) => {
    setIdx(novo);
    setTocando(false);
    setMenuCaps(false);
    window.scrollTo({ top: 0, behavior: "smooth" });
  }, []);

  const playPause = useCallback(() => {
    const a = audioRef.current;
    if (!a) return;
    if (a.paused) {
      a.play();
      setTocando(true);
    } else {
      a.pause();
      setTocando(false);
    }
  }, []);

  if (livro === undefined) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-[#17140F] text-bege-300">
        Carregando…
      </div>
    );
  }
  if (livro === null) {
    return (
      <div className="flex min-h-screen flex-col items-center justify-center gap-4 bg-[#17140F] px-6 text-center text-bege-200">
        <p className="text-4xl" aria-hidden>📕</p>
        <p>Este livro não está baixado neste dispositivo.</p>
        <Link href="/biblioteca" className="rounded-full bg-laranja-500 px-5 py-2 text-sm text-white">
          Ir para a Biblioteca
        </Link>
      </div>
    );
  }

  const total = livro.aulas.length;
  const temPlayer = !!aula?.temAudio;

  return (
    <main className={escuro ? "min-h-screen bg-[#14110C]" : "min-h-screen bg-bege-50"}>
      {/* Barra superior */}
      <header
        className={`sticky top-0 z-30 flex items-center justify-between gap-3 border-b px-4 py-3 backdrop-blur ${
          escuro ? "border-white/10 bg-[#14110C]/80" : "border-bege-200 bg-bege-50/80"
        }`}
      >
        <Link
          href="/biblioteca"
          className={`flex-none rounded-full px-3 py-1.5 text-sm ${escuro ? "text-bege-300 hover:bg-white/10" : "text-mesa-600 hover:bg-bege-100"}`}
        >
          ←
        </Link>
        <button
          onClick={() => setMenuCaps((v) => !v)}
          className={`min-w-0 flex-1 truncate text-center text-sm font-medium ${escuro ? "text-bege-100" : "text-mesa-800"}`}
        >
          {livro.titulo} · <span className="text-laranja-400">{idx + 1}/{total}</span>
        </button>
        <button
          onClick={() => setEscuro((v) => !v)}
          title="Tema"
          className={`flex-none rounded-full px-3 py-1.5 text-sm ${escuro ? "text-bege-300 hover:bg-white/10" : "text-mesa-600 hover:bg-bege-100"}`}
        >
          {escuro ? "☀" : "☾"}
        </button>
      </header>

      {/* Drawer de capítulos */}
      {menuCaps && (
        <div className="fixed inset-0 z-40 flex" onClick={() => setMenuCaps(false)}>
          <div className="absolute inset-0 bg-black/50" />
          <div
            className={`relative ml-auto h-full w-80 max-w-[85%] overflow-y-auto p-4 ${escuro ? "bg-[#1C1812]" : "bg-white"}`}
            onClick={(e) => e.stopPropagation()}
          >
            <p className={`mb-3 text-xs font-semibold uppercase tracking-wider ${escuro ? "text-bege-400" : "text-mesa-500"}`}>
              Capítulos
            </p>
            <ul className="space-y-1">
              {livro.aulas.map((a, i) => (
                <li key={a.ordem}>
                  <button
                    onClick={() => irPara(i)}
                    className={`flex w-full items-center gap-2 rounded-lg px-3 py-2 text-left text-sm ${
                      i === idx
                        ? "bg-laranja-500/15 text-laranja-500"
                        : escuro
                          ? "text-bege-200 hover:bg-white/5"
                          : "text-mesa-700 hover:bg-bege-100"
                    }`}
                  >
                    <span className="w-5 flex-none text-xs opacity-60">{i + 1}</span>
                    <span className="min-w-0 flex-1 truncate">{a.titulo}</span>
                    {a.temAudio && <span className="flex-none text-xs opacity-70">♪</span>}
                  </button>
                </li>
              ))}
            </ul>
          </div>
        </div>
      )}

      {/* Conteúdo */}
      <article className={`mx-auto max-w-2xl px-5 pt-8 ${temPlayer ? "pb-40" : "pb-24"}`}>
        <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-laranja-400">
          Capítulo {idx + 1}
        </p>
        <h2 className={`mb-6 font-serif text-3xl font-semibold leading-tight ${escuro ? "text-white" : "text-mesa-800"}`}>
          {aula?.titulo}
        </h2>
        {aula && <Conteudo texto={aula.conteudo} escuro={escuro} />}

        {/* Navegação entre capítulos */}
        <div className="mt-12 flex items-center justify-between gap-3">
          <button
            disabled={idx === 0}
            onClick={() => irPara(idx - 1)}
            className={`rounded-full px-4 py-2 text-sm transition disabled:opacity-30 ${escuro ? "border border-white/15 text-bege-200 hover:bg-white/5" : "border border-bege-200 text-mesa-700 hover:bg-bege-100"}`}
          >
            ← Anterior
          </button>
          <button
            disabled={idx >= total - 1}
            onClick={() => irPara(idx + 1)}
            className="rounded-full bg-laranja-500 px-5 py-2 text-sm font-medium text-white transition hover:bg-laranja-600 disabled:opacity-30"
          >
            Próximo →
          </button>
        </div>
      </article>

      {/* Player flutuante */}
      {temPlayer && (
        <div className="fixed inset-x-0 bottom-0 z-30 px-3 pb-[calc(env(safe-area-inset-bottom)+0.75rem)]">
          <div className="mx-auto flex max-w-2xl flex-col gap-2 rounded-2xl border border-white/10 bg-[#1C1812]/95 p-3 text-bege-100 shadow-2xl shadow-black/50 backdrop-blur">
            <audio
              ref={audioRef}
              src={src ?? undefined}
              onLoadedMetadata={(e) => setDur(e.currentTarget.duration)}
              onTimeUpdate={(e) => setCur(e.currentTarget.currentTime)}
              onEnded={() => {
                setTocando(false);
                if (idx < total - 1) irPara(idx + 1);
              }}
            />
            {/* progresso */}
            <div className="flex items-center gap-2 text-[11px] text-bege-400">
              <span className="w-9 flex-none tabular-nums">{tempo(cur)}</span>
              <input
                type="range"
                min={0}
                max={dur || 0}
                value={cur}
                onChange={(e) => {
                  const t = Number(e.target.value);
                  if (audioRef.current) audioRef.current.currentTime = t;
                  setCur(t);
                }}
                className="h-1.5 flex-1 cursor-pointer appearance-none rounded-full bg-white/15 accent-laranja-500"
                style={{
                  background: dur
                    ? `linear-gradient(to right, #D55416 ${(cur / dur) * 100}%, rgba(255,255,255,.15) ${(cur / dur) * 100}%)`
                    : undefined,
                }}
              />
              <span className="w-9 flex-none tabular-nums">{tempo(dur)}</span>
            </div>
            {/* controles */}
            <div className="flex items-center justify-between">
              <span className="min-w-0 flex-1 truncate text-xs text-bege-300">
                ♪ {aula?.titulo}
              </span>
              <div className="flex flex-none items-center gap-1">
                <button
                  onClick={() => idx > 0 && irPara(idx - 1)}
                  disabled={idx === 0}
                  className="rounded-full px-2 py-1 text-bege-300 transition hover:bg-white/10 disabled:opacity-30"
                  title="Capítulo anterior"
                >
                  ⏮
                </button>
                <button
                  onClick={playPause}
                  disabled={!src}
                  className="flex h-11 w-11 items-center justify-center rounded-full bg-laranja-500 text-lg text-white transition hover:bg-laranja-600 disabled:opacity-40"
                  title={tocando ? "Pausar" : "Tocar"}
                >
                  {tocando ? "❚❚" : "▶"}
                </button>
                <button
                  onClick={() => idx < total - 1 && irPara(idx + 1)}
                  disabled={idx >= total - 1}
                  className="rounded-full px-2 py-1 text-bege-300 transition hover:bg-white/10 disabled:opacity-30"
                  title="Próximo capítulo"
                >
                  ⏭
                </button>
                <button
                  onClick={() => setVel(VELOCIDADES[(VELOCIDADES.indexOf(vel) + 1) % VELOCIDADES.length])}
                  className="ml-1 w-11 flex-none rounded-full bg-white/10 py-1.5 text-xs font-semibold text-bege-100 transition hover:bg-white/20"
                  title="Velocidade"
                >
                  {vel}×
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </main>
  );
}
