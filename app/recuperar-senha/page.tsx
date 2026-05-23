"use client";

import { useState } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";
import { Logo } from "@/components/Logo";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export default function RecuperarSenhaPage() {
  const [email, setEmail] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [enviado, setEnviado] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 500));
      setEnviado(true);
      setLoading(false);
      return;
    }

    const supabase = createClient();
    const origin =
      process.env.NEXT_PUBLIC_SITE_URL || window.location.origin;
    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${origin}/auth/callback?next=/redefinir-senha`,
    });

    if (error) {
      setErro("Não foi possível enviar o e-mail agora. Tente novamente.");
      setLoading(false);
      return;
    }

    setEnviado(true);
    setLoading(false);
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
          {enviado ? (
            <>
              <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-oliveira-100">
                <svg
                  className="h-8 w-8 text-oliveira-600"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path d="M2.94 6.91A1 1 0 013.83 6h12.34a1 1 0 01.89.54L10 13 2.94 6.91z" />
                  <path d="M18 8.12V14a2 2 0 01-2 2H4a2 2 0 01-2-2V8.12l8 6.88 8-6.88z" />
                </svg>
              </div>
              <h1 className="mb-3 text-center font-serif text-2xl font-semibold text-mesa-800">
                Verifique seu e-mail
              </h1>
              <p className="mb-6 text-center text-sm text-mesa-600">
                Se houver uma conta para <strong>{email}</strong>, enviamos um
                link para você criar uma nova senha. O link expira em 1 hora.
              </p>
              <Link
                href="/login"
                className="block w-full rounded-lg bg-mesa-700 py-3 text-center text-sm font-medium text-mesa-50 hover:bg-mesa-800"
              >
                Voltar para o login
              </Link>
            </>
          ) : (
            <>
              <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
                Recuperar senha
              </h1>
              <p className="mb-8 text-sm text-mesa-600">
                Digite o e-mail da sua conta. Vamos enviar um link pra você
                criar uma nova senha.
              </p>

              {MOCK && (
                <div className="mb-4 rounded-lg border border-amber-200 bg-amber-50 px-4 py-3 text-xs text-amber-800">
                  Modo demo: nenhum e-mail é enviado de verdade.
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-5">
                <div>
                  <label
                    htmlFor="email"
                    className="mb-1.5 block text-sm font-medium text-mesa-700"
                  >
                    E-mail
                  </label>
                  <input
                    id="email"
                    type="email"
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 text-mesa-900 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
                    placeholder="seu@email.com"
                  />
                </div>

                {erro && (
                  <div className="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
                    {erro}
                  </div>
                )}

                <button
                  type="submit"
                  disabled={loading}
                  className="w-full rounded-lg bg-mesa-700 py-3 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-60"
                >
                  {loading ? "Enviando..." : "Enviar link de recuperação"}
                </button>
              </form>

              <p className="mt-6 text-center text-sm text-mesa-600">
                Lembrou da senha?{" "}
                <Link
                  href="/login"
                  className="font-medium text-mesa-700 underline decoration-mesa-300 hover:text-mesa-800"
                >
                  Voltar para o login
                </Link>
              </p>
            </>
          )}
        </div>
      </div>
    </main>
  );
}
