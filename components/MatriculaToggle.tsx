"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export function MatriculaToggle({
  alunoId,
  cursoId,
  cursoTitulo,
  matriculadoInicial,
}: {
  alunoId: string;
  cursoId: string;
  cursoTitulo: string;
  matriculadoInicial: boolean;
}) {
  const router = useRouter();
  const [matriculado, setMatriculado] = useState(matriculadoInicial);
  const [pending, startTransition] = useTransition();
  const [erro, setErro] = useState<string | null>(null);

  function handleToggle() {
    setErro(null);
    startTransition(async () => {
      const novaSituacao = !matriculado;
      try {
        if (MOCK) {
          const res = await fetch("/api/mock/matricular", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
              alunoId,
              cursoId,
              acao: novaSituacao ? "matricular" : "desmatricular",
            }),
          });
          if (!res.ok) throw new Error("Falha ao atualizar matrícula (mock).");
        } else {
          const supabase = createClient();
          if (novaSituacao) {
            const { error } = await supabase
              .from("matriculas")
              .upsert(
                { aluno_id: alunoId, curso_id: cursoId },
                { onConflict: "aluno_id,curso_id" }
              );
            if (error) throw error;
          } else {
            const { error } = await supabase
              .from("matriculas")
              .delete()
              .eq("aluno_id", alunoId)
              .eq("curso_id", cursoId);
            if (error) throw error;
          }
        }
        setMatriculado(novaSituacao);
        router.refresh();
      } catch (e) {
        setErro(e instanceof Error ? e.message : "Erro ao salvar.");
      }
    });
  }

  return (
    <div className="flex flex-col items-end gap-1">
      <button
        type="button"
        onClick={handleToggle}
        disabled={pending}
        aria-label={
          matriculado
            ? `Desmatricular do curso ${cursoTitulo}`
            : `Matricular no curso ${cursoTitulo}`
        }
        className={
          matriculado
            ? "rounded-full border border-oliveira-300 bg-oliveira-50 px-5 py-2 text-sm font-medium text-oliveira-800 hover:bg-oliveira-100 disabled:opacity-50"
            : "rounded-full bg-laranja-600 px-5 py-2 text-sm font-medium text-white hover:bg-laranja-700 disabled:opacity-50"
        }
      >
        {pending
          ? "Salvando…"
          : matriculado
            ? "✓ Matriculado · desmatricular"
            : "Matricular"}
      </button>
      {erro && <p className="text-xs text-red-600">{erro}</p>}
    </div>
  );
}
