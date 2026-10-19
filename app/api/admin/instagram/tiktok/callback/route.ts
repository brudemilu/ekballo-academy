import { type NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { CONTA_PRINCIPAL_ID } from "@/lib/instagram-contas";
import { siteBase } from "@/lib/site-url";
import { enderecoDeVolta, lerUsuario, trocarCodigo } from "@/lib/tiktok-api";
import { gravarCredenciaisTikTok } from "@/lib/tiktok-credenciais";

export const runtime = "nodejs";

// Volta da autorização do TikTok (issue #273). Confere o `state`, troca o
// código pelos tokens, grava e devolve o pastor ao painel com o resultado.

function voltarAoPainel(req: NextRequest, resultado: string) {
  const base = siteBase() || req.nextUrl.origin;
  const res = NextResponse.redirect(
    `${base}/admin/instagram?aba=criar&tiktok=${encodeURIComponent(resultado)}#tiktok`,
  );
  res.cookies.delete({ name: "tiktok_state", path: "/api/admin/instagram/tiktok" });
  return res;
}

export async function GET(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin)
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const q = req.nextUrl.searchParams;
  if (q.get("error"))
    return voltarAoPainel(
      req,
      `recusado: ${q.get("error_description") || q.get("error")}`,
    );
  const code = q.get("code") || "";
  const state = q.get("state") || "";
  const esperado = req.cookies.get("tiktok_state")?.value || "";
  if (!code || !state || state !== esperado)
    return voltarAoPainel(req, "a autorização expirou; tente conectar de novo");
  try {
    const tokens = await trocarCodigo(code, enderecoDeVolta());
    const perfil = await lerUsuario(tokens.accessToken).catch(() => ({
      nome: "",
      avatarUrl: null,
    }));
    await gravarCredenciaisTikTok(CONTA_PRINCIPAL_ID, tokens, perfil);
    return voltarAoPainel(req, "conectado");
  } catch (e) {
    return voltarAoPainel(req, `falhou: ${e instanceof Error ? e.message : "erro"}`);
  }
}
