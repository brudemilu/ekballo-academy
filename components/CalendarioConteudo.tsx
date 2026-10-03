"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useEffect, useMemo, useRef, useState } from "react";
import {
  diaDoPost,
  diasDaSemana,
  FORMATOS_IDEIA,
  type FormatoIdeiaCal,
  ideiaVisivel,
  inicioDaSemana,
  somarDias,
} from "@/lib/conteudo-calendario";

/**
 * Calendário semanal do Instagram (aba Calendário de /admin/instagram, issue #189).
 *
 * Mostra, por dia, as IDEIAS (etapa antes do rascunho, tabela conteudo_ideias)
 * e os POSTS reais (instagram_carrosseis: agendado, publicado, com erro).
 * Ideia se move de dia arrastando (desktop) ou pelo campo de data (celular).
 * Post agendado NÃO se arrasta: mudar a hora de um post é publicar em outra
 * hora, e isso fica no estúdio, onde o horário é escolhido de propósito.
 */

export type IdeiaCal = {
  id: string;
  titulo: string;
  nota: string;
  formato: FormatoIdeiaCal;
  data_planejada: string | null;
  carrossel_id: string | null;
  /** Roteiro guardado que a ideia representa (pacote da semana). */
  roteiro_id?: string | null;
};

export type PostCal = {
  id: string;
  status: string;
  tipo?: "carrossel" | "reel";
  legenda: string;
  agendado_para?: string | null;
  publicado_em?: string | null;
};

const ROTULO_FORMATO: Record<FormatoIdeiaCal, { icone: string; nome: string }> = {
  carrossel: { icone: "📚", nome: "Carrossel" },
  reel: { icone: "🎬", nome: "Reel" },
  story: { icone: "⏳", nome: "Story" },
  roteiro: { icone: "🎙️", nome: "Roteiro falado" },
};

const ESTILO_STATUS: Record<string, { txt: string; cls: string }> = {
  agendado: { txt: "Agendado", cls: "border-blue-200 bg-blue-50 text-blue-700" },
  publicado: {
    txt: "Publicado",
    cls: "border-oliveira-200 bg-oliveira-50 text-oliveira-700",
  },
  erro: { txt: "Erro ao publicar", cls: "border-red-200 bg-red-50 text-red-700" },
  rascunho: { txt: "Rascunho", cls: "border-mesa-200 bg-mesa-100 text-mesa-600" },
};

const DIA_SEMANA = ["seg", "ter", "qua", "qui", "sex", "sáb", "dom"];

function rotuloDia(dia: string) {
  const [, m, d] = dia.split("-").map(Number);
  return `${String(d).padStart(2, "0")}/${String(m).padStart(2, "0")}`;
}

function rotuloSemana(segunda: string) {
  const fmt = (dia: string) =>
    new Date(`${dia}T12:00:00Z`).toLocaleDateString("pt-BR", {
      day: "numeric",
      month: "short",
      timeZone: "UTC",
    });
  const domingo = somarDias(segunda, 6);
  return `${fmt(segunda)} – ${fmt(domingo)} de ${domingo.slice(0, 4)}`;
}

function hora(iso?: string | null) {
  if (!iso) return "";
  return new Date(iso).toLocaleTimeString("pt-BR", {
    hour: "2-digit",
    minute: "2-digit",
    timeZone: "America/Sao_Paulo",
  });
}

function primeiraLinha(t: string) {
  return (
    (t || "")
      .split("\n")
      .find((l) => l.trim())
      ?.trim() || "(sem legenda)"
  );
}

function CartaoIdeia({
  ideia,
  arrastando,
  onArrastar,
  onAbrir,
}: {
  ideia: IdeiaCal;
  arrastando: boolean;
  onArrastar: (id: string | null) => void;
  onAbrir: (ideia: IdeiaCal) => void;
}) {
  const f = ROTULO_FORMATO[ideia.formato];
  return (
    <button
      type="button"
      draggable
      onDragStart={(e) => {
        e.dataTransfer.effectAllowed = "move";
        onArrastar(ideia.id);
      }}
      onDragEnd={() => onArrastar(null)}
      onClick={() => onAbrir(ideia)}
      className={`w-full cursor-grab rounded-lg border border-dashed border-laranja-300 bg-laranja-50/60 p-2 text-left transition hover:border-laranja-500 hover:bg-laranja-50 active:cursor-grabbing ${
        arrastando ? "opacity-40" : ""
      }`}
    >
      <span className="text-[10px] font-semibold uppercase tracking-wider text-laranja-700">
        {ideia.carrossel_id
          ? `${f.icone} Rascunho pronto`
          : ideia.roteiro_id
            ? "🎬 Roteiro pronto"
            : `💡 Ideia · ${f.icone} ${f.nome}`}
      </span>
      <span className="mt-0.5 line-clamp-3 block text-sm font-medium leading-snug text-mesa-800">
        {ideia.titulo}
      </span>
    </button>
  );
}

function CartaoPost({ post }: { post: PostCal }) {
  const st = ESTILO_STATUS[post.status] || ESTILO_STATUS.rascunho;
  const quando =
    post.status === "publicado"
      ? post.publicado_em || post.agendado_para
      : post.agendado_para;
  return (
    <Link
      href="/admin/instagram?aba=criar#posts"
      className="block rounded-lg border border-mesa-200 bg-white p-2 transition hover:border-mesa-400 hover:shadow-sm"
    >
      <span
        className={`inline-block rounded-full border px-2 py-0.5 text-[10px] font-semibold ${st.cls}`}
      >
        {st.txt}
        {quando ? ` · ${hora(quando)}` : ""}
      </span>
      <span className="mt-1 line-clamp-2 block text-sm leading-snug text-mesa-700">
        {post.tipo === "reel" ? "🎬 " : "📚 "}
        {primeiraLinha(post.legenda)}
      </span>
    </Link>
  );
}

/** O botão de ação da ideia: muda conforme ela já tem peça pronta ou não. */
function atalhoDaIdeia(ideia: IdeiaCal): { href: string; rotulo: string } {
  if (ideia.carrossel_id)
    return { href: "/admin/instagram?aba=criar#posts", rotulo: "Abrir o rascunho" };
  if (ideia.roteiro_id) {
    return {
      href: `/admin/instagram?aba=roteiros&roteiro=${ideia.roteiro_id}`,
      rotulo: "Abrir o roteiro",
    };
  }
  if (ideia.formato === "roteiro")
    return { href: "/admin/instagram?aba=roteiros", rotulo: "Escrever o roteiro" };
  return { href: `/admin/instagram?ideia=${ideia.id}`, rotulo: "Levar ao estúdio" };
}

export function CalendarioConteudo({
  ideiasIniciais,
  posts,
  hoje,
  semanaInicial,
}: {
  ideiasIniciais: IdeiaCal[];
  posts: PostCal[];
  /** "YYYY-MM-DD" de hoje em SP, calculado no servidor (evita divergência na hidratação). */
  hoje: string;
  /** Dia cuja semana deve abrir (ex.: logo depois de montar um pacote). */
  semanaInicial?: string;
}) {
  const router = useRouter();
  const [segunda, setSegunda] = useState(() => inicioDaSemana(semanaInicial || hoje));
  const [ideias, setIdeias] = useState(ideiasIniciais);
  const [criandoEm, setCriandoEm] = useState<string | "sem-data" | null>(null);
  const [editando, setEditando] = useState<IdeiaCal | null>(null);
  const [arrastando, setArrastando] = useState<string | null>(null);
  const [alvo, setAlvo] = useState<string | null>(null);
  const [erro, setErro] = useState<string | null>(null);

  const dias = useMemo(() => diasDaSemana(segunda), [segunda]);

  // Ideia ligada a post agendado/publicado sai do calendário: quem aparece é
  // o post. Ligada a um rascunho, fica — é ela que dá dia ao rascunho.
  const ideiasSoltas = ideias.filter((i) => ideiaVisivel(i, posts));
  const comIdeia = new Set(ideiasSoltas.map((i) => i.carrossel_id).filter(Boolean));

  const porDia = useMemo(() => {
    const mapa = new Map<string, { ideias: IdeiaCal[]; posts: PostCal[] }>();
    for (const d of dias) mapa.set(d, { ideias: [], posts: [] });
    for (const i of ideiasSoltas) {
      if (i.data_planejada) mapa.get(i.data_planejada)?.ideias.push(i);
    }
    for (const p of posts) {
      const d = diaDoPost(p);
      if (d) mapa.get(d)?.posts.push(p);
    }
    for (const v of mapa.values()) {
      v.posts.sort((a, b) =>
        (a.agendado_para || a.publicado_em || "").localeCompare(
          b.agendado_para || b.publicado_em || "",
        ),
      );
    }
    return mapa;
  }, [dias, ideiasSoltas, posts]);

  const semData = ideiasSoltas.filter((i) => !i.data_planejada);
  // Rascunho que já aparece pela ideia dele não entra de novo em "Sem data".
  const rascunhos = posts.filter((p) => p.status === "rascunho" && !comIdeia.has(p.id));
  const diasComConteudo = dias.filter((d) => {
    const v = porDia.get(d);
    return v && (v.ideias.length || v.posts.length);
  }).length;

  async function chamar(
    metodo: "POST" | "PATCH" | "DELETE",
    corpo?: object,
    id?: string,
  ) {
    setErro(null);
    const url =
      metodo === "DELETE"
        ? `/api/admin/instagram/ideias?id=${id}`
        : "/api/admin/instagram/ideias";
    const res = await fetch(url, {
      method: metodo,
      headers: corpo ? { "Content-Type": "application/json" } : undefined,
      body: corpo ? JSON.stringify(corpo) : undefined,
    });
    const d = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(d?.error || "Falha ao salvar.");
    return d;
  }

  async function criar(dados: Omit<IdeiaCal, "id" | "carrossel_id">) {
    try {
      const { ideia } = await chamar("POST", dados);
      setIdeias((prev) => [ideia, ...prev]);
      setCriandoEm(null);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
    }
  }

  async function atualizar(id: string, patch: Partial<IdeiaCal>) {
    const antes = ideias;
    setIdeias((prev) => prev.map((i) => (i.id === id ? { ...i, ...patch } : i)));
    try {
      await chamar("PATCH", { id, ...patch });
      router.refresh();
      return true;
    } catch (e) {
      setIdeias(antes); // desfaz a mudança otimista
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
      return false;
    }
  }

  async function excluir(id: string) {
    if (!confirm("Excluir esta ideia?")) return;
    const antes = ideias;
    setIdeias((prev) => prev.filter((i) => i.id !== id));
    setEditando(null);
    try {
      await chamar("DELETE", undefined, id);
      router.refresh();
    } catch (e) {
      setIdeias(antes);
      setErro(e instanceof Error ? e.message : "Falha ao excluir.");
    }
  }

  function soltar(dia: string | null) {
    const id = arrastando;
    setArrastando(null);
    setAlvo(null);
    if (!id) return;
    const ideia = ideias.find((i) => i.id === id);
    if (!ideia || ideia.data_planejada === dia) return;
    void atualizar(id, { data_planejada: dia });
  }

  function iniciarOuFimArrasto(id: string | null) {
    setArrastando(id);
    if (!id) setAlvo(null);
  }

  function propsDeAlvo(dia: string | null) {
    const chave = dia ?? "sem-data";
    return {
      onDragOver: (e: React.DragEvent) => {
        if (!arrastando) return;
        e.preventDefault();
        setAlvo(chave);
      },
      onDragLeave: () => setAlvo((a) => (a === chave ? null : a)),
      onDrop: (e: React.DragEvent) => {
        e.preventDefault();
        soltar(dia);
      },
    };
  }

  return (
    <div>
      {/* Navegação da semana */}
      <div className="mb-4 flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={() => setSegunda((s) => somarDias(s, -7))}
            className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-sm text-mesa-700 hover:bg-mesa-100"
            aria-label="Semana anterior"
          >
            ←
          </button>
          <button
            type="button"
            onClick={() => setSegunda(inicioDaSemana(hoje))}
            className="rounded-full border border-mesa-200 bg-white px-4 py-1.5 text-sm font-medium text-mesa-700 hover:bg-mesa-100"
          >
            Esta semana
          </button>
          <button
            type="button"
            onClick={() => setSegunda((s) => somarDias(s, 7))}
            className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-sm text-mesa-700 hover:bg-mesa-100"
            aria-label="Próxima semana"
          >
            →
          </button>
          <h2 className="ml-2 font-serif text-xl font-semibold text-mesa-800">
            {rotuloSemana(segunda)}
          </h2>
        </div>
        <p className="text-sm text-mesa-600">
          <strong className="text-mesa-800">{diasComConteudo} de 7</strong> dias com
          algo planejado
        </p>
      </div>

      {erro && (
        <div
          className="mb-4 rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      {/* Semana: 7 colunas no desktop, lista de dias no celular */}
      <div className="grid gap-3 md:grid-cols-7 md:gap-2">
        {dias.map((dia, i) => {
          const v = porDia.get(dia) || { ideias: [], posts: [] };
          const ehHoje = dia === hoje;
          const passou = dia < hoje;
          return (
            <section
              key={dia}
              {...propsDeAlvo(dia)}
              className={`flex min-h-[9rem] flex-col rounded-xl border p-2 transition ${
                alvo === dia
                  ? "border-laranja-500 bg-laranja-50"
                  : ehHoje
                    ? "border-mesa-700 bg-white shadow-sm"
                    : "border-mesa-200 bg-white/70"
              } ${passou && alvo !== dia ? "opacity-70" : ""}`}
              aria-label={`${DIA_SEMANA[i]} ${rotuloDia(dia)}`}
            >
              <header className="mb-2 flex items-baseline justify-between px-1">
                <span
                  className={`text-xs font-semibold uppercase tracking-wider ${ehHoje ? "text-laranja-700" : "text-mesa-500"}`}
                >
                  {DIA_SEMANA[i]}
                  {ehHoje ? " · hoje" : ""}
                </span>
                <span className="text-xs text-mesa-400">{rotuloDia(dia)}</span>
              </header>
              <div className="flex flex-1 flex-col gap-1.5">
                {v.posts.map((p) => (
                  <CartaoPost key={p.id} post={p} />
                ))}
                {v.ideias.map((ideia) => (
                  <CartaoIdeia
                    key={ideia.id}
                    ideia={ideia}
                    arrastando={arrastando === ideia.id}
                    onArrastar={iniciarOuFimArrasto}
                    onAbrir={setEditando}
                  />
                ))}
              </div>
              <button
                type="button"
                onClick={() => setCriandoEm(dia)}
                className="mt-2 rounded-lg px-2 py-1 text-left text-xs font-medium text-mesa-500 hover:bg-mesa-100 hover:text-mesa-700"
              >
                + Ideia
              </button>
            </section>
          );
        })}
      </div>

      {/* Sem data: ideias soltas + rascunhos */}
      <section
        {...propsDeAlvo(null)}
        className={`mt-6 rounded-xl border p-4 transition ${
          alvo === "sem-data"
            ? "border-laranja-500 bg-laranja-50"
            : "border-mesa-200 bg-white/70"
        }`}
      >
        <div className="mb-3 flex items-center justify-between">
          <h3 className="font-serif text-lg font-semibold text-mesa-800">Sem data</h3>
          <button
            type="button"
            onClick={() => setCriandoEm("sem-data")}
            className="rounded-full border border-mesa-200 bg-white px-3 py-1 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
          >
            + Ideia
          </button>
        </div>
        {semData.length === 0 && rascunhos.length === 0 ? (
          <p className="text-sm text-mesa-500">
            Nada solto. Guarde aqui as ideias que ainda não têm dia; arraste para a
            semana quando decidir.
          </p>
        ) : (
          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
            {semData.map((ideia) => (
              <CartaoIdeia
                key={ideia.id}
                ideia={ideia}
                arrastando={arrastando === ideia.id}
                onArrastar={iniciarOuFimArrasto}
                onAbrir={setEditando}
              />
            ))}
            {rascunhos.map((p) => (
              <CartaoPost key={p.id} post={p} />
            ))}
          </div>
        )}
      </section>

      {criandoEm && (
        <FormIdeia
          titulo="Nova ideia"
          inicial={{
            titulo: "",
            nota: "",
            formato: "carrossel",
            data_planejada: criandoEm === "sem-data" ? null : criandoEm,
          }}
          onCancelar={() => setCriandoEm(null)}
          onSalvar={criar}
        />
      )}

      {editando && (
        <FormIdeia
          titulo="Ideia"
          inicial={editando}
          atalho={atalhoDaIdeia(editando)}
          onCancelar={() => setEditando(null)}
          onExcluir={() => excluir(editando.id)}
          onSalvar={async (dados) => {
            if (await atualizar(editando.id, dados)) setEditando(null);
          }}
        />
      )}
    </div>
  );
}

type DadosIdeia = Omit<IdeiaCal, "id" | "carrossel_id">;

function FormIdeia({
  titulo,
  inicial,
  atalho,
  onCancelar,
  onSalvar,
  onExcluir,
}: {
  titulo: string;
  inicial: DadosIdeia;
  /** Para onde a ideia leva: o estúdio, o rascunho pronto ou o roteiro guardado. */
  atalho?: { href: string; rotulo: string };
  onCancelar: () => void;
  onSalvar: (dados: DadosIdeia) => Promise<void> | void;
  onExcluir?: () => void;
}) {
  const [dados, setDados] = useState<DadosIdeia>({
    titulo: inicial.titulo,
    nota: inicial.nota,
    formato: inicial.formato,
    data_planejada: inicial.data_planejada,
  });
  const [salvando, setSalvando] = useState(false);
  const campoTitulo = useRef<HTMLInputElement>(null);

  // onCancelar chega como função nova a cada render do pai; guardar em ref
  // deixa o efeito rodar UMA vez (senão o foco voltaria ao título a cada tecla).
  const cancelar = useRef(onCancelar);
  cancelar.current = onCancelar;

  // Foco no título ao abrir; Esc fecha (como qualquer diálogo).
  useEffect(() => {
    campoTitulo.current?.focus();
    const tecla = (e: KeyboardEvent) => {
      if (e.key === "Escape") cancelar.current();
    };
    window.addEventListener("keydown", tecla);
    return () => window.removeEventListener("keydown", tecla);
  }, []);

  async function enviar(e: React.FormEvent) {
    e.preventDefault();
    setSalvando(true);
    try {
      await onSalvar(dados);
    } finally {
      setSalvando(false);
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-end justify-center p-4 sm:items-center">
      <button
        type="button"
        aria-label="Fechar"
        onClick={onCancelar}
        className="absolute inset-0 cursor-default bg-mesa-900/40"
      />
      <form
        onSubmit={enviar}
        className="relative w-full max-w-lg rounded-2xl bg-white p-5 shadow-xl"
        role="dialog"
        aria-modal="true"
        aria-label={titulo}
      >
        <h3 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          {titulo}
        </h3>

        <label
          className="mb-1 block text-sm font-medium text-mesa-700"
          htmlFor="ideia-titulo"
        >
          Título
        </label>
        <input
          id="ideia-titulo"
          ref={campoTitulo}
          required
          maxLength={200}
          value={dados.titulo}
          onChange={(e) => setDados({ ...dados, titulo: e.target.value })}
          placeholder="Ex.: Por que discipulado acontece à mesa"
          className="mb-4 w-full rounded-lg border border-mesa-200 px-3 py-2 text-mesa-800 focus:border-laranja-500 focus:outline-none"
        />

        <div className="mb-4 grid grid-cols-2 gap-3">
          <div>
            <label
              className="mb-1 block text-sm font-medium text-mesa-700"
              htmlFor="ideia-formato"
            >
              Formato
            </label>
            <select
              id="ideia-formato"
              value={dados.formato}
              onChange={(e) =>
                setDados({ ...dados, formato: e.target.value as FormatoIdeiaCal })
              }
              className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800"
            >
              {FORMATOS_IDEIA.map((f) => (
                <option key={f} value={f}>
                  {ROTULO_FORMATO[f].icone} {ROTULO_FORMATO[f].nome}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label
              className="mb-1 block text-sm font-medium text-mesa-700"
              htmlFor="ideia-data"
            >
              Dia planejado
            </label>
            <input
              id="ideia-data"
              type="date"
              value={dados.data_planejada || ""}
              onChange={(e) =>
                setDados({ ...dados, data_planejada: e.target.value || null })
              }
              className="w-full rounded-lg border border-mesa-200 px-3 py-2 text-mesa-800"
            />
          </div>
        </div>

        <label
          className="mb-1 block text-sm font-medium text-mesa-700"
          htmlFor="ideia-nota"
        >
          Nota{" "}
          <span className="font-normal text-mesa-400">
            (de onde vem, gancho, versículo…)
          </span>
        </label>
        <textarea
          id="ideia-nota"
          rows={4}
          maxLength={5000}
          value={dados.nota}
          onChange={(e) => setDados({ ...dados, nota: e.target.value })}
          className="mb-5 w-full rounded-lg border border-mesa-200 px-3 py-2 text-mesa-800 focus:border-laranja-500 focus:outline-none"
        />

        <div className="flex flex-wrap items-center justify-between gap-2">
          <div className="flex gap-2">
            {onExcluir && (
              <button
                type="button"
                onClick={onExcluir}
                className="rounded-full px-3 py-2 text-sm text-red-600 hover:bg-red-50"
              >
                Excluir
              </button>
            )}
          </div>
          <div className="flex flex-wrap gap-2">
            <button
              type="button"
              onClick={onCancelar}
              className="rounded-full border border-mesa-200 px-4 py-2 text-sm text-mesa-700 hover:bg-mesa-100"
            >
              Cancelar
            </button>
            {atalho && (
              <Link
                href={atalho.href}
                className="rounded-full border border-laranja-300 px-4 py-2 text-sm font-semibold text-laranja-700 hover:bg-laranja-50"
              >
                {atalho.rotulo} →
              </Link>
            )}
            <button
              type="submit"
              disabled={salvando}
              className="rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60"
            >
              {salvando ? "Salvando…" : "Salvar"}
            </button>
          </div>
        </div>
      </form>
    </div>
  );
}
