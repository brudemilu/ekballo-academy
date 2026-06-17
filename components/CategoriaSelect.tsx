"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { CATEGORIAS, SEM_CATEGORIA_LABEL } from "@/lib/categorias";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Editor inline da seção de um curso (admin). Troca `cursos.categoria` no
// banco e atualiza a vitrine. Sem categoria = "Outros" (value="").
export function CategoriaSelect({
  cursoId,
  categoriaAtual,
}: {
  cursoId: string;
  categoriaAtual?: string | null;
}) {
  const router = useRouter();
  const [valor, setValor] = useState(categoriaAtual ?? "");
  const [salvando, setSalvando] = useState(false);
  const [erro, setErro] = useState(false);

  async function onChange(e: React.ChangeEvent<HTMLSelectElement>) {
    const novo = e.target.value;
    const anterior = valor;
    setValor(novo);
    setErro(false);
    setSalvando(true);

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 300));
      setSalvando(false);
      return;
    }

    const supabase = createClient();
    const { error } = await supabase
      .from("cursos")
      .update({ categoria: novo || null })
      .eq("id", cursoId);

    setSalvando(false);
    if (error) {
      setValor(anterior); // reverte
      setErro(true);
      return;
    }
    router.refresh();
  }

  return (
    <span className="inline-flex items-center gap-1.5">
      <select
        value={valor}
        onChange={onChange}
        disabled={salvando}
        aria-label="Seção do curso"
        // Impede que o clique navegue pelo <Link> que envolve o card.
        onClick={(e) => e.preventDefault()}
        className="rounded-full border border-mesa-200 bg-mesa-50 px-2 py-0.5 text-xs font-medium text-mesa-600 outline-none transition hover:border-mesa-300 focus:border-laranja-300 disabled:opacity-60"
      >
        <option value="">{SEM_CATEGORIA_LABEL}</option>
        {CATEGORIAS.map((c) => (
          <option key={c.slug} value={c.slug}>
            {c.label}
          </option>
        ))}
      </select>
      {salvando && <span className="text-xs text-mesa-400">salvando…</span>}
      {erro && <span className="text-xs text-red-500">erro</span>}
    </span>
  );
}
