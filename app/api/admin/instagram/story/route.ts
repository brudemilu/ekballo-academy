import { type NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { CONTA_PRINCIPAL_ID } from "@/lib/instagram-contas";
import { credenciaisInstagram } from "@/lib/instagram-credenciais";
import { publicarStory } from "@/lib/instagram-publish";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * POST /api/admin/instagram/story  { dia, tema }  (ou { imageUrl })
 * Posta um Story (imagem 9:16) no perfil do ministério. Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  // Quem chama é a tela do devocional, fora do painel: o story é sempre da
  // conta principal, seja qual for a conta escolhida no painel (issue #264).
  const cred = await credenciaisInstagram(CONTA_PRINCIPAL_ID);
  if (!cred) {
    return NextResponse.json({ error: "Instagram não conectado." }, { status: 503 });
  }

  let imageUrl = "";
  try {
    const body = await req.json();
    const origin = req.nextUrl.origin;
    if (typeof body.imageUrl === "string" && body.imageUrl) {
      imageUrl = body.imageUrl;
    } else if (body.dia) {
      const tema = encodeURIComponent(String(body.tema || "cinematografico"));
      imageUrl = `${origin}/api/og/devocional?dia=${encodeURIComponent(String(body.dia))}&f=story&tema=${tema}`;
    }
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }
  if (!imageUrl)
    return NextResponse.json({ error: "Falta a imagem do story." }, { status: 400 });
  if (imageUrl.includes("localhost")) {
    return NextResponse.json(
      { error: "Só funciona no site publicado." },
      { status: 400 },
    );
  }

  try {
    const { id } = await publicarStory({
      ...cred,
      imageUrl,
    });
    return NextResponse.json({ ok: true, id });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao postar o story." },
      { status: 502 },
    );
  }
}
