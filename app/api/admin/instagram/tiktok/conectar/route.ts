import { randomBytes } from "node:crypto";
import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { urlDeAutorizacao } from "@/lib/tiktok";
import { credenciaisDoApp, enderecoDeVolta } from "@/lib/tiktok-api";

export const runtime = "nodejs";

// Começa a autorização do TikTok (issue #273): manda o pastor para a tela do
// TikTok com um `state` aleatório, guardado num cookie para a volta conferir.

export async function GET() {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin)
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const app = credenciaisDoApp();
  const volta = enderecoDeVolta();
  if (!app || !volta)
    return NextResponse.json(
      {
        error:
          "TikTok não configurado no servidor (TIKTOK_CLIENT_KEY/TIKTOK_CLIENT_SECRET)",
      },
      { status: 503 },
    );
  const state = randomBytes(18).toString("base64url");
  const res = NextResponse.redirect(
    urlDeAutorizacao({
      clientKey: app.clientKey,
      redirectUri: volta,
      state,
      escopos: process.env.TIKTOK_SCOPES,
    }),
  );
  res.cookies.set("tiktok_state", state, {
    httpOnly: true,
    secure: true,
    sameSite: "lax",
    path: "/api/admin/instagram/tiktok",
    maxAge: 600,
  });
  return res;
}
