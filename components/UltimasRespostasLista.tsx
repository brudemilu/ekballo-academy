"use client";

import Link from "next/link";
import { useState } from "react";

type Resposta = {
  id: string;
  alunoNome: string | null;
  alunoEmail: string | null;
  created_at: string;
  cursoTitulo: string;
  aulaTitulo: string;
  texto: string | null;
  comentario_lider: string | null;
};

export default function UltimasRespostasLista({ respostas }: { respostas: Resposta[] }) {
  // A seção começa recolhida — vira um botão com a contagem que abre ao clicar.
  const [aberta, setAberta] = useState(false);
  // Qual resposta está expandida (texto completo) dentro da lista.
  const [itemAberto, setItemAberto] = useState<string | null>(null);

  const pendentes = respostas.filter((r) => !r.comentario_lider).length;

  return (
    <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white">
      <button
        type="button"
        onClick={() => setAberta((v) => !v)}
        aria-expanded={aberta}
        className="flex w-full items-center justify-between gap-3 px-6 py-4 text-left transition hover:bg-mesa-50/60"
      >
        <h2 className="font-serif text-xl font-semibold text-mesa-800">
          Últimas respostas
        </h2>
        <div className="flex items-center gap-2">
          <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-sm font-medium text-mesa-700">
            {respostas.length}{" "}
            {respostas.length === 1 ? "resposta" : "respostas"}
          </span>
          {pendentes > 0 && (
            <span className="rounded-full bg-amber-100 px-2.5 py-0.5 text-sm font-medium text-amber-800">
              {pendentes} aguardando
            </span>
          )}
          <span
            className={`text-mesa-400 transition-transform ${aberta ? "rotate-180" : ""}`}
            aria-hidden
          >
            ▾
          </span>
        </div>
      </button>

      {aberta &&
        (respostas.length === 0 ? (
          <p className="border-t border-mesa-100 px-6 py-12 text-center text-mesa-500">
            Nenhuma resposta ainda. Em breve a mesa estará posta.
          </p>
        ) : (
          <ul className="divide-y divide-mesa-100 border-t border-mesa-100">
            {respostas.map((r) => {
              const expandida = itemAberto === r.id;
              return (
                <li key={r.id}>
                  <button
                    type="button"
                    onClick={() => setItemAberto(expandida ? null : r.id)}
                    aria-expanded={expandida}
                    className="flex w-full items-start gap-4 px-6 py-4 text-left transition hover:bg-mesa-50/50"
                  >
                    <div
                      className={`mt-1 h-2.5 w-2.5 flex-none rounded-full transition ${
                        r.comentario_lider ? "bg-oliveira-400" : "bg-amber-400"
                      }`}
                    />
                    <div className="min-w-0 flex-1">
                      <div className="flex items-baseline justify-between gap-3">
                        <p className="font-medium text-mesa-800">
                          {r.alunoNome || r.alunoEmail}
                        </p>
                        <p className="flex-none text-xs text-mesa-500">
                          {new Date(r.created_at).toLocaleDateString("pt-BR")}
                        </p>
                      </div>
                      <p className="mt-0.5 text-xs text-mesa-500">
                        {r.cursoTitulo} · {r.aulaTitulo}
                      </p>
                      <p
                        className={`mt-2 whitespace-pre-wrap text-sm text-mesa-700 ${
                          expandida ? "" : "line-clamp-2"
                        }`}
                      >
                        {r.texto}
                      </p>
                      {!r.comentario_lider && (
                        <span className="mt-2 inline-block rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
                          Aguardando devolutiva
                        </span>
                      )}
                    </div>
                    <span
                      className={`mt-1 flex-none text-mesa-400 transition-transform ${
                        expandida ? "rotate-180" : ""
                      }`}
                      aria-hidden
                    >
                      ▾
                    </span>
                  </button>
                  {expandida && (
                    <div className="px-6 pb-4 pl-[3.25rem]">
                      <Link
                        href={`/admin/respostas/${r.id}`}
                        className="inline-flex items-center gap-1 rounded-full bg-laranja-100 px-3 py-1 text-xs font-medium text-laranja-800 transition hover:bg-laranja-200"
                      >
                        {r.comentario_lider ? "Ver devolutiva" : "Responder"} →
                      </Link>
                    </div>
                  )}
                </li>
              );
            })}
          </ul>
        ))}
    </div>
  );
}
