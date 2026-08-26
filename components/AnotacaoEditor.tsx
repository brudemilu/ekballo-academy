"use client";

// =============================================================
// EKBALLO ACADEMY · Tela de edição de uma anotação
//
// Junta o editor rico com o que faz dele um caderno: autosave, organização
// (categoria, cor, tags, vínculo com o livro), compartilhamento com o líder e
// exportação (PDF, Markdown, texto, HTML, área de transferência).
//
// O autosave manda PATCH depois de uma pausa na digitação; enquanto isso, o
// rascunho fica em localStorage — se a rede cair ou a aba morrer, o texto não
// se perde, e ao reabrir a anotação a versão local mais nova é oferecida.
// =============================================================

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { EditorRico } from "@/components/EditorRico";
import { htmlParaTexto, contarPalavras } from "@/lib/sanitizar-html";
import {
  CATEGORIAS,
  CORES,
  CORES_ORDEM,
  anotacaoParaMarkdown,
  htmlParaMarkdown,
  nomeArquivo,
  normalizarTags,
  tituloExibido,
  dataHora,
  DIAS_LIXEIRA,
  rotuloExpurgo,
  type AnotacaoRich,
  type PastaAnotacao,
  type CategoriaAnotacao,
  type CorAnotacao,
} from "@/lib/anotacoes-meta";

type CursoOpcao = { id: string; titulo: string };

type Estado = "limpo" | "pendente" | "salvando" | "salvo" | "erro";

const ESPERA_AUTOSAVE = 1200; // ms de pausa na digitação antes de gravar

const chaveRascunho = (id: string) => `anotacao:rascunho:${id}`;

export function AnotacaoEditor({
  anotacao,
  cursos,
  pastas,
  voltarHref = "/anotacoes",
}: {
  anotacao: AnotacaoRich;
  cursos: CursoOpcao[];
  pastas: PastaAnotacao[];
  voltarHref?: string;
}) {
  const router = useRouter();

  const [titulo, setTitulo] = useState(anotacao.titulo);
  const [html, setHtml] = useState(anotacao.conteudo_html);
  const [categoria, setCategoria] = useState<CategoriaAnotacao>(anotacao.categoria);
  const [cor, setCor] = useState<CorAnotacao>(anotacao.cor);
  const [tags, setTags] = useState<string[]>(anotacao.tags ?? []);
  const [tagDigitando, setTagDigitando] = useState("");
  const [cursoId, setCursoId] = useState(anotacao.curso_id ?? "");
  const [pastaId, setPastaId] = useState(anotacao.pasta_id ?? "");
  const [fixada, setFixada] = useState(anotacao.fixada);
  const [arquivada, setArquivada] = useState(anotacao.arquivada);

  const [estado, setEstado] = useState<Estado>("limpo");
  const [salvoEm, setSalvoEm] = useState<string>(anotacao.atualizado_em);
  const [foco, setFoco] = useState(false);
  const [confirmarExclusao, setConfirmarExclusao] = useState(false);
  const [menuExportar, setMenuExportar] = useState(false);
  const [avisoRascunho, setAvisoRascunho] = useState<string | null>(null);
  // Trocar o conteúdo de um contentEditable pela raiz exige remontar o editor.
  const [remontar, setRemontar] = useState(0);

  // Snapshot do que já está no servidor — é o que decide se há algo a salvar.
  const salvoRef = useRef({
    titulo: anotacao.titulo,
    html: anotacao.conteudo_html,
    categoria: anotacao.categoria as string,
    cor: anotacao.cor as string,
    tags: (anotacao.tags ?? []).join(","),
    cursoId: anotacao.curso_id ?? "",
    pastaId: anotacao.pasta_id ?? "",
    fixada: anotacao.fixada,
    arquivada: anotacao.arquivada,
  });
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const htmlRef = useRef(html);
  htmlRef.current = html;

  const texto = useMemo(() => htmlParaTexto(html), [html]);
  const palavras = contarPalavras(texto);
  const minutos = Math.max(1, Math.round(palavras / 200));

  // ---- Rascunho local: rede de segurança contra queda de rede/aba ----
  useEffect(() => {
    try {
      const bruto = localStorage.getItem(chaveRascunho(anotacao.id));
      if (!bruto) return;
      const local = JSON.parse(bruto) as { html: string; titulo: string; em: string };
      const maisNovo = Date.parse(local.em) > Date.parse(anotacao.atualizado_em) + 2000;
      const diferente =
        local.html !== anotacao.conteudo_html || local.titulo !== anotacao.titulo;
      if (maisNovo && diferente) setAvisoRascunho(local.em);
      else localStorage.removeItem(chaveRascunho(anotacao.id));
    } catch {
      // localStorage bloqueado (aba anônima): segue sem rascunho
    }
  }, [anotacao.id, anotacao.atualizado_em, anotacao.conteudo_html, anotacao.titulo]);

  function restaurarRascunho() {
    try {
      const bruto = localStorage.getItem(chaveRascunho(anotacao.id));
      if (!bruto) return;
      const local = JSON.parse(bruto) as { html: string; titulo: string };
      setTitulo(local.titulo);
      setHtml(local.html);
      setEstado("pendente");
      setAvisoRascunho(null);
      // Remonta o editor com o conteúdo recuperado.
      setRemontar((n) => n + 1);
    } catch {
      setAvisoRascunho(null);
    }
  }

  function descartarRascunho() {
    try {
      localStorage.removeItem(chaveRascunho(anotacao.id));
    } catch {}
    setAvisoRascunho(null);
  }

  // ---- Salvar ----
  const salvar = useCallback(
    async (extra?: Record<string, unknown>) => {
      const atual = {
        titulo,
        html: htmlRef.current,
        categoria: categoria as string,
        cor: cor as string,
        tags: tags.join(","),
        cursoId,
        pastaId,
        fixada,
        arquivada,
      };
      const igual =
        !extra && JSON.stringify(atual) === JSON.stringify(salvoRef.current);
      if (igual) {
        setEstado((e) => (e === "pendente" ? "salvo" : e));
        return;
      }

      setEstado("salvando");
      try {
        const res = await fetch(`/api/anotacoes/${anotacao.id}`, {
          method: "PATCH",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            titulo,
            conteudo_html: htmlRef.current,
            categoria,
            cor,
            tags,
            curso_id: cursoId || null,
            pasta_id: pastaId || null,
            fixada,
            arquivada,
            ...extra,
          }),
        });
        if (!res.ok) throw new Error(String(res.status));
        const { anotacao: salva } = (await res.json()) as { anotacao: AnotacaoRich };
        salvoRef.current = atual;
        setSalvoEm(salva?.atualizado_em ?? new Date().toISOString());
        setEstado("salvo");
        try {
          localStorage.removeItem(chaveRascunho(anotacao.id));
        } catch {}
        router.refresh();
      } catch {
        setEstado("erro");
      }
    },
    [
      anotacao.id, titulo, categoria, cor, tags, cursoId, pastaId,
      fixada, arquivada, router,
    ],
  );

  // Autosave: agenda a gravação a cada mudança e guarda o rascunho na hora.
  useEffect(() => {
    if (estado !== "pendente") return;
    try {
      localStorage.setItem(
        chaveRascunho(anotacao.id),
        JSON.stringify({ html, titulo, em: new Date().toISOString() }),
      );
    } catch {}
    if (timerRef.current) clearTimeout(timerRef.current);
    timerRef.current = setTimeout(() => void salvar(), ESPERA_AUTOSAVE);
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current);
    };
  }, [estado, html, titulo, anotacao.id, salvar]);

  // Mudanças de metadado (categoria, cor, tag…) gravam na hora — são cliques,
  // não digitação, e o feedback tem que ser imediato.
  const marcarPendente = () => setEstado("pendente");

  useEffect(() => {
    function aoSair(e: BeforeUnloadEvent) {
      if (estado === "pendente" || estado === "salvando") {
        e.preventDefault();
        e.returnValue = "";
      }
    }
    window.addEventListener("beforeunload", aoSair);
    return () => window.removeEventListener("beforeunload", aoSair);
  }, [estado]);

  // ---- Exportações ----
  const anotacaoAtual = (): AnotacaoRich => ({
    ...anotacao,
    titulo,
    conteudo_html: html,
    conteudo_texto: texto,
    categoria,
    cor,
    tags,
  });

  function baixar(conteudo: string, arquivo: string, tipo: string) {
    const blob = new Blob([conteudo], { type: `${tipo};charset=utf-8` });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = arquivo;
    document.body.appendChild(a);
    a.click();
    a.remove();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
    setMenuExportar(false);
  }

  const nomeBase = () => tituloExibido({ titulo, conteudo_texto: texto });

  function exportarMarkdown() {
    baixar(anotacaoParaMarkdown(anotacaoAtual()), nomeArquivo(nomeBase(), "md"), "text/markdown");
  }

  function exportarTexto() {
    const cabecalho = `${nomeBase()}\n${"=".repeat(Math.min(nomeBase().length, 60))}\n\n`;
    baixar(cabecalho + texto, nomeArquivo(nomeBase(), "txt"), "text/plain");
  }

  function exportarHtml() {
    const doc = `<!doctype html>
<html lang="pt-BR"><head><meta charset="utf-8">
<title>${nomeBase().replace(/[<>&]/g, "")}</title>
<style>
  body { font-family: Georgia, serif; max-width: 42rem; margin: 3rem auto; padding: 0 1.5rem;
         line-height: 1.7; color: #262320; }
  h1 { font-size: 1.9rem; margin-bottom: .3rem; }
  .meta { color: #7E786F; font-size: .85rem; margin-bottom: 2rem; }
  p { text-align: justify; hyphens: auto; }
  blockquote { border-left: 3px solid #FF5A2C; padding-left: 1rem; font-style: italic; }
  mark[data-cor="amarelo"] { background: #FEF08A; } mark[data-cor="verde"] { background: #BBF7D0; }
  mark[data-cor="rosa"] { background: #FBCFE8; } mark[data-cor="azul"] { background: #BAE6FD; }
  mark[data-cor="laranja"] { background: #FFDECF; }
  li[data-tarefa="1"] { text-decoration: line-through; color: #7E786F; }
</style></head>
<body><h1>${nomeBase().replace(/[<>&]/g, "")}</h1>
<p class="meta">Ekballo Academy · ${dataHora(salvoEm)}</p>
${html}</body></html>`;
    baixar(doc, nomeArquivo(nomeBase(), "html"), "text/html");
  }

  async function copiar(comoMarkdown: boolean) {
    const conteudo = comoMarkdown ? htmlParaMarkdown(html) : texto;
    try {
      await navigator.clipboard.writeText(conteudo);
      setEstado("salvo");
    } catch {
      // Sem permissão de área de transferência: cai no seletor manual
      window.prompt("Copie o conteúdo:", conteudo);
    }
    setMenuExportar(false);
  }

  async function imprimir() {
    // Garante que o PDF saia com a versão mais recente, não com a última salva.
    await salvar();
    window.open(`/anotacoes/imprimir?id=${anotacao.id}&auto=1`, "_blank", "noopener");
    setMenuExportar(false);
  }

  // ---- Ações do rodapé ----
  async function duplicar() {
    const res = await fetch("/api/anotacoes", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        titulo: `${nomeBase()} (cópia)`,
        conteudo_html: html,
        categoria,
        cor,
        tags,
        curso_id: cursoId || null,
        pasta_id: pastaId || null,
        aula_id: anotacao.aula_id,
      }),
    });
    if (res.ok) {
      const { anotacao: nova } = (await res.json()) as { anotacao: AnotacaoRich };
      router.push(`/anotacoes/${nova.id}`);
    }
  }

  // "Excluir" manda pra lixeira; de lá dá pra restaurar por DIAS_LIXEIRA dias.
  async function excluir() {
    const res = await fetch(`/api/anotacoes/${anotacao.id}`, { method: "DELETE" });
    if (res.ok) {
      try {
        localStorage.removeItem(chaveRascunho(anotacao.id));
      } catch {}
      salvoRef.current = { ...salvoRef.current, html, titulo }; // evita o beforeunload
      setEstado("salvo");
      router.push("/anotacoes");
      router.refresh();
    }
  }

  async function restaurar() {
    await fetch(`/api/anotacoes/${anotacao.id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ restaurar: true }),
    });
    router.refresh();
  }

  function adicionarTag(bruto: string) {
    const novas = normalizarTags([...tags, ...bruto.split(",")]);
    setTags(novas);
    setTagDigitando("");
    marcarPendente();
  }

  const rotuloEstado =
    estado === "salvando"
      ? "Salvando…"
      : estado === "erro"
        ? "Erro ao salvar — tente de novo"
        : estado === "pendente"
          ? "Alterações não salvas"
          : `Salvo · ${dataHora(salvoEm)}`;

  const acento = CORES[cor].acento;

  return (
    <div className={foco ? "fixed inset-0 z-50 overflow-y-auto bg-mesa-50" : ""}>
      <div className={foco ? "mx-auto max-w-3xl px-4 py-8" : ""}>
        {/* ---- Barra superior ---- */}
        <div className="mb-5 flex flex-wrap items-center justify-between gap-3">
          <div className="flex items-center gap-3">
            {foco ? (
              <button
                onClick={() => setFoco(false)}
                className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100"
              >
                ✕ Sair do modo foco
              </button>
            ) : (
              <Link
                href={voltarHref}
                className="inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-900"
              >
                ← Meu caderno
              </Link>
            )}
            <span
              className={`inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium ${
                estado === "erro"
                  ? "bg-erro-50 text-erro-600"
                  : estado === "pendente"
                    ? "bg-laranja-50 text-laranja-700"
                    : "bg-mesa-100 text-mesa-600"
              }`}
            >
              {estado === "salvando" && (
                <span className="h-1.5 w-1.5 animate-pulse rounded-full bg-current" />
              )}
              {rotuloEstado}
            </span>
          </div>

          <div className="flex flex-wrap items-center gap-2">
            <button
              onClick={() => {
                setFixada((v) => !v);
                marcarPendente();
              }}
              title={fixada ? "Desafixar" : "Fixar no topo do caderno"}
              className={`rounded-full border px-3 py-2 text-xs font-medium transition ${
                fixada
                  ? "border-laranja-300 bg-laranja-50 text-laranja-700"
                  : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
              }`}
            >
              📌 {fixada ? "Fixada" : "Fixar"}
            </button>

            {!foco && (
              <button
                onClick={() => setFoco(true)}
                title="Modo foco — só você e o texto"
                className="rounded-full border border-mesa-200 bg-white px-3 py-2 text-xs font-medium text-mesa-600 hover:bg-mesa-100"
              >
                🎯 Foco
              </button>
            )}

            {/* Exportar */}
            <div className="relative">
              <button
                onClick={() => setMenuExportar((v) => !v)}
                className="rounded-full border border-mesa-200 bg-white px-3 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
              >
                ⬇ Exportar
              </button>
              {menuExportar && (
                <div className="absolute right-0 top-11 z-40 w-60 overflow-hidden rounded-xl border border-mesa-200 bg-white py-1 shadow-xl">
                  <ItemMenu onClick={imprimir} icone="📄">
                    Salvar em PDF / Imprimir
                  </ItemMenu>
                  <ItemMenu onClick={exportarMarkdown} icone="⬇">
                    Baixar Markdown (.md)
                  </ItemMenu>
                  <ItemMenu onClick={exportarTexto} icone="⬇">
                    Baixar texto (.txt)
                  </ItemMenu>
                  <ItemMenu onClick={exportarHtml} icone="⬇">
                    Baixar página (.html)
                  </ItemMenu>
                  <div className="my-1 border-t border-mesa-100" />
                  <ItemMenu onClick={() => copiar(false)} icone="📋">
                    Copiar texto
                  </ItemMenu>
                  <ItemMenu onClick={() => copiar(true)} icone="📋">
                    Copiar como Markdown
                  </ItemMenu>
                </div>
              )}
            </div>

            <button
              onClick={() => void salvar()}
              disabled={estado === "salvando"}
              className="rounded-full bg-laranja-500 px-4 py-2 text-xs font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-60"
            >
              Salvar
            </button>
          </div>
        </div>

        {anotacao.excluida_em && (
          <div className="mb-4 flex flex-wrap items-center justify-between gap-3 rounded-xl border border-erro-200 bg-erro-50 px-4 py-3">
            <p className="text-sm text-erro-600">
              Esta anotação está na lixeira — {rotuloExpurgo(anotacao.excluida_em)}.
            </p>
            <button
              onClick={restaurar}
              className="rounded-full bg-erro-500 px-3 py-1.5 text-xs font-semibold text-white hover:bg-erro-600"
            >
              ↩ Restaurar
            </button>
          </div>
        )}

        {avisoRascunho && (
          <div className="mb-4 flex flex-wrap items-center justify-between gap-3 rounded-xl border border-laranja-200 bg-laranja-50 px-4 py-3">
            <p className="text-sm text-mesa-700">
              Encontramos um rascunho não salvo deste texto ({dataHora(avisoRascunho)}).
            </p>
            <div className="flex gap-2">
              <button
                onClick={restaurarRascunho}
                className="rounded-full bg-laranja-500 px-3 py-1.5 text-xs font-semibold text-white hover:bg-laranja-600"
              >
                Recuperar
              </button>
              <button
                onClick={descartarRascunho}
                className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-600 hover:bg-mesa-100"
              >
                Descartar
              </button>
            </div>
          </div>
        )}

        <div className={foco ? "" : "grid gap-6 lg:grid-cols-[1fr_260px]"}>
          {/* ---- Coluna do texto ---- */}
          <div>
            <div
              className="mb-4 rounded-2xl border-l-4 bg-white px-5 py-4 shadow-sm"
              style={{ borderLeftColor: acento, borderColor: CORES[cor].borda }}
            >
              <input
                value={titulo}
                onChange={(e) => {
                  setTitulo(e.target.value);
                  marcarPendente();
                }}
                placeholder="Título da anotação"
                maxLength={200}
                className="w-full bg-transparent font-serif text-2xl font-semibold text-mesa-900 outline-none placeholder:text-mesa-300 sm:text-3xl"
              />
              {(anotacao.curso_titulo || anotacao.aula_titulo) && (
                <p className="mt-1.5 text-xs text-mesa-500">
                  {anotacao.curso_slug && anotacao.aula_id ? (
                    <Link
                      href={`/cursos/${anotacao.curso_slug}/aulas/${anotacao.aula_id}`}
                      className="hover:text-laranja-600"
                    >
                      📖 {anotacao.curso_titulo}
                      {anotacao.aula_titulo ? ` · ${anotacao.aula_titulo}` : ""}
                    </Link>
                  ) : (
                    <>📖 {anotacao.curso_titulo}</>
                  )}
                </p>
              )}
            </div>

            <EditorRico
              key={`${anotacao.id}-${remontar}`}
              htmlInicial={anotacao.conteudo_html}
              onChange={(novo) => {
                setHtml(novo);
                setEstado("pendente");
              }}
              onSalvarAtalho={() => void salvar()}
              alturaMinima={foco ? 560 : 460}
              placeholder="Escreva aqui. Dica: “## ” vira título, “- ” vira lista, “[] ” vira tarefa."
            />

            <div className="mt-3 flex flex-wrap items-center justify-between gap-3 px-1 text-xs text-mesa-500">
              <span>
                {palavras} {palavras === 1 ? "palavra" : "palavras"} · {texto.length} caracteres ·
                ~{minutos} min de leitura
              </span>
              <span className="hidden sm:inline">
                Ctrl+S salva · Ctrl+B negrito · Ctrl+K link · Ctrl+Shift+H marca-texto
              </span>
            </div>
          </div>

          {/* ---- Coluna dos metadados ---- */}
          {!foco && (
            <aside className="space-y-5">
              <Bloco titulo="Categoria">
                <div className="flex flex-wrap gap-1.5">
                  {CATEGORIAS.map((c) => (
                    <button
                      key={c.chave}
                      onClick={() => {
                        setCategoria(c.chave);
                        marcarPendente();
                      }}
                      title={c.descricao}
                      className={`rounded-full border px-2.5 py-1 text-xs font-medium transition ${
                        categoria === c.chave
                          ? "border-laranja-300 bg-laranja-50 text-laranja-700"
                          : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
                      }`}
                    >
                      {c.emoji} {c.rotulo}
                    </button>
                  ))}
                </div>
              </Bloco>

              <Bloco titulo="Cor">
                <div className="flex flex-wrap gap-2">
                  {CORES_ORDEM.map((c) => (
                    <button
                      key={c}
                      onClick={() => {
                        setCor(c);
                        marcarPendente();
                      }}
                      title={CORES[c].rotulo}
                      className={`h-7 w-7 rounded-full border-2 transition hover:scale-110 ${
                        cor === c ? "ring-2 ring-mesa-400 ring-offset-2" : ""
                      }`}
                      style={{ background: CORES[c].fundo, borderColor: CORES[c].acento }}
                    />
                  ))}
                </div>
              </Bloco>

              <Bloco titulo="Tags">
                <div className="mb-2 flex flex-wrap gap-1.5">
                  {tags.map((t) => (
                    <span
                      key={t}
                      className="inline-flex items-center gap-1 rounded-full bg-mesa-100 px-2.5 py-1 text-xs text-mesa-700"
                    >
                      #{t}
                      <button
                        onClick={() => {
                          setTags(tags.filter((x) => x !== t));
                          marcarPendente();
                        }}
                        className="text-mesa-400 hover:text-erro-500"
                        aria-label={`Remover tag ${t}`}
                      >
                        ✕
                      </button>
                    </span>
                  ))}
                  {tags.length === 0 && (
                    <span className="text-xs text-mesa-400">Nenhuma tag ainda.</span>
                  )}
                </div>
                <input
                  value={tagDigitando}
                  onChange={(e) => setTagDigitando(e.target.value)}
                  onKeyDown={(e) => {
                    if (e.key === "Enter" || e.key === ",") {
                      e.preventDefault();
                      if (tagDigitando.trim()) adicionarTag(tagDigitando);
                    }
                  }}
                  onBlur={() => tagDigitando.trim() && adicionarTag(tagDigitando)}
                  placeholder="nova tag + Enter"
                  className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-1.5 text-xs outline-none focus:border-laranja-400"
                />
              </Bloco>

              <Bloco titulo="Ligada ao livro">
                <select
                  value={cursoId}
                  onChange={(e) => {
                    setCursoId(e.target.value);
                    marcarPendente();
                  }}
                  className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs text-mesa-700 outline-none focus:border-laranja-400"
                >
                  <option value="">Nenhum (anotação avulsa)</option>
                  {cursos.map((c) => (
                    <option key={c.id} value={c.id}>
                      {c.titulo}
                    </option>
                  ))}
                </select>
              </Bloco>

              <Bloco titulo="Pasta">
                <select
                  value={pastaId}
                  onChange={(e) => {
                    setPastaId(e.target.value);
                    marcarPendente();
                  }}
                  className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs text-mesa-700 outline-none focus:border-laranja-400"
                >
                  <option value="">Sem pasta</option>
                  {pastas.map((p) => (
                    <option key={p.id} value={p.id}>
                      {p.nome}
                    </option>
                  ))}
                </select>
                {pastas.length === 0 && (
                  <p className="mt-2 text-[11px] leading-relaxed text-mesa-400">
                    Crie pastas no caderno para agrupar por curso ou assunto.
                  </p>
                )}
              </Bloco>

              <Bloco titulo="Organização">
                <button
                  onClick={() => {
                    setArquivada((v) => !v);
                    marcarPendente();
                  }}
                  className="mb-2 w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
                >
                  {arquivada ? "↩ Tirar do arquivo" : "🗄 Arquivar"}
                </button>
                <button
                  onClick={duplicar}
                  className="mb-2 w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
                >
                  ⧉ Duplicar
                </button>
                {confirmarExclusao ? (
                  <div className="rounded-lg border border-erro-200 bg-erro-50 p-2.5">
                    <p className="mb-2 text-xs leading-relaxed text-erro-600">
                      Mandar para a lixeira? Fica {DIAS_LIXEIRA} dias lá, dá para
                      restaurar.
                    </p>
                    <div className="flex gap-2">
                      <button
                        onClick={excluir}
                        className="flex-1 rounded-md bg-erro-500 px-2 py-1.5 text-xs font-semibold text-white hover:bg-erro-600"
                      >
                        Excluir
                      </button>
                      <button
                        onClick={() => setConfirmarExclusao(false)}
                        className="flex-1 rounded-md border border-mesa-200 bg-white px-2 py-1.5 text-xs text-mesa-600"
                      >
                        Cancelar
                      </button>
                    </div>
                  </div>
                ) : (
                  <button
                    onClick={() => setConfirmarExclusao(true)}
                    title={`Vai para a lixeira e some sozinha em ${DIAS_LIXEIRA} dias`}
                    className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-xs font-medium text-erro-500 hover:bg-erro-50"
                  >
                    🗑 Excluir
                  </button>
                )}
              </Bloco>

              <p className="px-1 text-[11px] leading-relaxed text-mesa-400">
                Criada em {dataHora(anotacao.criado_em)}.
              </p>
            </aside>
          )}
        </div>
      </div>
    </div>
  );
}

function Bloco({ titulo, children }: { titulo: string; children: React.ReactNode }) {
  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-4">
      <p className="mb-2.5 text-[11px] font-semibold uppercase tracking-[0.14em] text-mesa-500">
        {titulo}
      </p>
      {children}
    </div>
  );
}

function ItemMenu({
  onClick,
  icone,
  children,
}: {
  onClick: () => void;
  icone: string;
  children: React.ReactNode;
}) {
  return (
    <button
      onClick={onClick}
      className="flex w-full items-center gap-2.5 px-3.5 py-2 text-left text-xs text-mesa-700 hover:bg-mesa-50"
    >
      <span className="w-4 text-center">{icone}</span>
      {children}
    </button>
  );
}
