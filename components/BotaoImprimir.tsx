"use client";

import { useEffect } from "react";

// "Salvar em PDF" sem biblioteca de PDF: a folha /anotacoes/imprimir é montada
// como papel A4 (ver @media print no globals.css) e quem gera o arquivo é o
// próprio navegador — no diálogo de impressão, "Destino: Salvar como PDF".
export function BotaoImprimir({ auto = false }: { auto?: boolean }) {
  useEffect(() => {
    if (!auto) return;
    // Espera a fonte/layout assentarem, senão o Chrome imprime a página crua.
    const t = setTimeout(() => window.print(), 500);
    return () => clearTimeout(t);
  }, [auto]);

  return (
    <button
      onClick={() => window.print()}
      className="rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600"
    >
      📄 Salvar em PDF / Imprimir
    </button>
  );
}
