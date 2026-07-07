/**
 * Ekballo — Sincronização de agenda com o Google Calendar (Google Apps Script).
 *
 * Roda DENTRO da conta Google do dono (script.google.com), com permissão de
 * escrita na agenda. Faz as DUAS direções:
 *   1) Google  -> Ekballo : lê os eventos de TODAS as agendas e manda pro app
 *                            (POST /api/agenda/sync) -> aparecem na "Minha agenda".
 *   2) Ekballo -> Google  : pega os compromissos criados no painel/WhatsApp
 *                            (GET /api/agenda/push), CRIA no Google Calendar e
 *                            remove do Ekballo (POST /api/agenda/push {id}) —
 *                            depois voltam como evento do Google na sync normal.
 *
 * INSTALAÇÃO (uma vez):
 *   1. Abra https://script.google.com  ->  Novo projeto (ou o projeto de agenda
 *      já existente) e cole este arquivo inteiro.
 *   2. Engrenagem (Configurações do projeto) -> "Propriedades do script" ->
 *      adicione a propriedade:
 *          AGENDA_SECRET = (o valor da env AGENDA_SYNC_SECRET da Vercel)
 *      (Vercel -> projeto ekballo-academy -> Settings -> Environment Variables
 *       -> AGENDA_SYNC_SECRET -> Reveal/Copiar.)
 *   3. Selecione a função "sincronizarAgenda" e clique em Executar uma vez —
 *      o Google vai pedir autorização de acesso à sua agenda; autorize.
 *   4. Relógio (Acionadores/Triggers) -> Adicionar acionador:
 *          função: sincronizarAgenda | evento: baseado no tempo |
 *          a cada 10 minutos.  Salvar.
 *
 * Pronto. A cada 10 min a agenda fica em dia nas duas direções.
 */

const APP_BASE = "https://ekballo-academy.vercel.app";
const SECRET = PropertiesService.getScriptProperties().getProperty("AGENDA_SECRET");

// Janela sincronizada: de 7 dias atrás até ~4 meses à frente.
const DIAS_ATRAS = 7;
const DIAS_FRENTE = 120;

function sincronizarAgenda() {
  if (!SECRET) throw new Error("Falta a propriedade de script AGENDA_SECRET.");
  enviarGoogleParaEkballo();
  criarNoGoogleDoEkballo();
}

/** (1) Lê todas as agendas do Google e manda a janela pro Ekballo. */
function enviarGoogleParaEkballo() {
  const de = new Date(Date.now() - DIAS_ATRAS * 864e5);
  const ate = new Date(Date.now() + DIAS_FRENTE * 864e5);
  const eventos = [];
  for (const cal of CalendarApp.getAllCalendars()) {
    for (const e of cal.getEvents(de, ate)) {
      eventos.push({
        id: e.getId(),
        agenda: cal.getName(),
        titulo: e.getTitle(),
        inicio: e.getStartTime().toISOString(),
        fim: e.getEndTime() ? e.getEndTime().toISOString() : null,
        diaTodo: e.isAllDayEvent(),
        local: e.getLocation() || null,
      });
    }
  }
  UrlFetchApp.fetch(APP_BASE + "/api/agenda/sync", {
    method: "post",
    contentType: "application/json",
    headers: { "x-agenda-secret": SECRET },
    payload: JSON.stringify({ de: de.toISOString(), ate: ate.toISOString(), eventos }),
    muteHttpExceptions: true,
  });
}

/** (2) Cria no Google Calendar os compromissos do Ekballo (painel/WhatsApp). */
function criarNoGoogleDoEkballo() {
  const resp = UrlFetchApp.fetch(APP_BASE + "/api/agenda/push", {
    method: "get",
    headers: { "x-agenda-secret": SECRET },
    muteHttpExceptions: true,
  });
  const lista = (JSON.parse(resp.getContentText() || "{}").compromissos) || [];
  const cal = CalendarApp.getDefaultCalendar();
  for (const c of lista) {
    try {
      const inicio = new Date(c.inicio);
      if (c.dia_todo) {
        cal.createAllDayEvent(c.titulo, inicio);
      } else {
        const fim = c.fim ? new Date(c.fim) : new Date(inicio.getTime() + 36e5); // +1h padrão
        cal.createEvent(c.titulo, inicio, fim, {
          location: c.local || "",
          description: c.nota || "",
        });
      }
      // remove do Ekballo (volta como evento do Google na próxima sync)
      UrlFetchApp.fetch(APP_BASE + "/api/agenda/push", {
        method: "post",
        contentType: "application/json",
        headers: { "x-agenda-secret": SECRET },
        payload: JSON.stringify({ id: c.id }),
        muteHttpExceptions: true,
      });
    } catch (err) {
      console.error("Falha ao criar no Google:", c.titulo, err);
    }
  }
}
