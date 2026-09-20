import { createClient } from "@supabase/supabase-js";
import { type NextRequest, NextResponse } from "next/server";
import { resumoDaAula } from "@/lib/resumo-aula";
import { siteBase } from "@/lib/site-url";
import { supabaseFunctionsBase } from "@/lib/supabase/functions-url";

// =============================================================
// AVISO NO WHATSAPP QUANDO O DISCÍPULO RESPONDE
//
// Miguel e Luiza respondem fora do horário em que alguém abre o painel.
// Sem aviso, a resposta espera dias por devolutiva — o contrário do que
// a mesa se propõe a ser. Esta rota manda no WhatsApp do líder:
//
//   • livro     → livro, mesa, resumo do capítulo, pergunta e resposta;
//   • devocional→ só o dia e a resposta (o devocional o líder já conhece).
//
//   GET /api/cron/avisar-respostas                (Bearer CRON_SECRET)
//   GET /api/cron/avisar-respostas?secret=...     (AGENDA_SYNC_SECRET, manual)
//     &dry=1        monta as mensagens e devolve, sem enviar nem registrar
//     &janela=10    minutos de silêncio antes de avisar (default 10)
//     &limite=8     teto de mensagens por rodada (default 8)
//
// POR QUE UM CRON, E NÃO UM GATILHO NA HORA DE SALVAR: a reflexão de
// livro é gravada direto do navegador (AtividadeForm → supabase.upsert),
// sem passar por rota nossa. Além disso quem escreve salva várias vezes
// seguidas e responde várias perguntas do mesmo capítulo — avisar a cada
// gravação seria um WhatsApp a cada frase. Então a regra é: espera a
// pessoa parar de escrever (`janela`), junta o que é do mesmo capítulo e
// manda UM aviso.
//
// NÃO REPETE: cada aviso enviado grava (origem, chave, referencia) em
// `avisos_resposta`. Só volta a avisar se a resposta for editada DEPOIS
// do que já foi avisado — edição semanas depois é notícia; a mesma
// resposta relida, não.
// =============================================================

export const runtime = "nodejs";
export const maxDuration = 60;
export const dynamic = "force-dynamic";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";
const TZ = "America/Sao_Paulo";
const JANELA_PADRAO = 10; // minutos de silêncio
const LIMITE_PADRAO = 8; // mensagens por rodada
const LIMITE_TEXTO = 3500; // WhatsApp corta perto de 4096
const RESPOSTA_NO_AVISO = 900; // caracteres da resposta que cabem no aviso

/**
 * Quem é acompanhado por aviso. Pedido do Bruno em set/2026: Miguel e
 * Luiza. Fica em env para incluir ou tirar gente sem novo deploy.
 */
function emailsAcompanhados(): string[] {
  const env = (process.env.AVISO_RESPOSTAS_EMAILS || "")
    .split(/[,\s;]+/)
    .map((e) => e.trim().toLowerCase())
    .filter(Boolean);
  if (env.length > 0) return env;
  return ["miguelferoliveira2015@gmail.com", "luizaferoliveira2017@gmail.com"];
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

/** Para onde vai o aviso: env, ou o telefone do próprio admin no banco. */
async function destino(db: ReturnType<typeof admin>): Promise<string | null> {
  const env = (process.env.AVISO_RESPOSTAS_DESTINO || "").trim();
  if (env) return env;
  const { data } = await db
    .from("profiles")
    .select("telefone")
    .eq("is_admin", true)
    .not("telefone", "is", null)
    .order("created_at", { ascending: true })
    .limit(1)
    .maybeSingle();
  const tel = ((data as { telefone?: string } | null)?.telefone || "").replace(
    /\D+/g,
    "",
  );
  return tel.length >= 12 ? tel : null;
}

async function enviarTexto(
  destinatario: string,
  mensagem: string,
): Promise<string | null> {
  const base = supabaseFunctionsBase();
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret)
    return "envio não configurado (SUPABASE_FUNCTIONS_URL/INTERNAL_SECRET)";
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

function primeiroNome(nome: string | null): string {
  return (nome || "").trim().split(/\s+/)[0] || "Discípulo";
}

function cortar(texto: string, max: number): string {
  const limpo = texto.trim();
  if (limpo.length <= max) return limpo;
  return `${limpo.slice(0, max - 1).trimEnd()}…`;
}

// ---------------------------------------------------------------
// Tipos do que volta do PostgREST (select aninhado)
// ---------------------------------------------------------------
type LinhaResposta = {
  id: string;
  texto: string | null;
  updated_at: string;
  aluno_id: string;
  atividade: {
    pergunta: string;
    ordem: number | null;
    aula: {
      id: string;
      titulo: string;
      ordem: number | null;
      conteudo: string | null;
      resumo_curto: string | null;
      curso: { titulo: string; slug: string | null } | null;
    } | null;
  } | null;
};

type Aviso = {
  origem: "resposta" | "devocional";
  chave: string;
  referencia: string; // updated_at avisado
  anterior: string | null; // o que estava gravado antes (para desfazer)
  /** Quem vai na mesma mensagem: as respostas de um capítulo compartilham. */
  grupo: string;
  /** Só o primeiro do grupo carrega o texto; os demais são registro. */
  mensagem: string;
};

export async function GET(req: NextRequest) {
  if (!autorizado(req)) {
    return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  }
  if (MOCK) {
    return NextResponse.json({ ok: true, mock: true, avisos: 0 });
  }

  const sp = req.nextUrl.searchParams;
  const dry = sp.get("dry") === "1";
  const janela = Math.max(0, Number(sp.get("janela")) || JANELA_PADRAO);
  const limite = Math.max(1, Number(sp.get("limite")) || LIMITE_PADRAO);
  const corte = new Date(Date.now() - janela * 60_000).toISOString();

  const db = admin();

  const { data: perfis } = await db
    .from("profiles")
    .select("id, nome, email")
    .in("email", emailsAcompanhados());
  const alunos = (perfis || []) as { id: string; nome: string | null; email: string }[];
  if (alunos.length === 0) {
    return NextResponse.json({
      ok: true,
      avisos: 0,
      nota: "nenhum discípulo acompanhado encontrado",
    });
  }
  const nomePorId = new Map(alunos.map((a) => [a.id, primeiroNome(a.nome)]));
  const ids = alunos.map((a) => a.id);

  // Já avisado: chave → referência (updated_at) do último aviso.
  //
  // ESTA LEITURA NÃO PODE FALHAR EM SILÊNCIO. Ela é a única coisa que separa
  // "avisar o que chegou agora" de "despejar duzentas respostas antigas no
  // WhatsApp". Se ela voltar vazia por erro — e não porque nada foi avisado —
  // a rodada inteira acha que tudo é novo. Aconteceu no primeiro deploy: a
  // tabela tinha acabado de ser criada e o PostgREST ainda não a via no cache
  // de schema (PGRST205), então a leitura deu 404 e a rota tratou o histórico
  // como notícia. Agora, na dúvida, ela não avisa ninguém.
  const { data: jaAvisados, error: erroAvisados } = await db
    .from("avisos_resposta")
    .select("origem, chave, referencia");
  if (erroAvisados) {
    return NextResponse.json(
      {
        ok: false,
        erro: `não deu para ler o que já foi avisado: ${erroAvisados.message}`,
      },
      { status: 500 },
    );
  }
  const avisado = new Map<string, string>(
    ((jaAvisados || []) as { origem: string; chave: string; referencia: string }[]).map(
      (r) => [`${r.origem}:${r.chave}`, r.referencia],
    ),
  );
  const novo = (origem: string, chave: string, ref: string): boolean => {
    const anterior = avisado.get(`${origem}:${chave}`);
    return !anterior || new Date(ref) > new Date(anterior);
  };

  const avisos: Aviso[] = [];
  const base = siteBase();

  // -----------------------------------------------------------
  // 1) Reflexões de livro — agrupadas por (discípulo, capítulo)
  // -----------------------------------------------------------
  const { data: respostas, error: erroResp } = await db
    .from("respostas")
    .select(
      "id, texto, updated_at, aluno_id, " +
        "atividade:atividades!inner(pergunta, ordem, " +
        "aula:aulas!inner(id, titulo, ordem, conteudo, resumo_curto, " +
        "curso:cursos!inner(titulo, slug)))",
    )
    .in("aluno_id", ids)
    .not("texto", "is", null)
    .lte("updated_at", corte)
    .order("updated_at", { ascending: false })
    .limit(60);
  if (erroResp) {
    return NextResponse.json({ ok: false, erro: erroResp.message }, { status: 500 });
  }

  const porCapitulo = new Map<string, LinhaResposta[]>();
  for (const bruta of (respostas || []) as unknown as LinhaResposta[]) {
    if (!bruta.atividade?.aula) continue;
    if ((bruta.texto || "").trim() === "") continue;
    if (!novo("resposta", bruta.id, bruta.updated_at)) continue;
    const chave = `${bruta.aluno_id}:${bruta.atividade.aula.id}`;
    const lista = porCapitulo.get(chave) || [];
    lista.push(bruta);
    porCapitulo.set(chave, lista);
  }

  for (const lista of porCapitulo.values()) {
    if (avisos.length >= limite) break;
    // Ordem da pergunta na mesa, para o aviso ler como a tela lê.
    lista.sort((a, b) => (a.atividade?.ordem ?? 0) - (b.atividade?.ordem ?? 0));
    const primeira = lista[0];
    const aula = primeira.atividade!.aula!;
    const livro = aula.curso?.titulo || "Leitura";
    const quem = nomePorId.get(primeira.aluno_id) || "Discípulo";
    const mesa = aula.ordem ? `Mesa ${String(aula.ordem).padStart(2, "0")} · ` : "";

    const resumo = await resumoDaAula(db, aula, livro);

    const partes = [`📖 *${quem} respondeu* — ${livro}`, `${mesa}${aula.titulo}`, ""];
    if (resumo) partes.push(`_Sobre o capítulo:_ ${resumo}`, "");
    for (const r of lista) {
      partes.push(`*${r.atividade!.pergunta.trim()}*`);
      partes.push(cortar(r.texto || "", RESPOSTA_NO_AVISO));
      partes.push("");
    }
    if (base && aula.curso?.slug) {
      partes.push(`Responder: ${base}/admin/respostas`);
    }

    const grupo = `${primeira.aluno_id}:${aula.id}`;
    for (const r of lista) {
      avisos.push({
        origem: "resposta",
        chave: r.id,
        referencia: r.updated_at,
        anterior: avisado.get(`resposta:${r.id}`) || null,
        grupo,
        // A mensagem inteira vai junto da PRIMEIRA resposta do grupo; as
        // demais entram só como registro de "já avisado".
        mensagem: r === primeira ? cortar(partes.join("\n"), LIMITE_TEXTO) : "",
      });
    }
  }

  // -----------------------------------------------------------
  // 2) Devocional — só quem respondeu e o que respondeu
  // -----------------------------------------------------------
  const { data: reflexoes } = await db
    .from("devocional_anual_reflexao")
    .select("aluno_id, dia_ano, texto, atualizado_em")
    .in("aluno_id", ids)
    .lte("atualizado_em", corte)
    .order("atualizado_em", { ascending: false })
    .limit(30);

  const pendentes = (
    (reflexoes || []) as {
      aluno_id: string;
      dia_ano: number;
      texto: string;
      atualizado_em: string;
    }[]
  ).filter(
    (r) =>
      (r.texto || "").trim() !== "" &&
      novo("devocional", `${r.aluno_id}:${r.dia_ano}`, r.atualizado_em),
  );

  const dias = [...new Set(pendentes.map((r) => r.dia_ano))];
  const titulosDia = new Map<number, string>();
  if (dias.length > 0) {
    const { data: devs } = await db
      .from("devocional_anual")
      .select("dia_ano, titulo")
      .in("dia_ano", dias);
    for (const d of (devs || []) as { dia_ano: number; titulo: string | null }[]) {
      if (d.titulo) titulosDia.set(d.dia_ano, d.titulo);
    }
  }

  for (const r of pendentes) {
    if (avisos.length >= limite) break;
    const quem = nomePorId.get(r.aluno_id) || "Discípulo";
    const titulo = titulosDia.get(r.dia_ano);
    const partes = [
      `🕊️ *${quem} respondeu o devocional* — dia ${r.dia_ano}`,
      titulo ? `_${titulo}_` : "",
      "",
      cortar(r.texto, RESPOSTA_NO_AVISO),
    ].filter((l, i) => l !== "" || i > 0);
    avisos.push({
      origem: "devocional",
      chave: `${r.aluno_id}:${r.dia_ano}`,
      referencia: r.atualizado_em,
      anterior: avisado.get(`devocional:${r.aluno_id}:${r.dia_ano}`) || null,
      grupo: `devocional:${r.aluno_id}:${r.dia_ano}`,
      mensagem: cortar(partes.join("\n"), LIMITE_TEXTO),
    });
  }

  const mensagens = avisos.filter((a) => a.mensagem !== "");
  if (dry) {
    return NextResponse.json({
      ok: true,
      dry: true,
      janela,
      corte,
      avisos: mensagens.length,
      mensagens: mensagens.map((a) => a.mensagem),
    });
  }
  if (avisos.length === 0) {
    return NextResponse.json({ ok: true, avisos: 0, janela });
  }

  const para = await destino(db);
  if (!para) {
    return NextResponse.json(
      {
        ok: false,
        erro: "sem destino: configure AVISO_RESPOSTAS_DESTINO ou o telefone do admin",
      },
      { status: 500 },
    );
  }

  // Reserva ANTES de enviar (mesmo padrão do devocional do grupo): se o
  // envio falhar, desfaz a reserva para a próxima rodada tentar de novo.
  const { error: erroReserva } = await db.from("avisos_resposta").upsert(
    avisos.map((a) => ({
      origem: a.origem,
      chave: a.chave,
      referencia: a.referencia,
      enviado_em: new Date().toISOString(),
    })),
    { onConflict: "origem,chave" },
  );
  if (erroReserva) {
    return NextResponse.json({ ok: false, erro: erroReserva.message }, { status: 500 });
  }

  let enviados = 0;
  const falhas: string[] = [];
  for (const aviso of mensagens) {
    const erro = await enviarTexto(para, aviso.mensagem);
    if (erro) {
      falhas.push(erro);
      // Desfaz só o que não saiu — a mensagem inteira, incluindo as outras
      // respostas do mesmo capítulo, que iam no mesmo texto.
      for (const a of avisos.filter((x) => x.grupo === aviso.grupo)) {
        if (a.anterior) {
          await db
            .from("avisos_resposta")
            .update({ referencia: a.anterior })
            .eq("origem", a.origem)
            .eq("chave", a.chave);
        } else {
          await db
            .from("avisos_resposta")
            .delete()
            .eq("origem", a.origem)
            .eq("chave", a.chave);
        }
      }
      continue;
    }
    enviados++;
  }

  return NextResponse.json({
    ok: falhas.length === 0,
    janela,
    enviados,
    falhas,
    horario: new Date().toLocaleString("pt-BR", { timeZone: TZ }),
  });
}
