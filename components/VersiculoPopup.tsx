"use client";

import { useCallback, useEffect, useLayoutEffect, useRef, useState } from "react";

// =============================================================
// Popup do versículo (issue #282). Montado UMA vez, no layout: escuta o
// clique em qualquer elemento com data-ref-livro (ver TextoComVersiculos e
// AulaConteudo), mostra o trecho numa janela pequena perto da referência e,
// ao fechar, devolve o foco para onde a pessoa estava lendo.
// =============================================================

type Versiculo = { capitulo: number; versiculo: number; texto: string };
type Resposta = {
  ok: boolean;
  erro?: string;
  livro?: { id: number; nome: string };
  versao?: string;
  versoes?: string[];
  cortado?: boolean;
  versiculos?: Versiculo[];
};

type Aberto = {
  livro: string;
  trechos: string;
  rotulo: string;
  ancora: DOMRect;
  origem: HTMLElement;
};

const CHAVE_VERSAO = "ekballo:versao-popup";
const LARGURA = 360;

// A mesma referência aparece várias vezes num livro: não pede de novo.
const cache = new Map<string, Resposta>();

export function VersiculoPopup() {
  const [aberto, setAberto] = useState<Aberto | null>(null);
  const [versao, setVersao] = useState<string>("");
  const [dados, setDados] = useState<Resposta | null>(null);
  const [carregando, setCarregando] = useState(false);
  const [pos, setPos] = useState<{ top: number; left: number } | null>(null);
  const caixaRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    try {
      setVersao(localStorage.getItem(CHAVE_VERSAO) || "");
    } catch {
      // navegador sem localStorage: fica na versão padrão
    }
  }, []);

  const fechar = useCallback(() => {
    setAberto((atual) => {
      atual?.origem.focus({ preventScroll: true });
      return null;
    });
  }, []);

  // Clique (ou Enter/Espaço) numa referência.
  useEffect(() => {
    function abrirDe(alvo: EventTarget | null): boolean {
      const el = (alvo as HTMLElement | null)?.closest?.(
        "[data-ref-livro]",
      ) as HTMLElement | null;
      if (!el) return false;
      const livro = el.dataset.refLivro;
      const trechos = el.dataset.refTrechos;
      if (!livro || !trechos) return false;
      setAberto({
        livro,
        trechos,
        rotulo: (el.textContent || "").trim(),
        ancora: el.getBoundingClientRect(),
        origem: el,
      });
      return true;
    }
    function onClick(e: MouseEvent) {
      // Arrastar para grifar também termina num clique: aí é seleção, não pedido.
      const sel = window.getSelection();
      if (sel && !sel.isCollapsed && sel.toString().trim()) return;
      if (abrirDe(e.target)) e.preventDefault();
    }
    function onKey(e: KeyboardEvent) {
      if (e.key !== "Enter" && e.key !== " ") return;
      if (abrirDe(e.target)) e.preventDefault();
    }
    document.addEventListener("click", onClick);
    document.addEventListener("keydown", onKey);
    return () => {
      document.removeEventListener("click", onClick);
      document.removeEventListener("keydown", onKey);
    };
  }, []);

  // Busca o trecho.
  useEffect(() => {
    if (!aberto) return;
    const chave = `${aberto.livro}|${aberto.trechos}|${versao}`;
    const pronto = cache.get(chave);
    if (pronto) {
      setDados(pronto);
      setCarregando(false);
      return;
    }
    let vivo = true;
    setCarregando(true);
    const qs = new URLSearchParams({ livro: aberto.livro, t: aberto.trechos });
    if (versao) qs.set("versao", versao);
    fetch(`/api/biblia/trecho?${qs}`)
      .then(async (r) => {
        const j = (await r.json().catch(() => ({ ok: false }))) as Resposta;
        if (r.status === 401)
          return { ok: false, erro: "Entre na sua conta para ler o versículo." };
        return j;
      })
      .catch(
        () =>
          ({
            ok: false,
            erro: "Sem conexão agora. Tente de novo em instantes.",
          }) as Resposta,
      )
      .then((j) => {
        if (j.ok) cache.set(chave, j);
        if (!vivo) return;
        setDados(j);
        setCarregando(false);
      });
    return () => {
      vivo = false;
    };
  }, [aberto, versao]);

  // Fecha com Esc, clique fora, rolagem longe e mudança de tamanho da tela.
  useEffect(() => {
    if (!aberto) return;
    function onKey(e: KeyboardEvent) {
      if (e.key !== "Escape") return;
      // Antes de qualquer outro Esc da página (a leitura ao lado também fecha
      // com Esc): fecha só o que está por cima.
      e.stopImmediatePropagation();
      fechar();
    }
    function onDown(e: PointerEvent) {
      const alvo = e.target as Node;
      if (caixaRef.current?.contains(alvo)) return;
      if (aberto?.origem.contains(alvo)) return;
      fechar();
    }
    window.addEventListener("keydown", onKey, true);
    document.addEventListener("pointerdown", onDown);
    window.addEventListener("resize", fechar);
    return () => {
      window.removeEventListener("keydown", onKey, true);
      document.removeEventListener("pointerdown", onDown);
      window.removeEventListener("resize", fechar);
    };
  }, [aberto, fechar]);

  // Posição: logo abaixo da referência; sem espaço embaixo, em cima. No
  // celular vira uma folha presa ao rodapé (pos = null).
  // biome-ignore lint/correctness/useExhaustiveDependencies: dados e carregando mudam a altura da caixa — são o gatilho para reposicionar.
  useLayoutEffect(() => {
    if (!aberto) return;
    const vw = window.innerWidth;
    if (vw < 640) {
      setPos(null);
      return;
    }
    const a = aberto.ancora;
    const altura = caixaRef.current?.offsetHeight ?? 260;
    const left = Math.min(
      Math.max(12, a.left + a.width / 2 - LARGURA / 2),
      vw - LARGURA - 12,
    );
    const embaixo = a.bottom + 8;
    const top =
      embaixo + altura > window.innerHeight - 12 && a.top - altura - 8 > 12
        ? a.top - altura - 8
        : Math.min(embaixo, window.innerHeight - altura - 12);
    setPos({ top: Math.max(12, top), left });
  }, [aberto, dados, carregando]);

  useEffect(() => {
    if (aberto) caixaRef.current?.focus({ preventScroll: true });
  }, [aberto]);

  if (!aberto) return null;

  const versiculos = dados?.versiculos ?? [];
  const variosCapitulos = new Set(versiculos.map((v) => v.capitulo)).size > 1;
  const primeiro = versiculos[0];

  function trocarVersao(v: string) {
    setVersao(v);
    try {
      localStorage.setItem(CHAVE_VERSAO, v);
    } catch {
      // sem localStorage: vale só nesta página
    }
  }

  const estilo: React.CSSProperties = pos
    ? { position: "fixed", top: pos.top, left: pos.left, width: LARGURA }
    : { position: "fixed", left: 0, right: 0, bottom: 0 };

  return (
    <div
      ref={caixaRef}
      role="dialog"
      aria-modal="false"
      aria-label={`Versículo: ${aberto.rotulo}`}
      tabIndex={-1}
      style={estilo}
      className={`z-[200] flex max-h-[min(26rem,70vh)] flex-col border border-mesa-200 bg-white text-left shadow-2xl outline-none ${
        pos ? "rounded-2xl" : "rounded-t-2xl"
      }`}
    >
      <div className="flex items-center gap-2 border-b border-mesa-100 px-4 py-2.5">
        <p className="min-w-0 flex-1 truncate font-serif text-base font-semibold text-mesa-800">
          {dados?.livro && primeiro
            ? aberto.rotulo.replace(/^\d+[.:]/, `${dados.livro.nome} $&`)
            : aberto.rotulo}
        </p>
        {dados?.versoes && dados.versoes.length > 1 && (
          <select
            value={dados.versao}
            onChange={(e) => trocarVersao(e.target.value)}
            aria-label="Versão da Bíblia"
            className="rounded-md border border-mesa-200 bg-mesa-50 px-1.5 py-0.5 text-xs text-mesa-700"
          >
            {dados.versoes.map((v) => (
              <option key={v} value={v}>
                {v}
              </option>
            ))}
          </select>
        )}
        <button
          type="button"
          onClick={fechar}
          aria-label="Fechar"
          className="-mr-1 flex h-8 w-8 items-center justify-center rounded-full text-lg text-mesa-500 hover:bg-mesa-100 hover:text-mesa-800"
        >
          ×
        </button>
      </div>

      <div className="overflow-y-auto px-4 py-3">
        {carregando && !dados ? (
          <p className="text-sm text-mesa-500">Abrindo o versículo…</p>
        ) : dados && !dados.ok ? (
          <p className="text-sm text-mesa-600">
            {dados.erro || "Não foi possível abrir este versículo."}
          </p>
        ) : versiculos.length === 0 ? (
          <p className="text-sm text-mesa-600">
            Este trecho não veio na {dados?.versao}. Tente outra versão ou abra na
            Bíblia.
          </p>
        ) : (
          <div
            lang="pt-BR"
            className={`space-y-1.5 font-serif text-[15px] leading-relaxed text-mesa-800 text-justify hyphens-auto ${
              carregando ? "opacity-60" : ""
            }`}
          >
            {versiculos.map((v, i) => (
              <p key={`${v.capitulo}:${v.versiculo}`}>
                {variosCapitulos &&
                  (i === 0 || versiculos[i - 1].capitulo !== v.capitulo) && (
                    <span className="mr-1 font-sans text-xs font-semibold text-laranja-700">
                      {v.capitulo}
                    </span>
                  )}
                <sup className="mr-1 font-sans text-[10px] font-semibold text-mesa-400">
                  {v.versiculo}
                </sup>
                {v.texto}
              </p>
            ))}
            {dados?.cortado && (
              <p className="font-sans text-xs text-mesa-500">
                O trecho continua na Bíblia.
              </p>
            )}
          </div>
        )}
      </div>

      {primeiro && dados?.livro && (
        <div className="flex items-center justify-between border-t border-mesa-100 px-4 py-2 text-xs">
          <span className="text-mesa-400">{dados.versao}</span>
          <a
            href={`/biblia/${dados.livro.id}/${primeiro.capitulo}?v=${dados.versao}`}
            className="font-medium text-laranja-700 hover:text-laranja-800"
          >
            Abrir o capítulo na Bíblia →
          </a>
        </div>
      )}
    </div>
  );
}
