"use client";

import { useState } from "react";

type Modo = "circulo" | "grifo" | "marca" | "dourado" | "nenhum";

type SlideIA = { texto: string; prompt: string; modo: Modo; cor: string };

type Sugestao = {
  tema: string;
  gancho: string;
  legenda: string;
  ideiaVisual: string;
  porque: string;
  melhorHorario: string;
  roteiro: SlideIA[];
};

type Resumo = {
  totalPosts: number;
  engajamentoMedio: number;
  temReach: boolean;
  melhorDia: string;
  melhorFaixaHoraria: string;
  melhorHorario: string;
  formatoTop: string;
  topPosts: { caption: string; likes: number; comments: number; reach: number | null; permalink: string }[];
};

export type IdeiaEscolhida = {
  conteudo: string;
  legenda: string;
  slides: SlideIA[];
};

/**
 * Painel "cérebro": analisa o perfil (posts + engajamento reais) e sugere posts
 * com foco em ABENÇOAR + engajar. "Usar essa ideia" entrega o roteiro pronto ao
 * editor (via onUsarIdeia) — nada é publicado aqui.
 */
export function SugestoesInstagram({ onUsarIdeia }: { onUsarIdeia: (ideia: IdeiaEscolhida) => void }) {
  const [carregando, setCarregando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [resumo, setResumo] = useState<Resumo | null>(null);
  const [sugestoes, setSugestoes] = useState<Sugestao[]>([]);

  async function analisar() {
    setCarregando(true);
    setErro(null);
    try {
      const res = await fetch("/api/admin/instagram/sugestoes", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ n: 3 }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data?.error || "Falha ao analisar o perfil.");
      setResumo(data.resumo || null);
      setSugestoes(Array.isArray(data.sugestoes) ? data.sugestoes : []);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Erro inesperado.");
    } finally {
      setCarregando(false);
    }
  }

  return (
    <div className="mb-8 rounded-2xl border border-laranja-200 bg-gradient-to-br from-laranja-50 to-mesa-50 p-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-laranja-700">
            Sugestões da IA
          </p>
          <h2 className="font-serif text-2xl font-semibold text-mesa-800">
            ✨ Analise meu perfil e me sugira posts
          </h2>
          <p className="mt-2 max-w-2xl text-sm text-mesa-600">
            A IA lê seus posts e o engajamento real do @brunofesantos e sugere ideias pensadas
            primeiro pra <strong>abençoar</strong> quem vê — e que tendem a engajar. Você escolhe uma e
            cai direto no editor.
          </p>
        </div>
        <button
          onClick={analisar}
          disabled={carregando}
          className="rounded-full bg-laranja-600 px-6 py-3 text-sm font-semibold text-white transition hover:bg-laranja-700 disabled:opacity-40"
        >
          {carregando ? "Analisando perfil…" : resumo ? "🔄 Sugerir de novo" : "✨ Analisar e sugerir"}
        </button>
      </div>

      {erro && <p className="mt-4 text-sm text-red-600">{erro}</p>}

      {/* Resumo do perfil */}
      {resumo && (
        <div className="mt-5 grid grid-cols-2 gap-3 sm:grid-cols-4">
          <Stat label="Posts analisados" valor={String(resumo.totalPosts)} />
          <Stat label="Engajamento médio" valor={`${resumo.engajamentoMedio}`} sub="curtidas + comentários" />
          <Stat label="Melhor horário" valor={resumo.melhorDia} sub={resumo.melhorFaixaHoraria} />
          <Stat label="Formato que engaja" valor={resumo.formatoTop} />
        </div>
      )}
      {resumo && !resumo.temReach && (
        <p className="mt-2 text-xs text-mesa-500">
          (Alcance indisponível no token atual — a análise usou curtidas e comentários. Pra incluir
          alcance, adicione a permissão de insights no app Meta.)
        </p>
      )}

      {/* Cards de sugestão */}
      {sugestoes.length > 0 && (
        <div className="mt-6 space-y-4">
          {sugestoes.map((s, i) => (
            <CardSugestao
              key={i}
              s={s}
              onUsar={() =>
                onUsarIdeia({ conteudo: s.tema, legenda: s.legenda, slides: s.roteiro })
              }
            />
          ))}
        </div>
      )}
    </div>
  );
}

function Stat({ label, valor, sub }: { label: string; valor: string; sub?: string }) {
  return (
    <div className="rounded-xl border border-mesa-200 bg-white px-4 py-3">
      <p className="text-[11px] font-medium uppercase tracking-wide text-mesa-400">{label}</p>
      <p className="mt-0.5 truncate font-semibold text-mesa-800" title={valor}>
        {valor}
      </p>
      {sub && <p className="text-xs text-mesa-500">{sub}</p>}
    </div>
  );
}

function CardSugestao({ s, onUsar }: { s: Sugestao; onUsar: () => void }) {
  const [aberto, setAberto] = useState(false);
  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-5">
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div className="min-w-0 flex-1">
          <p className="text-xs font-medium uppercase tracking-wide text-laranja-700">{s.tema}</p>
          <p className="mt-1 font-serif text-lg font-semibold text-mesa-800">“{s.gancho}”</p>
        </div>
        <button
          onClick={onUsar}
          className="shrink-0 rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-mesa-800"
        >
          Usar essa ideia →
        </button>
      </div>

      {s.porque && (
        <p className="mt-3 rounded-lg bg-oliveira-50 px-3 py-2 text-sm text-oliveira-800">
          💡 {s.porque}
        </p>
      )}

      <div className="mt-3 flex flex-wrap gap-x-6 gap-y-1 text-xs text-mesa-500">
        <span>🗓️ Melhor: <strong className="text-mesa-700">{s.melhorHorario}</strong></span>
        <span>🖼️ {s.roteiro.length === 1 ? "Imagem única" : `Carrossel de ${s.roteiro.length}`}</span>
        {s.ideiaVisual && <span>🎨 {s.ideiaVisual}</span>}
      </div>

      <button
        onClick={() => setAberto((v) => !v)}
        className="mt-3 text-sm font-medium text-laranja-700 hover:underline"
      >
        {aberto ? "Esconder roteiro e legenda" : "Ver roteiro e legenda"}
      </button>

      {aberto && (
        <div className="mt-3 space-y-4">
          <div>
            <p className="mb-2 text-xs font-medium uppercase tracking-wide text-mesa-400">Slides</p>
            <ol className="space-y-2">
              {s.roteiro.map((sl, k) => (
                <li key={k} className="rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2">
                  <p className="text-sm font-semibold text-mesa-800">
                    {k + 1}. {sl.texto}
                  </p>
                  <p className="mt-0.5 text-xs italic text-mesa-500">🎬 {sl.prompt}</p>
                </li>
              ))}
            </ol>
          </div>
          <div>
            <p className="mb-1 text-xs font-medium uppercase tracking-wide text-mesa-400">Legenda</p>
            <p className="whitespace-pre-wrap rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-sm text-mesa-700">
              {s.legenda}
            </p>
          </div>
        </div>
      )}
    </div>
  );
}
