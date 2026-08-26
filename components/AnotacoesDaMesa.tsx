"use client";

// =============================================================
// EKBALLO ACADEMY · Caderno da mesa (card dentro da página da aula)
//
// É o mesmo caderno de /anotacoes, aberto no contexto da leitura: a anotação
// já nasce ligada ao livro e à mesa, e dá pra escrever sem sair da página.
// Diferente das "Anotações da mesa" que são atividade (razao='anotacao', o
// líder lê), isto aqui é privado por padrão — é o caderno do discípulo.
// =============================================================

import { useCallback, useEffect, useRef, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { EditorRico } from "@/components/EditorRico";
import { htmlParaTexto, resumir } from "@/lib/sanitizar-html";
import { tituloExibido, tempoRelativo, type AnotacaoRich } from "@/lib/anotacoes-meta";

const ESPERA_AUTOSAVE = 1200;

export function AnotacoesDaMesa({
  anotacoesIniciais,
  cursoId,
  aulaId,
  tituloSugerido,
}: {
  anotacoesIniciais: AnotacaoRich[];
  cursoId: string;
  aulaId: string;
  /** Vira o título da anotação nova: "Mesa 03 — O ego transformado". */
  tituloSugerido: string;
}) {
  const router = useRouter();
  const [anotacoes, setAnotacoes] = useState(anotacoesIniciais);
  const [ativaId, setAtivaId] = useState<string | null>(
    anotacoesIniciais.length === 1 ? anotacoesIniciais[0].id : null,
  );
  const [html, setHtml] = useState(
    anotacoesIniciais.length === 1 ? anotacoesIniciais[0].conteudo_html : "",
  );
  const [estado, setEstado] = useState<"limpo" | "pendente" | "salvando" | "salvo" | "erro">(
    "limpo",
  );
  const [criando, setCriando] = useState(false);

  const htmlRef = useRef(html);
  htmlRef.current = html;
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  const ativa = anotacoes.find((a) => a.id === ativaId) ?? null;

  const salvar = useCallback(async () => {
    if (!ativaId) return;
    setEstado("salvando");
    try {
      const res = await fetch(`/api/anotacoes/${ativaId}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ conteudo_html: htmlRef.current }),
      });
      if (!res.ok) throw new Error(String(res.status));
      const { anotacao } = (await res.json()) as { anotacao: AnotacaoRich };
      setAnotacoes((lista) => lista.map((a) => (a.id === anotacao.id ? anotacao : a)));
      setEstado("salvo");
    } catch {
      setEstado("erro");
    }
  }, [ativaId]);

  useEffect(() => {
    if (estado !== "pendente") return;
    if (timerRef.current) clearTimeout(timerRef.current);
    timerRef.current = setTimeout(() => void salvar(), ESPERA_AUTOSAVE);
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current);
    };
  }, [estado, html, salvar]);

  async function criar() {
    setCriando(true);
    try {
      const res = await fetch("/api/anotacoes", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          titulo: tituloSugerido,
          categoria: "aula",
          cor: "terracota",
          curso_id: cursoId,
          aula_id: aulaId,
        }),
      });
      if (!res.ok) return;
      const { anotacao } = (await res.json()) as { anotacao: AnotacaoRich };
      setAnotacoes((lista) => [anotacao, ...lista]);
      setAtivaId(anotacao.id);
      setHtml("");
      setEstado("limpo");
      router.refresh();
    } finally {
      setCriando(false);
    }
  }

  function abrir(a: AnotacaoRich) {
    setAtivaId(a.id);
    setHtml(a.conteudo_html);
    setEstado("limpo");
  }

  const rotulo =
    estado === "salvando"
      ? "Salvando…"
      : estado === "erro"
        ? "Erro ao salvar"
        : estado === "pendente"
          ? "Escrevendo…"
          : ativa
            ? `Salvo · ${tempoRelativo(ativa.atualizado_em)}`
            : "";

  return (
    <section className="mb-12 rounded-2xl border border-mesa-200 bg-white p-6 shadow-sm sm:p-8">
      <div className="mb-5 flex flex-wrap items-start justify-between gap-3">
        <div>
          <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            ✍️ Meu caderno
          </p>
          <h2 className="font-serif text-2xl font-semibold text-mesa-800">
            Anotações desta mesa
          </h2>
          <p className="mt-1.5 text-sm leading-relaxed text-mesa-600">
            Privado — só você lê, a menos que compartilhe. Fica guardado no{" "}
            <Link href="/anotacoes" className="text-laranja-600 underline">
              seu caderno
            </Link>
            .
          </p>
        </div>
        <div className="flex items-center gap-2">
          {rotulo && <span className="text-xs text-mesa-500">{rotulo}</span>}
          {ativa && (
            <Link
              href={`/anotacoes/${ativa.id}`}
              className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
              title="Abrir no caderno, com todas as ferramentas"
            >
              ⤢ Abrir
            </Link>
          )}
          <button
            onClick={criar}
            disabled={criando}
            className="rounded-full bg-laranja-500 px-4 py-1.5 text-xs font-semibold text-white transition hover:bg-laranja-600 disabled:opacity-60"
          >
            + Nova
          </button>
        </div>
      </div>

      {/* Abas quando há mais de uma anotação nesta mesa */}
      {anotacoes.length > 1 && (
        <div className="mb-4 flex flex-wrap gap-1.5">
          {anotacoes.map((a) => (
            <button
              key={a.id}
              onClick={() => abrir(a)}
              className={`max-w-[220px] truncate rounded-full border px-3 py-1.5 text-xs font-medium transition ${
                a.id === ativaId
                  ? "border-laranja-300 bg-laranja-50 text-laranja-700"
                  : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
              }`}
            >
              {tituloExibido(a)}
            </button>
          ))}
        </div>
      )}

      {ativa ? (
        <EditorRico
          key={ativa.id}
          htmlInicial={ativa.conteudo_html}
          onChange={(novo) => {
            setHtml(novo);
            setEstado("pendente");
          }}
          onSalvarAtalho={() => void salvar()}
          alturaMinima={240}
          compacto
          placeholder="O que esta mesa falou com você? Frases, dúvidas, aplicações…"
        />
      ) : anotacoes.length === 0 ? (
        <button
          onClick={criar}
          disabled={criando}
          className="w-full rounded-xl border-2 border-dashed border-mesa-300 bg-mesa-50/50 px-6 py-10 text-center transition hover:border-laranja-300 hover:bg-laranja-50/40"
        >
          <p className="font-serif text-lg text-mesa-700">
            {criando ? "Abrindo o caderno…" : "Começar uma anotação desta mesa"}
          </p>
          <p className="mt-1.5 text-sm text-mesa-500">
            Texto formatado, listas, marca-texto — e dá pra salvar em PDF depois.
          </p>
        </button>
      ) : (
        <div className="space-y-2">
          {anotacoes.map((a) => (
            <button
              key={a.id}
              onClick={() => abrir(a)}
              className="block w-full rounded-xl border border-mesa-200 bg-mesa-50/50 px-4 py-3 text-left transition hover:border-laranja-300 hover:bg-white"
            >
              <p className="font-medium text-mesa-800">{tituloExibido(a)}</p>
              <p className="mt-0.5 line-clamp-2 text-xs text-mesa-500">
                {resumir(htmlParaTexto(a.conteudo_html), 140) || "Anotação em branco."}
              </p>
            </button>
          ))}
        </div>
      )}
    </section>
  );
}
