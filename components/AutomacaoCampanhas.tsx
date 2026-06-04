"use client";

import { useCallback, useEffect, useState } from "react";

type Candidato = {
  id: string;
  aluno_id: string;
  nome: string | null;
  telefone: string;
  motivo: string | null;
};
type Template = { id: string; titulo: string; corpo: string };
type Campanha = {
  id: string;
  gatilho: string;
  descricao: string;
  total_candidatos: number;
  template_id: string | null;
  curso_id: string | null;
  candidatos: Candidato[];
};

const GATILHO_LABEL: Record<string, string> = {
  comece_curso: "Comece o curso",
  continue_curso: "Continue de onde parou",
  parabens: "Parabéns ao concluir",
  sumida: "Sumida (sem login)",
};

export function AutomacaoCampanhas() {
  const [campanhas, setCampanhas] = useState<Campanha[] | null>(null);
  const [templates, setTemplates] = useState<Template[]>([]);

  const carregar = useCallback(async () => {
    const r = await fetch("/api/admin/campanhas");
    const d = await r.json();
    setCampanhas(d.campanhas || []);
    setTemplates(d.templates || []);
  }, []);

  useEffect(() => {
    carregar();
  }, [carregar]);

  if (campanhas === null) {
    return <p className="text-sm text-mesa-500">Carregando…</p>;
  }

  return (
    <div className="space-y-5">
      <div className="rounded-xl border border-mesa-200 bg-mesa-50 p-4 text-sm text-mesa-600">
        🤖 Todo dia o sistema procura quem precisa de um empurrãozinho (não começou, parou,
        concluiu, sumiu) e <strong>sugere</strong> campanhas aqui. Nada é enviado sem você
        aprovar. Ao aprovar, as mensagens entram na fila (1/min).
      </div>

      {campanhas.length === 0 ? (
        <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-12 text-center">
          <p className="font-serif text-lg text-mesa-500">
            Nenhuma campanha sugerida no momento.
          </p>
          <p className="mt-1 text-sm text-mesa-400">
            A verificação roda diariamente — volte aqui depois.
          </p>
        </div>
      ) : (
        campanhas.map((c) => (
          <CampanhaCard key={c.id} campanha={c} templates={templates} onMudou={carregar} />
        ))
      )}
    </div>
  );
}

function CampanhaCard({
  campanha,
  templates,
  onMudou,
}: {
  campanha: Campanha;
  templates: Template[];
  onMudou: () => void;
}) {
  const [templateId, setTemplateId] = useState(campanha.template_id || "");
  const [excluidos, setExcluidos] = useState<Set<string>>(new Set());
  const [processando, setProcessando] = useState(false);
  const [msg, setMsg] = useState<string | null>(null);

  const incluidos = campanha.candidatos.filter((c) => !excluidos.has(c.aluno_id));
  const template = templates.find((t) => t.id === templateId);

  function toggle(alunoId: string) {
    setExcluidos((prev) => {
      const next = new Set(prev);
      if (next.has(alunoId)) next.delete(alunoId);
      else next.add(alunoId);
      return next;
    });
  }

  async function acao(tipo: "aprovar" | "descartar") {
    if (tipo === "aprovar" && !templateId) {
      setMsg("Selecione um template antes de aprovar.");
      return;
    }
    if (
      tipo === "aprovar" &&
      !confirm(`Aprovar e enviar para ${incluidos.length} pessoa(s)? Vão entrar na fila (1/min).`)
    ) {
      return;
    }
    setProcessando(true);
    setMsg(null);
    try {
      const r = await fetch("/api/admin/campanhas", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          acao: tipo,
          campanha_id: campanha.id,
          template_id: templateId || undefined,
          excluir_ids: Array.from(excluidos),
        }),
      });
      const d = await r.json();
      if (!r.ok) {
        setMsg(d.erro || "Erro.");
        setProcessando(false);
        return;
      }
      onMudou();
    } catch {
      setMsg("Erro de rede.");
      setProcessando(false);
    }
  }

  // Prévia do texto com o primeiro candidato
  const previa =
    template && incluidos[0]
      ? template.corpo
          .replace(/\{\{\s*nome\s*\}\}/gi, (incluidos[0].nome || "").split(/\s+/)[0] || "")
          .replace(/\{\{\s*curso\s*\}\}/gi, "")
          .replace(/\s{2,}/g, " ")
          .trim()
      : null;

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6">
      <div className="mb-3 flex flex-wrap items-center gap-2">
        <span className="rounded-full bg-laranja-100 px-2.5 py-0.5 text-xs font-medium text-laranja-700">
          {GATILHO_LABEL[campanha.gatilho] || campanha.gatilho}
        </span>
        <h3 className="font-serif text-lg font-semibold text-mesa-800">{campanha.descricao}</h3>
        <span className="text-sm text-mesa-500">· {incluidos.length} selecionado(s)</span>
      </div>

      <div className="mb-3">
        <label className="mb-1 block text-xs font-medium uppercase tracking-wide text-mesa-500">
          Mensagem (template)
        </label>
        <select
          value={templateId}
          onChange={(e) => setTemplateId(e.target.value)}
          className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
        >
          <option value="">Selecione um template…</option>
          {templates.map((t) => (
            <option key={t.id} value={t.id}>
              {t.titulo}
            </option>
          ))}
        </select>
        {previa && (
          <p className="mt-2 rounded-lg bg-mesa-50 px-3 py-2 text-xs italic text-mesa-600">
            Prévia: “{previa}”
          </p>
        )}
      </div>

      <details className="mb-3">
        <summary className="cursor-pointer text-sm font-medium text-mesa-700">
          Ver pessoas ({campanha.candidatos.length}) — desmarque quem não deve receber
        </summary>
        <ul className="mt-2 max-h-60 divide-y divide-mesa-100 overflow-y-auto rounded-lg border border-mesa-100">
          {campanha.candidatos.map((c) => (
            <li key={c.id} className="flex items-center gap-3 px-3 py-2 text-sm">
              <input
                type="checkbox"
                checked={!excluidos.has(c.aluno_id)}
                onChange={() => toggle(c.aluno_id)}
                className="h-4 w-4 rounded"
              />
              <span className="flex-1 text-mesa-800">{c.nome || c.telefone}</span>
              <span className="text-xs text-mesa-400">{c.motivo}</span>
            </li>
          ))}
        </ul>
      </details>

      <div className="flex flex-wrap items-center gap-3">
        <button
          type="button"
          onClick={() => acao("aprovar")}
          disabled={processando || incluidos.length === 0}
          className="rounded-full bg-oliveira-700 px-5 py-2 text-sm font-medium text-white hover:bg-oliveira-800 disabled:opacity-50"
        >
          {processando ? "Processando…" : `Aprovar e enviar (${incluidos.length})`}
        </button>
        <button
          type="button"
          onClick={() => acao("descartar")}
          disabled={processando}
          className="rounded-full border border-mesa-200 bg-white px-5 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-50 disabled:opacity-50"
        >
          Descartar
        </button>
        {msg && <span className="text-sm text-red-700">{msg}</span>}
      </div>
    </div>
  );
}
