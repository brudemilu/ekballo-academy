"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { formatTelefoneBR, normalizeTelefoneBR } from "@/lib/telefone";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export function PerfilForm({
  userId,
  initial,
}: {
  userId: string;
  initial: { nome: string; email: string; telefone: string };
}) {
  const router = useRouter();
  const [nome, setNome] = useState(initial.nome);
  const [telefone, setTelefone] = useState(formatTelefoneBR(initial.telefone));
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [sucesso, setSucesso] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);
    setSucesso(false);

    const nomeTrim = nome.trim();
    if (nomeTrim.length < 2) {
      setErro("Coloque seu nome.");
      setLoading(false);
      return;
    }

    const telefoneNorm = normalizeTelefoneBR(telefone);
    if (!telefoneNorm) {
      setErro("Informe um celular válido com DDD (ex.: 11 99999-8888).");
      setLoading(false);
      return;
    }

    if (MOCK) {
      // Mock: simula salvar
      await new Promise((r) => setTimeout(r, 400));
      setSucesso(true);
      setLoading(false);
      return;
    }

    const supabase = createClient();
    const { error } = await supabase
      .from("profiles")
      .update({ nome: nomeTrim, telefone: telefoneNorm })
      .eq("id", userId);

    if (error) {
      setErro("Não foi possível salvar. Tente novamente.");
      setLoading(false);
      return;
    }

    setSucesso(true);
    setLoading(false);
    router.refresh();
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-5">
      <div>
        <label htmlFor="nome" className="mb-1.5 block text-sm font-medium text-mesa-700">
          Nome
        </label>
        <input
          id="nome"
          type="text"
          required
          value={nome}
          onChange={(e) => setNome(e.target.value)}
          className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
        />
      </div>

      <div>
        <label htmlFor="email" className="mb-1.5 block text-sm font-medium text-mesa-700">
          E-mail
        </label>
        <input
          id="email"
          type="email"
          value={initial.email}
          disabled
          className="w-full cursor-not-allowed rounded-lg border border-mesa-200 bg-mesa-100 px-4 py-2.5 text-mesa-500 outline-none"
        />
        <p className="mt-1.5 text-xs text-mesa-500">
          Pra trocar de e-mail, fale com a liderança.
        </p>
      </div>

      <div>
        <label htmlFor="telefone" className="mb-1.5 block text-sm font-medium text-mesa-700">
          Celular (WhatsApp)
        </label>
        <input
          id="telefone"
          type="tel"
          inputMode="numeric"
          autoComplete="tel-national"
          required
          value={telefone}
          onChange={(e) => setTelefone(formatTelefoneBR(e.target.value))}
          placeholder="(11) 99999-8888"
          className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
        />
        <p className="mt-1.5 text-xs text-mesa-500">
          Usamos pra avisar sobre devolutivas, novos cursos e lembretes.
        </p>
      </div>

      {erro && (
        <div className="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {erro}
        </div>
      )}

      {sucesso && (
        <div className="rounded-lg border border-oliveira-200 bg-oliveira-50 px-4 py-3 text-sm text-oliveira-700">
          Dados atualizados.
        </div>
      )}

      <button
        type="submit"
        disabled={loading}
        className="w-full rounded-lg bg-mesa-700 py-3 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-60"
      >
        {loading ? "Salvando..." : "Salvar alterações"}
      </button>
    </form>
  );
}
