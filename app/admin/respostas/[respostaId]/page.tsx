import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { ComentarioForm } from "@/components/ComentarioForm";

export default async function RespostaDetalhePage({
  params,
}: {
  params: Promise<{ respostaId: string }>;
}) {
  const { respostaId } = await params;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("nome, email, is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin) redirect("/dashboard");

  const { data: r } = await supabase
    .from("respostas")
    .select(
      "id, texto, comentario_lider, comentario_lider_em, created_at, updated_at, atividade:atividades(pergunta, aula:aulas(titulo, curso:cursos(titulo, slug))), aluno:profiles(id, nome, email)"
    )
    .eq("id", respostaId)
    .single();

  if (!r) notFound();

  // Outras respostas do mesmo aluno
  const { data: outras } = await supabase
    .from("respostas")
    .select("id, created_at, atividade:atividades(pergunta, aula:aulas(titulo))")
    .eq("aluno_id", (r as any).aluno?.id)
    .neq("id", respostaId)
    .order("created_at", { ascending: false })
    .limit(5);

  const aluno = (r as any).aluno;
  const at = (r as any).atividade;

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

      <div className="mx-auto max-w-4xl px-6 py-12">
        <Link
          href="/admin/respostas"
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Todas as respostas
        </Link>

        <div className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Resposta de
        </div>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          {aluno?.nome || aluno?.email}
        </h1>
        <p className="mt-1 text-sm text-mesa-500">{aluno?.email}</p>

        <div className="mt-8 rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
          <p className="mb-2 text-xs text-mesa-500">
            {at?.aula?.curso?.titulo} · {at?.aula?.titulo}
          </p>
          <h2 className="mb-6 font-serif text-xl font-semibold leading-snug text-mesa-800">
            “{at?.pergunta}”
          </h2>
          <div className="prose-mesa text-mesa-800">
            {(r.texto || "").split("\n\n").map((p, i) => (
              <p key={i} className="whitespace-pre-wrap">
                {p}
              </p>
            ))}
          </div>
          <p className="mt-6 border-t border-mesa-100 pt-4 text-xs text-mesa-500">
            Respondido em {new Date(r.created_at).toLocaleString("pt-BR")}
            {r.updated_at !== r.created_at &&
              ` · Atualizado em ${new Date(r.updated_at).toLocaleString("pt-BR")}`}
          </p>
        </div>

        <div className="mt-6">
          <ComentarioForm
            respostaId={r.id}
            comentarioInicial={r.comentario_lider}
          />
        </div>

        {outras && outras.length > 0 && (
          <div className="mt-12">
            <h3 className="mb-4 font-serif text-xl font-semibold text-mesa-800">
              Outras reflexões deste discípulo
            </h3>
            <ul className="space-y-2">
              {outras.map((o: any) => (
                <li key={o.id}>
                  <Link
                    href={`/admin/respostas/${o.id}`}
                    className="block rounded-lg border border-mesa-200 bg-white p-4 hover:border-mesa-300"
                  >
                    <p className="text-xs text-mesa-500">
                      {o.atividade?.aula?.titulo} ·{" "}
                      {new Date(o.created_at).toLocaleDateString("pt-BR")}
                    </p>
                    <p className="mt-1 text-sm text-mesa-700">
                      {o.atividade?.pergunta}
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
