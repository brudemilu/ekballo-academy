"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export function MarcarDiaForm({
  slug,
  dia,
  diasTotal,
  concluidoInicial,
}: {
  slug: string;
  dia: number;
  diasTotal: number;
  concluidoInicial: boolean;
}) {
  const router = useRouter();
  const [concluido, setConcluido] = useState(concluidoInicial);
  const [pending, startTransition] = useTransition();
  const [erro, setErro] = useState<string | null>(null);

  function handleToggle() {
    setErro(null);
    startTransition(async () => {
      try {
        const resp = await fetch("/api/planos/marcar-dia", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            slug,
            dia,
            acao: concluido ? "desmarcar" : "marcar",
          }),
        });
        if (!resp.ok) {
          const j = await resp.json().catch(() => ({}));
          throw new Error(j.erro || `HTTP ${resp.status}`);
        }
        setConcluido(!concluido);
        router.refresh();
      } catch (e) {
        setErro(e instanceof Error ? e.message : String(e));
      }
    });
  }

  if (concluido) {
    return (
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <p className="font-serif text-lg font-semibold text-oliveira-800">
            ✓ Dia {dia} concluído
          </p>
          <p className="mt-1 text-sm text-oliveira-700">
            {dia < diasTotal
              ? `Próximo: dia ${dia + 1}. Vá com calma e firmeza.`
              : "Você completou todo o plano. 🎉"}
          </p>
        </div>
        <div className="flex items-center gap-2">
          <button
            onClick={handleToggle}
            disabled={pending}
            className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50 disabled:opacity-50"
          >
            {pending ? "..." : "Desmarcar"}
          </button>
          {dia < diasTotal && (
            <Link
              href={`/planos/${slug}/dia/${dia + 1}`}
              className="rounded-full bg-oliveira-600 px-5 py-2 text-sm font-medium text-white hover:bg-oliveira-700"
            >
              Próximo dia →
            </Link>
          )}
        </div>
        {erro && (
          <p className="w-full text-xs text-red-700">{erro}</p>
        )}
      </div>
    );
  }

  return (
    <div className="flex flex-wrap items-center justify-between gap-3">
      <div>
        <p className="font-serif text-lg font-semibold text-mesa-800">
          Terminou a leitura de hoje?
        </p>
        <p className="mt-1 text-sm text-mesa-600">
          Marque o dia pra acompanhar seu progresso geral.
        </p>
      </div>
      <button
        onClick={handleToggle}
        disabled={pending}
        className="rounded-full bg-oliveira-600 px-6 py-2.5 text-sm font-medium text-white hover:bg-oliveira-700 disabled:opacity-50"
      >
        {pending ? "Salvando..." : "✓ Marcar como concluído"}
      </button>
      {erro && (
        <p className="w-full text-xs text-red-700">{erro}</p>
      )}
    </div>
  );
}
