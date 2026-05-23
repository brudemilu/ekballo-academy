"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { Logo } from "@/components/Logo";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export default function RedefinirSenhaPage() {
  const router = useRouter();
  const [senha, setSenha] = useState("");
  const [senha2, setSenha2] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [sucesso, setSucesso] = useState(false);
  const [autorizado, setAutorizado] = useState<boolean | null>(null);

  // Verifica se o usuário chegou aqui via link de recovery (tem sessão temporária)
  useEffect(() => {
    if (MOCK) {
      setAutorizado(true);
      return;
    }
    const supabase = createClient();
    supabase.auth.getUser().then(({ data }) => {
      setAutorizado(!!data.user);
    });
  }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);

    if (senha.length < 6) {
      setErro("A senha precisa ter pelo menos 6 caracteres.");
      setLoading(false);
      return;
    }
    if (senha !== senha2) {
      setErro("As senhas não conferem.");
      setLoading(false);
      return;
    }

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 500));
      setSucesso(true);
      setLoading(false);
      setTimeout(() => router.push("/dashboard"), 1500);
      return;
    }

    const supabase = createClient();
    const { error } = await supabase.auth.updateUser({ password: senha });

    if (error) {
      setErro(
        error.message.includes("session")
          ? "Link expirou. Solicite um novo e-mail de recuperação."
          : "Não foi possível alterar a senha. Tente novamente."
      );
      setLoading(false);
      return;
    }

    setSucesso(true);
    setLoading(false);
    setTimeout(() => {
      router.push("/dashboard");
      router.refresh();
    }, 1500);
  }

  return (
    <main className="flex min-h-screen items-center justify-center bg-mesa-50 px-6 py-12">
      <div className="w-full max-w-md">
        <div className="mb-8 flex justify-center">
          <Link href="/">
            <Logo />
          </Link>
        </div>

        <div className="rounded-2xl border border-mesa-200 bg-white p-8 shadow-xl shadow-mesa-700/5 sm:p-10">
          {autorizado === false ? (
            <>
              <h1 className="mb-3 font-serif text-2xl font-semibold text-mesa-800">
                Link inválido
              </h1>
              <p className="mb-6 text-sm text-mesa-600">
                Este link de recuperação expirou ou já foi usado. Solicite um
                novo abaixo.
              </p>
              <Link
                href="/recuperar-senha"
                className="block w-full rounded-lg bg-mesa-700 py-3 text-center text-sm font-medium text-mesa-50 hover:bg-mesa-800"
              >
                Pedir novo link
              </Link>
            </>
          ) : sucesso ? (
            <>
              <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-oliveira-100">
                <svg
                  className="h-8 w-8 text-oliveira-600"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path
                    fillRule="evenodd"
                    d="M16.704 5.296a1 1 0 010 1.414l-7.5 7.5a1 1 0 01-1.414 0l-3.5-3.5a1 1 0 111.414-1.414L8.5 12.086l6.79-6.79a1 1 0 011.414 0z"
                    clipRule="evenodd"
                  />
                </svg>
              </div>
              <h1 className="mb-3 text-center font-serif text-2xl font-semibold text-mesa-800">
                Senha redefinida
              </h1>
              <p className="text-center text-sm text-mesa-600">
                Você já está dentro. Redirecionando…
              </p>
            </>
          ) : (
            <>
              <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
                Nova senha
              </h1>
              <p className="mb-8 text-sm text-mesa-600">
                Defina uma nova senha pra acessar sua conta.
              </p>

              <form onSubmit={handleSubmit} className="space-y-5">
                <div>
                  <label
                    htmlFor="senha"
                    className="mb-1.5 block text-sm font-medium text-mesa-700"
                  >
                    Nova senha
                  </label>
                  <input
                    id="senha"
                    type="password"
                    required
                    minLength={6}
                    value={senha}
                    onChange={(e) => setSenha(e.target.value)}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
                    placeholder="••••••••"
                  />
                </div>

                <div>
                  <label
                    htmlFor="senha2"
                    className="mb-1.5 block text-sm font-medium text-mesa-700"
                  >
                    Confirme a nova senha
                  </label>
                  <input
                    id="senha2"
                    type="password"
                    required
                    minLength={6}
                    value={senha2}
                    onChange={(e) => setSenha2(e.target.value)}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
                    placeholder="••••••••"
                  />
                </div>

                {erro && (
                  <div className="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
                    {erro}
                  </div>
                )}

                <button
                  type="submit"
                  disabled={loading || autorizado === null}
                  className="w-full rounded-lg bg-mesa-700 py-3 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-60"
                >
                  {loading ? "Salvando..." : "Salvar nova senha"}
                </button>
              </form>
            </>
          )}
        </div>
      </div>
    </main>
  );
}
