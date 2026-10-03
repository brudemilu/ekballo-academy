import { type NextRequest, NextResponse } from "next/server";
import { criarExecucaoPiloto, getPilotoConfig, listExecucoesPiloto } from "@/lib/db";
import { executarPiloto } from "@/lib/piloto-executar";

export const runtime = "nodejs";

// Chamado pelo pg_cron do box de hora em hora (job piloto-conteudo, migration
// 325). A rota decide se é a hora: o piloto precisa estar ligado, o dia e a
// hora de Brasília precisam ser os do preparo, e a semana ainda não pode ter
// sido preparada.

function autorizado(req: NextRequest): boolean {
  const cron = (process.env.CRON_SECRET || "").trim();
  const auth = req.headers.get("authorization") || "";
  if (cron && auth === `Bearer ${cron}`) return true;
  const agenda = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  return agenda !== "" && q === agenda;
}

/** Dia da semana (0 = domingo) e hora atuais em Brasília (UTC−3 fixo). */
function agoraEmBrasilia(agora: Date): { dia: number; hora: number } {
  const sp = new Date(agora.getTime() - 3 * 3_600_000);
  return { dia: sp.getUTCDay(), hora: sp.getUTCHours() };
}

// Uma execução por semana: se já houve uma nas últimas 20 horas, não repete
// (o cron pode chamar duas vezes na mesma hora depois de um reinício).
const INTERVALO_MIN_MS = 20 * 3_600_000;

export async function GET(req: NextRequest) {
  if (!autorizado(req))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });

  try {
    const config = await getPilotoConfig(true);
    if (!config.ativo)
      return NextResponse.json({ ok: true, rodou: false, motivo: "piloto desligado" });

    const agora = new Date();
    const { dia, hora } = agoraEmBrasilia(agora);
    if (dia !== config.preparo.dia || hora !== config.preparo.hora) {
      return NextResponse.json({
        ok: true,
        rodou: false,
        motivo: "fora do horário do preparo",
      });
    }

    const [ultima] = await listExecucoesPiloto(true);
    if (
      ultima &&
      agora.getTime() - new Date(ultima.criado_em).getTime() < INTERVALO_MIN_MS
    ) {
      return NextResponse.json({
        ok: true,
        rodou: false,
        motivo: "a semana já foi preparada",
      });
    }

    const execucao = await criarExecucaoPiloto();
    // Segue trabalhando depois de responder; `executarPiloto` nunca lança.
    void executarPiloto(execucao.id, agora);
    return NextResponse.json({ ok: true, rodou: true, execucao: execucao.id });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha no piloto" },
      { status: 500 },
    );
  }
}
