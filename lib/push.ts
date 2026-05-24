// =============================================================
// EKBALLO ACADEMY · Web Push helpers (server-side)
// Dispara notificações pros aluno_ids passados, usando as
// subscriptions registradas em push_subscriptions.
// Limpa subscriptions inválidas (410 Gone / 404 Not Found).
// =============================================================

import webpush from "web-push";
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const VAPID_PUBLIC = process.env.NEXT_PUBLIC_VAPID_PUBLIC_KEY!;
const VAPID_PRIVATE = process.env.VAPID_PRIVATE_KEY!;
const VAPID_SUBJECT = process.env.VAPID_SUBJECT || "mailto:admin@example.com";

let vapidConfigured = false;
function setupVapid() {
  if (vapidConfigured) return;
  if (!VAPID_PUBLIC || !VAPID_PRIVATE) {
    throw new Error("VAPID keys não configuradas (NEXT_PUBLIC_VAPID_PUBLIC_KEY/VAPID_PRIVATE_KEY)");
  }
  webpush.setVapidDetails(VAPID_SUBJECT, VAPID_PUBLIC, VAPID_PRIVATE);
  vapidConfigured = true;
}

export type PushPayload = {
  title: string;
  body: string;
  url?: string;        // pra onde mandar o aluno ao clicar
  tag?: string;        // dedup: notificações com mesma tag se substituem
  icon?: string;       // default: /icon-192.png
};

// Dispara push pros aluno_ids fornecidos.
// Retorna { enviados, erros, removidas }.
export async function enviarPush(
  alunoIds: string[],
  payload: PushPayload
): Promise<{ enviados: number; erros: number; removidas: number }> {
  if (alunoIds.length === 0) return { enviados: 0, erros: 0, removidas: 0 };
  setupVapid();

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  const { data: subs } = await admin
    .from("push_subscriptions")
    .select("id, aluno_id, endpoint, p256dh, auth")
    .in("aluno_id", alunoIds);

  if (!subs || subs.length === 0) {
    return { enviados: 0, erros: 0, removidas: 0 };
  }

  const fullPayload = JSON.stringify({
    title: payload.title,
    body: payload.body,
    url: payload.url || "/dashboard",
    tag: payload.tag,
    icon: payload.icon || "/icon-192.png",
    badge: "/icon-192.png",
  });

  let enviados = 0;
  let erros = 0;
  const idsParaRemover: string[] = [];

  // Concorrência limitada
  const concurrency = 10;
  for (let i = 0; i < subs.length; i += concurrency) {
    const chunk = subs.slice(i, i + concurrency);
    await Promise.all(
      chunk.map(async (s) => {
        try {
          await webpush.sendNotification(
            {
              endpoint: s.endpoint,
              keys: { p256dh: s.p256dh, auth: s.auth },
            },
            fullPayload,
            { TTL: 60 * 60 * 24 } // 24h pra navegador entregar
          );
          enviados++;
        } catch (e: unknown) {
          const err = e as { statusCode?: number; body?: string };
          // 404/410 = subscription expirou → remove do banco
          if (err.statusCode === 410 || err.statusCode === 404) {
            idsParaRemover.push(s.id);
          } else {
            erros++;
            console.warn("push erro", err.statusCode, err.body);
          }
        }
      })
    );
  }

  if (idsParaRemover.length > 0) {
    await admin.from("push_subscriptions").delete().in("id", idsParaRemover);
  }

  return { enviados, erros, removidas: idsParaRemover.length };
}
