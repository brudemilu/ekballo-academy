import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

const PAPEIS_VALIDOS = ["coordenador", "lider"];
const PERMS_VALIDAS = ["discipulos", "acompanhamento", "conteudo", "comunicacao"];

// Master define quais áreas um papel (coordenador/lider) pode acessar.
export async function POST(req: NextRequest) {
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u
      .from("profiles")
      .select("papel, is_admin")
      .eq("id", user.id)
      .single();
    const ehMaster = profile?.papel === "master" || (profile?.is_admin && !profile?.papel);
    if (!ehMaster) return NextResponse.json({ erro: "apenas o master" }, { status: 403 });
  }

  let body: { papel?: string; permissoes?: string[] };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const papel = body.papel || "";
  if (!PAPEIS_VALIDOS.includes(papel)) {
    return NextResponse.json({ erro: "papel inválido" }, { status: 400 });
  }
  const permissoes = Array.isArray(body.permissoes)
    ? [...new Set(body.permissoes.filter((p) => PERMS_VALIDAS.includes(p)))]
    : [];

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // Substitui o conjunto inteiro do papel
  const del = await admin.from("papel_permissoes").delete().eq("papel", papel);
  if (del.error) return NextResponse.json({ erro: del.error.message }, { status: 500 });

  if (permissoes.length) {
    const rows = permissoes.map((permissao) => ({ papel, permissao }));
    const { error } = await admin.from("papel_permissoes").insert(rows);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true });
}
