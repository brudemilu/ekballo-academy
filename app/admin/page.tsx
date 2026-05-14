import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";

export default async function AdminPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("nome, email, is_admin")
    .eq("id", user.id)
    .single();

  if (!profile?.is_admin) redirect("/dashboard");

  // Stats
  const [
    { count: totalAlunos },
    { count: totalCursos },
    { count: totalRespostas },
    { count: respostasSemComentario },
  ] = await Promise.all([
    supabase.from("profiles").select("*", { count: "exact", head: true }),
    supabase.from("cursos").select("*", { count: "exact", head: true }),
    supabase.from("respostas").select("*", { count: "exact", head: true }),
    supabase
      .from("respostas")
      .select("*", { count: "exact", head: true })
      .is("comentario_lider", null),
  ]);

  // Últimas respostas
  const { data: ultimas } = await supabase
    .from("respostas")
    .select(
      "id, texto, created_at, comentario_lider, atividade:atividades(pergunta, aula:aulas(titulo, curso:cursos(titulo, slug))), aluno:profiles(nome, email)"
    )
    .order("created_at", { ascending: false })
    .limit(8);

  const stats = [
    { label: "Alunos cadastrados", value: totalAlunos || 0, color: "text-mesa-700" },
    { label: "Cursos publicados", value: totalCursos || 0, color: "text-mesa-700" },
    { label: "Respostas escritas", value: totalRespostas || 0, color: "text-oliveira-700" },
    { label: "Aguardando devolutiva", value: respostasSemComentario || 0, color: "text-amber-700" },
  ];

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/admin">
            <Logo />
          </Link>
          <UserMenu
            nome={profile.nome}
            email={profile.email || user.email || ""}
            isAdmin
          />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        <div className="mb-12">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Painel pastoral
          </p>
          <h1 className="font-serif text-4xl font-semibold text-mesa-800">
            A mesa por dentro.
          </h1>
        </div>

        {/* Stats */}
        <div className="mb-12 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {stats.map((s) => (
            <div
              key={s.label}
              className="rounded-2xl border border-mesa-200 bg-white p-6"
            >
              <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
                {s.label}
              </p>
              <p className={`mt-2 font-serif text-4xl font-semibold ${s.color}`}>
                {s.value}
              </p>
            </div>
          ))}
        </div>

        {/* Atalhos */}
        <div className="mb-12 grid gap-4 sm:grid-cols-3">
          <Link
            href="/admin/respostas"
            className="group rounded-2xl border border-mesa-200 bg-white p-6 transition hover:border-mesa-300 hover:shadow-lg"
          >
            <h3 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
              Respostas
            </h3>
            <p className="text-sm text-mesa-600">
              Ler todas as reflexões dos alunos, dar devolutiva.
            </p>
            <p className="mt-3 text-sm font-medium text-mesa-700 group-hover:text-mesa-900">
              Ver respostas →
            </p>
          </Link>
          <Link
            href="/admin/alunos"
            className="group rounded-2xl border border-mesa-200 bg-white p-6 transition hover:border-mesa-300 hover:shadow-lg"
          >
            <h3 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
              Alunos
            </h3>
            <p className="text-sm text-mesa-600">
              Lista completa de quem está na mesa.
            </p>
            <p className="mt-3 text-sm font-medium text-mesa-700 group-hover:text-mesa-900">
              Ver alunos →
            </p>
          </Link>
          <Link
            href="/admin/cursos"
            className="group rounded-2xl border border-mesa-200 bg-white p-6 transition hover:border-mesa-300 hover:shadow-lg"
          >
            <h3 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
              Cursos
            </h3>
            <p className="text-sm text-mesa-600">
              Cursos publicados, progresso por turma.
            </p>
            <p className="mt-3 text-sm font-medium text-mesa-700 group-hover:text-mesa-900">
              Ver cursos →
            </p>
          </Link>
        </div>

        {/* Últimas respostas */}
        <div className="rounded-2xl border border-mesa-200 bg-white">
          <div className="border-b border-mesa-100 px-6 py-4">
            <h2 className="font-serif text-xl font-semibold text-mesa-800">
              Últimas respostas
            </h2>
          </div>
          {!ultimas || ultimas.length === 0 ? (
            <p className="px-6 py-12 text-center text-mesa-500">
              Nenhuma resposta ainda. Em breve a mesa estará posta.
            </p>
          ) : (
            <ul className="divide-y divide-mesa-100">
              {ultimas.map((r: any) => (
                <li key={r.id}>
                  <Link
                    href={`/admin/respostas/${r.id}`}
                    className="flex items-start gap-4 px-6 py-4 transition hover:bg-mesa-50/50"
                  >
                    <div className="mt-1 h-2.5 w-2.5 flex-none rounded-full bg-mesa-400" />
                    <div className="min-w-0 flex-1">
                      <div className="flex items-baseline justify-between gap-3">
                        <p className="font-medium text-mesa-800">
                          {r.aluno?.nome || r.aluno?.email}
                        </p>
                        <p className="flex-none text-xs text-mesa-500">
                          {new Date(r.created_at).toLocaleDateString("pt-BR")}
                        </p>
                      </div>
                      <p className="mt-0.5 text-xs text-mesa-500">
                        {r.atividade?.aula?.curso?.titulo} ·{" "}
                        {r.atividade?.aula?.titulo}
                      </p>
                      <p className="mt-2 line-clamp-2 text-sm text-mesa-700">
                        {r.texto}
                      </p>
                      {!r.comentario_lider && (
                        <span className="mt-2 inline-block rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
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
      </div>
    </main>
  );
}
