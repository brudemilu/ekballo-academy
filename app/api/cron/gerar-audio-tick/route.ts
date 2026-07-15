import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { gerarMp3Leitura } from "@/lib/audio-leitura";

// Worker incremental da geração de áudio de leitura sob demanda.
// Chamado 1x/min pelo pg_cron (net.http_get, ?secret=AGENDA_SYNC_SECRET).
// A cada tick: pega UM curso pendente/gerando, trava por 3min, e gera os
// próximos capítulos dentro de uma janela de tempo (~45s). Progresso é
// recalculado do estado real (aulas com audio_leitura_url), então é resiliente
// a reinício/retry. Marca 'pronto' quando todos os capítulos têm áudio.

export const runtime = "nodejs";
export const dynamic = "force-dynamic";
export const maxDuration = 120;

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const BUCKET = "materiais-cursos";
const ORCAMENTO_MS = 45_000; // janela de trabalho por tick

const db = () => createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

function autorizado(req: NextRequest): boolean {
  const sync = process.env.AGENDA_SYNC_SECRET;
  const cron = process.env.CRON_SECRET;
  const qs = req.nextUrl.searchParams.get("secret");
  const auth = req.headers.get("authorization");
  if (sync && qs === sync) return true;
  if (cron && auth === `Bearer ${cron}`) return true;
  return false;
}

async function contarComAudio(admin: ReturnType<typeof db>, cursoId: string): Promise<number> {
  const { count } = await admin
    .from("aulas")
    .select("id", { count: "exact", head: true })
    .eq("curso_id", cursoId)
    .not("audio_leitura_url", "is", null);
  return count ?? 0;
}

export async function GET(req: NextRequest) {
  if (!autorizado(req)) return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  const admin = db();

  // 1) Reivindica atomicamente UM curso pra trabalhar (pendente/gerando com
  // lock vencido). A função usa FOR UPDATE SKIP LOCKED — só um tick pega a obra.
  const { data: reclamados } = await admin.rpc("reclamar_curso_audio");
  const candidato = Array.isArray(reclamados) ? (reclamados[0] as { id: string; slug: string } | undefined) : null;
  if (!candidato) return NextResponse.json({ ok: true, ocioso: true });

  // total de capítulos do curso
  const { count: total } = await admin
    .from("aulas")
    .select("id", { count: "exact", head: true })
    .eq("curso_id", candidato.id);
  const totalAulas = total ?? 0;

  const inicio = Date.now();
  let geradas = 0;
  try {
    while (Date.now() - inicio < ORCAMENTO_MS) {
      // próximo capítulo sem áudio
      const { data: aula } = await admin
        .from("aulas")
        .select("id, conteudo")
        .eq("curso_id", candidato.id)
        .is("audio_leitura_url", null)
        .order("ordem", { ascending: true })
        .limit(1)
        .maybeSingle();

      if (!aula) {
        // acabou → pronto
        await admin
          .from("cursos")
          .update({
            audio_status: "pronto",
            audio_progresso: totalAulas,
            audio_total: totalAulas,
            audio_pronto_em: new Date().toISOString(),
            audio_lock_ate: null,
          })
          .eq("id", candidato.id);
        return NextResponse.json({ ok: true, curso: candidato.slug, status: "pronto", total: totalAulas });
      }

      const mp3 = await gerarMp3Leitura(aula.conteudo || "");
      const path = `audios-leitura/${aula.id}.mp3`;
      const { error: upErr } = await admin.storage
        .from(BUCKET)
        .upload(path, mp3, { contentType: "audio/mpeg", upsert: true });
      if (upErr) throw new Error(`upload: ${upErr.message}`);

      await admin.from("aulas").update({ audio_leitura_url: path }).eq("id", aula.id);
      geradas += 1;

      const feitas = await contarComAudio(admin, candidato.id);
      await admin.from("cursos").update({ audio_progresso: feitas }).eq("id", candidato.id);
    }

    // janela esgotou mas ainda há capítulos: libera o lock pro próximo tick
    await admin.from("cursos").update({ audio_lock_ate: null }).eq("id", candidato.id);
    const feitas = await contarComAudio(admin, candidato.id);
    return NextResponse.json({
      ok: true,
      curso: candidato.slug,
      status: "gerando",
      progresso: feitas,
      total: totalAulas,
      geradas_neste_tick: geradas,
    });
  } catch (e) {
    await admin
      .from("cursos")
      .update({ audio_status: "erro", audio_lock_ate: null })
      .eq("id", candidato.id);
    return NextResponse.json(
      { ok: false, curso: candidato.slug, erro: e instanceof Error ? e.message : "erro na geração" },
      { status: 500 },
    );
  }
}
