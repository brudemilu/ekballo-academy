"use client";

import { useEffect, useState } from "react";

/**
 * Liga/desliga a repetição do Instagram no Status do WhatsApp (issue #258):
 * Reel publicado vira Status com o link; story é repetido no Status.
 */
export function StatusWhatsAppToggle() {
  const [ativo, setAtivo] = useState<boolean | null>(null);
  const [salvando, setSalvando] = useState(false);
  const [erro, setErro] = useState("");

  useEffect(() => {
    fetch("/api/admin/instagram/status-whatsapp")
      .then((r) => r.json())
      .then((d) => setAtivo(Boolean(d?.ativo)))
      .catch(() => setErro("Não consegui ler a configuração."));
  }, []);

  async function trocar() {
    if (ativo === null) return;
    setSalvando(true);
    setErro("");
    try {
      const res = await fetch("/api/admin/instagram/status-whatsapp", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ativo: !ativo }),
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(d?.error || "Falha");
      setAtivo(!ativo);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não consegui salvar.");
    } finally {
      setSalvando(false);
    }
  }

  return (
    <div className="mb-4 flex flex-wrap items-center gap-3 rounded-2xl border border-mesa-200 bg-white p-4">
      <div className="min-w-0 flex-1">
        <p className="text-sm font-semibold text-mesa-800">
          📲 Repetir no Status do WhatsApp
        </p>
        <p className="mt-1 text-xs text-mesa-500">
          Todo Reel publicado no Instagram vira um Status com o link; todo story é
          repetido no Status. Vale também para o que você postar direto no aplicativo.
        </p>
        {erro && <p className="mt-1 text-xs text-red-600">{erro}</p>}
      </div>
      <button
        type="button"
        onClick={trocar}
        disabled={ativo === null || salvando}
        aria-pressed={Boolean(ativo)}
        className={`shrink-0 rounded-lg px-4 py-2 text-sm font-semibold transition disabled:opacity-50 ${
          ativo
            ? "bg-oliveira-600 text-white hover:opacity-90"
            : "border border-mesa-300 bg-white text-mesa-700 hover:bg-mesa-100"
        }`}
      >
        {ativo === null ? "…" : salvando ? "Salvando…" : ativo ? "Ligado" : "Desligado"}
      </button>
    </div>
  );
}
