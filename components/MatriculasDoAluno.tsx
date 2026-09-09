"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useMemo, useState } from "react";
import { agruparPorCategoria } from "@/lib/categorias";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Só o que a lista precisa mostrar/filtrar — a página passa isso do servidor.
export type CursoParaMatricula = {
  id: string;
  slug: string;
  titulo: string;
  descricao: string | null;
  autor?: string | null;
  categoria?: string | null;
  ordem: number;
  publicado: boolean;
  is_pago: boolean;
  external_path: string | null;
};

type Filtro = "todas" | "matriculadas" | "fora";

// Busca sem acento e sem caixa: "espirito" acha "Espírito".
function normalizar(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase();
}

export function MatriculasDoAluno({
  alunoId,
  cursos,
  matriculadosIniciais,
}: {
  alunoId: string;
  cursos: CursoParaMatricula[];
  matriculadosIniciais: string[];
}) {
  const router = useRouter();
  const [busca, setBusca] = useState("");
  const [filtro, setFiltro] = useState<Filtro>("todas");
  const [matriculados, setMatriculados] = useState<Set<string>>(
    () => new Set(matriculadosIniciais),
  );
  const [salvando, setSalvando] = useState<Set<string>>(new Set());
  const [erros, setErros] = useState<Record<string, string>>({});
  // Temáticas mexidas agora continuam visíveis mesmo que o filtro as exclua —
  // senão o card some debaixo do dedo assim que o master clica. A cortesia dura
  // até trocar de filtro: aí a lista volta a ser exatamente o que o chip promete.
  const [tocados, setTocados] = useState<Set<string>>(new Set());

  function trocarFiltro(novo: Filtro) {
    setFiltro(novo);
    setTocados(new Set());
  }

  const termo = normalizar(busca.trim());

  // Índice de busca: título, autor, descrição. Montado uma vez por lista.
  const indice = useMemo(() => {
    const mapa = new Map<string, string>();
    for (const c of cursos) {
      mapa.set(
        c.id,
        normalizar([c.titulo, c.autor || "", c.descricao || ""].join(" ")),
      );
    }
    return mapa;
  }, [cursos]);

  const visiveis = useMemo(() => {
    return cursos.filter((c) => {
      if (termo && !indice.get(c.id)?.includes(termo)) return false;
      if (filtro === "todas" || tocados.has(c.id)) return true;
      return filtro === "matriculadas"
        ? matriculados.has(c.id)
        : !matriculados.has(c.id);
    });
  }, [cursos, indice, termo, filtro, matriculados, tocados]);

  const grupos = useMemo(() => agruparPorCategoria(visiveis), [visiveis]);

  const totalMatriculadas = cursos.filter((c) => matriculados.has(c.id)).length;
  const totalFora = cursos.length - totalMatriculadas;

  async function alternar(curso: CursoParaMatricula) {
    const entrando = !matriculados.has(curso.id);
    setErros((e) => ({ ...e, [curso.id]: "" }));
    setSalvando((s) => new Set(s).add(curso.id));
    setTocados((t) => new Set(t).add(curso.id));
    // Otimista: o cartão responde na hora e volta atrás se a gravação falhar.
    setMatriculados((m) => {
      const proximo = new Set(m);
      if (entrando) proximo.add(curso.id);
      else proximo.delete(curso.id);
      return proximo;
    });

    try {
      const endpoint = MOCK ? "/api/mock/matricular" : "/api/admin/matricular";
      const res = await fetch(endpoint, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          alunoId,
          cursoId: curso.id,
          acao: entrando ? "matricular" : "desmatricular",
        }),
      });
      if (!res.ok) {
        const j = await res.json().catch(() => ({}));
        throw new Error(j.erro || `HTTP ${res.status}`);
      }
      router.refresh();
    } catch (e) {
      setMatriculados((m) => {
        const proximo = new Set(m);
        if (entrando) proximo.delete(curso.id);
        else proximo.add(curso.id);
        return proximo;
      });
      setErros((err) => ({
        ...err,
        [curso.id]: e instanceof Error ? e.message : "Erro ao salvar.",
      }));
    } finally {
      setSalvando((s) => {
        const proximo = new Set(s);
        proximo.delete(curso.id);
        return proximo;
      });
    }
  }

  if (cursos.length === 0) {
    return (
      <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
        <p className="text-mesa-500">Nenhuma temática disponível ainda.</p>
      </div>
    );
  }

  const chips: { valor: Filtro; rotulo: string }[] = [
    { valor: "todas", rotulo: `Todas (${cursos.length})` },
    { valor: "matriculadas", rotulo: `Matriculado (${totalMatriculadas})` },
    { valor: "fora", rotulo: `Fora (${totalFora})` },
  ];

  return (
    <div>
      <div className="sticky top-0 z-10 -mx-2 mb-5 rounded-2xl bg-mesa-50 px-2 py-3">
        <label htmlFor="busca-tematica" className="sr-only">
          Buscar temática por título ou autor
        </label>
        <div className="relative">
          <input
            id="busca-tematica"
            type="search"
            value={busca}
            onChange={(e) => setBusca(e.target.value)}
            placeholder="Buscar temática por título ou autor…"
            autoComplete="off"
            className="w-full rounded-full border border-mesa-200 bg-white py-3 pl-11 pr-4 text-mesa-800 placeholder:text-mesa-400 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
          />
          <span
            aria-hidden="true"
            className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-mesa-400"
          >
            🔍
          </span>
        </div>

        <div className="mt-3 flex flex-wrap items-center gap-2">
          {chips.map((chip) => (
            <button
              key={chip.valor}
              type="button"
              onClick={() => trocarFiltro(chip.valor)}
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
          <p aria-live="polite" className="ml-auto text-xs text-mesa-500">
            {visiveis.length === cursos.length
              ? `${cursos.length} temáticas`
              : `${visiveis.length} de ${cursos.length}`}
          </p>
        </div>
      </div>

      {visiveis.length === 0 ? (
        <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-12 text-center">
          <p className="text-mesa-500">
            Nenhuma temática encontrada
            {termo ? ` para “${busca.trim()}”` : ""}.
          </p>
          {termo && (
            <button
              type="button"
              onClick={() => setBusca("")}
              className="mt-3 text-sm font-medium text-laranja-600 hover:text-laranja-700"
            >
              Limpar busca
            </button>
          )}
        </div>
      ) : (
        <div className="space-y-8">
          {grupos.map((grupo) => (
            <section key={grupo.label}>
              <h3 className="mb-3 text-xs font-semibold uppercase tracking-[0.2em] text-mesa-500">
                {grupo.label}
                <span className="ml-2 font-normal tracking-normal text-mesa-400">
                  {grupo.cursos.length}
                </span>
              </h3>
              <ul className="space-y-2">
                {grupo.cursos.map((c) => {
                  const matriculado = matriculados.has(c.id);
                  const pendente = salvando.has(c.id);
                  const erro = erros[c.id];
                  return (
                    <li
                      key={c.id}
                      className={
                        matriculado
                          ? "flex flex-wrap items-center justify-between gap-3 rounded-xl border border-oliveira-200 bg-oliveira-50/40 p-4"
                          : "flex flex-wrap items-center justify-between gap-3 rounded-xl border border-mesa-200 bg-white p-4"
                      }
                    >
                      <div className="min-w-0 flex-1">
                        <div className="flex flex-wrap items-center gap-2">
                          <h4 className="font-serif text-base font-semibold text-mesa-800">
                            {c.titulo}
                          </h4>
                          {c.autor && (
                            <span className="text-xs text-mesa-500">{c.autor}</span>
                          )}
                          {!c.publicado && (
                            <span className="rounded-full bg-amber-100 px-2 py-0.5 text-[11px] font-medium text-amber-800">
                              Rascunho
                            </span>
                          )}
                          {c.is_pago && (
                            <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-[11px] font-medium text-mesa-700">
                              Pago
                            </span>
                          )}
                          {c.external_path && (
                            <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-[11px] font-medium text-mesa-600">
                              Aberta a todos
                            </span>
                          )}
                        </div>
                        {erro && <p className="mt-1 text-xs text-red-600">{erro}</p>}
                      </div>

                      <div className="flex flex-none items-center gap-2">
                        {matriculado && (
                          <Link
                            href={`/admin/cursos/${c.slug}/alunos/${alunoId}`}
                            className="rounded-full border border-mesa-200 bg-white px-3 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                          >
                            Progresso
                          </Link>
                        )}
                        <button
                          type="button"
                          onClick={() => alternar(c)}
                          disabled={pendente}
                          aria-label={
                            matriculado
                              ? `Desmatricular de ${c.titulo}`
                              : `Matricular em ${c.titulo}`
                          }
                          className={
                            matriculado
                              ? "rounded-full border border-oliveira-300 bg-white px-4 py-2 text-sm font-medium text-oliveira-800 hover:bg-oliveira-100 disabled:opacity-50"
                              : "rounded-full bg-laranja-500 px-4 py-2 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-50"
                          }
                        >
                          {pendente
                            ? "Salvando…"
                            : matriculado
                              ? "✓ Matriculado"
                              : "Matricular"}
                        </button>
                      </div>
                    </li>
                  );
                })}
              </ul>
            </section>
          ))}
        </div>
      )}
    </div>
  );
}
