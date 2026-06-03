"use client";

import { useCallback, useEffect, useState } from "react";

type Item = {
  id: string;
  telefone: string;
  status: string;
  erro: string | null;
  criado_em: string;
  enviado_em: string | null;
  aluno?: { nome: string | null } | null;
};
type Contagens = Record<string, number>;

const STATUS_COR: Record<string, string> = {
  pendente: "bg-amber-100 text-amber-800",
  enviando: "bg-blue-100 text-blue-800",
  enviado: "bg-oliveira-100 text-oliveira-800",
  erro: "bg-red-100 text-red-800",
  cancelado: "bg-mesa-100 text-mesa-600",
};

export function WhatsAppFilaPainel() {
  const [contagens, setContagens] = useState<Contagens>({});
  const [itens, setItens] = useState<Item[]>([]);
  const [carregando, setCarregando] = useState(true);

  const carregar = useCallback(async () => {
    try {
      const r = await fetch("/api/admin/whatsapp-fila");
      const d = await r.json();
      if (r.ok) {
        setContagens(d.contagens || {});
        setItens(d.itens || []);
      }
    } finally {
      setCarregando(false);
    }
  }, []);

  useEffect(() => {
    carregar();
    // Atualiza a cada 30s pra acompanhar a fila esvaziando.
    const t = setInterval(carregar, 30000);
    return () => clearInterval(t);
  }, [carregar]);

  async function cancelarPendentes() {
    if (!confirm("Cancelar todos os envios de WhatsApp ainda pendentes na fila?")) return;
    await fetch("/api/admin/whatsapp-fila", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ acao: "cancelar" }),
    });
    await carregar();
  }

  const pendentes = contagens.pendente ?? 0;

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2 text-sm">
          {(["pendente", "enviando", "enviado", "erro", "cancelado"] as const).map((s) => (
            <span
              key={s}
              className={`rounded-full px-2.5 py-0.5 text-xs font-medium ${STATUS_COR[s]}`}
            >
              {s}: {contagens[s] ?? 0}
            </span>
          ))}
        </div>
        <div className="flex gap-2">
          <button
            type="button"
            onClick={carregar}
            className="rounded-full border border-mesa-200 bg-white px-4 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
          >
            Atualizar
          </button>
          {pendentes > 0 && (
            <button
              type="button"
              onClick={cancelarPendentes}
              className="rounded-full border border-red-200 bg-white px-4 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50"
            >
              Cancelar pendentes ({pendentes})
            </button>
          )}
        </div>
      </div>

      {pendentes > 0 && (
        <p className="mt-3 text-xs text-mesa-500">
          Saindo 1 por minuto — restam ~{pendentes} {pendentes === 1 ? "minuto" : "minutos"}.
        </p>
      )}

      {carregando ? (
        <p className="mt-4 text-sm text-mesa-500">Carregando…</p>
      ) : itens.length === 0 ? (
        <p className="mt-4 text-sm text-mesa-500">A fila está vazia.</p>
      ) : (
        <ul className="mt-4 divide-y divide-mesa-100">
          {itens.map((it) => (
            <li key={it.id} className="flex items-center justify-between gap-3 py-2.5 text-sm">
              <div className="min-w-0">
                <span className="text-mesa-800">{it.aluno?.nome || it.telefone}</span>
                {it.erro && <span className="ml-2 text-xs text-red-600">{it.erro}</span>}
              </div>
              <span
                className={`flex-none rounded-full px-2 py-0.5 text-xs font-medium ${
                  STATUS_COR[it.status] || "bg-mesa-100 text-mesa-600"
                }`}
              >
                {it.status}
              </span>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
