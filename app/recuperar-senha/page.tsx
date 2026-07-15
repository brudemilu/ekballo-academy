"use client";

import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { Logo } from "@/components/Logo";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export default function RecuperarSenhaPage() {
  const router = useRouter();
  const [etapa, setEtapa] = useState<1 | 2>(1);
  const [identificador, setIdentificador] = useState("");
  const [codigo, setCodigo] = useState("");
  const [senha, setSenha] = useState("");
  const [senha2, setSenha2] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [aviso, setAviso] = useState<string | null>(null);

  async function solicitarCodigo(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErro(null);

    try {
      const resp = await fetch("/api/recuperar-senha", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ identificador }),
      });
      const json = await resp.json().catch(() => ({}));
      if (!resp.ok) {
        setErro(json.erro || "Não foi possível enviar o código agora.");
        setLoading(false);
        return;
      }
      setAviso(
        json.mensagem ||
          "Se houver uma conta com WhatsApp cadastrado, enviamos um código por lá."
      );
      setEtapa(2);
    } catch {
      setErro("Falha de conexão. Tente novamente.");
    }
    setLoading(false);
  }

  async function confirmarCodigo(e: React.FormEvent) {
    e.preventDefault();
    setErro(null);

    if (senha.length < 6) {
      setErro("A senha precisa ter pelo menos 6 caracteres.");
      return;
    }
    if (senha !== senha2) {
      setErro("As senhas não conferem.");
      return;
    }

    setLoading(true);
    try {
      const resp = await fetch("/api/recuperar-senha/confirmar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ identificador, codigo, senha }),
      });
      const json = await resp.json().catch(() => ({}));
      if (!resp.ok) {
        setErro(json.erro || "Não foi possível alterar a senha.");
        setLoading(false);
        return;
      }
      router.push("/login?senha=alterada");
    } catch {
      setErro("Falha de conexão. Tente novamente.");
      setLoading(false);
    }
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
          {MOCK && (
            <div className="mb-4 rounded-lg border border-amber-200 bg-amber-50 px-4 py-3 text-xs text-amber-800">
              Modo demo: nenhum WhatsApp é enviado de verdade. Qualquer código de
              6 dígitos é aceito.
            </div>
          )}

          {etapa === 1 ? (
            <>
              <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
                Recuperar senha
              </h1>
              <p className="mb-8 text-sm text-mesa-600">
                Digite o e-mail ou o WhatsApp da sua conta. Vamos enviar um
                código pelo WhatsApp pra você criar uma nova senha.
              </p>

              <form onSubmit={solicitarCodigo} className="space-y-5">
                <div>
                  <label
                    htmlFor="identificador"
                    className="mb-1.5 block text-sm font-medium text-mesa-700"
                  >
                    E-mail ou WhatsApp
                  </label>
                  <input
                    id="identificador"
                    type="text"
                    inputMode="email"
                    required
                    autoComplete="username"
                    value={identificador}
                    onChange={(e) => setIdentificador(e.target.value)}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 text-mesa-900 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100"
                    placeholder="seu@email.com ou (31) 99999-9999"
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
                  className="w-full rounded-lg bg-laranja-500 py-3 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-60"
                >
                  {loading ? "Enviando..." : "Enviar código no WhatsApp"}
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
          ) : (
            <>
              <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
                Criar nova senha
              </h1>
              {aviso && (
                <div className="mb-6 rounded-lg border border-oliveira-200 bg-oliveira-50 px-4 py-3 text-sm text-oliveira-800">
                  {aviso}
                </div>
              )}

              <form onSubmit={confirmarCodigo} className="space-y-5">
                <div>
                  <label
                    htmlFor="codigo"
                    className="mb-1.5 block text-sm font-medium text-mesa-700"
                  >
                    Código de 6 dígitos
                  </label>
                  <input
                    id="codigo"
                    type="text"
                    inputMode="numeric"
                    autoComplete="one-time-code"
                    required
                    maxLength={6}
                    value={codigo}
                    onChange={(e) =>
                      setCodigo(e.target.value.replace(/\D+/g, "").slice(0, 6))
                    }
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 text-center text-2xl font-semibold tracking-[0.4em] text-mesa-900 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100"
                    placeholder="000000"
                  />
                </div>

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
                    autoComplete="new-password"
                    value={senha}
                    onChange={(e) => setSenha(e.target.value)}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100"
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
                    autoComplete="new-password"
                    value={senha2}
                    onChange={(e) => setSenha2(e.target.value)}
                    className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100"
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
                  className="w-full rounded-lg bg-laranja-500 py-3 text-sm font-semibold text-white shadow-sm shadow-laranja-500/20 transition hover:bg-laranja-600 disabled:opacity-60"
                >
                  {loading ? "Salvando..." : "Salvar nova senha"}
                </button>
              </form>

              <button
                type="button"
                onClick={() => {
                  setEtapa(1);
                  setCodigo("");
                  setErro(null);
                }}
                className="mt-6 block w-full text-center text-sm text-mesa-600 underline decoration-mesa-300 hover:text-mesa-800"
              >
                Não recebi o código — voltar
              </button>
            </>
          )}
        </div>
      </div>
    </main>
  );
}
