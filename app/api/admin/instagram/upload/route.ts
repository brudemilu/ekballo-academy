import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { createServiceClient } from "@/lib/supabase/service";

export const runtime = "nodejs";
export const maxDuration = 30;

const BUCKET = "instagram";
const TIPOS_OK = ["image/jpeg", "image/png", "image/webp"];
const MAX_BYTES = 8 * 1024 * 1024; // 8MB

/**
 * POST /api/admin/instagram/upload  (multipart, campo "file")
 * Sobe uma imagem pro bucket público `instagram` e devolve a URL pública,
 * pra usar direto como image_url na publicação. Admin-only.
 *
 * Requer: bucket público `instagram` no Supabase + SUPABASE_SERVICE_ROLE_KEY.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  let form: FormData;
  try {
    form = await req.formData();
  } catch {
    return NextResponse.json({ error: "envio inválido" }, { status: 400 });
  }
  const file = form.get("file");
  if (!(file instanceof File)) {
    return NextResponse.json({ error: "nenhum arquivo enviado" }, { status: 400 });
  }
  if (!TIPOS_OK.includes(file.type)) {
    return NextResponse.json({ error: "Formato inválido. Use JPG, PNG ou WEBP." }, { status: 400 });
  }
  if (file.size > MAX_BYTES) {
    return NextResponse.json({ error: "Imagem muito grande (máx 8MB)." }, { status: 400 });
  }

  let supabase;
  try {
    supabase = createServiceClient();
  } catch {
    return NextResponse.json(
      { error: "Upload ainda não configurado (falta SUPABASE_SERVICE_ROLE_KEY / bucket)." },
      { status: 503 },
    );
  }

  const ext = file.type === "image/png" ? "png" : file.type === "image/webp" ? "webp" : "jpg";
  const path = `${crypto.randomUUID()}.${ext}`;
  const bytes = new Uint8Array(await file.arrayBuffer());

  const { error } = await supabase.storage.from(BUCKET).upload(path, bytes, {
    contentType: file.type,
    upsert: false,
  });
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  const { data } = supabase.storage.from(BUCKET).getPublicUrl(path);
  return NextResponse.json({ ok: true, url: data.publicUrl });
}
