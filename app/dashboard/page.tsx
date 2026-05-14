import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import type { Curso } from "@/lib/types";

export default async function DashboardPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("nome, email, is_admin, turma")
    .eq("id", user.id)
    .single();

  const { data: cursos } = await supabase
    .from("cursos")
    .select("*")
    .eq("publicado", true)
    .order("ordem", { ascending: true });

  const { data: matriculas } = await supabase
    .from("matriculas")
    .select("curso_id, concluido_em")
    .eq("aluno_id", user.id);

  const matriculasMap = new Map(
    (matriculas || []).map((m) => [m.curso_id, m])
  );

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard">
            <Logo />
          </Link>
          <UserMenu
            nome={profile?.nome || null}
            email={profile?.email || user.email || ""}
            isAdmin={!!profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        <div className="mb-12">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Bem-vindo de volta
          </p>
          <h1 className="font-serif text-4xl font-semibold text-mesa-800">
            Olá, {(profile?.nome || "discípulo").split(" ")[0]}.
          </h1>
          <p className="mt-3 max-w-2xl text-mesa-700">
            Aqui está sua trilha. Escolha um curso, faça no seu ritmo, deixe sua
            reflexão. O líder vai ler e te responder.
          </p>
        </div>

        {!cursos || cursos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Os cursos estão sendo preparados.
            </p>
            <p className="mt-2 text-sm text-mesa-400">
              Volte em breve — a mesa está sendo posta.
            </p>
          </div>
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {(cursos as Curso[]).map((curso) => {
              const matricula = matriculasMap.get(curso.id);
              const concluido = matricula?.concluido_em;
              return (
                <Link
                  key={curso.id}
                  href={`/cursos/${curso.slug}`}
                  className="group block overflow-hidden rounded-2xl border border-mesa-200 bg-white transition hover:border-mesa-300 hover:shadow-xl hover:shadow-mesa-700/10"
                >
                  <div className="aspect-[16/9] bg-gradient-to-br from-mesa-200 via-mesa-100 to-oliveira-100">
                    {curso.imagem_url ? (
                      // eslint-disable-next-line @next/next/no-img-element
                      <img
                        src={curso.imagem_url}
                        alt={curso.titulo}
                        className="h-full w-full object-cover"
                      />
                    ) : (
                      <div className="flex h-full items-center justify-center">
                        <Logo />
                      </div>
                    )}
                  </div>
                  <div className="p-6">
                    <div className="mb-3 flex items-center gap-2">
                      {curso.is_pago ? (
                        <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-xs font-medium text-mesa-700">
                          Pago
                        </span>
                      ) : (
                        <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                          Gratuito
                        </span>
                      )}
                      {matricula && !concluido && (
                        <span className="rounded-full bg-mesa-50 px-2.5 py-0.5 text-xs font-medium text-mesa-600">
                          Em andamento
                        </span>
                      )}
                      {concluido && (
                        <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                          Concluído
                        </span>
                      )}
                    </div>
                    <h3 className="mb-2 font-serif text-xl font-semibold text-mesa-800 group-hover:text-mesa-900">
                      {curso.titulo}
                    </h3>
                    {curso.descricao && (
                      <p className="line-clamp-3 text-sm text-mesa-600">
                        {curso.descricao}
                      </p>
                    )}
                  </div>
                </Link>
              );
            })}
          </div>
        )}
      </div>
    </main>
  );
}
