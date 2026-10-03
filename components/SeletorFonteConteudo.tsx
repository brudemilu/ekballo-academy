"use client";

import { useEffect, useRef, useState } from "react";

/**
 * Escolha da fonte do conteúdo — uma mesa, o devocional de um dia ou um texto
 * colado. Compartilhado pela aba Roteiros e pelo pacote da semana, que partem
 * da mesma pergunta: "de onde isso vai sair?" (issue #189).
 */

export type CursoOpcao = { id: string; titulo: string; autor?: string | null };
type AulaOpcao = { id: string; titulo: string; ordem: number };
type TipoFonte = "mesa" | "devocional" | "livre";

export type EscolhaFonte = {
  tipo: TipoFonte;
  cursoId: string;
  aulaId: string;
  dataDev: string;
  tituloLivre: string;
  textoLivre: string;
};

export function fonteInicial(hoje: string): EscolhaFonte {
  return {
    tipo: "mesa",
    cursoId: "",
    aulaId: "",
    dataDev: hoje,
    tituloLivre: "",
    textoLivre: "",
  };
}

/** O que vai para a API (o servidor busca o texto). */
export function pedidoDaFonte(e: EscolhaFonte) {
  if (e.tipo === "mesa") return { tipo: e.tipo, cursoId: e.cursoId, aulaId: e.aulaId };
  if (e.tipo === "devocional") return { tipo: e.tipo, data: e.dataDev };
  return { tipo: e.tipo, titulo: e.tituloLivre, texto: e.textoLivre };
}

/** Há fonte suficiente para pedir conteúdo? */
export function fontePronta(e: EscolhaFonte): boolean {
  if (e.tipo === "mesa") return Boolean(e.cursoId && e.aulaId);
  if (e.tipo === "devocional") return Boolean(e.dataDev);
  return e.textoLivre.trim().length >= 80;
}

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";

const FONTES: { v: TipoFonte; label: string }[] = [
  { v: "mesa", label: "📚 Uma mesa ou capítulo" },
  { v: "devocional", label: "🙏 Um devocional" },
  { v: "livre", label: "✍️ Um texto meu" },
];

export function SeletorFonteConteudo({
  cursos,
  valor,
  onMudar,
  onErro,
}: {
  cursos: CursoOpcao[];
  valor: EscolhaFonte;
  onMudar: (v: EscolhaFonte) => void;
  onErro: (mensagem: string) => void;
}) {
  const { tipo, cursoId, aulaId, dataDev, tituloLivre, textoLivre } = valor;
  const [aulas, setAulas] = useState<AulaOpcao[]>([]);

  const setTipo = (v: TipoFonte) => onMudar({ ...valor, tipo: v });
  // Trocar o livro zera a mesa: a escolhida era de outro livro.
  const setCursoId = (v: string) => onMudar({ ...valor, cursoId: v, aulaId: "" });
  const setAulaId = (v: string) => onMudar({ ...valor, aulaId: v });
  const setDataDev = (v: string) => onMudar({ ...valor, dataDev: v });
  const setTituloLivre = (v: string) => onMudar({ ...valor, tituloLivre: v });
  const setTextoLivre = (v: string) => onMudar({ ...valor, textoLivre: v });

  // onErro chega como função nova a cada render do pai; o ref evita refazer a busca por isso.
  const avisar = useRef(onErro);
  avisar.current = onErro;

  // Trocou o livro: busca as mesas dele.
  useEffect(() => {
    setAulas([]);
    if (!cursoId) return;
    let vivo = true;
    fetch(`/api/admin/instagram/roteiros?aulasDe=${cursoId}`)
      .then(async (res) => {
        const d = await res.json().catch(() => ({}));
        if (!res.ok) throw new Error(d?.error || "Falha ao listar as mesas.");
        if (vivo) setAulas(d.aulas as AulaOpcao[]);
      })
      .catch((e) => {
        if (vivo)
          avisar.current(e instanceof Error ? e.message : "Falha ao listar as mesas.");
      });
    return () => {
      vivo = false;
    };
  }, [cursoId]);

  return (
    <>
      <div className="mb-4 flex flex-wrap gap-2">
        {FONTES.map((f) => (
          <button
            type="button"
            key={f.v}
            onClick={() => setTipo(f.v)}
            aria-pressed={tipo === f.v}
            className={`rounded-full border px-4 py-2 text-sm font-semibold transition ${
              tipo === f.v
                ? "border-laranja-600 bg-laranja-50 text-laranja-700"
                : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
            }`}
          >
            {f.label}
          </button>
        ))}
      </div>

      {tipo === "mesa" && (
        <div className="grid gap-4 md:grid-cols-2">
          <div>
            <label className={ROTULO} htmlFor="rot-curso">
              Livro ou temática
            </label>
            <select
              id="rot-curso"
              value={cursoId}
              onChange={(e) => setCursoId(e.target.value)}
              className={CAMPO}
            >
              <option value="">Escolha…</option>
              {cursos.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.titulo}
                  {c.autor ? ` — ${c.autor}` : ""}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className={ROTULO} htmlFor="rot-aula">
              Mesa ou capítulo
            </label>
            <select
              id="rot-aula"
              value={aulaId}
              onChange={(e) => setAulaId(e.target.value)}
              disabled={!cursoId}
              className={CAMPO}
            >
              <option value="">
                {cursoId
                  ? aulas.length
                    ? "Escolha…"
                    : "Carregando…"
                  : "Escolha o livro antes"}
              </option>
              {aulas.map((a) => (
                <option key={a.id} value={a.id}>
                  {a.titulo}
                </option>
              ))}
            </select>
          </div>
        </div>
      )}

      {tipo === "devocional" && (
        <div className="max-w-xs">
          <label className={ROTULO} htmlFor="rot-data">
            Devocional do dia
          </label>
          <input
            id="rot-data"
            type="date"
            value={dataDev}
            onChange={(e) => setDataDev(e.target.value)}
            className={CAMPO}
          />
        </div>
      )}

      {tipo === "livre" && (
        <div className="space-y-3">
          <div>
            <label className={ROTULO} htmlFor="rot-titulo-livre">
              Do que é o texto{" "}
              <span className="font-normal text-mesa-400">(opcional)</span>
            </label>
            <input
              id="rot-titulo-livre"
              maxLength={120}
              value={tituloLivre}
              onChange={(e) => setTituloLivre(e.target.value)}
              placeholder="Ex.: pregação de domingo, João 15"
              className={CAMPO}
            />
          </div>
          <div>
            <label className={ROTULO} htmlFor="rot-texto-livre">
              Texto
            </label>
            <textarea
              id="rot-texto-livre"
              rows={7}
              value={textoLivre}
              onChange={(e) => setTextoLivre(e.target.value)}
              placeholder="Cole o trecho da pregação, da anotação ou do estudo. O roteiro sai só do que estiver aqui."
              className={CAMPO}
            />
          </div>
        </div>
      )}
    </>
  );
}
