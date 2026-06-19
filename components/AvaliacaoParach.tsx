"use client";

import { useEffect, useMemo, useRef, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import {
  SECOES,
  ESCALA,
  DONS,
  TOTAL_PERGUNTAS,
  pontuar,
  type Faixa,
} from "@/lib/avaliacao-parach";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

const CORES_FAIXA: Record<Faixa["cor"], string> = {
  verde: "border-green-300 bg-green-50 text-green-800",
  oliveira: "border-oliveira-300 bg-oliveira-50 text-oliveira-800",
  ambar: "border-amber-300 bg-amber-50 text-amber-800",
  laranja: "border-laranja-300 bg-laranja-50 text-laranja-800",
  vermelho: "border-red-300 bg-red-50 text-red-800",
};

type Plano = { comecar: string; parar: string; responsavel: string };

type Props = {
  aulaId: string;
  alunoId: string;
  atividadeId: string | null;
  respostaInicial?: string | null;
  comentarioLider?: string | null;
};

export function AvaliacaoParach({ aulaId, alunoId, atividadeId, respostaInicial, comentarioLider }: Props) {
  const router = useRouter();
  const storeKey = `avaliacao-parach:${aulaId}:${alunoId}`;
  const [respostas, setRespostas] = useState<Record<number, number>>({});
  const [plano, setPlano] = useState<Plano>({ comecar: "", parar: "", responsavel: "" });
  const [mostrarResultado, setMostrarResultado] = useState(false);
  const [carregado, setCarregado] = useState(false);
  const [salvo, setSalvo] = useState<"idle" | "ok" | "erro">(respostaInicial ? "ok" : "idle");
  const [salvando, startTransition] = useTransition();
  const resultadoRef = useRef<HTMLDivElement>(null);

  // Carrega rascunho local (respostas + plano não são obrigatórios; ficam no aparelho).
  useEffect(() => {
    try {
      const raw = localStorage.getItem(storeKey);
      if (raw) {
        const d = JSON.parse(raw);
        if (d.respostas) setRespostas(d.respostas);
        if (d.plano) setPlano(d.plano);
        if (d.mostrarResultado) setMostrarResultado(true);
      }
    } catch {
      /* ignora */
    }
    setCarregado(true);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [storeKey]);

  useEffect(() => {
    if (!carregado) return;
    try {
      localStorage.setItem(storeKey, JSON.stringify({ respostas, plano, mostrarResultado }));
    } catch {
      /* ignora */
    }
  }, [respostas, plano, mostrarResultado, carregado, storeKey]);

  const respondidas = Object.values(respostas).filter(Boolean).length;
  const resultado = useMemo(() => pontuar(respostas), [respostas]);

  function marcar(n: number, v: number) {
    setRespostas((r) => ({ ...r, [n]: v }));
    if (salvo === "ok") setSalvo("idle");
  }

  function verResultado() {
    setMostrarResultado(true);
    setTimeout(() => resultadoRef.current?.scrollIntoView({ behavior: "smooth", block: "start" }), 60);
  }

  function resumoTexto(): string {
    const r = resultado;
    const linhas = [
      "AVALIAÇÃO DE LIDERANÇA PARACH",
      "",
      `Dom principal: ${r.principal.nome} (${r.principal.score}/25 — ${r.principal.classificacao})`,
      `Dom secundário: ${r.secundario.nome} (${r.secundario.score}/25)`,
      "",
      "Pontuação por dom:",
      ...r.doms.map((d) => `  • ${d.nome}: ${d.score}/25 — ${d.classificacao}`),
      "",
      `Florescimento: ${r.florescimento}/40  |  Esforço: ${r.esforco}/35`,
      `Índice de Florescimento: ${r.indice >= 0 ? "+" : ""}${r.indice} — ${r.faixa.nome}`,
      `Armadilha de esforço: “${r.armadilha}”`,
      "",
      "PLANO DE RESTAURAÇÃO",
      `Uma coisa que vou COMEÇAR: ${plano.comecar.trim() || "—"}`,
      `Uma coisa que vou PARAR: ${plano.parar.trim() || "—"}`,
      `Quem me manterá responsável: ${plano.responsavel.trim() || "—"}`,
    ];
    return linhas.join("\n");
  }

  function salvar() {
    if (!atividadeId) return;
    const texto = resumoTexto();
    startTransition(async () => {
      if (MOCK) {
        try {
          const res = await fetch("/api/mock/salvar-reflexao", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ atividadeId, alunoId, texto }),
          });
          if (!res.ok) throw new Error();
          setSalvo("ok");
          router.refresh();
        } catch {
          setSalvo("erro");
        }
        return;
      }
      const supabase = createClient();
      const { error } = await supabase.from("respostas").upsert(
        { atividade_id: atividadeId, aluno_id: alunoId, texto, updated_at: new Date().toISOString() },
        { onConflict: "atividade_id,aluno_id" }
      );
      setSalvo(error ? "erro" : "ok");
      if (!error) router.refresh();
    });
  }

  const pct = Math.round((respondidas / TOTAL_PERGUNTAS) * 100);

  return (
    <div className="space-y-8">
      {/* intro / escala */}
      <div className="rounded-2xl border border-mesa-200 bg-mesa-50/60 p-5 sm:p-6">
        <p className="text-sm leading-relaxed text-mesa-700 text-justify hyphens-auto" lang="pt-BR">
          Reserve 20–30 minutos. Responda com base em como você <strong>realmente</strong> funciona,
          não como gostaria de funcionar. Para cada afirmação, toque no número que melhor reflete sua
          experiência. Ao terminar, seu resultado aparece automaticamente — seu dom principal, o Índice
          de Florescimento e sua armadilha de esforço. Não há resposta certa.
        </p>
        <div className="mt-4 flex flex-wrap gap-x-4 gap-y-1 text-xs text-mesa-500">
          {ESCALA.map((e) => (
            <span key={e.v}>
              <strong className="text-mesa-700">{e.v}</strong> {e.label}
            </span>
          ))}
        </div>
      </div>

      {/* progresso (sticky) */}
      <div className="sticky top-2 z-10 rounded-full border border-mesa-200 bg-white/95 px-4 py-2 shadow-sm backdrop-blur">
        <div className="flex items-center gap-3">
          <div className="h-2 flex-1 overflow-hidden rounded-full bg-mesa-100">
            <div className="h-full rounded-full bg-oliveira-500 transition-all" style={{ width: `${pct}%` }} />
          </div>
          <span className="shrink-0 text-xs font-medium text-mesa-600">
            {respondidas}/{TOTAL_PERGUNTAS}
          </span>
        </div>
      </div>

      {/* seções */}
      {SECOES.map((secao) => (
        <section key={secao.id}>
          <div className="mb-3">
            <p className="text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
              {secao.parte === 1 ? "Parte 1 · Identificação do dom" : "Parte 2 · Florescimento vs. esforço"}
            </p>
            <h3 className="font-serif text-xl font-semibold text-mesa-800">
              Seção {secao.id}: {secao.titulo}
            </h3>
          </div>
          <div className="space-y-3">
            {secao.perguntas.map((p) => (
              <div
                key={p.n}
                className={`rounded-xl border p-4 transition ${
                  respostas[p.n] ? "border-oliveira-200 bg-oliveira-50/40" : "border-mesa-200 bg-white"
                }`}
              >
                <p className="mb-3 text-sm leading-snug text-mesa-800">
                  <span className="mr-1 font-semibold text-mesa-500">{p.n}.</span>
                  {p.texto}
                </p>
                <div className="flex items-center justify-between gap-1.5">
                  {ESCALA.map((e) => {
                    const ativo = respostas[p.n] === e.v;
                    return (
                      <button
                        key={e.v}
                        type="button"
                        onClick={() => marcar(p.n, e.v)}
                        aria-label={`${e.v} — ${e.label}`}
                        className={`flex h-11 flex-1 flex-col items-center justify-center rounded-lg border text-sm font-semibold transition ${
                          ativo
                            ? "border-oliveira-600 bg-oliveira-600 text-white shadow"
                            : "border-mesa-200 bg-mesa-50 text-mesa-600 hover:border-oliveira-300 hover:bg-oliveira-50"
                        }`}
                      >
                        {e.v}
                      </button>
                    );
                  })}
                </div>
                <div className="mt-1 flex justify-between px-0.5 text-[10px] uppercase tracking-wide text-mesa-400">
                  <span>Raramente</span>
                  <span>Quase sempre</span>
                </div>
              </div>
            ))}
          </div>
        </section>
      ))}

      {/* botão ver resultado */}
      <div className="rounded-2xl border border-mesa-200 bg-white p-5 text-center">
        {respondidas < TOTAL_PERGUNTAS && (
          <p className="mb-3 text-sm text-mesa-500">
            Faltam {TOTAL_PERGUNTAS - respondidas} afirmação(ões). Você pode ver um resultado parcial,
            mas ele fica mais fiel com tudo respondido.
          </p>
        )}
        <button
          type="button"
          onClick={verResultado}
          disabled={respondidas === 0}
          className="rounded-full bg-mesa-700 px-7 py-3 text-sm font-semibold text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-50"
        >
          {mostrarResultado ? "Atualizar meu resultado" : "Ver meu resultado"}
        </button>
      </div>

      {/* resultado */}
      {mostrarResultado && (
        <div ref={resultadoRef} className="space-y-6 scroll-mt-4">
          <div className="rounded-2xl border-2 border-laranja-200 bg-gradient-to-b from-laranja-50/60 to-white p-6 sm:p-8">
            <p className="text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">Seu resultado</p>

            {/* dom principal */}
            <h3 className="mt-1 font-serif text-3xl font-semibold text-mesa-800">
              {resultado.principal.nome}
            </h3>
            <p className="text-sm text-mesa-600">
              Dom principal — {resultado.principal.score}/25 · {resultado.principal.classificacao}
              {resultado.secundario.score >= 15 && (
                <> · secundário: <strong>{resultado.secundario.nome}</strong> ({resultado.secundario.score}/25)</>
              )}
            </p>
            <p className="mt-1 text-sm text-mesa-600">
              No jardim, sua função é <strong>{DONS[resultado.principal.gift].funcao}</strong>.
            </p>

            {/* pontuação por dom */}
            <div className="mt-5 space-y-2">
              {resultado.doms.map((d) => (
                <div key={d.gift} className="flex items-center gap-3">
                  <span className="w-24 shrink-0 text-sm text-mesa-700">{d.nome}</span>
                  <div className="h-2.5 flex-1 overflow-hidden rounded-full bg-mesa-100">
                    <div
                      className="h-full rounded-full bg-mesa-500"
                      style={{ width: `${(d.score / 25) * 100}%` }}
                    />
                  </div>
                  <span className="w-12 shrink-0 text-right text-sm font-medium text-mesa-600">{d.score}/25</span>
                </div>
              ))}
            </div>

            {/* índice de florescimento */}
            <div className={`mt-6 rounded-xl border p-4 ${CORES_FAIXA[resultado.faixa.cor]}`}>
              <div className="flex items-baseline justify-between">
                <p className="text-sm font-medium uppercase tracking-wide">Índice de Florescimento</p>
                <p className="font-serif text-2xl font-bold">
                  {resultado.indice >= 0 ? "+" : ""}
                  {resultado.indice}
                </p>
              </div>
              <p className="mt-0.5 text-lg font-semibold">{resultado.faixa.nome}</p>
              <p className="text-sm opacity-90">{resultado.faixa.descricao}</p>
              <p className="mt-2 text-xs opacity-80">
                Florescimento {resultado.florescimento}/40 − Esforço {resultado.esforco}/35
              </p>
            </div>

            {/* armadilha */}
            <div className="mt-4 rounded-xl border border-mesa-200 bg-mesa-50/60 p-4">
              <p className="text-xs font-medium uppercase tracking-wide text-mesa-500">
                Sua armadilha de esforço ({resultado.principal.nome})
              </p>
              <p className="mt-1 font-serif text-lg italic text-mesa-800">“{resultado.armadilha}”</p>
            </div>

            {!resultado.completo && (
              <p className="mt-4 text-xs text-mesa-500">
                * Resultado parcial — {respondidas} de {TOTAL_PERGUNTAS} afirmações respondidas.
              </p>
            )}
          </div>

          {/* plano de restauração */}
          <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
            <p className="text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
              Passo final · Plano de Restauração
            </p>
            <h3 className="mb-1 font-serif text-2xl font-semibold text-mesa-800">
              Transforme o diagnóstico em um passo concreto.
            </h3>
            <p className="mb-5 text-sm text-mesa-600">
              Liderar a partir do descanso começa com uma decisão pequena e honesta. Seu líder pode ler e
              caminhar com você.
            </p>

            <div className="space-y-4">
              <PlanoCampo
                rotulo="Uma coisa que vou COMEÇAR"
                valor={plano.comecar}
                onChange={(v) => { setPlano((p) => ({ ...p, comecar: v })); if (salvo === "ok") setSalvo("idle"); }}
                placeholder="Ex.: reservar a segunda de manhã para oração sem agenda."
              />
              <PlanoCampo
                rotulo="Uma coisa que vou PARAR"
                valor={plano.parar}
                onChange={(v) => { setPlano((p) => ({ ...p, parar: v })); if (salvo === "ok") setSalvo("idle"); }}
                placeholder="Ex.: responder mensagens de trabalho depois das 21h."
              />
              <PlanoCampo
                rotulo="Quem me manterá responsável"
                valor={plano.responsavel}
                onChange={(v) => { setPlano((p) => ({ ...p, responsavel: v })); if (salvo === "ok") setSalvo("idle"); }}
                placeholder="Ex.: meu pastor / um amigo de confiança."
              />
            </div>

            <div className="mt-5 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <p className="text-xs text-mesa-500">
                {salvo === "ok"
                  ? "✓ Resultado e plano salvos. Seu líder pode ler."
                  : salvando
                    ? "Salvando..."
                    : salvo === "erro"
                      ? "Erro ao salvar — tente novamente."
                      : "Salve seu resultado e plano — o líder vai ler."}
              </p>
              <button
                type="button"
                onClick={salvar}
                disabled={salvando || !atividadeId}
                className="rounded-full bg-mesa-700 px-6 py-2.5 text-sm font-semibold text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-50"
              >
                {salvando ? "Salvando..." : salvo === "ok" ? "Atualizar resultado salvo" : "Salvar resultado e plano"}
              </button>
            </div>

            {comentarioLider && (
              <div className="mt-6 rounded-xl border-l-4 border-oliveira-400 bg-oliveira-50/50 p-4">
                <p className="mb-2 text-xs font-medium uppercase tracking-wider text-oliveira-700">
                  Devolutiva do líder
                </p>
                <p className="whitespace-pre-wrap text-sm leading-relaxed text-mesa-800 text-justify hyphens-auto" lang="pt-BR">
                  {comentarioLider}
                </p>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

function PlanoCampo({
  rotulo,
  valor,
  onChange,
  placeholder,
}: {
  rotulo: string;
  valor: string;
  onChange: (v: string) => void;
  placeholder: string;
}) {
  return (
    <div>
      <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-mesa-600">{rotulo}</label>
      <textarea
        value={valor}
        onChange={(e) => onChange(e.target.value)}
        rows={2}
        placeholder={placeholder}
        className="w-full resize-y rounded-lg border border-mesa-200 bg-mesa-50/40 px-4 py-2.5 text-sm text-mesa-900 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
      />
    </div>
  );
}
