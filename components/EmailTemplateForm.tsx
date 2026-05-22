"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { EmailTemplate } from "@/lib/types";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

type Props = {
  template: EmailTemplate;
};

export function EmailTemplateForm({ template }: Props) {
  const router = useRouter();
  const [assunto, setAssunto] = useState(template.assunto);
  const [corpoHtml, setCorpoHtml] = useState(template.corpo_html);
  const [corpoTexto, setCorpoTexto] = useState(template.corpo_texto ?? "");
  const [ativo, setAtivo] = useState(template.ativo);
  const [salvando, startTransition] = useTransition();
  const [status, setStatus] = useState<"idle" | "ok" | "erro">("idle");

  function handleSalvar() {
    setStatus("idle");
    startTransition(async () => {
      if (MOCK) {
        // mock mode: simula sucesso, sem persistência
        await new Promise((r) => setTimeout(r, 400));
        setStatus("ok");
        return;
      }
      const supabase = createClient();
      const { error } = await supabase
        .from("email_templates")
        .update({
          assunto,
          corpo_html: corpoHtml,
          corpo_texto: corpoTexto || null,
          ativo,
        })
        .eq("chave", template.chave);
      if (error) {
        setStatus("erro");
      } else {
        setStatus("ok");
        router.refresh();
      }
    });
  }

  function inserirVariavel(varName: string, alvo: "assunto" | "html" | "texto") {
    if (alvo === "assunto") setAssunto((v) => v + varName);
    else if (alvo === "html") setCorpoHtml((v) => v + varName);
    else setCorpoTexto((v) => v + varName);
  }

  return (
    <div className="space-y-6">
      {template.variaveis_disponiveis.length > 0 && (
        <div className="rounded-xl border border-mesa-200 bg-white p-5">
          <p className="mb-2 text-xs font-medium uppercase tracking-wider text-mesa-500">
            Variáveis disponíveis
          </p>
          <p className="mb-3 text-sm text-mesa-600">
            Clique numa variável pra inserir no campo de assunto. Pra inserir no corpo, copie e cole onde quiser. As variáveis são substituídas pelos dados reais no momento do envio.
          </p>
          <div className="flex flex-wrap gap-2">
            {template.variaveis_disponiveis.map((v) => (
              <button
                key={v}
                type="button"
                onClick={() => inserirVariavel(v, "assunto")}
                className="rounded-full border border-mesa-200 bg-mesa-50 px-3 py-1 font-mono text-xs text-mesa-700 hover:bg-mesa-100"
                title="Clique pra inserir no assunto"
              >
                {v}
              </button>
            ))}
          </div>
        </div>
      )}

      <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
        <div className="space-y-5">
          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">
              Assunto
            </label>
            <input
              type="text"
              value={assunto}
              onChange={(e) => setAssunto(e.target.value)}
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
              placeholder="Ex.: Bem-vindo(a) ao curso {{nome_curso}}"
            />
          </div>

          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">
              Corpo (HTML)
            </label>
            <textarea
              value={corpoHtml}
              onChange={(e) => setCorpoHtml(e.target.value)}
              rows={16}
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 font-mono text-xs text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
              spellCheck={false}
            />
            <p className="mt-1 text-xs text-mesa-500">
              Use HTML simples com estilos inline. Evite Tailwind/classes externas — clientes de email não suportam.
            </p>
          </div>

          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">
              Corpo (texto puro — fallback)
            </label>
            <textarea
              value={corpoTexto}
              onChange={(e) => setCorpoTexto(e.target.value)}
              rows={6}
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
              placeholder="Versão em texto puro para clientes que não renderizam HTML (opcional)."
            />
          </div>

          <label className="flex items-center gap-3">
            <input
              type="checkbox"
              checked={ativo}
              onChange={(e) => setAtivo(e.target.checked)}
              className="h-4 w-4 rounded border-mesa-300 text-mesa-700 focus:ring-mesa-400"
            />
            <span className="text-sm text-mesa-700">
              Template ativo (será enviado automaticamente quando o evento acontecer)
            </span>
          </label>
        </div>

        <div className="mt-6 flex flex-wrap items-center justify-between gap-4 border-t border-mesa-100 pt-5">
          <div className="text-sm">
            {status === "ok" && (
              <span className="text-oliveira-700">✓ Salvo</span>
            )}
            {status === "erro" && (
              <span className="text-red-700">Erro ao salvar. Tente novamente.</span>
            )}
            {MOCK && status === "ok" && (
              <span className="ml-2 text-xs text-amber-700">
                (mock — alterações não foram persistidas)
              </span>
            )}
          </div>
          <button
            type="button"
            onClick={handleSalvar}
            disabled={salvando}
            className="rounded-full bg-mesa-700 px-6 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:bg-mesa-300"
          >
            {salvando ? "Salvando..." : "Salvar alterações"}
          </button>
        </div>
      </div>
    </div>
  );
}
