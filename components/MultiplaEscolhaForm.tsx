"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { Alternativa } from "@/lib/types";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

type Props = {
  atividadeId: string;
  alunoId: string;
  perguntaIndex: number;
  pergunta: string;
  razao: string | null;
  alternativas: Alternativa[];
  alternativaSalvaId: string | null;
};

export function MultiplaEscolhaForm({
  atividadeId,
  alunoId,
  perguntaIndex,
  pergunta,
  razao,
  alternativas,
  alternativaSalvaId,
}: Props) {
  const router = useRouter();
  const [selecionada, setSelecionada] = useState<string | null>(alternativaSalvaId);
  const [confirmada, setConfirmada] = useState<string | null>(alternativaSalvaId);
  const [pending, startTransition] = useTransition();

  const altCorreta = alternativas.find((a) => a.correta);
  const confirmadaObj = confirmada ? alternativas.find((a) => a.id === confirmada) : null;
  const acertou = confirmadaObj?.correta === true;

  function handleConfirmar() {
    if (!selecionada) return;
    startTransition(async () => {
      if (MOCK) {
        // Simula salvar — depois recarrega para o servidor pegar o novo estado
        await fetch("/api/mock/salvar-mc", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ atividadeId, alunoId, alternativaId: selecionada }),
        });
        setConfirmada(selecionada);
        router.refresh();
        return;
      }
      const supabase = createClient();
      await supabase.from("respostas").upsert(
        {
          atividade_id: atividadeId,
          aluno_id: alunoId,
          alternativa_id: selecionada,
          texto: null,
          updated_at: new Date().toISOString(),
        },
        { onConflict: "atividade_id,aluno_id" }
      );
      setConfirmada(selecionada);
      router.refresh();
    });
  }

  function handleTentarNovamente() {
    setConfirmada(null);
    setSelecionada(null);
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <div className="mb-2 flex items-center gap-2">
        <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
          Questão {String(perguntaIndex + 1).padStart(2, "0")}
        </p>
        <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-[10px] font-medium uppercase tracking-wider text-mesa-700">
          Múltipla escolha
        </span>
        {acertou && (
          <span className="rounded-full bg-oliveira-100 px-2 py-0.5 text-[10px] font-medium uppercase tracking-wider text-oliveira-700">
            ✓ Correta
          </span>
        )}
      </div>
      <h3 className="mb-6 font-serif text-xl font-semibold leading-snug text-mesa-800">
        {pergunta}
      </h3>

      <div className="space-y-2">
        {alternativas.map((alt, idx) => {
          const letra = String.fromCharCode(65 + idx);
          const isSelected = selecionada === alt.id;
          const isConfirmada = confirmada === alt.id;
          const isCorreta = alt.correta;

          let stateClass = "border-mesa-200 bg-mesa-50/40 hover:bg-mesa-100";
          if (confirmada && isConfirmada && isCorreta) {
            stateClass = "border-oliveira-400 bg-oliveira-50";
          } else if (confirmada && isConfirmada && !isCorreta) {
            stateClass = "border-red-300 bg-red-50";
          } else if (confirmada && !isConfirmada && isCorreta) {
            // só destaca a correta se o usuário errou
            stateClass = !acertou ? "border-oliveira-300 bg-oliveira-50/60" : "border-mesa-200 bg-mesa-50/30";
          } else if (confirmada) {
            stateClass = "border-mesa-200 bg-mesa-50/30 opacity-60";
          } else if (isSelected) {
            stateClass = "border-mesa-400 bg-mesa-100";
          }

          return (
            <button
              key={alt.id}
              type="button"
              disabled={!!confirmada}
              onClick={() => setSelecionada(alt.id)}
              className={`group flex w-full items-start gap-3 rounded-xl border-2 p-4 text-left transition ${stateClass} ${confirmada ? "cursor-default" : "cursor-pointer"}`}
            >
              <div className={`flex h-7 w-7 flex-none items-center justify-center rounded-full font-medium text-sm ${
                confirmada && isConfirmada && isCorreta ? "bg-oliveira-600 text-white" :
                confirmada && isConfirmada && !isCorreta ? "bg-red-500 text-white" :
                confirmada && !isConfirmada && isCorreta && !acertou ? "bg-oliveira-200 text-oliveira-800" :
                isSelected ? "bg-mesa-700 text-white" :
                "bg-mesa-200 text-mesa-700"
              }`}>
                {confirmada && isConfirmada && isCorreta ? "✓" :
                  confirmada && isConfirmada && !isCorreta ? "✗" :
                  letra}
              </div>
              <span className="flex-1 text-sm leading-relaxed text-mesa-800">
                {alt.texto}
              </span>
            </button>
          );
        })}
      </div>

      {confirmada && (
        <div className={`mt-5 rounded-xl border-l-4 p-4 ${acertou ? "border-oliveira-400 bg-oliveira-50/50" : "border-amber-400 bg-amber-50/50"}`}>
          <p className={`mb-2 text-xs font-medium uppercase tracking-wider ${acertou ? "text-oliveira-700" : "text-amber-700"}`}>
            {acertou ? "✓ Resposta correta" : "Não foi dessa vez"}
          </p>
          {!acertou && altCorreta && (
            <p className="mb-2 text-sm text-mesa-700">
              <span className="font-medium">Resposta correta:</span> {altCorreta.texto}
            </p>
          )}
          {razao && (
            <p className="text-sm leading-relaxed text-mesa-800">
              <span className="font-medium">Por quê:</span> {razao}
            </p>
          )}
        </div>
      )}

      <div className="mt-5 flex items-center justify-between gap-3">
        <p className="text-xs text-mesa-500">
          {acertou
            ? "Esta questão está respondida. Avance para a próxima ou tente de novo."
            : confirmada
              ? "Você pode tentar de novo até acertar para liberar a próxima aula."
              : "Selecione uma alternativa e confirme."}
        </p>
        {!confirmada ? (
          <button
            onClick={handleConfirmar}
            disabled={!selecionada || pending}
            className="rounded-full bg-mesa-700 px-5 py-2 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-50"
          >
            {pending ? "Verificando..." : "Confirmar resposta"}
          </button>
        ) : (
          <button
            onClick={handleTentarNovamente}
            className="rounded-full border border-mesa-300 bg-white px-5 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-50"
          >
            Tentar novamente
          </button>
        )}
      </div>
    </div>
  );
}
