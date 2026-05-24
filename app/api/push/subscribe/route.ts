import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

// Registra uma push subscription do aluno logado.
// Body: { endpoint, keys: { p256dh, auth } }
export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  let body: { endpoint?: string; keys?: { p256dh?: string; auth?: string } };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const { endpoint } = body;
  const p256dh = body.keys?.p256dh;
  const auth = body.keys?.auth;
  if (!endpoint || !p256dh || !auth) {
    return NextResponse.json(
      { erro: "endpoint + keys.p256dh + keys.auth obrigatórios" },
      { status: 400 }
    );
  }

  const userAgent = req.headers.get("user-agent") || null;

  // Upsert por endpoint (mesmo device atualiza last_seen_at)
  const { error } = await supabase.from("push_subscriptions").upsert(
    {
      aluno_id: user.id,
      endpoint,
      p256dh,
      auth,
      user_agent: userAgent,
      last_seen_at: new Date().toISOString(),
    },
    { onConflict: "endpoint" }
  );

  if (error) {
    return NextResponse.json({ erro: error.message }, { status: 500 });
  }
  return NextResponse.json({ ok: true });
}

// DELETE /api/push/subscribe?endpoint=...  → remove subscription
export async function DELETE(req: NextRequest) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  const endpoint = req.nextUrl.searchParams.get("endpoint");
  if (!endpoint) {
    return NextResponse.json({ erro: "endpoint obrigatório" }, { status: 400 });
  }
  await supabase
    .from("push_subscriptions")
    .delete()
    .eq("aluno_id", user.id)
    .eq("endpoint", endpoint);
  return NextResponse.json({ ok: true });
}
