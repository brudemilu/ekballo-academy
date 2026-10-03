import { type NextRequest, NextResponse } from "next/server";
import { formatarTempo, linkNoTempo, notaDoCorte, travado } from "@/lib/cortes";
import { processarCorte } from "@/lib/cortes-processar";
import {
  criarCorteConteudo,
  criarIdeiaConteudo,
  deletarCorteConteudo,
  getCorteConteudo,
  getCurrentSession,
} from "@/lib/db";
import { apiConfigurada, extractVideoId } from "@/lib/youtube";

export const runtime = "nodejs";

/**
 * Cortes de pregação (aba Cortes em /admin/instagram). Admin-only.
 *  - POST   { url }                     → cria a análise e dispara o trabalho em segundo plano
 *  - POST   { calendario: { id, indice, dia? } } → manda um momento para o calendário
 *  - GET    ?id=<uuid>                  → a análise (a tela consulta enquanto processa)
 *  - DELETE ?id=<uuid>
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function recusa(erro: string, status = 400) {
  return NextResponse.json({ error: erro }, { status });
}

export async function GET(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const id = req.nextUrl.searchParams.get("id");
  if (!id) return recusa("id é obrigatório");
  try {
    const corte = await getCorteConteudo(id);
    if (!corte) return recusa("Análise não encontrada.", 404);
    // Trabalho que morreu com um reinício do servidor: mostra como falha.
    if (travado(corte)) {
      return NextResponse.json({
        corte: {
          ...corte,
          status: "erro",
          erro: "A análise foi interrompida. Tente de novo.",
        },
      });
    }
    return NextResponse.json({ corte });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao ler a análise.", 500);
  }
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);

  if (corpo?.calendario) {
    const { id, indice, dia } = corpo.calendario as {
      id?: string;
      indice?: number;
      dia?: string;
    };
    if (!id || typeof indice !== "number") return recusa("Pedido inválido.");
    try {
      const corte = await getCorteConteudo(id);
      const momento = corte?.momentos[indice];
      if (!corte || !momento) return recusa("Corte não encontrado.", 404);
      const ideia = await criarIdeiaConteudo({
        titulo: momento.titulo,
        nota: notaDoCorte(
          momento,
          corte.titulo,
          linkNoTempo(corte.video_id, momento.inicio),
        ),
        formato: "reel",
        data_planejada:
          typeof dia === "string" && /^\d{4}-\d{2}-\d{2}$/.test(dia) ? dia : null,
      });
      return NextResponse.json({
        ok: true,
        ideia,
        tempo: formatarTempo(momento.inicio),
      });
    } catch (e) {
      return recusa(
        e instanceof Error ? e.message : "Falha ao mandar para o calendário.",
        500,
      );
    }
  }

  const videoId = extractVideoId(typeof corpo?.url === "string" ? corpo.url : "");
  if (!videoId) return recusa("Cole o link de um vídeo do YouTube.");
  if (!apiConfigurada()) {
    return recusa(
      "O conversor de áudio do YouTube não está configurado neste servidor.",
      503,
    );
  }
  if (!process.env.GROQ_API_KEY)
    return recusa("A transcrição não está configurada neste servidor.", 503);

  try {
    const corte = await criarCorteConteudo(videoId);
    // Segue trabalhando depois de responder: a análise leva um ou dois minutos
    // e a tela acompanha pelo GET. `processarCorte` nunca lança.
    void processarCorte(corte.id, videoId);
    return NextResponse.json({ ok: true, corte });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao começar a análise.", 500);
  }
}

export async function DELETE(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const id = req.nextUrl.searchParams.get("id");
  if (!id) return recusa("id é obrigatório");
  try {
    await deletarCorteConteudo(id);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao excluir.", 500);
  }
}
