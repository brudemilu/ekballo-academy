"use client";

import { useEffect, useRef, useState } from "react";
import { DonsResultado } from "@/components/DonsResultado";
import { ESCALA, QTD_VIDA, type ResultadoDons, TOTAL_PERGUNTAS } from "@/lib/dons";
import { PERGUNTAS_DONS, PERGUNTAS_VIDA } from "@/lib/dons-perguntas";
import { formatTelefoneBR } from "@/lib/telefone";

// Questionário público do Teste de Dons (issue #289). Quem responde não
// tem conta: o link (token) é a credencial. 160 perguntas em telas de 10
// — no celular, uma lista de 160 de uma vez cansa e se perde.
//
// Rascunho no localStorage do aparelho: o teste leva uns 20 minutos, e
// perder tudo porque a aba recarregou é o jeito mais rápido de a pessoa
// desistir. Ao enviar, o rascunho é apagado.

const POR_TELA = 10;
const TELAS = TOTAL_PERGUNTAS / POR_TELA; // 16

type Rascunho = {
  nome: string;
  idade: string;
  telefone: string;
  respostas: (number | null)[];
  tela: number;
};

function lerRascunho(chave: string): Rascunho | null {
  try {
    const bruto = localStorage.getItem(chave);
    if (!bruto) return null;
    const r = JSON.parse(bruto) as Rascunho;
    return Array.isArray(r.respostas) && r.respostas.length === TOTAL_PERGUNTAS
      ? r
      : null;
  } catch {
    return null;
  }
}

/** Texto e número exibido da pergunta pelo índice global (0–159). */
function pergunta(i: number): { numero: number; texto: string } {
  return i < QTD_VIDA
    ? { numero: i + 1, texto: PERGUNTAS_VIDA[i] }
    : { numero: i - QTD_VIDA + 1, texto: PERGUNTAS_DONS[i - QTD_VIDA] };
}

export function DonsQuestionario({
  token,
  nomeConhecido,
}: {
  token: string;
  /** Link pessoal: o nome já veio do líder. */
  nomeConhecido: string | null;
}) {
  const chave = `dons:${token}`;
  const [nome, setNome] = useState(nomeConhecido ?? "");
  const [idade, setIdade] = useState("");
  const [telefone, setTelefone] = useState("");
  const [respostas, setRespostas] = useState<(number | null)[]>(() =>
    Array(TOTAL_PERGUNTAS).fill(null),
  );
  // -1 = identificação; 0..15 = telas de perguntas.
  const [tela, setTela] = useState(-1);
  const [faltando, setFaltando] = useState<Set<number>>(new Set());
  const [enviando, setEnviando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [resultado, setResultado] = useState<ResultadoDons | null>(null);
  const [retomou, setRetomou] = useState(false);
  const cartoes = useRef<Map<number, HTMLLIElement>>(new Map());
  const topo = useRef<HTMLDivElement>(null);

  // Recupera o rascunho deste link, se houver.
  useEffect(() => {
    const r = lerRascunho(chave);
    if (!r) return;
    setNome(nomeConhecido ?? r.nome);
    setIdade(r.idade);
    setTelefone(r.telefone);
    setRespostas(r.respostas);
    if (r.respostas.some((v) => v !== null)) {
      setTela(Math.min(Math.max(r.tela, 0), TELAS - 1));
      setRetomou(true);
    }
  }, [chave, nomeConhecido]);

  useEffect(() => {
    if (resultado) return;
    try {
      const r: Rascunho = { nome, idade, telefone, respostas, tela };
      localStorage.setItem(chave, JSON.stringify(r));
    } catch {
      // Navegador sem armazenamento (aba anônima): segue sem rascunho.
    }
  }, [chave, nome, idade, telefone, respostas, tela, resultado]);

  const respondidas = respostas.filter((v) => v !== null).length;
  const progresso = Math.round((respondidas / TOTAL_PERGUNTAS) * 100);

  function irPara(n: number) {
    setTela(n);
    setFaltando(new Set());
    requestAnimationFrame(() =>
      topo.current?.scrollIntoView({ behavior: "smooth", block: "start" }),
    );
  }

  function marcar(i: number, valor: number) {
    setRespostas((atual) => {
      const novo = [...atual];
      novo[i] = valor;
      return novo;
    });
    setFaltando((f) => {
      if (!f.has(i)) return f;
      const n = new Set(f);
      n.delete(i);
      return n;
    });
    // Leva até a próxima pergunta ainda sem resposta desta tela.
    const inicio = tela * POR_TELA;
    const proxima = Array.from({ length: POR_TELA }, (_, k) => inicio + k).find(
      (k) => k > i && respostas[k] === null,
    );
    if (proxima !== undefined) {
      setTimeout(
        () =>
          cartoes.current
            .get(proxima)
            ?.scrollIntoView({ behavior: "smooth", block: "center" }),
        180,
      );
    }
  }

  function comecar(e: React.FormEvent) {
    e.preventDefault();
    if (nome.trim().length < 2) {
      setErro("Escreva o seu nome para começar.");
      return;
    }
    setErro(null);
    irPara(0);
  }

  async function avancar() {
    const inicio = tela * POR_TELA;
    const vazias = Array.from({ length: POR_TELA }, (_, k) => inicio + k).filter(
      (k) => respostas[k] === null,
    );
    if (vazias.length > 0) {
      setFaltando(new Set(vazias));
      cartoes.current
        .get(vazias[0])
        ?.scrollIntoView({ behavior: "smooth", block: "center" });
      return;
    }
    if (tela < TELAS - 1) {
      irPara(tela + 1);
      return;
    }
    await enviar();
  }

  async function enviar() {
    setEnviando(true);
    setErro(null);
    try {
      const resp = await fetch(`/api/dons/${encodeURIComponent(token)}`, {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({ nome, idade, telefone, respostas }),
      });
      const dados = (await resp.json().catch(() => ({}))) as {
        ok?: boolean;
        erro?: string;
        resultado?: ResultadoDons;
      };
      if (!resp.ok || !dados.ok || !dados.resultado) {
        setErro(
          dados.erro ?? "Não foi possível enviar. Confira a internet e tente de novo.",
        );
        return;
      }
      try {
        localStorage.removeItem(chave);
      } catch {
        // sem armazenamento: nada a limpar
      }
      setResultado(dados.resultado);
      requestAnimationFrame(() => window.scrollTo({ top: 0, behavior: "smooth" }));
    } catch {
      setErro("Sem conexão. Suas respostas continuam aqui — tente enviar de novo.");
    } finally {
      setEnviando(false);
    }
  }

  // ---------------- resultado ----------------
  if (resultado) {
    return (
      <div>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-laranja-600">
          Teste concluído
        </p>
        <h1 className="mb-3 font-serif text-3xl font-semibold leading-tight text-mesa-900">
          Obrigado, {nome.trim().split(/\s+/)[0]}!
        </h1>
        <p className="mb-8 text-justify hyphens-auto leading-relaxed text-mesa-700">
          Suas respostas foram enviadas ao seu líder. Este resultado não é um rótulo: é
          um ponto de partida para conversar sobre como Deus tem agido em você e onde
          você pode servir. Guarde-o e leve-o para a próxima conversa.
        </p>
        <DonsResultado resultado={resultado} />
        <button
          type="button"
          onClick={() => window.print()}
          className="nao-imprimir mt-8 rounded-full border border-mesa-300 bg-white px-5 py-2.5 text-sm font-medium text-mesa-800 hover:border-laranja-400"
        >
          Imprimir ou salvar em PDF
        </button>
      </div>
    );
  }

  // ---------------- identificação ----------------
  if (tela < 0) {
    return (
      <form onSubmit={comecar}>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-laranja-600">
          Efésios 4.11
        </p>
        <h1 className="mb-4 font-serif text-3xl font-semibold leading-tight text-mesa-900 sm:text-4xl">
          Teste de Dons Ministeriais
        </h1>
        <blockquote className="mb-6 border-l-2 border-laranja-300 pl-4 font-serif italic text-mesa-700">
          “E ele mesmo deu uns para apóstolos, e outros para profetas, e outros para
          evangelistas, e outros para pastores e doutores.”
        </blockquote>
        <div className="mb-8 space-y-3 text-justify hyphens-auto leading-relaxed text-mesa-700">
          <p>
            São 160 frases em duas partes: 10 sobre a sua vida ministerial e 150 sobre
            os dons. Leva cerca de 20 minutos. Para cada frase, marque com que
            frequência ela acontece na sua vida — de “nunca” a “sempre”.
          </p>
          <p>
            Responda pelo que você vive hoje, não pelo que gostaria de viver. Não há
            resposta certa nem errada. Se precisar parar, suas respostas ficam guardadas
            neste aparelho e você continua de onde parou.
          </p>
        </div>

        <div className="space-y-4 rounded-2xl border border-mesa-200 bg-white p-5">
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-mesa-800">
              Nome completo
            </span>
            <input
              value={nome}
              onChange={(e) => setNome(e.target.value)}
              readOnly={!!nomeConhecido}
              autoComplete="name"
              className="w-full rounded-xl border border-mesa-300 bg-white px-3 py-2.5 text-mesa-900 read-only:bg-bege-100 focus:border-laranja-400 focus:outline-none"
            />
          </label>
          <div className="grid gap-4 sm:grid-cols-[8rem_1fr]">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-mesa-800">
                Idade
              </span>
              <input
                value={idade}
                onChange={(e) =>
                  setIdade(e.target.value.replace(/\D+/g, "").slice(0, 3))
                }
                inputMode="numeric"
                className="w-full rounded-xl border border-mesa-300 bg-white px-3 py-2.5 text-mesa-900 focus:border-laranja-400 focus:outline-none"
              />
            </label>
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-mesa-800">
                WhatsApp <span className="font-normal text-mesa-500">(com DDD)</span>
              </span>
              <input
                value={telefone}
                onChange={(e) => setTelefone(formatTelefoneBR(e.target.value))}
                inputMode="tel"
                autoComplete="tel"
                placeholder="(31) 99999-9999"
                className="w-full rounded-xl border border-mesa-300 bg-white px-3 py-2.5 text-mesa-900 focus:border-laranja-400 focus:outline-none"
              />
            </label>
          </div>
          {erro && <p className="text-sm text-erro-600">{erro}</p>}
          <button
            type="submit"
            className="w-full rounded-full bg-laranja-500 px-6 py-3 font-semibold text-white shadow-sm hover:bg-laranja-600"
          >
            {respondidas > 0 ? "Continuar o teste" : "Começar o teste"}
          </button>
        </div>
      </form>
    );
  }

  // ---------------- perguntas ----------------
  const inicio = tela * POR_TELA;
  const indices = Array.from({ length: POR_TELA }, (_, k) => inicio + k);
  const parteVida = inicio < QTD_VIDA;

  return (
    <div ref={topo} className="scroll-mt-4">
      <div className="sticky top-0 z-10 -mx-4 mb-6 border-b border-mesa-200 bg-bege-50/95 px-4 py-3 backdrop-blur sm:-mx-6 sm:px-6">
        <div className="mb-1.5 flex items-baseline justify-between text-xs text-mesa-600">
          <span className="font-medium text-mesa-800">
            {parteVida ? "Parte 1 · Vida ministerial" : "Parte 2 · Dons ministeriais"}
          </span>
          <span className="tabular-nums">
            {respondidas} de {TOTAL_PERGUNTAS}
          </span>
        </div>
        <div
          className="h-2 overflow-hidden rounded-full bg-bege-200"
          role="progressbar"
          aria-valuenow={progresso}
          aria-valuemin={0}
          aria-valuemax={100}
          aria-label="Progresso do teste"
        >
          <div
            className="h-full rounded-full bg-laranja-500 transition-all"
            style={{ width: `${progresso}%` }}
          />
        </div>
      </div>

      {retomou && tela > 0 && (
        <p className="mb-4 rounded-xl bg-bege-100 px-4 py-2 text-sm text-mesa-700">
          Você continuou de onde parou. As respostas anteriores estão guardadas.
        </p>
      )}

      <ol className="space-y-4">
        {indices.map((i) => {
          const p = pergunta(i);
          const falta = faltando.has(i);
          return (
            <li
              key={i}
              ref={(el) => {
                if (el) cartoes.current.set(i, el);
                else cartoes.current.delete(i);
              }}
              className={`rounded-2xl border bg-white p-4 transition ${
                falta ? "border-erro-500 ring-2 ring-erro-200" : "border-mesa-200"
              }`}
            >
              <p id={`p-${i}`} className="mb-3 leading-snug text-mesa-900">
                <span className="mr-1.5 font-semibold tabular-nums text-laranja-600">
                  {p.numero}.
                </span>
                {p.texto}
              </p>
              <div
                role="radiogroup"
                aria-labelledby={`p-${i}`}
                className="grid grid-cols-5 gap-1.5"
              >
                {ESCALA.map((op) => {
                  const marcado = respostas[i] === op.valor;
                  return (
                    // biome-ignore lint/a11y/useSemanticElements: botão grande e tocável no celular; o papel de rádio vai no ARIA
                    <button
                      key={op.valor}
                      type="button"
                      role="radio"
                      aria-checked={marcado}
                      onClick={() => marcar(i, op.valor)}
                      className={`flex flex-col items-center rounded-xl border px-1 py-2 text-center transition ${
                        marcado
                          ? "border-laranja-500 bg-laranja-500 text-white"
                          : "border-mesa-200 bg-bege-50 text-mesa-700 hover:border-laranja-300"
                      }`}
                    >
                      <span className="text-base font-semibold tabular-nums">
                        {op.valor}
                      </span>
                      <span className="text-[10px] leading-tight sm:text-xs">
                        {op.rotulo}
                      </span>
                    </button>
                  );
                })}
              </div>
              {falta && (
                <p className="mt-2 text-xs text-erro-600">Falta responder esta.</p>
              )}
            </li>
          );
        })}
      </ol>

      {erro && (
        <p className="mt-6 rounded-xl bg-erro-50 px-4 py-3 text-sm text-erro-600">
          {erro}
        </p>
      )}

      <div className="mt-8 flex items-center justify-between gap-3">
        <button
          type="button"
          onClick={() => irPara(tela - 1)}
          className="rounded-full border border-mesa-300 bg-white px-5 py-2.5 text-sm font-medium text-mesa-800 hover:border-laranja-400"
        >
          Voltar
        </button>
        <span className="text-xs tabular-nums text-mesa-500">
          Tela {tela + 1} de {TELAS}
        </span>
        <button
          type="button"
          onClick={avancar}
          disabled={enviando}
          className="rounded-full bg-laranja-500 px-6 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-laranja-600 disabled:opacity-60"
        >
          {tela < TELAS - 1
            ? "Continuar"
            : enviando
              ? "Enviando…"
              : "Ver meu resultado"}
        </button>
      </div>
    </div>
  );
}
