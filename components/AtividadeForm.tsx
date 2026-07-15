"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

type Props = {
  atividadeId: string;
  alunoId: string;
  perguntaIndex: number;
  pergunta: string;
  respostaInicial?: string;
  comentarioLider?: string | null;
  // "anotacao" = caderno de anotações da mesa (o líder lê, mas não é obrigatório).
  // "reflexao" = pergunta de reflexão padrão da mesa de discipulado.
  variante?: "reflexao" | "anotacao";
};

export function AtividadeForm({
  atividadeId,
  alunoId,
  perguntaIndex,
  pergunta,
  respostaInicial,
  comentarioLider,
  variante = "reflexao",
}: Props) {
  const ehAnotacao = variante === "anotacao";
  const router = useRouter();
  const [texto, setTexto] = useState(respostaInicial || "");
  const [salvando, startTransition] = useTransition();
  const [salvo, setSalvo] = useState<"idle" | "ok" | "erro">(
    respostaInicial ? "ok" : "idle"
  );

  function handleSalvar() {
    const conteudo = texto.trim();
    if (!conteudo) return;
    startTransition(async () => {
      if (MOCK) {
        try {
          const res = await fetch("/api/mock/salvar-reflexao", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ atividadeId, alunoId, texto: conteudo }),
          });
          if (!res.ok) throw new Error("Falha ao salvar (mock).");
          setSalvo("ok");
          router.refresh();
        } catch {
          setSalvo("erro");
        }
        return;
      }
      const supabase = createClient();
      const { error } = await supabase
        .from("respostas")
        .upsert(
          {
            atividade_id: atividadeId,
            aluno_id: alunoId,
            texto: conteudo,
            updated_at: new Date().toISOString(),
          },
          { onConflict: "atividade_id,aluno_id" }
        );
      if (error) {
        setSalvo("erro");
      } else {
        setSalvo("ok");
        router.refresh();
      }
    });
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <div className="mb-2 flex items-center gap-2">
        <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
          {ehAnotacao
            ? "✍️ Anotações da mesa"
            : `Pergunta ${String(perguntaIndex + 1).padStart(2, "0")}`}
        </p>
      </div>
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
        placeholder={
          ehAnotacao
            ? "Escreva aqui suas anotações sobre a mesa — o que te marcou, dúvidas, aplicações..."
            : "Escreva aqui sua reflexão..."
        }
        className="w-full resize-y rounded-lg border border-mesa-200 bg-mesa-50/40 px-4 py-3 text-mesa-900 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100"
      />

      <div className="mt-3 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <p className="text-xs text-mesa-500">
          {salvo === "ok"
            ? ehAnotacao
              ? "✓ Anotações salvas. Seu líder pode ler."
              : "✓ Sua resposta está salva. O líder vai ler."
            : salvando
              ? "Salvando..."
              : salvo === "erro"
                ? "Erro ao salvar — tente novamente."
                : ehAnotacao
                  ? "Suas anotações ficam salvas e seu líder pode ler."
                  : "Sua resposta fica salva e seu líder pode ler."}
        </p>
        <button
          onClick={handleSalvar}
          disabled={salvando || !texto.trim()}
          className="rounded-full bg-laranja-500 px-5 py-2 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-50"
        >
          {salvando
            ? "Salvando..."
            : salvo === "ok"
              ? ehAnotacao
                ? "Atualizar anotações"
                : "Atualizar resposta"
              : ehAnotacao
                ? "Salvar anotações"
                : "Salvar reflexão"}
        </button>
      </div>

      {comentarioLider && (
        <div className="mt-6 rounded-xl border-l-4 border-oliveira-400 bg-oliveira-50/50 p-4">
          <p className="mb-2 text-xs font-medium uppercase tracking-wider text-oliveira-700">
            Devolutiva do líder
          </p>
          <p className="whitespace-pre-wrap text-sm leading-relaxed text-mesa-800 text-justify hyphens-auto">
            {comentarioLider}
          </p>
        </div>
      )}
    </div>
  );
}
