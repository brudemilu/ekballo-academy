import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { createServiceClient } from "@/lib/supabase/service";

export const runtime = "nodejs";

/**
 * POST /api/admin/instagram/upload-video  { ext?: "mp4" | "mov" }
 * Gera uma URL ASSINADA de upload pro bucket `instagram` (pasta reels/). O
 * browser sobe o vídeo DIRETO pro Supabase (sem passar pelo body do Vercel, que
 * tem limite ~4.5MB). Devolve { path, token, publicUrl }. Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  let ext = "mp4";
  try {
    const body = await req.json().catch(() => ({}));
    if (body?.ext === "mov") ext = "mov";
  } catch {
    /* corpo opcional */
  }

  try {
    const supabase = createServiceClient();
    const path = `reels/${crypto.randomUUID()}.${ext}`;
    const { data, error } = await supabase.storage.from("instagram").createSignedUploadUrl(path);
    if (error || !data) {
      return NextResponse.json({ error: error?.message || "Falha ao preparar upload." }, { status: 500 });
    }
    const { data: pub } = supabase.storage.from("instagram").getPublicUrl(path);
    return NextResponse.json({ path: data.path, token: data.token, publicUrl: pub.publicUrl });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao preparar upload." },
      { status: 500 },
    );
  }
}
