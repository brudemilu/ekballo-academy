"use client";

import { useCallback, useEffect, useRef, useState } from "react";

// Aviso de "nova versão". Compara o build embutido no bundle (NEXT_PUBLIC_BUILD_ID,
// fixado no momento do build) com o build atual do servidor (/api/version). Quando
// divergem, há um deploy novo no ar — mostra um banner pedindo pra atualizar.
// Resolve o caso do app instalado (PWA), onde o service worker segura a versão
// antiga em cache e a tela não recarrega sozinha. Funciona igual no PC e no celular.
const ATUAL = process.env.NEXT_PUBLIC_BUILD_ID || "dev";

export function UpdatePrompt() {
  const [novaVersao, setNovaVersao] = useState(false);
  const [atualizando, setAtualizando] = useState(false);
  const checando = useRef(false);

  const checar = useCallback(async () => {
    // Em local (build "dev") não há deploy pra comparar — não incomoda.
    if (ATUAL === "dev" || checando.current || novaVersao) return;
    checando.current = true;
    try {
      const res = await fetch("/api/version", { cache: "no-store" });
      if (!res.ok) return;
      const data = (await res.json()) as { build?: string };
      if (data.build && data.build !== "dev" && data.build !== ATUAL) {
        setNovaVersao(true);
      }
    } catch {
      // rede instável: tenta de novo no próximo ciclo
    } finally {
      checando.current = false;
    }
  }, [novaVersao]);

  useEffect(() => {
    checar();
    // Checa ao voltar pro app (abrir do background) e de tempos em tempos.
    const onVisivel = () => {
      if (document.visibilityState === "visible") checar();
    };
    document.addEventListener("visibilitychange", onVisivel);
    window.addEventListener("focus", checar);
    const id = window.setInterval(checar, 5 * 60 * 1000);
    return () => {
      document.removeEventListener("visibilitychange", onVisivel);
      window.removeEventListener("focus", checar);
      window.clearInterval(id);
    };
  }, [checar]);

  const atualizar = useCallback(async () => {
    setAtualizando(true);
    try {
      // Força o service worker a buscar a versão nova e limpa os caches de
      // assets antigos, pra o reload trazer tudo atualizado.
      if ("serviceWorker" in navigator) {
        const regs = await navigator.serviceWorker.getRegistrations();
        await Promise.all(regs.map((r) => r.update().catch(() => {})));
      }
      if ("caches" in window) {
        const chaves = await caches.keys();
        await Promise.all(chaves.map((k) => caches.delete(k)));
      }
    } catch {
      // mesmo se a limpeza falhar, o reload abaixo já traz a versão nova
    }
    window.location.reload();
  }, []);

  if (!novaVersao) return null;

  return (
    <div className="pointer-events-none fixed inset-x-0 bottom-0 z-[60] flex justify-center px-4 pb-[calc(env(safe-area-inset-bottom)+1rem)]">
      <div className="pointer-events-auto flex w-full max-w-md items-center gap-3 rounded-2xl border border-mesa-700 bg-mesa-900 px-4 py-3 text-white shadow-xl">
        <span className="text-xl" aria-hidden>
          ↻
        </span>
        <div className="min-w-0 flex-1">
          <p className="text-sm font-semibold">Nova versão disponível</p>
          <p className="text-xs text-mesa-300">Atualize para ver as novidades.</p>
        </div>
        <button
          onClick={atualizar}
          disabled={atualizando}
          className="flex-none rounded-full bg-laranja-500 px-4 py-2 text-sm font-medium text-white transition hover:bg-laranja-600 disabled:opacity-70"
        >
          {atualizando ? "Atualizando…" : "Atualizar"}
        </button>
      </div>
    </div>
  );
}
