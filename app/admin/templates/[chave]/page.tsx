import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { EmailTemplateForm } from "@/components/EmailTemplateForm";
import { getCurrentSession, getEmailTemplate } from "@/lib/db";

const NOMES_AMIGAVEIS: Record<string, string> = {
  "novo-cadastro": "Notificação de novo cadastro",
  "boas-vindas-curso": "Boas-vindas no curso",
  "lembrete-inatividade": "Lembrete de inatividade",
};

export default async function AdminTemplateEditorPage({
  params,
}: {
  params: Promise<{ chave: string }>;
}) {
  const { chave } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const template = await getEmailTemplate(chave);
  if (!template) notFound();

  return (
    <AdminShell current="templates" session={session}>
      <Link
        href="/admin/templates"
        className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800"
      >
        ← Templates
      </Link>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Editor de template
      </p>
      <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
        {NOMES_AMIGAVEIS[template.chave] ?? template.chave}
      </h1>
      <p className="mb-8 text-sm text-mesa-600">{template.descricao}</p>

      <EmailTemplateForm template={template} />
    </AdminShell>
  );
}
