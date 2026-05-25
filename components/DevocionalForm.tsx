"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";

type Inicial = {
  id: string | null;
  data: string;
  titulo: string;
  versiculo_ref: string;
  versiculo_texto: string;
  versiculo_versao: string;
  reflexao: string;
  autor: string;
  publicado: boolean;
};

export function DevocionalForm({ inicial }: { inicial: Inicial }) {
  const router = useRouter();
  const [form, setForm] = useState(inicial);
  const [pending, startTransition] = useTransition();
  const [erro, setErro] = useState<string | null>(null);
  const [ok, setOk] = useState<string | null>(null);

  function salvar() {
    setErro(null);
    setOk(null);
    if (!form.versiculo_ref.trim() || !form.versiculo_texto.trim() || !form.reflexao.trim()) {
      setErro("Preencha referência, texto do versículo e reflexão.");
      return;
    }
    startTransition(async () => {
      try {
        const resp = await fetch("/api/admin/devocional", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            id: form.id || undefined,
            data: form.data,
            titulo: form.titulo || null,
            versiculo_ref: form.versiculo_ref,
            versiculo_texto: form.versiculo_texto,
            versiculo_versao: form.versiculo_versao,
            reflexao: form.reflexao,
            autor: form.autor || null,
            publicado: form.publicado,
          }),
        });
        const j = await resp.json();
        if (!resp.ok) throw new Error(j.erro || `HTTP ${resp.status}`);
        const pushInfo = j.push
          ? ` · ${j.push.enviados} push enviado${j.push.enviados === 1 ? "" : "s"}`
          : "";
        setOk(`✓ Devocional salvo${pushInfo}.`);
        if (!form.id && j.id) {
          // criou novo → leva pra edição
          setForm({ ...form, id: j.id });
          router.push(`/admin/devocionais/${j.id}`);
        } else {
          router.refresh();
        }
      } catch (e) {
        setErro(e instanceof Error ? e.message : String(e));
      }
    });
  }

  function excluir() {
    if (!form.id) return;
    if (!confirm("Apagar este devocional? Não dá pra desfazer.")) return;
    startTransition(async () => {
      try {
        const resp = await fetch(`/api/admin/devocional?id=${form.id}`, {
          method: "DELETE",
        });
        if (!resp.ok) throw new Error(`HTTP ${resp.status}`);
        router.push("/admin/devocionais");
      } catch (e) {
        setErro(e instanceof Error ? e.message : String(e));
      }
    });
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <div className="space-y-5">
        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className="mb-1.5 block text-sm font-medium text-mesa-700">
              Data
            </label>
            <input
              type="date"
              value={form.data}
              onChange={(e) => setForm({ ...form, data: e.target.value })}
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
            />
          </div>
          <div>
            <label className="mb-1.5 block text-sm font-medium text-mesa-700">
              Autor (opcional)
            </label>
            <input
              type="text"
              value={form.autor}
              onChange={(e) => setForm({ ...form, autor: e.target.value })}
              placeholder="Pr. Bruno"
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
            />
          </div>
        </div>

        <div>
          <label className="mb-1.5 block text-sm font-medium text-mesa-700">
            Título (opcional)
          </label>
          <input
            type="text"
            value={form.titulo}
            onChange={(e) => setForm({ ...form, titulo: e.target.value })}
            placeholder='Ex.: "Pra começar o dia"'
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
          />
        </div>

        <div className="grid gap-4 sm:grid-cols-[1fr_140px]">
          <div>
            <label className="mb-1.5 block text-sm font-medium text-mesa-700">
              Referência do versículo
            </label>
            <input
              type="text"
              value={form.versiculo_ref}
              onChange={(e) => setForm({ ...form, versiculo_ref: e.target.value })}
              placeholder="Ex.: Romanos 8:28"
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
            />
          </div>
          <div>
            <label className="mb-1.5 block text-sm font-medium text-mesa-700">
              Versão
            </label>
            <select
              value={form.versiculo_versao}
              onChange={(e) =>
                setForm({ ...form, versiculo_versao: e.target.value })
              }
              className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
            >
              {["ACF", "NAA", "NVT", "NVI", "ARA", "ARC"].map((v) => (
                <option key={v} value={v}>
                  {v}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div>
          <label className="mb-1.5 block text-sm font-medium text-mesa-700">
            Texto do versículo
          </label>
          <textarea
            value={form.versiculo_texto}
            onChange={(e) => setForm({ ...form, versiculo_texto: e.target.value })}
            rows={3}
            placeholder="Cole o texto do versículo aqui."
            className="w-full resize-y rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-3 italic text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
          />
        </div>

        <div>
          <label className="mb-1.5 block text-sm font-medium text-mesa-700">
            Reflexão pastoral
          </label>
          <textarea
            value={form.reflexao}
            onChange={(e) => setForm({ ...form, reflexao: e.target.value })}
            rows={8}
            placeholder="Escreva uma reflexão curta. Separe parágrafos com linha em branco."
            className="w-full resize-y rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-3 text-mesa-800 focus:border-mesa-400 focus:bg-white focus:outline-none focus:ring-2 focus:ring-mesa-200"
          />
          <p className="mt-1 text-xs text-mesa-500">
            Dois enters seguidos viram novo parágrafo. Sem formatação especial.
          </p>
        </div>

        <label className="flex cursor-pointer items-center gap-2 text-sm text-mesa-700">
          <input
            type="checkbox"
            checked={form.publicado}
            onChange={(e) => setForm({ ...form, publicado: e.target.checked })}
            className="h-4 w-4 rounded border-mesa-300"
          />
          Publicado (visível pros alunos)
        </label>
      </div>

      {erro && (
        <p className="mt-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {erro}
        </p>
      )}
      {ok && (
        <p className="mt-4 rounded-lg border border-oliveira-200 bg-oliveira-50 px-4 py-3 text-sm text-oliveira-700">
          {ok}
        </p>
      )}

      <div className="mt-6 flex flex-wrap items-center justify-between gap-3 border-t border-mesa-100 pt-5">
        {form.id ? (
          <button
            onClick={excluir}
            disabled={pending}
            className="rounded-full border border-red-200 bg-white px-4 py-2 text-sm font-medium text-red-700 hover:bg-red-50 disabled:opacity-50"
          >
            Excluir
          </button>
        ) : (
          <span />
        )}
        <button
          onClick={salvar}
          disabled={pending}
          className="rounded-full bg-mesa-700 px-6 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:opacity-50"
        >
          {pending
            ? "Salvando…"
            : form.id
              ? "Atualizar devocional"
              : "Publicar devocional"}
        </button>
      </div>
    </div>
  );
}
