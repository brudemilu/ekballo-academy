/**
 * Lê os comentários dos posts recentes e responde aos que casam com uma
 * regra (issue #189). Chamado pelo cron de 5 em 5 minutos; aqui não há
 * sessão, então o banco é sempre o cliente de serviço.
 *
 * Ordem que importa: o comentário é RESERVADO no banco antes de qualquer
 * envio. Se duas rodadas do cron se cruzarem, só uma consegue reservar — e
 * ninguém recebe a mesma mensagem duas vezes.
 *
 * Permissões do token: além de publicar, ele precisa de
 * `instagram_business_manage_comments` (ler e responder comentários) e
 * `instagram_business_manage_messages` (a mensagem direta). Sem elas o
 * Instagram recusa e o erro fica registrado no histórico.
 */
import {
  type ComentarioIG,
  comentariosAResponder,
  montarMensagem,
} from "@/lib/comentarios-auto";
import {
  comentariosJaTratados,
  concluirComentario,
  getComentariosAtivo,
  listRegrasComentario,
  reservarComentario,
} from "@/lib/db";
import { instagramConfigurado } from "@/lib/instagram-publish";

const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";

// Quantos posts olhar e quantos comentários responder por rodada. O cron
// volta em 5 minutos; o que sobrar é respondido na próxima.
const POSTS_POR_RODADA = 10;
const RESPOSTAS_POR_RODADA = 15;

type GraphErro = { error?: { message?: string; error_user_msg?: string } };

function mensagemDoErro(j: GraphErro, status: number): string {
  return j.error?.error_user_msg || j.error?.message || `Instagram respondeu ${status}`;
}

async function graphGet<T>(caminho: string, token: string): Promise<T> {
  const sep = caminho.includes("?") ? "&" : "?";
  const res = await fetch(
    `${GRAPH}/${caminho}${sep}access_token=${encodeURIComponent(token)}`,
    { signal: AbortSignal.timeout(15_000) },
  );
  const j = (await res.json().catch(() => ({}))) as T & GraphErro;
  if (!res.ok) throw new Error(mensagemDoErro(j, res.status));
  return j;
}

async function graphPostJSON(
  caminho: string,
  token: string,
  corpo: object,
): Promise<void> {
  const res = await fetch(`${GRAPH}/${caminho}`, {
    method: "POST",
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
    body: JSON.stringify(corpo),
    signal: AbortSignal.timeout(15_000),
  });
  if (!res.ok) {
    const j = (await res.json().catch(() => ({}))) as GraphErro;
    throw new Error(mensagemDoErro(j, res.status));
  }
}

type Midia = { id: string; comments_count?: number };
type ComentarioBruto = {
  id: string;
  text?: string;
  username?: string;
  timestamp?: string;
  from?: { id?: string; username?: string };
};

export type ResumoComentarios = {
  rodou: boolean;
  motivo?: string;
  posts?: number;
  respondidos?: number;
  falhas?: number;
};

/** Uma rodada. Nunca lança por causa de um comentário: a falha vai para o histórico. */
export async function responderComentarios(
  agora = new Date(),
): Promise<ResumoComentarios> {
  if (!(await getComentariosAtivo(true))) return { rodou: false, motivo: "desligado" };
  if (!instagramConfigurado())
    return { rodou: false, motivo: "Instagram não conectado" };
  const regras = (await listRegrasComentario(true)).filter((r) => r.ativo);
  if (!regras.length) return { rodou: false, motivo: "nenhuma regra" };

  const igUserId = process.env.IG_USER_ID as string;
  const token = process.env.META_ACCESS_TOKEN as string;

  const eu = await graphGet<{ username?: string }>(
    `${igUserId}?fields=username`,
    token,
  );
  const proprio = { id: igUserId, usuario: eu.username || "" };

  const midias = await graphGet<{ data?: Midia[] }>(
    `${igUserId}/media?fields=id,comments_count&limit=${POSTS_POR_RODADA}`,
    token,
  );
  const comComentario = (midias.data || []).filter((m) => (m.comments_count ?? 0) > 0);

  let respondidos = 0;
  let falhas = 0;
  for (const midia of comComentario) {
    if (respondidos + falhas >= RESPOSTAS_POR_RODADA) break;
    const lista = await graphGet<{ data?: ComentarioBruto[] }>(
      `${midia.id}/comments?fields=id,text,username,timestamp,from&limit=50`,
      token,
    );
    const comentarios: ComentarioIG[] = (lista.data || []).map((c) => ({
      id: c.id,
      text: c.text || "",
      username: c.username || c.from?.username || "",
      timestamp: c.timestamp || "",
      fromId: c.from?.id,
    }));
    const tratados = await comentariosJaTratados(comentarios.map((c) => c.id));
    const pendentes = comentariosAResponder(
      comentarios,
      regras,
      tratados,
      proprio,
      agora,
    );

    for (const { comentario, regra } of pendentes) {
      if (respondidos + falhas >= RESPOSTAS_POR_RODADA) break;
      const reservado = await reservarComentario({
        comentario_id: comentario.id,
        regra_id: regra.id,
        media_id: midia.id,
        usuario: comentario.username,
        texto: comentario.text.slice(0, 500),
        palavra: regra.palavra,
      });
      if (!reservado) continue;

      let publico_ok: boolean | null = null;
      let privado_ok: boolean | null = null;
      const erros: string[] = [];

      // A mensagem direta primeiro: é ela que entrega o que a pessoa pediu.
      if (regra.mensagem_privada) {
        try {
          await graphPostJSON(`${igUserId}/messages`, token, {
            recipient: { comment_id: comentario.id },
            message: {
              text: montarMensagem(regra.mensagem_privada, comentario.username),
            },
          });
          privado_ok = true;
        } catch (e) {
          privado_ok = false;
          erros.push(`direta: ${e instanceof Error ? e.message : "falhou"}`);
        }
      }
      if (regra.resposta_publica) {
        try {
          await graphPostJSON(`${comentario.id}/replies`, token, {
            message: montarMensagem(regra.resposta_publica, comentario.username),
          });
          publico_ok = true;
        } catch (e) {
          publico_ok = false;
          erros.push(`pública: ${e instanceof Error ? e.message : "falhou"}`);
        }
      }

      await concluirComentario(comentario.id, {
        publico_ok,
        privado_ok,
        erro: erros.length ? erros.join(" | ").slice(0, 500) : null,
      }).catch((e) => console.error("[comentarios-auto] concluir:", e));
      if (erros.length) falhas++;
      else respondidos++;
    }
  }

  return { rodou: true, posts: comComentario.length, respondidos, falhas };
}
