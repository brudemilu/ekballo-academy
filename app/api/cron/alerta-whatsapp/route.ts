import { createClient } from "@supabase/supabase-js";
import { type NextRequest, NextResponse } from "next/server";
import { enviarPush } from "@/lib/push";
import { createClient as createServerClient } from "@/lib/supabase/server";

// =============================================================
// ALERTA DE QUEDA DO WHATSAPP · por push, no celular do líder
//
// Quando o WhatsApp cai e o vigia do box não consegue consertar, o canal
// natural de aviso é justamente o que está fora — e a plataforma não usa
// e-mail. Sobra o push do próprio aplicativo, que não passa pelo WhatsApp.
//
//   POST /api/cron/alerta-whatsapp
//     • x-internal-secret: INTERNAL_SECRET   → vigia do box; avisa todo admin.
//     • sessão de admin + { "teste": true }  → manda um push de teste só para
//       quem pediu, para conferir que o aviso chega naquele aparelho.
//
// O chamador recebe `enviados`. Zero quer dizer que nenhum admin ativou as
// notificações em aparelho nenhum — o vigia registra isso, porque um alerta
// que não tem para onde ir precisa aparecer em algum lugar.
// =============================================================

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export async function POST(req: NextRequest) {
  const secret = req.headers.get("x-internal-secret");
  const peloVigia = !!INTERNAL_SECRET && !!secret && secret === INTERNAL_SECRET;

  if (peloVigia) {
    if (MOCK) return NextResponse.json({ ok: true, mock: true, enviados: 0 });
    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
      auth: { persistSession: false },
    });
    const { data: admins, error } = await admin
      .from("profiles")
      .select("id")
      .eq("is_admin", true);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
    const ids = ((admins || []) as { id: string }[]).map((a) => a.id);
    try {
      const r = await enviarPush(ids, {
        title: "⚠️ WhatsApp da plataforma fora do ar",
        body: "O conserto automático não resolveu. Nada está saindo: devocional, avisos e recuperação de senha. Toque para ver a conexão.",
        url: "/admin/mensagens",
        tag: "whatsapp-fora-do-ar",
      });
      return NextResponse.json({ ok: true, admins: ids.length, ...r });
    } catch (e) {
      const erro = e instanceof Error ? e.message : "falha ao enviar push";
      return NextResponse.json({ erro }, { status: 500 });
    }
  }

  // Sem o segredo, só serve o teste de um admin logado — e só para ele mesmo.
  if (MOCK) return NextResponse.json({ ok: true, mock: true, enviados: 1 });
  const u = await createServerClient();
  const {
    data: { user },
  } = await u.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
  const { data: profile } = await u
    .from("profiles")
    .select("is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin)
    return NextResponse.json({ erro: "acesso negado" }, { status: 403 });

  const body = (await req.json().catch(() => ({}))) as { teste?: unknown };
  if (body.teste !== true)
    return NextResponse.json(
      { erro: "só o teste é permitido por aqui" },
      { status: 400 },
    );

  try {
    const r = await enviarPush([user.id], {
      title: "✅ Teste do alerta de queda",
      body: "Se o WhatsApp da plataforma cair, o aviso chega assim neste aparelho.",
      url: "/admin/mensagens",
      tag: "whatsapp-alerta-teste",
    });
    return NextResponse.json({ ok: true, ...r });
  } catch (e) {
    const erro = e instanceof Error ? e.message : "falha ao enviar push";
    return NextResponse.json({ erro }, { status: 500 });
  }
}
