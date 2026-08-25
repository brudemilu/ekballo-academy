import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";
import { telefoneBloqueadoBroadcast } from "@/lib/destinatarios";
import { supabaseFunctionsBase } from "@/lib/supabase/functions-url";
import { webhookBase } from "@/lib/site-url";

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
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET!;
const FUNCTIONS_BASE = supabaseFunctionsBase();
const EDGE_INSTANCIA_URL = `${FUNCTIONS_BASE}/whatsapp-instancia`;
const EDGE_TEXTO_URL = `${FUNCTIONS_BASE}/enviar-whatsapp-evolution`;
const EDGE_MIDIA_URL = `${FUNCTIONS_BASE}/enviar-whatsapp-midia`;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

async function exigirAdmin(req?: NextRequest): Promise<NextResponse | null> {
  if (MOCK) return null;
  // Chamada interna (agendador): autenticada por x-internal-secret, sem cookie.
  const hdr = req?.headers.get("x-internal-secret");
  if (hdr && hdr === INTERNAL_SECRET) return null;
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

// URL do webhook de recebimento (com o secret), montada server-side. Usada tanto
// pelo botão "webhook" quanto no "conectar" (pra reconexão já registrar o webhook).
function montarWebhookUrl(): string | null {
  const secret = process.env.AGENDA_WHATSAPP_SECRET || "";
  if (!secret) return null;
  // Sem fallback pra domínio fixo: o literal antigo apontava pro
  // ekballo-academy.vercel.app, morto desde a migração pro Contabo. Registrar
  // o webhook num host inexistente deixa o "agendar pelo WhatsApp" mudo sem
  // erro visível — melhor falhar aqui, alto e claro.
  const base = webhookBase();
  if (!base) return null;
  return `${base}/api/webhook/whatsapp-agenda?secret=${encodeURIComponent(secret)}`;
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
  const negado = await exigirAdmin(req);
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
    // Gerência da instância. No "conectar", já passa a URL do webhook pra que
    // o pareamento/reconexão registre o recebimento (Evolution GO seta o webhook
    // no /instance/connect).
    if (acao === "conectar" || acao === "qr" || acao === "grupos") {
      const extra = acao === "conectar" ? { url: montarWebhookUrl() } : {};
      const resp = await chamarEdge(EDGE_INSTANCIA_URL, { acao, ...extra });
      return NextResponse.json(await resp.json(), { status: resp.status });
    }

    // (Re)registra o webhook de RECEBIMENTO no Evolution (agendar pelo WhatsApp).
    // A URL do webhook (com o secret) é montada aqui, server-side.
    if (acao === "webhook") {
      const url = montarWebhookUrl();
      if (!url) {
        return NextResponse.json(
          {
            erro:
              "Falta configurar AGENDA_WHATSAPP_SECRET ou o endereço público " +
              "(NEXT_PUBLIC_SITE_URL / WEBHOOK_PUBLIC_BASE).",
          },
          { status: 500 },
        );
      }
      const resp = await chamarEdge(EDGE_INSTANCIA_URL, { acao: "webhook", url });
      return NextResponse.json(await resp.json(), { status: resp.status });
    }

    // Envio direto (texto ou mídia) pra número ou grupo
    if (acao === "enviar") {
      const destinatario = String(body.destinatario || "").trim();
      if (!destinatario) {
        return NextResponse.json({ erro: "destinatário obrigatório" }, { status: 400 });
      }

      // Regra de broadcast: não enviar pra cadastrado que está só nas temáticas
      // abertas (Bíblia/Devocional). Grupos e números não cadastrados passam.
      // Ver lib/destinatarios.ts.
      const db = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
        auth: { persistSession: false },
      });
      if (await telefoneBloqueadoBroadcast(db, destinatario)) {
        return NextResponse.json(
          {
            erro:
              "destinatário está só nas temáticas abertas (Bíblia/Devocional) — envio bloqueado pela regra de broadcast",
          },
          { status: 422 }
        );
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
