"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import type { AgendaEvento } from "@/lib/agenda";

function inicioDoDia(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate());
}

function rotuloDia(iso: string): string {
  const d = inicioDoDia(new Date(iso));
  const hoje = inicioDoDia(new Date());
  const amanha = new Date(hoje);
  amanha.setDate(amanha.getDate() + 1);
  if (d.getTime() === hoje.getTime()) return "Hoje";
  if (d.getTime() === amanha.getTime()) return "Amanhã";
  return new Date(iso).toLocaleDateString("pt-BR", {
    weekday: "long",
    day: "2-digit",
    month: "long",
  });
}

function chaveDia(iso: string): string {
  const d = new Date(iso);
  return `${d.getFullYear()}-${d.getMonth()}-${d.getDate()}`;
}

function horaFmt(iso: string): string {
  return new Date(iso).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" });
}

export function AgendaPainel({ eventos }: { eventos: AgendaEvento[] }) {
  const router = useRouter();
  const [titulo, setTitulo] = useState("");
  const [diaTodo, setDiaTodo] = useState(false);
  const [quando, setQuando] = useState("");
  const [local, setLocal] = useState("");
  const [nota, setNota] = useState("");
  const [salvando, setSalvando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function adicionar(e: React.FormEvent) {
    e.preventDefault();
    setErro(null);
    if (!titulo.trim() || !quando) {
      setErro("Preencha o título e a data.");
      return;
    }
    const inicio = diaTodo
      ? new Date(`${quando}T00:00:00`).toISOString()
      : new Date(quando).toISOString();
    setSalvando(true);
    const res = await fetch("/api/admin/agenda", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        titulo: titulo.trim(),
        inicio,
        diaTodo,
        local: local.trim() || null,
        nota: nota.trim() || null,
      }),
    });
    setSalvando(false);
    if (!res.ok) {
      const j = await res.json().catch(() => ({}));
      setErro(j.erro || "Não consegui salvar.");
      return;
    }
    setTitulo("");
    setQuando("");
    setLocal("");
    setNota("");
    setDiaTodo(false);
    router.refresh();
  }

  async function remover(id: string) {
    await fetch("/api/admin/agenda", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id }),
    });
    router.refresh();
  }

  // Agrupa por dia, preservando a ordem cronológica já recebida.
  const grupos: { chave: string; rotulo: string; itens: AgendaEvento[] }[] = [];
  for (const ev of eventos) {
    const chave = chaveDia(ev.inicio);
    let g = grupos.find((x) => x.chave === chave);
    if (!g) {
      g = { chave, rotulo: rotuloDia(ev.inicio), itens: [] };
      grupos.push(g);
    }
    g.itens.push(ev);
  }

  return (
    <div className="grid gap-6 lg:grid-cols-[1fr_320px]">
      {/* Lista */}
      <div>
        {grupos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Nenhum compromisso nos próximos 45 dias.
            </p>
          </div>
        ) : (
          <div className="space-y-7">
            {grupos.map((g) => (
              <div key={g.chave}>
                <h2 className="mb-2 text-xs font-semibold uppercase tracking-[0.15em] text-laranja-600 first-letter:uppercase">
                  {g.rotulo}
                </h2>
                <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white">
                  <ul className="divide-y divide-mesa-100">
                    {g.itens.map((ev) => (
                      <li key={ev.id} className="flex items-start gap-4 px-5 py-3.5">
                        <div className="w-16 flex-none pt-0.5 text-sm font-semibold text-mesa-800">
                          {ev.diaTodo ? (
                            <span className="text-mesa-400">dia todo</span>
                          ) : (
                            horaFmt(ev.inicio)
                          )}
                        </div>
                        <div className="min-w-0 flex-1">
                          <p className="font-medium text-mesa-800">{ev.titulo}</p>
                          {ev.local && (
                            <p className="mt-0.5 text-xs text-mesa-500">📍 {ev.local}</p>
                          )}
                        </div>
                        <div className="flex flex-none items-center gap-2">
                          {ev.fonte === "google" ? (
                            <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs font-medium text-mesa-500">
                              Google
                            </span>
                          ) : (
                            <>
                              <span className="rounded-full bg-laranja-100 px-2 py-0.5 text-xs font-medium text-laranja-700">
                                Manual
                              </span>
                              <button
                                onClick={() => remover(ev.id)}
                                title="Excluir"
                                className="text-mesa-300 transition hover:text-laranja-600"
                              >
                                ✕
                              </button>
                            </>
                          )}
                        </div>
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Form adicionar */}
      <form
        onSubmit={adicionar}
        className="h-fit rounded-2xl border border-mesa-200 bg-white p-5 lg:sticky lg:top-6"
      >
        <p className="mb-4 font-serif text-lg font-semibold text-mesa-800">
          Adicionar compromisso
        </p>
        <label className="mb-3 block">
          <span className="mb-1 block text-xs font-medium text-mesa-600">Título</span>
          <input
            value={titulo}
            onChange={(e) => setTitulo(e.target.value)}
            placeholder="Ex.: Reunião de liderança"
            className="w-full rounded-lg border border-mesa-200 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
          />
        </label>

        <label className="mb-3 flex items-center gap-2 text-sm text-mesa-700">
          <input
            type="checkbox"
            checked={diaTodo}
            onChange={(e) => {
              setDiaTodo(e.target.checked);
              setQuando("");
            }}
          />
          Dia todo
        </label>

        <label className="mb-3 block">
          <span className="mb-1 block text-xs font-medium text-mesa-600">
            {diaTodo ? "Data" : "Data e hora"}
          </span>
          <input
            type={diaTodo ? "date" : "datetime-local"}
            value={quando}
            onChange={(e) => setQuando(e.target.value)}
            className="w-full rounded-lg border border-mesa-200 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
          />
        </label>

        <label className="mb-3 block">
          <span className="mb-1 block text-xs font-medium text-mesa-600">Local (opcional)</span>
          <input
            value={local}
            onChange={(e) => setLocal(e.target.value)}
            placeholder="Ex.: Sede Ekballo"
            className="w-full rounded-lg border border-mesa-200 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
          />
        </label>

        <label className="mb-4 block">
          <span className="mb-1 block text-xs font-medium text-mesa-600">Nota (opcional)</span>
          <textarea
            value={nota}
            onChange={(e) => setNota(e.target.value)}
            rows={2}
            className="w-full resize-none rounded-lg border border-mesa-200 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
          />
        </label>

        {erro && <p className="mb-3 text-sm text-laranja-600">{erro}</p>}

        <button
          type="submit"
          disabled={salvando}
          className="w-full rounded-full bg-laranja-500 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-laranja-600 disabled:opacity-60"
        >
          {salvando ? "Salvando…" : "Adicionar"}
        </button>
      </form>
    </div>
  );
}
