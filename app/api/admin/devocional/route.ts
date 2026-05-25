import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";
import { enviarPush } from "@/lib/push";
import { hojeDateStr } from "@/lib/devocionais";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Admin cria ou atualiza um devocional.
// Body: { id?, data, titulo?, versiculo_ref, versiculo_texto, versiculo_versao?, reflexao, autor?, publicado? }
// Se for novo + publicado + data=hoje → dispara push pra todos com push enabled.
export async function POST(req: NextRequest) {
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });

    let body: {
      id?: string;
      data?: string;
      titulo?: string | null;
      versiculo_ref?: string;
      versiculo_texto?: string;
      versiculo_versao?: string;
      reflexao?: string;
      autor?: string | null;
      publicado?: boolean;
    };
    try {
      body = await req.json();
    } catch {
      return NextResponse.json({ erro: "body inválido" }, { status: 400 });
    }
    const {
      id, data, titulo, versiculo_ref, versiculo_texto,
      versiculo_versao, reflexao, autor, publicado,
    } = body;
    if (!data || !versiculo_ref?.trim() || !versiculo_texto?.trim() || !reflexao?.trim()) {
      return NextResponse.json(
        { erro: "data, versiculo_ref, versiculo_texto e reflexao são obrigatórios" },
        { status: 400 }
      );
    }
    if (!/^\d{4}-\d{2}-\d{2}$/.test(data)) {
      return NextResponse.json({ erro: "data deve ser YYYY-MM-DD" }, { status: 400 });
    }

    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
      auth: { persistSession: false },
    });

    let novoOuAtualizado: { id: string } | null = null;
    const payload = {
      data,
      titulo: titulo?.trim() || null,
      versiculo_ref: versiculo_ref.trim(),
      versiculo_texto: versiculo_texto.trim(),
      versiculo_versao: (versiculo_versao || "ACF").toUpperCase(),
      reflexao: reflexao.trim(),
      autor: autor?.trim() || null,
      publicado: publicado !== false,
      criado_por: user.id,
    };

    if (id) {
      const { data: row, error } = await admin
        .from("devocionais")
        .update(payload)
        .eq("id", id)
        .select("id")
        .single();
      if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
      novoOuAtualizado = row;
    } else {
      // upsert por data (cada dia tem 1)
      const { data: row, error } = await admin
        .from("devocionais")
        .upsert(payload, { onConflict: "data" })
        .select("id")
        .single();
      if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
      novoOuAtualizado = row;
    }

    // Push se for do dia atual e publicado
    let pushInfo: { enviados: number; erros: number; removidas: number } | null = null;
    if (payload.publicado && payload.data === hojeDateStr()) {
      const { data: alunos } = await admin
        .from("profiles")
        .select("id")
        .eq("is_admin", false);
      const alunoIds = (alunos || []).map((a: { id: string }) => a.id);
      if (alunoIds.length > 0) {
        const titulo_push = payload.titulo || `Devocional · ${payload.versiculo_ref}`;
        const body_push = payload.versiculo_texto.length > 140
          ? payload.versiculo_texto.slice(0, 137) + "..."
          : payload.versiculo_texto;
        pushInfo = await enviarPush(alunoIds, {
          title: `📖 ${titulo_push}`,
          body: body_push,
          url: `/devocional`,
          tag: `devocional-${payload.data}`,
        });
      }
    }

    return NextResponse.json({ ok: true, id: novoOuAtualizado?.id, push: pushInfo });
  }

  return NextResponse.json({ ok: true, mock: true });
}

// Admin deleta
export async function DELETE(req: NextRequest) {
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });

    const id = req.nextUrl.searchParams.get("id");
    if (!id) return NextResponse.json({ erro: "id obrigatório" }, { status: 400 });

    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
      auth: { persistSession: false },
    });
    const { error } = await admin.from("devocionais").delete().eq("id", id);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  }
  return NextResponse.json({ ok: true });
}
