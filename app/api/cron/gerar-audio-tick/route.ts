import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { gerarMp3Leitura, limparCacheLeitura } from "@/lib/audio-leitura";

// Worker incremental da geração de áudio de leitura sob demanda.
// Chamado 1x/min pelo pg_cron (net.http_get, ?secret=AGENDA_SYNC_SECRET).
// A cada tick: pega UM curso pendente/gerando, trava, e gera os próximos
// capítulos dentro de uma janela de tempo (~45s). Progresso é recalculado do
// estado real (aulas com audio_leitura_url), então é resiliente a reinício.
// Marca 'pronto' quando todos os capítulos têm áudio.
//
// IMPORTANTE (bug de 24/08/2026): o tick roda por MUITO mais tempo que o
// intervalo do cron — um capítulo de 35 mil chars são ~30 pedaços em série,
// facilmente 5-10 min. Como o lock era de 3 min, o tick seguinte reivindicava o
// MESMO curso e começava a sintetizar o MESMO capítulo em paralelo → várias
// conexões simultâneas no Edge TTS → rate-limit → "Stream closed before the
// synthesis completed" em todos → livro morria em 'erro'. Daí três travas:
//   1) mutex em processo (o app é 1 réplica) — nunca dois ticks trabalhando;
//   2) lock no banco de 30 min, RENOVADO a cada minuto enquanto sintetiza;
//   3) cache de pedaços em disco — falha no meio não joga fora o já sintetizado.

export const runtime = "nodejs";
export const dynamic = "force-dynamic";
export const maxDuration = 120;

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const BUCKET = "materiais-cursos";
const ORCAMENTO_MS = 45_000; // janela pra COMEÇAR mais um capítulo neste tick
const LOCK_MIN = 30; // minutos de lock (renovado durante a síntese)
const RENOVAR_LOCK_MS = 60_000; // renova no máximo 1x/min

const db = () => createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

// Mutex de processo: garante que nunca há dois ticks sintetizando ao mesmo
// tempo, mesmo se o lock do banco vencer por algum motivo.
let emAndamento = false;

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
  if (emAndamento) return NextResponse.json({ ok: true, ocupado: true });

  const admin = db();

  // 1) Reivindica atomicamente UM curso pra trabalhar (pendente/gerando com
  // lock vencido). A função usa FOR UPDATE SKIP LOCKED — só um tick pega a obra.
  const { data: reclamados } = await admin.rpc("reclamar_curso_audio");
  const candidato = Array.isArray(reclamados) ? (reclamados[0] as { id: string; slug: string } | undefined) : null;
  if (!candidato) return NextResponse.json({ ok: true, ocioso: true });

  emAndamento = true;

  // Renova o lock enquanto a síntese anda (capítulo grande passa de 30 min).
  let ultimaRenovacao = Date.now();
  const renovarLock = async (forcar = false) => {
    if (!forcar && Date.now() - ultimaRenovacao < RENOVAR_LOCK_MS) return;
    ultimaRenovacao = Date.now();
    const ate = new Date(Date.now() + LOCK_MIN * 60_000).toISOString();
    await admin.from("cursos").update({ audio_lock_ate: ate }).eq("id", candidato.id);
  };

  // total de capítulos do curso
  const { count: total } = await admin
    .from("aulas")
    .select("id", { count: "exact", head: true })
    .eq("curso_id", candidato.id);
  const totalAulas = total ?? 0;

  const inicio = Date.now();
  let geradas = 0;
  let avancouAlgo = false; // sintetizou pelo menos um pedaço novo neste tick
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
            audio_falhas: 0,
            audio_pronto_em: new Date().toISOString(),
            audio_lock_ate: null,
          })
          .eq("id", candidato.id);
        return NextResponse.json({ ok: true, curso: candidato.slug, status: "pronto", total: totalAulas });
      }

      const mp3 = await gerarMp3Leitura(aula.conteudo || "", {
        cacheKey: aula.id,
        aoAvancar: async (feitos, totalPedacos, doCache) => {
          if (!doCache) avancouAlgo = true;
          await renovarLock();
          if (feitos === 1 || feitos % 20 === 0 || feitos === totalPedacos) {
            console.log(`[audio] ${candidato.slug}: pedaço ${feitos}/${totalPedacos}`);
          }
        },
        // as esperas entre tentativas chegam a 60s — renova o lock mesmo parado
        pulso: renovarLock,
      });

      const path = `audios-leitura/${aula.id}.mp3`;
      const { error: upErr } = await admin.storage
        .from(BUCKET)
        .upload(path, mp3, { contentType: "audio/mpeg", upsert: true });
      if (upErr) throw new Error(`upload: ${upErr.message}`);

      await admin.from("aulas").update({ audio_leitura_url: path }).eq("id", aula.id);
      await limparCacheLeitura(aula.id);
      geradas += 1;
      console.log(`[audio] ${candidato.slug}: capítulo gerado (${Math.round(mp3.length / 1024)} KB)`);

      const feitas = await contarComAudio(admin, candidato.id);
      // progrediu → zera o contador de falhas
      await admin.from("cursos").update({ audio_progresso: feitas, audio_falhas: 0 }).eq("id", candidato.id);
      await renovarLock(true);
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
    const msg = e instanceof Error ? e.message : "erro na geração";
    // Não erra o livro na 1ª falha (costuma ser rate-limit transitório do Edge).
    // Se o tick sintetizou pedaços novos, houve avanço real (fica no cache e o
    // próximo tick retoma dali) → zera o contador em vez de incrementar.
    // Só marca 'erro' após MAX_FALHAS ticks seguidos sem avanço NENHUM.
    const MAX_FALHAS = 20;
    if (avancouAlgo) {
      console.warn(`[audio] ${candidato.slug}: capítulo interrompido mas avançou — retoma do cache: ${msg}`);
      await admin.from("cursos").update({ audio_falhas: 0, audio_lock_ate: null }).eq("id", candidato.id);
      return NextResponse.json({ ok: false, curso: candidato.slug, retry: true, avancou: true }, { status: 200 });
    }
    const { data: cur } = await admin
      .from("cursos")
      .select("audio_falhas")
      .eq("id", candidato.id)
      .maybeSingle();
    const falhas = (cur?.audio_falhas ?? 0) + 1;
    if (falhas >= MAX_FALHAS) {
      console.error(`[audio] ${candidato.slug}: DESISTIU após ${falhas} falhas — ${msg}`);
      await admin
        .from("cursos")
        .update({ audio_status: "erro", audio_falhas: falhas, audio_lock_ate: null })
        .eq("id", candidato.id);
      return NextResponse.json({ ok: false, curso: candidato.slug, erro: msg, falhas }, { status: 500 });
    }
    console.warn(`[audio] ${candidato.slug}: capítulo falhou (${falhas}/${MAX_FALHAS}) — retentará: ${msg}`);
    await admin
      .from("cursos")
      .update({ audio_falhas: falhas, audio_lock_ate: null })
      .eq("id", candidato.id);
    return NextResponse.json({ ok: false, curso: candidato.slug, retry: true, falhas }, { status: 200 });
  } finally {
    emAndamento = false;
  }
}
