import Link from "next/link";
import type { ReactNode } from "react";
import { Logo } from "@/components/Logo";

/** Moldura das páginas de privacidade e termos, no visual do manifesto. */
export function PaginaLegal({
  rotulo,
  titulo,
  atualizada,
  children,
}: {
  rotulo: string;
  titulo: string;
  atualizada: string;
  children: ReactNode;
}) {
  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-5">
          <Link href="/">
            <Logo />
          </Link>
        </nav>
      </header>
      <article className="mx-auto max-w-3xl px-6 py-16">
        <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          {rotulo}
        </p>
        <h1 className="mb-3 font-serif text-4xl font-semibold leading-tight text-mesa-800">
          {titulo}
        </h1>
        <p className="mb-10 text-sm text-mesa-500">Atualizada em {atualizada}.</p>
        <div className="prose-mesa text-mesa-800">{children}</div>
      </article>
    </main>
  );
}
