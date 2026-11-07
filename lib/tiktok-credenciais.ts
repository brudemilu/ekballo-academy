/**
 * A autorização do TikTok de cada conta (issue #273, só servidor).
 *
 * Os tokens moram em `tiktok_credenciais`, tabela sem política de acesso: só
 * a chave de serviço lê. Quem chama já conferiu quem está pedindo (sessão de
 * admin ou segredo do cron). O token nunca volta numa resposta.
 */
import { createServiceClient } from "@/lib/supabase/service";
import { tokenVencendo } from "@/lib/tiktok";
import { renovarToken, revogarToken, type TokensTikTok } from "@/lib/tiktok-api";

export type ContaTikTok = {
  nome: string | null;
  avatarUrl: string | null;
  escopos: string;
  conectadoEm: string;
  /** O token de renovação vence (um ano): depois disso, conectar de novo. */
  refreshExpiraEm: string | null;
};

/** Quem está conectado, sem token nenhum. `null` = não conectado. */
export async function contaTikTok(contaId: string): Promise<ContaTikTok | null> {
  const { data } = await createServiceClient()
    .from("tiktok_credenciais")
    .select("nome, avatar_url, escopos, conectado_em, refresh_expira_em")
    .eq("conta_id", contaId)
    .maybeSingle();
  if (!data) return null;
  return {
    nome: data.nome,
    avatarUrl: data.avatar_url,
    escopos: data.escopos || "",
    conectadoEm: data.conectado_em,
    refreshExpiraEm: data.refresh_expira_em,
  };
}

export async function gravarCredenciaisTikTok(
  contaId: string,
  t: TokensTikTok,
  perfil: { nome: string; avatarUrl: string | null },
): Promise<void> {
  const agora = new Date().toISOString();
  const { error } = await createServiceClient()
    .from("tiktok_credenciais")
    .upsert({
      conta_id: contaId,
      open_id: t.openId,
      nome: perfil.nome || null,
      avatar_url: perfil.avatarUrl,
      access_token: t.accessToken,
      refresh_token: t.refreshToken,
      escopos: t.escopos,
      expira_em: t.expiraEm,
      refresh_expira_em: t.refreshExpiraEm,
      conectado_em: agora,
      atualizado_em: agora,
    });
  if (error) throw new Error(error.message);
}

/**
 * Um token de acesso válido, renovando se estiver para vencer (dura 24 h).
 * `null` = conta não conectada.
 */
export async function tokenTikTok(contaId: string): Promise<string | null> {
  const sb = createServiceClient();
  const { data } = await sb
    .from("tiktok_credenciais")
    .select("access_token, refresh_token, expira_em")
    .eq("conta_id", contaId)
    .maybeSingle();
  if (!data) return null;
  if (!tokenVencendo(data.expira_em)) return data.access_token as string;
  const novo = await renovarToken(data.refresh_token as string);
  const { error } = await sb
    .from("tiktok_credenciais")
    .update({
      access_token: novo.accessToken,
      refresh_token: novo.refreshToken,
      escopos: novo.escopos,
      expira_em: novo.expiraEm,
      refresh_expira_em: novo.refreshExpiraEm,
      atualizado_em: new Date().toISOString(),
    })
    .eq("conta_id", contaId);
  if (error) throw new Error(error.message);
  return novo.accessToken;
}

/** Desconecta: revoga no TikTok (se der) e apaga o token daqui. */
export async function desconectarTikTok(contaId: string): Promise<void> {
  const sb = createServiceClient();
  const { data } = await sb
    .from("tiktok_credenciais")
    .select("access_token")
    .eq("conta_id", contaId)
    .maybeSingle();
  if (data?.access_token) await revogarToken(data.access_token as string);
  const { error } = await sb
    .from("tiktok_credenciais")
    .delete()
    .eq("conta_id", contaId);
  if (error) throw new Error(error.message);
}
