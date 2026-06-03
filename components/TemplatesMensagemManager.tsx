"use client";

import { useState } from "react";

type Template = {
  id: string;
  titulo: string;
  corpo: string;
  descricao: string | null;
  ativo?: boolean;
};

export function TemplatesMensagemManager({ inicial }: { inicial: Template[] }) {
  const [templates, setTemplates] = useState<Template[]>(inicial);
  const [editId, setEditId] = useState<string | null>(null);
  const [titulo, setTitulo] = useState("");
  const [corpo, setCorpo] = useState("");
  const [descricao, setDescricao] = useState("");
  const [salvando, setSalvando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function recarregar() {
    const r = await fetch("/api/admin/templates-mensagem");
    const d = await r.json();
    if (r.ok) setTemplates(d.templates || []);
  }

  function limpar() {
    setEditId(null);
    setTitulo("");
    setCorpo("");
    setDescricao("");
    setErro(null);
  }

  function editar(t: Template) {
    setEditId(t.id);
    setTitulo(t.titulo);
    setCorpo(t.corpo);
    setDescricao(t.descricao || "");
    setErro(null);
  }

  async function salvar() {
    setErro(null);
    if (!titulo.trim() || !corpo.trim()) {
      setErro("Preencha título e mensagem.");
      return;
    }
    setSalvando(true);
    try {
      const metodo = editId ? "PATCH" : "POST";
      const body = editId
        ? { id: editId, titulo, corpo, descricao }
        : { titulo, corpo, descricao };
      const r = await fetch("/api/admin/templates-mensagem", {
        method: metodo,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });
      const d = await r.json();
      if (!r.ok) {
        setErro(d.erro || "Erro ao salvar.");
        return;
      }
      limpar();
      await recarregar();
    } finally {
      setSalvando(false);
    }
  }

  async function excluir(id: string) {
    if (!confirm("Excluir este template?")) return;
    const r = await fetch("/api/admin/templates-mensagem", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id }),
    });
    if (r.ok) {
      if (editId === id) limpar();
      await recarregar();
    }
  }

  const inputCls =
    "w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200";

  return (
    <div className="space-y-5">
      <div className="rounded-2xl border border-mesa-200 bg-white p-6">
        <h3 className="mb-3 font-serif text-lg font-semibold text-mesa-800">
          {editId ? "Editar template" : "Novo template"}
        </h3>
        <div className="space-y-3">
          <input
            value={titulo}
            onChange={(e) => setTitulo(e.target.value)}
            placeholder="Título (ex.: Lembrete: 3 dias sem acessar)"
            className={inputCls}
          />
          <textarea
            value={corpo}
            onChange={(e) => setCorpo(e.target.value)}
            rows={4}
            placeholder="Mensagem… use {{nome}} e {{curso}} para personalizar."
            className={inputCls}
          />
          <input
            value={descricao}
            onChange={(e) => setDescricao(e.target.value)}
            placeholder="Descrição interna (opcional)"
            className={inputCls}
          />
          {erro && <p className="text-sm text-red-700">{erro}</p>}
          <div className="flex gap-2">
            <button
              type="button"
              onClick={salvar}
              disabled={salvando}
              className="rounded-full bg-mesa-700 px-5 py-2 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:opacity-50"
            >
              {salvando ? "Salvando…" : editId ? "Salvar alterações" : "Criar template"}
            </button>
            {editId && (
              <button
                type="button"
                onClick={limpar}
                className="rounded-full border border-mesa-200 bg-white px-5 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-50"
              >
                Cancelar
              </button>
            )}
          </div>
        </div>
      </div>

      {templates.length > 0 && (
        <ul className="space-y-2">
          {templates.map((t) => (
            <li
              key={t.id}
              className="flex items-start justify-between gap-3 rounded-xl border border-mesa-200 bg-white p-4"
            >
              <div className="min-w-0 flex-1">
                <p className="font-medium text-mesa-800">{t.titulo}</p>
                <p className="mt-0.5 line-clamp-2 text-sm text-mesa-600">{t.corpo}</p>
              </div>
              <div className="flex flex-none gap-2">
                <button
                  type="button"
                  onClick={() => editar(t)}
                  className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                >
                  Editar
                </button>
                <button
                  type="button"
                  onClick={() => excluir(t.id)}
                  className="rounded-full border border-red-200 bg-white px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50"
                >
                  Excluir
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
