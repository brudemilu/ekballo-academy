import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";

export default async function CursoPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("nome, email, is_admin")
    .eq("id", user.id)
    .single();

  const { data: curso } = await supabase
    .from("cursos")
    .select("*")
    .eq("slug", slug)
    .eq("publicado", true)
    .single();

  if (!curso) notFound();

  // Garantir matrícula automática (modelo gratuito)
  if (!curso.is_pago) {
    await supabase.from("matriculas").upsert(
      { aluno_id: user.id, curso_id: curso.id },
      { onConflict: "aluno_id,curso_id" }
    );
  }

  const { data: aulas } = await supabase
    .from("aulas")
    .select("*")
    .eq("curso_id", curso.id)
    .order("ordem", { ascending: true });

  const { data: progresso } = await supabase
    .from("progresso")
    .select("aula_id")
    .eq("aluno_id", user.id);

  const concluidas = new Set((progresso || []).map((p) => p.aula_id));

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

      <div className="mx-auto max-w-4xl px-6 py-12">
        <Link
          href="/dashboard"
          className="mb-8 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Voltar
        </Link>

        <div className="mb-12 rounded-2xl border border-mesa-200 bg-white p-8 shadow-sm sm:p-10">
          <div className="mb-4 flex items-center gap-2">
            {curso.is_pago ? (
              <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-xs font-medium text-mesa-700">
                Pago
              </span>
            ) : (
              <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                Gratuito
              </span>
            )}
          </div>
          <h1 className="mb-4 font-serif text-4xl font-semibold text-mesa-800">
            {curso.titulo}
          </h1>
          {curso.descricao && (
            <p className="text-lg leading-relaxed text-mesa-700">
              {curso.descricao}
            </p>
          )}
        </div>

        <h2 className="mb-6 font-serif text-2xl font-semibold text-mesa-800">
          Aulas
        </h2>

        {!aulas || aulas.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="font-serif text-lg text-mesa-500">
              As aulas estão sendo preparadas.
            </p>
          </div>
        ) : (
          <ol className="space-y-3">
            {aulas.map((aula, idx) => {
              const concluida = concluidas.has(aula.id);
              return (
                <li key={aula.id}>
                  <Link
                    href={`/cursos/${curso.slug}/aulas/${aula.id}`}
                    className="flex items-center gap-5 rounded-xl border border-mesa-200 bg-white p-5 transition hover:border-mesa-300 hover:bg-mesa-50/50"
                  >
                    <div
                      className={`flex h-12 w-12 flex-none items-center justify-center rounded-full font-serif text-lg font-semibold ${
                        concluida
                          ? "bg-oliveira-100 text-oliveira-700"
                          : "bg-mesa-100 text-mesa-700"
                      }`}
                    >
                      {concluida ? "✓" : String(idx + 1).padStart(2, "0")}
                    </div>
                    <div className="flex-1">
                      <h3 className="font-medium text-mesa-800">
                        {aula.titulo}
                      </h3>
                      {concluida && (
                        <p className="text-xs text-oliveira-600">Concluída</p>
                      )}
                    </div>
                    <span className="text-mesa-400">→</span>
                  </Link>
                </li>
              );
            })}
          </ol>
        )}
      </div>
    </main>
  );
}
