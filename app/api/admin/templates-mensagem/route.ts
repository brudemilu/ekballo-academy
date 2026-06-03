import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

// CRUD dos templates de mensagem curta (WhatsApp/push), reutilizáveis no envio.
//   GET            -> lista todos
//   POST   {titulo, corpo, descricao?}        -> cria
//   PATCH  {id, titulo?, corpo?, descricao?, ativo?} -> edita
//   DELETE {id}                                -> remove

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
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

const admin = () => createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

const MOCK_TEMPLATES = [
  {
    id: "mock-1",
    titulo: "Lembrete: dias sem acessar",
    corpo: "Olá {{nome}}! 👋 Faz alguns dias que você não entra na plataforma. Que tal retomar a leitura? 📖",
    descricao: "Reengajamento.",
    ativo: true,
  },
];

export async function GET() {
  const negado = await exigirAdmin();
  if (negado) return negado;
  if (MOCK) return NextResponse.json({ templates: MOCK_TEMPLATES });
  const { data, error } = await admin()
    .from("mensagem_templates")
    .select("id, titulo, corpo, descricao, ativo, updated_at")
    .order("titulo");
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ templates: data });
}

export async function POST(req: NextRequest) {
  const negado = await exigirAdmin();
  if (negado) return negado;
  const body = await req.json().catch(() => ({}));
  const titulo = String(body.titulo || "").trim();
  const corpo = String(body.corpo || "").trim();
  if (!titulo || !corpo) {
    return NextResponse.json({ erro: "título e corpo são obrigatórios" }, { status: 400 });
  }
  if (MOCK) return NextResponse.json({ id: "mock-" + crypto.randomUUID(), mock: true });
  const { data, error } = await admin()
    .from("mensagem_templates")
    .insert({ titulo, corpo, descricao: body.descricao || null })
    .select("id")
    .single();
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ id: data.id });
}

export async function PATCH(req: NextRequest) {
  const negado = await exigirAdmin();
  if (negado) return negado;
  const body = await req.json().catch(() => ({}));
  const id = String(body.id || "");
  if (!id) return NextResponse.json({ erro: "id obrigatório" }, { status: 400 });
  const patch: Record<string, unknown> = {};
  if (typeof body.titulo === "string") patch.titulo = body.titulo.trim();
  if (typeof body.corpo === "string") patch.corpo = body.corpo.trim();
  if (typeof body.descricao === "string") patch.descricao = body.descricao;
  if (typeof body.ativo === "boolean") patch.ativo = body.ativo;
  if (Object.keys(patch).length === 0) {
    return NextResponse.json({ erro: "nada para atualizar" }, { status: 400 });
  }
  if (MOCK) return NextResponse.json({ ok: true, mock: true });
  const { error } = await admin().from("mensagem_templates").update(patch).eq("id", id);
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ ok: true });
}

export async function DELETE(req: NextRequest) {
  const negado = await exigirAdmin();
  if (negado) return negado;
  const body = await req.json().catch(() => ({}));
  const id = String(body.id || "");
  if (!id) return NextResponse.json({ erro: "id obrigatório" }, { status: 400 });
  if (MOCK) return NextResponse.json({ ok: true, mock: true });
  const { error } = await admin().from("mensagem_templates").delete().eq("id", id);
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ ok: true });
}
