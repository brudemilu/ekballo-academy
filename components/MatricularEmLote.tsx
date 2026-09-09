"use client";

import { useRouter } from "next/navigation";
import { useMemo, useState } from "react";
import { displayTelefone } from "@/lib/telefone";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export type AlunoParaLote = {
  id: string;
  nome: string | null;
  email: string;
  telefone: string | null;
  turma: string | null;
  is_admin: boolean;
};

type Filtro = "fora" | "dentro" | "todos";

// Busca sem acento e sem caixa: "jose" acha "José".
function normalizar(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase();
}

function plural(n: number, singular: string, plural: string): string {
  return `${n} ${n === 1 ? singular : plural}`;
}

export function MatricularEmLote({
  cursoId,
  cursoTitulo,
  cursoAberto,
  alunos,
  matriculadosIniciais,
}: {
  cursoId: string;
  cursoTitulo: string;
  /** Temática com interface própria (Bíblia, devocional): ninguém é avisado. */
  cursoAberto: boolean;
  alunos: AlunoParaLote[];
  matriculadosIniciais: string[];
}) {
  const router = useRouter();
  const [busca, setBusca] = useState("");
  const [filtro, setFiltro] = useState<Filtro>("fora");
  const [turma, setTurma] = useState("");
  const [matriculados, setMatriculados] = useState<Set<string>>(
    () => new Set(matriculadosIniciais),
  );
  const [selecionados, setSelecionados] = useState<Set<string>>(new Set());
  const [notificar, setNotificar] = useState(true);
  const [pendente, setPendente] = useState(false);
  const [recado, setRecado] = useState<string | null>(null);
  const [erro, setErro] = useState<string | null>(null);

  const termo = normalizar(busca.trim());

  const turmas = useMemo(() => {
    const set = new Set<string>();
    for (const a of alunos) if (a.turma) set.add(a.turma);
    return [...set].sort((x, y) => x.localeCompare(y, "pt-BR"));
  }, [alunos]);

  const indice = useMemo(() => {
    const mapa = new Map<string, string>();
    for (const a of alunos) {
      mapa.set(a.id, normalizar([a.nome || "", a.email, a.turma || ""].join(" ")));
    }
    return mapa;
  }, [alunos]);

  const visiveis = useMemo(() => {
    return alunos.filter((a) => {
      if (termo && !indice.get(a.id)?.includes(termo)) return false;
      if (turma && a.turma !== turma) return false;
      if (filtro === "todos") return true;
      return filtro === "dentro" ? matriculados.has(a.id) : !matriculados.has(a.id);
    });
  }, [alunos, indice, termo, turma, filtro, matriculados]);

  const totalDentro = alunos.filter((a) => matriculados.has(a.id)).length;
  const totalFora = alunos.length - totalDentro;

  // A seleção sobrevive à troca de filtro, então as contas de ação olham a
  // seleção inteira — não só o que está na tela.
  const selecionadosFora = [...selecionados].filter((id) => !matriculados.has(id));
  const selecionadosDentro = [...selecionados].filter((id) => matriculados.has(id));

  const idsVisiveis = visiveis.map((a) => a.id);
  const todosVisiveisMarcados =
    idsVisiveis.length > 0 && idsVisiveis.every((id) => selecionados.has(id));

  function alternarUm(id: string) {
    setSelecionados((s) => {
      const proximo = new Set(s);
      if (proximo.has(id)) proximo.delete(id);
      else proximo.add(id);
      return proximo;
    });
  }

  function alternarVisiveis() {
    setSelecionados((s) => {
      const proximo = new Set(s);
      if (todosVisiveisMarcados) for (const id of idsVisiveis) proximo.delete(id);
      else for (const id of idsVisiveis) proximo.add(id);
      return proximo;
    });
  }

  async function aplicar(acao: "matricular" | "desmatricular", ids: string[]) {
    if (ids.length === 0 || pendente) return;
    if (acao === "desmatricular") {
      const ok = window.confirm(
        `Remover ${plural(ids.length, "discípulo", "discípulos")} de "${cursoTitulo}"? ` +
          "O progresso registrado não é apagado, mas eles perdem o acesso à temática.",
      );
      if (!ok) return;
    }

    setPendente(true);
    setErro(null);
    setRecado(null);
    try {
      const endpoint = MOCK ? "/api/mock/matricular" : "/api/admin/matricular-lote";
      const res = await fetch(endpoint, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cursoId, alunoIds: ids, acao, notificar }),
      });
      const j = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(j.erro || `HTTP ${res.status}`);

      setMatriculados((m) => {
        const proximo = new Set(m);
        for (const id of ids) {
          if (acao === "matricular") proximo.add(id);
          else proximo.delete(id);
        }
        return proximo;
      });
      setSelecionados(new Set());

      if (acao === "desmatricular") {
        setRecado(
          `${plural(ids.length, "discípulo saiu", "discípulos saíram")} da temática.`,
        );
      } else {
        const entraram = typeof j.entraram === "number" ? j.entraram : ids.length;
        const jaEstavam = typeof j.jaEstavam === "number" ? j.jaEstavam : 0;
        const partes = [
          `${plural(entraram, "discípulo matriculado", "discípulos matriculados")}`,
        ];
        if (jaEstavam > 0)
          partes.push(`${jaEstavam} já estava${jaEstavam > 1 ? "m" : ""}`);
        if (j.cursoAberto) {
          partes.push("temática aberta a todos: ninguém foi avisado");
        } else if (!notificar) {
          partes.push("sem aviso, como você pediu");
        } else if (j.whatsapp) {
          const { enfileirados = 0, semTelefone = 0 } = j.whatsapp;
          if (enfileirados > 0) partes.push(`${enfileirados} na fila do WhatsApp`);
          if (semTelefone > 0) partes.push(`${semTelefone} sem telefone`);
        }
        setRecado(`${partes.join(" · ")}.`);
      }
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro ao salvar.");
    } finally {
      setPendente(false);
    }
  }

  if (alunos.length === 0) {
    return (
      <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-12 text-center">
        <p className="text-mesa-500">Ainda não há discípulos cadastrados.</p>
      </div>
    );
  }

  const chips: { valor: Filtro; rotulo: string }[] = [
    { valor: "fora", rotulo: `Fora da temática (${totalFora})` },
    { valor: "dentro", rotulo: `Na temática (${totalDentro})` },
    { valor: "todos", rotulo: `Todos (${alunos.length})` },
  ];

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-5">
      <div className="flex flex-col gap-3 sm:flex-row">
        <div className="relative flex-1">
          <label htmlFor="busca-discipulo" className="sr-only">
            Buscar discípulo por nome ou e-mail
          </label>
          <input
            id="busca-discipulo"
            type="search"
            value={busca}
            onChange={(e) => setBusca(e.target.value)}
            placeholder="Buscar discípulo por nome ou e-mail…"
            autoComplete="off"
            className="w-full rounded-full border border-mesa-200 bg-white py-2.5 pl-10 pr-4 text-mesa-800 placeholder:text-mesa-400 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
          />
          <span
            aria-hidden="true"
            className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-mesa-400"
          >
            🔍
          </span>
        </div>
        {turmas.length > 0 && (
          <div>
            <label htmlFor="filtro-turma" className="sr-only">
              Filtrar por turma
            </label>
            <select
              id="filtro-turma"
              value={turma}
              onChange={(e) => setTurma(e.target.value)}
              className="w-full rounded-full border border-mesa-200 bg-white py-2.5 pl-4 pr-8 text-sm text-mesa-700 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200 sm:w-auto"
            >
              <option value="">Todas as turmas</option>
              {turmas.map((t) => (
                <option key={t} value={t}>
                  {t}
                </option>
              ))}
            </select>
          </div>
        )}
      </div>

      <div className="mt-3 flex flex-wrap items-center gap-2">
        {chips.map((chip) => (
          <button
            key={chip.valor}
            type="button"
            onClick={() => setFiltro(chip.valor)}
            aria-pressed={filtro === chip.valor}
            className={
              filtro === chip.valor
                ? "rounded-full bg-mesa-700 px-4 py-1.5 text-xs font-semibold text-mesa-50"
                : "rounded-full border border-mesa-200 bg-white px-4 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
            }
          >
            {chip.rotulo}
          </button>
        ))}
      </div>

      <div className="mt-4 flex flex-wrap items-center justify-between gap-3 border-b border-mesa-100 pb-3">
        <label className="flex cursor-pointer items-center gap-2 text-sm text-mesa-700">
          <input
            type="checkbox"
            checked={todosVisiveisMarcados}
            onChange={alternarVisiveis}
            disabled={idsVisiveis.length === 0}
            className="h-4 w-4 rounded border-mesa-300 text-laranja-500 focus:ring-laranja-400"
          />
          Selecionar{" "}
          {plural(idsVisiveis.length, "discípulo à vista", "discípulos à vista")}
        </label>
        <p aria-live="polite" className="text-xs text-mesa-500">
          {selecionados.size > 0
            ? `${plural(selecionados.size, "selecionado", "selecionados")}`
            : "Nenhum selecionado"}
        </p>
      </div>

      {visiveis.length === 0 ? (
        <p className="py-8 text-center text-sm text-mesa-500">
          {filtro === "fora"
            ? "Todo mundo que bate com esta busca já está na temática."
            : "Nenhum discípulo encontrado com esses filtros."}
        </p>
      ) : (
        <ul className="mt-1 max-h-[26rem] divide-y divide-mesa-100 overflow-y-auto">
          {visiveis.map((a) => {
            const dentro = matriculados.has(a.id);
            return (
              <li key={a.id}>
                <label className="flex cursor-pointer items-center gap-3 py-2.5 pr-1">
                  <input
                    type="checkbox"
                    checked={selecionados.has(a.id)}
                    onChange={() => alternarUm(a.id)}
                    className="h-4 w-4 flex-none rounded border-mesa-300 text-laranja-500 focus:ring-laranja-400"
                  />
                  <span className="min-w-0 flex-1">
                    <span className="flex flex-wrap items-center gap-2">
                      <span className="font-medium text-mesa-800">
                        {a.nome || a.email}
                      </span>
                      {a.turma && (
                        <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-[11px] text-mesa-600">
                          {a.turma}
                        </span>
                      )}
                      {a.is_admin && (
                        <span className="rounded-full bg-oliveira-100 px-2 py-0.5 text-[11px] font-medium text-oliveira-700">
                          Admin
                        </span>
                      )}
                      {dentro && (
                        <span className="rounded-full bg-oliveira-100 px-2 py-0.5 text-[11px] font-medium text-oliveira-700">
                          ✓ na temática
                        </span>
                      )}
                      {!a.telefone && (
                        <span className="rounded-full bg-amber-100 px-2 py-0.5 text-[11px] text-amber-800">
                          Sem WhatsApp
                        </span>
                      )}
                    </span>
                    <span className="block truncate text-xs text-mesa-500">
                      {a.email}
                      {a.telefone ? ` · ${displayTelefone(a.telefone)}` : ""}
                    </span>
                  </span>
                </label>
              </li>
            );
          })}
        </ul>
      )}

      <div className="mt-4 border-t border-mesa-100 pt-4">
        {!cursoAberto && (
          <label className="flex cursor-pointer items-start gap-2 text-sm text-mesa-700">
            <input
              type="checkbox"
              checked={notificar}
              onChange={(e) => setNotificar(e.target.checked)}
              className="mt-0.5 h-4 w-4 flex-none rounded border-mesa-300 text-laranja-500 focus:ring-laranja-400"
            />
            <span>
              Avisar quem entrar agora (aviso no app e mensagem no WhatsApp).
              <span className="block text-xs text-mesa-500">
                Desmarque para liberar em silêncio — útil ao carregar o catálogo de uma
                vez. Quem já estava na temática nunca é avisado de novo.
              </span>
            </span>
          </label>
        )}
        {cursoAberto && (
          <p className="text-xs text-mesa-500">
            Esta temática é aberta a todos os cadastrados — matricular aqui não dispara
            aviso nenhum.
          </p>
        )}

        <div className="mt-4 flex flex-wrap items-center gap-3">
          <button
            type="button"
            onClick={() => aplicar("matricular", selecionadosFora)}
            disabled={pendente || selecionadosFora.length === 0}
            className="rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:cursor-not-allowed disabled:opacity-40"
          >
            {pendente
              ? "Salvando…"
              : `Matricular ${plural(selecionadosFora.length, "discípulo", "discípulos")}`}
          </button>
          {selecionadosDentro.length > 0 && (
            <button
              type="button"
              onClick={() => aplicar("desmatricular", selecionadosDentro)}
              disabled={pendente}
              className="rounded-full border border-mesa-200 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:bg-mesa-50 disabled:opacity-40"
            >
              Remover {plural(selecionadosDentro.length, "que já está", "que já estão")}
            </button>
          )}
          {selecionados.size > 0 && (
            <button
              type="button"
              onClick={() => setSelecionados(new Set())}
              disabled={pendente}
              className="text-sm text-mesa-500 hover:text-mesa-700"
            >
              Limpar seleção
            </button>
          )}
        </div>

        {recado && (
          <p className="mt-3 rounded-xl bg-oliveira-50 px-4 py-2.5 text-sm text-oliveira-800">
            {recado}
          </p>
        )}
        {erro && (
          <p className="mt-3 rounded-xl bg-red-50 px-4 py-2.5 text-sm text-red-700">
            {erro}
          </p>
        )}
      </div>
    </div>
  );
}
