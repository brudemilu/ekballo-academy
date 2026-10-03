"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import {
  type CursoOpcao,
  fonteInicial,
  fontePronta,
  pedidoDaFonte,
  SeletorFonteConteudo,
} from "@/components/SeletorFonteConteudo";
import type { DiasPacote } from "@/lib/pacote";

/**
 * Pacote da semana (issue #189): de uma fonte só, a IA monta um carrossel, um
 * roteiro de Reel e um story com pergunta, e os três entram no calendário nos
 * dias escolhidos. Nada é publicado: são rascunhos para revisar.
 */

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";

const PECAS: { chave: keyof DiasPacote; rotulo: string; nome: string }[] = [
  { chave: "carrossel", rotulo: "📚 Carrossel", nome: "o carrossel" },
  { chave: "reel", rotulo: "🎬 Reel (roteiro)", nome: "o roteiro do Reel" },
  { chave: "story", rotulo: "⏳ Story com pergunta", nome: "o story" },
];

/** "a, b e c" — a lista como se fala. */
function emLista(itens: string[]): string {
  return new Intl.ListFormat("pt-BR", { style: "long", type: "conjunction" }).format(
    itens,
  );
}

export function PacoteSemana({
  cursos,
  referencias,
  hoje,
  diasIniciais,
}: {
  cursos: CursoOpcao[];
  referencias: { id: string; nome: string }[];
  hoje: string;
  diasIniciais: DiasPacote;
}) {
  const router = useRouter();
  const [aberto, setAberto] = useState(false);
  const [fonte, setFonte] = useState(() => fonteInicial(hoje));
  const [dias, setDias] = useState(diasIniciais);
  const [referenciaId, setReferenciaId] = useState("");
  const [foco, setFoco] = useState("");
  const [montando, setMontando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [resultado, setResultado] = useState<string | null>(null);

  async function montar() {
    setMontando(true);
    setErro(null);
    setResultado(null);
    try {
      const res = await fetch("/api/admin/instagram/pacote", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          fonte: pedidoDaFonte(fonte),
          dias,
          referenciaId: referenciaId || undefined,
          foco,
        }),
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(d?.error || "Falha ao montar o pacote.");

      const criadas = (d.criadas as string[]) || [];
      const falhas = (d.falhas as string[]) || [];
      const nomes = PECAS.filter((p) => criadas.includes(p.chave)).map((p) => p.nome);
      setResultado(
        `Pronto: ${emLista(nomes)} ${nomes.length > 1 ? "estão" : "está"} no calendário para você revisar.` +
          (falhas.length
            ? ` Não saiu: ${emLista(
                PECAS.filter((p) => falhas.includes(p.chave)).map((p) => p.nome),
              )} — tente montar de novo.`
            : ""),
      );
      // Recolhe o painel: o que interessa agora é o calendário logo abaixo.
      setAberto(false);
      // Abre o calendário na semana da primeira peça, já com as novas ideias.
      const primeiro = [dias.carrossel, dias.reel, dias.story].sort()[0];
      router.push(`/admin/instagram?aba=calendario&semana=${primeiro}`);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao montar o pacote.");
    } finally {
      setMontando(false);
    }
  }

  if (!aberto) {
    return (
      <div className="mb-6 flex flex-wrap items-center justify-between gap-3 rounded-2xl border border-laranja-200 bg-laranja-50/60 p-4">
        <div className="min-w-0">
          <p className="font-serif text-lg font-semibold text-mesa-800">
            📦 Montar a semana de uma vez
          </p>
          <p className="text-sm text-mesa-600">
            De uma mesa, um devocional ou um texto seu saem um carrossel, um roteiro de
            Reel e um story com pergunta.
          </p>
          {resultado && (
            <p className="mt-2 text-sm text-oliveira-700" role="status">
              ✓ {resultado}
            </p>
          )}
        </div>
        <button
          type="button"
          onClick={() => setAberto(true)}
          className="rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700"
        >
          Montar a semana
        </button>
      </div>
    );
  }

  return (
    <section className="mb-6 rounded-2xl border border-laranja-200 bg-white p-5">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div>
          <h2 className="font-serif text-xl font-semibold text-mesa-800">
            📦 Montar a semana de uma vez
          </h2>
          <p className="mt-1 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
            Escolha a fonte e os dias. As três peças saem dela e entram no calendário
            como rascunho: nada é publicado sem você revisar.
          </p>
        </div>
        <button
          type="button"
          onClick={() => setAberto(false)}
          className="rounded-full px-3 py-1 text-sm text-mesa-600 hover:bg-mesa-100"
        >
          Fechar
        </button>
      </div>

      <SeletorFonteConteudo
        cursos={cursos}
        valor={fonte}
        onMudar={setFonte}
        onErro={setErro}
      />

      <fieldset className="mt-5">
        <legend className={ROTULO}>Quando cada peça vai ao ar</legend>
        <div className="grid gap-3 sm:grid-cols-3">
          {PECAS.map((p) => (
            <div key={p.chave}>
              <label
                className="mb-1 block text-xs font-medium text-mesa-500"
                htmlFor={`pacote-dia-${p.chave}`}
              >
                {p.rotulo}
              </label>
              <input
                id={`pacote-dia-${p.chave}`}
                type="date"
                value={dias[p.chave]}
                onChange={(e) => setDias({ ...dias, [p.chave]: e.target.value })}
                className={CAMPO}
              />
            </div>
          ))}
        </div>
      </fieldset>

      <div className="mt-5 grid gap-4 md:grid-cols-2">
        <div>
          <label className={ROTULO} htmlFor="pacote-referencia">
            Reel no formato de
          </label>
          <select
            id="pacote-referencia"
            value={referenciaId}
            onChange={(e) => setReferenciaId(e.target.value)}
            className={CAMPO}
          >
            <option value="">Só o meu jeito</option>
            {referencias.map((r) => (
              <option key={r.id} value={r.id}>
                {r.nome}
              </option>
            ))}
          </select>
        </div>
        <div>
          <label className={ROTULO} htmlFor="pacote-foco">
            Quero falar de…{" "}
            <span className="font-normal text-mesa-400">(opcional)</span>
          </label>
          <input
            id="pacote-foco"
            maxLength={400}
            value={foco}
            onChange={(e) => setFoco(e.target.value)}
            placeholder="Ex.: a parte sobre descanso"
            className={CAMPO}
          />
        </div>
      </div>

      {erro && (
        <div
          className="mt-4 rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      <div className="mt-5 flex flex-wrap items-center gap-3">
        <button
          type="button"
          onClick={montar}
          disabled={
            montando ||
            !fontePronta(fonte) ||
            !dias.carrossel ||
            !dias.reel ||
            !dias.story
          }
          className="rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60"
        >
          {montando ? "Montando as três peças…" : "✨ Montar e pôr no calendário"}
        </button>
        {montando && (
          <span className="text-sm text-mesa-500">Leva uns 15 segundos.</span>
        )}
      </div>
      {resultado && (
        <p className="mt-3 text-sm text-oliveira-700" role="status">
          ✓ {resultado}
        </p>
      )}
    </section>
  );
}
