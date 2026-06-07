import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import {
  getCurrentSession,
  listCompromissosManuais,
  listGoogleSincronizados,
} from "@/lib/db";
import { lerAgendaGoogle } from "@/lib/agenda";
import { AgendaPainel } from "@/components/AgendaPainel";
import { podeVerAgenda } from "@/lib/permissoes";

// Página sempre dinâmica: depende de login (cookies) e lê o Google Calendar ao vivo.
export const dynamic = "force-dynamic";

// Agenda pessoal do pastor/master: eventos do Google Calendar (via iCal) +
// compromissos cadastrados manualmente no painel. Janela: do início do mês
// atual até ~12 meses à frente (cobre o ano, pra navegar no calendário).
export default async function AgendaPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  // Master + e-mails liberados (ex.: Débora). Demais não acessam.
  if (
    !podeVerAgenda(
      session.profile?.papel,
      session.profile?.is_admin,
      session.profile?.email ?? session.email,
    )
  ) {
    redirect("/dashboard");
  }

  const agora = new Date();
  // Começa no 1º dia do mês atual (pra o calendário do mês corrente ficar inteiro).
  const inicio = new Date(agora.getFullYear(), agora.getMonth(), 1, 0, 0, 0);
  // Vai até o fim do 12º mês à frente.
  const fim = new Date(agora.getFullYear(), agora.getMonth() + 12, 0, 23, 59, 59);

  const [sincronizados, manuais] = await Promise.all([
    // Eventos sincronizados pelo script = TODAS as agendas (inclusive compartilhadas).
    listGoogleSincronizados(inicio.toISOString(), fim.toISOString()),
    listCompromissosManuais(inicio.toISOString(), fim.toISOString()),
  ]);

  // Se o script ainda não sincronizou nada, cai no iCal (só a agenda principal).
  const google =
    sincronizados.length > 0 ? sincronizados : await lerAgendaGoogle(inicio, fim);

  const eventos = [...google, ...manuais].sort((a, b) => a.inicio.localeCompare(b.inicio));
  const googleConectado = google.length > 0 || !!process.env.GOOGLE_AGENDA_ICAL_URL;

  return (
    <AdminShell current="agenda" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Pessoal
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Minha agenda
      </h1>
      <p className="mb-6 text-sm text-mesa-600">
        Seus eventos do Google Calendar e os compromissos que você adicionar
        aqui. Veja como lista (próximos) ou no calendário do mês.
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
