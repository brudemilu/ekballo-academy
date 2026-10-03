/**
 * Regras puras do calendário do copiloto de conteúdo (sem banco, sem rede):
 * em que dia cada item cai, como a semana é montada e o que uma ideia
 * precisa ter para ser gravada. Ficam aqui para serem testadas sem browser
 * (testes/conteudo-calendario.test.ts).
 *
 * Datas de calendário são strings "YYYY-MM-DD" no fuso de São Paulo. Dia é
 * dia de parede, não instante: um post às 22h de domingo em SP é domingo,
 * mesmo já sendo segunda em UTC.
 */

export const TZ_CALENDARIO = "America/Sao_Paulo";

export const FORMATOS_IDEIA = ["carrossel", "reel", "story", "roteiro"] as const;
export type FormatoIdeiaCal = (typeof FORMATOS_IDEIA)[number];

const RE_DIA = /^\d{4}-\d{2}-\d{2}$/;

/** "YYYY-MM-DD" do instante dado, no fuso de São Paulo. */
export function diaSP(instante: Date | string): string {
  const d = typeof instante === "string" ? new Date(instante) : instante;
  return d.toLocaleDateString("en-CA", { timeZone: TZ_CALENDARIO });
}

/** Soma dias a uma data de calendário (aritmética em UTC: sem horário de verão). */
export function somarDias(dia: string, n: number): string {
  const [a, m, d] = dia.split("-").map(Number);
  const x = new Date(Date.UTC(a, m - 1, d + n));
  return x.toISOString().slice(0, 10);
}

/** Segunda-feira da semana que contém `dia` (a semana do calendário vai de seg a dom). */
export function inicioDaSemana(dia: string): string {
  const [a, m, d] = dia.split("-").map(Number);
  const dow = new Date(Date.UTC(a, m - 1, d)).getUTCDay(); // 0 = domingo
  return somarDias(dia, dow === 0 ? -6 : 1 - dow);
}

/** Os 7 dias (seg → dom) da semana que começa em `segunda`. */
export function diasDaSemana(segunda: string): string[] {
  return Array.from({ length: 7 }, (_, i) => somarDias(segunda, i));
}

/**
 * Em que dia um post aparece no calendário. Publicado vale pela data em que
 * saiu; agendado (ou com erro ao publicar) pela data marcada. Rascunho não
 * tem dia: vai para a coluna "Sem data".
 */
export function diaDoPost(p: {
  status: string;
  agendado_para?: string | null;
  publicado_em?: string | null;
}): string | null {
  if (p.status === "publicado") {
    const quando = p.publicado_em || p.agendado_para;
    return quando ? diaSP(quando) : null;
  }
  if ((p.status === "agendado" || p.status === "erro") && p.agendado_para) {
    return diaSP(p.agendado_para);
  }
  return null;
}

/**
 * A ideia aparece no calendário? Sem post ligado, sempre. Ligada a um post,
 * depende do post: enquanto ele é rascunho (não tem dia), a ideia segura o
 * lugar dele no dia planejado; quando ele é agendado ou publicado, some — o
 * post passa a ocupar o próprio dia e os dois seriam a mesma coisa em dobro.
 */
export function ideiaVisivel(
  ideia: { carrossel_id?: string | null },
  posts: {
    id: string;
    status: string;
    agendado_para?: string | null;
    publicado_em?: string | null;
  }[],
): boolean {
  if (!ideia.carrossel_id) return true;
  const post = posts.find((p) => p.id === ideia.carrossel_id);
  return !post || diaDoPost(post) === null;
}

export type IdeiaValidada = {
  titulo?: string;
  nota?: string;
  formato?: FormatoIdeiaCal;
  data_planejada?: string | null;
};

/**
 * Valida o corpo vindo do cliente. `parcial` = PATCH (só o que veio é
 * conferido); sem ele o título é obrigatório. Devolve a mensagem de erro em
 * português, pronta para a tela, ou os campos limpos.
 */
export function validarIdeia(
  corpo: unknown,
  parcial = false,
): { ok: true; valor: IdeiaValidada } | { ok: false; erro: string } {
  if (!corpo || typeof corpo !== "object")
    return { ok: false, erro: "Corpo inválido." };
  const c = corpo as Record<string, unknown>;
  const valor: IdeiaValidada = {};

  if (c.titulo !== undefined || !parcial) {
    const t = typeof c.titulo === "string" ? c.titulo.trim() : "";
    if (!t) return { ok: false, erro: "Dê um título para a ideia." };
    if (t.length > 200)
      return { ok: false, erro: "Título longo demais (máximo 200 caracteres)." };
    valor.titulo = t;
  }

  if (c.nota !== undefined) {
    if (typeof c.nota !== "string") return { ok: false, erro: "Nota inválida." };
    if (c.nota.length > 5000)
      return { ok: false, erro: "Nota longa demais (máximo 5.000 caracteres)." };
    valor.nota = c.nota.trim();
  }

  if (c.formato !== undefined) {
    if (!FORMATOS_IDEIA.includes(c.formato as FormatoIdeiaCal)) {
      return { ok: false, erro: "Formato inválido." };
    }
    valor.formato = c.formato as FormatoIdeiaCal;
  }

  if (c.data_planejada !== undefined) {
    if (c.data_planejada === null || c.data_planejada === "") {
      valor.data_planejada = null;
    } else if (typeof c.data_planejada === "string" && RE_DIA.test(c.data_planejada)) {
      // confere que a data existe (rejeita 2026-02-31)
      if (somarDias(c.data_planejada, 0) !== c.data_planejada) {
        return { ok: false, erro: "Data inválida." };
      }
      valor.data_planejada = c.data_planejada;
    } else {
      return { ok: false, erro: "Data inválida." };
    }
  }

  return { ok: true, valor };
}
