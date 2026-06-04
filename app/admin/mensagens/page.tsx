import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { CentralMensagens } from "@/components/CentralMensagens";
import {
  getCurrentSession,
  listAllAlunos,
  listCursosWithStats,
  listMensagens,
  listMensagemTemplates,
} from "@/lib/db";

export default async function AdminMensagensPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const [alunos, cursos, mensagens, templates] = await Promise.all([
    listAllAlunos(),
    listCursosWithStats(),
    listMensagens(50),
    listMensagemTemplates(),
  ]);

  const alunosNonAdmin = alunos.filter((a) => !a.is_admin);
  const cursosPublicados = cursos.filter((c) => c.curso.publicado);

  return (
    <AdminShell current="mensagens" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Comunicação
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Mensagens & WhatsApp
      </h1>
      <p className="mb-8 text-sm text-mesa-600">
        Envie para discípulos, grupos ou números — com templates, texto ou mídia.
        Acompanhe a fila, gerencie templates e veja o histórico, tudo num lugar só.
      </p>

      <CentralMensagens
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
        templates={templates.map((t) => ({
          id: t.id,
          titulo: t.titulo,
          corpo: t.corpo,
          descricao: t.descricao,
        }))}
        mensagens={mensagens.map((m) => ({
          id: m.id,
          assunto: m.assunto,
          destino_label: m.destino_label,
          canais: m.canais,
          enviada_em: m.enviada_em,
          total_enviados: m.total_enviados,
          total_erros: m.total_erros,
          total_destinatarios: m.total_destinatarios,
        }))}
      />
    </AdminShell>
  );
}
