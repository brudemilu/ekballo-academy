import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, getMensagemComDestinatarios } from "@/lib/db";

function StatusBadge({ status }: { status: string }) {
  const styles: Record<string, string> = {
    enviado: "bg-oliveira-100 text-oliveira-700",
    pendente: "bg-mesa-100 text-mesa-700",
    erro: "bg-red-100 text-red-700",
    pulado: "bg-mesa-50 text-mesa-500",
  };
  return (
    <span
      className={`rounded-full px-2 py-0.5 text-xs font-medium ${
        styles[status] || styles.pendente
      }`}
    >
      {status}
    </span>
  );
}

export default async function AdminMensagemDetalhePage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const data = await getMensagemComDestinatarios(id);
  if (!data) notFound();
  const { mensagem, destinatarios } = data;
  const incluiWhatsapp = mensagem.canais.includes("whatsapp");
  const incluiEmail = mensagem.canais.includes("email");

  return (
    <AdminShell current="mensagens" session={session}>
      <Link
        href="/admin/mensagens"
        className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800"
      >
        ← Mensagens
      </Link>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Detalhe
      </p>
      <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
        {mensagem.assunto}
      </h1>
      <div className="mb-8 flex flex-wrap gap-2 text-xs">
        <span className="rounded-full bg-mesa-100 px-3 py-1 text-mesa-700">
          {mensagem.destino_label}
        </span>
        <span className="rounded-full bg-mesa-100 px-3 py-1 text-mesa-700">
          {new Date(mensagem.enviada_em).toLocaleString("pt-BR")}
        </span>
        {mensagem.canais.map((c) => (
          <span
            key={c}
            className="rounded-full bg-laranja-100 px-3 py-1 text-laranja-700"
          >
            {c}
          </span>
        ))}
      </div>

      <div className="mb-8 grid gap-3 sm:grid-cols-3">
        <div className="rounded-2xl border border-mesa-200 bg-white p-5">
          <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
            Destinatários
          </p>
          <p className="mt-1 font-serif text-3xl font-semibold text-mesa-800">
            {mensagem.total_destinatarios}
          </p>
        </div>
        <div className="rounded-2xl border border-mesa-200 bg-white p-5">
          <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
            Enviados
          </p>
          <p className="mt-1 font-serif text-3xl font-semibold text-oliveira-700">
            {mensagem.total_enviados}
          </p>
        </div>
        <div className="rounded-2xl border border-mesa-200 bg-white p-5">
          <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
            Erros
          </p>
          <p
            className={`mt-1 font-serif text-3xl font-semibold ${
              mensagem.total_erros > 0 ? "text-red-700" : "text-mesa-400"
            }`}
          >
            {mensagem.total_erros}
          </p>
        </div>
      </div>

      <div className="mb-8 rounded-2xl border border-mesa-200 bg-white p-6">
        <p className="mb-3 text-xs font-medium uppercase tracking-wider text-mesa-500">
          Conteúdo enviado
        </p>
        <div
          className="prose-mesa rounded-lg border border-mesa-100 bg-mesa-50/40 p-4"
          dangerouslySetInnerHTML={{ __html: mensagem.corpo_html }}
        />
      </div>

      <div className="rounded-2xl border border-mesa-200 bg-white">
        <div className="border-b border-mesa-100 px-6 py-4">
          <h2 className="font-serif text-lg font-semibold text-mesa-800">
            Status por destinatário
          </h2>
        </div>
        <ul className="divide-y divide-mesa-100">
          {destinatarios.map((d) => (
            <li
              key={d.id}
              className="flex flex-wrap items-center justify-between gap-3 px-6 py-3"
            >
              <div className="min-w-0 flex-1">
                <p className="truncate text-sm font-medium text-mesa-800">
                  {d.aluno_nome || d.aluno_email}
                </p>
                {d.aluno_nome && (
                  <p className="truncate text-xs text-mesa-500">
                    {d.aluno_email}
                  </p>
                )}
                {d.email_erro && (
                  <p className="mt-1 text-xs text-red-700">{d.email_erro}</p>
                )}
              </div>
              <div className="flex flex-wrap items-center gap-3 text-xs text-mesa-600">
                {incluiEmail && (
                  <div className="flex items-center gap-1.5">
                    <span className="text-mesa-400">email:</span>
                    <StatusBadge status={d.email_status} />
                  </div>
                )}
                {incluiWhatsapp && (
                  <div className="flex items-center gap-1.5">
                    <span className="text-mesa-400">whats:</span>
                    <StatusBadge status={d.whatsapp_status} />
                  </div>
                )}
              </div>
            </li>
          ))}
        </ul>
      </div>
    </AdminShell>
  );
}
