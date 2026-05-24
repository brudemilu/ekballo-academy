"use client";

import { useMemo, useState } from "react";
import Link from "next/link";

type Versiculo = { numero: number; texto: string };

export function CapituloLeitor({
  livroId,
  livroNome,
  capitulo,
  capitulosTotal,
  versao,
  versiculos,
}: {
  livroId: number;
  livroNome: string;
  capitulo: number;
  capitulosTotal: number;
  versao: string;
  versiculos: Versiculo[];
}) {
  const [sel, setSel] = useState<Set<number>>(new Set());
  const [tema, setTema] = useState<"classico" | "moderno">("classico");

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

  // URL pra abrir o gerador de imagem.
  // dl=1 → server responde com Content-Disposition: attachment, força download.
  function genUrl(formato: "feed" | "story", baixar = false) {
    const verses = Array.from(sel).sort((a, b) => a - b).join(",");
    const params = new URLSearchParams({
      livro: String(livroId),
      cap: String(capitulo),
      v: verses,
      f: formato,
      versao,
      tema,
    });
    if (baixar) params.set("dl", "1");
    return `/api/og/biblia?${params.toString()}`;
  }

  function filename(formato: "feed" | "story") {
    const arr = Array.from(sel).sort((a, b) => a - b);
    const ref =
      arr.length > 1 && arr.every((v, i) => i === 0 || v === arr[i - 1] + 1)
        ? `${capitulo}-${arr[0]}-${arr[arr.length - 1]}`
        : `${capitulo}-${arr.join(",")}`;
    return `${livroNome.replace(/\s+/g, "-")}-${ref}-${versao}-${tema}-${formato}.png`;
  }

  // Mantém versão na navegação ←/→
  const linkBase = (cap: number) =>
    `/biblia/${livroId}/${cap}${versao !== "ACF" ? `?v=${versao}` : ""}`;

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
            href={linkBase(capitulo - 1)}
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
            href={linkBase(capitulo + 1)}
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
          <div className="mx-auto flex max-w-3xl flex-col gap-3">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <div className="min-w-0">
                <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
                  {sel.size} {sel.size === 1 ? "versículo" : "versículos"}
                </p>
                <p className="truncate font-serif text-base font-semibold text-mesa-800">
                  {refLabel}
                </p>
              </div>
              {/* Seletor de tema */}
              <div className="flex items-center gap-1.5 rounded-full bg-mesa-100 p-1">
                <button
                  type="button"
                  onClick={() => setTema("classico")}
                  className={`rounded-full px-3 py-1 text-xs font-medium transition ${
                    tema === "classico"
                      ? "bg-mesa-700 text-mesa-50"
                      : "text-mesa-600 hover:text-mesa-800"
                  }`}
                >
                  Clássico
                </button>
                <button
                  type="button"
                  onClick={() => setTema("moderno")}
                  className={`rounded-full px-3 py-1 text-xs font-medium transition ${
                    tema === "moderno"
                      ? "bg-mesa-700 text-mesa-50"
                      : "text-mesa-600 hover:text-mesa-800"
                  }`}
                >
                  Moderno
                </button>
              </div>
            </div>
            <div className="flex flex-wrap items-center gap-2">
              <button
                onClick={limpar}
                className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
              >
                Limpar
              </button>
              {/* Download direto (Content-Disposition: attachment no server) */}
              <a
                href={genUrl("feed", true)}
                download={filename("feed")}
                className="rounded-full bg-laranja-600 px-4 py-2 text-xs font-medium text-white hover:bg-laranja-700"
                title="Baixar imagem quadrada (1080x1080) pra feed/WhatsApp"
              >
                ⬇ Feed (1:1)
              </a>
              <a
                href={genUrl("story", true)}
                download={filename("story")}
                className="rounded-full bg-mesa-700 px-4 py-2 text-xs font-medium text-white hover:bg-mesa-800"
                title="Baixar imagem vertical (1080x1920) pra Story/Status"
              >
                ⬇ Story (9:16)
              </a>
              {/* Preview separado pra quem quer ver antes de salvar */}
              <a
                href={genUrl("feed")}
                target="_blank"
                rel="noopener noreferrer"
                className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-600 hover:bg-mesa-50"
                title="Abrir prévia em nova aba"
              >
                👁 Ver
              </a>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
