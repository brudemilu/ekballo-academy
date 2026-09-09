"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState } from "react";
import { podeUsarCaderno } from "@/lib/permissoes";
import { createClient } from "@/lib/supabase/client";

export function UserMenu({
  nome,
  email,
  isAdmin,
  visaoAluno = false,
}: {
  nome: string | null;
  email: string;
  isAdmin: boolean;
  // Master vendo a plataforma pelos olhos de um discípulo. O acesso continua
  // total (livros, caderno, English); o que some é a administração.
  visaoAluno?: boolean;
}) {
  const router = useRouter();
  const [trocando, setTrocando] = useState(false);

  async function trocarVisao(modo: "aluno" | "admin") {
    setTrocando(true);
    try {
      await fetch("/api/visao", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ modo }),
      });
      router.push(modo === "aluno" ? "/dashboard" : "/admin");
      router.refresh();
    } finally {
      setTrocando(false);
    }
  }
  // O caderno é liberado pessoa a pessoa; quem não tem acesso nem vê o atalho.
  const temCaderno = podeUsarCaderno(undefined, isAdmin, email);

  async function handleSair() {
    const supabase = createClient();
    await supabase.auth.signOut();
    router.push("/");
    router.refresh();
  }

  return (
    <div className="flex items-center gap-3">
      {/* Caderno: atalho fixo — precisa ser alcançável de qualquer página
          (mesa, devocional, painel), não só do dashboard. */}
      {temCaderno && (
        <Link
          href="/anotacoes"
          className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 transition hover:border-laranja-300 hover:bg-laranja-50 hover:text-laranja-700"
          title="Minhas anotações"
        >
          ✍️ <span className="hidden sm:inline">Caderno</span>
        </Link>
      )}
      {isAdmin && visaoAluno && (
        // No modo discípulo o único atalho administrativo é a porta de volta.
        <button
          type="button"
          onClick={() => trocarVisao("admin")}
          disabled={trocando}
          className="rounded-full border border-laranja-300 bg-laranja-50 px-3 py-1.5 text-xs font-medium text-laranja-700 transition hover:bg-laranja-100 disabled:opacity-60"
          title="Você está vendo como discípulo. Voltar ao modo administrador."
        >
          👁️ <span className="hidden sm:inline">Modo discípulo · voltar ao admin</span>
          <span className="sm:hidden">Admin</span>
        </button>
      )}
      {isAdmin && !visaoAluno && (
        <>
          <Link
            href="/admin"
            className="hidden rounded-full border border-oliveira-300 bg-oliveira-50 px-3 py-1.5 text-xs font-medium text-oliveira-700 hover:bg-oliveira-100 sm:inline-block"
          >
            Painel admin
          </Link>
          {/* Visível TAMBÉM no celular: é de onde o master mais usa a
              plataforma. No estreito fica só o olho, como o atalho do caderno. */}
          <button
            type="button"
            onClick={() => trocarVisao("aluno")}
            disabled={trocando}
            className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 transition hover:border-laranja-300 hover:bg-laranja-50 hover:text-laranja-700 disabled:opacity-60"
            title="Ver a plataforma como um discípulo vê"
          >
            👁️ <span className="hidden sm:inline">Ver como discípulo</span>
          </button>
        </>
      )}
      <Link
        href="/perfil"
        className="hidden text-right sm:block hover:opacity-80"
        title="Editar meu perfil"
      >
        <p className="text-sm font-medium text-mesa-800">{nome || "Discípulo"}</p>
        <p className="text-xs text-mesa-500">{email}</p>
      </Link>
      <Link
        href="/perfil"
        className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100 sm:hidden"
      >
        Perfil
      </Link>
      <button
        type="button"
        onClick={handleSair}
        className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
      >
        Sair
      </button>
    </div>
  );
}
