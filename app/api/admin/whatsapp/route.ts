import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";

// Painel WhatsApp (Evolution GO): proxy admin-gated pras edge functions.
//   GET                      -> status da instância
//   POST { acao: "conectar" }-> dispara conexão e devolve QR
//   POST { acao: "qr" }      -> QR atual
//   POST { acao: "grupos" }  -> lista de grupos
//   POST { acao: "enviar", destinatario, tipo: "texto"|"midia", ... }
//        texto: { mensagem }
//        midia: { url, midia_tipo: image|video|audio|document, legenda?, filename? }
//
// Os secrets do provider (EVOLUTION_*) vivem nas edge functions; aqui só
// repassamos com o INTERNAL_SECRET, no mesmo padrão de /api/admin/enviar-mensagem.

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET!;
const FUNCTIONS_BASE = SUPABASE_URL.replace(".supabase.co", ".functions.supabase.co");
const EDGE_INSTANCIA_URL = `${FUNCTIONS_BASE}/whatsapp-instancia`;
const EDGE_TEXTO_URL = `${FUNCTIONS_BASE}/enviar-whatsapp-evolution`;
const EDGE_MIDIA_URL = `${FUNCTIONS_BASE}/enviar-whatsapp-midia`;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

async function exigirAdmin(): Promise<NextResponse | null> {
  if (MOCK) return null;
  const userClient = await createServerClient();
  const {
    data: { user },
  } = await userClient.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
  const { data: profile } = await userClient
    .from("profiles")
    .select("is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  return null;
}

function chamarEdge(url: string, body: unknown) {
  return fetch(url, {
    method: "POST",
    headers: { "x-internal-secret": INTERNAL_SECRET, "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
}

export async function GET() {
  const negado = await exigirAdmin();
  if (negado) return negado;
  if (MOCK) {
    return NextResponse.json({ connected: false, loggedIn: false, mock: true });
  }
  try {
    const resp = await chamarEdge(EDGE_INSTANCIA_URL, { acao: "status" });
    return NextResponse.json(await resp.json(), { status: resp.status });
  } catch (e) {
    return NextResponse.json(
      { erro: e instanceof Error ? e.message : "erro de rede" },
      { status: 502 }
    );
  }
}

export async function POST(req: NextRequest) {
  const negado = await exigirAdmin();
  if (negado) return negado;

  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const acao = body.acao as string;

  if (MOCK) {
    return NextResponse.json({
      mock: true,
      mensagem: "Modo demonstração: WhatsApp real desativado. Rode com Supabase para conectar.",
      ...(acao === "grupos" ? { grupos: [] } : {}),
      ...(acao === "enviar" ? { status: "enviado", message_id: "mock-" + crypto.randomUUID() } : {}),
    });
  }

  try {
    // Gerência da instância
    if (acao === "conectar" || acao === "qr" || acao === "grupos") {
      const resp = await chamarEdge(EDGE_INSTANCIA_URL, { acao });
      return NextResponse.json(await resp.json(), { status: resp.status });
    }

    // Envio direto (texto ou mídia) pra número ou grupo
    if (acao === "enviar") {
      const destinatario = String(body.destinatario || "").trim();
      if (!destinatario) {
        return NextResponse.json({ erro: "destinatário obrigatório" }, { status: 400 });
      }
      const tipo = body.tipo === "midia" ? "midia" : "texto";

      if (tipo === "texto") {
        const mensagem = String(body.mensagem || "").trim();
        if (!mensagem) return NextResponse.json({ erro: "mensagem obrigatória" }, { status: 400 });
        const resp = await chamarEdge(EDGE_TEXTO_URL, { destinatario, mensagem });
        return NextResponse.json(await resp.json(), { status: resp.status });
      }

      // mídia
      const url = String(body.url || "").trim();
      const midiaTipo = String(body.midia_tipo || "");
      if (!url) return NextResponse.json({ erro: "url da mídia obrigatória" }, { status: 400 });
      const resp = await chamarEdge(EDGE_MIDIA_URL, {
        destinatario,
        url,
        tipo: midiaTipo,
        legenda: body.legenda ?? null,
        filename: body.filename ?? null,
      });
      return NextResponse.json(await resp.json(), { status: resp.status });
    }

    return NextResponse.json({ erro: "ação desconhecida" }, { status: 400 });
  } catch (e) {
    return NextResponse.json(
      { erro: e instanceof Error ? e.message : "erro de rede" },
      { status: 502 }
    );
  }
}
