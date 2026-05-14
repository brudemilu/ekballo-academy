import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { AtividadeForm } from "@/components/AtividadeForm";
import { MarcarConcluida } from "@/components/MarcarConcluida";

export default async function AulaPage({
  params,
}: {
  params: Promise<{ slug: string; aulaId: string }>;
}) {
  const { slug, aulaId } = await params;
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
    .select("id, slug, titulo")
    .eq("slug", slug)
    .single();

  if (!curso) notFound();

  const { data: aula } = await supabase
    .from("aulas")
    .select("*")
    .eq("id", aulaId)
    .eq("curso_id", curso.id)
    .single();

  if (!aula) notFound();

  const { data: atividades } = await supabase
    .from("atividades")
    .select("*")
    .eq("aula_id", aulaId)
    .order("ordem", { ascending: true });

  const { data: respostas } = await supabase
    .from("respostas")
    .select("atividade_id, texto, comentario_lider")
    .eq("aluno_id", user.id);

  const respostasMap = new Map(
    (respostas || []).map((r) => [r.atividade_id, r])
  );

  const { data: progresso } = await supabase
    .from("progresso")
    .select("aula_id")
    .eq("aluno_id", user.id)
    .eq("aula_id", aulaId)
    .maybeSingle();

  const { data: outrasAulas } = await supabase
    .from("aulas")
    .select("id, titulo, ordem")
    .eq("curso_id", curso.id)
    .order("ordem", { ascending: true });

  const indiceAtual = (outrasAulas || []).findIndex((a) => a.id === aulaId);
  const proxima = (outrasAulas || [])[indiceAtual + 1];
  const anterior = (outrasAulas || [])[indiceAtual - 1];

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

      <div className="mx-auto max-w-3xl px-6 py-10">
        <Link
          href={`/cursos/${curso.slug}`}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← {curso.titulo}
        </Link>

        <article className="mb-12 rounded-2xl border border-mesa-200 bg-white p-8 shadow-sm sm:p-12">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Aula {String(indiceAtual + 1).padStart(2, "0")}
          </p>
          <h1 className="mb-8 font-serif text-4xl font-semibold leading-tight text-mesa-800">
            {aula.titulo}
          </h1>

          {aula.video_url && (
            <div className="mb-8 aspect-video overflow-hidden rounded-xl bg-mesa-900">
              <iframe
                src={aula.video_url}
                className="h-full w-full"
                allowFullScreen
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              />
            </div>
          )}

          {aula.conteudo && (
            <div className="prose-mesa">
              {aula.conteudo.split("\n\n").map((paragrafo, i) => (
                <p key={i} className="whitespace-pre-wrap">
                  {paragrafo}
                </p>
              ))}
            </div>
          )}
        </article>

        {atividades && atividades.length > 0 && (
          <div className="mb-12 space-y-5">
            <div className="mb-2">
              <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
                Atividades de reflexão
              </p>
              <h2 className="font-serif text-2xl font-semibold text-mesa-800">
                Sua resposta importa.
              </h2>
            </div>
            {atividades.map((at, idx) => {
              const r = respostasMap.get(at.id);
              return (
                <AtividadeForm
                  key={at.id}
                  atividadeId={at.id}
                  alunoId={user.id}
                  perguntaIndex={idx}
                  pergunta={at.pergunta}
                  respostaInicial={r?.texto}
                  comentarioLider={r?.comentario_lider}
                />
              );
            })}
          </div>
        )}

        <div className="flex flex-col gap-4 border-t border-mesa-200 pt-8 sm:flex-row sm:items-center sm:justify-between">
          <MarcarConcluida
            alunoId={user.id}
            aulaId={aula.id}
            jaConcluida={!!progresso}
          />
          <div className="flex gap-2">
            {anterior && (
              <Link
                href={`/cursos/${curso.slug}/aulas/${anterior.id}`}
                className="rounded-full border border-mesa-200 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 hover:bg-mesa-50"
              >
                ← Anterior
              </Link>
            )}
            {proxima && (
              <Link
                href={`/cursos/${curso.slug}/aulas/${proxima.id}`}
                className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
              >
                Próxima aula →
              </Link>
            )}
          </div>
        </div>
      </div>
    </main>
  );
}
