import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

// Mensagens agendadas (envio em data/hora futura).
//   GET                                      -> lista pendentes
//   POST { acao:"criar", tipo, payload, agendar_para, descricao }
//   POST { acao:"cancelar", id }

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

const admin = () => createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

async function pegarAdmin(): Promise<{ erro?: NextResponse; userId?: string }> {
  if (MOCK) return { userId: "mock" };
  const userClient = await createServerClient();
  const {
    data: { user },
  } = await userClient.auth.getUser();
  if (!user) return { erro: NextResponse.json({ erro: "não autenticado" }, { status: 401 }) };
  const { data: profile } = await userClient
    .from("profiles")
    .select("is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin) return { erro: NextResponse.json({ erro: "acesso negado" }, { status: 403 }) };
  return { userId: user.id };
}

export async function GET() {
  const { erro } = await pegarAdmin();
  if (erro) return erro;
  if (MOCK) return NextResponse.json({ agendadas: [], mock: true });
  const { data } = await admin()
    .from("mensagens_agendadas")
    .select("id, tipo, descricao, agendar_para, status, criado_em")
    .eq("status", "pendente")
    .order("agendar_para", { ascending: true });
  return NextResponse.json({ agendadas: data ?? [] });
}

export async function POST(req: NextRequest) {
  const { erro, userId } = await pegarAdmin();
  if (erro) return erro;
  const body = await req.json().catch(() => ({}));
  const acao = body.acao as string;

  if (acao === "cancelar") {
    const id = String(body.id || "");
    if (!id) return NextResponse.json({ erro: "id obrigatório" }, { status: 400 });
    if (MOCK) return NextResponse.json({ ok: true, mock: true });
    await admin()
      .from("mensagens_agendadas")
      .update({ status: "cancelada", processada_em: new Date().toISOString() })
      .eq("id", id)
      .eq("status", "pendente");
    return NextResponse.json({ ok: true });
  }

  if (acao === "criar") {
    const tipo = body.tipo === "direto" ? "direto" : "broadcast";
    const payload = body.payload;
    const agendarPara = body.agendar_para;
    if (!payload || !agendarPara) {
      return NextResponse.json({ erro: "payload e agendar_para são obrigatórios" }, { status: 400 });
    }
    const quando = new Date(agendarPara);
    if (isNaN(quando.getTime())) {
      return NextResponse.json({ erro: "data inválida" }, { status: 400 });
    }
    if (quando.getTime() < Date.now() + 30_000) {
      return NextResponse.json({ erro: "escolha um horário no futuro" }, { status: 400 });
    }
    if (MOCK) return NextResponse.json({ id: "mock-" + crypto.randomUUID(), mock: true });
    const { data, error } = await admin()
      .from("mensagens_agendadas")
      .insert({
        autor_id: userId,
        tipo,
        descricao: body.descricao || null,
        payload,
        agendar_para: quando.toISOString(),
      })
      .select("id")
      .single();
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
    return NextResponse.json({ id: data.id });
  }

  return NextResponse.json({ erro: "ação desconhecida" }, { status: 400 });
}
