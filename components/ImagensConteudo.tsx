"use client";

import { useState } from "react";
import { ESTILOS, type EstiloImagem, FORMATOS, sementes } from "@/lib/imagem-livre";
import type { FormatoImagem } from "@/lib/instagram";

/**
 * Aba Imagens do Instagram (issue #189).
 *
 *  - Imagem livre: o pastor descreve em português, a IA gera quatro variações
 *    e ele baixa a que quiser. Sem texto por cima.
 *  - Capa de Reel: um título sobre uma imagem 9:16, no padrão visual da casa.
 */

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";
const BOTAO_PRIMARIO =
  "rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60";
const BOTAO_SECUNDARIO =
  "rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60";

function chip(ativo: boolean) {
  return `rounded-full border px-3 py-1.5 text-sm font-medium transition ${
    ativo
      ? "border-mesa-700 bg-mesa-700 text-mesa-50"
      : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
  }`;
}

/** Traduz a descrição em português para a cena em inglês que o modelo entende. */
async function prepararCena(descricao: string): Promise<string> {
  const res = await fetch("/api/admin/instagram/imagem", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ descricao }),
  });
  const d = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(d?.error || "Não consegui preparar a imagem.");
  return d.cena as string;
}

function novaBase() {
  return Math.floor(Math.random() * 900_000) + 1;
}

export function ImagensConteudo({ tituloInicial }: { tituloInicial?: string }) {
  return (
    <div className="space-y-8">
      <ImagemLivre />
      <CapaDeReel tituloInicial={tituloInicial} />
    </div>
  );
}

// ---------------------------------------------------------------------------
// Imagem livre
// ---------------------------------------------------------------------------

type Pedido = {
  cena: string;
  estilo: EstiloImagem;
  formato: FormatoImagem;
  base: number;
};

function ImagemLivre() {
  const [descricao, setDescricao] = useState("");
  const [estilo, setEstilo] = useState<EstiloImagem>("cinematografico");
  const [formato, setFormato] = useState<FormatoImagem>("feed");
  const [pedido, setPedido] = useState<Pedido | null>(null);
  const [preparando, setPreparando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function criar(e: React.FormEvent) {
    e.preventDefault();
    setPreparando(true);
    setErro(null);
    try {
      const cena = await prepararCena(descricao);
      setPedido({ cena, estilo, formato, base: novaBase() });
    } catch (err) {
      setErro(err instanceof Error ? err.message : "Não consegui preparar a imagem.");
    } finally {
      setPreparando(false);
    }
  }

  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
        Imagem livre
      </h2>
      <p className="mb-4 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
        Descreva o que você quer ver. A IA cria quatro variações, sem texto, para você
        escolher e baixar. Rostos não aparecem: pessoas saem de costas, em silhueta ou
        só as mãos.
      </p>

      <form onSubmit={criar}>
        <label className={ROTULO} htmlFor="img-descricao">
          O que você quer ver
        </label>
        <textarea
          id="img-descricao"
          required
          rows={3}
          maxLength={600}
          value={descricao}
          onChange={(e) => setDescricao(e.target.value)}
          placeholder="Ex.: uma mesa de madeira com pão partido e uma Bíblia aberta, luz da manhã entrando pela janela"
          className={CAMPO}
        />

        <fieldset className="mt-4">
          <legend className={ROTULO}>Estilo</legend>
          <div className="flex flex-wrap gap-2">
            {(Object.keys(ESTILOS) as EstiloImagem[]).map((k) => (
              <button
                type="button"
                key={k}
                onClick={() => setEstilo(k)}
                aria-pressed={estilo === k}
                className={chip(estilo === k)}
              >
                {ESTILOS[k].nome}
              </button>
            ))}
          </div>
        </fieldset>

        <fieldset className="mt-4">
          <legend className={ROTULO}>Formato</legend>
          <div className="flex flex-wrap gap-2">
            {(Object.keys(FORMATOS) as FormatoImagem[]).map((k) => (
              <button
                type="button"
                key={k}
                onClick={() => setFormato(k)}
                aria-pressed={formato === k}
                className={chip(formato === k)}
              >
                {FORMATOS[k].nome}
              </button>
            ))}
          </div>
        </fieldset>

        <div className="mt-5 flex flex-wrap items-center gap-3">
          <button
            type="submit"
            disabled={preparando || descricao.trim().length < 4}
            className={BOTAO_PRIMARIO}
          >
            {preparando ? "Preparando…" : "✨ Criar 4 variações"}
          </button>
          {pedido && (
            <button
              type="button"
              onClick={() => setPedido({ ...pedido, base: novaBase() })}
              className={BOTAO_SECUNDARIO}
            >
              Mais 4
            </button>
          )}
        </div>
      </form>

      {erro && (
        <div
          className="mt-4 rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      {pedido && (
        <ul className="mt-5 grid grid-cols-2 gap-3 lg:grid-cols-4">
          {sementes(pedido.base).map((seed) => (
            <li key={`${pedido.cena}-${pedido.estilo}-${pedido.formato}-${seed}`}>
              <Variacao pedido={pedido} seed={seed} />
            </li>
          ))}
        </ul>
      )}
    </section>
  );
}

function Variacao({ pedido, seed }: { pedido: Pedido; seed: number }) {
  const [estado, setEstado] = useState<"carregando" | "pronta" | "falhou">(
    "carregando",
  );
  const q = new URLSearchParams({
    cena: pedido.cena,
    estilo: pedido.estilo,
    f: pedido.formato,
    seed: String(seed),
  });
  const src = `/api/admin/instagram/imagem?${q.toString()}`;

  return (
    <div>
      <div
        className="relative overflow-hidden rounded-xl border border-mesa-200 bg-mesa-100"
        style={{ aspectRatio: FORMATOS[pedido.formato].proporcao }}
      >
        {estado !== "falhou" && (
          // biome-ignore lint/performance/noImgElement: imagem gerada na hora por uma rota autenticada; next/image não otimiza esse caminho
          <img
            src={src}
            alt={`Variação gerada: ${pedido.cena}`}
            className="h-full w-full object-cover"
            onLoad={() => setEstado("pronta")}
            onError={() => setEstado("falhou")}
          />
        )}
        {estado === "carregando" && (
          <div className="absolute inset-0 flex items-center justify-center text-xs font-medium text-mesa-600">
            gerando…
          </div>
        )}
        {estado === "falhou" && (
          <div className="absolute inset-0 flex items-center justify-center p-3 text-center text-xs text-mesa-600">
            Não saiu. A cota grátis de imagens do dia pode ter acabado (volta às 21h).
          </div>
        )}
      </div>
      {estado === "pronta" && (
        <a href={`${src}&dl=1`} className={`${BOTAO_SECUNDARIO} mt-2 inline-block`}>
          Baixar
        </a>
      )}
    </div>
  );
}

// ---------------------------------------------------------------------------
// Capa de Reel
// ---------------------------------------------------------------------------

function CapaDeReel({ tituloInicial }: { tituloInicial?: string }) {
  const [titulo, setTitulo] = useState(tituloInicial || "");
  const [descricao, setDescricao] = useState("");
  const [capa, setCapa] = useState<{
    titulo: string;
    cena: string;
    seed: number;
  } | null>(null);
  const [preparando, setPreparando] = useState(false);
  const [carregando, setCarregando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function criar(e: React.FormEvent) {
    e.preventDefault();
    setPreparando(true);
    setErro(null);
    try {
      const cena = await prepararCena(descricao || titulo.replace(/[{}]/g, ""));
      setCapa({ titulo, cena, seed: novaBase() });
      setCarregando(true);
    } catch (err) {
      setErro(err instanceof Error ? err.message : "Não consegui preparar a capa.");
    } finally {
      setPreparando(false);
    }
  }

  const src = capa
    ? `/api/og/instagram?${new URLSearchParams({
        f: "story",
        verso: capa.titulo,
        prompt: capa.cena,
        seed: String(capa.seed),
        realce: "dourado",
        tom: "escuro",
      }).toString()}`
    : "";

  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
        Capa de Reel
      </h2>
      <p className="mb-4 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
        O título do vídeo sobre uma imagem vertical, no padrão visual do ministério.
        Ponha a palavra mais forte entre chaves para destacá-la:{" "}
        <code className="rounded bg-mesa-100 px-1">Pense menos em {"{você}"}</code>.
      </p>

      <div className="grid gap-6 md:grid-cols-[1fr_auto]">
        <form onSubmit={criar} className="min-w-0">
          <label className={ROTULO} htmlFor="capa-titulo">
            Título da capa
          </label>
          <input
            id="capa-titulo"
            required
            maxLength={80}
            value={titulo}
            onChange={(e) => setTitulo(e.target.value)}
            placeholder="Ex.: A liberdade de se {esquecer}"
            className={CAMPO}
          />
          <label className={`${ROTULO} mt-4`} htmlFor="capa-descricao">
            Imagem de fundo{" "}
            <span className="font-normal text-mesa-400">
              (opcional; sem isso a IA escolhe pelo título)
            </span>
          </label>
          <input
            id="capa-descricao"
            maxLength={300}
            value={descricao}
            onChange={(e) => setDescricao(e.target.value)}
            placeholder="Ex.: estrada de terra ao amanhecer"
            className={CAMPO}
          />
          <div className="mt-5 flex flex-wrap items-center gap-3">
            <button
              type="submit"
              disabled={preparando || titulo.trim().length < 3}
              className={BOTAO_PRIMARIO}
            >
              {preparando ? "Preparando…" : "✨ Criar a capa"}
            </button>
            {capa && (
              <>
                <button
                  type="button"
                  onClick={() => {
                    setCapa({ ...capa, seed: novaBase() });
                    setCarregando(true);
                  }}
                  className={BOTAO_SECUNDARIO}
                >
                  Outra foto
                </button>
                <a href={`${src}&dl=1`} className={BOTAO_SECUNDARIO}>
                  Baixar
                </a>
              </>
            )}
          </div>
          {erro && (
            <div
              className="mt-4 rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
              role="alert"
            >
              {erro}
            </div>
          )}
        </form>

        {capa && (
          <div
            className="relative w-44 overflow-hidden rounded-xl border border-mesa-200 bg-mesa-100"
            style={{ aspectRatio: "9 / 16" }}
          >
            {/* biome-ignore lint/performance/noImgElement: a prévia é um PNG gerado na hora pela rota OG; next/image não otimiza rota OG */}
            <img
              src={src}
              alt={`Prévia da capa: ${capa.titulo.replace(/[{}]/g, "")}`}
              className="h-full w-full object-cover"
              onLoad={() => setCarregando(false)}
              onError={() => setCarregando(false)}
            />
            {carregando && (
              <div className="absolute inset-0 flex items-center justify-center bg-mesa-100/70 text-xs font-medium text-mesa-600">
                gerando…
              </div>
            )}
          </div>
        )}
      </div>
    </section>
  );
}
