"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

type Item = {
  id: string;
  status: string;
  legenda: string;
  agendado_para?: string | null;
  slides?: unknown[];
  criado_em?: string;
};

function badge(it: Item) {
  if (it.status === "agendado") {
    const quando = it.agendado_para ? new Date(it.agendado_para).toLocaleString("pt-BR", { dateStyle: "short", timeStyle: "short" }) : "";
    return { txt: `🗓️ Agendado · ${quando}`, cls: "bg-blue-50 text-blue-700 border-blue-200" };
  }
  if (it.status === "publicado") return { txt: "✅ Publicado", cls: "bg-oliveira-50 text-oliveira-700 border-oliveira-200" };
  if (it.status === "erro") return { txt: "⚠️ Erro ao publicar", cls: "bg-red-50 text-red-700 border-red-200" };
  return { txt: "📝 Rascunho", cls: "bg-mesa-100 text-mesa-600 border-mesa-200" };
}

export function ListaCarrosseisInstagram({ itens }: { itens: Item[] }) {
  const router = useRouter();
  const [lista, setLista] = useState(itens);
  const [excluindo, setExcluindo] = useState<string | null>(null);
  const [publicandoId, setPublicandoId] = useState<string | null>(null);

  async function publicar(it: Item) {
    if (!window.confirm("Publicar AGORA no Instagram? Vai ao ar de verdade no perfil.")) return;
    setPublicandoId(it.id);
    try {
      const res = await fetch("/api/admin/instagram/publicar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: it.id }),
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(d?.error || "Falha");
      setLista((prev) => prev.map((x) => (x.id === it.id ? { ...x, status: "publicado" } : x)));
      router.refresh();
      alert("Publicado no Instagram ✓");
    } catch (e) {
      alert("Não consegui publicar: " + (e instanceof Error ? e.message : "erro"));
      router.refresh();
    } finally {
      setPublicandoId(null);
    }
  }

  async function excluir(it: Item) {
    const oque = it.status === "agendado" ? "cancelar este agendamento" : "excluir este item";
    if (!window.confirm(`Tem certeza que quer ${oque}?`)) return;
    setExcluindo(it.id);
    try {
      const res = await fetch(`/api/admin/instagram?id=${it.id}`, { method: "DELETE" });
      if (!res.ok) {
        const d = await res.json().catch(() => ({}));
        throw new Error(d?.error || "Falha");
      }
      setLista((prev) => prev.filter((x) => x.id !== it.id));
      router.refresh();
    } catch {
      alert("Não consegui excluir. Tente de novo.");
    } finally {
      setExcluindo(null);
    }
  }

  if (!lista.length) {
    return (
      <div className="rounded-2xl border border-dashed border-mesa-200 bg-mesa-50 p-6 text-center text-sm text-mesa-500">
        Nada agendado ou salvo ainda. O que você agendar aparece aqui.
      </div>
    );
  }

  return (
    <div className="space-y-3">
      {lista.map((it) => {
        const b = badge(it);
        const n = Array.isArray(it.slides) ? it.slides.length : 0;
        return (
          <div key={it.id} className="flex items-center gap-4 rounded-2xl border border-mesa-200 bg-white p-4">
            <div className="flex-1">
              <span className={`inline-block rounded-full border px-3 py-1 text-xs font-medium ${b.cls}`}>{b.txt}</span>
              <p className="mt-2 line-clamp-2 text-sm text-mesa-700">{it.legenda || "(sem legenda)"}</p>
              <p className="mt-1 text-xs text-mesa-400">{n} {n === 1 ? "imagem" : "imagens"}</p>
            </div>
            {(it.status === "agendado" || it.status === "erro") && (
              <button
                onClick={() => publicar(it)}
                disabled={publicandoId === it.id}
                className="shrink-0 rounded-lg bg-gradient-to-r from-pink-600 to-purple-600 px-3 py-2 text-sm font-semibold text-white transition hover:opacity-90 disabled:opacity-50"
              >
                {publicandoId === it.id ? "Publicando…" : "📲 Publicar agora"}
              </button>
            )}
            <button
              onClick={() => excluir(it)}
              disabled={excluindo === it.id}
              className="shrink-0 rounded-lg border border-mesa-200 px-3 py-2 text-sm text-red-500 transition hover:bg-red-50 disabled:opacity-40"
            >
              {excluindo === it.id ? "…" : it.status === "agendado" ? "Cancelar" : "Excluir"}
            </button>
          </div>
        );
      })}
    </div>
  );
}
