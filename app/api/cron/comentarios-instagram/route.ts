import { type NextRequest, NextResponse } from "next/server";
import {
  type ResumoComentarios,
  responderComentarios,
} from "@/lib/comentarios-auto-executar";
import { listContasInstagram } from "@/lib/db";
import { comConta } from "@/lib/instagram-conta-atual";

export const runtime = "nodejs";
export const maxDuration = 60;

// Chamado pelo pg_cron do box de 5 em 5 minutos (job comentarios-instagram,
// migration 328) — e só quando o recurso está ligado: desligado, o banco nem
// chama. A rota confere de novo, porque também pode ser chamada à mão.

function autorizado(req: NextRequest): boolean {
  const cron = (process.env.CRON_SECRET || "").trim();
  const auth = req.headers.get("authorization") || "";
  if (cron && auth === `Bearer ${cron}`) return true;
  const agenda = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  return agenda !== "" && q === agenda;
}

export async function GET(req: NextRequest) {
  if (!autorizado(req))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    // Uma rodada por conta (issue #264). A falha de uma não impede as outras.
    const contas: (ResumoComentarios & { conta: string; erro?: string })[] = [];
    for (const c of await listContasInstagram()) {
      try {
        contas.push({
          conta: c.nome,
          ...(await comConta(c.id, () => responderComentarios())),
        });
      } catch (e) {
        contas.push({
          conta: c.nome,
          rodou: false,
          erro: e instanceof Error ? e.message : "falha",
        });
      }
    }
    return NextResponse.json({ ok: true, contas });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha ao responder comentários" },
      { status: 500 },
    );
  }
}
