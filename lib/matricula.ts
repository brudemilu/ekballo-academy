// =============================================================
// EKBALLO ACADEMY · Matrícula (regra compartilhada)
//
// Matricular acontece por dois caminhos — a ficha do discípulo
// (uma temática por vez) e a página da temática (vários discípulos
// de uma vez). O que é delicado, porém, é o MESMO nos dois: só
// avisa quem entrou agora, nunca avisa de novo quem já estava, e
// nunca avisa em temática aberta a todos.
//
// Essa regra mora aqui para existir uma vez só. Duplicada em duas
// rotas, ela sobrevive à primeira mudança e morre na segunda.
// =============================================================
import type { SupabaseClient } from "@supabase/supabase-js";
import { enviarPush } from "./push";
import { siteBase } from "./site-url";

export type ResumoMatricula = {
  /** Quem entrou agora (não estava matriculado antes). */
  entraram: string[];
  /** Quem já estava — não recebe aviso de novo. */
  jaEstavam: string[];
  /** Temática com interface própria (Bíblia, devocional): aberta a todos. */
  cursoAberto: boolean;
  push: { enviados: number; erros: number; removidas: number } | null;
  whatsapp: { enfileirados: number; semTelefone: number; erros: number };
};

type Opcoes = {
  cursoId: string;
  alunoIds: string[];
  /** Falso faz a carga em silêncio: sem push, sem WhatsApp. */
  notificar: boolean;
  /**
   * Origem da requisição, só como último recurso para o link do WhatsApp.
   * O endereço que vale é o de `siteBase()` — ver `baseParaLink()`.
   */
  origin: string;
};

/**
 * Endereço público para o link que o discípulo abre no celular.
 *
 * Atrás do Traefik, o `origin` da requisição é o bind interno do container
 * (`https://0.0.0.0:3000`) — e o convite saía com esse endereço, que não abre
 * em lugar nenhum, desde a migração pro Contabo (issue #183). Quem manda é
 * `NEXT_PUBLIC_SITE_URL`, via `siteBase()`; o origin só entra quando dá para
 * alcançá-lo de fora, o que em dev local (`http://localhost:3000`) é verdade.
 */
export function baseParaLink(origin: string): string {
  const configurada = siteBase();
  if (configurada) return configurada;
  const host = (() => {
    try {
      return new URL(origin).hostname;
    } catch {
      return "";
    }
  })();
  // Bind interno não é endereço: melhor mensagem sem link do que link morto.
  if (!host || host === "0.0.0.0" || host === "::" || host === "[::]") return "";
  return origin.replace(/\/+$/, "");
}

export async function matricularAlunos(
  admin: SupabaseClient,
  { cursoId, alunoIds, notificar, origin }: Opcoes,
): Promise<ResumoMatricula> {
  const vazio: ResumoMatricula = {
    entraram: [],
    jaEstavam: [],
    cursoAberto: false,
    push: null,
    whatsapp: { enfileirados: 0, semTelefone: 0, erros: 0 },
  };
  if (alunoIds.length === 0) return vazio;

  // Quem já estava precisa ser lido ANTES do upsert — depois dele,
  // todo mundo parece matriculado e ninguém receberia aviso.
  const { data: existentes } = await admin
    .from("matriculas")
    .select("aluno_id")
    .eq("curso_id", cursoId)
    .in("aluno_id", alunoIds);
  const jaEstavam = new Set(
    ((existentes || []) as { aluno_id: string }[]).map((m) => m.aluno_id),
  );
  const entraram = alunoIds.filter((id) => !jaEstavam.has(id));

  const { error } = await admin.from("matriculas").upsert(
    alunoIds.map((aluno_id) => ({ aluno_id, curso_id: cursoId })),
    { onConflict: "aluno_id,curso_id" },
  );
  if (error) throw new Error(error.message);

  const resumo: ResumoMatricula = {
    ...vazio,
    entraram,
    jaEstavam: [...jaEstavam],
  };
  if (entraram.length === 0) return resumo;

  const { data: curso } = await admin
    .from("cursos")
    .select("titulo, slug, external_path")
    .eq("id", cursoId)
    .single();
  const tituloCurso = curso?.titulo || "Temática";
  const url =
    curso?.external_path || (curso?.slug ? `/cursos/${curso.slug}` : "/dashboard");

  // Temática aberta (Bíblia, devocional, planos): todo cadastrado já tem
  // acesso, então avisar seria ruído. Ver regra em lib/destinatarios.ts.
  if (curso?.external_path) return { ...resumo, cursoAberto: true };
  if (!notificar) return resumo;

  const push = await enviarPush(entraram, {
    title: "✨ Temática liberada",
    body: `Você foi matriculado em "${tituloCurso}". Toque pra começar.`,
    url,
    tag: `matricula-${cursoId}`,
  });

  // Sem endereço público não há convite possível: mandar o link interno é pior
  // que não mandar nada — o discípulo recebe algo que não abre e ninguém vê.
  const base = baseParaLink(origin);
  const link = url.startsWith("http") ? url : `${base}${url}`;
  if (!base && !url.startsWith("http")) {
    console.error(
      "matrícula: sem NEXT_PUBLIC_SITE_URL e origin interno — WhatsApp não enfileirado",
      { origin, cursoId },
    );
    return {
      ...resumo,
      push,
      whatsapp: { enfileirados: 0, semTelefone: 0, erros: entraram.length },
    };
  }

  // WhatsApp entra na fila (sai ~1/min via pg_cron). Só quem tem telefone.
  const { data: alunos } = await admin
    .from("profiles")
    .select("id, nome, telefone")
    .in("id", entraram);
  type Perfil = { id: string; nome: string | null; telefone: string | null };
  const fila: { aluno_id: string; telefone: string; corpo: string }[] = [];
  let semTelefone = 0;
  for (const aluno of (alunos || []) as Perfil[]) {
    const digits = (aluno.telefone || "").replace(/\D+/g, "");
    if (digits.length < 10) {
      semTelefone++;
      continue;
    }
    const primeiroNome = (aluno.nome || "").trim().split(/\s+/)[0] || "";
    const saudacao = primeiroNome ? `Olá, ${primeiroNome}!` : "Olá!";
    fila.push({
      aluno_id: aluno.id,
      telefone: digits,
      corpo:
        `${saudacao} 🌱 Você foi liberado(a) na temática *${tituloCurso}* na nossa ` +
        `Mesa de Discipulado. É só entrar e começar no seu ritmo: ${link}. Bons estudos!`,
    });
  }
  // Perfil que nem existe também conta como sem telefone.
  semTelefone += entraram.length - (alunos?.length || 0);

  let erros = 0;
  if (fila.length > 0) {
    const { error: filaErr } = await admin.from("whatsapp_fila").insert(fila);
    if (filaErr) {
      erros = fila.length;
      console.error("falha ao enfileirar whatsapp da matrícula", filaErr);
    }
  }

  return {
    ...resumo,
    push,
    whatsapp: {
      enfileirados: erros ? 0 : fila.length,
      semTelefone,
      erros,
    },
  };
}

export async function desmatricularAlunos(
  admin: SupabaseClient,
  { cursoId, alunoIds }: { cursoId: string; alunoIds: string[] },
): Promise<{ removidos: number }> {
  if (alunoIds.length === 0) return { removidos: 0 };
  const { error } = await admin
    .from("matriculas")
    .delete()
    .eq("curso_id", cursoId)
    .in("aluno_id", alunoIds);
  if (error) throw new Error(error.message);
  return { removidos: alunoIds.length };
}
