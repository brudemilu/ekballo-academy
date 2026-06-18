import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";
import { gerarTextoLembrete } from "@/lib/mensagens-ia";

// IA por pessoa pode levar alguns segundos por destinatário.
export const maxDuration = 60;

// Campanhas automáticas (sugeridas pelo detector diário) — aprovação manual.
//   GET                                  -> campanhas pendentes + candidatos + templates
//   POST { acao:"aprovar", campanha_id, template_id, excluir_ids? }
//        -> renderiza o template e ENFILEIRA (whatsapp_fila, 1/min); grava aviso
//   POST { acao:"descartar", campanha_id }
//        -> marca descartada e grava aviso (suprime repetição por X dias)

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

function primeiroNome(nome: string | null): string {
  return (nome || "").trim().split(/\s+/)[0] || "";
}
function renderizar(corpo: string, nome: string | null, curso: string): string {
  return corpo
    .replace(/\{\{\s*nome\s*\}\}/gi, primeiroNome(nome))
    .replace(/\{\{\s*curso\s*\}\}/gi, curso || "seus estudos")
    .replace(/\s{2,}/g, " ")
    .trim();
}

export async function GET() {
  const negado = await exigirAdmin();
  if (negado) return negado;
  if (MOCK) return NextResponse.json({ campanhas: [], templates: [], mock: true });

  const db = admin();
  const [{ data: campanhas }, { data: templates }] = await Promise.all([
    db
      .from("campanhas_sugeridas")
      .select(
        "id, gatilho, descricao, status, total_candidatos, template_id, curso_id, criado_em, curso:cursos(titulo), candidatos:campanha_candidatos(id, aluno_id, nome, telefone, motivo, incluir)"
      )
      .eq("status", "pendente")
      .order("criado_em", { ascending: false }),
    db.from("mensagem_templates").select("id, titulo, corpo").order("titulo"),
  ]);

  return NextResponse.json({ campanhas: campanhas ?? [], templates: templates ?? [] });
}

export async function POST(req: NextRequest) {
  const negado = await exigirAdmin();
  if (negado) return negado;
  const body = await req.json().catch(() => ({}));
  const acao = body.acao as string;
  const campanhaId = String(body.campanha_id || "");
  if (!campanhaId) return NextResponse.json({ erro: "campanha_id obrigatório" }, { status: 400 });
  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const db = admin();
  const { data: campanha } = await db
    .from("campanhas_sugeridas")
    .select("id, gatilho, curso_id, status, template_id, curso:cursos(titulo)")
    .eq("id", campanhaId)
    .single();
  if (!campanha) return NextResponse.json({ erro: "campanha não encontrada" }, { status: 404 });
  if (campanha.status !== "pendente") {
    return NextResponse.json({ erro: "campanha já foi processada" }, { status: 409 });
  }

  const cursoTitulo = (campanha.curso as { titulo?: string } | null)?.titulo || "";

  const { data: candidatos } = await db
    .from("campanha_candidatos")
    .select("aluno_id, nome, telefone, incluir")
    .eq("campanha_id", campanhaId);
  const lista = (candidatos ?? []).filter((c) => c.incluir);

  if (acao === "descartar") {
    if (lista.length) {
      await db.from("avisos_enviados").insert(
        lista.map((c) => ({
          aluno_id: c.aluno_id,
          gatilho: campanha.gatilho,
          curso_id: campanha.curso_id,
          resultado: "descartado",
        }))
      );
    }
    await db
      .from("campanhas_sugeridas")
      .update({ status: "descartada", processada_em: new Date().toISOString() })
      .eq("id", campanhaId);
    return NextResponse.json({ ok: true, descartados: lista.length });
  }

  if (acao === "aprovar") {
    // Permite o admin remover algumas pessoas e trocar o template no ato.
    const excluir = new Set<string>((body.excluir_ids || []).map(String));
    const selecionados = lista.filter((c) => !excluir.has(c.aluno_id));
    // Regra de broadcast: campanha não atinge quem está só nas temáticas
    // abertas (Bíblia/Devocional/planos). Cobre o gatilho "sumida" (varre a
    // base); nos gatilhos por curso é no-op (candidatos já são alunos reais).
    const { idsAlunosReais } = await import("@/lib/destinatarios");
    const reais = await idsAlunosReais(db);
    const finais = selecionados.filter((c) => reais.has(c.aluno_id));
    const excluidosRegra = selecionados.length - finais.length;
    if (!finais.length) {
      return NextResponse.json(
        { erro: "nenhum aluno real para enviar (só há matriculados nas temáticas abertas)" },
        { status: 400 }
      );
    }
    const templateId = body.template_id || campanha.template_id;
    if (!templateId) {
      return NextResponse.json({ erro: "selecione um template" }, { status: 400 });
    }
    const { data: tpl } = await db
      .from("mensagem_templates")
      .select("corpo")
      .eq("id", templateId)
      .single();
    if (!tpl) return NextResponse.json({ erro: "template não encontrado" }, { status: 404 });

    // Texto por pessoa: no lembrete de atividades, a IA reescreve com o mesmo
    // sentido (texto único por discípulo). Nos demais gatilhos, usa o template.
    type FilaRow = { aluno_id: string; telefone: string; corpo: string };
    let filaRows: FilaRow[];
    if (campanha.gatilho === "atividades_pendentes") {
      filaRows = new Array(finais.length);
      const CONC = 5; // gera em lotes p/ não estourar o tempo da função
      for (let start = 0; start < finais.length; start += CONC) {
        const lote = finais.slice(start, start + CONC);
        await Promise.all(
          lote.map(async (c, k) => {
            const idx = start + k;
            const corpo = await gerarTextoLembrete(primeiroNome(c.nome), cursoTitulo, idx);
            filaRows[idx] = { aluno_id: c.aluno_id, telefone: c.telefone, corpo };
          }),
        );
      }
    } else {
      filaRows = finais.map((c) => ({
        aluno_id: c.aluno_id,
        telefone: c.telefone,
        corpo: renderizar(tpl.corpo, c.nome, cursoTitulo),
      }));
    }
    const { error: filaErr } = await db.from("whatsapp_fila").insert(filaRows);
    if (filaErr) return NextResponse.json({ erro: filaErr.message }, { status: 500 });

    // Registra aviso (anti-repetição) e marca campanha aprovada
    await db.from("avisos_enviados").insert(
      finais.map((c) => ({
        aluno_id: c.aluno_id,
        gatilho: campanha.gatilho,
        curso_id: campanha.curso_id,
        resultado: "enfileirado",
      }))
    );
    await db
      .from("campanhas_sugeridas")
      .update({
        status: "aprovada",
        template_id: templateId,
        processada_em: new Date().toISOString(),
      })
      .eq("id", campanhaId);

    return NextResponse.json({
      ok: true,
      enfileirados: finais.length,
      excluidos_regra_abertos: excluidosRegra,
    });
  }

  return NextResponse.json({ erro: "ação desconhecida" }, { status: 400 });
}
