"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Destaque } from "@/lib/types";
import { selecaoConsultavel, type Verbete } from "@/lib/dicionario-comum";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

type Cor = "amarelo" | "verde" | "rosa" | "azul";

const CORES: Record<Cor, { bg: string; swatch: string; nome: string }> = {
  amarelo: { bg: "#FEF08A", swatch: "#FACC15", nome: "Amarelo" },
  verde: { bg: "#BBF7D0", swatch: "#4ADE80", nome: "Verde" },
  rosa: { bg: "#FBCFE8", swatch: "#F472B6", nome: "Rosa" },
  azul: { bg: "#BAE6FD", swatch: "#38BDF8", nome: "Azul" },
};
const CORES_ORDEM: Cor[] = ["amarelo", "verde", "rosa", "azul"];

// ---- Detecção de título (linha em CAIXA ALTA, curta, sem minúsculas) ----
function ehTitulo(linha: string): boolean {
  const t = linha.trim();
  if (t.length < 2 || t.length > 70) return false;
  if (t.startsWith("•")) return false;
  if (/[a-zàáâãäçéêëíîïóôõöúûü]/.test(t)) return false; // tem minúscula → não é título
  if (!/[A-ZÀÁÂÃÄÇÉÊËÍÎÏÓÔÕÖÚÛÜ]/.test(t)) return false; // precisa de ao menos 1 maiúscula
  return true;
}

type Faixa = { start: number; end: number };

function faixasDeTitulo(texto: string): Faixa[] {
  const faixas: Faixa[] = [];
  let offset = 0;
  for (const linha of texto.split("\n")) {
    if (ehTitulo(linha)) faixas.push({ start: offset, end: offset + linha.length });
    offset += linha.length + 1; // +1 pelo \n
  }
  return faixas;
}

// ---- Quadros (tabelas/boxes fiéis ao PDF) ----
// Bloco que começa com "[quadro] Título" e tem linhas com colunas separadas
// por " | ". Uma linha só de traços (--- | ---) marca a linha anterior como
// cabeçalho.
function ehQuadro(paragrafo: string): boolean {
  return /^\[quadro\]/i.test(paragrafo.trim());
}

function parseQuadro(paragrafo: string): {
  titulo: string;
  header: string[] | null;
  linhas: string[][];
} {
  const linhasTxt = paragrafo.split("\n");
  const titulo = linhasTxt[0].replace(/^\[quadro\]\s*/i, "").trim();
  const corpo = linhasTxt.slice(1).filter((l) => l.trim() !== "");
  let header: string[] | null = null;
  const linhas: string[][] = [];
  for (const linha of corpo) {
    const cells = linha.split("|").map((c) => c.trim());
    const ehSeparador = cells.every((c) => c === "" || /^-{2,}$/.test(c));
    if (ehSeparador && linhas.length > 0) {
      header = linhas.pop() ?? null;
      continue;
    }
    linhas.push(cells);
  }
  return { titulo, header, linhas };
}

function Quadro({ bloco }: { bloco: string }) {
  const { titulo, header, linhas } = parseQuadro(bloco);
  return (
    <div className="my-6 overflow-hidden rounded-xl border border-mesa-300">
      {titulo && (
        <div className="bg-mesa-100 px-4 py-2.5 text-center text-sm font-semibold uppercase tracking-wide text-mesa-800">
          {titulo}
        </div>
      )}
      <table className="w-full border-collapse text-sm">
        {header && (
          <thead>
            <tr>
              {header.map((c, j) => (
                <th
                  key={j}
                  className="border border-mesa-200 bg-mesa-50 px-3 py-2 text-center font-semibold text-mesa-800"
                >
                  {c}
                </th>
              ))}
            </tr>
          </thead>
        )}
        <tbody>
          {linhas.map((linha, i) => (
            <tr key={i}>
              {linha.map((c, j) => (
                <td
                  key={j}
                  className={`border border-mesa-200 px-3 py-2 align-top text-mesa-700 ${
                    linha.length === 2 && j === 0 ? "font-medium text-mesa-800" : ""
                  }`}
                >
                  {c}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}


// ---- Figuras (gráficos e diagramas do livro original) ----
// Bloco "[figura] /caminho/da/imagem.png | Legenda opcional". Existe porque
// vários livros trazem diagrama que o texto referencia diretamente ("o diagrama
// abaixo representa..."): sem a figura, o leitor cai numa remissão vazia.
function ehFigura(paragrafo: string): boolean {
  return /^\[figura\]/i.test(paragrafo.trim());
}

function Figura({ bloco }: { bloco: string }) {
  const corpo = bloco.trim().replace(/^\[figura\]\s*/i, "");
  const [src, ...resto] = corpo.split("|");
  const legenda = resto.join("|").trim();
  return (
    <figure className="my-6">
      <img
        src={src.trim()}
        alt={legenda || "Figura do livro"}
        className="mx-auto w-full max-w-2xl rounded-xl border border-mesa-300 bg-white p-3"
      />
      {legenda && (
        <figcaption className="mt-2 text-center text-sm text-mesa-600">{legenda}</figcaption>
      )}
    </figure>
  );
}

type Segmento = {
  texto: string;
  titulo: boolean;
  cor?: Cor;
  id?: string;
  comentario?: string | null;
  busca?: boolean;
  buscaIdx?: number;
};

// Normaliza pra busca: sem acento e minúsculo, MANTENDO o tamanho (1 char →
// 1 char) pra os offsets continuarem batendo com o texto original.
function normalizarBusca(s: string): string {
  let out = "";
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    const base = c.normalize("NFD")[0] ?? c;
    out += base.toLowerCase();
  }
  return out;
}

function montarSegmentos(
  texto: string,
  titulos: Faixa[],
  grifos: { start: number; end: number; cor: Cor; id: string; comentario: string | null }[],
  buscas: { start: number; end: number; idx: number }[] = []
): Segmento[] {
  const pontos = new Set<number>([0, texto.length]);
  for (const f of titulos) {
    pontos.add(f.start);
    pontos.add(f.end);
  }
  for (const g of grifos) {
    pontos.add(g.start);
    pontos.add(g.end);
  }
  for (const b of buscas) {
    pontos.add(b.start);
    pontos.add(b.end);
  }
  const ord = [...pontos].filter((p) => p >= 0 && p <= texto.length).sort((a, b) => a - b);
  const segs: Segmento[] = [];
  for (let i = 0; i < ord.length - 1; i++) {
    const s = ord[i];
    const e = ord[i + 1];
    if (e <= s) continue;
    const titulo = titulos.some((f) => f.start <= s && f.end >= e);
    const g = grifos.find((x) => x.start <= s && x.end >= e);
    const b = buscas.find((x) => x.start <= s && x.end >= e);
    segs.push({
      texto: texto.slice(s, e),
      titulo,
      cor: g?.cor,
      id: g?.id,
      comentario: g?.comentario,
      busca: Boolean(b),
      buscaIdx: b?.idx,
    });
  }
  return segs;
}

// offset de caractere de (node, offset) dentro do container (parágrafo)
function offsetNoParagrafo(container: Node, node: Node, offset: number): number {
  const r = document.createRange();
  r.selectNodeContents(container);
  r.setEnd(node, offset);
  return r.toString().length;
}

type ToolbarState =
  | { tipo: "selecao"; x: number; y: number; paragrafo: number; inicio: number; fim: number; texto: string }
  | { tipo: "grifo"; x: number; y: number; id: string; texto: string; comentario: string | null }
  | null;

export function AulaConteudo({
  conteudo,
  aulaId,
  alunoId,
  livroTitulo,
  autor,
  destaquesIniciais,
}: {
  conteudo: string;
  aulaId: string;
  alunoId: string;
  livroTitulo: string;
  autor: string | null;
  destaquesIniciais: Destaque[];
}) {
  // Parágrafos do conteúdo. Os que começam com "[cite] " são citações em
  // bloco (textos bíblicos/citações que o livro destaca) — renderizam como
  // blockquote. O marcador é removido aqui pra não bagunçar os offsets de
  // grifo/busca.
  const paragrafos = conteudo
    .split("\n\n")
    .map((p) =>
      p.startsWith("[cite] ")
        ? { texto: p.slice(7), cite: true }
        : { texto: p, cite: false }
    );
  const [destaques, setDestaques] = useState<Destaque[]>(destaquesIniciais);
  const [toolbar, setToolbar] = useState<ToolbarState>(null);
  const [salvando, setSalvando] = useState(false);
  const [modalTexto, setModalTexto] = useState<string | null>(null);
  // Quando != null, a barra flutuante vira um campo de comentário.
  const [comentEditor, setComentEditor] = useState<string | null>(null);
  // Quando != null, a barra vira o cartão de dicionário da palavra selecionada.
  const [verbete, setVerbete] = useState<{
    palavra: string;
    carregando: boolean;
    dados: Verbete | null;
    erro: string | null;
  } | null>(null);
  // Toque (celular/tablet): a barra fica ancorada embaixo da tela, longe do
  // menu nativo do iOS e com alvos maiores.
  const [toque, setToque] = useState(false);
  // Busca de palavras/frases dentro do capítulo.
  const [busca, setBusca] = useState("");
  const [buscaAtual, setBuscaAtual] = useState(0);
  const containerRef = useRef<HTMLDivElement>(null);

  const termo = busca.trim();
  // Todas as ocorrências do termo, em ordem (parágrafo + offset), ignorando
  // acento e maiúsc/minúsc. Quadros (tabelas) ficam de fora pra manter simples.
  const matches = useMemo(() => {
    const out: { paragrafo: number; start: number; end: number }[] = [];
    if (termo.length < 2) return out;
    const q = normalizarBusca(termo);
    paragrafos.forEach((p, i) => {
      if (ehQuadro(p.texto) || ehFigura(p.texto)) return;
      const np = normalizarBusca(p.texto);
      let from = 0;
      for (;;) {
        const idx = np.indexOf(q, from);
        if (idx === -1) break;
        out.push({ paragrafo: i, start: idx, end: idx + q.length });
        from = idx + q.length;
      }
    });
    return out;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [termo, conteudo]);

  // Mantém o índice atual dentro do intervalo quando a busca muda.
  useEffect(() => {
    setBuscaAtual(0);
  }, [termo]);

  // Rola até a ocorrência ativa.
  useEffect(() => {
    if (!matches.length) return;
    const el = document.getElementById("busca-ativa");
    el?.scrollIntoView({ behavior: "smooth", block: "center" });
  }, [buscaAtual, matches]);

  const irMatch = useCallback(
    (dir: 1 | -1) => {
      setBuscaAtual((a) => {
        if (!matches.length) return 0;
        return (a + dir + matches.length) % matches.length;
      });
    },
    [matches.length]
  );
  // Espelha o comentEditor pra usar dentro do listener de seleção (sem re-bind).
  const comentEditorRef = useRef<string | null>(null);
  useEffect(() => {
    comentEditorRef.current = comentEditor;
  }, [comentEditor]);
  // Idem pro cartão de dicionário: rolar a página não pode fechá-lo no meio da leitura.
  const verbeteRef = useRef(false);
  useEffect(() => {
    verbeteRef.current = verbete !== null;
  }, [verbete]);

  useEffect(() => {
    setToque(window.matchMedia?.("(pointer: coarse)").matches ?? false);
  }, []);

  const esconder = useCallback(() => {
    setToolbar(null);
    setComentEditor(null);
    setVerbete(null);
  }, []);

  useEffect(() => {
    // Não esconder enquanto o campo de nota está aberto: no celular, abrir o
    // teclado dispara scroll/resize e fecharia o campo no exato momento.
    const onScroll = () => {
      if (comentEditorRef.current !== null || verbeteRef.current) return;
      esconder();
    };
    window.addEventListener("scroll", onScroll, true);
    return () => window.removeEventListener("scroll", onScroll, true);
  }, [esconder]);

  // Detecta seleção via `selectionchange` (com debounce). Funciona no toque do
  // celular e no duplo-clique do desktop — onde `mouseup`/`touchend` falhavam
  // porque disparam antes de a seleção final existir.
  useEffect(() => {
    let timer: ReturnType<typeof setTimeout> | null = null;
    const onSelChange = () => {
      if (comentEditorRef.current !== null) return; // não atrapalha digitar a nota
      if (timer) clearTimeout(timer);
      timer = setTimeout(detectarSelecao, 250);
    };
    document.addEventListener("selectionchange", onSelChange);
    return () => {
      document.removeEventListener("selectionchange", onSelChange);
      if (timer) clearTimeout(timer);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Detecta seleção de texto dentro de um parágrafo do conteúdo.
  // NÃO esconde a barra quando a seleção some: no celular, tocar na própria
  // barra desfaz a seleção (dispara selectionchange) e esconder aqui tiraria a
  // barra ANTES do toque registrar. A barra some por ação, scroll ou nova seleção.
  function detectarSelecao() {
    const sel = window.getSelection();
    if (!sel || sel.isCollapsed || sel.rangeCount === 0) return;
    const range = sel.getRangeAt(0);
    const pEl = paragrafoEl(range.startContainer);
    const pElFim = paragrafoEl(range.endContainer);
    if (!pEl || pEl !== pElFim) return; // só seleção dentro de um parágrafo
    const paragrafo = Number(pEl.dataset.paragrafo);
    const inicio = offsetNoParagrafo(pEl, range.startContainer, range.startOffset);
    const fim = offsetNoParagrafo(pEl, range.endContainer, range.endOffset);
    const texto = sel.toString().trim();
    if (!texto || fim <= inicio) return;
    const rect = range.getBoundingClientRect();
    setVerbete(null);
    setToolbar({
      tipo: "selecao",
      x: rect.left + rect.width / 2,
      y: rect.top,
      paragrafo,
      inicio,
      fim,
      texto,
    });
  }

  function paragrafoEl(node: Node | null): HTMLElement | null {
    let el: Node | null = node;
    while (el && el !== containerRef.current) {
      if (el instanceof HTMLElement && el.dataset.paragrafo !== undefined) return el;
      el = el.parentNode;
    }
    return null;
  }

  async function salvarGrifo(cor: Cor, comentario: string | null = null) {
    if (!toolbar || toolbar.tipo !== "selecao") return;
    setSalvando(true);
    const base = {
      aula_id: aulaId,
      aluno_id: alunoId,
      paragrafo: toolbar.paragrafo,
      inicio: toolbar.inicio,
      fim: toolbar.fim,
      texto: toolbar.texto,
      cor,
      comentario,
    };
    if (MOCK) {
      const novo: Destaque = { id: `mock-${Date.now()}`, criado_em: new Date().toISOString(), ...base };
      setDestaques((p) => [...p, novo]);
    } else {
      const supabase = createClient();
      const { data, error } = await supabase
        .from("destaques_aula")
        .insert(base)
        .select()
        .single();
      if (!error && data) setDestaques((p) => [...p, data as Destaque]);
    }
    setSalvando(false);
    window.getSelection()?.removeAllRanges();
    esconder();
  }

  // Salva o comentário do editor flutuante. Numa seleção nova, cria o grifo
  // (cor padrão amarelo) já com o comentário; num grifo existente, só atualiza.
  async function salvarComentario() {
    if (!toolbar || comentEditor === null) return;
    const texto = comentEditor.trim();
    if (toolbar.tipo === "selecao") {
      await salvarGrifo("amarelo", texto || null);
      return;
    }
    const id = toolbar.id;
    setSalvando(true);
    if (!MOCK) {
      const supabase = createClient();
      await supabase.from("destaques_aula").update({ comentario: texto || null }).eq("id", id);
    }
    setDestaques((p) => p.map((d) => (d.id === id ? { ...d, comentario: texto || null } : d)));
    setSalvando(false);
    esconder();
  }

  async function removerGrifo(id: string) {
    if (!MOCK) {
      const supabase = createClient();
      await supabase.from("destaques_aula").delete().eq("id", id);
    }
    setDestaques((p) => p.filter((d) => d.id !== id));
    esconder();
  }

  // Frase em volta do trecho: é o que faz o dicionário explicar o sentido
  // usado ALI, e não um sentido qualquer da palavra.
  function contextoDoTrecho(paragrafo: number, inicio: number, fim: number): string {
    const p = paragrafos[paragrafo]?.texto ?? "";
    return p.slice(Math.max(0, inicio - 160), Math.min(p.length, fim + 160));
  }

  async function consultarSignificado(palavra: string, contexto: string) {
    setComentEditor(null);
    setVerbete({ palavra, carregando: true, dados: null, erro: null });
    try {
      const res = await fetch(
        `/api/dicionario?q=${encodeURIComponent(palavra)}&ctx=${encodeURIComponent(contexto)}`
      );
      const json = await res.json();
      if (!res.ok || !json?.ok) {
        setVerbete({
          palavra,
          carregando: false,
          dados: null,
          erro: typeof json?.erro === "string" ? json.erro : "Não consegui consultar agora.",
        });
        return;
      }
      setVerbete({ palavra, carregando: false, dados: json.verbete as Verbete, erro: null });
    } catch {
      setVerbete({ palavra, carregando: false, dados: null, erro: "Sem conexão com o dicionário." });
    }
  }

  function abrirImagem(texto: string) {
    esconder();
    window.getSelection()?.removeAllRanges();
    setModalTexto(texto);
  }

  return (
    <>
      <p className="mb-4 flex items-center gap-2 rounded-lg bg-mesa-50 px-3 py-2 text-xs text-mesa-500">
        <span>✨</span>
        Selecione um trecho do texto para grifar com uma cor, escrever um comentário ou gerar uma imagem. Selecionou só uma palavra? Toque em “Significado” pra ver o sentido e os sinônimos. Para desfazer, toque no grifo e escolha “Desmarcar”.
      </p>

      {/* Campo de busca de palavras/frases no capítulo */}
      <div className="sticky top-2 z-30 mb-5">
        <div className="flex items-center gap-2 rounded-full border border-mesa-200 bg-white/95 px-3 py-2 shadow-sm backdrop-blur">
          <span className="text-mesa-400" aria-hidden>🔍</span>
          <input
            value={busca}
            onChange={(e) => setBusca(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === "Enter") {
                e.preventDefault();
                irMatch(e.shiftKey ? -1 : 1);
              }
              if (e.key === "Escape") setBusca("");
            }}
            placeholder="Buscar palavra ou frase no capítulo…"
            className="min-w-0 flex-1 bg-transparent text-sm text-mesa-800 outline-none placeholder:text-mesa-400"
          />
          {termo.length >= 2 && (
            <>
              <span className="whitespace-nowrap text-xs font-medium text-mesa-500">
                {matches.length ? `${buscaAtual + 1}/${matches.length}` : "0"}
              </span>
              <button
                onClick={() => irMatch(-1)}
                disabled={!matches.length}
                title="Anterior"
                className="rounded-full px-2 py-1 text-sm text-mesa-600 hover:bg-mesa-100 disabled:opacity-30"
              >
                ↑
              </button>
              <button
                onClick={() => irMatch(1)}
                disabled={!matches.length}
                title="Próxima"
                className="rounded-full px-2 py-1 text-sm text-mesa-600 hover:bg-mesa-100 disabled:opacity-30"
              >
                ↓
              </button>
            </>
          )}
          {busca && (
            <button
              onClick={() => setBusca("")}
              title="Limpar busca"
              className="rounded-full px-2 py-1 text-sm text-mesa-400 hover:bg-mesa-100"
            >
              ✕
            </button>
          )}
        </div>
        {termo.length >= 2 && matches.length === 0 && (
          <p className="mt-1 px-3 text-xs text-mesa-400">Nenhuma ocorrência de “{termo}”.</p>
        )}
      </div>

      <div ref={containerRef} className="prose-mesa">
        {paragrafos.map((paragrafo, i) => {
          if (ehQuadro(paragrafo.texto)) {
            return <Quadro key={i} bloco={paragrafo.texto} />;
          }
          if (ehFigura(paragrafo.texto)) {
            return <Figura key={i} bloco={paragrafo.texto} />;
          }
          const titulos = faixasDeTitulo(paragrafo.texto);
          const grifos = destaques
            .filter((d) => d.paragrafo === i)
            .map((d) => ({ start: d.inicio, end: d.fim, cor: d.cor as Cor, id: d.id, comentario: d.comentario }));
          const matchesP: { start: number; end: number; idx: number }[] = [];
          matches.forEach((m, gi) => {
            if (m.paragrafo === i) matchesP.push({ start: m.start, end: m.end, idx: gi });
          });
          const segs = montarSegmentos(paragrafo.texto, titulos, grifos, matchesP);
          const corpo = (
            <p key={i} data-paragrafo={i} className="whitespace-pre-wrap">
              {segs.map((seg, j) => {
                if (seg.busca) {
                  const ativa = seg.buscaIdx === buscaAtual;
                  return (
                    <mark
                      key={j}
                      id={ativa ? "busca-ativa" : undefined}
                      style={{
                        backgroundColor: seg.cor
                          ? CORES[seg.cor].bg
                          : ativa
                            ? "#FB923C"
                            : "#FED7AA",
                        boxShadow: ativa ? "0 0 0 2px #EA580C" : "0 0 0 1px #FB923C",
                        borderRadius: 3,
                        padding: "0 1px",
                        fontWeight: seg.titulo ? 700 : undefined,
                        color: seg.titulo ? "#2A2724" : undefined,
                      }}
                    >
                      {seg.texto}
                    </mark>
                  );
                }
                if (seg.cor) {
                  return (
                    <mark
                      key={j}
                      title={seg.comentario || undefined}
                      onClick={(e) => {
                        e.stopPropagation();
                        const rect = e.currentTarget.getBoundingClientRect();
                        setToolbar({
                          tipo: "grifo",
                          x: rect.left + rect.width / 2,
                          y: rect.top,
                          id: seg.id!,
                          texto: seg.texto,
                          comentario: seg.comentario ?? null,
                        });
                      }}
                      style={{
                        backgroundColor: CORES[seg.cor].bg,
                        borderRadius: 3,
                        padding: "0 1px",
                        cursor: "pointer",
                        fontWeight: seg.titulo ? 700 : undefined,
                        color: seg.titulo ? "#2A2724" : undefined,
                      }}
                    >
                      {seg.texto}
                      {seg.comentario ? (
                        <sup style={{ fontSize: "0.7em", marginLeft: 1, cursor: "pointer" }} aria-label="tem comentário">💬</sup>
                      ) : null}
                    </mark>
                  );
                }
                if (seg.titulo) {
                  return (
                    <strong key={j} style={{ fontWeight: 700, color: "#2A2724" }}>
                      {seg.texto}
                    </strong>
                  );
                }
                return <span key={j}>{seg.texto}</span>;
              })}
            </p>
          );
          if (paragrafo.cite) {
            return (
              <blockquote
                key={i}
                className="my-5 rounded-r-lg border-l-4 border-laranja-400 bg-mesa-100/70 py-3 pl-5 pr-3 italic text-mesa-700 [&>p]:m-0"
              >
                {corpo}
              </blockquote>
            );
          }
          return corpo;
        })}
      </div>

      {/* Lista "Meus grifos" desta mesa */}
      {destaques.length > 0 && (
        <div className="mt-8 rounded-2xl border border-mesa-200 bg-mesa-50/60 p-5">
          <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Meus grifos nesta mesa
          </p>
          <ul className="space-y-2">
            {destaques.map((d) => (
              <li
                key={d.id}
                className="flex items-start gap-3 rounded-lg border border-mesa-200 bg-white p-3"
              >
                <span
                  className="mt-1 h-3 w-3 flex-none rounded-full"
                  style={{ backgroundColor: CORES[d.cor as Cor]?.swatch }}
                />
                <div className="min-w-0 flex-1">
                  <p className="text-sm text-mesa-700">{d.texto}</p>
                  {d.comentario && (
                    <p className="mt-1 flex items-start gap-1 text-xs italic text-mesa-500">
                      <span aria-hidden>💬</span>
                      <span>{d.comentario}</span>
                    </p>
                  )}
                </div>
                <div className="flex flex-none gap-1.5">
                  <button
                    onClick={() => abrirImagem(d.texto)}
                    className="rounded-full border border-mesa-200 bg-white px-3 py-1 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
                    title="Gerar imagem deste trecho"
                  >
                    🖼 Imagem
                  </button>
                  <button
                    onClick={() => removerGrifo(d.id)}
                    className="rounded-full border border-mesa-200 bg-white px-2.5 py-1 text-xs font-medium text-mesa-400 hover:bg-red-50 hover:text-red-600"
                    title="Desmarcar"
                  >
                    ✕
                  </button>
                </div>
              </li>
            ))}
          </ul>
        </div>
      )}

      {/* Barra flutuante — no toque, ancorada embaixo (longe do menu do iOS) */}
      {toolbar && (
        <div
          className={
            toque
              ? "fixed inset-x-0 bottom-0 z-50 flex justify-center px-3 pb-[calc(env(safe-area-inset-bottom)+12px)]"
              : "fixed z-50 -translate-x-1/2 -translate-y-full"
          }
          style={toque ? undefined : { left: toolbar.x, top: toolbar.y - 8 }}
        >
          {verbete ? (
            <div
              className={`${toque ? "w-full max-w-md" : "w-72"} rounded-2xl border border-mesa-200 bg-white p-3 shadow-lg`}
              onMouseDown={(e) => e.preventDefault()}
            >
              <div className="flex items-start justify-between gap-2">
                <p className="text-sm font-semibold text-mesa-800">
                  📖 {verbete.palavra}
                </p>
                <button
                  onClick={esconder}
                  aria-label="Fechar"
                  className="-mr-1 -mt-1 rounded-full px-2 py-0.5 text-sm text-mesa-400 hover:bg-mesa-100"
                >
                  ✕
                </button>
              </div>

              {verbete.carregando ? (
                <p className="mt-2 text-xs text-mesa-500">Consultando o dicionário…</p>
              ) : verbete.erro ? (
                <p className="mt-2 text-xs text-red-600">{verbete.erro}</p>
              ) : verbete.dados ? (
                <>
                  {verbete.dados.classe && (
                    <p className="mt-0.5 text-xs italic text-mesa-400">{verbete.dados.classe}</p>
                  )}
                  {verbete.dados.significado && (
                    <p className="mt-2 text-sm leading-relaxed text-mesa-700">
                      {verbete.dados.significado}
                    </p>
                  )}
                  {verbete.dados.sinonimos.length > 0 && (
                    <div className="mt-2.5">
                      <p className="text-[11px] font-medium uppercase tracking-[0.15em] text-mesa-400">
                        Sinônimos
                      </p>
                      <div className="mt-1 flex flex-wrap gap-1">
                        {verbete.dados.sinonimos.map((sin) => (
                          <span
                            key={sin}
                            className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs text-mesa-700"
                          >
                            {sin}
                          </span>
                        ))}
                      </div>
                    </div>
                  )}
                  {verbete.dados.noTexto && (
                    <p className="mt-2.5 border-t border-mesa-100 pt-2 text-xs leading-relaxed text-mesa-600">
                      <span className="font-medium text-mesa-700">No texto: </span>
                      {verbete.dados.noTexto}
                    </p>
                  )}
                </>
              ) : null}
            </div>
          ) : comentEditor !== null ? (
            <div className={`${toque ? "w-full max-w-md" : "w-64"} rounded-2xl border border-mesa-200 bg-white p-2.5 shadow-lg`}>
              <textarea
                autoFocus
                value={comentEditor}
                onChange={(e) => setComentEditor(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === "Enter" && (e.metaKey || e.ctrlKey)) salvarComentario();
                  if (e.key === "Escape") setComentEditor(null);
                }}
                rows={3}
                placeholder="Escreva seu comentário sobre este trecho…"
                className="w-full resize-none rounded-lg border border-mesa-200 bg-mesa-50 px-2.5 py-2 text-sm text-mesa-800 outline-none focus:border-mesa-400"
              />
              <div className="mt-1.5 flex items-center justify-end gap-1.5">
                <button
                  onClick={() => setComentEditor(null)}
                  className="rounded-full px-2.5 py-1 text-xs font-medium text-mesa-500 hover:bg-mesa-100"
                >
                  Cancelar
                </button>
                <button
                  disabled={salvando}
                  onClick={salvarComentario}
                  className="rounded-full bg-laranja-500 px-3 py-1 text-xs font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-50"
                >
                  {salvando ? "Salvando…" : "Salvar"}
                </button>
              </div>
            </div>
          ) : toolbar.tipo === "grifo" && toolbar.comentario ? (
            <div
              className={`${toque ? "w-full max-w-md" : "w-64"} rounded-2xl border border-mesa-200 bg-white p-2.5 shadow-lg`}
              onMouseDown={(e) => e.preventDefault()}
            >
              <p className="mb-2 flex items-start gap-1 text-sm italic text-mesa-700">
                <span aria-hidden>💬</span>
                <span>{toolbar.comentario}</span>
              </p>
              <div className="flex items-center justify-end gap-1.5">
                <button
                  onClick={() => setComentEditor(toolbar.comentario ?? "")}
                  className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                >
                  ✏️ Editar
                </button>
                <button
                  onClick={() => abrirImagem(toolbar.texto)}
                  className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                >
                  🖼 Imagem
                </button>
                <button
                  onClick={() => removerGrifo(toolbar.id)}
                  className={`rounded-full font-medium text-red-600 hover:bg-red-50 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                >
                  Desmarcar
                </button>
              </div>
            </div>
          ) : (
            <div
              className={`flex items-center gap-1.5 rounded-full border border-mesa-200 bg-white shadow-lg ${toque ? "px-3 py-2" : "px-2 py-1.5"}`}
              onMouseDown={(e) => e.preventDefault()}
            >
              {toolbar.tipo === "selecao" ? (
                <>
                  {CORES_ORDEM.map((cor) => (
                    <button
                      key={cor}
                      disabled={salvando}
                      onClick={() => salvarGrifo(cor)}
                      title={`Marcar (${CORES[cor].nome})`}
                      className={`${toque ? "h-9 w-9" : "h-6 w-6"} rounded-full border border-black/10 transition hover:scale-110 disabled:opacity-50`}
                      style={{ backgroundColor: CORES[cor].swatch }}
                    />
                  ))}
                  <span className="mx-0.5 h-5 w-px bg-mesa-200" />
                  <button
                    onClick={() => setComentEditor("")}
                    className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                  >
                    💬 Comentar
                  </button>
                  {selecaoConsultavel(toolbar.texto) && (
                    <button
                      onClick={() =>
                        consultarSignificado(
                          toolbar.texto,
                          contextoDoTrecho(toolbar.paragrafo, toolbar.inicio, toolbar.fim)
                        )
                      }
                      title="Significado e sinônimos"
                      className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                    >
                      📖 Significado
                    </button>
                  )}
                  <button
                    onClick={() => abrirImagem(toolbar.texto)}
                    className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                  >
                    🖼 Imagem
                  </button>
                  {toque && (
                    <button
                      onClick={esconder}
                      aria-label="Fechar"
                      className="ml-0.5 rounded-full px-3 py-2 text-sm font-medium text-mesa-400 hover:bg-mesa-100"
                    >
                      ✕
                    </button>
                  )}
                </>
              ) : (
                <>
                  <button
                    onClick={() => {
                      const d = destaques.find((x) => x.id === toolbar.id);
                      setComentEditor(d?.comentario ?? "");
                    }}
                    className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                  >
                    💬 Comentar
                  </button>
                  {selecaoConsultavel(toolbar.texto) && (
                    <button
                      onClick={() => {
                        const d = destaques.find((x) => x.id === toolbar.id);
                        consultarSignificado(
                          toolbar.texto,
                          d ? contextoDoTrecho(d.paragrafo, d.inicio, d.fim) : ""
                        );
                      }}
                      title="Significado e sinônimos"
                      className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                    >
                      📖 Significado
                    </button>
                  )}
                  <button
                    onClick={() => abrirImagem(toolbar.texto)}
                    className={`rounded-full font-medium text-mesa-700 hover:bg-mesa-100 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                  >
                    🖼 Imagem
                  </button>
                  <span className="mx-0.5 h-5 w-px bg-mesa-200" />
                  <button
                    onClick={() => removerGrifo(toolbar.id)}
                    className={`rounded-full font-medium text-red-600 hover:bg-red-50 ${toque ? "px-3 py-2 text-sm" : "px-2.5 py-1 text-xs"}`}
                  >
                    Desmarcar
                  </button>
                </>
              )}
            </div>
          )}
        </div>
      )}

      {/* Modal da imagem */}
      {modalTexto && (
        <ImagemModal
          texto={modalTexto}
          livroTitulo={livroTitulo}
          autor={autor}
          onClose={() => setModalTexto(null)}
        />
      )}
    </>
  );
}

type Formato = "feed" | "story";

function imgUrl(
  texto: string,
  livroTitulo: string,
  autor: string | null,
  formato: Formato,
  download = false
): string {
  const params = new URLSearchParams({
    verso: texto,
    ref: livroTitulo,
    f: formato,
  });
  if (autor) params.set("sub", `— ${autor}`);
  if (download) params.set("dl", "1");
  return `/api/og/livre?${params.toString()}`;
}

function ImagemModal({
  texto,
  livroTitulo,
  autor,
  onClose,
}: {
  texto: string;
  livroTitulo: string;
  autor: string | null;
  onClose: () => void;
}) {
  const [formato, setFormato] = useState<Formato>("feed");
  const [estado, setEstado] = useState<"carregando" | "ok" | "erro">("carregando");
  const [blobUrl, setBlobUrl] = useState<string | null>(null);
  const [tentativa, setTentativa] = useState(0);
  const [compartilhando, setCompartilhando] = useState(false);
  const blobRef = useRef<Blob | null>(null);

  // Busca a imagem como blob (estado de carregando/erro confiável; o <img>
  // recebe um object URL, sem depender de timing de onLoad/onError no iOS).
  useEffect(() => {
    let cancelado = false;
    let urlCriada: string | null = null;
    setEstado("carregando");
    setBlobUrl(null);
    blobRef.current = null;
    fetch(imgUrl(texto, livroTitulo, autor, formato, false))
      .then((r) => {
        if (!r.ok) throw new Error("falha");
        return r.blob();
      })
      .then((blob) => {
        if (cancelado) return;
        blobRef.current = blob;
        urlCriada = URL.createObjectURL(blob);
        setBlobUrl(urlCriada);
        setEstado("ok");
      })
      .catch(() => {
        if (!cancelado) setEstado("erro");
      });
    return () => {
      cancelado = true;
      if (urlCriada) URL.revokeObjectURL(urlCriada);
    };
  }, [texto, livroTitulo, autor, formato, tentativa]);

  function baixar() {
    if (!blobUrl) return;
    const a = document.createElement("a");
    a.href = blobUrl;
    a.download = "ekballo-trecho.png";
    document.body.appendChild(a);
    a.click();
    a.remove();
  }

  async function compartilhar() {
    const blob = blobRef.current;
    if (!blob) return;
    setCompartilhando(true);
    try {
      const file = new File([blob], "ekballo-trecho.png", { type: "image/png" });
      const nav = navigator as Navigator & {
        canShare?: (data?: ShareData) => boolean;
      };
      if (nav.canShare && nav.canShare({ files: [file] })) {
        await nav.share({
          files: [file],
          title: livroTitulo,
          text: autor ? `${texto} — ${autor}` : texto,
        });
      } else {
        baixar();
      }
    } catch {
      /* usuário cancelou — ignora */
    } finally {
      setCompartilhando(false);
    }
  }

  return (
    <div
      className="fixed inset-0 z-[60] flex items-center justify-center overflow-y-auto bg-black/70 p-4"
      onClick={onClose}
    >
      <div
        className="my-auto w-full max-w-md rounded-2xl bg-white p-5 shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="mb-4 flex items-center justify-between">
          <p className="text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Imagem do trecho
          </p>
          <button
            onClick={onClose}
            className="text-mesa-400 hover:text-mesa-700"
            aria-label="Fechar"
          >
            ✕
          </button>
        </div>

        {/* Seletor de formato */}
        <div className="mb-4 flex gap-2">
          {[
            { f: "feed" as Formato, rotulo: "Feed (quadrado)" },
            { f: "story" as Formato, rotulo: "Story (vertical)" },
          ].map(({ f, rotulo }) => (
            <button
              key={f}
              onClick={() => setFormato(f)}
              className={`flex-1 rounded-full px-3 py-1.5 text-xs font-medium transition ${
                formato === f
                  ? "bg-mesa-700 text-mesa-50"
                  : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"
              }`}
            >
              {rotulo}
            </button>
          ))}
        </div>

        <div
          className={`relative mx-auto mb-4 w-full overflow-hidden rounded-xl bg-mesa-900 ${
            formato === "story" ? "aspect-[9/16] max-w-[240px]" : "aspect-square"
          }`}
        >
          {estado === "carregando" && (
            <div className="absolute inset-0 flex items-center justify-center text-sm text-mesa-300">
              Gerando imagem…
            </div>
          )}
          {estado === "erro" && (
            <div className="absolute inset-0 flex flex-col items-center justify-center gap-3 px-4 text-center">
              <p className="text-sm text-mesa-200">Não consegui gerar a imagem.</p>
              <button
                onClick={() => setTentativa((t) => t + 1)}
                className="rounded-full bg-white px-4 py-1.5 text-xs font-medium text-mesa-800"
              >
                Tentar de novo
              </button>
            </div>
          )}
          {estado === "ok" && blobUrl && (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={blobUrl}
              alt="Imagem gerada do trecho marcado"
              className="h-full w-full object-cover"
            />
          )}
        </div>

        <div className="flex gap-2">
          <button
            onClick={baixar}
            disabled={estado !== "ok"}
            className="flex-1 rounded-full bg-laranja-500 py-2.5 text-center text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-50"
          >
            Baixar
          </button>
          <button
            onClick={compartilhar}
            disabled={estado !== "ok" || compartilhando}
            className="flex-1 rounded-full border border-mesa-300 bg-white py-2.5 text-center text-sm font-medium text-mesa-700 hover:bg-mesa-50 disabled:opacity-50"
          >
            {compartilhando ? "Abrindo…" : "Compartilhar"}
          </button>
        </div>

        <button
          onClick={onClose}
          className="mt-3 w-full py-1 text-center text-sm font-medium text-mesa-500 hover:text-mesa-700"
        >
          ← Voltar para a mesa
        </button>
      </div>
    </div>
  );
}
