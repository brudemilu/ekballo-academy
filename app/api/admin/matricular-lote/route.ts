import { createClient } from "@supabase/supabase-js";
import { type NextRequest, NextResponse } from "next/server";
import { desmatricularAlunos, matricularAlunos } from "@/lib/matricula";
import { createClient as createServerClient } from "@/lib/supabase/server";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Teto por chamada. Não é limite de produto — é para uma requisição
// não virar centenas de mensagens de WhatsApp por um clique só.
const MAX_POR_LOTE = 200;

// Admin matricula/desmatricula VÁRIOS alunos em UM curso de uma vez.
// A regra de quem recebe aviso é a mesma da matrícula individual
// (lib/matricula.ts): só quem entrou agora, nunca em temática aberta.
export async function POST(req: NextRequest) {
  if (!MOCK) {
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
  }

  let body: {
    cursoId?: string;
    alunoIds?: unknown;
    acao?: "matricular" | "desmatricular";
    notificar?: boolean;
  };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const { cursoId, acao } = body;
  const alunoIds = Array.isArray(body.alunoIds)
    ? [
        ...new Set(
          body.alunoIds.filter((id): id is string => typeof id === "string" && !!id),
        ),
      ]
    : [];
  const notificar = body.notificar !== false;

  if (!cursoId || (acao !== "matricular" && acao !== "desmatricular")) {
    return NextResponse.json(
      { erro: "cursoId e acao válidos obrigatórios" },
      { status: 400 },
    );
  }
  if (alunoIds.length === 0) {
    return NextResponse.json({ erro: "nenhum discípulo selecionado" }, { status: 400 });
  }
  if (alunoIds.length > MAX_POR_LOTE) {
    return NextResponse.json(
      { erro: `no máximo ${MAX_POR_LOTE} discípulos por vez` },
      { status: 400 },
    );
  }

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  try {
    if (acao === "desmatricular") {
      const { removidos } = await desmatricularAlunos(admin, { cursoId, alunoIds });
      return NextResponse.json({ ok: true, removidos });
    }

    const resumo = await matricularAlunos(admin, {
      cursoId,
      alunoIds,
      notificar,
      origin: new URL(req.url).origin,
    });
    return NextResponse.json({
      ok: true,
      entraram: resumo.entraram.length,
      jaEstavam: resumo.jaEstavam.length,
      cursoAberto: resumo.cursoAberto,
      push: resumo.push,
      whatsapp: resumo.whatsapp,
    });
  } catch (e) {
    const erro = e instanceof Error ? e.message : "falha ao salvar matrículas";
    return NextResponse.json({ erro }, { status: 500 });
  }
}
