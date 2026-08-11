"use client";

import { useRouter } from "next/navigation";
import { useTransition } from "react";

// ✕ do card de "Continuando a leitura": tira o livro do destaque sem apagar
// progresso. Fica fora do <Link> do card (botão dentro de link é HTML inválido).
export function DispensarLeitura({
  cursoId,
  titulo,
}: {
  cursoId: string;
  titulo: string;
}) {
  const router = useRouter();
  const [pending, startTransition] = useTransition();

  function dispensar() {
    startTransition(async () => {
      await fetch("/api/leitura/dispensar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cursoId }),
      }).catch(() => {});
      router.refresh();
    });
  }

  return (
    <button
      type="button"
      onClick={dispensar}
      disabled={pending}
      title={`Tirar "${titulo}" da lista`}
      aria-label={`Tirar ${titulo} da lista de leituras em andamento`}
      className="absolute right-2 top-2 z-10 flex h-6 w-6 items-center justify-center rounded-full text-xs text-mesa-400 transition hover:bg-mesa-100 hover:text-mesa-700 disabled:opacity-40"
    >
      ✕
    </button>
  );
}
