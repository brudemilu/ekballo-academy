"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { formatTelefoneBR, normalizeTelefoneBR } from "@/lib/telefone";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Banner que aparece pra quem está logado SEM telefone cadastrado.
// Pede o WhatsApp na hora (campo inline), pra que a recuperação de senha
// por WhatsApp e os avisos da liderança funcionem.
export function CompletarTelefoneBanner({ userId }: { userId: string }) {
  const router = useRouter();
  const [telefone, setTelefone] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [pronto, setPronto] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);

    const telefoneNorm = normalizeTelefoneBR(telefone);
    if (!telefoneNorm) {
      setErro("Informe um celular válido com DDD (ex.: 11 99999-8888).");
      setLoading(false);
      return;
    }

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 400));
      setPronto(true);
      setLoading(false);
      return;
    }

    const supabase = createClient();
    const { error } = await supabase
      .from("profiles")
      .update({ telefone: telefoneNorm })
      .eq("id", userId);

    if (error) {
      setErro("Não foi possível salvar agora. Tente de novo.");
      setLoading(false);
      return;
    }

    setPronto(true);
    setLoading(false);
    router.refresh(); // some o banner (perfil agora tem telefone)
  }

  if (pronto) {
    return (
      <div className="mb-8 rounded-2xl border border-oliveira-200 bg-oliveira-50 px-6 py-4 text-sm text-oliveira-800">
        WhatsApp cadastrado, obrigado! Agora você consegue recuperar a senha por
        ele.
      </div>
    );
  }

  return (
    <div className="mb-8 rounded-2xl border border-laranja-200 bg-laranja-50 px-6 py-5">
      <h2 className="font-serif text-lg font-semibold text-mesa-800">
        Cadastre seu WhatsApp 📱
      </h2>
      <p className="mt-1 text-sm text-mesa-700">
        Você ainda não tem um WhatsApp no cadastro. Ele é necessário pra você
        recuperar sua senha e receber os avisos da liderança.
      </p>

      <form
        onSubmit={handleSubmit}
        className="mt-4 flex flex-col gap-3 sm:flex-row sm:items-start"
      >
        <div className="flex-1">
          <input
            type="tel"
            inputMode="numeric"
            autoComplete="tel-national"
            required
            value={telefone}
            onChange={(e) => setTelefone(formatTelefoneBR(e.target.value))}
            placeholder="(11) 99999-8888"
            className="w-full rounded-lg border border-mesa-200 bg-white px-4 py-2.5 outline-none transition focus:border-laranja-400 focus:ring-2 focus:ring-laranja-200"
          />
          {erro && <p className="mt-1.5 text-sm text-red-700">{erro}</p>}
        </div>
        <button
          type="submit"
          disabled={loading}
          className="flex-none rounded-lg bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-60"
        >
          {loading ? "Salvando..." : "Salvar WhatsApp"}
        </button>
      </form>
    </div>
  );
}
