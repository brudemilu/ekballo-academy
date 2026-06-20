"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import type { DashboardData } from "@/lib/db";

type Periodo = "30d" | "90d" | "12m" | "tudo";

const PERIODOS: { v: Periodo; label: string }[] = [
  { v: "30d", label: "30 dias" },
  { v: "90d", label: "90 dias" },
  { v: "12m", label: "12 meses" },
  { v: "tudo", label: "Tudo" },
];

const fmt = (n: number) => n.toLocaleString("pt-BR");
const MESES = ["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"];

function cutoff(p: Periodo): number {
  if (p === "tudo") return 0;
  const d = new Date();
  if (p === "30d") d.setDate(d.getDate() - 30);
  else if (p === "90d") d.setDate(d.getDate() - 90);
  else d.setMonth(d.getMonth() - 12);
  return d.getTime();
}

// buckets de tempo (semana p/ 30/90d, mês p/ 12m/tudo)
function buckets(p: Periodo, datas: number[]): { label: string; ini: number; fim: number }[] {
  const agora = Date.now();
  const out: { label: string; ini: number; fim: number }[] = [];
  if (p === "30d" || p === "90d") {
    const semanas = p === "30d" ? 5 : 13;
    for (let i = semanas - 1; i >= 0; i--) {
      const fim = agora - i * 7 * 864e5;
      const ini = fim - 7 * 864e5;
      const d = new Date(fim);
      out.push({ label: `${String(d.getDate()).padStart(2, "0")}/${MESES[d.getMonth()]}`, ini, fim });
    }
  } else {
    const meses = p === "12m" ? 12 : Math.max(6, Math.min(24, mesesDesde(datas)));
    const base = new Date();
    base.setDate(1);
    for (let i = meses - 1; i >= 0; i--) {
      const d = new Date(base.getFullYear(), base.getMonth() - i, 1);
      const ini = d.getTime();
      const fim = new Date(d.getFullYear(), d.getMonth() + 1, 1).getTime();
      out.push({ label: `${MESES[d.getMonth()]}/${String(d.getFullYear()).slice(2)}`, ini, fim });
    }
  }
  return out;
}
function mesesDesde(datas: number[]): number {
  const min = datas.filter(Boolean).reduce((a, b) => Math.min(a, b), Date.now());
  return Math.ceil((Date.now() - min) / (30 * 864e5)) + 1;
}

export function DashboardEngajamento({ data }: { data: DashboardData }) {
  const [cursoSlug, setCursoSlug] = useState<string>("todos");
  const [turma, setTurma] = useState<string>("todos");
  const [periodo, setPeriodo] = useState<Periodo>("90d");

  const cursoId = useMemo(
    () => data.cursos.find((c) => c.slug === cursoSlug)?.id ?? null,
    [cursoSlug, data.cursos]
  );

  const m = useMemo(() => {
    const corte = cutoff(periodo);
    const noPeriodo = (iso: string | null) => !!iso && new Date(iso).getTime() >= corte;
    const turmaDoAluno = new Map(data.alunos.map((a) => [a.id, a.turma]));
    const naTurma = (alunoId: string) => turma === "todos" || turmaDoAluno.get(alunoId) === turma;
    const noCurso = (cid: string | null) => !cursoId || cid === cursoId;

    // discípulos do filtro (turma) — e, se um curso está selecionado, os matriculados nele
    let alunosFiltro = data.alunos.filter((a) => naTurma(a.id));
    if (cursoId) {
      const ids = new Set(data.matriculas.filter((x) => x.curso_id === cursoId).map((x) => x.aluno_id));
      alunosFiltro = alunosFiltro.filter((a) => ids.has(a.id));
    }
    const idsAtivos = new Set(
      data.respostas.filter((r) => naTurma(r.aluno_id) && noCurso(r.curso_id)).map((r) => r.aluno_id)
    );

    const mats = data.matriculas.filter((x) => naTurma(x.aluno_id) && noCurso(x.curso_id));
    const matsP = mats.filter((x) => noPeriodo(x.matriculado_em));
    const conclP = mats.filter((x) => noPeriodo(x.concluido_em));
    const resps = data.respostas.filter((r) => naTurma(r.aluno_id) && noCurso(r.curso_id));
    const respsP = resps.filter((r) => noPeriodo(r.created_at));
    const mesasP = data.mesas.filter((p) => naTurma(p.aluno_id) && noCurso(p.curso_id) && noPeriodo(p.concluido_em));
    const pendentes = resps.filter((r) => !r.comentado).length;
    const ativos = alunosFiltro.filter((a) => idsAtivos.has(a.id)).length;

    // série temporal: matrículas x reflexões
    const todasDatas = [...mats.map((x) => new Date(x.matriculado_em || 0).getTime()), ...resps.map((r) => new Date(r.created_at).getTime())];
    const bks = buckets(periodo, todasDatas);
    const serie = bks.map((b) => ({
      label: b.label,
      matriculas: matsP.filter((x) => { const t = new Date(x.matriculado_em || 0).getTime(); return t >= b.ini && t < b.fim; }).length,
      reflexoes: respsP.filter((r) => { const t = new Date(r.created_at).getTime(); return t >= b.ini && t < b.fim; }).length,
    }));

    // por temática (reflexões no período) — só quando curso = todos
    const porCurso = data.cursos
      .map((c) => ({ titulo: c.titulo, valor: respsP.filter((r) => r.curso_id === c.id).length, mats: matsP.filter((x) => x.curso_id === c.id).length }))
      .filter((x) => x.valor > 0 || x.mats > 0)
      .sort((a, b) => b.valor + b.mats - (a.valor + a.mats))
      .slice(0, 7);

    // por turma (discípulos) — só quando turma = todos
    const porTurma = data.turmas
      .map((t) => ({ nome: t, valor: alunosFiltro.filter((a) => turmaDoAluno.get(a.id) === t).length }))
      .filter((x) => x.valor > 0);
    const semTurma = alunosFiltro.filter((a) => !a.turma).length;
    if (semTurma) porTurma.push({ nome: "Sem turma", valor: semTurma });

    return {
      discipulos: alunosFiltro.length, ativos, matriculas: matsP.length, conclusoes: conclP.length,
      mesas: mesasP.length, reflexoes: respsP.length, pendentes, serie, porCurso, porTurma,
    };
  }, [data, cursoId, turma, periodo]);

  return (
    <div className="space-y-6">
      {/* filtros */}
      <div className="flex flex-wrap items-end gap-3 rounded-2xl border border-mesa-200 bg-white p-4">
        <Campo label="Temática">
          <select value={cursoSlug} onChange={(e) => setCursoSlug(e.target.value)} className={selectCls}>
            <option value="todos">Todas as temáticas</option>
            {data.cursos.map((c) => (<option key={c.id} value={c.slug}>{c.titulo}</option>))}
          </select>
        </Campo>
        <Campo label="Turma">
          <select value={turma} onChange={(e) => setTurma(e.target.value)} className={selectCls}>
            <option value="todos">Todas as turmas</option>
            {data.turmas.map((t) => (<option key={t} value={t}>{t}</option>))}
          </select>
        </Campo>
        <Campo label="Período">
          <div className="flex overflow-hidden rounded-lg border border-mesa-200">
            {PERIODOS.map((p) => (
              <button key={p.v} onClick={() => setPeriodo(p.v)}
                className={`px-3 py-2 text-xs font-medium transition ${periodo === p.v ? "bg-mesa-700 text-mesa-50" : "bg-white text-mesa-600 hover:bg-mesa-50"}`}>
                {p.label}
              </button>
            ))}
          </div>
        </Campo>
      </div>

      {/* KPIs (cards clicáveis) */}
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-6">
        <Kpi label="Discípulos" valor={m.discipulos} sub={`${m.ativos} ativos`} href="/admin/alunos" cor="mesa" />
        <Kpi label="Matrículas" valor={m.matriculas} sub="no período" href="/admin/cursos" cor="oliveira" />
        <Kpi label="Conclusões" valor={m.conclusoes} sub="de temática" href="/admin/cursos" cor="oliveira" />
        <Kpi label="Mesas concluídas" valor={m.mesas} sub="no período" href="/admin/cursos" cor="oliveira" />
        <Kpi label="Reflexões" valor={m.reflexoes} sub="enviadas" href="/admin/respostas" cor="laranja" />
        <Kpi label="Devolutivas" valor={m.pendentes} sub="pendentes" href="/admin/respostas?status=pendentes" cor={m.pendentes > 0 ? "alerta" : "mesa"} />
      </div>

      {/* gráfico temporal */}
      <Painel titulo="Atividade ao longo do tempo" hint="matrículas e reflexões por período">
        <LinhaTempo serie={m.serie} />
      </Painel>

      <div className="grid gap-4 lg:grid-cols-2">
        {cursoSlug === "todos" && (
          <Painel titulo="Engajamento por temática" hint="reflexões + matrículas no período">
            <BarrasH itens={m.porCurso.map((c) => ({ nome: c.titulo, valor: c.valor + c.mats }))} />
          </Painel>
        )}
        {turma === "todos" && (
          <Painel titulo="Discípulos por turma" hint="distribuição atual">
            <Rosca itens={m.porTurma} />
          </Painel>
        )}
      </div>
    </div>
  );
}

// ---------- subcomponentes ----------
const selectCls = "rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400";

function Campo({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <label className="flex flex-col gap-1">
      <span className="text-[11px] font-medium uppercase tracking-wide text-mesa-500">{label}</span>
      {children}
    </label>
  );
}

const CORES_KPI: Record<string, string> = {
  mesa: "border-mesa-200 hover:border-mesa-300",
  oliveira: "border-oliveira-200 hover:border-oliveira-300",
  laranja: "border-laranja-200 hover:border-laranja-300",
  alerta: "border-red-300 bg-red-50 hover:border-red-400",
};

function Kpi({ label, valor, sub, href, cor }: { label: string; valor: number; sub: string; href: string; cor: string }) {
  return (
    <Link href={href} className={`group rounded-2xl border bg-white p-4 transition ${CORES_KPI[cor] ?? CORES_KPI.mesa}`}>
      <p className="text-[11px] font-medium uppercase tracking-wide text-mesa-500">{label}</p>
      <p className="mt-1 font-serif text-3xl font-semibold text-mesa-800">{fmt(valor)}</p>
      <p className="text-xs text-mesa-500">{sub} <span className="opacity-0 transition group-hover:opacity-100">→</span></p>
    </Link>
  );
}

function Painel({ titulo, hint, children }: { titulo: string; hint?: string; children: React.ReactNode }) {
  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-5">
      <div className="mb-4">
        <h3 className="font-serif text-lg font-semibold text-mesa-800">{titulo}</h3>
        {hint && <p className="text-xs text-mesa-500">{hint}</p>}
      </div>
      {children}
    </div>
  );
}

function LinhaTempo({ serie }: { serie: { label: string; matriculas: number; reflexoes: number }[] }) {
  const W = 720, H = 200, pad = 28;
  const max = Math.max(1, ...serie.map((s) => Math.max(s.matriculas, s.reflexoes)));
  const x = (i: number) => pad + (i * (W - 2 * pad)) / Math.max(1, serie.length - 1);
  const y = (v: number) => H - pad - (v * (H - 2 * pad)) / max;
  const linha = (key: "matriculas" | "reflexoes") => serie.map((s, i) => `${i === 0 ? "M" : "L"}${x(i).toFixed(1)},${y(s[key]).toFixed(1)}`).join(" ");
  const area = `${linha("reflexoes")} L${x(serie.length - 1).toFixed(1)},${H - pad} L${x(0).toFixed(1)},${H - pad} Z`;
  if (serie.every((s) => s.matriculas === 0 && s.reflexoes === 0))
    return <p className="py-8 text-center text-sm text-mesa-400">Sem atividade no período.</p>;
  return (
    <div>
      <svg viewBox={`0 0 ${W} ${H}`} className="w-full" preserveAspectRatio="none" style={{ height: 200 }}>
        {[0, 0.5, 1].map((f) => (<line key={f} x1={pad} x2={W - pad} y1={y(max * f)} y2={y(max * f)} stroke="#e7e3dd" strokeWidth="1" />))}
        <path d={area} className="fill-laranja-100" />
        <path d={linha("reflexoes")} fill="none" className="stroke-laranja-500" strokeWidth="2.5" strokeLinejoin="round" />
        <path d={linha("matriculas")} fill="none" className="stroke-oliveira-600" strokeWidth="2.5" strokeLinejoin="round" />
        {serie.map((s, i) => (<g key={i}>
          <circle cx={x(i)} cy={y(s.reflexoes)} r="2.5" className="fill-laranja-500" />
          <circle cx={x(i)} cy={y(s.matriculas)} r="2.5" className="fill-oliveira-600" />
        </g>))}
      </svg>
      <div className="mt-1 flex justify-between px-2 text-[10px] text-mesa-400">
        {serie.map((s, i) => (i % Math.ceil(serie.length / 6) === 0 ? <span key={i}>{s.label}</span> : <span key={i} />))}
      </div>
      <div className="mt-3 flex gap-4 text-xs text-mesa-600">
        <span className="flex items-center gap-1.5"><i className="h-2 w-3 rounded bg-laranja-500" />Reflexões</span>
        <span className="flex items-center gap-1.5"><i className="h-2 w-3 rounded bg-oliveira-600" />Matrículas</span>
      </div>
    </div>
  );
}

function BarrasH({ itens }: { itens: { nome: string; valor: number }[] }) {
  if (!itens.length) return <p className="py-6 text-center text-sm text-mesa-400">Sem dados no período.</p>;
  const max = Math.max(1, ...itens.map((i) => i.valor));
  return (
    <div className="space-y-2.5">
      {itens.map((i) => (
        <div key={i.nome} className="flex items-center gap-3">
          <span className="w-36 shrink-0 truncate text-sm text-mesa-700" title={i.nome}>{i.nome}</span>
          <div className="h-5 flex-1 overflow-hidden rounded bg-mesa-100">
            <div className="h-full rounded bg-oliveira-500" style={{ width: `${(i.valor / max) * 100}%` }} />
          </div>
          <span className="w-8 shrink-0 text-right text-sm font-medium text-mesa-600">{fmt(i.valor)}</span>
        </div>
      ))}
    </div>
  );
}

function Rosca({ itens }: { itens: { nome: string; valor: number }[] }) {
  const total = itens.reduce((a, b) => a + b.valor, 0);
  if (!total) return <p className="py-6 text-center text-sm text-mesa-400">Sem discípulos no filtro.</p>;
  const CORES = ["#5b6b4f", "#c2682f", "#8a9a7b", "#d99a5b", "#6b5b4f", "#a8b89a", "#3f4a35"];
  let acc = 0;
  const R = 60, C = 2 * Math.PI * R;
  return (
    <div className="flex flex-wrap items-center gap-6">
      <svg viewBox="0 0 160 160" style={{ width: 150, height: 150 }}>
        <g transform="translate(80,80) rotate(-90)">
          {itens.map((i, k) => {
            const frac = i.valor / total;
            const el = <circle key={k} r={R} fill="none" stroke={CORES[k % CORES.length]} strokeWidth="26"
              strokeDasharray={`${(frac * C).toFixed(2)} ${C.toFixed(2)}`} strokeDashoffset={(-acc * C).toFixed(2)} />;
            acc += frac;
            return el;
          })}
        </g>
        <text x="80" y="76" textAnchor="middle" className="fill-mesa-800 font-serif" fontSize="26" fontWeight="600">{fmt(total)}</text>
        <text x="80" y="94" textAnchor="middle" className="fill-mesa-500" fontSize="10">discípulos</text>
      </svg>
      <div className="space-y-1.5">
        {itens.map((i, k) => (
          <div key={i.nome} className="flex items-center gap-2 text-sm text-mesa-700">
            <i className="h-3 w-3 rounded-sm" style={{ background: CORES[k % CORES.length] }} />
            <span className="w-24 truncate">{i.nome}</span>
            <span className="font-medium text-mesa-600">{fmt(i.valor)}</span>
          </div>
        ))}
      </div>
    </div>
  );
}
