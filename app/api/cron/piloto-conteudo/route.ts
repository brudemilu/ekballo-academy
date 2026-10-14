import { type NextRequest, NextResponse } from "next/server";
import {
  criarExecucaoPiloto,
  getPilotoConfig,
  listContasInstagram,
  listExecucoesPiloto,
} from "@/lib/db";
import { comConta } from "@/lib/instagram-conta-atual";
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

type Rodada = { rodou: boolean; motivo?: string; execucao?: string };

/** A vez de UMA conta. Chamada dentro de `comConta`: tudo aqui é dela. */
async function rodarDaConta(agora: Date): Promise<Rodada> {
  const config = await getPilotoConfig(true);
  if (!config.ativo) return { rodou: false, motivo: "piloto desligado" };

  const { dia, hora } = agoraEmBrasilia(agora);
  if (dia !== config.preparo.dia || hora !== config.preparo.hora) {
    return { rodou: false, motivo: "fora do horário do preparo" };
  }

  const [ultima] = await listExecucoesPiloto(true);
  if (
    ultima &&
    agora.getTime() - new Date(ultima.criado_em).getTime() < INTERVALO_MIN_MS
  ) {
    return { rodou: false, motivo: "a semana já foi preparada" };
  }

  const execucao = await criarExecucaoPiloto();
  // Segue trabalhando depois de responder; `executarPiloto` nunca lança. A
  // conta continua fixada nele porque nasce dentro de `comConta`.
  void executarPiloto(execucao.id, agora);
  return { rodou: true, execucao: execucao.id };
}

export async function GET(req: NextRequest) {
  if (!autorizado(req))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });

  try {
    const agora = new Date();
    // Cada conta tem o seu piloto, com o seu dia e a sua hora (issue #264).
    // A falha de uma não impede as outras.
    const contas: (Rodada & { conta: string; erro?: string })[] = [];
    for (const c of await listContasInstagram()) {
      try {
        contas.push({
          conta: c.nome,
          ...(await comConta(c.id, () => rodarDaConta(agora))),
        });
      } catch (e) {
        contas.push({
          conta: c.nome,
          rodou: false,
          erro: e instanceof Error ? e.message : "falha",
        });
      }
    }
    return NextResponse.json({ ok: true, rodou: contas.some((c) => c.rodou), contas });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha no piloto" },
      { status: 500 },
    );
  }
}
