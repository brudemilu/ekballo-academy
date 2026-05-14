import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";

export default async function RespostasPage({
  searchParams,
}: {
  searchParams: Promise<{ filtro?: string; curso?: string }>;
}) {
  const { filtro, curso: cursoSlug } = await searchParams;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("nome, email, is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin) redirect("/dashboard");

  let query = supabase
    .from("respostas")
    .select(
      "id, texto, comentario_lider, created_at, updated_at, atividade:atividades(pergunta, aula:aulas(titulo, curso:cursos(titulo, slug))), aluno:profiles(nome, email)"
    )
    .order("created_at", { ascending: false });

  if (filtro === "pendentes") query = query.is("comentario_lider", null);
  if (filtro === "comentadas") query = query.not("comentario_lider", "is", null);

  const { data: respostas } = await query.limit(100);

  const filtradas = (respostas || []).filter((r: any) =>
    cursoSlug ? r.atividade?.aula?.curso?.slug === cursoSlug : true
  );

  const { data: cursos } = await supabase
    .from("cursos")
    .select("slug, titulo")
    .order("titulo");

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/admin">
            <Logo />
          </Link>
          <UserMenu nome={profile.nome} email={profile.email || ""} isAdmin />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        <Link
          href="/admin"
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Painel
        </Link>

        <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
              Banco de respostas
            </p>
            <h1 className="font-serif text-4xl font-semibold text-mesa-800">
              Reflexões dos discípulos
            </h1>
          </div>
          <Link
            href="/admin/respostas/exportar"
            className="rounded-full border border-mesa-300 bg-white px-5 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-50"
          >
            Exportar CSV
          </Link>
        </div>

        <div className="mb-6 flex flex-wrap gap-2">
          <FiltroLink filtro={undefined} atual={filtro}>
            Todas ({filtradas.length})
          </FiltroLink>
          <FiltroLink filtro="pendentes" atual={filtro}>
            Aguardando devolutiva
          </FiltroLink>
          <FiltroLink filtro="comentadas" atual={filtro}>
            Já comentadas
          </FiltroLink>
        </div>

        {cursos && cursos.length > 0 && (
          <div className="mb-8 flex flex-wrap items-center gap-2">
            <span className="text-xs font-medium uppercase tracking-wider text-mesa-500">
              Filtrar por curso:
            </span>
            <Link
              href={`/admin/respostas${filtro ? `?filtro=${filtro}` : ""}`}
              className={`rounded-full px-3 py-1 text-xs ${!cursoSlug ? "bg-mesa-700 text-white" : "border border-mesa-200 bg-white text-mesa-700"}`}
            >
              Todos
            </Link>
            {cursos.map((c) => {
              const params = new URLSearchParams();
              if (filtro) params.set("filtro", filtro);
              params.set("curso", c.slug);
              return (
                <Link
                  key={c.slug}
                  href={`/admin/respostas?${params.toString()}`}
                  className={`rounded-full px-3 py-1 text-xs ${cursoSlug === c.slug ? "bg-mesa-700 text-white" : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"}`}
                >
                  {c.titulo}
                </Link>
              );
            })}
          </div>
        )}

        {filtradas.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Nenhuma resposta no filtro escolhido.
            </p>
          </div>
        ) : (
          <ul className="space-y-3">
            {filtradas.map((r: any) => (
              <li key={r.id}>
                <Link
                  href={`/admin/respostas/${r.id}`}
                  className="block rounded-xl border border-mesa-200 bg-white p-5 transition hover:border-mesa-300 hover:shadow-md"
                >
                  <div className="mb-2 flex flex-wrap items-baseline justify-between gap-2">
                    <p className="font-medium text-mesa-800">
                      {r.aluno?.nome || r.aluno?.email}
                    </p>
                    <p className="text-xs text-mesa-500">
                      {new Date(r.created_at).toLocaleString("pt-BR")}
                    </p>
                  </div>
                  <p className="mb-2 text-xs text-mesa-500">
                    {r.atividade?.aula?.curso?.titulo} · {r.atividade?.aula?.titulo}
                  </p>
                  <p className="mb-3 font-medium text-mesa-700">
                    “{r.atividade?.pergunta}”
                  </p>
                  <p className="line-clamp-2 text-sm text-mesa-600">{r.texto}</p>
                  <div className="mt-3">
                    {r.comentario_lider ? (
                      <span className="inline-block rounded-full bg-oliveira-100 px-2 py-0.5 text-xs font-medium text-oliveira-700">
                        ✓ Devolutiva enviada
                      </span>
                    ) : (
                      <span className="inline-block rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
                        Aguardando devolutiva
                      </span>
                    )}
                  </div>
                </Link>
              </li>
            ))}
          </ul>
        )}
      </div>
    </main>
  );
}

function FiltroLink({
  filtro,
  atual,
  children,
}: {
  filtro?: string;
  atual?: string;
  children: React.ReactNode;
}) {
  const ativo = filtro === atual;
  return (
    <Link
      href={filtro ? `/admin/respostas?filtro=${filtro}` : "/admin/respostas"}
      className={`rounded-full px-4 py-1.5 text-sm font-medium transition ${
        ativo
          ? "bg-mesa-700 text-white"
          : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"
      }`}
    >
      {children}
    </Link>
  );
}
