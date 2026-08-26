import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { AnotacaoEditor } from "@/components/AnotacaoEditor";
import { podeUsarCaderno } from "@/lib/permissoes";
import {
  getCurrentSession,
  listCursosPublicados,
  listMatriculasByAluno,
} from "@/lib/db";
import { getAnotacao, listPastas } from "@/lib/anotacoes";
import { tituloExibido } from "@/lib/anotacoes-meta";

export default async function AnotacaoPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  // O caderno é liberado pessoa a pessoa (ver CADERNO_EMAILS em lib/permissoes).
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    redirect("/dashboard");
  }

  const anotacao = await getAnotacao(id, session.userId);
  if (!anotacao) notFound();

  const [todosCursos, matriculas, pastas] = await Promise.all([
    listCursosPublicados(),
    listMatriculasByAluno(session.userId),
    listPastas(session.userId),
  ]);
  const matriculadas = new Set(matriculas.map((m) => m.curso_id));
  const cursos = (
    session.profile?.is_admin
      ? todosCursos
      : todosCursos.filter((c) => matriculadas.has(c.id) || c.id === anotacao.curso_id)
  ).map((c) => ({ id: c.id, titulo: c.titulo }));

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard">
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
        <AnotacaoEditor anotacao={anotacao} cursos={cursos} pastas={pastas} />
      </div>
    </main>
  );
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const session = await getCurrentSession();
  if (!session) return { title: "Anotação — Ekballo Academy" };
  const anotacao = await getAnotacao(id, session.userId);
  return {
    title: anotacao
      ? `${tituloExibido(anotacao)} — Meu caderno`
      : "Anotação — Ekballo Academy",
  };
}
