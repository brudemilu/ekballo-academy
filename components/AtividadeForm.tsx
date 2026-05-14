"use client";

import { useState, useTransition } from "react";
import { createClient } from "@/lib/supabase/client";

type Props = {
  atividadeId: string;
  alunoId: string;
  perguntaIndex: number;
  pergunta: string;
  respostaInicial?: string;
  comentarioLider?: string | null;
};

export function AtividadeForm({
  atividadeId,
  alunoId,
  perguntaIndex,
  pergunta,
  respostaInicial,
  comentarioLider,
}: Props) {
  const [texto, setTexto] = useState(respostaInicial || "");
  const [salvando, startTransition] = useTransition();
  const [salvo, setSalvo] = useState<"idle" | "ok" | "erro">(
    respostaInicial ? "ok" : "idle"
  );

  function handleSalvar() {
    if (!texto.trim()) return;
    startTransition(async () => {
      const supabase = createClient();
      const { error } = await supabase
        .from("respostas")
        .upsert(
          {
            atividade_id: atividadeId,
            aluno_id: alunoId,
            texto: texto.trim(),
            updated_at: new Date().toISOString(),
          },
          { onConflict: "atividade_id,aluno_id" }
        );
      setSalvo(error ? "erro" : "ok");
    });
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <p className="mb-2 text-xs font-medium uppercase tracking-wider text-mesa-500">
        Reflexão {String(perguntaIndex + 1).padStart(2, "0")}
      </p>
      <h3 className="mb-5 font-serif text-xl font-semibold leading-snug text-mesa-800">
        {pergunta}
      </h3>

      <textarea
        value={texto}
        onChange={(e) => {
          setTexto(e.target.value);
          if (salvo === "ok") setSalvo("idle");
        }}
        rows={6}
        placeholder="Escreva aqui sua reflexão..."
        className="w-full resize-y rounded-lg border border-mesa-200 bg-mesa-50/40 px-4 py-3 text-mesa-900 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
      />

      <div className="mt-3 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <p className="text-xs text-mesa-500">
          {salvo === "ok"
            ? "✓ Sua resposta está salva. O líder vai ler."
            : salvando
              ? "Salvando..."
              : salvo === "erro"
                ? "Erro ao salvar — tente novamente."
                : "Sua resposta fica salva e o líder pode te responder depois."}
        </p>
        <button
          onClick={handleSalvar}
          disabled={salvando || !texto.trim()}
          className="rounded-full bg-mesa-700 px-5 py-2 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-50"
        >
          {salvando ? "Salvando..." : salvo === "ok" ? "Atualizar resposta" : "Salvar reflexão"}
        </button>
      </div>

      {comentarioLider && (
        <div className="mt-6 rounded-xl border-l-4 border-oliveira-400 bg-oliveira-50/50 p-4">
          <p className="mb-2 text-xs font-medium uppercase tracking-wider text-oliveira-700">
            Devolutiva do líder
          </p>
          <p className="whitespace-pre-wrap text-sm leading-relaxed text-mesa-800">
            {comentarioLider}
          </p>
        </div>
      )}
    </div>
  );
}
