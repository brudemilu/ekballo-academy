import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { createServiceClient } from "@/lib/supabase/service";

export const runtime = "nodejs";

const PASTA = "musicas";
const AUDIO_EXT = /\.(mp3|m4a|aac|wav|ogg)$/i;

/**
 * GET  /api/admin/instagram/musicas        → lista as faixas {nome, url}
 * POST /api/admin/instagram/musicas {ext}  → URL assinada de upload (musicas/<uuid>.<ext>)
 * Admin-only. As faixas ficam no bucket público `instagram`, pasta `musicas/`.
 */
export async function GET() {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    const supabase = createServiceClient();
    const { data, error } = await supabase.storage.from("instagram").list(PASTA, { limit: 100, sortBy: { column: "created_at", order: "desc" } });
    if (error) throw new Error(error.message);
    const faixas = (data || [])
      .filter((f) => AUDIO_EXT.test(f.name))
      .map((f) => ({
        // nome amigável: tira o sufixo "-<6 hex>.<ext>" e troca - por espaço
        nome: f.name.replace(/-[0-9a-f]{6}\.[a-z0-9]+$/i, "").replace(/[-_]+/g, " ").trim() || f.name,
        url: supabase.storage.from("instagram").getPublicUrl(`${PASTA}/${f.name}`).data.publicUrl,
      }));
    return NextResponse.json({ faixas });
  } catch (e) {
    return NextResponse.json({ error: e instanceof Error ? e.message : "Falha ao listar." }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  let ext = "mp3";
  let nome = "faixa";
  try {
    const b = await req.json().catch(() => ({}));
    if (typeof b?.ext === "string" && /^(mp3|m4a|aac|wav|ogg)$/i.test(b.ext)) ext = b.ext.toLowerCase();
    if (typeof b?.nome === "string" && b.nome.trim()) nome = b.nome;
  } catch {
    /* corpo opcional */
  }
  const slug = nome.normalize("NFD").replace(/[̀-ͯ]/g, "").replace(/[^a-zA-Z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 40).toLowerCase() || "faixa";
  try {
    const supabase = createServiceClient();
    const path = `${PASTA}/${slug}-${crypto.randomUUID().slice(0, 6)}.${ext}`;
    const { data, error } = await supabase.storage.from("instagram").createSignedUploadUrl(path);
    if (error || !data) throw new Error(error?.message || "Falha ao preparar upload.");
    return NextResponse.json({ path: data.path, token: data.token });
  } catch (e) {
    return NextResponse.json({ error: e instanceof Error ? e.message : "Falha." }, { status: 500 });
  }
}
