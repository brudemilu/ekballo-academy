import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { WhatsAppPainel } from "@/components/WhatsAppPainel";
import { getCurrentSession } from "@/lib/db";

export default async function AdminWhatsAppPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  return (
    <AdminShell current="whatsapp" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Comunicação
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">WhatsApp</h1>
      <p className="mb-8 text-sm text-mesa-600">
        Conecte o número (parear via QR), envie mensagens e mídias para contatos e grupos.
        O broadcast para os discípulos continua em <strong>Mensagens</strong>.
      </p>

      <WhatsAppPainel />
    </AdminShell>
  );
}
