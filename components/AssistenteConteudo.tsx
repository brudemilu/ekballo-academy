"use client";

import { useEffect, useRef, useState } from "react";
import type { IdeiaSugerida, MensagemChat } from "@/lib/assistente";

/**
 * Aba Assistente do Instagram (issue #189): conversa sobre o conteúdo com uma
 * IA que conhece o Perfil do ministério. As ideias que ela propõe podem ir
 * direto para o calendário.
 */

type Fala = MensagemChat & { ideias?: IdeiaSugerida[] };

const SUGESTOES = [
  "Me dê 5 ideias de post para esta semana",
  "Que tipo de conteúdo costuma gerar mais conversa?",
  "Vou colar uma legenda: me diga como melhorar",
];

const NOME_FORMATO: Record<string, string> = {
  carrossel: "Carrossel",
  reel: "Reel",
  story: "Story",
  roteiro: "Roteiro falado",
};

export function AssistenteConteudo() {
  const [falas, setFalas] = useState<Fala[]>([]);
  const [texto, setTexto] = useState("");
  const [pensando, setPensando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const fim = useRef<HTMLDivElement>(null);

  // Mantém a última fala à vista.
  // biome-ignore lint/correctness/useExhaustiveDependencies: rola quando chega fala nova ou muda o estado de espera
  useEffect(() => {
    fim.current?.scrollIntoView({ behavior: "smooth", block: "end" });
  }, [falas.length, pensando]);

  async function enviar(mensagem: string) {
    const pergunta = mensagem.trim();
    if (!pergunta || pensando) return;
    const conversa: Fala[] = [...falas, { papel: "pastor", texto: pergunta }];
    setFalas(conversa);
    setTexto("");
    setErro(null);
    setPensando(true);
    try {
      const res = await fetch("/api/admin/instagram/assistente", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          mensagens: conversa.map(({ papel, texto: t }) => ({ papel, texto: t })),
        }),
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(d?.error || "O assistente não conseguiu responder.");
      setFalas([
        ...conversa,
        {
          papel: "assistente",
          texto: d.resposta as string,
          ideias: d.ideias as IdeiaSugerida[],
        },
      ]);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "O assistente não conseguiu responder.");
    } finally {
      setPensando(false);
    }
  }

  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      {falas.length === 0 ? (
        <div className="mb-4">
          <p className="mb-3 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
            Pergunte o que quiser sobre o conteúdo do perfil. O assistente lê o que você
            preencheu na aba Perfil. A conversa não fica guardada: ao sair desta tela,
            ela some.
          </p>
          <div className="flex flex-wrap gap-2">
            {SUGESTOES.map((s) => (
              <button
                type="button"
                key={s}
                onClick={() => enviar(s)}
                className="rounded-full border border-mesa-200 bg-bege-50 px-4 py-2 text-sm text-mesa-700 hover:bg-mesa-100"
              >
                {s}
              </button>
            ))}
          </div>
        </div>
      ) : (
        <ol className="mb-4 space-y-4" aria-live="polite">
          {falas.map((f, i) => (
            // A conversa só cresce pelo fim: a posição identifica a fala.
            <li
              key={`${f.papel}-${i}`}
              className={f.papel === "pastor" ? "flex justify-end" : ""}
            >
              <div
                className={
                  f.papel === "pastor"
                    ? "max-w-[85%] rounded-2xl rounded-br-sm bg-mesa-700 px-4 py-2.5 text-sm text-mesa-50"
                    : "max-w-[92%] rounded-2xl rounded-bl-sm border border-mesa-200 bg-bege-50 px-4 py-3 text-sm text-mesa-800"
                }
              >
                <p className="whitespace-pre-line leading-relaxed">{f.texto}</p>
                {f.ideias && f.ideias.length > 0 && (
                  <ul className="mt-3 space-y-2 border-t border-mesa-200 pt-3">
                    {f.ideias.map((ideia) => (
                      <li key={ideia.titulo}>
                        <IdeiaDoAssistente ideia={ideia} onErro={setErro} />
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            </li>
          ))}
          {pensando && (
            <li className="text-sm text-mesa-500" role="status">
              <span
                className="mr-2 inline-block h-2.5 w-2.5 animate-pulse rounded-full bg-laranja-500"
                aria-hidden="true"
              />
              Pensando…
            </li>
          )}
        </ol>
      )}

      {erro && (
        <div
          className="mb-3 rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      <form
        onSubmit={(e) => {
          e.preventDefault();
          enviar(texto);
        }}
        className="flex items-end gap-2"
      >
        <div className="min-w-0 flex-1">
          <label className="sr-only" htmlFor="assistente-texto">
            Sua mensagem
          </label>
          <textarea
            id="assistente-texto"
            rows={2}
            maxLength={2000}
            value={texto}
            onChange={(e) => setTexto(e.target.value)}
            onKeyDown={(e) => {
              // Enter envia; Shift+Enter quebra a linha.
              if (e.key === "Enter" && !e.shiftKey) {
                e.preventDefault();
                enviar(texto);
              }
            }}
            placeholder="Escreva sua pergunta…"
            className="w-full resize-y rounded-xl border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500"
          />
        </div>
        <button
          type="submit"
          disabled={pensando || !texto.trim()}
          className="rounded-full bg-laranja-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60"
        >
          Enviar
        </button>
      </form>
      <div ref={fim} />
    </section>
  );
}

function IdeiaDoAssistente({
  ideia,
  onErro,
}: {
  ideia: IdeiaSugerida;
  onErro: (e: string | null) => void;
}) {
  const [estado, setEstado] = useState<"livre" | "salvando" | "guardada">("livre");

  async function guardar() {
    setEstado("salvando");
    onErro(null);
    try {
      const res = await fetch("/api/admin/instagram/ideias", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          titulo: ideia.titulo,
          formato: ideia.formato,
          nota: ideia.nota,
        }),
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(d?.error || "Não consegui guardar a ideia.");
      setEstado("guardada");
    } catch (e) {
      setEstado("livre");
      onErro(e instanceof Error ? e.message : "Não consegui guardar a ideia.");
    }
  }

  return (
    <div className="flex flex-wrap items-center justify-between gap-2">
      <div className="min-w-0">
        <p className="font-medium text-mesa-800">{ideia.titulo}</p>
        <p className="text-xs text-mesa-500">
          {NOME_FORMATO[ideia.formato] || ideia.formato}
          {ideia.nota ? ` · ${ideia.nota}` : ""}
        </p>
      </div>
      <button
        type="button"
        onClick={guardar}
        disabled={estado !== "livre"}
        className="rounded-full border border-mesa-300 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-70"
      >
        {estado === "guardada"
          ? "✓ No calendário"
          : estado === "salvando"
            ? "Guardando…"
            : "Guardar no calendário"}
      </button>
    </div>
  );
}
