"use client";

import { useState } from "react";

export function AdminEnglishActions() {
  const [loading, setLoading] = useState(false);
  const [status, setStatus] = useState<string | null>(null);

  async function enviarLembrete() {
    setLoading(true);
    setStatus(null);
    try {
      const res = await fetch("/api/admin/english", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          titulo: "Atividade do dia",
          mensagem: "Hoje é um ótimo dia para fazer sua atividade do Ekballo English.",
        }),
      });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(data.erro || "Falha ao enviar lembrete");
      setStatus(`Lembrete enviado com sucesso para ${data.enviados ?? 0} dispositivos.`);
    } catch (error) {
      setStatus(error instanceof Error ? error.message : "Falha ao enviar lembrete");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-5 shadow-sm shadow-mesa-700/5">
      <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <p className="text-sm font-semibold text-mesa-700">Lembrete de atividade</p>
          <p className="mt-1 text-sm text-mesa-600">Envie um aviso por push para reforçar a rotina do curso.</p>
        </div>
        <button
          onClick={enviarLembrete}
          disabled={loading}
          className="rounded-full bg-laranja-500 px-4 py-2 text-sm font-semibold text-white transition hover:bg-laranja-600 disabled:opacity-60"
        >
          {loading ? "Enviando..." : "Enviar lembrete"}
        </button>
      </div>
      {status ? <p className="mt-3 text-sm text-mesa-700">{status}</p> : null}
    </div>
  );
}
