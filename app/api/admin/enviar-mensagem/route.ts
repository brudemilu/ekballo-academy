import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

type Body = {
  destino_tipo: "todos" | "curso" | "aluno";
  destino_id?: string | null;
  canais: ("email" | "whatsapp")[];
  assunto: string;
  corpo_html: string;
  corpo_texto?: string | null;
};

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET!;
const EDGE_FUNCTION_URL = `${SUPABASE_URL.replace(
  ".supabase.co",
  ".functions.supabase.co"
)}/enviar-email`;

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export async function POST(req: NextRequest) {
  // 1) Auth: só admin
  if (!MOCK) {
    const userClient = await createServerClient();
    const {
      data: { user },
    } = await userClient.auth.getUser();
    if (!user) {
      return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    }
    const { data: profile } = await userClient
      .from("profiles")
      .select("is_admin")
      .eq("id", user.id)
      .single();
    if (!profile?.is_admin) {
      return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
    }
  }

  // 2) Body
  let body: Body;
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const { destino_tipo, destino_id, canais, assunto, corpo_html, corpo_texto } = body;

  if (!destino_tipo || !canais?.length || !assunto?.trim() || !corpo_html?.trim()) {
    return NextResponse.json(
      { erro: "destino_tipo, canais, assunto e corpo_html são obrigatórios" },
      { status: 400 }
    );
  }
  if ((destino_tipo === "curso" || destino_tipo === "aluno") && !destino_id) {
    return NextResponse.json(
      { erro: "destino_id obrigatório para curso/aluno" },
      { status: 400 }
    );
  }

  if (MOCK) {
    return NextResponse.json({
      mensagem_id: "mock-" + crypto.randomUUID(),
      total_destinatarios: 3,
      total_enviados: 3,
      total_erros: 0,
      mock: true,
    });
  }

  // 3) Cliente service_role pra ações privilegiadas (bypassa RLS)
  const admin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // 4) Resolve lista de destinatários
  let destinatarios: { id: string; email: string; nome: string | null }[] = [];

  if (destino_tipo === "todos") {
    const { data } = await admin
      .from("profiles")
      .select("id, email, nome")
      .eq("is_admin", false);
    destinatarios = data || [];
  } else if (destino_tipo === "curso") {
    const { data } = await admin
      .from("matriculas")
      .select("aluno:profiles!inner(id, email, nome)")
      .eq("curso_id", destino_id!);
    type Row = { aluno: { id: string; email: string; nome: string | null } };
    destinatarios = ((data || []) as unknown as Row[]).map((r) => r.aluno);
  } else if (destino_tipo === "aluno") {
    const { data } = await admin
      .from("profiles")
      .select("id, email, nome")
      .eq("id", destino_id!)
      .single();
    if (data) destinatarios = [data];
  }

  // Filtra emails inválidos/vazios
  destinatarios = destinatarios.filter((d) => !!d.email && d.email.includes("@"));

  if (destinatarios.length === 0) {
    return NextResponse.json(
      { erro: "nenhum destinatário com email válido encontrado" },
      { status: 400 }
    );
  }

  // 5) Buscar autor (admin que está enviando)
  let autorId: string | null = null;
  {
    const userClient = await createServerClient();
    const {
      data: { user },
    } = await userClient.auth.getUser();
    autorId = user?.id ?? null;
  }
  if (!autorId) {
    return NextResponse.json({ erro: "autor não identificado" }, { status: 401 });
  }

  // 6) Cria registro em `mensagens`
  const { data: mensagemRow, error: insertMensagemErr } = await admin
    .from("mensagens")
    .insert({
      autor_id: autorId,
      destino_tipo,
      destino_id: destino_tipo === "todos" ? null : destino_id,
      canais,
      assunto,
      corpo_html,
      corpo_texto: corpo_texto || null,
      total_destinatarios: destinatarios.length,
    })
    .select("id")
    .single();
  if (insertMensagemErr || !mensagemRow) {
    return NextResponse.json(
      { erro: "falha ao salvar mensagem", detalhe: insertMensagemErr?.message },
      { status: 500 }
    );
  }
  const mensagemId = mensagemRow.id as string;

  // 7) Cria linhas em `mensagens_destinatarios` (status inicial = 'pendente')
  await admin.from("mensagens_destinatarios").insert(
    destinatarios.map((d) => ({
      mensagem_id: mensagemId,
      aluno_id: d.id,
      email_status: canais.includes("email") ? "pendente" : "pulado",
      whatsapp_status: canais.includes("whatsapp") ? "pendente" : "pulado",
    }))
  );

  // 8) Dispara emails em paralelo (com concorrência limitada pra não estourar rate limit)
  let totalEnviados = 0;
  let totalErros = 0;

  if (canais.includes("email")) {
    const concurrency = 5;
    const chunks: typeof destinatarios[] = [];
    for (let i = 0; i < destinatarios.length; i += concurrency) {
      chunks.push(destinatarios.slice(i, i + concurrency));
    }

    for (const chunk of chunks) {
      const results = await Promise.all(
        chunk.map(async (d) => {
          try {
            const resp = await fetch(EDGE_FUNCTION_URL, {
              method: "POST",
              headers: {
                "x-internal-secret": INTERNAL_SECRET,
                "Content-Type": "application/json",
              },
              body: JSON.stringify({
                destinatario: d.email,
                assunto,
                html: corpo_html,
                text: corpo_texto || undefined,
              }),
            });
            const json = (await resp.json().catch(() => ({}))) as {
              status?: string;
              message_id?: string;
              brevo_status?: number;
              brevo_body?: unknown;
              erro?: string;
            };
            if (resp.ok && json.status === "enviado") {
              return { aluno_id: d.id, ok: true, msg_id: json.message_id ?? null };
            }
            const erro = json.erro || JSON.stringify(json.brevo_body) || `HTTP ${resp.status}`;
            return { aluno_id: d.id, ok: false, erro };
          } catch (e) {
            const msg = e instanceof Error ? e.message : String(e);
            return { aluno_id: d.id, ok: false, erro: msg };
          }
        })
      );

      // Atualiza status no banco
      await Promise.all(
        results.map((r) => {
          if (r.ok) {
            totalEnviados++;
            return admin
              .from("mensagens_destinatarios")
              .update({
                email_status: "enviado",
                email_msg_id: r.msg_id,
                email_enviado_em: new Date().toISOString(),
              })
              .eq("mensagem_id", mensagemId)
              .eq("aluno_id", r.aluno_id);
          }
          totalErros++;
          return admin
            .from("mensagens_destinatarios")
            .update({
              email_status: "erro",
              email_erro: r.erro?.slice(0, 500),
            })
            .eq("mensagem_id", mensagemId)
            .eq("aluno_id", r.aluno_id);
        })
      );
    }
  }

  // 9) Atualiza contadores na mensagem
  await admin
    .from("mensagens")
    .update({ total_enviados: totalEnviados, total_erros: totalErros })
    .eq("id", mensagemId);

  return NextResponse.json({
    mensagem_id: mensagemId,
    total_destinatarios: destinatarios.length,
    total_enviados: totalEnviados,
    total_erros: totalErros,
  });
}
