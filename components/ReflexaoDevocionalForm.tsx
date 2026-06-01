"use client";

import { useState, useTransition } from "react";

export function ReflexaoDevocionalForm({
  diaAno,
  textoInicial,
}: {
  diaAno: number;
  textoInicial: string;
}) {
  const [texto, setTexto] = useState(textoInicial);
  const [salvo, setSalvo] = useState(textoInicial);
  const [pending, startTransition] = useTransition();
  const [erro, setErro] = useState<string | null>(null);
  const [ok, setOk] = useState(false);

  const dirty = texto.trim() !== salvo.trim();

  function handleSalvar() {
    setErro(null);
    setOk(false);
    startTransition(async () => {
      try {
        const resp = await fetch("/api/devocional/reflexao", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ dia_ano: diaAno, texto }),
        });
        if (!resp.ok) {
          const j = await resp.json().catch(() => ({}));
          throw new Error(j.erro || `HTTP ${resp.status}`);
        }
        setSalvo(texto.trim());
        setTexto(texto.trim());
        setOk(true);
      } catch (e) {
        setErro(e instanceof Error ? e.message : String(e));
      }
    });
  }

  return (
    <div>
      <p className="mb-1 font-serif text-lg font-semibold text-mesa-800">
        O que mais falou contigo?
      </p>
      <p className="mb-4 text-sm text-mesa-600">
        Anote o que tocou seu coração hoje. É só seu — não é obrigatório.
      </p>

      <textarea
        value={texto}
        onChange={(e) => {
          setTexto(e.target.value);
          setOk(false);
        }}
        rows={5}
        lang="pt-BR"
        placeholder="Descreva aqui o que mais falou contigo, porém não é obrigatório o preenchimento."
        className="w-full resize-y rounded-xl border border-mesa-200 bg-mesa-50/40 px-4 py-3 text-sm leading-relaxed text-mesa-800 placeholder:text-mesa-400 focus:border-oliveira-400 focus:outline-none focus:ring-2 focus:ring-oliveira-200"
      />

      <div className="mt-3 flex flex-wrap items-center justify-between gap-3">
        <div className="text-xs">
          {erro && <span className="text-red-700">{erro}</span>}
          {!erro && ok && !dirty && (
            <span className="text-oliveira-700">✓ Reflexão salva</span>
          )}
        </div>
        <button
          onClick={handleSalvar}
          disabled={pending || !dirty}
          className="rounded-full bg-oliveira-600 px-5 py-2 text-sm font-medium text-white hover:bg-oliveira-700 disabled:opacity-50"
        >
          {pending ? "Salvando..." : "Salvar reflexão"}
        </button>
      </div>
    </div>
  );
}
