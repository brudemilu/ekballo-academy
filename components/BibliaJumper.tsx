"use client";

import { useState, useMemo } from "react";
import { useRouter } from "next/navigation";

type LivroOpt = { id: number; nome: string; testamento: "AT" | "NT"; capitulos: number };

export function BibliaJumper({
  livros,
  livroAtualId,
  capituloAtual,
  versaoAtual,
}: {
  livros: LivroOpt[];
  livroAtualId: number;
  capituloAtual: number;
  versaoAtual: string;
}) {
  const router = useRouter();
  const [livroId, setLivroId] = useState<number>(livroAtualId);
  const [capitulo, setCapitulo] = useState<number>(capituloAtual);

  const livroSel = useMemo(
    () => livros.find((l) => l.id === livroId),
    [livros, livroId]
  );

  const caps = useMemo(() => {
    const n = livroSel?.capitulos ?? 1;
    return Array.from({ length: n }, (_, i) => i + 1);
  }, [livroSel]);

  function ir() {
    const v = versaoAtual !== "ACF" ? `?v=${versaoAtual}` : "";
    router.push(`/biblia/${livroId}/${capitulo}${v}`);
  }

  // Quando muda o livro, reseta o capítulo pra 1
  function onLivroChange(id: number) {
    setLivroId(id);
    setCapitulo(1);
  }

  return (
    <div className="flex flex-wrap items-end gap-2">
      <div className="min-w-0 flex-1">
        <label className="mb-1 block text-[10px] font-medium uppercase tracking-wider text-mesa-500">
          Livro
        </label>
        <select
          value={livroId}
          onChange={(e) => onLivroChange(Number(e.target.value))}
          className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
        >
          <optgroup label="Antigo Testamento">
            {livros
              .filter((l) => l.testamento === "AT")
              .map((l) => (
                <option key={l.id} value={l.id}>
                  {l.nome}
                </option>
              ))}
          </optgroup>
          <optgroup label="Novo Testamento">
            {livros
              .filter((l) => l.testamento === "NT")
              .map((l) => (
                <option key={l.id} value={l.id}>
                  {l.nome}
                </option>
              ))}
          </optgroup>
        </select>
      </div>

      <div className="w-24">
        <label className="mb-1 block text-[10px] font-medium uppercase tracking-wider text-mesa-500">
          Cap.
        </label>
        <select
          value={capitulo}
          onChange={(e) => setCapitulo(Number(e.target.value))}
          className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
        >
          {caps.map((c) => (
            <option key={c} value={c}>
              {c}
            </option>
          ))}
        </select>
      </div>

      <button
        type="button"
        onClick={ir}
        disabled={livroId === livroAtualId && capitulo === capituloAtual}
        className="rounded-lg bg-mesa-700 px-4 py-2 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:opacity-40"
      >
        Ir
      </button>
    </div>
  );
}
