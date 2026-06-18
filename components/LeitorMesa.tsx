"use client";

import {
  useCallback,
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import { parseMesa, type BlocoMesa } from "@/lib/conteudo-mesa";

type Tema = "claro" | "sepia" | "escuro";
type Modo = "rolagem" | "folhas";

const TEMAS: Record<
  Tema,
  { bg: string; fg: string; muted: string; cite: string; citeBg: string; rule: string; nome: string }
> = {
  claro: { bg: "#FBF8F2", fg: "#2A2520", muted: "#6B6258", cite: "#6E5A38", citeBg: "#F2EAD9", rule: "#E3DAC8", nome: "Claro" },
  sepia: { bg: "#EFE3CC", fg: "#3A2F1E", muted: "#7A6A4F", cite: "#5E4B2A", citeBg: "#E5D6B8", rule: "#D6C5A0", nome: "Sépia" },
  escuro: { bg: "#15130F", fg: "#E7DFD2", muted: "#9C9384", cite: "#CBB88C", citeBg: "#201C15", rule: "#322C22", nome: "Escuro" },
};

const ESCALA_MIN = 0.85;
const ESCALA_MAX = 1.7;
const ESCALA_PASSO = 0.1;
const GAP = 56; // gutter entre folhas

// Preferências globais (valem pra todas as mesas).
const K_TEMA = "leitor:tema";
const K_MODO = "leitor:modo";
const K_ESCALA = "leitor:escala";
const posKey = (aulaId: string) => `leitor:pos:${aulaId}`;

export function LeitorMesa({
  conteudo,
  titulo,
  mesaLabel,
  autor,
  aulaId,
}: {
  conteudo: string;
  titulo: string;
  mesaLabel: string;
  autor: string | null;
  aulaId: string;
}) {
  const [aberto, setAberto] = useState(false);
  const [tema, setTema] = useState<Tema>("claro");
  const [modo, setModo] = useState<Modo>("rolagem");
  const [escala, setEscala] = useState(1);
  const [prefsCarregadas, setPrefsCarregadas] = useState(false);

  const blocos = useMemo(() => parseMesa(conteudo), [conteudo]);
  const t = TEMAS[tema];

  // Carrega preferências salvas (uma vez).
  useEffect(() => {
    try {
      const tm = localStorage.getItem(K_TEMA) as Tema | null;
      const md = localStorage.getItem(K_MODO) as Modo | null;
      const es = parseFloat(localStorage.getItem(K_ESCALA) || "");
      if (tm && TEMAS[tm]) setTema(tm);
      if (md === "rolagem" || md === "folhas") setModo(md);
      if (!Number.isNaN(es) && es >= ESCALA_MIN && es <= ESCALA_MAX) setEscala(es);
    } catch {}
    setPrefsCarregadas(true);
  }, []);

  // Persiste preferências.
  useEffect(() => {
    if (!prefsCarregadas) return;
    try {
      localStorage.setItem(K_TEMA, tema);
      localStorage.setItem(K_MODO, modo);
      localStorage.setItem(K_ESCALA, String(escala));
    } catch {}
  }, [tema, modo, escala, prefsCarregadas]);

  // Trava o scroll do body enquanto o leitor está aberto.
  useEffect(() => {
    if (!aberto) return;
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") setAberto(false);
    };
    window.addEventListener("keydown", onKey);
    return () => {
      document.body.style.overflow = prev;
      window.removeEventListener("keydown", onKey);
    };
  }, [aberto]);

  const cicloTema = () =>
    setTema((c) => (c === "claro" ? "sepia" : c === "sepia" ? "escuro" : "claro"));
  const menosFonte = () => setEscala((e) => Math.max(ESCALA_MIN, +(e - ESCALA_PASSO).toFixed(2)));
  const maisFonte = () => setEscala((e) => Math.min(ESCALA_MAX, +(e + ESCALA_PASSO).toFixed(2)));

  return (
    <>
      <button
        onClick={() => setAberto(true)}
        className="mb-8 inline-flex items-center gap-2 rounded-full border border-mesa-300 bg-white px-5 py-2.5 text-sm font-medium text-mesa-800 shadow-sm transition hover:border-laranja-300 hover:bg-laranja-50"
      >
        📖 Modo leitura
      </button>

      {aberto && (
        <Overlay
          blocos={blocos}
          titulo={titulo}
          mesaLabel={mesaLabel}
          autor={autor}
          aulaId={aulaId}
          tema={tema}
          temaCfg={t}
          modo={modo}
          escala={escala}
          onFechar={() => setAberto(false)}
          onCicloTema={cicloTema}
          onMenos={menosFonte}
          onMais={maisFonte}
          onToggleModo={() => setModo((m) => (m === "rolagem" ? "folhas" : "rolagem"))}
        />
      )}
    </>
  );
}

function Overlay({
  blocos,
  titulo,
  mesaLabel,
  autor,
  aulaId,
  tema,
  temaCfg,
  modo,
  escala,
  onFechar,
  onCicloTema,
  onMenos,
  onMais,
  onToggleModo,
}: {
  blocos: BlocoMesa[];
  titulo: string;
  mesaLabel: string;
  autor: string | null;
  aulaId: string;
  tema: Tema;
  temaCfg: (typeof TEMAS)[Tema];
  modo: Modo;
  escala: number;
  onFechar: () => void;
  onCicloTema: () => void;
  onMenos: () => void;
  onMais: () => void;
  onToggleModo: () => void;
}) {
  const t = temaCfg;
  const fontePx = 19 * escala;

  // ---- progresso + posição salva ----
  const [progresso, setProgresso] = useState(0);
  const restaurado = useRef(false);

  // ---- modo rolagem ----
  const scrollRef = useRef<HTMLDivElement>(null);
  const onScroll = useCallback(() => {
    const el = scrollRef.current;
    if (!el) return;
    const max = el.scrollHeight - el.clientHeight;
    const pct = max > 0 ? el.scrollTop / max : 0;
    setProgresso(pct);
    try {
      localStorage.setItem(posKey(aulaId), JSON.stringify({ modo: "rolagem", pct }));
    } catch {}
  }, [aulaId]);

  // ---- modo folhas ----
  const viewportRef = useRef<HTMLDivElement>(null);
  const colsRef = useRef<HTMLDivElement>(null);
  const [dims, setDims] = useState({ w: 0, h: 0 });
  const [pages, setPages] = useState(1);
  const [page, setPage] = useState(0);

  // Mede o viewport (largura/altura úteis) — refaz no resize/rotação.
  useLayoutEffect(() => {
    if (modo !== "folhas") return;
    const vp = viewportRef.current;
    if (!vp) return;
    const medir = () => setDims({ w: vp.clientWidth, h: vp.clientHeight });
    medir();
    const ro = new ResizeObserver(medir);
    ro.observe(vp);
    return () => ro.disconnect();
  }, [modo]);

  // Conta as folhas a partir da largura real do conteúdo em colunas.
  useLayoutEffect(() => {
    if (modo !== "folhas" || dims.w === 0) return;
    const cols = colsRef.current;
    if (!cols) return;
    const step = dims.w + GAP;
    const n = Math.max(1, Math.round((cols.scrollWidth + GAP) / step));
    setPages(n);
    setPage((p) => Math.min(p, n - 1));
  }, [modo, dims, escala, blocos]);

  // Restaura a posição salva ao abrir (depois de saber tamanhos/folhas).
  useEffect(() => {
    if (restaurado.current) return;
    let pos: { modo?: string; pct?: number; page?: number } | null = null;
    try {
      pos = JSON.parse(localStorage.getItem(posKey(aulaId)) || "null");
    } catch {}
    if (!pos) return;
    if (modo === "rolagem" && scrollRef.current && typeof pos.pct === "number") {
      const el = scrollRef.current;
      const max = el.scrollHeight - el.clientHeight;
      el.scrollTop = max * pos.pct;
      setProgresso(pos.pct);
      restaurado.current = true;
    } else if (modo === "folhas" && pages > 1 && typeof pos.pct === "number") {
      const alvo = Math.round(pos.pct * (pages - 1));
      setPage(Math.min(pages - 1, Math.max(0, alvo)));
      restaurado.current = true;
    }
  }, [modo, pages, aulaId]);

  // Progresso em folhas + salva posição.
  useEffect(() => {
    if (modo !== "folhas") return;
    const pct = pages > 1 ? page / (pages - 1) : 0;
    setProgresso(pct);
    try {
      localStorage.setItem(posKey(aulaId), JSON.stringify({ modo: "folhas", pct, page }));
    } catch {}
  }, [modo, page, pages, aulaId]);

  const irPara = useCallback(
    (n: number) => setPage((p) => Math.min(pages - 1, Math.max(0, n))),
    [pages],
  );

  // Setas do teclado em folhas.
  useEffect(() => {
    if (modo !== "folhas") return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight") irPara(page + 1);
      if (e.key === "ArrowLeft") irPara(page - 1);
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [modo, page, irPara]);

  // Swipe.
  const toque = useRef<{ x: number; y: number } | null>(null);
  const onTouchStart = (e: React.TouchEvent) => {
    toque.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
  };
  const onTouchEnd = (e: React.TouchEvent) => {
    if (!toque.current) return;
    const dx = e.changedTouches[0].clientX - toque.current.x;
    const dy = e.changedTouches[0].clientY - toque.current.y;
    if (Math.abs(dx) > 45 && Math.abs(dx) > Math.abs(dy)) {
      irPara(dx < 0 ? page + 1 : page - 1);
    }
    toque.current = null;
  };

  const conteudoBlocos = (
    <Blocos blocos={blocos} t={t} />
  );

  return (
    <div
      className="fixed inset-0 z-[60] flex flex-col"
      style={{ background: t.bg, color: t.fg }}
    >
      {/* Barra superior */}
      <div
        className="flex items-center gap-2 px-3 py-2.5 sm:px-5"
        style={{ borderBottom: `1px solid ${t.rule}` }}
      >
        <button
          onClick={onFechar}
          aria-label="Fechar leitura"
          className="flex h-9 w-9 flex-none items-center justify-center rounded-full text-lg"
          style={{ color: t.muted }}
        >
          ✕
        </button>
        <div className="min-w-0 flex-1">
          <p className="truncate text-[11px] font-medium uppercase tracking-[0.18em]" style={{ color: t.muted }}>
            {mesaLabel}
          </p>
          <p className="truncate font-serif text-sm font-semibold leading-tight">{titulo}</p>
        </div>

        <div className="flex flex-none items-center gap-1">
          <button
            onClick={onMenos}
            aria-label="Diminuir fonte"
            className="flex h-9 w-9 items-center justify-center rounded-full text-sm"
            style={{ color: t.muted }}
          >
            A−
          </button>
          <button
            onClick={onMais}
            aria-label="Aumentar fonte"
            className="flex h-9 w-9 items-center justify-center rounded-full text-lg"
            style={{ color: t.muted }}
          >
            A+
          </button>
          <button
            onClick={onCicloTema}
            aria-label="Trocar tema"
            className="flex h-9 items-center justify-center rounded-full px-3 text-xs font-medium"
            style={{ border: `1px solid ${t.rule}`, color: t.muted }}
          >
            {t.nome}
          </button>
          <button
            onClick={onToggleModo}
            aria-label="Alternar modo de leitura"
            className="flex h-9 items-center justify-center rounded-full px-3 text-xs font-medium"
            style={{ border: `1px solid ${t.rule}`, color: t.fg }}
          >
            {modo === "rolagem" ? "▥ Folhas" : "▤ Rolagem"}
          </button>
        </div>
      </div>

      {/* Barra de progresso */}
      <div style={{ height: 3, background: t.rule }}>
        <div
          style={{
            height: 3,
            width: `${Math.round(progresso * 100)}%`,
            background: t.cite,
            transition: "width .2s",
          }}
        />
      </div>

      {/* Conteúdo */}
      {modo === "rolagem" ? (
        <div
          ref={scrollRef}
          onScroll={onScroll}
          className="flex-1 overflow-y-auto"
          style={{ fontSize: fontePx, WebkitOverflowScrolling: "touch" }}
        >
          <div className="mx-auto max-w-[680px] px-6 py-10 sm:py-14">
            {conteudoBlocos}
            <div className="mt-12 text-center" style={{ color: t.muted }}>
              <span style={{ fontSize: "1.4em" }}>❧</span>
            </div>
          </div>
        </div>
      ) : (
        <div className="relative flex-1 overflow-hidden">
          <div
            ref={viewportRef}
            className="absolute inset-0 px-6 pt-8 pb-14 sm:px-10"
            onTouchStart={onTouchStart}
            onTouchEnd={onTouchEnd}
            style={{ fontSize: fontePx }}
          >
            <div
              ref={colsRef}
              style={{
                height: "100%",
                columnWidth: dims.w ? dims.w : undefined,
                columnGap: GAP,
                columnFill: "auto",
                transform: `translateX(${-page * (dims.w + GAP)}px)`,
                transition: "transform .32s cubic-bezier(.4,.0,.2,1)",
                willChange: "transform",
              }}
            >
              {conteudoBlocos}
            </div>
          </div>

          {/* Zonas de toque pra virar (laterais), sem cobrir o miolo */}
          <button
            aria-label="Página anterior"
            onClick={() => irPara(page - 1)}
            className="absolute left-0 top-0 h-full w-[18%]"
            style={{ display: page > 0 ? "block" : "none" }}
          />
          <button
            aria-label="Próxima página"
            onClick={() => irPara(page + 1)}
            className="absolute right-0 top-0 h-full w-[18%]"
            style={{ display: page < pages - 1 ? "block" : "none" }}
          />

          {/* Indicador de folha */}
          <div
            className="pointer-events-none absolute inset-x-0 bottom-0 flex items-center justify-center gap-3 py-3 text-xs"
            style={{ color: t.muted }}
          >
            <span>
              folha {page + 1} de {pages}
            </span>
          </div>
        </div>
      )}
    </div>
  );
}

function Blocos({ blocos, t }: { blocos: BlocoMesa[]; t: (typeof TEMAS)[Tema] }) {
  return (
    <>
      {blocos.map((b, i) => {
        if (b.tipo === "titulo") {
          return (
            <h3
              key={i}
              className="mt-8 mb-3 font-serif font-semibold"
              style={{ fontSize: "1.15em", letterSpacing: "0.01em", breakInside: "avoid" }}
            >
              {b.texto}
            </h3>
          );
        }
        if (b.tipo === "cite") {
          return (
            <blockquote
              key={i}
              className="my-5 rounded-r-lg px-4 py-3 font-serif italic"
              style={{
                background: t.citeBg,
                color: t.cite,
                borderLeft: `3px solid ${t.cite}`,
                fontSize: "1.02em",
                breakInside: "avoid",
              }}
            >
              {b.texto}
            </blockquote>
          );
        }
        if (b.tipo === "quadro") {
          return (
            <pre
              key={i}
              className="my-5 overflow-x-auto rounded-lg px-4 py-3 text-[0.85em]"
              style={{ background: t.citeBg, color: t.fg, whiteSpace: "pre-wrap", breakInside: "avoid" }}
            >
              {b.texto.replace(/^\[quadro\]\s*/i, "")}
            </pre>
          );
        }
        // parágrafo
        return (
          <p
            key={i}
            lang="pt-BR"
            className="mb-[0.9em]"
            style={{
              lineHeight: 1.72,
              textAlign: b.lista ? "left" : "justify",
              hyphens: b.lista ? "manual" : "auto",
              WebkitHyphens: b.lista ? "manual" : "auto",
              whiteSpace: b.lista ? "pre-line" : "normal",
            } as React.CSSProperties}
          >
            {b.texto}
          </p>
        );
      })}
    </>
  );
}
