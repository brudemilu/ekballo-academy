import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession, getCursoBySlug, isMatriculado } from "@/lib/db";
import {
  listLivros,
  listVersoes,
  agrupar,
  GRUPOS_AT,
  GRUPOS_NT,
  type BibliaLivro,
} from "@/lib/biblia";

export default async function BibliaIndexPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  // Gate de matrícula: aluno precisa estar matriculado no "curso" Bíblia.
  // Admin tem acesso livre.
  if (!session.profile?.is_admin) {
    const cursoBiblia = await getCursoBySlug("biblia");
    if (!cursoBiblia) redirect("/dashboard");
    const matriculado = await isMatriculado(session.userId, cursoBiblia.id);
    if (!matriculado) redirect("/dashboard");
  }

  const [livros, versoes] = await Promise.all([listLivros(), listVersoes()]);
  const { at, nt } = agrupar(livros);
  const versoesAtivas = versoes.filter((v) => v.ativa);

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href={session.profile?.is_admin ? "/admin" : "/dashboard"}>
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-5xl px-6 py-12">
        <Link
          href={session.profile?.is_admin ? "/admin" : "/dashboard"}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Voltar
        </Link>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Escritura
        </p>
        <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
          Bíblia
        </h1>
        <p className="mb-4 max-w-2xl text-mesa-600 text-justify hyphens-auto">
          Leia em qualquer livro, escolha entre {versoesAtivas.length}{" "}
          {versoesAtivas.length === 1 ? "versão" : "versões"} (
          {versoesAtivas.map((v) => v.sigla).join(", ")}). Selecione versículos
          e gere imagens prontas pra postar no Instagram, Status do WhatsApp ou
          compartilhar com a galera.
        </p>
        <div className="mb-12 flex flex-wrap gap-2">
          {versoesAtivas.map((v) => (
            <span
              key={v.sigla}
              className="rounded-full border border-mesa-200 bg-white px-3 py-1 text-xs text-mesa-700"
              title={v.nome}
            >
              <span className="font-medium">{v.sigla}</span>
              <span className="ml-1.5 text-mesa-500">{v.nome}</span>
            </span>
          ))}
        </div>

        <section className="mb-12">
          <h2 className="mb-6 font-serif text-2xl font-semibold text-mesa-700">
            Antigo Testamento
          </h2>
          {GRUPOS_AT.map((g) => (
            <GrupoBlock key={g.key} label={g.label} livros={at[g.key] || []} />
          ))}
        </section>

        <section>
          <h2 className="mb-6 font-serif text-2xl font-semibold text-mesa-700">
            Novo Testamento
          </h2>
          {GRUPOS_NT.map((g) => (
            <GrupoBlock key={g.key} label={g.label} livros={nt[g.key] || []} />
          ))}
        </section>
      </div>
    </main>
  );
}

function GrupoBlock({
  label,
  livros,
}: {
  label: string;
  livros: BibliaLivro[];
}) {
  if (livros.length === 0) return null;
  return (
    <div className="mb-8">
      <p className="mb-3 text-xs font-medium uppercase tracking-wider text-mesa-500">
        {label}
      </p>
      <ul className="grid grid-cols-2 gap-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5">
        {livros.map((l) => (
          <li key={l.id}>
            <Link
              href={`/biblia/${l.id}/1`}
              className="flex h-full items-center justify-between rounded-lg border border-mesa-200 bg-white px-3 py-2.5 text-sm text-mesa-700 transition hover:border-mesa-400 hover:bg-mesa-50"
            >
              <span className="truncate">{l.nome}</span>
              <span className="ml-2 flex-none text-xs text-mesa-400">
                {l.capitulos_total}
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
