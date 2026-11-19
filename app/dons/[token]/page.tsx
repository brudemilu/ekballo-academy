import type { Metadata } from "next";
import Link from "next/link";
import type { ReactNode } from "react";
import { DonsQuestionario } from "@/components/DonsQuestionario";
import { DonsResultado } from "@/components/DonsResultado";
import { Logo } from "@/components/Logo";
import { situacaoDoLink } from "@/lib/dons-db";

// Teste de Dons Ministeriais pelo link (issue #289). Página PÚBLICA de
// propósito: quem responde não tem conta no Ekballo. O que protege os
// dados é o token (128 bits) e o fato de esta página só mostrar o
// resultado da própria pessoa — nunca lista ninguém.

export const metadata: Metadata = {
  title: "Teste de Dons Ministeriais · Ekballo",
  // Link pessoal não deve aparecer em busca nenhuma.
  robots: { index: false, follow: false },
};

// Cada acesso confere o estado atual do link (ativo, já respondido).
export const dynamic = "force-dynamic";

function Moldura({ children }: { children: ReactNode }) {
  return (
    <main className="min-h-screen bg-bege-50">
      <header className="nao-imprimir border-b border-mesa-200">
        <nav className="mx-auto flex max-w-2xl items-center px-4 py-4 sm:px-6">
          <Link href="/">
            <Logo />
          </Link>
        </nav>
      </header>
      <div className="mx-auto max-w-2xl px-4 py-8 sm:px-6 sm:py-12">{children}</div>
    </main>
  );
}

function Aviso({ titulo, texto }: { titulo: string; texto: string }) {
  return (
    <Moldura>
      <div className="rounded-2xl border border-mesa-200 bg-white p-8 text-center">
        <h1 className="mb-2 font-serif text-2xl font-semibold text-mesa-900">
          {titulo}
        </h1>
        <p className="text-mesa-600">{texto}</p>
      </div>
    </Moldura>
  );
}

export default async function TesteDonsPage({
  params,
}: {
  params: Promise<{ token: string }>;
}) {
  const { token } = await params;
  const situacao = await situacaoDoLink(token);

  if (situacao.estado === "invalido") {
    return (
      <Aviso
        titulo="Link não encontrado"
        texto="Confira se o endereço chegou inteiro ou peça um novo link a quem enviou."
      />
    );
  }
  if (situacao.estado === "inativo") {
    return (
      <Aviso
        titulo="Este link foi encerrado"
        texto="Peça um novo link a quem enviou o teste para você."
      />
    );
  }
  if (situacao.estado === "respondido") {
    const data = new Intl.DateTimeFormat("pt-BR", {
      timeZone: "America/Sao_Paulo",
      day: "numeric",
      month: "long",
      year: "numeric",
    }).format(new Date(situacao.respondidoEm));
    return (
      <Moldura>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-laranja-600">
          Teste de Dons Ministeriais
        </p>
        <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-900">
          Você já respondeu este teste
        </h1>
        <p className="mb-8 text-mesa-600">
          {situacao.nome} · {data}. Este é o resultado que apareceu para você.
        </p>
        <DonsResultado resultado={situacao.resultado} />
      </Moldura>
    );
  }

  return (
    <Moldura>
      <DonsQuestionario token={token} nomeConhecido={situacao.pessoa?.nome ?? null} />
    </Moldura>
  );
}
