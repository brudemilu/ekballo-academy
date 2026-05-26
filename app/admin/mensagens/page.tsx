import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { EnviarMensagemForm } from "@/components/EnviarMensagemForm";
import {
  getCurrentSession,
  listAllAlunos,
  listCursosWithStats,
  listMensagens,
} from "@/lib/db";

export default async function AdminMensagensPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const [alunos, cursos, mensagens] = await Promise.all([
    listAllAlunos(),
    listCursosWithStats(),
    listMensagens(50),
  ]);

  const alunosNonAdmin = alunos.filter((a) => !a.is_admin);
  const cursosPublicados = cursos.filter((c) => c.curso.publicado);

  return (
    <AdminShell current="mensagens" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Comunicação
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Mensagens
      </h1>
      <p className="mb-8 text-sm text-mesa-600">
        Envie mensagens pra todos os discípulos, discípulos de um curso específico ou
        alguém individual. Email e WhatsApp.
      </p>

      <EnviarMensagemForm
        alunos={alunosNonAdmin.map((a) => ({
          id: a.id,
          nome: a.nome,
          email: a.email,
          telefone: a.telefone,
        }))}
        cursos={cursosPublicados.map((c) => ({
          id: c.curso.id,
          titulo: c.curso.titulo,
          matriculados: c.matriculados,
          alunosComTelefone: c.alunosComTelefone,
        }))}
      />

      <div className="mt-12">
        <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          Mensagens enviadas
        </h2>
        {mensagens.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="font-serif text-lg text-mesa-500">
              Nenhuma mensagem enviada ainda.
            </p>
          </div>
        ) : (
          <ul className="space-y-3">
            {mensagens.map((m) => (
              <li
                key={m.id}
                className="rounded-xl border border-mesa-200 bg-white p-5"
              >
                <div className="flex flex-wrap items-start justify-between gap-4">
                  <div className="min-w-0 flex-1">
                    <div className="mb-1 flex flex-wrap items-center gap-2">
                      <h3 className="font-serif text-lg font-semibold text-mesa-800">
                        {m.assunto}
                      </h3>
                      <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs text-mesa-600">
                        {m.destino_label}
                      </span>
                      {m.canais.map((c) => (
                        <span
                          key={c}
                          className="rounded-full bg-laranja-100 px-2 py-0.5 text-xs text-laranja-700"
                        >
                          {c}
                        </span>
                      ))}
                    </div>
                    <p className="text-xs text-mesa-500">
                      {new Date(m.enviada_em).toLocaleString("pt-BR")}
                    </p>
                  </div>
                  <div className="flex items-center gap-5 text-sm">
                    <div className="text-right">
                      <p className="font-serif text-xl font-semibold text-oliveira-700">
                        {m.total_enviados}
                      </p>
                      <p className="text-xs text-mesa-500">enviados</p>
                    </div>
                    {m.total_erros > 0 && (
                      <div className="text-right">
                        <p className="font-serif text-xl font-semibold text-red-700">
                          {m.total_erros}
                        </p>
                        <p className="text-xs text-mesa-500">erros</p>
                      </div>
                    )}
                    <div className="text-right">
                      <p className="font-serif text-xl font-semibold text-mesa-700">
                        {m.total_destinatarios}
                      </p>
                      <p className="text-xs text-mesa-500">total</p>
                    </div>
                    <Link
                      href={`/admin/mensagens/${m.id}`}
                      className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                    >
                      Ver detalhes →
                    </Link>
                  </div>
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </AdminShell>
  );
}
