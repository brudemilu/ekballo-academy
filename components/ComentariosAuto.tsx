"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import {
  type ComentarioRespondido,
  MAX_REGRAS,
  MENSAGEM_MAX,
  PALAVRA_MAX,
  RESPOSTA_MAX,
  type RegraComentario,
} from "@/lib/comentarios-auto";

/**
 * Aba Respostas do Instagram (issue #189): quem comenta uma palavra combinada
 * recebe uma resposta pública e/ou uma mensagem direta, sem o pastor precisar
 * ver. Nasce desligado e só liga com pelo menos uma regra.
 */

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";
const BOTAO_PRIMARIO =
  "rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60";
const BOTAO_SECUNDARIO =
  "rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60";

async function chamar(metodo: string, corpo?: object, query = "") {
  const res = await fetch(`/api/admin/instagram/comentarios${query}`, {
    method: metodo,
    headers: corpo ? { "Content-Type": "application/json" } : undefined,
    body: corpo ? JSON.stringify(corpo) : undefined,
  });
  const d = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(d?.error || "Algo deu errado. Tente de novo.");
  return d;
}

function situacao(r: ComentarioRespondido): { txt: string; cls: string } {
  if (r.erro) return { txt: "falhou", cls: "border-red-200 bg-red-50 text-red-700" };
  if (r.publico_ok === null && r.privado_ok === null)
    return { txt: "enviando", cls: "border-mesa-200 bg-mesa-50 text-mesa-600" };
  return { txt: "respondido", cls: "border-mesa-300 bg-white text-mesa-700" };
}

export function ComentariosAuto({
  ativoInicial,
  regrasIniciais,
  historico,
  conectado,
}: {
  ativoInicial: boolean;
  regrasIniciais: RegraComentario[];
  historico: ComentarioRespondido[];
  /** O Instagram está conectado no servidor? Sem isso, nada é respondido. */
  conectado: boolean;
}) {
  const router = useRouter();
  const [ativo, setAtivo] = useState(ativoInicial);
  const [regras, setRegras] = useState(regrasIniciais);
  const [palavra, setPalavra] = useState("");
  const [publica, setPublica] = useState("");
  const [privada, setPrivada] = useState("");
  const [ocupado, setOcupado] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function alternar() {
    setOcupado(true);
    setErro(null);
    try {
      const d = await chamar("PUT", { ativo: !ativo });
      setAtivo(Boolean(d.ativo));
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
    } finally {
      setOcupado(false);
    }
  }

  async function criar(e: React.FormEvent) {
    e.preventDefault();
    setOcupado(true);
    setErro(null);
    try {
      const d = await chamar("POST", {
        palavra,
        resposta_publica: publica,
        mensagem_privada: privada,
      });
      setRegras((l) => [...l, d.regra as RegraComentario]);
      setPalavra("");
      setPublica("");
      setPrivada("");
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao criar a regra.");
    } finally {
      setOcupado(false);
    }
  }

  async function apagar(r: RegraComentario) {
    if (!confirm(`Apagar a regra da palavra "${r.palavra}"?`)) return;
    setOcupado(true);
    setErro(null);
    try {
      await chamar("DELETE", undefined, `?id=${encodeURIComponent(r.id)}`);
      const resto = regras.filter((x) => x.id !== r.id);
      setRegras(resto);
      if (!resto.length) setAtivo(false);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao apagar.");
    } finally {
      setOcupado(false);
    }
  }

  return (
    <div className="space-y-8">
      {/* Ligado / desligado */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div className="min-w-0">
            <h2 className="font-serif text-xl font-semibold text-mesa-800">
              Respostas automáticas a comentários
            </h2>
            <p className="mt-1 text-sm text-mesa-600" role="status">
              {ativo
                ? "Ligado: a cada 5 minutos eu leio os comentários dos últimos posts e respondo a quem escreveu uma das palavras."
                : "Desligado: ninguém recebe resposta automática."}
            </p>
          </div>
          <button
            type="button"
            onClick={alternar}
            disabled={ocupado || (!ativo && regras.length === 0)}
            aria-pressed={ativo}
            className={ativo ? BOTAO_SECUNDARIO : BOTAO_PRIMARIO}
          >
            {ativo ? "Desligar" : "Ligar"}
          </button>
        </div>
        <p className="mt-4 text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
          Funciona assim: no post você escreve “comente MESA que eu te mando o link”.
          Quem comentar a palavra recebe a mensagem direta com o link e, se você quiser,
          uma resposta pública embaixo do comentário. A palavra precisa aparecer inteira
          — “mesa” não dispara com “promessa”. Cada comentário recebe uma resposta só, e
          o texto é exatamente o que você escrever aqui: não há IA nesta parte.
        </p>
        {!conectado && (
          <p
            className="mt-3 rounded-lg border border-amber-200 bg-amber-50 p-3 text-sm text-amber-900"
            role="alert"
          >
            O Instagram não está conectado no servidor. Você pode preparar as regras,
            mas nada será respondido até a conexão ser feita.
          </p>
        )}
        <p className="mt-3 text-xs text-mesa-500">
          A conexão do Instagram precisa ter permissão para ler comentários e enviar
          mensagens. Se faltar, as tentativas aparecem como “falhou” no histórico
          abaixo, com o motivo que o Instagram deu.
        </p>
        {erro && (
          <p className="mt-3 text-sm text-red-700" role="alert">
            {erro}
          </p>
        )}
      </section>

      {/* Regras */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
          Palavras e respostas
        </h2>
        <p className="mb-4 text-sm text-mesa-600">
          Até {MAX_REGRAS} palavras. Use <code>{"{nome}"}</code> para chamar a pessoa
          pelo @ dela.
        </p>

        {regras.length === 0 ? (
          <p className="mb-5 rounded-lg border border-dashed border-mesa-200 p-4 text-sm text-mesa-500">
            Nenhuma palavra cadastrada ainda.
          </p>
        ) : (
          <ul className="mb-5 space-y-3">
            {regras.map((r) => (
              <li
                key={r.id}
                className="rounded-lg border border-mesa-200 bg-bege-50 p-3"
              >
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <h3 className="font-semibold text-mesa-800">{r.palavra}</h3>
                  <button
                    type="button"
                    onClick={() => apagar(r)}
                    disabled={ocupado}
                    aria-label={`Apagar a regra ${r.palavra}`}
                    className="rounded-full border border-mesa-200 bg-white px-3 py-1 text-xs font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60"
                  >
                    Apagar
                  </button>
                </div>
                {r.mensagem_privada && (
                  <p className="mt-2 text-sm text-mesa-700">
                    <span className="font-medium">Mensagem direta:</span>{" "}
                    {r.mensagem_privada}
                  </p>
                )}
                {r.resposta_publica && (
                  <p className="mt-1 text-sm text-mesa-700">
                    <span className="font-medium">Resposta pública:</span>{" "}
                    {r.resposta_publica}
                  </p>
                )}
              </li>
            ))}
          </ul>
        )}

        {regras.length < MAX_REGRAS && (
          <form onSubmit={criar} className="space-y-3 border-t border-mesa-200 pt-4">
            <div>
              <label htmlFor="comentario-palavra" className={ROTULO}>
                Palavra que a pessoa comenta
              </label>
              <input
                id="comentario-palavra"
                value={palavra}
                onChange={(e) => setPalavra(e.target.value)}
                maxLength={PALAVRA_MAX}
                placeholder="MESA"
                className={CAMPO}
              />
            </div>
            <div>
              <label htmlFor="comentario-privada" className={ROTULO}>
                Mensagem direta
              </label>
              <textarea
                id="comentario-privada"
                value={privada}
                onChange={(e) => setPrivada(e.target.value)}
                maxLength={MENSAGEM_MAX}
                rows={3}
                placeholder="Oi {nome}! Aqui está o link da mesa de discipulado: https://…"
                className={CAMPO}
              />
            </div>
            <div>
              <label htmlFor="comentario-publica" className={ROTULO}>
                Resposta pública (opcional)
              </label>
              <input
                id="comentario-publica"
                value={publica}
                onChange={(e) => setPublica(e.target.value)}
                maxLength={RESPOSTA_MAX}
                placeholder="{nome}, te mandei no direct 🙌"
                className={CAMPO}
              />
            </div>
            <button
              type="submit"
              disabled={
                ocupado || !palavra.trim() || (!privada.trim() && !publica.trim())
              }
              className={BOTAO_PRIMARIO}
            >
              {ocupado ? "Salvando…" : "Adicionar palavra"}
            </button>
          </form>
        )}
      </section>

      {/* Histórico */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
          Últimas respostas
        </h2>
        {historico.length === 0 ? (
          <p className="text-sm text-mesa-500">Nenhum comentário respondido ainda.</p>
        ) : (
          <ul className="space-y-2">
            {historico.map((h) => {
              const st = situacao(h);
              return (
                <li
                  key={h.comentario_id}
                  className="rounded-lg border border-mesa-200 bg-bege-50 p-3 text-sm"
                >
                  <p className="text-mesa-800">
                    <span className="font-medium">@{h.usuario || "alguém"}</span>{" "}
                    comentou “{h.texto}”
                  </p>
                  <p className="mt-1 text-xs text-mesa-500">
                    <span
                      className={`mr-2 inline-block rounded-full border px-2 py-0.5 font-semibold ${st.cls}`}
                    >
                      {st.txt}
                    </span>
                    palavra {h.palavra} ·{" "}
                    {new Date(h.criado_em).toLocaleString("pt-BR", {
                      dateStyle: "short",
                      timeStyle: "short",
                      timeZone: "America/Sao_Paulo",
                    })}
                  </p>
                  {h.erro && <p className="mt-1 text-xs text-red-700">{h.erro}</p>}
                </li>
              );
            })}
          </ul>
        )}
      </section>
    </div>
  );
}
