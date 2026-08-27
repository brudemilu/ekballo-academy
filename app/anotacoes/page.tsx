import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { ListaAnotacoes } from "@/components/ListaAnotacoes";
import { podeUsarCaderno } from "@/lib/permissoes";
import {
  getCurrentSession,
  listCursosPublicados,
  listMatriculasByAluno,
} from "@/lib/db";
import { listAnotacoes, listPastas } from "@/lib/anotacoes";
import { listVersoes } from "@/lib/biblia";
import { listVersoesComBusca } from "@/lib/biblia-busca";

export const metadata = {
  title: "Meu caderno — Ekballo Academy",
  description: "Anotações de aula, trabalhos e ideias.",
};

export default async function AnotacoesPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  // O caderno é liberado pessoa a pessoa (ver CADERNO_EMAILS em lib/permissoes).
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    redirect("/dashboard");
  }

  const [anotacoes, lixeira, pastas, todosCursos, matriculas, versoes, versoesComBusca] = await Promise.all([
    // Traz arquivadas junto: o mural alterna entre pastas, arquivo e lixeira
    // sem ida extra ao servidor.
    listAnotacoes(session.userId, { incluirArquivadas: true }),
    listAnotacoes(session.userId, { incluirArquivadas: true, lixeira: true }),
    listPastas(session.userId),
    listCursosPublicados(),
    listMatriculasByAluno(session.userId),
    listVersoes(),
    listVersoesComBusca(),
  ]);

  // Mesmo critério do painel: o master vê todos os livros, o discípulo vê
  // aqueles em que está matriculado.
  const matriculadas = new Set(matriculas.map((m) => m.curso_id));
  const cursos = (
    session.profile?.is_admin
      ? todosCursos
      : todosCursos.filter((c) => matriculadas.has(c.id))
  ).map((c) => ({ id: c.id, titulo: c.titulo }));

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="sticky top-0 z-40 border-b border-mesa-200 bg-white/85 backdrop-blur-md">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard" className="transition-opacity hover:opacity-80">
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        <div className="mb-10 flex flex-wrap items-end justify-between gap-4">
          <div className="max-w-2xl">
            <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-mesa-500">
              Caderno
            </p>
            <h1 className="font-serif text-4xl font-semibold leading-[1.05] tracking-tight text-mesa-900 sm:text-5xl">
              Minhas anotações
            </h1>
            <p className="mt-5 text-lg leading-relaxed text-mesa-600">
              O que você ouviu na aula, o trabalho que precisa entregar, a ideia que
              apareceu no meio da leitura. Organize em pastas, formate o texto,
              salve em PDF — e nada disso é visto por mais ninguém.
            </p>
          </div>
          <Link
            href="/dashboard"
            className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100"
          >
            ← Painel
          </Link>
        </div>

        <ListaAnotacoes
          anotacoes={anotacoes}
          lixeira={lixeira}
          pastas={pastas}
          cursos={cursos}
          versoesBiblia={versoes
            .filter((v) => versoesComBusca.includes(v.sigla))
            .map((v) => ({ sigla: v.sigla, nome: v.nome }))}
        />
      </div>
    </main>
  );
}
