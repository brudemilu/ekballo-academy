"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export function ComentarioForm({
  respostaId,
  comentarioInicial,
}: {
  respostaId: string;
  comentarioInicial: string | null;
}) {
  const router = useRouter();
  const [texto, setTexto] = useState(comentarioInicial || "");
  const [pending, startTransition] = useTransition();
  const [salvo, setSalvo] = useState<"idle" | "ok" | "erro">(
    comentarioInicial ? "ok" : "idle"
  );

  function handleSalvar() {
    startTransition(async () => {
      if (MOCK) {
        await new Promise((r) => setTimeout(r, 400));
        setSalvo("ok");
        return;
      }
      // Vai pela API route — ela faz o update e dispara push pro aluno.
      try {
        const resp = await fetch("/api/admin/devolutiva", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ respostaId, texto }),
        });
        if (resp.ok) {
          setSalvo("ok");
          router.refresh();
        } else {
          setSalvo("erro");
        }
      } catch {
        setSalvo("erro");
      }
    });
  }

  return (
    <div className="rounded-2xl border border-oliveira-200 bg-oliveira-50/30 p-6">
      <p className="mb-3 text-xs font-medium uppercase tracking-wider text-oliveira-700">
        Sua devolutiva pastoral
      </p>
      <textarea
        value={texto}
        onChange={(e) => {
          setTexto(e.target.value);
          if (salvo === "ok") setSalvo("idle");
        }}
        rows={5}
        placeholder="Escreva uma palavra de cuidado, encorajamento ou direcionamento. O aluno verá esta devolutiva ao voltar à atividade."
        className="w-full resize-y rounded-lg border border-oliveira-200 bg-white px-4 py-3 outline-none focus:border-oliveira-400 focus:ring-2 focus:ring-oliveira-200"
      />
      <div className="mt-3 flex items-center justify-between">
        <p className="text-xs text-mesa-500">
          {salvo === "ok"
            ? MOCK ? "✓ Devolutiva salva (modo demo — não persiste após recarregar)." : "✓ Devolutiva enviada ao aluno."
            : pending
              ? "Salvando..."
              : "Esta mensagem aparece para o aluno na atividade."}
        </p>
        <button
          onClick={handleSalvar}
          disabled={pending}
          className="rounded-full bg-oliveira-600 px-5 py-2 text-sm font-medium text-white hover:bg-oliveira-700 disabled:opacity-50"
        >
          {pending ? "Salvando..." : comentarioInicial ? "Atualizar" : "Enviar devolutiva"}
        </button>
      </div>
    </div>
  );
}
