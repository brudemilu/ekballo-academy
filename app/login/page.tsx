"use client";

import { Suspense, useState } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";
import { Logo } from "@/components/Logo";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export default function LoginPage() {
  return (
    <Suspense fallback={<div className="min-h-screen bg-mesa-50" />}>
      <LoginForm />
    </Suspense>
  );
}

function LoginForm() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const next = searchParams.get("next") || "/dashboard";

  const [email, setEmail] = useState(MOCK ? "iabolsa@bmbr.com.br" : "");
  const [senha, setSenha] = useState(MOCK ? "qualquer-senha" : "");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);

    if (MOCK) {
      // Modo demo: pula auth, vai direto pra dentro
      router.push(next);
      router.refresh();
      return;
    }

    const supabase = createClient();
    const { error } = await supabase.auth.signInWithPassword({
      email,
      password: senha,
    });

    if (error) {
      setErro(
        error.message === "Invalid login credentials"
          ? "E-mail ou senha incorretos."
          : "Não foi possível entrar. Tente novamente."
      );
      setLoading(false);
      return;
    }

    router.push(next);
    router.refresh();
  }

  return (
    <main className="flex min-h-screen items-center justify-center bg-mesa-50 px-6">
      <div className="w-full max-w-md">
        <div className="mb-8 flex justify-center">
          <Link href="/">
            <Logo />
          </Link>
        </div>

        {MOCK && (
          <div className="mb-4 rounded-lg border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
            <strong>Modo demonstração ativo.</strong> Login está liberado — só clique em &ldquo;Entrar&rdquo; pra entrar como Lucas (admin).
          </div>
        )}

        <div className="rounded-2xl border border-mesa-200 bg-white p-8 shadow-xl shadow-mesa-700/5 sm:p-10">
          <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
            Bem-vindo de volta
          </h1>
          <p className="mb-8 text-sm text-mesa-600">
            Entre para continuar sua caminhada.
          </p>

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

            <div>
              <label
                htmlFor="senha"
                className="mb-1.5 block text-sm font-medium text-mesa-700"
              >
                Senha
              </label>
              <input
                id="senha"
                type="password"
                required
                value={senha}
                onChange={(e) => setSenha(e.target.value)}
                className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 text-mesa-900 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
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
              disabled={loading}
              className="w-full rounded-lg bg-mesa-700 py-3 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800 disabled:opacity-60"
            >
              {loading ? "Entrando..." : "Entrar"}
            </button>
          </form>

          <p className="mt-4 text-center text-sm">
            <Link
              href="/recuperar-senha"
              className="text-mesa-600 underline decoration-mesa-300 hover:text-mesa-800"
            >
              Esqueci minha senha
            </Link>
          </p>

          <p className="mt-6 text-center text-sm text-mesa-600">
            Ainda não tem conta?{" "}
            <Link
              href="/cadastro"
              className="font-medium text-mesa-700 underline decoration-mesa-300 hover:text-mesa-800"
            >
              Criar conta gratuita
            </Link>
          </p>
        </div>
      </div>
    </main>
  );
}
