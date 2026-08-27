"use client";

// =============================================================
// EKBALLO ACADEMY · Mural do caderno de anotações
//
// A filtragem é toda no cliente: o caderno de um discípulo é da ordem de
// dezenas de notas, então buscar no servidor a cada tecla custaria mais
// latência do que carregar tudo de uma vez e filtrar em memória.
//
// A barra lateral é o eixo de ORGANIZAÇÃO (pastas, arquivo, lixeira) e os
// chips são o eixo de TIPO (categoria) — dois recortes independentes: dá pra
// ver "só as aulas dentro da pasta Perspectivas".
// =============================================================

import { useMemo, useState, useTransition } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  CATEGORIAS,
  CATEGORIA_MAP,
  CORES,
  CORES_ORDEM,
  DIAS_LIXEIRA,
  rotuloExpurgo,
  tituloExibido,
  tempoRelativo,
  type AnotacaoRich,
  type CategoriaAnotacao,
  type CorAnotacao,
  type PastaAnotacao,
} from "@/lib/anotacoes-meta";
import { resumir } from "@/lib/sanitizar-html";
import { BuscaBiblia } from "@/components/BuscaBiblia";

type Ordem = "recentes" | "criadas" | "alfabetica";

// Onde o discípulo está olhando. Pasta é um id; o resto é lugar fixo.
type Visao =
  | { tipo: "todas" }
  | { tipo: "pasta"; id: string }
  | { tipo: "sem-pasta" }
  | { tipo: "arquivadas" }
  | { tipo: "lixeira" };

export function ListaAnotacoes({
  anotacoes,
  lixeira,
  pastas: pastasIniciais,
  cursos,
  versoesBiblia = [],
}: {
  anotacoes: AnotacaoRich[];
  lixeira: AnotacaoRich[];
  pastas: PastaAnotacao[];
  cursos: { id: string; titulo: string }[];
  versoesBiblia?: { sigla: string; nome: string }[];
}) {
  const router = useRouter();
  const [criando, startCriar] = useTransition();

  const [pastas, setPastas] = useState(pastasIniciais);
  const [visao, setVisao] = useState<Visao>({ tipo: "todas" });
  const [busca, setBusca] = useState("");
  const [categoria, setCategoria] = useState<CategoriaAnotacao | "todas">("todas");
  const [tagAtiva, setTagAtiva] = useState<string | null>(null);
  const [cursoId, setCursoId] = useState("");
  const [ordem, setOrdem] = useState<Ordem>("recentes");

  const [criandoPasta, setCriandoPasta] = useState(false);
  const [nomePasta, setNomePasta] = useState("");
  const [corPasta, setCorPasta] = useState<CorAnotacao>("areia");
  const [renomeando, setRenomeando] = useState<string | null>(null);
  const [confirmarEsvaziar, setConfirmarEsvaziar] = useState(false);

  const naLixeira = visao.tipo === "lixeira";
  const fonte = naLixeira ? lixeira : anotacoes;

  const tagsDisponiveis = useMemo(() => {
    const conta = new Map<string, number>();
    for (const a of fonte) {
      for (const t of a.tags ?? []) conta.set(t, (conta.get(t) ?? 0) + 1);
    }
    return [...conta.entries()].sort((a, b) => b[1] - a[1]).slice(0, 20);
  }, [fonte]);

  const filtradas = useMemo(() => {
    const termo = busca.trim().toLowerCase();
    const lista = fonte.filter((a) => {
      // Lugar (barra lateral)
      if (visao.tipo === "pasta" && a.pasta_id !== visao.id) return false;
      if (visao.tipo === "sem-pasta" && a.pasta_id) return false;
      if (visao.tipo === "arquivadas" && !a.arquivada) return false;
      if ((visao.tipo === "todas" || visao.tipo === "pasta" || visao.tipo === "sem-pasta") && a.arquivada) {
        return false;
      }
      // Recortes (chips e busca)
      if (categoria !== "todas" && a.categoria !== categoria) return false;
      if (tagAtiva && !(a.tags ?? []).includes(tagAtiva)) return false;
      if (cursoId && a.curso_id !== cursoId) return false;
      if (!termo) return true;
      return (
        a.titulo.toLowerCase().includes(termo) ||
        a.conteudo_texto.toLowerCase().includes(termo) ||
        (a.tags ?? []).some((t) => t.includes(termo)) ||
        (a.curso_titulo ?? "").toLowerCase().includes(termo) ||
        (a.pasta_nome ?? "").toLowerCase().includes(termo)
      );
    });

    const quando = (x: AnotacaoRich, campo: "atualizado_em" | "criado_em" | "excluida_em") =>
      Date.parse(x[campo] ?? "") || 0;

    return lista.sort((a, b) => {
      if (naLixeira) return quando(b, "excluida_em") - quando(a, "excluida_em");
      if (a.fixada !== b.fixada) return a.fixada ? -1 : 1;
      if (ordem === "alfabetica") {
        return tituloExibido(a).localeCompare(tituloExibido(b), "pt-BR");
      }
      return quando(b, ordem === "criadas" ? "criado_em" : "atualizado_em") -
        quando(a, ordem === "criadas" ? "criado_em" : "atualizado_em");
    });
  }, [fonte, visao, busca, categoria, tagAtiva, cursoId, ordem, naLixeira]);

  // Contagens da barra lateral (sempre sobre as anotações vivas e não arquivadas).
  const vivas = anotacoes.filter((a) => !a.arquivada);
  const contaPasta = (id: string) => vivas.filter((a) => a.pasta_id === id).length;
  const totalSemPasta = vivas.filter((a) => !a.pasta_id).length;
  const totalArquivadas = anotacoes.filter((a) => a.arquivada).length;

  // ---- Ações ----

  function novaAnotacao(cat: CategoriaAnotacao = "ideia") {
    startCriar(async () => {
      const res = await fetch("/api/anotacoes", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          categoria: cat,
          curso_id: cursoId || null,
          // Criar dentro de uma pasta aberta já deixa a anotação lá.
          pasta_id: visao.tipo === "pasta" ? visao.id : null,
          tags: tagAtiva ? [tagAtiva] : [],
        }),
      });
      if (!res.ok) return;
      const { anotacao } = (await res.json()) as { anotacao: { id: string } };
      router.push(`/anotacoes/${anotacao.id}`);
    });
  }

  async function patch(id: string, corpo: Record<string, unknown>) {
    await fetch(`/api/anotacoes/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(corpo),
    });
    router.refresh();
  }

  async function paraLixeira(id: string) {
    await fetch(`/api/anotacoes/${id}`, { method: "DELETE" });
    router.refresh();
  }

  async function excluirDeVez(id: string) {
    await fetch(`/api/anotacoes/${id}?definitivo=1`, { method: "DELETE" });
    router.refresh();
  }

  async function esvaziarLixeira() {
    await fetch("/api/anotacoes/lixeira", { method: "DELETE" });
    setConfirmarEsvaziar(false);
    router.refresh();
  }

  async function criarPasta() {
    const nome = nomePasta.trim();
    if (!nome) return;
    const res = await fetch("/api/anotacoes/pastas", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ nome, cor: corPasta }),
    });
    if (res.ok) {
      const { pasta } = (await res.json()) as { pasta: PastaAnotacao };
      setPastas((ps) => (ps.some((p) => p.id === pasta.id) ? ps : [...ps, pasta]));
      setVisao({ tipo: "pasta", id: pasta.id });
    }
    setNomePasta("");
    setCriandoPasta(false);
    router.refresh();
  }

  async function renomearPasta(id: string, nome: string) {
    const limpo = nome.trim();
    setRenomeando(null);
    if (!limpo) return;
    const res = await fetch(`/api/anotacoes/pastas/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ nome: limpo }),
    });
    if (res.ok) {
      setPastas((ps) => ps.map((p) => (p.id === id ? { ...p, nome: limpo } : p)));
    }
    router.refresh();
  }

  async function excluirPasta(id: string) {
    await fetch(`/api/anotacoes/pastas/${id}`, { method: "DELETE" });
    setPastas((ps) => ps.filter((p) => p.id !== id));
    if (visao.tipo === "pasta" && visao.id === id) setVisao({ tipo: "todas" });
    router.refresh();
  }

  // Link da folha de impressão respeitando o que está na tela.
  const hrefImprimir = (() => {
    const p = new URLSearchParams();
    if (categoria !== "todas") p.set("categoria", categoria);
    if (cursoId) p.set("curso", cursoId);
    if (tagAtiva) p.set("tag", tagAtiva);
    if (visao.tipo === "pasta") p.set("pasta", visao.id);
    if (visao.tipo === "arquivadas") p.set("arquivadas", "1");
    const qs = p.toString();
    return `/anotacoes/imprimir${qs ? `?${qs}` : ""}`;
  })();

  const tituloVisao =
    visao.tipo === "todas"
      ? "Todas as anotações"
      : visao.tipo === "pasta"
        ? pastas.find((p) => p.id === visao.id)?.nome ?? "Pasta"
        : visao.tipo === "sem-pasta"
          ? "Sem pasta"
          : visao.tipo === "arquivadas"
            ? "Arquivadas"
            : "Lixeira";

  return (
    <div className="grid gap-6 lg:grid-cols-[210px_1fr]">
      {/* ================= BARRA LATERAL ================= */}
      <aside className="lg:sticky lg:top-24 lg:self-start">
        <nav className="flex gap-1.5 overflow-x-auto pb-2 lg:flex-col lg:overflow-visible lg:pb-0">
          <ItemLateral
            ativo={visao.tipo === "todas"}
            onClick={() => setVisao({ tipo: "todas" })}
            icone="📓"
            contagem={vivas.length}
          >
            Todas
          </ItemLateral>

          {pastas.map((pasta) => (
            <div key={pasta.id} className="group/pasta relative flex-none lg:flex-auto">
              {renomeando === pasta.id ? (
                <input
                  autoFocus
                  defaultValue={pasta.nome}
                  onBlur={(e) => renomearPasta(pasta.id, e.target.value)}
                  onKeyDown={(e) => {
                    if (e.key === "Enter") renomearPasta(pasta.id, e.currentTarget.value);
                    if (e.key === "Escape") setRenomeando(null);
                  }}
                  className="w-full rounded-lg border border-laranja-300 px-2.5 py-1.5 text-xs outline-none"
                />
              ) : (
                <>
                  <ItemLateral
                    ativo={visao.tipo === "pasta" && visao.id === pasta.id}
                    onClick={() => setVisao({ tipo: "pasta", id: pasta.id })}
                    corPonto={CORES[pasta.cor]?.acento}
                    contagem={contaPasta(pasta.id)}
                  >
                    {pasta.nome}
                  </ItemLateral>
                  <span className="absolute right-1 top-1/2 hidden -translate-y-1/2 gap-0.5 group-hover/pasta:flex lg:flex lg:opacity-0 lg:group-hover/pasta:opacity-100">
                    <button
                      onClick={() => setRenomeando(pasta.id)}
                      title="Renomear pasta"
                      className="rounded bg-white/80 px-1 text-[10px] hover:bg-white"
                    >
                      ✏️
                    </button>
                    <button
                      onClick={() => excluirPasta(pasta.id)}
                      title="Excluir pasta (as anotações voltam para 'Sem pasta')"
                      className="rounded bg-white/80 px-1 text-[10px] hover:bg-white"
                    >
                      ✕
                    </button>
                  </span>
                </>
              )}
            </div>
          ))}

          {totalSemPasta > 0 && pastas.length > 0 && (
            <ItemLateral
              ativo={visao.tipo === "sem-pasta"}
              onClick={() => setVisao({ tipo: "sem-pasta" })}
              icone="📄"
              contagem={totalSemPasta}
            >
              Sem pasta
            </ItemLateral>
          )}

          {criandoPasta ? (
            <div className="flex-none rounded-lg border border-laranja-300 bg-white p-2 lg:flex-auto">
              <input
                autoFocus
                value={nomePasta}
                onChange={(e) => setNomePasta(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === "Enter") criarPasta();
                  if (e.key === "Escape") setCriandoPasta(false);
                }}
                placeholder="Nome da pasta"
                maxLength={60}
                className="mb-2 w-full rounded border border-mesa-200 px-2 py-1 text-xs outline-none focus:border-laranja-400"
              />
              <div className="mb-2 flex gap-1">
                {CORES_ORDEM.map((c) => (
                  <button
                    key={c}
                    onClick={() => setCorPasta(c)}
                    title={CORES[c].rotulo}
                    className={`h-4 w-4 rounded-full border ${corPasta === c ? "ring-2 ring-mesa-400" : ""}`}
                    style={{ background: CORES[c].acento, borderColor: CORES[c].borda }}
                  />
                ))}
              </div>
              <div className="flex gap-1">
                <button
                  onClick={criarPasta}
                  className="flex-1 rounded bg-laranja-500 px-2 py-1 text-[11px] font-semibold text-white hover:bg-laranja-600"
                >
                  Criar
                </button>
                <button
                  onClick={() => setCriandoPasta(false)}
                  className="rounded border border-mesa-200 px-2 py-1 text-[11px] text-mesa-600"
                >
                  ✕
                </button>
              </div>
            </div>
          ) : (
            <button
              onClick={() => setCriandoPasta(true)}
              className="flex-none rounded-lg border border-dashed border-mesa-300 px-3 py-2 text-left text-xs font-medium text-mesa-500 transition hover:border-laranja-300 hover:text-laranja-600 lg:flex-auto"
            >
              + Nova pasta
            </button>
          )}

          <div className="hidden h-px bg-mesa-200 lg:my-2 lg:block" />

          {totalArquivadas > 0 && (
            <ItemLateral
              ativo={visao.tipo === "arquivadas"}
              onClick={() => setVisao({ tipo: "arquivadas" })}
              icone="🗄"
              contagem={totalArquivadas}
            >
              Arquivadas
            </ItemLateral>
          )}

          <ItemLateral
            ativo={naLixeira}
            onClick={() => setVisao({ tipo: "lixeira" })}
            icone="🗑"
            contagem={lixeira.length}
          >
            Lixeira
          </ItemLateral>
        </nav>

        {/* Consulta à Bíblia sem sair do caderno. Aqui só lê e copia — quem
            quer inserir o versículo no texto faz isso dentro da anotação. */}
        <div className="mt-4 rounded-xl border border-mesa-200 bg-white p-2.5">
          <p className="mb-2 px-0.5 text-[10px] font-semibold uppercase tracking-[0.14em] text-mesa-500">
            📖 Bíblia
          </p>
          <BuscaBiblia versoes={versoesBiblia} compacto />
        </div>
      </aside>

      {/* ================= CONTEÚDO ================= */}
      <div className="min-w-0">
        {/* Ações principais */}
        <div className="mb-5 flex flex-wrap items-center gap-2">
          {!naLixeira && (
            <>
              <button
                onClick={() => novaAnotacao()}
                disabled={criando}
                className="rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-60"
              >
                {criando ? "Abrindo…" : "+ Nova anotação"}
              </button>
              {CATEGORIAS.slice(0, 3).map((c) => (
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
              <a
                href={hrefImprimir}
                target="_blank"
                rel="noopener noreferrer"
                className="ml-auto rounded-full border border-mesa-200 bg-white px-3.5 py-2.5 text-xs font-medium text-mesa-700 transition hover:bg-mesa-100"
                title="Gerar um PDF com o que está na tela"
              >
                📄 {visao.tipo === "pasta" ? "Pasta em PDF" : "Caderno em PDF"}
              </a>
            </>
          )}

          {naLixeira && lixeira.length > 0 && (
            <>
              {confirmarEsvaziar ? (
                <div className="flex items-center gap-2 rounded-full border border-erro-200 bg-erro-50 px-3 py-1.5">
                  <span className="text-xs text-erro-600">
                    Apagar {lixeira.length} de vez?
                  </span>
                  <button
                    onClick={esvaziarLixeira}
                    className="rounded-full bg-erro-500 px-3 py-1 text-xs font-semibold text-white hover:bg-erro-600"
                  >
                    Sim, apagar
                  </button>
                  <button
                    onClick={() => setConfirmarEsvaziar(false)}
                    className="text-xs text-mesa-600 hover:text-mesa-900"
                  >
                    Cancelar
                  </button>
                </div>
              ) : (
                <button
                  onClick={() => setConfirmarEsvaziar(true)}
                  className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-erro-500 hover:bg-erro-50"
                >
                  🗑 Esvaziar lixeira
                </button>
              )}
            </>
          )}
        </div>

        {naLixeira && (
          <p className="mb-5 rounded-xl border border-mesa-200 bg-mesa-100/60 px-4 py-3 text-sm leading-relaxed text-mesa-600">
            O que você exclui fica aqui por <strong>{DIAS_LIXEIRA} dias</strong> e pode
            ser restaurado a qualquer momento. Passado esse prazo, some sozinho.
          </p>
        )}

        {/* Busca e filtros */}
        <div className="mb-6 rounded-2xl border border-mesa-200 bg-white p-4">
          <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
            <div className="relative flex-1">
              <span className="pointer-events-none absolute left-3.5 top-1/2 -translate-y-1/2 text-mesa-400">
                🔎
              </span>
              <input
                value={busca}
                onChange={(e) => setBusca(e.target.value)}
                placeholder={`Buscar em ${tituloVisao.toLowerCase()}…`}
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
            {!naLixeira && (
              <select
                value={ordem}
                onChange={(e) => setOrdem(e.target.value as Ordem)}
                className="rounded-xl border border-mesa-200 bg-white px-3 py-2.5 text-xs text-mesa-700 outline-none focus:border-laranja-400"
              >
                <option value="recentes">Editadas recentemente</option>
                <option value="criadas">Mais novas primeiro</option>
                <option value="alfabetica">Ordem alfabética</option>
              </select>
            )}
          </div>

          <div className="mt-3 flex flex-wrap items-center gap-1.5">
            <Chip ativo={categoria === "todas"} onClick={() => setCategoria("todas")}>
              Tudo ({fonte.length})
            </Chip>
            {CATEGORIAS.map((c) => {
              const n = fonte.filter((a) => a.categoria === c.chave).length;
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

        {/* Mural */}
        {filtradas.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-300 bg-white/60 px-6 py-16 text-center">
            <p className="font-serif text-2xl text-mesa-700">
              {naLixeira
                ? "A lixeira está vazia."
                : anotacoes.length === 0
                  ? "Seu caderno está em branco."
                  : visao.tipo === "pasta"
                    ? "Esta pasta ainda está vazia."
                    : "Nada encontrado com esses filtros."}
            </p>
            <p className="mx-auto mt-3 max-w-md text-sm leading-relaxed text-mesa-500">
              {naLixeira
                ? `O que você excluir aparece aqui e fica ${DIAS_LIXEIRA} dias esperando, caso mude de ideia.`
                : anotacoes.length === 0
                  ? "Comece uma anotação de aula, um esboço de pregação, a ideia que apareceu no meio da leitura. Fica tudo aqui, e só você vê."
                  : "Tente outra busca ou limpe os filtros."}
            </p>
            {!naLixeira && (
              <button
                onClick={() => novaAnotacao()}
                className="mt-6 rounded-full bg-laranja-500 px-5 py-2.5 text-sm font-semibold text-white hover:bg-laranja-600"
              >
                + Escrever {visao.tipo === "pasta" ? "nesta pasta" : "a primeira"}
              </button>
            )}
          </div>
        ) : (
          <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
            {filtradas.map((a) => (
              <CardAnotacao
                key={a.id}
                anotacao={a}
                pastas={pastas}
                naLixeira={naLixeira}
                onFixar={() => patch(a.id, { fixada: !a.fixada })}
                onArquivar={() => patch(a.id, { arquivada: !a.arquivada })}
                onMoverPasta={(pastaId) => patch(a.id, { pasta_id: pastaId })}
                onExcluir={() => paraLixeira(a.id)}
                onRestaurar={() => patch(a.id, { restaurar: true })}
                onExcluirDeVez={() => excluirDeVez(a.id)}
              />
            ))}
          </div>
        )}

        {filtradas.length > 0 && (
          <p className="mt-6 text-center text-xs text-mesa-400">
            {filtradas.length} {filtradas.length === 1 ? "anotação" : "anotações"} em{" "}
            {tituloVisao.toLowerCase()}.
          </p>
        )}
      </div>
    </div>
  );
}

function ItemLateral({
  ativo,
  onClick,
  icone,
  corPonto,
  contagem,
  children,
}: {
  ativo: boolean;
  onClick: () => void;
  icone?: string;
  corPonto?: string;
  contagem?: number;
  children: React.ReactNode;
}) {
  return (
    <button
      onClick={onClick}
      className={`flex flex-none items-center gap-2 rounded-lg px-3 py-2 text-left text-xs font-medium transition lg:w-full ${
        ativo
          ? "bg-laranja-50 text-laranja-700 ring-1 ring-laranja-200"
          : "text-mesa-600 hover:bg-mesa-100"
      }`}
    >
      {corPonto ? (
        <span
          className="h-2.5 w-2.5 flex-none rounded-full"
          style={{ background: corPonto }}
          aria-hidden
        />
      ) : (
        <span className="flex-none">{icone}</span>
      )}
      <span className="min-w-0 flex-1 truncate">{children}</span>
      {contagem !== undefined && contagem > 0 && (
        <span className="flex-none text-[10px] text-mesa-400">{contagem}</span>
      )}
    </button>
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
  pastas,
  naLixeira,
  onFixar,
  onArquivar,
  onMoverPasta,
  onExcluir,
  onRestaurar,
  onExcluirDeVez,
}: {
  anotacao: AnotacaoRich;
  pastas: PastaAnotacao[];
  naLixeira: boolean;
  onFixar: () => void;
  onArquivar: () => void;
  onMoverPasta: (pastaId: string | null) => void;
  onExcluir: () => void;
  onRestaurar: () => void;
  onExcluirDeVez: () => void;
}) {
  const [menuPasta, setMenuPasta] = useState(false);
  const [confirmar, setConfirmar] = useState(false);

  const cor = CORES[anotacao.cor] ?? CORES.areia;
  const cat = CATEGORIA_MAP.get(anotacao.categoria);
  const previa = resumir(anotacao.conteudo_texto, 180);
  const tarefas = (anotacao.conteudo_html.match(/data-tarefa="[01]"/g) || []).length;
  const feitas = (anotacao.conteudo_html.match(/data-tarefa="1"/g) || []).length;

  const Corpo = (
    <>
      <div className="mb-2 flex flex-wrap items-center gap-2">
        <span className="text-[11px] font-semibold uppercase tracking-[0.12em] text-mesa-500">
          {cat?.emoji} {cat?.rotulo}
        </span>
        {anotacao.fixada && !naLixeira && <span title="Fixada">📌</span>}
        {naLixeira && anotacao.excluida_em && (
          <span className="rounded-full bg-erro-50 px-2 py-0.5 text-[10px] font-semibold text-erro-500">
            🗑 {rotuloExpurgo(anotacao.excluida_em)}
          </span>
        )}
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
    </>
  );

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

      {naLixeira ? (
        // Na lixeira o card não abre o editor: a anotação está fora de uso
        // até ser restaurada.
        <div className="flex-1 px-5 py-4 pl-6 opacity-75">{Corpo}</div>
      ) : (
        <Link href={`/anotacoes/${anotacao.id}`} className="flex-1 px-5 py-4 pl-6">
          {Corpo}
        </Link>
      )}

      <div
        className="flex items-center justify-between gap-2 border-t px-5 py-2.5 pl-6"
        style={{ borderColor: cor.borda }}
      >
        <div className="min-w-0">
          {naLixeira ? (
            <p className="truncate text-[11px] text-mesa-500">
              excluída {anotacao.excluida_em ? tempoRelativo(anotacao.excluida_em) : ""}
            </p>
          ) : (
            <>
              <p className="truncate text-[11px] text-mesa-500">
                {tempoRelativo(anotacao.atualizado_em)}
              </p>
              {(anotacao.pasta_nome || anotacao.curso_titulo) && (
                <p className="truncate text-[11px] text-mesa-400">
                  {anotacao.pasta_nome ? `📁 ${anotacao.pasta_nome}` : `📖 ${anotacao.curso_titulo}`}
                </p>
              )}
            </>
          )}
        </div>

        {naLixeira ? (
          <div className="flex flex-none items-center gap-1">
            <button
              onClick={onRestaurar}
              className="rounded-full border border-mesa-200 bg-white px-2.5 py-1 text-[11px] font-medium text-mesa-700 hover:bg-mesa-100"
            >
              ↩ Restaurar
            </button>
            {confirmar ? (
              <button
                onClick={onExcluirDeVez}
                className="rounded-full bg-erro-500 px-2.5 py-1 text-[11px] font-semibold text-white hover:bg-erro-600"
              >
                Confirmar
              </button>
            ) : (
              <button
                onClick={() => setConfirmar(true)}
                title="Apagar agora, sem esperar os 30 dias"
                className="rounded-md px-1.5 py-1 text-xs text-erro-500 hover:bg-white/70"
              >
                🗑
              </button>
            )}
          </div>
        ) : (
          <div className="flex flex-none items-center gap-1 opacity-0 transition focus-within:opacity-100 group-hover:opacity-100">
            <div className="relative">
              <button
                onClick={() => setMenuPasta((v) => !v)}
                title="Mover para uma pasta"
                className="rounded-md px-1.5 py-1 text-xs hover:bg-white/70"
              >
                📁
              </button>
              {menuPasta && (
                <div className="absolute bottom-8 right-0 z-30 w-44 overflow-hidden rounded-xl border border-mesa-200 bg-white py-1 shadow-xl">
                  <p className="px-3 py-1 text-[10px] font-semibold uppercase tracking-wide text-mesa-400">
                    Mover para
                  </p>
                  {pastas.length === 0 && (
                    <p className="px-3 py-2 text-[11px] text-mesa-500">
                      Você ainda não criou pastas.
                    </p>
                  )}
                  {pastas.map((p) => (
                    <button
                      key={p.id}
                      onClick={() => {
                        onMoverPasta(p.id);
                        setMenuPasta(false);
                      }}
                      className="flex w-full items-center gap-2 px-3 py-1.5 text-left text-xs text-mesa-700 hover:bg-mesa-50"
                    >
                      <span
                        className="h-2 w-2 rounded-full"
                        style={{ background: CORES[p.cor]?.acento }}
                      />
                      <span className="truncate">{p.nome}</span>
                    </button>
                  ))}
                  {anotacao.pasta_id && (
                    <button
                      onClick={() => {
                        onMoverPasta(null);
                        setMenuPasta(false);
                      }}
                      className="w-full border-t border-mesa-100 px-3 py-1.5 text-left text-xs text-mesa-500 hover:bg-mesa-50"
                    >
                      Tirar da pasta
                    </button>
                  )}
                </div>
              )}
            </div>
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
            <button
              onClick={onExcluir}
              title={`Excluir (fica ${DIAS_LIXEIRA} dias na lixeira)`}
              className="rounded-md px-1.5 py-1 text-xs text-erro-500 hover:bg-white/70"
            >
              🗑
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
