"use client";

import { useMemo, useState } from "react";
import Link from "next/link";

type Versiculo = { numero: number; texto: string };

export function CapituloLeitor({
  livroId,
  livroNome,
  capitulo,
  capitulosTotal,
  versiculos,
}: {
  livroId: number;
  livroNome: string;
  capitulo: number;
  capitulosTotal: number;
  versiculos: Versiculo[];
}) {
  const [sel, setSel] = useState<Set<number>>(new Set());

  function toggle(numero: number) {
    setSel((prev) => {
      const next = new Set(prev);
      if (next.has(numero)) next.delete(numero);
      else next.add(numero);
      return next;
    });
  }

  function limpar() {
    setSel(new Set());
  }

  const refLabel = useMemo(() => {
    if (sel.size === 0) return `${livroNome} ${capitulo}`;
    const arr = Array.from(sel).sort((a, b) => a - b);
    const contiguous =
      arr.length > 1 && arr.every((v, i) => i === 0 || v === arr[i - 1] + 1);
    return contiguous
      ? `${livroNome} ${capitulo}:${arr[0]}-${arr[arr.length - 1]}`
      : `${livroNome} ${capitulo}:${arr.join(",")}`;
  }, [sel, livroNome, capitulo]);

  // URL pra abrir o gerador de imagem
  function genUrl(formato: "feed" | "story") {
    const verses = Array.from(sel).sort((a, b) => a - b).join(",");
    const params = new URLSearchParams({
      livro: String(livroId),
      cap: String(capitulo),
      v: verses,
      f: formato,
    });
    return `/api/og/biblia?${params.toString()}`;
  }

  return (
    <>
      <div className="prose-mesa">
        <p className="text-mesa-800">
          {versiculos.map((v) => {
            const ativo = sel.has(v.numero);
            return (
              <span
                key={v.numero}
                onClick={() => toggle(v.numero)}
                className={`inline cursor-pointer transition ${
                  ativo
                    ? "bg-laranja-100 text-mesa-900 ring-2 ring-laranja-300 rounded-md px-0.5"
                    : "hover:bg-mesa-100/60 rounded-md"
                }`}
              >
                <sup className="mr-0.5 text-[10px] font-semibold text-mesa-500">
                  {v.numero}
                </sup>
                {v.texto}{" "}
              </span>
            );
          })}
        </p>
      </div>

      {/* Navegação entre capítulos */}
      <div className="mt-10 flex items-center justify-between border-t border-mesa-200 pt-6">
        {capitulo > 1 ? (
          <Link
            href={`/biblia/${livroId}/${capitulo - 1}`}
            className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm text-mesa-700 hover:bg-mesa-50"
          >
            ← Capítulo {capitulo - 1}
          </Link>
        ) : (
          <span />
        )}
        <span className="text-xs text-mesa-500">
          {capitulo} / {capitulosTotal}
        </span>
        {capitulo < capitulosTotal ? (
          <Link
            href={`/biblia/${livroId}/${capitulo + 1}`}
            className="rounded-full bg-mesa-700 px-4 py-2 text-sm text-mesa-50 hover:bg-mesa-800"
          >
            Capítulo {capitulo + 1} →
          </Link>
        ) : (
          <span />
        )}
      </div>

      {/* Barra flutuante de seleção */}
      {sel.size > 0 && (
        <div className="fixed inset-x-0 bottom-0 z-40 border-t border-mesa-200 bg-white/95 px-4 py-3 shadow-lg backdrop-blur sm:bottom-6 sm:left-1/2 sm:right-auto sm:-translate-x-1/2 sm:rounded-2xl sm:border sm:px-6 sm:py-4">
          <div className="mx-auto flex max-w-3xl flex-wrap items-center justify-between gap-3">
            <div className="min-w-0">
              <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
                {sel.size} {sel.size === 1 ? "versículo" : "versículos"}
              </p>
              <p className="truncate font-serif text-base font-semibold text-mesa-800">
                {refLabel}
              </p>
            </div>
            <div className="flex flex-wrap items-center gap-2">
              <button
                onClick={limpar}
                className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
              >
                Limpar
              </button>
              <a
                href={genUrl("feed")}
                target="_blank"
                rel="noopener noreferrer"
                className="rounded-full bg-laranja-600 px-4 py-2 text-xs font-medium text-white hover:bg-laranja-700"
              >
                📱 Feed (1:1)
              </a>
              <a
                href={genUrl("story")}
                target="_blank"
                rel="noopener noreferrer"
                className="rounded-full bg-mesa-700 px-4 py-2 text-xs font-medium text-white hover:bg-mesa-800"
              >
                📲 Story (9:16)
              </a>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
