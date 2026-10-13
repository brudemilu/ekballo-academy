import { type NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { instagramConectado } from "@/lib/instagram-credenciais";
import { analisarPerfil, listarPostsComMetricas } from "@/lib/instagram-insights";
import { gerarSugestoes } from "@/lib/instagram-sugestoes";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * POST /api/admin/instagram/sugestoes  { n?: number }
 * Lê o perfil da conta em uso via Graph API, analisa o engajamento e pede à
 * IA sugestões de post (abençoar + engajar). Não publica nada. Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  if (!(await instagramConectado())) {
    return NextResponse.json(
      { error: "Esta conta ainda não está conectada ao Instagram (aba Contas)." },
      { status: 503 },
    );
  }
  if (!process.env.CLOUDFLARE_ACCOUNT_ID || !process.env.CLOUDFLARE_API_TOKEN) {
    return NextResponse.json(
      { error: "IA não configurada (faltam credenciais Cloudflare)." },
      { status: 503 },
    );
  }

  let n = 3;
  try {
    const body = await req.json().catch(() => ({}));
    if (typeof body?.n === "number" && body.n >= 1 && body.n <= 5)
      n = Math.trunc(body.n);
  } catch {
    /* corpo opcional */
  }

  try {
    const posts = await listarPostsComMetricas(25);
    if (!posts.length) {
      return NextResponse.json(
        { error: "Nenhum post encontrado no perfil pra analisar ainda." },
        { status: 404 },
      );
    }
    const resumo = analisarPerfil(posts);
    const sugestoes = await gerarSugestoes(resumo, n);
    return NextResponse.json({ resumo, sugestoes });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao gerar sugestões." },
      { status: 502 },
    );
  }
}
