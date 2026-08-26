"use client";

// =============================================================
// EKBALLO ACADEMY · Mural do caderno de anotações
//
// A filtragem é toda no cliente: o caderno de um discípulo é da ordem de
// dezenas de notas, então buscar no servidor a cada tecla custaria mais
// latência do que carregar tudo de uma vez e filtrar em memória.
// =============================================================

import { useMemo, useState, useTransition } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  CATEGORIAS,
  CATEGORIA_MAP,
  CORES,
  tituloExibido,
  tempoRelativo,
  type AnotacaoRich,
  type CategoriaAnotacao,
} from "@/lib/anotacoes-meta";
import { resumir } from "@/lib/sanitizar-html";

type Ordem = "recentes" | "criadas" | "alfabetica";

export function ListaAnotacoes({
  anotacoes,
  cursos,
}: {
  anotacoes: AnotacaoRich[];
  cursos: { id: string; titulo: string }[];
}) {
  const router = useRouter();
  const [criando, startCriar] = useTransition();

  const [busca, setBusca] = useState("");
  const [categoria, setCategoria] = useState<CategoriaAnotacao | "todas">("todas");
  const [tagAtiva, setTagAtiva] = useState<string | null>(null);
  const [cursoId, setCursoId] = useState("");
  const [verArquivadas, setVerArquivadas] = useState(false);
  const [ordem, setOrdem] = useState<Ordem>("recentes");

  const tagsDisponiveis = useMemo(() => {
    const conta = new Map<string, number>();
    for (const a of anotacoes) {
      if (a.arquivada && !verArquivadas) continue;
      for (const t of a.tags ?? []) conta.set(t, (conta.get(t) ?? 0) + 1);
    }
    return [...conta.entries()].sort((a, b) => b[1] - a[1]).slice(0, 20);
  }, [anotacoes, verArquivadas]);

  const filtradas = useMemo(() => {
    const termo = busca.trim().toLowerCase();
    const lista = anotacoes.filter((a) => {
      if (a.arquivada !== verArquivadas) return false;
      if (categoria !== "todas" && a.categoria !== categoria) return false;
      if (tagAtiva && !(a.tags ?? []).includes(tagAtiva)) return false;
      if (cursoId && a.curso_id !== cursoId) return false;
      if (!termo) return true;
      return (
        a.titulo.toLowerCase().includes(termo) ||
        a.conteudo_texto.toLowerCase().includes(termo) ||
        (a.tags ?? []).some((t) => t.includes(termo)) ||
        (a.curso_titulo ?? "").toLowerCase().includes(termo)
      );
    });

    const porData = (x: AnotacaoRich, campo: "atualizado_em" | "criado_em") =>
      Date.parse(x[campo]) || 0;

    return lista.sort((a, b) => {
      // Fixadas sempre no topo — é o que o 📌 promete.
      if (a.fixada !== b.fixada) return a.fixada ? -1 : 1;
      if (ordem === "alfabetica") {
        return tituloExibido(a).localeCompare(tituloExibido(b), "pt-BR");
      }
      const campo = ordem === "criadas" ? "criado_em" : "atualizado_em";
      return porData(b, campo) - porData(a, campo);
    });
  }, [anotacoes, busca, categoria, tagAtiva, cursoId, verArquivadas, ordem]);

  const totalAtivas = anotacoes.filter((a) => !a.arquivada).length;
  const totalArquivadas = anotacoes.length - totalAtivas;

  function novaAnotacao(cat: CategoriaAnotacao = "ideia") {
    startCriar(async () => {
      const res = await fetch("/api/anotacoes", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          categoria: cat,
          curso_id: cursoId || null,
          tags: tagAtiva ? [tagAtiva] : [],
        }),
      });
      if (!res.ok) return;
      const { anotacao } = (await res.json()) as { anotacao: { id: string } };
      router.push(`/anotacoes/${anotacao.id}`);
    });
  }

  async function alternarFixada(a: AnotacaoRich) {
    await fetch(`/api/anotacoes/${a.id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ fixada: !a.fixada }),
    });
    router.refresh();
  }

  async function alternarArquivada(a: AnotacaoRich) {
    await fetch(`/api/anotacoes/${a.id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ arquivada: !a.arquivada }),
    });
    router.refresh();
  }

  // Link da folha de impressão respeitando os filtros da tela.
  const hrefImprimir = (() => {
    const p = new URLSearchParams();
    if (categoria !== "todas") p.set("categoria", categoria);
    if (cursoId) p.set("curso", cursoId);
    if (tagAtiva) p.set("tag", tagAtiva);
    if (verArquivadas) p.set("arquivadas", "1");
    const qs = p.toString();
    return `/anotacoes/imprimir${qs ? `?${qs}` : ""}`;
  })();

  return (
    <div>
      {/* ---- Ações principais ---- */}
      <div className="mb-6 flex flex-wrap items-center gap-2">
        <button
          onClick={() => novaAnotacao()}
          disabled={criando}
          className="rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-60"
        >
          {criando ? "Abrindo…" : "+ Nova anotação"}
        </button>
        {CATEGORIAS.slice(0, 4).map((c) => (
          <button
            key={c.chave}
            onClick={() => novaAnotacao(c.chave)}
            disabled={criando}
            title={`Nova anotação de ${c.rotulo.toLowerCase()} — ${c.descricao}`}
            className="rounded-full border border-mesa-200 bg-white px-3.5 py-2.5 text-xs font-medium text-mesa-700 transition hover:border-laranja-300 hover:bg-laranja-50"
          >
            {c.emoji} {c.rotulo}
          </button>
        ))}
        <div className="ml-auto flex items-center gap-2">
          <a
            href={hrefImprimir}
            target="_blank"
            rel="noopener noreferrer"
            className="rounded-full border border-mesa-200 bg-white px-3.5 py-2.5 text-xs font-medium text-mesa-700 transition hover:bg-mesa-100"
            title="Gerar um PDF com as anotações filtradas"
          >
            📄 Caderno em PDF
          </a>
        </div>
      </div>

      {/* ---- Busca e filtros ---- */}
      <div className="mb-6 rounded-2xl border border-mesa-200 bg-white p-4">
        <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
          <div className="relative flex-1">
            <span className="pointer-events-none absolute left-3.5 top-1/2 -translate-y-1/2 text-mesa-400">
              🔎
            </span>
            <input
              value={busca}
              onChange={(e) => setBusca(e.target.value)}
              placeholder="Buscar no caderno — título, texto, tag, livro…"
              className="w-full rounded-xl border border-mesa-200 bg-mesa-50/50 py-2.5 pl-10 pr-3 text-sm outline-none transition focus:border-laranja-400 focus:bg-white"
            />
          </div>
          <select
            value={cursoId}
            onChange={(e) => setCursoId(e.target.value)}
            className="rounded-xl border border-mesa-200 bg-white px-3 py-2.5 text-xs text-mesa-700 outline-none focus:border-laranja-400"
          >
            <option value="">Todos os livros</option>
            {cursos.map((c) => (
              <option key={c.id} value={c.id}>
                {c.titulo}
              </option>
            ))}
          </select>
          <select
            value={ordem}
            onChange={(e) => setOrdem(e.target.value as Ordem)}
            className="rounded-xl border border-mesa-200 bg-white px-3 py-2.5 text-xs text-mesa-700 outline-none focus:border-laranja-400"
          >
            <option value="recentes">Editadas recentemente</option>
            <option value="criadas">Mais novas primeiro</option>
            <option value="alfabetica">Ordem alfabética</option>
          </select>
        </div>

        <div className="mt-3 flex flex-wrap items-center gap-1.5">
          <Chip ativo={categoria === "todas"} onClick={() => setCategoria("todas")}>
            Tudo ({totalAtivas})
          </Chip>
          {CATEGORIAS.map((c) => {
            const n = anotacoes.filter(
              (a) => a.categoria === c.chave && a.arquivada === verArquivadas,
            ).length;
            if (n === 0) return null;
            return (
              <Chip
                key={c.chave}
                ativo={categoria === c.chave}
                onClick={() => setCategoria(categoria === c.chave ? "todas" : c.chave)}
              >
                {c.emoji} {c.rotulo} ({n})
              </Chip>
            );
          })}
          {totalArquivadas > 0 && (
            <Chip
              ativo={verArquivadas}
              onClick={() => setVerArquivadas((v) => !v)}
            >
              🗄 Arquivadas ({totalArquivadas})
            </Chip>
          )}
        </div>

        {tagsDisponiveis.length > 0 && (
          <div className="mt-2 flex flex-wrap items-center gap-1.5">
            {tagsDisponiveis.map(([t, n]) => (
              <button
                key={t}
                onClick={() => setTagAtiva(tagAtiva === t ? null : t)}
                className={`rounded-full px-2.5 py-1 text-[11px] transition ${
                  tagAtiva === t
                    ? "bg-mesa-800 text-white"
                    : "bg-mesa-100 text-mesa-600 hover:bg-mesa-200"
                }`}
              >
                #{t} <span className="opacity-60">{n}</span>
              </button>
            ))}
          </div>
        )}
      </div>

      {/* ---- Mural ---- */}
      {filtradas.length === 0 ? (
        <div className="rounded-2xl border-2 border-dashed border-mesa-300 bg-white/60 px-6 py-20 text-center">
          <p className="font-serif text-2xl text-mesa-700">
            {anotacoes.length === 0
              ? "Seu caderno está em branco."
              : "Nada encontrado com esses filtros."}
          </p>
          <p className="mx-auto mt-3 max-w-md text-sm leading-relaxed text-mesa-500">
            {anotacoes.length === 0
              ? "Comece uma anotação de aula, um esboço de pregação, a ideia que apareceu no meio da leitura. Fica tudo aqui, e só você vê."
              : "Tente outra busca ou limpe os filtros."}
          </p>
          {anotacoes.length === 0 && (
            <button
              onClick={() => novaAnotacao()}
              className="mt-6 rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white hover:bg-laranja-600"
            >
              + Escrever a primeira
            </button>
          )}
        </div>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {filtradas.map((a) => (
            <CardAnotacao
              key={a.id}
              anotacao={a}
              onFixar={() => alternarFixada(a)}
              onArquivar={() => alternarArquivada(a)}
            />
          ))}
        </div>
      )}

      {filtradas.length > 0 && (
        <p className="mt-6 text-center text-xs text-mesa-400">
          {filtradas.length} {filtradas.length === 1 ? "anotação" : "anotações"}
          {busca || categoria !== "todas" || tagAtiva || cursoId ? " nos filtros atuais" : ""}.
        </p>
      )}
    </div>
  );
}

function Chip({
  ativo,
  onClick,
  children,
}: {
  ativo: boolean;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      onClick={onClick}
      className={`rounded-full border px-3 py-1.5 text-xs font-medium transition ${
        ativo
          ? "border-laranja-300 bg-laranja-50 text-laranja-700"
          : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
      }`}
    >
      {children}
    </button>
  );
}

function CardAnotacao({
  anotacao,
  onFixar,
  onArquivar,
}: {
  anotacao: AnotacaoRich;
  onFixar: () => void;
  onArquivar: () => void;
}) {
  const cor = CORES[anotacao.cor] ?? CORES.areia;
  const cat = CATEGORIA_MAP.get(anotacao.categoria);
  const previa = resumir(anotacao.conteudo_texto, 180);
  const tarefas = (anotacao.conteudo_html.match(/data-tarefa="[01]"/g) || []).length;
  const feitas = (anotacao.conteudo_html.match(/data-tarefa="1"/g) || []).length;

  return (
    <div
      className="lift group relative flex flex-col overflow-hidden rounded-2xl border shadow-[0_4px_16px_-6px_rgba(38,35,32,0.10)]"
      style={{ background: cor.fundo, borderColor: cor.borda }}
    >
      <span
        className="absolute inset-y-0 left-0 w-1"
        style={{ background: cor.acento }}
        aria-hidden
      />

      <Link href={`/anotacoes/${anotacao.id}`} className="flex-1 px-5 py-4 pl-6">
        <div className="mb-2 flex items-center gap-2">
          <span className="text-[11px] font-semibold uppercase tracking-[0.12em] text-mesa-500">
            {cat?.emoji} {cat?.rotulo}
          </span>
          {anotacao.fixada && <span title="Fixada">📌</span>}
        </div>

        <h3 className="mb-2 line-clamp-2 font-serif text-lg font-semibold leading-snug text-mesa-900">
          {tituloExibido(anotacao)}
        </h3>

        {previa ? (
          <p className="line-clamp-4 text-sm leading-relaxed text-mesa-600">{previa}</p>
        ) : (
          <p className="text-sm italic text-mesa-400">Anotação em branco.</p>
        )}

        {tarefas > 0 && (
          <p className="mt-3 text-xs font-medium text-mesa-500">
            ☑ {feitas}/{tarefas} tarefas
          </p>
        )}

        {(anotacao.tags?.length ?? 0) > 0 && (
          <div className="mt-3 flex flex-wrap gap-1">
            {anotacao.tags.slice(0, 4).map((t) => (
              <span
                key={t}
                className="rounded-full bg-white/70 px-2 py-0.5 text-[10px] text-mesa-600"
              >
                #{t}
              </span>
            ))}
          </div>
        )}
      </Link>

      <div className="flex items-center justify-between gap-2 border-t px-5 py-2.5 pl-6" style={{ borderColor: cor.borda }}>
        <div className="min-w-0">
          <p className="truncate text-[11px] text-mesa-500">
            {tempoRelativo(anotacao.atualizado_em)}
          </p>
          {anotacao.curso_titulo && (
            <p className="truncate text-[11px] text-mesa-400">📖 {anotacao.curso_titulo}</p>
          )}
        </div>
        <div className="flex flex-none items-center gap-1 opacity-0 transition group-hover:opacity-100 focus-within:opacity-100">
          <button
            onClick={onFixar}
            title={anotacao.fixada ? "Desafixar" : "Fixar no topo"}
            className="rounded-md px-1.5 py-1 text-xs hover:bg-white/70"
          >
            📌
          </button>
          <a
            href={`/anotacoes/imprimir?id=${anotacao.id}&auto=1`}
            target="_blank"
            rel="noopener noreferrer"
            title="Salvar em PDF"
            className="rounded-md px-1.5 py-1 text-xs hover:bg-white/70"
          >
            📄
          </a>
          <button
            onClick={onArquivar}
            title={anotacao.arquivada ? "Tirar do arquivo" : "Arquivar"}
            className="rounded-md px-1.5 py-1 text-xs hover:bg-white/70"
          >
            {anotacao.arquivada ? "↩" : "🗄"}
          </button>
        </div>
      </div>
    </div>
  );
}
