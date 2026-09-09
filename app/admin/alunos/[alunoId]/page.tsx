import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminAlunoForm } from "@/components/AdminAlunoForm";
import { AdminRedefinirSenha } from "@/components/AdminRedefinirSenha";
import { AdminShell } from "@/components/AdminShell";
import { MatriculasDoAluno } from "@/components/MatriculasDoAluno";
import {
  getAlunoById,
  getCurrentSession,
  listAllCursos,
  listMatriculasByAluno,
} from "@/lib/db";
import { nomePapel } from "@/lib/permissoes";
import { displayTelefone } from "@/lib/telefone";

export default async function AdminAlunoPage({
  params,
}: {
  params: Promise<{ alunoId: string }>;
}) {
  const { alunoId } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const souMaster =
    session.profile?.papel === "master" ||
    (!!session.profile?.is_admin && !session.profile?.papel);

  const aluno = await getAlunoById(alunoId);
  if (!aluno) notFound();

  const [cursos, matriculas] = await Promise.all([
    listAllCursos(),
    listMatriculasByAluno(alunoId),
  ]);

  return (
    <AdminShell current="alunos" session={session}>
      <Link
        href="/admin/alunos"
        className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800"
      >
        ← Discípulos
      </Link>

      <div className="mb-10 rounded-2xl border border-mesa-200 bg-white p-8">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Discípulo
        </p>
        <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
          {aluno.nome || "(sem nome)"}
        </h1>
        <p className="text-mesa-600">{aluno.email}</p>
        {aluno.telefone && (
          <p className="mt-1 text-sm text-mesa-600">
            WhatsApp: {displayTelefone(aluno.telefone)}
          </p>
        )}
        <div className="mt-3 flex flex-wrap gap-2 text-sm">
          {aluno.turma && (
            <span className="rounded-full bg-mesa-100 px-3 py-1 text-mesa-700">
              {aluno.turma}
            </span>
          )}
          {aluno.is_admin && (
            <span className="rounded-full bg-oliveira-100 px-3 py-1 font-medium text-oliveira-700">
              {nomePapel(aluno.papel)}
            </span>
          )}
          {!aluno.telefone && !aluno.is_admin && (
            <span className="rounded-full bg-amber-100 px-3 py-1 text-amber-800">
              Sem telefone
            </span>
          )}
          {!aluno.is_admin && aluno.acesso_liberado === false && (
            <span className="rounded-full bg-amber-100 px-3 py-1 text-amber-800">
              Acesso pendente
            </span>
          )}
          {!aluno.is_admin && aluno.acesso_liberado !== false && (
            <span className="rounded-full bg-oliveira-100 px-3 py-1 font-medium text-oliveira-700">
              Acesso liberado
            </span>
          )}
          {!aluno.is_admin && aluno.english_liberado && (
            <span className="rounded-full bg-laranja-100 px-3 py-1 font-medium text-laranja-700">
              English liberado
            </span>
          )}
          <span className="rounded-full bg-mesa-50 px-3 py-1 text-mesa-500">
            Cadastro em {new Date(aluno.created_at).toLocaleDateString("pt-BR")}
          </span>
        </div>
      </div>

      <details className="mb-10 rounded-2xl border border-mesa-200 bg-white p-6">
        <summary className="cursor-pointer select-none font-serif text-xl font-semibold text-mesa-800">
          Editar cadastro
        </summary>
        <div className="mt-5">
          <AdminAlunoForm
            alunoId={alunoId}
            souMaster={souMaster}
            initial={{
              nome: aluno.nome || "",
              email: aluno.email,
              telefone: aluno.telefone || "",
              turma: aluno.turma || "",
              papel: aluno.papel || "discipulo",
              acesso_liberado: aluno.acesso_liberado,
              english_liberado: aluno.english_liberado,
            }}
          />
        </div>
      </details>

      <details className="mb-10 rounded-2xl border border-mesa-200 bg-white p-6">
        <summary className="cursor-pointer select-none font-serif text-xl font-semibold text-mesa-800">
          Redefinir senha
        </summary>
        <div className="mt-5">
          <AdminRedefinirSenha
            alunoId={alunoId}
            nome={aluno.nome || ""}
            email={aluno.email}
            telefone={aluno.telefone}
          />
        </div>
      </details>

      <h2 className="mb-2 font-serif text-2xl font-semibold text-mesa-800">
        Matrículas
      </h2>
      <p className="mb-6 text-sm text-mesa-600">
        Busque pelo título ou pelo autor e libere o acesso com um clique.
      </p>

      <MatriculasDoAluno
        alunoId={alunoId}
        cursos={cursos.map((c) => ({
          id: c.id,
          slug: c.slug,
          titulo: c.titulo,
          descricao: c.descricao,
          autor: c.autor,
          categoria: c.categoria,
          ordem: c.ordem,
          publicado: c.publicado,
          is_pago: c.is_pago,
          external_path: c.external_path,
        }))}
        matriculadosIniciais={matriculas.map((m) => m.curso_id)}
      />
    </AdminShell>
  );
}
