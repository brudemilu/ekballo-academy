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
    <span className="absolute bottom-2 left-2 flex items-center gap-1 rounded-full bg-oliveira-600/95 px-2 py-0.5 text-[10px] font-semibold text-white shadow-sm backdrop-blur">
      ↓ offline
    </span>
  );
}
