"use client";

// =============================================================
// EKBALLO ACADEMY · Campo de pesquisa da Bíblia
//
// Fica ao lado do texto enquanto o discípulo escreve: acha o versículo pela
// frase ou pela referência e o insere na anotação sem sair da página.
//
// O mesmo campo aceita as duas formas de procurar porque é assim que a
// memória funciona — "jo 3:16" quando se lembra da referência, "porque Deus
// amou" quando só se lembra do texto. Quem decide é o servidor
// (lib/biblia-busca.ts), não o usuário.
// =============================================================

import { useEffect, useRef, useState } from "react";

type Achado = {
  livro_id: number;
  livro_nome: string;
  livro_abrev: string;
  capitulo: number;
  versiculo: number;
  texto: string;
};

type Resposta = {
  ok: boolean;
  tipo: "referencia" | "texto" | "vazio";
  versao: string;
  achados: Achado[];
  referencia?: string;
  /** Ex.: a versão pedida não tem texto para pesquisar. */
  aviso?: string;
};

const ESPERA_BUSCA = 350; // ms parado antes de consultar o servidor

export function BuscaBiblia({
  versoes,
  versaoInicial = "ACF",
  onInserir,
  compacto = false,
}: {
  versoes: { sigla: string; nome: string }[];
  versaoInicial?: string;
  /** Quando existe, cada resultado ganha um botão que joga o texto na anotação. */
  onInserir?: (html: string) => void;
  compacto?: boolean;
}) {
  const [termo, setTermo] = useState("");
  const [versao, setVersao] = useState(versaoInicial);
  const [resultado, setResultado] = useState<Resposta | null>(null);
  const [buscando, setBuscando] = useState(false);
  const [copiado, setCopiado] = useState<string | null>(null);
  // Confirmação visual de que o versículo foi parar no texto.
  const [inserido, setInserido] = useState<string | null>(null);

  // Cada busca cancela a anterior: digitar rápido não pode deixar a resposta
  // de um termo antigo sobrescrever a do termo atual.
  const abortRef = useRef<AbortController | null>(null);

  useEffect(() => {
    const limpo = termo.trim();
    if (limpo.length < 2) {
      setResultado(null);
      setBuscando(false);
      return;
    }

    setBuscando(true);
    const timer = setTimeout(async () => {
      abortRef.current?.abort();
      const ctrl = new AbortController();
      abortRef.current = ctrl;
      try {
        const res = await fetch(
          `/api/biblia/buscar?q=${encodeURIComponent(limpo)}&versao=${versao}`,
          { signal: ctrl.signal },
        );
        if (!res.ok) throw new Error(String(res.status));
        setResultado((await res.json()) as Resposta);
      } catch (e) {
        if ((e as Error).name !== "AbortError") setResultado(null);
      } finally {
        setBuscando(false);
      }
    }, ESPERA_BUSCA);

    return () => clearTimeout(timer);
  }, [termo, versao]);

  function refDe(a: Achado) {
    return `${a.livro_nome} ${a.capitulo}:${a.versiculo}`;
  }

  function htmlDe(achados: Achado[]) {
    const texto = achados.map((a) => a.texto.trim()).join(" ");
    const primeiro = achados[0];
    const ultimo = achados[achados.length - 1];
    const ref =
      achados.length > 1
        ? `${primeiro.livro_nome} ${primeiro.capitulo}:${primeiro.versiculo}-${ultimo.versiculo}`
        : refDe(primeiro);
    // Citação em bloco: é assim que o versículo aparece no meio da anotação,
    // com a referência colada no fim.
    return `<blockquote>${escapar(texto)} <strong>— ${escapar(ref)} (${escapar(
      resultado?.versao ?? versao,
    )})</strong></blockquote><p><br></p>`;
  }

  async function copiar(achados: Achado[]) {
    const primeiro = achados[0];
    const ref =
      achados.length > 1
        ? `${primeiro.livro_nome} ${primeiro.capitulo}:${primeiro.versiculo}-${achados[achados.length - 1].versiculo}`
        : refDe(primeiro);
    const txt = `${achados.map((a) => a.texto.trim()).join(" ")} — ${ref} (${versao})`;
    try {
      await navigator.clipboard.writeText(txt);
      setCopiado(ref);
      setTimeout(() => setCopiado(null), 1600);
    } catch {
      window.prompt("Copie o versículo:", txt);
    }
  }

  const achados = resultado?.achados ?? [];
  const ehReferencia = resultado?.tipo === "referencia";

  return (
    <div>
      <div className="mb-2 flex gap-1.5">
        <div className="relative min-w-0 flex-1">
          <span className="pointer-events-none absolute left-2.5 top-1/2 -translate-y-1/2 text-xs text-mesa-400">
            🔎
          </span>
          <input
            value={termo}
            onChange={(e) => setTermo(e.target.value)}
            placeholder="palavra ou jo 3:16"
            className="w-full rounded-lg border border-mesa-200 bg-white py-1.5 pl-7 pr-2 text-xs outline-none transition focus:border-laranja-400"
          />
        </div>
        {versoes.length > 1 && (
          <select
            value={versao}
            onChange={(e) => setVersao(e.target.value)}
            title="Versão da Bíblia"
            className="rounded-lg border border-mesa-200 bg-white px-1.5 text-[11px] text-mesa-700 outline-none focus:border-laranja-400"
          >
            {versoes.map((v) => (
              <option key={v.sigla} value={v.sigla} title={v.nome}>
                {v.sigla}
              </option>
            ))}
          </select>
        )}
      </div>

      {termo.trim().length >= 2 && (
        <div className={`overflow-y-auto ${compacto ? "max-h-56" : "max-h-80"}`}>
          {buscando && <p className="px-1 py-2 text-[11px] text-mesa-400">Procurando…</p>}

          {!buscando && resultado?.aviso && (
            <p className="mb-1.5 rounded-lg bg-laranja-50 px-2 py-1.5 text-[10px] leading-relaxed text-laranja-700">
              {resultado.aviso}
            </p>
          )}

          {!buscando && achados.length === 0 && (
            <p className="px-1 py-2 text-[11px] leading-relaxed text-mesa-400">
              Nada encontrado. Tente outra palavra ou uma referência como
              &ldquo;sl 23&rdquo;.
            </p>
          )}

          {!buscando && achados.length > 0 && (
            <>
              {ehReferencia && achados.length > 1 && (
                <div className="mb-1.5 flex items-center justify-between gap-2 rounded-lg bg-mesa-100 px-2 py-1.5">
                  <span className="truncate text-[11px] font-medium text-mesa-700">
                    {resultado?.referencia} · {achados.length} versículos
                  </span>
                  {onInserir && (
                    <button
                      onClick={() => onInserir(htmlDe(achados))}
                      className="flex-none rounded-full bg-laranja-500 px-2 py-0.5 text-[10px] font-semibold text-white hover:bg-laranja-600"
                    >
                      inserir trecho
                    </button>
                  )}
                </div>
              )}

              <ul className="space-y-1.5">
                {achados.map((a) => (
                  <li
                    key={`${a.livro_id}-${a.capitulo}-${a.versiculo}`}
                    className="group rounded-lg border border-mesa-200 bg-white p-2 transition hover:border-laranja-300"
                  >
                    <div className="mb-1 flex items-center justify-between gap-1">
                      <span className="truncate text-[10px] font-semibold uppercase tracking-wide text-laranja-700">
                        {refDe(a)}
                      </span>
                      <span className="flex flex-none items-center gap-0.5">
                        {onInserir && (
                          <button
                            onClick={() => {
                              onInserir(htmlDe([a]));
                              setInserido(refDe(a));
                              setTimeout(() => setInserido(null), 1600);
                            }}
                            title="Inserir este versículo no texto da anotação"
                            className="rounded-full bg-laranja-500 px-2 py-0.5 text-[10px] font-semibold text-white transition hover:bg-laranja-600"
                          >
                            {inserido === refDe(a) ? "✓ inserido" : "inserir"}
                          </button>
                        )}
                        <button
                          onClick={() => copiar([a])}
                          title="Copiar"
                          className="rounded px-1 text-[11px] text-mesa-500 hover:bg-mesa-100"
                        >
                          {copiado === refDe(a) ? "✓" : "⧉"}
                        </button>
                        <a
                          href={`/biblia/${a.livro_id}/${a.capitulo}${
                            versao !== "ACF" ? `?v=${versao}` : ""
                          }`}
                          target="_blank"
                          rel="noopener noreferrer"
                          title="Abrir o capítulo"
                          className="rounded px-1 text-[11px] text-mesa-500 hover:bg-mesa-100"
                        >
                          ↗
                        </a>
                      </span>
                    </div>
                    <p className="text-[11px] leading-relaxed text-mesa-600">{a.texto}</p>
                  </li>
                ))}
              </ul>
            </>
          )}
        </div>
      )}

      {termo.trim().length < 2 && (
        <p className="px-1 text-[10px] leading-relaxed text-mesa-400">
          Busque pelo texto (&ldquo;lâmpada para os meus pés&rdquo;) ou pela
          referência (&ldquo;sl 119:105&rdquo;).
          {onInserir && " Ao achar, o botão inserir joga o versículo no ponto onde você parou de escrever."}
        </p>
      )}
    </div>
  );
}

// O texto vem do banco, mas vai virar HTML dentro da anotação: escapar aqui
// evita que qualquer caractere estranho seja interpretado como marcação.
function escapar(txt: string): string {
  return txt
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}
