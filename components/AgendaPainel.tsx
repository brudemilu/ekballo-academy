"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import type { AgendaEvento } from "@/lib/agenda";

const MESES = [
  "janeiro", "fevereiro", "março", "abril", "maio", "junho",
  "julho", "agosto", "setembro", "outubro", "novembro", "dezembro",
];
const DIAS_SEM = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];

const pad = (n: number) => String(n).padStart(2, "0");
const ymd = (d: Date) => `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`;
const horaFmt = (iso: string) =>
  new Date(iso).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" });

function toInputValue(iso: string, diaTodo: boolean): string {
  const d = new Date(iso);
  const base = `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`;
  return diaTodo ? base : `${base}T${pad(d.getHours())}:${pad(d.getMinutes())}`;
}

function rotuloDia(iso: string): string {
  const d = new Date(iso);
  const dia = new Date(d.getFullYear(), d.getMonth(), d.getDate());
  const hoje = new Date();
  const h0 = new Date(hoje.getFullYear(), hoje.getMonth(), hoje.getDate());
  const amanha = new Date(h0);
  amanha.setDate(amanha.getDate() + 1);
  if (dia.getTime() === h0.getTime()) return "Hoje";
  if (dia.getTime() === amanha.getTime()) return "Amanhã";
  return d.toLocaleDateString("pt-BR", { weekday: "long", day: "2-digit", month: "long" });
}

// Cor por agenda: IMW Industrial = roxo; manual = terracota; demais por hash do
// nome (estável). Sem nome de agenda = cinza neutro.
type Cor = { bg: string; text: string };
const COR_CINZA: Cor = { bg: "#ECEAE7", text: "#6B6660" };
const COR_MANUAL: Cor = { bg: "#FBDDC0", text: "#88300B" };
const COR_ROXO: Cor = { bg: "#EDE9FE", text: "#6D28D9" };
const COR_LARANJA: Cor = { bg: "#FFEDD5", text: "#C2410C" };
const PALETA: Cor[] = [
  { bg: "#DBEAFE", text: "#1D4ED8" }, // azul
  { bg: "#DCFCE7", text: "#15803D" }, // verde
  { bg: "#FCE7F3", text: "#BE185D" }, // rosa
  { bg: "#CCFBF1", text: "#0F766E" }, // teal
  { bg: "#FEF3C7", text: "#B45309" }, // âmbar
  { bg: "#E0E7FF", text: "#4338CA" }, // índigo
  { bg: "#FFE1E6", text: "#BE123C" }, // rosé
];
function hashStr(s: string): number {
  let h = 0;
  for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) | 0;
  return Math.abs(h);
}
function corDoEvento(ev: AgendaEvento): Cor {
  if (ev.fonte === "manual") return COR_MANUAL;
  const nome = ev.agenda || "";
  if (!nome) return COR_CINZA;
  if (/imw\s*industrial/i.test(nome)) return COR_ROXO;
  // Agenda principal (e-mail do Bruno) = laranja.
  if (/brunosantospmb@gmail\.com/i.test(nome)) return COR_LARANJA;
  return PALETA[hashStr(nome) % PALETA.length];
}

export function AgendaPainel({ eventos }: { eventos: AgendaEvento[] }) {
  const router = useRouter();
  const hoje = new Date();
  const inicioHoje = new Date(hoje.getFullYear(), hoje.getMonth(), hoje.getDate());

  const [view, setView] = useState<"lista" | "calendario">("lista");
  const [mesRef, setMesRef] = useState(new Date(hoje.getFullYear(), hoje.getMonth(), 1));

  // ----- modal add/editar -----
  const [aberto, setAberto] = useState(false);
  const [editId, setEditId] = useState<string | null>(null);
  const [titulo, setTitulo] = useState("");
  const [diaTodo, setDiaTodo] = useState(false);
  const [quando, setQuando] = useState("");
  const [local, setLocal] = useState("");
  const [nota, setNota] = useState("");
  const [salvando, setSalvando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  const porDia = useMemo(() => {
    const m = new Map<string, AgendaEvento[]>();
    for (const ev of eventos) {
      const k = ymd(new Date(ev.inicio));
      const arr = m.get(k);
      if (arr) arr.push(ev);
      else m.set(k, [ev]);
    }
    return m;
  }, [eventos]);

  function abrirNovo(dia?: Date) {
    setEditId(null);
    setTitulo("");
    setDiaTodo(false);
    setQuando(dia ? `${ymd(dia)}T09:00` : "");
    setLocal("");
    setNota("");
    setErro(null);
    setAberto(true);
  }
  function abrirEdicao(ev: AgendaEvento) {
    if (ev.fonte !== "manual") return;
    setEditId(ev.id);
    setTitulo(ev.titulo);
    setDiaTodo(ev.diaTodo);
    setQuando(toInputValue(ev.inicio, ev.diaTodo));
    setLocal(ev.local ?? "");
    setNota(ev.nota ?? "");
    setErro(null);
    setAberto(true);
  }

  async function salvar(e: React.FormEvent) {
    e.preventDefault();
    setErro(null);
    if (!titulo.trim() || !quando) {
      setErro("Preencha o título e a data.");
      return;
    }
    const inicio = diaTodo
      ? new Date(`${quando}T00:00:00`).toISOString()
      : new Date(quando).toISOString();
    const payload = {
      titulo: titulo.trim(),
      inicio,
      diaTodo,
      local: local.trim() || null,
      nota: nota.trim() || null,
    };
    setSalvando(true);
    const res = await fetch("/api/admin/agenda", {
      method: editId ? "PATCH" : "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(editId ? { id: editId, ...payload } : payload),
    });
    setSalvando(false);
    if (!res.ok) {
      const j = await res.json().catch(() => ({}));
      setErro(j.erro || "Não consegui salvar.");
      return;
    }
    setAberto(false);
    router.refresh();
  }

  async function excluir() {
    if (!editId) return;
    setSalvando(true);
    await fetch("/api/admin/agenda", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id: editId }),
    });
    setSalvando(false);
    setAberto(false);
    router.refresh();
  }

  // ----- LISTA (próximos 45 dias) -----
  const limite = new Date(inicioHoje);
  limite.setDate(limite.getDate() + 45);
  const proximos = eventos.filter((ev) => {
    const d = new Date(ev.inicio);
    return d >= inicioHoje && d <= limite;
  });
  const grupos: { chave: string; rotulo: string; itens: AgendaEvento[] }[] = [];
  for (const ev of proximos) {
    const chave = ymd(new Date(ev.inicio));
    let g = grupos.find((x) => x.chave === chave);
    if (!g) {
      g = { chave, rotulo: rotuloDia(ev.inicio), itens: [] };
      grupos.push(g);
    }
    g.itens.push(ev);
  }

  // Agendas distintas presentes (pra legenda de cores).
  const agendas: { nome: string; cor: Cor }[] = [];
  const vistas = new Set<string>();
  for (const ev of eventos) {
    if (ev.fonte === "google" && ev.agenda && !vistas.has(ev.agenda)) {
      vistas.add(ev.agenda);
      agendas.push({ nome: ev.agenda, cor: corDoEvento(ev) });
    }
  }

  // ----- CALENDÁRIO (mês) -----
  const ano = mesRef.getFullYear();
  const mesIdx = mesRef.getMonth();
  const primeiroDiaSemana = new Date(ano, mesIdx, 1).getDay();
  const diasNoMes = new Date(ano, mesIdx + 1, 0).getDate();
  const celulas: (number | null)[] = [];
  for (let i = 0; i < primeiroDiaSemana; i++) celulas.push(null);
  for (let d = 1; d <= diasNoMes; d++) celulas.push(d);
  while (celulas.length % 7 !== 0) celulas.push(null);
  const minMes = new Date(hoje.getFullYear(), hoje.getMonth(), 1);
  const maxMes = new Date(hoje.getFullYear(), hoje.getMonth() + 11, 1);
  const podeVoltar = mesRef > minMes;
  const podeAvancar = mesRef < maxMes;

  return (
    <div>
      {/* Barra: abas + adicionar */}
      <div className="mb-5 flex items-center justify-between gap-3">
        <div className="inline-flex rounded-full bg-mesa-100 p-1">
          {(["lista", "calendario"] as const).map((v) => (
            <button
              key={v}
              onClick={() => setView(v)}
              className={`rounded-full px-4 py-1.5 text-sm font-medium transition ${
                view === v ? "bg-white text-mesa-800 shadow-sm" : "text-mesa-500 hover:text-mesa-700"
              }`}
            >
              {v === "lista" ? "Próximos" : "Calendário"}
            </button>
          ))}
        </div>
        <button
          onClick={() => abrirNovo()}
          className="rounded-full bg-laranja-500 px-4 py-2 text-sm font-semibold text-white transition hover:bg-laranja-600"
        >
          + Adicionar
        </button>
      </div>

      {/* ---------- LISTA ---------- */}
      {view === "lista" &&
        (grupos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Nenhum compromisso nos próximos 45 dias.
            </p>
          </div>
        ) : (
          <div className="space-y-7">
            {grupos.map((g) => (
              <div key={g.chave}>
                <h2 className="mb-2 text-xs font-semibold uppercase tracking-[0.15em] text-laranja-600">
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
                          {ev.local && <p className="mt-0.5 text-xs text-mesa-500">📍 {ev.local}</p>}
                          {ev.nota && <p className="mt-0.5 text-xs text-mesa-500">{ev.nota}</p>}
                        </div>
                        <div className="flex flex-none items-center gap-2">
                          {ev.fonte === "google" ? (
                            <span
                              className="max-w-[160px] truncate rounded-full px-2 py-0.5 text-xs font-medium"
                              style={{
                                backgroundColor: corDoEvento(ev).bg,
                                color: corDoEvento(ev).text,
                              }}
                            >
                              {ev.agenda || "Google"}
                            </span>
                          ) : (
                            <button
                              onClick={() => abrirEdicao(ev)}
                              className="rounded-full bg-laranja-100 px-2.5 py-0.5 text-xs font-medium text-laranja-700 transition hover:bg-laranja-200"
                            >
                              Editar
                            </button>
                          )}
                        </div>
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
            ))}
          </div>
        ))}

      {/* ---------- CALENDÁRIO ---------- */}
      {view === "calendario" && (
        <div className="rounded-2xl border border-mesa-200 bg-white p-4 sm:p-5">
          {/* navegação de mês */}
          <div className="mb-4 flex items-center justify-between">
            <button
              onClick={() => podeVoltar && setMesRef(new Date(ano, mesIdx - 1, 1))}
              disabled={!podeVoltar}
              className="rounded-full border border-mesa-200 px-3 py-1 text-mesa-700 transition hover:bg-mesa-50 disabled:opacity-30"
            >
              ‹
            </button>
            <p className="font-serif text-xl font-semibold capitalize text-mesa-800">
              {MESES[mesIdx]} {ano}
            </p>
            <button
              onClick={() => podeAvancar && setMesRef(new Date(ano, mesIdx + 1, 1))}
              disabled={!podeAvancar}
              className="rounded-full border border-mesa-200 px-3 py-1 text-mesa-700 transition hover:bg-mesa-50 disabled:opacity-30"
            >
              ›
            </button>
          </div>

          {/* legenda de cores por agenda */}
          {agendas.length > 0 && (
            <div className="mb-3 flex flex-wrap gap-x-4 gap-y-1.5">
              {agendas.map((a) => (
                <span key={a.nome} className="inline-flex items-center gap-1.5 text-xs text-mesa-600">
                  <span className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: a.cor.text }} />
                  {a.nome}
                </span>
              ))}
              <span className="inline-flex items-center gap-1.5 text-xs text-mesa-600">
                <span className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: COR_MANUAL.text }} />
                Manual
              </span>
            </div>
          )}

          {/* cabeçalho dos dias da semana */}
          <div className="grid grid-cols-7 gap-1 border-b border-mesa-100 pb-2 text-center text-xs font-semibold uppercase tracking-wider text-mesa-400">
            {DIAS_SEM.map((d) => (
              <div key={d}>{d}</div>
            ))}
          </div>

          {/* grade */}
          <div className="grid grid-cols-7 gap-1 pt-1">
            {celulas.map((dia, i) => {
              if (dia === null) return <div key={i} className="min-h-[88px] rounded-lg" />;
              const dataCel = new Date(ano, mesIdx, dia);
              const itens = porDia.get(ymd(dataCel)) || [];
              const ehHoje = ymd(dataCel) === ymd(hoje);
              return (
                <div
                  key={i}
                  onClick={() => abrirNovo(dataCel)}
                  className={`min-h-[88px] cursor-pointer rounded-lg border p-1.5 transition hover:border-laranja-300 ${
                    ehHoje ? "border-laranja-400 bg-laranja-50" : "border-mesa-100"
                  }`}
                >
                  <div
                    className={`mb-1 text-xs font-semibold ${
                      ehHoje ? "text-laranja-700" : "text-mesa-500"
                    }`}
                  >
                    {dia}
                  </div>
                  <div className="space-y-0.5">
                    {itens.slice(0, 3).map((ev) => (
                      <button
                        key={ev.id}
                        onClick={(e) => {
                          e.stopPropagation();
                          abrirEdicao(ev);
                        }}
                        title={ev.agenda ? `${ev.titulo} · ${ev.agenda}` : ev.titulo}
                        className="block w-full truncate rounded px-1 py-0.5 text-left text-[11px] leading-tight"
                        style={{
                          backgroundColor: corDoEvento(ev).bg,
                          color: corDoEvento(ev).text,
                        }}
                      >
                        {!ev.diaTodo && <span className="font-semibold">{horaFmt(ev.inicio)} </span>}
                        {ev.titulo}
                      </button>
                    ))}
                    {itens.length > 3 && (
                      <div className="px-1 text-[11px] text-mesa-400">+{itens.length - 3} mais</div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
          <p className="mt-3 text-xs text-mesa-400">
            Toque num dia pra adicionar, ou num compromisso manual pra editar.
          </p>
        </div>
      )}

      {/* ---------- MODAL add/editar ---------- */}
      {aberto && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4"
          onClick={() => setAberto(false)}
        >
          <form
            onClick={(e) => e.stopPropagation()}
            onSubmit={salvar}
            className="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl"
          >
            <p className="mb-4 font-serif text-lg font-semibold text-mesa-800">
              {editId ? "Editar compromisso" : "Novo compromisso"}
            </p>

            <label className="mb-3 block">
              <span className="mb-1 block text-xs font-medium text-mesa-600">Título</span>
              <input
                value={titulo}
                onChange={(e) => setTitulo(e.target.value)}
                placeholder="Ex.: Reunião de liderança"
                autoFocus
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

            <div className="flex items-center justify-between gap-3">
              {editId ? (
                <button
                  type="button"
                  onClick={excluir}
                  disabled={salvando}
                  className="text-sm font-medium text-mesa-400 transition hover:text-laranja-600 disabled:opacity-50"
                >
                  Excluir
                </button>
              ) : (
                <span />
              )}
              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={() => setAberto(false)}
                  className="rounded-full px-4 py-2 text-sm font-medium text-mesa-600 hover:bg-mesa-100"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={salvando}
                  className="rounded-full bg-laranja-500 px-5 py-2 text-sm font-semibold text-white transition hover:bg-laranja-600 disabled:opacity-60"
                >
                  {salvando ? "Salvando…" : editId ? "Salvar" : "Adicionar"}
                </button>
              </div>
            </div>
          </form>
        </div>
      )}
    </div>
  );
}
