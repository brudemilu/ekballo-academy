/**
 * O token e o ID de cada conta de Instagram (issue #264, só servidor).
 *
 * O token mora em `instagram_contas_credenciais`, tabela sem nenhuma política
 * de acesso: só a chave de serviço lê. Por isso tudo aqui usa o cliente de
 * serviço — e por isso este arquivo só pode ser chamado por código que já
 * conferiu quem está pedindo (sessão de admin ou segredo do cron).
 *
 * A conta principal tem uma segunda fonte: enquanto ninguém gravar um token
 * para ela pela tela, valem IG_USER_ID e META_ACCESS_TOKEN do ambiente, como
 * era antes de existirem várias contas.
 */
import { contaAtualId } from "@/lib/instagram-conta-atual";
import {
  CONTA_PRINCIPAL_ID,
  lerPerfilDoToken,
  type PerfilDoToken,
} from "@/lib/instagram-contas";
import { createServiceClient } from "@/lib/supabase/service";

const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";

export type CredenciaisInstagram = { igUserId: string; token: string };

function doAmbiente(): CredenciaisInstagram | null {
  const igUserId = (process.env.IG_USER_ID || "").trim();
  const token = (process.env.META_ACCESS_TOKEN || "").trim();
  return igUserId && token ? { igUserId, token } : null;
}

/**
 * As credenciais de uma conta — a da execução atual quando `contaId` não vem.
 * `null` = conta sem token: quem chama mostra "não conectada" em vez de tentar.
 */
export async function credenciaisInstagram(
  contaId?: string,
): Promise<CredenciaisInstagram | null> {
  const id = contaId ?? (await contaAtualId());
  const reserva = id === CONTA_PRINCIPAL_ID ? doAmbiente() : null;
  // Modo mock não tem banco: a conta principal segue pelo ambiente, se houver.
  if (process.env.NEXT_PUBLIC_MOCK_MODE === "true") return reserva;

  const sb = createServiceClient();
  const [{ data: conta }, { data: cred }] = await Promise.all([
    sb.from("instagram_contas").select("ig_user_id").eq("id", id).maybeSingle(),
    sb
      .from("instagram_contas_credenciais")
      .select("token")
      .eq("conta_id", id)
      .maybeSingle(),
  ]);
  const igUserId = typeof conta?.ig_user_id === "string" ? conta.ig_user_id : "";
  const token = typeof cred?.token === "string" ? cred.token : "";
  return igUserId && token ? { igUserId, token } : reserva;
}

/** A conta consegue publicar e ler os números? */
export async function instagramConectado(contaId?: string): Promise<boolean> {
  return (await credenciaisInstagram(contaId).catch(() => null)) !== null;
}

export class TokenRecusado extends Error {}

/**
 * Pergunta ao Instagram de quem é o token. É a única prova de que ele serve:
 * em out/2026 um token errado passou dias como "válido" porque nada o testava
 * antes da primeira publicação. Lança `TokenRecusado` com a mensagem da API.
 */
export async function conferirToken(token: string): Promise<PerfilDoToken> {
  let res: Response;
  try {
    res = await fetch(
      `${GRAPH}/me?fields=user_id,username&access_token=${encodeURIComponent(token)}`,
      { signal: AbortSignal.timeout(12_000) },
    );
  } catch {
    throw new TokenRecusado(
      "Não foi possível falar com o Instagram agora. Tente de novo em instantes.",
    );
  }
  const json = (await res.json().catch(() => null)) as {
    error?: { message?: string };
  } | null;
  const perfil = res.ok ? lerPerfilDoToken(json) : null;
  if (!perfil) {
    const motivo = json?.error?.message;
    throw new TokenRecusado(
      motivo
        ? `O Instagram recusou o token: ${motivo}`
        : "O Instagram não reconheceu esse token.",
    );
  }
  return perfil;
}

/** Tokens gerados no painel da Meta valem 60 dias; a API não diz a data ao colar. */
const VALIDADE_ESTIMADA_MS = 60 * 86_400_000;

/**
 * Grava o token JÁ CONFERIDO de uma conta e o que o Instagram disse sobre ela.
 * Recusa quando o perfil já está ligado a outra conta do painel.
 */
export async function gravarToken(
  contaId: string,
  token: string,
  perfil: PerfilDoToken,
  agora = new Date(),
): Promise<void> {
  const sb = createServiceClient();
  const { data: outra } = await sb
    .from("instagram_contas")
    .select("id, nome")
    .eq("ig_user_id", perfil.igUserId)
    .neq("id", contaId)
    .maybeSingle();
  if (outra) {
    throw new TokenRecusado(
      `Esse token é do @${perfil.usuario}, que já está ligado à conta “${outra.nome}”.`,
    );
  }
  const { error: e1 } = await sb
    .from("instagram_contas")
    .update({
      ig_user_id: perfil.igUserId,
      usuario: perfil.usuario,
      atualizado_em: agora.toISOString(),
    })
    .eq("id", contaId);
  if (e1) throw new Error(e1.message);
  const { error: e2 } = await sb.from("instagram_contas_credenciais").upsert({
    conta_id: contaId,
    token,
    expira_em: new Date(agora.getTime() + VALIDADE_ESTIMADA_MS).toISOString(),
    atualizado_em: agora.toISOString(),
  });
  if (e2) throw new Error(e2.message);
}

/** Tira o token da conta. Os posts e o resto dela ficam como estão. */
export async function removerToken(contaId: string): Promise<void> {
  const { error } = await createServiceClient()
    .from("instagram_contas_credenciais")
    .delete()
    .eq("conta_id", contaId);
  if (error) throw new Error(error.message);
}

/** Por conta: quando o token gravado vence. Só diz que existe, nunca o valor. */
export async function situacaoDosTokens(): Promise<Map<string, string | null>> {
  const { data, error } = await createServiceClient()
    .from("instagram_contas_credenciais")
    .select("conta_id, expira_em");
  if (error) throw new Error(error.message);
  return new Map(
    (data || []).map((r) => [
      r.conta_id as string,
      (r.expira_em as string | null) ?? null,
    ]),
  );
}

/** A conta principal está de pé pelo ambiente (sem token gravado pela tela)? */
export function principalPeloAmbiente(): boolean {
  return doAmbiente() !== null;
}
