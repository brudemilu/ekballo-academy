import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { CapituloLeitor } from "@/components/CapituloLeitor";
import { getCurrentSession } from "@/lib/db";
import { getLivro, getCapitulo } from "@/lib/biblia";

export default async function CapituloPage({
  params,
}: {
  params: Promise<{ livroId: string; capitulo: string }>;
}) {
  const { livroId, capitulo } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const livroIdN = Number(livroId);
  const capN = Number(capitulo);
  if (!Number.isInteger(livroIdN) || !Number.isInteger(capN)) notFound();

  const livro = await getLivro(livroIdN);
  if (!livro) notFound();
  if (capN < 1 || capN > livro.capitulos_total) notFound();

  const versiculos = await getCapitulo(livroIdN, capN);

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

      <div className="mx-auto max-w-3xl px-6 py-12 pb-32">
        <Link
          href="/biblia"
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Todos os livros
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          {livro.testamento === "AT" ? "Antigo Testamento" : "Novo Testamento"}
        </p>
        <h1 className="mb-1 font-serif text-4xl font-semibold text-mesa-800">
          {livro.nome}{" "}
          <span className="text-mesa-500">{capN}</span>
        </h1>
        <p className="mb-8 text-sm text-mesa-500">
          Toque nos versículos pra selecionar. Quando quiser, gere imagem pra
          postar.
        </p>

        <CapituloLeitor
          livroId={livro.id}
          livroNome={livro.nome}
          capitulo={capN}
          capitulosTotal={livro.capitulos_total}
          versiculos={versiculos.map((v) => ({
            numero: v.versiculo,
            texto: v.texto,
          }))}
        />
      </div>
    </main>
  );
}
