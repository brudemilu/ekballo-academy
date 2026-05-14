"use client";

import { useState } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";
import { Logo } from "@/components/Logo";

export default function CadastroPage() {
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [sucesso, setSucesso] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);

    if (senha.length < 6) {
      setErro("A senha precisa ter pelo menos 6 caracteres.");
      setLoading(false);
      return;
    }

    const supabase = createClient();
    const { data, error } = await supabase.auth.signUp({
      email,
      password: senha,
      options: {
        data: { nome },
        emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL || window.location.origin}/auth/callback`,
      },
    });

    if (error) {
      setErro(
        error.message.includes("already registered")
          ? "Esse e-mail já tem conta. Faça login."
          : "Não foi possível criar a conta. Tente novamente."
      );
      setLoading(false);
      return;
    }

    // Cria o profile (caso o trigger não tenha rodado)
    if (data.user) {
      await supabase.from("profiles").upsert({
        id: data.user.id,
        nome,
        email,
      });
    }

    setSucesso(true);
    setLoading(false);
  }

  if (sucesso) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-mesa-50 px-6">
        <div className="w-full max-w-md text-center">
          <div className="mb-8 flex justify-center">
            <Link href="/">
              <Logo />
            </Link>
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-10 shadow-xl shadow-mesa-700/5">
            <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-oliveira-100">
              <svg className="h-8 w-8 text-oliveira-600" viewBox="0 0 20 20" fill="currentColor">
                <path fillRule="evenodd" d="M16.704 5.296a1 1 0 010 1.414l-7.5 7.5a1 1 0 01-1.414 0l-3.5-3.5a1 1 0 111.414-1.414L8.5 12.086l6.79-6.79a1 1 0 011.414 0z" clipRule="evenodd" />
              </svg>
            </div>
            <h1 className="mb-3 font-serif text-2xl font-semibold text-mesa-800">
              Conta criada!
            </h1>
            <p className="mb-6 text-mesa-600">
              Te enviamos um e-mail de confirmação para <strong>{email}</strong>. Abra
              sua caixa de entrada e clique no link para ativar sua conta.
            </p>
            <Link
              href="/login"
              className="inline-block rounded-full bg-mesa-700 px-6 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
            >
              Ir para o login
            </Link>
          </div>
        </div>
      </main>
    );
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
          <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
            Sente-se à mesa
          </h1>
          <p className="mb-8 text-sm text-mesa-600">
            Crie sua conta gratuita em menos de 1 minuto.
          </p>

          <form onSubmit={handleSubmit} className="space-y-5">
            <div>
              <label htmlFor="nome" className="mb-1.5 block text-sm font-medium text-mesa-700">
                Como você quer ser chamado(a)
              </label>
              <input
                id="nome"
                type="text"
                required
                value={nome}
                onChange={(e) => setNome(e.target.value)}
                className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
                placeholder="Seu nome"
              />
            </div>

            <div>
              <label htmlFor="email" className="mb-1.5 block text-sm font-medium text-mesa-700">
                E-mail
              </label>
              <input
                id="email"
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-mesa-400 focus:bg-white focus:ring-2 focus:ring-mesa-200"
                placeholder="seu@email.com"
              />
            </div>

            <div>
              <label htmlFor="senha" className="mb-1.5 block text-sm font-medium text-mesa-700">
                Senha (mínimo 6 caracteres)
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
              {loading ? "Criando conta..." : "Criar minha conta gratuita"}
            </button>
          </form>

          <p className="mt-6 text-center text-sm text-mesa-600">
            Já tem conta?{" "}
            <Link
              href="/login"
              className="font-medium text-mesa-700 underline decoration-mesa-300 hover:text-mesa-800"
            >
              Entrar
            </Link>
          </p>
        </div>
      </div>
    </main>
  );
}
