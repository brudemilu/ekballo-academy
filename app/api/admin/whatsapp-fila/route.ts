import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

// Painel da fila de WhatsApp.
//   GET                      -> contagens por status + últimos itens
//   POST { acao: "cancelar" }-> cancela todos os pendentes (ou de uma mensagem)
//        { acao: "cancelar", mensagem_id }

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

export async function GET() {
  const negado = await exigirAdmin();
  if (negado) return negado;
  if (MOCK) {
    return NextResponse.json({ contagens: { pendente: 0, enviado: 0, erro: 0 }, itens: [], mock: true });
  }
  const db = admin();
  const [{ data: itens }, statuses] = await Promise.all([
    db
      .from("whatsapp_fila")
      .select("id, telefone, status, erro, criado_em, enviado_em, aluno:profiles(nome)")
      .order("criado_em", { ascending: false })
      .limit(50),
    Promise.all(
      (["pendente", "enviando", "enviado", "erro", "cancelado"] as const).map(async (s) => {
        const { count } = await db
          .from("whatsapp_fila")
          .select("id", { count: "exact", head: true })
          .eq("status", s);
        return [s, count ?? 0] as const;
      })
    ),
  ]);
  const contagens = Object.fromEntries(statuses);
  return NextResponse.json({ contagens, itens: itens ?? [] });
}

export async function POST(req: NextRequest) {
  const negado = await exigirAdmin();
  if (negado) return negado;
  const body = await req.json().catch(() => ({}));
  if (body.acao !== "cancelar") {
    return NextResponse.json({ erro: "ação desconhecida" }, { status: 400 });
  }
  if (MOCK) return NextResponse.json({ cancelados: 0, mock: true });
  let q = admin()
    .from("whatsapp_fila")
    .update({ status: "cancelado" })
    .eq("status", "pendente");
  if (body.mensagem_id) q = q.eq("mensagem_id", String(body.mensagem_id));
  const { data, error } = await q.select("id");
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ cancelados: data?.length ?? 0 });
}
