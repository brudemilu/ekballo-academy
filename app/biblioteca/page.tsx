"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { listarLivros, removerLivro, espacoUsado, type LivroOffline } from "@/lib/offline-db";

// "Minha Biblioteca": estante dos livros baixados. É client puro (lê o IndexedDB),
// então abre e funciona 100% offline. Visual escuro imersivo, capas em destaque.
export default function BibliotecaPage() {
  const [livros, setLivros] = useState<LivroOffline[] | null>(null);
  const [capas, setCapas] = useState<Record<string, string>>({});
  const [espaco, setEspaco] = useState<{ usadoMB: number; totalMB: number } | null>(null);

  async function recarregar() {
    const ls = await listarLivros();
    setLivros(ls);
    setEspaco(await espacoUsado());
    const urls: Record<string, string> = {};
    for (const l of ls) if (l.capaBlob) urls[l.slug] = URL.createObjectURL(l.capaBlob);
    setCapas((old) => {
      Object.values(old).forEach((u) => URL.revokeObjectURL(u));
      return urls;
    });
  }

  useEffect(() => {
    recarregar();
    return () => setCapas((old) => {
      Object.values(old).forEach((u) => URL.revokeObjectURL(u));
      return {};
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function remover(slug: string) {
    await removerLivro(slug).catch(() => {});
    recarregar();
  }

  return (
    <main className="min-h-screen bg-gradient-to-b from-[#17140F] via-[#1E1A14] to-[#0E0C09] text-bege-100">
      <header className="mx-auto flex max-w-5xl items-center justify-between px-6 py-6">
        <div>
          <p className="text-xs font-medium uppercase tracking-[0.25em] text-laranja-300">
            Offline
          </p>
          <h1 className="font-serif text-3xl font-semibold text-white">Minha Biblioteca</h1>
        </div>
        <Link
          href="/dashboard"
          className="rounded-full border border-white/15 px-4 py-2 text-sm text-bege-200 backdrop-blur transition hover:border-white/30 hover:bg-white/5"
        >
          ← Voltar
        </Link>
      </header>

      <div className="mx-auto max-w-5xl px-6 pb-24">
        {espaco && (
          <p className="mb-6 text-xs text-bege-400">
            {espaco.usadoMB} MB usados no dispositivo
          </p>
        )}

        {livros === null ? (
          <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-4">
            {Array.from({ length: 4 }).map((_, i) => (
              <div key={i} className="aspect-[3/4] animate-pulse rounded-2xl bg-white/5" />
            ))}
          </div>
        ) : livros.length === 0 ? (
          <div className="mt-10 rounded-3xl border border-white/10 bg-white/5 px-6 py-16 text-center backdrop-blur">
            <p className="text-5xl" aria-hidden>📚</p>
            <p className="mt-4 font-serif text-xl text-white">Sua estante offline está vazia</p>
            <p className="mx-auto mt-2 max-w-sm text-sm text-bege-300">
              Abra uma temática e toque em <strong>“Baixar para ler e ouvir offline”</strong>.
              Depois você lê e escuta aqui mesmo, sem internet.
            </p>
            <Link
              href="/dashboard"
              className="mt-6 inline-block rounded-full bg-laranja-500 px-6 py-2.5 text-sm font-medium text-white transition hover:bg-laranja-600"
            >
              Ver temáticas
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-4">
            {livros.map((l) => (
              <div key={l.slug} className="group">
                <Link href={`/biblioteca/${l.slug}`} className="block">
                  <div className="lift relative aspect-[3/4] overflow-hidden rounded-2xl border border-white/10 bg-white/5 shadow-xl shadow-black/40">
                    {capas[l.slug] ? (
                      // eslint-disable-next-line @next/next/no-img-element
                      <img
                        src={capas[l.slug]}
                        alt={l.titulo}
                        className="h-full w-full object-cover transition duration-500 group-hover:scale-[1.04]"
                      />
                    ) : (
                      <div className="flex h-full items-center justify-center p-3 text-center font-serif text-sm text-bege-200">
                        {l.titulo}
                      </div>
                    )}
                    <span className="absolute left-2 top-2 rounded-full bg-oliveira-500/90 px-2 py-0.5 text-[10px] font-semibold text-white shadow">
                      ✓ offline
                    </span>
                  </div>
                </Link>
                <div className="mt-2 flex items-start justify-between gap-2">
                  <p className="line-clamp-2 text-sm font-medium text-bege-100">{l.titulo}</p>
                  <button
                    onClick={() => remover(l.slug)}
                    title="Remover"
                    className="flex-none text-xs text-bege-500 transition hover:text-red-400"
                  >
                    ✕
                  </button>
                </div>
                <p className="text-[11px] text-bege-500">
                  {l.aulas.length} aulas · {Math.max(1, Math.round(l.tamanhoBytes / 1048576))} MB
                </p>
              </div>
            ))}
          </div>
        )}
      </div>
    </main>
  );
}
