import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession } from "@/lib/db";
import {
  getDevocionalDoDia,
  listDevocionais,
  formatDataPt,
  hojeDateStr,
} from "@/lib/devocionais";

export default async function DevocionalPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const hoje = hojeDateStr();
  const [doDia, todos] = await Promise.all([
    getDevocionalDoDia(hoje),
    listDevocionais(15),
  ]);
  // Histórico = todos menos o de hoje (que já tá em destaque)
  const historico = todos.filter((d) => d.data !== hoje);

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
          href={session.profile?.is_admin ? "/admin" : "/dashboard"}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Voltar
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Devocional
        </p>
        <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
          {formatDataPt(hoje, true)}
        </h1>
        <p className="mb-10 text-sm text-mesa-500">
          Um versículo, uma reflexão. Para começar (ou fechar) o dia com Cristo.
        </p>

        {doDia ? (
          <DevocionalCard d={doDia} destaque />
        ) : (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-12 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Sem devocional para hoje.
            </p>
            <p className="mt-2 text-sm text-mesa-500">
              O líder posta diariamente. Volte mais tarde ou veja o histórico.
            </p>
          </div>
        )}

        {historico.length > 0 && (
          <div className="mt-12">
            <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
              Devocionais anteriores
            </h2>
            <ul className="space-y-3">
              {historico.map((d) => (
                <li key={d.id}>
                  <Link
                    href={`/devocional/${d.data}`}
                    className="block rounded-xl border border-mesa-200 bg-white p-4 transition hover:border-mesa-300 hover:shadow"
                  >
                    <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
                      {formatDataPt(d.data, true)}
                    </p>
                    <p className="mt-1 font-serif text-lg font-semibold text-mesa-800">
                      {d.titulo || d.versiculo_ref}
                    </p>
                    <p className="mt-1 text-sm italic text-mesa-600 line-clamp-2">
                      &ldquo;{d.versiculo_texto}&rdquo;{" "}
                      <span className="text-mesa-500 not-italic">
                        — {d.versiculo_ref}
                      </span>
                    </p>
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        )}
      </div>
    </main>
  );
}

function DevocionalCard({
  d,
  destaque = false,
}: {
  d: import("@/lib/devocionais").Devocional;
  destaque?: boolean;
}) {
  return (
    <article
      className={`rounded-2xl border border-mesa-200 bg-white p-6 sm:p-10 ${
        destaque ? "shadow-xl shadow-mesa-700/5" : "shadow-sm"
      }`}
    >
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
  );
}
