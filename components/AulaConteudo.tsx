"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Destaque } from "@/lib/types";

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

type Segmento = { texto: string; titulo: boolean; cor?: Cor; id?: string };

function montarSegmentos(
  texto: string,
  titulos: Faixa[],
  grifos: { start: number; end: number; cor: Cor; id: string }[]
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
  const ord = [...pontos].filter((p) => p >= 0 && p <= texto.length).sort((a, b) => a - b);
  const segs: Segmento[] = [];
  for (let i = 0; i < ord.length - 1; i++) {
    const s = ord[i];
    const e = ord[i + 1];
    if (e <= s) continue;
    const titulo = titulos.some((f) => f.start <= s && f.end >= e);
    const g = grifos.find((x) => x.start <= s && x.end >= e);
    segs.push({ texto: texto.slice(s, e), titulo, cor: g?.cor, id: g?.id });
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
  | { tipo: "grifo"; x: number; y: number; id: string; texto: string }
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
  const paragrafos = conteudo.split("\n\n");
  const [destaques, setDestaques] = useState<Destaque[]>(destaquesIniciais);
  const [toolbar, setToolbar] = useState<ToolbarState>(null);
  const [salvando, setSalvando] = useState(false);
  const [modalTexto, setModalTexto] = useState<string | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);

  const esconder = useCallback(() => setToolbar(null), []);

  useEffect(() => {
    const onScroll = () => esconder();
    window.addEventListener("scroll", onScroll, true);
    return () => window.removeEventListener("scroll", onScroll, true);
  }, [esconder]);

  // Detecta seleção de texto dentro de um parágrafo do conteúdo.
  function handleSelecao() {
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

  async function salvarGrifo(cor: Cor) {
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

  async function removerGrifo(id: string) {
    if (!MOCK) {
      const supabase = createClient();
      await supabase.from("destaques_aula").delete().eq("id", id);
    }
    setDestaques((p) => p.filter((d) => d.id !== id));
    esconder();
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
        Selecione um trecho do texto para grifar com uma cor ou gerar uma imagem com a frase.
      </p>
      <div
        ref={containerRef}
        className="prose-mesa"
        onMouseUp={handleSelecao}
        onTouchEnd={handleSelecao}
      >
        {paragrafos.map((paragrafo, i) => {
          if (ehQuadro(paragrafo)) {
            return <Quadro key={i} bloco={paragrafo} />;
          }
          const titulos = faixasDeTitulo(paragrafo);
          const grifos = destaques
            .filter((d) => d.paragrafo === i)
            .map((d) => ({ start: d.inicio, end: d.fim, cor: d.cor as Cor, id: d.id }));
          const segs = montarSegmentos(paragrafo, titulos, grifos);
          return (
            <p key={i} data-paragrafo={i} className="whitespace-pre-wrap">
              {segs.map((seg, j) => {
                if (seg.cor) {
                  return (
                    <mark
                      key={j}
                      onClick={(e) => {
                        e.stopPropagation();
                        const rect = e.currentTarget.getBoundingClientRect();
                        setToolbar({
                          tipo: "grifo",
                          x: rect.left + rect.width / 2,
                          y: rect.top,
                          id: seg.id!,
                          texto: seg.texto,
                        });
                      }}
                      style={{
                        backgroundColor: CORES[seg.cor].bg,
                        borderRadius: 3,
                        padding: "0 1px",
                        cursor: "pointer",
                        fontWeight: seg.titulo ? 700 : undefined,
                        color: seg.titulo ? "#5E3D17" : undefined,
                      }}
                    >
                      {seg.texto}
                    </mark>
                  );
                }
                if (seg.titulo) {
                  return (
                    <strong key={j} style={{ fontWeight: 700, color: "#5E3D17" }}>
                      {seg.texto}
                    </strong>
                  );
                }
                return <span key={j}>{seg.texto}</span>;
              })}
            </p>
          );
        })}
      </div>

      {/* Lista "Meus grifos" desta aula */}
      {destaques.length > 0 && (
        <div className="mt-8 rounded-2xl border border-mesa-200 bg-mesa-50/60 p-5">
          <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Meus grifos nesta aula
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
                <p className="min-w-0 flex-1 text-sm text-mesa-700">{d.texto}</p>
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
                    title="Remover grifo"
                  >
                    ✕
                  </button>
                </div>
              </li>
            ))}
          </ul>
        </div>
      )}

      {/* Barra flutuante */}
      {toolbar && (
        <div
          className="fixed z-50 -translate-x-1/2 -translate-y-full"
          style={{ left: toolbar.x, top: toolbar.y - 8 }}
          onMouseDown={(e) => e.preventDefault()}
        >
          <div className="flex items-center gap-1.5 rounded-full border border-mesa-200 bg-white px-2 py-1.5 shadow-lg">
            {toolbar.tipo === "selecao" ? (
              <>
                {CORES_ORDEM.map((cor) => (
                  <button
                    key={cor}
                    disabled={salvando}
                    onClick={() => salvarGrifo(cor)}
                    title={`Marcar (${CORES[cor].nome})`}
                    className="h-6 w-6 rounded-full border border-black/10 transition hover:scale-110 disabled:opacity-50"
                    style={{ backgroundColor: CORES[cor].swatch }}
                  />
                ))}
                <span className="mx-0.5 h-5 w-px bg-mesa-200" />
                <button
                  onClick={() => abrirImagem(toolbar.texto)}
                  className="rounded-full px-2.5 py-1 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
                >
                  🖼 Imagem
                </button>
              </>
            ) : (
              <>
                <button
                  onClick={() => abrirImagem(toolbar.texto)}
                  className="rounded-full px-2.5 py-1 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
                >
                  🖼 Imagem
                </button>
                <span className="mx-0.5 h-5 w-px bg-mesa-200" />
                <button
                  onClick={() => removerGrifo(toolbar.id)}
                  className="rounded-full px-2.5 py-1 text-xs font-medium text-red-600 hover:bg-red-50"
                >
                  Remover
                </button>
              </>
            )}
          </div>
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
            className="flex-1 rounded-full bg-mesa-700 py-2.5 text-center text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:opacity-50"
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
          ← Voltar para a aula
        </button>
      </div>
    </div>
  );
}
