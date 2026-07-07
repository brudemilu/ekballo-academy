"use client";

import { useState } from "react";

// Mostra o link iCal dos compromissos pra ASSINAR no Google Agenda. O usuário
// copia e cola em "Outras agendas → De URL". Assim os compromissos do WhatsApp
// aparecem no Google (leitura), sem credencial de escrita.
export function AssinarGoogleAgenda({ url }: { url: string }) {
  const [aberto, setAberto] = useState(false);
  const [copiado, setCopiado] = useState(false);

  async function copiar() {
    try {
      await navigator.clipboard.writeText(url);
      setCopiado(true);
      setTimeout(() => setCopiado(false), 2500);
    } catch {
      /* clipboard bloqueado: o usuário copia manual do campo */
    }
  }

  return (
    <div className="mb-6 rounded-xl border border-oliveira-200 bg-oliveira-50 px-4 py-3">
      <button
        type="button"
        onClick={() => setAberto((v) => !v)}
        className="flex w-full items-center justify-between text-left text-sm font-medium text-oliveira-800"
      >
        <span>📅 Ver estes compromissos no meu Google Agenda</span>
        <span className="text-oliveira-600">{aberto ? "▲" : "▼"}</span>
      </button>

      {aberto && (
        <div className="mt-3 space-y-3 text-sm text-mesa-700">
          <p>
            Copie o link abaixo e adicione no Google Agenda. Os compromissos
            (inclusive os marcados por WhatsApp) passam a aparecer no seu Google —
            o Google atualiza sozinho de tempos em tempos.
          </p>
          <div className="flex gap-2">
            <input
              readOnly
              value={url}
              onFocus={(e) => e.currentTarget.select()}
              className="min-w-0 flex-1 rounded-lg border border-mesa-200 bg-white px-3 py-2 font-mono text-xs text-mesa-700"
            />
            <button
              type="button"
              onClick={copiar}
              className="flex-none rounded-lg bg-oliveira-600 px-4 py-2 text-xs font-medium text-white hover:bg-oliveira-700"
            >
              {copiado ? "Copiado ✓" : "Copiar"}
            </button>
          </div>
          <ol className="ml-4 list-decimal space-y-1 text-xs text-mesa-600">
            <li>
              No computador, abra{" "}
              <a
                href="https://calendar.google.com/calendar/u/0/r/settings/addbyurl"
                target="_blank"
                rel="noreferrer"
                className="text-oliveira-700 underline"
              >
                Google Agenda → Adicionar de URL
              </a>
              .
            </li>
            <li>Cole o link no campo &ldquo;URL da agenda&rdquo; e clique em <strong>Adicionar agenda</strong>.</li>
            <li>Pronto — aparece uma agenda nova &ldquo;Ekballo — Compromissos&rdquo;. (É leitura; para editar, use o painel.)</li>
          </ol>
          <p className="text-xs text-amber-700">
            Não compartilhe este link — ele dá acesso de leitura aos seus compromissos.
          </p>
        </div>
      )}
    </div>
  );
}
