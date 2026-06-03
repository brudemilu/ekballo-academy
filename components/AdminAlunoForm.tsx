"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { formatTelefoneBR, normalizeTelefoneBR } from "@/lib/telefone";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

const PAPEIS_OPCOES = [
  { valor: "master", nome: "Master — acesso a tudo" },
  { valor: "coordenador", nome: "Coordenador — gestão ampla" },
  { valor: "lider", nome: "Líder — acesso restrito" },
  { valor: "discipulo", nome: "Discípulo — sem painel" },
];

export function AdminAlunoForm({
  alunoId,
  initial,
  souMaster = false,
}: {
  alunoId: string;
  initial: { nome: string; email: string; telefone: string; turma: string; papel?: string };
  souMaster?: boolean;
}) {
  const router = useRouter();
  const [nome, setNome] = useState(initial.nome);
  const [telefone, setTelefone] = useState(formatTelefoneBR(initial.telefone));
  const [turma, setTurma] = useState(initial.turma);
  const [papel, setPapel] = useState(initial.papel || "discipulo");
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
      setErro("Coloque o nome do discípulo.");
      setLoading(false);
      return;
    }

    // Telefone é opcional; se preenchido, precisa ser válido.
    let telefoneNorm = "";
    if (telefone.trim()) {
      const n = normalizeTelefoneBR(telefone);
      if (!n) {
        setErro("Celular inválido. Use DDD + número (ex.: 11 99999-8888) ou deixe em branco.");
        setLoading(false);
        return;
      }
      telefoneNorm = n;
    }

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 400));
      setSucesso(true);
      setLoading(false);
      router.refresh();
      return;
    }

    const res = await fetch("/api/admin/atualizar-aluno", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        alunoId,
        nome: nomeTrim,
        telefone: telefoneNorm,
        turma: turma.trim(),
        ...(souMaster ? { papel } : {}),
      }),
    });

    if (!res.ok) {
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
        <label htmlFor="ed-nome" className="mb-1.5 block text-sm font-medium text-mesa-700">
          Nome
        </label>
        <input
          id="ed-nome"
          type="text"
          required
          value={nome}
          onChange={(e) => setNome(e.target.value)}
          className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
        />
      </div>

      <div>
        <label htmlFor="ed-email" className="mb-1.5 block text-sm font-medium text-mesa-700">
          E-mail
        </label>
        <input
          id="ed-email"
          type="email"
          value={initial.email}
          disabled
          className="w-full cursor-not-allowed rounded-lg border border-mesa-200 bg-mesa-100 px-4 py-2.5 text-mesa-500 outline-none"
        />
        <p className="mt-1.5 text-xs text-mesa-500">
          O e-mail é o login do discípulo e não é editável por aqui.
        </p>
      </div>

      <div className="grid gap-5 sm:grid-cols-2">
        <div>
          <label htmlFor="ed-telefone" className="mb-1.5 block text-sm font-medium text-mesa-700">
            Celular (WhatsApp)
          </label>
          <input
            id="ed-telefone"
            type="tel"
            inputMode="numeric"
            autoComplete="off"
            value={telefone}
            onChange={(e) => setTelefone(formatTelefoneBR(e.target.value))}
            placeholder="(11) 99999-8888"
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
          />
        </div>

        <div>
          <label htmlFor="ed-turma" className="mb-1.5 block text-sm font-medium text-mesa-700">
            Turma
          </label>
          <input
            id="ed-turma"
            type="text"
            value={turma}
            onChange={(e) => setTurma(e.target.value)}
            placeholder="Ex.: Turma 2026"
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
          />
        </div>
      </div>

      {souMaster && (
        <div>
          <label htmlFor="ed-papel" className="mb-1.5 block text-sm font-medium text-mesa-700">
            Papel (perfil de acesso)
          </label>
          <select
            id="ed-papel"
            value={papel}
            onChange={(e) => setPapel(e.target.value)}
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
          >
            {PAPEIS_OPCOES.map((p) => (
              <option key={p.valor} value={p.valor}>
                {p.nome}
              </option>
            ))}
          </select>
          <p className="mt-1.5 text-xs text-mesa-500">
            O que cada papel acessa é definido em{" "}
            <a href="/admin/permissoes" className="underline hover:text-mesa-700">
              Permissões
            </a>
            .
          </p>
        </div>
      )}

      {erro && (
        <div className="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {erro}
        </div>
      )}

      {sucesso && (
        <div className="rounded-lg border border-oliveira-200 bg-oliveira-50 px-4 py-3 text-sm text-oliveira-700">
          Cadastro atualizado.
        </div>
      )}

      <button
        type="submit"
        disabled={loading}
        className="rounded-lg bg-mesa-700 px-6 py-3 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-60"
      >
        {loading ? "Salvando..." : "Salvar cadastro"}
      </button>
    </form>
  );
}
