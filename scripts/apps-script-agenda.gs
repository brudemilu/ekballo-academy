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
 *          AGENDA_SECRET = (o valor da env AGENDA_SYNC_SECRET do app)
 *      (fica no .env do servidor, em /opt/ekballo-app/.env — peça a quem
 *       administra o box, ou leia no painel de variáveis do serviço.)
 *   3. Selecione a função "sincronizarAgenda" e clique em Executar uma vez —
 *      o Google vai pedir autorização de acesso à sua agenda; autorize.
 *   4. Relógio (Acionadores/Triggers) -> Adicionar acionador:
 *          função: sincronizarAgenda | evento: baseado no tempo |
 *          a cada 10 minutos.  Salvar.
 *
 * Pronto. A cada 10 min a agenda fica em dia nas duas direções.
 */

// Domínio do app. Mudou na migração pra self-hosted (jul/2026) — o antigo
// (ekballo-academy.vercel.app) está morto. Dá pra sobrescrever pela propriedade
// de script APP_BASE, sem mexer no código, se o endereço mudar de novo.
const APP_BASE =
  PropertiesService.getScriptProperties().getProperty("APP_BASE") ||
  "https://ekballo.escoladodiscipuloimw.com.br";
const SECRET = PropertiesService.getScriptProperties().getProperty("AGENDA_SECRET");

// Janela sincronizada: de 7 dias atrás até ~4 meses à frente.
const DIAS_ATRAS = 7;
const DIAS_FRENTE = 120;

function sincronizarAgenda() {
  if (!SECRET) throw new Error("Falta a propriedade de script AGENDA_SECRET.");
  enviarGoogleParaEkballo();
  criarNoGoogleDoEkballo();
}

/**
 * Rode esta função pra conferir se a senha está certa, sem mexer em nada.
 * Sucesso aparece no log (Ctrl+Enter / "Registro de execução").
 */
function testarConexao() {
  if (!SECRET) throw new Error("Falta a propriedade de script AGENDA_SECRET.");
  const resp = UrlFetchApp.fetch(APP_BASE + "/api/agenda/push", {
    method: "get",
    headers: { "x-agenda-secret": SECRET },
    muteHttpExceptions: true,
  });
  checar(resp, "falar com o app");
  const n = (JSON.parse(resp.getContentText() || "{}").compromissos || []).length;
  console.log("✅ Conexão OK com " + APP_BASE + ". Compromissos esperando: " + n);
}

/**
 * Confere a resposta do app e ERRA ALTO quando dá problema.
 *
 * Sem isto o script fica mudo: todas as chamadas usam muteHttpExceptions, então
 * uma senha errada devolvia 401 e a execução terminava "com sucesso" sem fazer
 * nada — foi assim que a sincronização ficou meses parada sem ninguém notar.
 */
function checar(resp, oque) {
  const codigo = resp.getResponseCode();
  if (codigo === 401) {
    throw new Error(
      "O app recusou a senha (401) ao " + oque + ".\n\n" +
        "Ajuste a propriedade de script AGENDA_SECRET: ela tem que ser igual ao " +
        "trecho depois de 'key=' no link que aparece no painel do Ekballo, em " +
        "/admin/agenda -> \"Ver estes compromissos no meu Google Agenda\".",
    );
  }
  if (codigo >= 300) {
    throw new Error(
      "Falha ao " + oque + " (HTTP " + codigo + "): " + resp.getContentText().slice(0, 300),
    );
  }
  return resp;
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
  const resp = UrlFetchApp.fetch(APP_BASE + "/api/agenda/sync", {
    method: "post",
    contentType: "application/json",
    headers: { "x-agenda-secret": SECRET },
    payload: JSON.stringify({ de: de.toISOString(), ate: ate.toISOString(), eventos }),
    muteHttpExceptions: true,
  });
  checar(resp, "enviar seus eventos do Google pro Ekballo");
}

/** (2) Cria no Google Calendar os compromissos do Ekballo (painel/WhatsApp). */
function criarNoGoogleDoEkballo() {
  const resp = UrlFetchApp.fetch(APP_BASE + "/api/agenda/push", {
    method: "get",
    headers: { "x-agenda-secret": SECRET },
    muteHttpExceptions: true,
  });
  checar(resp, "ler os compromissos do Ekballo");
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
      const rm = UrlFetchApp.fetch(APP_BASE + "/api/agenda/push", {
        method: "post",
        contentType: "application/json",
        headers: { "x-agenda-secret": SECRET },
        payload: JSON.stringify({ id: c.id }),
        muteHttpExceptions: true,
      });
      // Se a remoção falhar calado, o mesmo compromisso volta a ser criado na
      // próxima rodada — vira duplicata a cada 10 minutos.
      checar(rm, "remover \"" + c.titulo + "\" da fila do Ekballo");
    } catch (err) {
      console.error("Falha ao criar no Google:", c.titulo, err);
    }
  }
}
