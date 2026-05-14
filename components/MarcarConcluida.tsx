"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export function MarcarConcluida({
  alunoId,
  aulaId,
  jaConcluida,
}: {
  alunoId: string;
  aulaId: string;
  jaConcluida: boolean;
}) {
  const router = useRouter();
  const [concluida, setConcluida] = useState(jaConcluida);
  const [pending, startTransition] = useTransition();

  function handleClick() {
    startTransition(async () => {
      const supabase = createClient();
      if (!concluida) {
        await supabase
          .from("progresso")
          .upsert(
            { aluno_id: alunoId, aula_id: aulaId },
            { onConflict: "aluno_id,aula_id" }
          );
        setConcluida(true);
      } else {
        await supabase
          .from("progresso")
          .delete()
          .eq("aluno_id", alunoId)
          .eq("aula_id", aulaId);
        setConcluida(false);
      }
      router.refresh();
    });
  }

  return (
    <button
      onClick={handleClick}
      disabled={pending}
      className={`rounded-full px-6 py-2.5 text-sm font-medium transition disabled:opacity-50 ${
        concluida
          ? "border border-oliveira-300 bg-oliveira-100 text-oliveira-800 hover:bg-oliveira-200"
          : "bg-oliveira-600 text-white hover:bg-oliveira-700"
      }`}
    >
      {concluida ? "✓ Aula concluída" : "Marcar aula como concluída"}
    </button>
  );
}
