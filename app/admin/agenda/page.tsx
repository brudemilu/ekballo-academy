import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, listCompromissosManuais } from "@/lib/db";
import { lerAgendaGoogle } from "@/lib/agenda";
import { AgendaPainel } from "@/components/AgendaPainel";

// Agenda pessoal do pastor/master: eventos do Google Calendar (via iCal) +
// compromissos cadastrados manualmente no painel. Janela: próximos 45 dias.
export default async function AgendaPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  const papel =
    session.profile?.papel || (session.profile?.is_admin ? "master" : "discipulo");
  if (papel !== "master") redirect("/admin");

  const agora = new Date();
  const inicio = new Date(agora.getFullYear(), agora.getMonth(), agora.getDate(), 0, 0, 0);
  const fim = new Date(inicio);
  fim.setDate(fim.getDate() + 45);

  const [google, manuais] = await Promise.all([
    lerAgendaGoogle(inicio, fim),
    listCompromissosManuais(inicio.toISOString(), fim.toISOString()),
  ]);

  const eventos = [...google, ...manuais].sort((a, b) => a.inicio.localeCompare(b.inicio));
  const googleConectado = !!process.env.GOOGLE_AGENDA_ICAL_URL;

  return (
    <AdminShell current="agenda" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Pessoal
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Minha agenda
      </h1>
      <p className="mb-6 text-sm text-mesa-600">
        Próximos 45 dias — seus eventos do Google Calendar e os compromissos que
        você adicionar aqui.
      </p>

      {!googleConectado && (
        <div className="mb-6 rounded-xl border border-laranja-200 bg-laranja-50 px-4 py-3 text-sm text-laranja-700">
          Agenda do Google ainda não conectada — só aparecem os compromissos
          manuais. Para puxar seus eventos do Google, falta configurar o link
          secreto iCal.
        </div>
      )}

      <AgendaPainel eventos={eventos} />
    </AdminShell>
  );
}
