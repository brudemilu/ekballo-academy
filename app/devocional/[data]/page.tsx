import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession } from "@/lib/db";
import { getDevocionalDoDia, formatDataPt } from "@/lib/devocionais";

export default async function DevocionalPorDataPage({
  params,
}: {
  params: Promise<{ data: string }>;
}) {
  const { data } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  // Valida formato YYYY-MM-DD
  if (!/^\d{4}-\d{2}-\d{2}$/.test(data)) notFound();

  const d = await getDevocionalDoDia(data);
  if (!d) notFound();

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-3xl items-center justify-between px-6 py-4">
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

      <div className="mx-auto max-w-3xl px-6 py-12">
        <Link
          href="/devocional"
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Devocional de hoje
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Devocional
        </p>
        <h1 className="mb-10 font-serif text-4xl font-semibold text-mesa-800">
          {formatDataPt(d.data, true)}
        </h1>

        <article className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-10 shadow-xl shadow-mesa-700/5">
          {d.titulo && (
            <h2 className="mb-4 font-serif text-3xl font-semibold text-mesa-800">
              {d.titulo}
            </h2>
          )}
          <blockquote className="border-l-4 border-laranja-400 bg-laranja-50/40 px-5 py-4">
            <p className="font-serif text-xl italic leading-relaxed text-mesa-800">
              &ldquo;{d.versiculo_texto}&rdquo;
            </p>
            <footer className="mt-2 text-sm font-medium text-mesa-700">
              {d.versiculo_ref}{" "}
              <span className="text-xs uppercase tracking-wider text-mesa-500">
                · {d.versiculo_versao}
              </span>
            </footer>
          </blockquote>

          <div className="prose-mesa mt-6 text-mesa-800">
            {d.reflexao.split("\n\n").map((p, i) => (
              <p key={i} className="whitespace-pre-wrap">
                {p}
              </p>
            ))}
          </div>

          {d.autor && (
            <p className="mt-6 border-t border-mesa-100 pt-4 text-sm text-mesa-500">
              — {d.autor}
            </p>
          )}
        </article>
      </div>
    </main>
  );
}
