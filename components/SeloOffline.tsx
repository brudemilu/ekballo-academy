"use client";

import { useEffect, useState } from "react";
import { listarLivros } from "@/lib/offline-db";

// Selo "✓ offline" nos cards do dashboard, pra ver de relance o que já foi baixado.
// A leitura do IndexedDB é memoizada em módulo: todos os cards compartilham UMA
// consulta (não abre o banco por card). O evento "ekballo-offline-mudou" (disparado
// ao baixar/remover) invalida o cache pra atualizar na hora.
export const EVENTO_OFFLINE = "ekballo-offline-mudou";

let cache: Promise<Set<string>> | null = null;
function slugsBaixados(force = false): Promise<Set<string>> {
  if (force) cache = null;
  if (!cache) {
    cache = listarLivros()
      .then((ls) => new Set(ls.map((l) => l.slug)))
      .catch(() => new Set<string>());
  }
  return cache;
}

export function SeloOffline({ slug }: { slug: string }) {
  const [baixado, setBaixado] = useState(false);

  useEffect(() => {
    let vivo = true;
    const checar = (force = false) =>
      slugsBaixados(force).then((set) => vivo && setBaixado(set.has(slug)));
    checar();
    const onMudou = () => checar(true);
    window.addEventListener(EVENTO_OFFLINE, onMudou);
    return () => {
      vivo = false;
      window.removeEventListener(EVENTO_OFFLINE, onMudou);
    };
  }, [slug]);

  if (!baixado) return null;
  return (
    <span className="absolute bottom-2 right-2 flex items-center gap-1 rounded-full bg-mesa-900/90 px-2.5 py-1 text-[11px] font-semibold text-white shadow-md ring-1 ring-white/25 backdrop-blur">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" width="12" height="12" aria-hidden>
        <path d="M12 3v12" />
        <path d="m7 11 5 4 5-4" />
        <path d="M5 21h14" />
      </svg>
      Offline
    </span>
  );
}
