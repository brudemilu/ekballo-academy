import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { supabaseFunctionsBase } from "@/lib/supabase/functions-url";
import { siteBase } from "@/lib/site-url";
import { diaAnoFromDateStr } from "@/lib/devocionais";

// =============================================================
// DEVOCIONAL DO DIA NO GRUPO (WhatsApp)
//
// Manda o devocional de hoje num grupo — por padrão o da IMW Olaria —
// todo dia às 6h de São Paulo. Quem dispara é o pg_cron do box
// (migration 230), no mesmo padrão dos outros crons: net.http_get
// com o segredo lido do vault.
//
//   GET /api/cron/devocional-grupo                 (Bearer CRON_SECRET)
//   GET /api/cron/devocional-grupo?secret=...      (AGENDA_SYNC_SECRET, teste manual)
//     &dry=1            monta a mensagem e devolve, sem enviar
//     &data=2026-08-28  outro dia (default: hoje em São Paulo)
//     &para=<jid|numero> destino avulso (teste sem incomodar o grupo)
//     &forcar=1         reenvia mesmo se o dia já foi registrado
//
// DESTINO: env `DEVOCIONAL_GRUPO_JID` (um ou vários, separados por vírgula).
// Sem ela, o grupo é procurado pelo nome (`DEVOCIONAL_GRUPO_NOME`, default
// "IMW Olaria") na lista da Evolution — mas só aceita nome EXATO: existem
// mais de vinte grupos com "Olaria" no nome e mandar no errado é pior do
// que não mandar.
//
// UMA VEZ POR DIA: antes de enviar, grava (data, destino) em
// `devocional_grupo_envios`. Se o cron repetir (retry, reboot, disparo
// manual), a chave primária barra o segundo envio.
// =============================================================

export const runtime = "nodejs";
export const maxDuration = 60;
export const dynamic = "force-dynamic";

const TZ = "America/Sao_Paulo";
const GRUPO_NOME_PADRAO = "IMW Olaria";
const LIMITE_TEXTO = 3800; // WhatsApp corta perto de 4096

type Devocional = {
  titulo: string | null;
  versiculo_ref: string;
  versiculo_texto: string;
  versiculo_versao: string | null;
  reflexao: string;
  autor: string | null;
};

/** "YYYY-MM-DD" no fuso de São Paulo (o container roda em UTC). */
function diaSP(): string {
  return new Date().toLocaleDateString("en-CA", { timeZone: TZ });
}

function autorizado(req: NextRequest): boolean {
  const cron = (process.env.CRON_SECRET || "").trim();
  const auth = req.headers.get("authorization") || "";
  if (cron && auth === `Bearer ${cron}`) return true;
  const agenda = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  return agenda !== "" && q === agenda;
}

function admin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } },
  );
}

/**
 * Devocional do dia: primeiro o postado pra data (tabela `devocionais`);
 * se não houver, o do ciclo perpétuo de 365 dias — a mesma ordem que o
 * site usa em `getDevocionalDoDia`, pra o grupo ler o mesmo texto do app.
 */
async function buscarDevocional(
  db: ReturnType<typeof admin>,
  dataStr: string,
): Promise<Devocional | null> {
  const { data: doDia } = await db
    .from("devocionais")
    .select("titulo, versiculo_ref, versiculo_texto, versiculo_versao, reflexao, autor")
    .eq("data", dataStr)
    .eq("publicado", true)
    .maybeSingle();
  if (doDia) return doDia as Devocional;

  const { data: anual } = await db
    .from("devocional_anual")
    .select("titulo, versiculo_ref, versiculo_texto, versiculo_versao, reflexao, autor")
    .eq("dia_ano", diaAnoFromDateStr(dataStr))
    .eq("publicado", true)
    .maybeSingle();
  return (anual as Devocional) || null;
}

function formatarMensagem(dev: Devocional, dataStr: string): string {
  const d = new Date(`${dataStr}T12:00:00-03:00`);
  const cabecalho = new Intl.DateTimeFormat("pt-BR", {
    timeZone: TZ,
    weekday: "long",
    day: "2-digit",
    month: "2-digit",
  }).format(d);

  const versao = dev.versiculo_versao ? ` (${dev.versiculo_versao})` : "";
  const partes = [
    `🌅 *Devocional de hoje* · ${cabecalho}`,
    dev.titulo ? `*${dev.titulo}*` : null,
    `_${dev.versiculo_texto.trim()}_\n📖 ${dev.versiculo_ref}${versao}`,
    corpo(dev.reflexao),
    dev.autor ? `_— ${dev.autor}_` : null,
  ].filter(Boolean) as string[];

  const base = siteBase();
  const rodape = base ? `\n\nLeia no app 👉 ${base}/devocional` : "";
  return partes.join("\n\n") + rodape;
}

/** Reflexão inteira quando cabe; senão corta no fim de um parágrafo. */
function corpo(reflexao: string): string {
  const texto = reflexao.trim();
  if (texto.length <= LIMITE_TEXTO) return texto;
  const corte = texto.lastIndexOf("\n\n", LIMITE_TEXTO);
  return `${texto.slice(0, corte > 500 ? corte : LIMITE_TEXTO).trim()}…`;
}

/** Grupos configurados por env, ou o achado pelo nome exato na Evolution. */
async function destinos(): Promise<{ jids: string[]; erro?: string }> {
  const fixos = (process.env.DEVOCIONAL_GRUPO_JID || "")
    .split(/[\s,]+/)
    .map((s) => s.trim())
    .filter(Boolean);
  if (fixos.length > 0) return { jids: fixos };

  const base = supabaseFunctionsBase();
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret) return { jids: [], erro: "envio não configurado (SUPABASE_FUNCTIONS_URL/INTERNAL_SECRET)" };

  const alvo = (process.env.DEVOCIONAL_GRUPO_NOME || GRUPO_NOME_PADRAO).trim().toLowerCase();
  try {
    const res = await fetch(`${base}/whatsapp-instancia`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-internal-secret": secret },
      body: JSON.stringify({ acao: "grupos" }),
    });
    if (!res.ok) return { jids: [], erro: `falha ao listar grupos (${res.status})` };
    const body = (await res.json()) as { grupos?: Record<string, unknown>[] };
    const achados = (body.grupos || []).filter((g) => {
      const nome = String(g.subject ?? g.Name ?? g.name ?? "").trim().toLowerCase();
      return nome === alvo;
    });
    const jids = achados
      .map((g) => String(g.id ?? g.JID ?? g.Jid ?? g.jid ?? "").trim())
      .filter((j) => j.endsWith("@g.us"));
    if (jids.length === 0) return { jids: [], erro: `grupo "${alvo}" não encontrado na lista da Evolution` };
    return { jids };
  } catch (e) {
    return { jids: [], erro: e instanceof Error ? e.message : "erro de rede ao listar grupos" };
  }
}

async function enviarTexto(destinatario: string, mensagem: string): Promise<string | null> {
  const base = supabaseFunctionsBase();
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret) return "envio não configurado (SUPABASE_FUNCTIONS_URL/INTERNAL_SECRET)";
  const ctrl = new AbortController();
  const t = setTimeout(() => ctrl.abort(), 25_000);
  try {
    const res = await fetch(`${base}/enviar-whatsapp-evolution`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-internal-secret": secret },
      body: JSON.stringify({ destinatario, mensagem }),
      signal: ctrl.signal,
    });
    if (!res.ok) return `${res.status} ${await res.text().catch(() => "")}`.trim();
    return null;
  } catch (e) {
    return e instanceof Error ? e.message : "erro de rede";
  } finally {
    clearTimeout(t);
  }
}

export async function GET(req: NextRequest) {
  if (!autorizado(req)) {
    return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  }

  const sp = req.nextUrl.searchParams;
  const dataStr = (sp.get("data") || "").match(/^\d{4}-\d{2}-\d{2}$/) ? sp.get("data")! : diaSP();
  const dry = sp.get("dry") === "1";
  const forcar = sp.get("forcar") === "1";
  const para = (sp.get("para") || "").trim();

  const db = admin();
  const dev = await buscarDevocional(db, dataStr);
  if (!dev) {
    return NextResponse.json({ ok: false, data: dataStr, erro: "sem devocional pro dia" }, { status: 404 });
  }
  const mensagem = formatarMensagem(dev, dataStr);

  const alvo = para ? { jids: [para] } : await destinos();
  if (dry) {
    return NextResponse.json({
      ok: true, dry: true, data: dataStr, destinos: alvo.jids,
      erro_destino: alvo.erro ?? null, tamanho: mensagem.length, mensagem,
    });
  }
  if (alvo.jids.length === 0) {
    return NextResponse.json({ ok: false, data: dataStr, erro: alvo.erro || "sem destino" }, { status: 500 });
  }

  const resultado: { destino: string; status: "enviado" | "duplicado" | "erro"; erro?: string }[] = [];
  for (const jid of alvo.jids) {
    // Reserva o par (data, destino) ANTES de enviar: se dois disparos
    // correrem juntos, só um passa da chave primária.
    if (!forcar && !para) {
      const { error } = await db.from("devocional_grupo_envios").insert({ data: dataStr, destino: jid });
      if (error) {
        if (error.code === "23505") {
          resultado.push({ destino: jid, status: "duplicado" });
          continue;
        }
        console.error("[devocional-grupo] falha ao registrar envio", jid, error.message);
      }
    }
    const erro = await enviarTexto(jid, mensagem);
    if (erro) {
      console.error("[devocional-grupo] envio falhou", jid, erro);
      // Solta a reserva pra o próximo disparo poder tentar de novo.
      if (!forcar && !para) {
        await db.from("devocional_grupo_envios").delete().eq("data", dataStr).eq("destino", jid);
      }
      resultado.push({ destino: jid, status: "erro", erro });
    } else {
      resultado.push({ destino: jid, status: "enviado" });
    }
  }

  const enviados = resultado.filter((r) => r.status === "enviado").length;
  return NextResponse.json({ ok: true, data: dataStr, enviados, resultado });
}
