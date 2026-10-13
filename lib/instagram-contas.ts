/**
 * Contas de Instagram do painel (issue #264) — a parte pura: tipos, a conta
 * principal e a leitura do que o Instagram responde sobre um token. Sem banco
 * e sem rede, para servir tanto ao servidor quanto às telas e aos testes.
 */

/**
 * A conta que já existia antes de o painel aceitar várias. O id é fixo (o
 * mesmo da migration 370) para o código apontar para ela sem consultar o
 * banco: é o padrão de tudo o que roda sem conta escolhida.
 */
export const CONTA_PRINCIPAL_ID = "00000000-0000-4000-8000-000000000001";

/** Cookie que guarda a conta em uso no painel. Não é segredo: só um id. */
export const COOKIE_CONTA = "ig_conta";

/** Cabeçalho com que cada aba do painel diz, a cada chamada, que conta mostra. */
export const CABECALHO_CONTA = "x-ig-conta";

export type ContaCadastrada = {
  id: string;
  nome: string;
  /** O @ do perfil, sem arroba. Vazio enquanto nenhum token foi conferido. */
  usuario: string;
  /** O que assina as artes desta conta. */
  assinatura: string;
  /** Logo que vai em toda arte; vazio = sem logo. */
  logo_url: string;
  /** A mesma logo, na versão para fundo escuro. */
  logo_clara_url: string;
  /** Texto embaixo da logo (ex.: "2ª Região"). */
  logo_legenda: string;
  principal: boolean;
  /** Há token para publicar e ler os números? */
  conectada: boolean;
  /** Quando o token vence (ISO), se o Instagram informou. */
  expira_em: string | null;
};

const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

export function ehIdDeConta(v: unknown): v is string {
  return typeof v === "string" && UUID.test(v);
}

/** A conta escolhida, ou a principal quando a escolha não existe (mais). */
export function contaEmUso<T extends { id: string; principal: boolean }>(
  contas: T[],
  escolhida: string | null | undefined,
): T | null {
  return (
    contas.find((c) => c.id === escolhida) ??
    contas.find((c) => c.principal) ??
    contas[0] ??
    null
  );
}

/** "@usuario" quando há; senão o nome dado à conta. */
export function rotuloDaConta(c: Pick<ContaCadastrada, "nome" | "usuario">): string {
  return c.usuario ? `@${c.usuario}` : c.nome;
}

export type TokenLido = { ok: true; token: string } | { ok: false; erro: string };

/**
 * Confere o FORMATO do que foi colado, antes de gastar uma chamada. O erro
 * que já aconteceu aqui (out/2026) foi colar a chave secreta do aplicativo —
 * 32 caracteres — no lugar do token, que tem mais de cem e começa com "IG".
 */
export function lerTokenColado(bruto: unknown): TokenLido {
  const token = typeof bruto === "string" ? bruto.replace(/\s+/g, "") : "";
  if (!token) return { ok: false, erro: "Cole o token da conta." };
  if (token.length < 60) {
    return {
      ok: false,
      erro: "Isso é curto demais para ser o token. Ele tem mais de cem caracteres e começa com “IG”; o que foi colado parece a chave secreta do aplicativo.",
    };
  }
  if (!/^[A-Za-z0-9_\-.|]+$/.test(token)) {
    return {
      ok: false,
      erro: "O token tem caracteres que não fazem parte dele. Copie de novo, inteiro.",
    };
  }
  return { ok: true, token };
}

export type PerfilDoToken = {
  igUserId: string;
  usuario: string;
};

/**
 * Lê a resposta de `/me` do Instagram. A API com login do Instagram devolve
 * `user_id` (o id que publica) além de `id`; quando vem, é ele que vale.
 */
export function lerPerfilDoToken(json: unknown): PerfilDoToken | null {
  if (!json || typeof json !== "object") return null;
  const j = json as { user_id?: unknown; id?: unknown; username?: unknown };
  const id = j.user_id ?? j.id;
  const igUserId = typeof id === "string" || typeof id === "number" ? String(id) : "";
  const usuario = typeof j.username === "string" ? j.username : "";
  if (!igUserId || !usuario) return null;
  return { igUserId, usuario };
}

/** Faltam quantos dias para o token vencer? null quando não se sabe. */
export function diasAteVencer(expiraEm: string | null, agora: Date): number | null {
  if (!expiraEm) return null;
  const fim = new Date(expiraEm).getTime();
  if (Number.isNaN(fim)) return null;
  return Math.floor((fim - agora.getTime()) / 86_400_000);
}
