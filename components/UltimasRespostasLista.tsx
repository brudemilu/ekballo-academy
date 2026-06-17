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
  const [aberta, setAberta] = useState<string | null>(null);

  return (
    <ul className="divide-y divide-mesa-100">
      {respostas.map((r) => {
        const expandida = aberta === r.id;
        return (
          <li key={r.id}>
            <button
              type="button"
              onClick={() => setAberta(expandida ? null : r.id)}
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
  );
}
