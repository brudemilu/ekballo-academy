import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { ComentarioForm } from "@/components/ComentarioForm";
import {
  getCurrentSession,
  getRespostaById,
  listOutrasRespostasDoAluno,
} from "@/lib/db";

export default async function RespostaDetalhePage({
  params,
}: {
  params: Promise<{ respostaId: string }>;
}) {
  const { respostaId } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const r = await getRespostaById(respostaId);
  if (!r) notFound();

  const outras = await listOutrasRespostasDoAluno(r.alunoId, respostaId, 5);

  return (
    <AdminShell current="respostas" session={session}>
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
        {r.alunoNome || r.alunoEmail}
      </h1>
      <p className="mt-1 text-sm text-mesa-500">
        {r.alunoEmail}
        {r.alunoTurma ? ` · ${r.alunoTurma}` : ""}
      </p>

      <div className="mt-8 rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
        <p className="mb-2 text-xs text-mesa-500">
          {r.cursoTitulo} · {r.aulaTitulo}
        </p>
        <h2 className="mb-6 font-serif text-xl font-semibold leading-snug text-mesa-800">
          &ldquo;{r.pergunta}&rdquo;
        </h2>
        <div className="prose-mesa text-mesa-800">
          {(r.texto || "").split("\n\n").map((p: string, i: number) => (
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

      {outras.length > 0 && (
        <div className="mt-12">
          <h3 className="mb-4 font-serif text-xl font-semibold text-mesa-800">
            Outras reflexões deste discípulo
          </h3>
          <ul className="space-y-2">
            {outras.map((o) => (
              <li key={o.id}>
                <Link
                  href={`/admin/respostas/${o.id}`}
                  className="block rounded-lg border border-mesa-200 bg-white p-4 hover:border-mesa-300"
                >
                  <p className="text-xs text-mesa-500">
                    {o.aulaTitulo} ·{" "}
                    {new Date(o.created_at).toLocaleDateString("pt-BR")}
                  </p>
                  <p className="mt-1 text-sm text-mesa-700">{o.pergunta}</p>
                </Link>
              </li>
            ))}
          </ul>
        </div>
      )}
    </AdminShell>
  );
}
