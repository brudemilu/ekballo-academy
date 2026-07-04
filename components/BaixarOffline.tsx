"use client";

import { useCallback, useEffect, useState } from "react";
import Link from "next/link";
import { baixarCurso, getLivro, removerLivro } from "@/lib/offline-db";

type Estado = "verificando" | "disponivel" | "baixando" | "baixado";

// Botão "Baixar para ler e ouvir offline" na página do curso. Guarda o livro
// (texto + narração + capa) no dispositivo. Anel de progresso durante o download.
export function BaixarOffline({ slug }: { slug: string }) {
  const [estado, setEstado] = useState<Estado>("verificando");
  const [pct, setPct] = useState(0);
  const [erro, setErro] = useState<string | null>(null);

  useEffect(() => {
    let vivo = true;
    getLivro(slug)
      .then((l) => vivo && setEstado(l ? "baixado" : "disponivel"))
      .catch(() => vivo && setEstado("disponivel"));
    return () => {
      vivo = false;
    };
  }, [slug]);

  const baixar = useCallback(async () => {
    setErro(null);
    setEstado("baixando");
    setPct(0);
    try {
      await baixarCurso(slug, (feito, total) =>
        setPct(Math.round((feito / total) * 100))
      );
      setEstado("baixado");
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não deu pra baixar. Tente de novo.");
      setEstado("disponivel");
    }
  }, [slug]);

  const remover = useCallback(async () => {
    await removerLivro(slug).catch(() => {});
    setEstado("disponivel");
  }, [slug]);

  if (estado === "verificando") {
    return <div className="h-[52px] animate-pulse rounded-2xl bg-bege-100" />;
  }

  if (estado === "baixado") {
    return (
      <div className="flex items-center gap-2">
        <Link
          href={`/biblioteca/${slug}`}
          className="lift flex flex-1 items-center justify-center gap-2 rounded-2xl bg-oliveira-600 px-5 py-3 font-medium text-white shadow-sm transition hover:bg-oliveira-700"
        >
          <span aria-hidden>✓</span> Disponível offline · abrir
        </Link>
        <button
          onClick={remover}
          title="Remover download"
          className="flex-none rounded-2xl border border-bege-200 px-4 py-3 text-sm text-bege-500 transition hover:border-red-300 hover:text-red-600"
        >
          Remover
        </button>
      </div>
    );
  }

  if (estado === "baixando") {
    const r = 13;
    const c = 2 * Math.PI * r;
    return (
      <div className="flex items-center gap-3 rounded-2xl border border-laranja-200 bg-laranja-50 px-5 py-3">
        <svg viewBox="0 0 32 32" className="h-8 w-8 flex-none -rotate-90">
          <circle cx="16" cy="16" r={r} fill="none" stroke="#F0DFD0" strokeWidth="4" />
          <circle
            cx="16"
            cy="16"
            r={r}
            fill="none"
            stroke="#D55416"
            strokeWidth="4"
            strokeLinecap="round"
            strokeDasharray={c}
            strokeDashoffset={c * (1 - pct / 100)}
            style={{ transition: "stroke-dashoffset .3s ease" }}
          />
        </svg>
        <div className="min-w-0">
          <p className="text-sm font-medium text-laranja-800">Baixando… {pct}%</p>
          <p className="text-xs text-laranja-600">Texto e narração para uso offline</p>
        </div>
      </div>
    );
  }

  return (
    <div>
      <button
        onClick={baixar}
        className="lift flex w-full items-center justify-center gap-2 rounded-2xl border border-bege-200 bg-white px-5 py-3 font-medium text-mesa-800 shadow-sm transition hover:border-laranja-300 hover:bg-laranja-50"
      >
        <span aria-hidden className="text-lg">↓</span>
        Baixar para ler e ouvir offline
      </button>
      {erro && <p className="mt-2 text-center text-xs text-red-600">{erro}</p>}
    </div>
  );
}
