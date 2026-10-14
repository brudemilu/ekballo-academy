import { type NextRequest, NextResponse } from "next/server";
import {
  atualizarContaInstagram,
  getCurrentSession,
  listContasInstagram,
} from "@/lib/db";
import { ehIdDeConta } from "@/lib/instagram-contas";
import { prepararLogo } from "@/lib/logo-variantes";
import { isMockMode } from "@/lib/mock-data";
import { createServiceClient } from "@/lib/supabase/service";

export const runtime = "nodejs";
export const maxDuration = 60;

const BUCKET = "instagram";
const TIPOS_OK = ["image/png", "image/jpeg"];
const MAX_BYTES = 4 * 1024 * 1024;

function recusa(error: string, status = 400) {
  return NextResponse.json({ error }, { status });
}

/**
 * POST /api/admin/instagram/contas/logo  (multipart: "file", "id")
 * Recebe a logo de uma conta, converte para PNG, gera a versão para fundo
 * escuro e grava as duas na conta (issue #264). Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) return recusa("não autorizado", 401);

  const form = await req.formData().catch(() => null);
  const file = form?.get("file");
  const id = form?.get("id");
  if (!ehIdDeConta(id)) return recusa("Conta inválida.");
  if (!(file instanceof File)) return recusa("Nenhum arquivo enviado.");
  if (!TIPOS_OK.includes(file.type)) return recusa("Envie a logo em PNG ou JPG.");
  if (file.size > MAX_BYTES) return recusa("A logo é grande demais (máximo de 4 MB).");
  if (isMockMode()) {
    return recusa("O modo demonstração não guarda arquivos enviados.", 503);
  }

  try {
    if (!(await listContasInstagram()).some((c) => c.id === id)) {
      return recusa("Conta não encontrada.", 404);
    }
    const { normal, clara } = await prepararLogo(
      new Uint8Array(await file.arrayBuffer()),
    );
    const sb = createServiceClient();
    const chave = crypto.randomUUID();
    const subir = async (nome: string, bytes: Uint8Array) => {
      const caminho = `logos/${chave}-${nome}.png`;
      const { error } = await sb.storage
        .from(BUCKET)
        .upload(caminho, bytes, { contentType: "image/png", upsert: false });
      if (error) throw new Error(error.message);
      return sb.storage.from(BUCKET).getPublicUrl(caminho).data.publicUrl;
    };
    const [logo_url, logo_clara_url] = await Promise.all([
      subir("original", normal),
      subir("clara", clara),
    ]);
    await atualizarContaInstagram(id, { logo_url, logo_clara_url });
    return NextResponse.json({ ok: true, contas: await listContasInstagram() });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao gravar a logo.", 500);
  }
}
