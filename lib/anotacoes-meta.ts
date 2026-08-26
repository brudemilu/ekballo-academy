// =============================================================
// EKBALLO ACADEMY · Caderno de anotações — tipos, paleta e exportação
//
// Isomorfo de propósito: é importado tanto pelas páginas server quanto pelo
// editor ("use client"). Nada aqui pode tocar Supabase/Node — o acesso a dados
// mora em lib/anotacoes.ts.
// =============================================================

export type CategoriaAnotacao =
  | "aula"
  | "trabalho"
  | "ideia"
  | "estudo"
  | "sermao"
  | "oracao"
  | "outro";

export type CorAnotacao = "areia" | "terracota" | "oliva" | "azul" | "rosa" | "roxo";

export type Anotacao = {
  id: string;
  aluno_id: string;
  titulo: string;
  conteudo_html: string;
  conteudo_texto: string;
  categoria: CategoriaAnotacao;
  cor: CorAnotacao;
  tags: string[];
  curso_id: string | null;
  aula_id: string | null;
  fixada: boolean;
  arquivada: boolean;
  criado_em: string;
  atualizado_em: string;
};

// Anotação já enriquecida com o nome do livro/mesa de origem (para o card).
export type AnotacaoRich = Anotacao & {
  curso_titulo?: string | null;
  curso_slug?: string | null;
  aula_titulo?: string | null;
};

export const CATEGORIAS: {
  chave: CategoriaAnotacao;
  rotulo: string;
  emoji: string;
  descricao: string;
}[] = [
  { chave: "aula", rotulo: "Aula", emoji: "📖", descricao: "Anotação de uma mesa, aula ou culto" },
  { chave: "trabalho", rotulo: "Trabalho", emoji: "📝", descricao: "Tarefa, projeto, entrega" },
  { chave: "ideia", rotulo: "Ideia", emoji: "💡", descricao: "Insight solto que não pode se perder" },
  { chave: "estudo", rotulo: "Estudo", emoji: "🔎", descricao: "Pesquisa, exegese, leitura" },
  { chave: "sermao", rotulo: "Pregação", emoji: "🎙️", descricao: "Esboço de mensagem ou devocional" },
  { chave: "oracao", rotulo: "Oração", emoji: "🙏", descricao: "Alvos e respostas de oração" },
  { chave: "outro", rotulo: "Outro", emoji: "🗂️", descricao: "O que não cabe nas outras" },
];

export const CATEGORIA_MAP = new Map(CATEGORIAS.map((c) => [c.chave, c]));

// Hex direto (não classe Tailwind): são cores do caderno, fora da paleta do
// produto, e precisam funcionar também na folha de impressão.
export const CORES: Record<
  CorAnotacao,
  { rotulo: string; acento: string; fundo: string; borda: string }
> = {
  areia: { rotulo: "Areia", acento: "#A9A299", fundo: "#FBFAF8", borda: "#E6E1D9" },
  terracota: { rotulo: "Terracota", acento: "#FF5A2C", fundo: "#FFF6F1", borda: "#FFDECF" },
  oliva: { rotulo: "Oliva", acento: "#2F6B4F", fundo: "#F0F6F2", borda: "#B9D7C6" },
  azul: { rotulo: "Azul", acento: "#2F5DAE", fundo: "#F0F4FC", borda: "#C7D7F5" },
  rosa: { rotulo: "Rosa", acento: "#B03A63", fundo: "#FCF1F5", borda: "#F5C6D8" },
  roxo: { rotulo: "Roxo", acento: "#6C4BB6", fundo: "#F5F1FC", borda: "#D6C7F0" },
};

export const CORES_ORDEM: CorAnotacao[] = [
  "areia", "terracota", "oliva", "azul", "rosa", "roxo",
];

export function ehCategoria(v: unknown): v is CategoriaAnotacao {
  return typeof v === "string" && CATEGORIA_MAP.has(v as CategoriaAnotacao);
}

export function ehCor(v: unknown): v is CorAnotacao {
  return typeof v === "string" && v in CORES;
}

/** Título que aparece no card quando o discípulo não deu nome à anotação. */
export function tituloExibido(a: { titulo: string; conteudo_texto: string }): string {
  const t = a.titulo.trim();
  if (t) return t;
  const primeiraLinha = a.conteudo_texto.split("\n").find((l) => l.trim());
  if (primeiraLinha) {
    const corte = primeiraLinha.trim().slice(0, 60);
    return corte.length < primeiraLinha.trim().length ? corte + "…" : corte;
  }
  return "Sem título";
}

/** Tags: minúsculas, sem duplicata, sem "#", no máximo 12. */
export function normalizarTags(bruto: string[] | string): string[] {
  const lista = Array.isArray(bruto) ? bruto : bruto.split(/[,\n]/);
  const vistas = new Set<string>();
  const saida: string[] = [];
  for (const t of lista) {
    const limpo = String(t).replace(/^#+/, "").trim().toLowerCase().slice(0, 32);
    if (!limpo || vistas.has(limpo)) continue;
    vistas.add(limpo);
    saida.push(limpo);
    if (saida.length >= 12) break;
  }
  return saida;
}

// -------- Datas --------

const FUSO = "America/Sao_Paulo";

export function dataLonga(iso: string): string {
  try {
    return new Intl.DateTimeFormat("pt-BR", {
      timeZone: FUSO,
      day: "numeric",
      month: "long",
      year: "numeric",
    }).format(new Date(iso));
  } catch {
    return "";
  }
}

export function dataHora(iso: string): string {
  try {
    return new Intl.DateTimeFormat("pt-BR", {
      timeZone: FUSO,
      day: "2-digit",
      month: "2-digit",
      year: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    }).format(new Date(iso));
  } catch {
    return "";
  }
}

/** "agora há pouco", "há 3 h", "ontem", "12 de julho" — carimbo do card. */
export function tempoRelativo(iso: string): string {
  const t = Date.parse(iso);
  if (Number.isNaN(t)) return "";
  const diff = Date.now() - t;
  const min = Math.floor(diff / 60000);
  if (min < 1) return "agora há pouco";
  if (min < 60) return `há ${min} min`;
  const horas = Math.floor(min / 60);
  if (horas < 24) return `há ${horas} h`;
  const dias = Math.floor(horas / 24);
  if (dias === 1) return "ontem";
  if (dias < 7) return `há ${dias} dias`;
  return dataLonga(iso);
}

// -------- Exportação --------

const ENTIDADES: [RegExp, string][] = [
  [/&nbsp;/g, " "],
  [/&mdash;/g, "—"],
  [/&ndash;/g, "–"],
  [/&hellip;/g, "…"],
  [/&ldquo;/g, "“"],
  [/&rdquo;/g, "”"],
  [/&lsquo;/g, "‘"],
  [/&rsquo;/g, "’"],
  [/&quot;/g, '"'],
  [/&#39;|&apos;/g, "'"],
  [/&lt;/g, "<"],
  [/&gt;/g, ">"],
  [/&amp;/g, "&"], // por último: senão re-decodifica o que veio escapado
];

export function decodificarEntidades(txt: string): string {
  let s = txt
    .replace(/&#(\d+);/g, (_, n) => String.fromCodePoint(Number(n)))
    .replace(/&#x([0-9a-f]+);/gi, (_, n) => String.fromCodePoint(parseInt(n, 16)));
  for (const [re, ch] of ENTIDADES) s = s.replace(re, ch);
  return s;
}

/**
 * HTML da anotação → Markdown. O HTML de entrada é sempre o nosso (já passou
 * pelo sanitizador), então dá pra converter por substituição sequencial sem
 * montar uma árvore.
 */
export function htmlParaMarkdown(html: string): string {
  if (!html) return "";
  let md = html;

  // Listas: numera <ol> na mão (o índice se perde no replace global).
  md = md.replace(/<ol[^>]*>([\s\S]*?)<\/ol>/gi, (_, interior: string) => {
    let n = 0;
    const itens = interior.replace(/<li[^>]*>([\s\S]*?)<\/li>/gi, (__, item: string) => {
      n += 1;
      return `${n}. ${item.trim()}\n`;
    });
    return "\n" + itens + "\n";
  });

  md = md.replace(/<ul[^>]*>([\s\S]*?)<\/ul>/gi, (_, interior: string) => {
    const itens = interior.replace(
      /<li([^>]*)>([\s\S]*?)<\/li>/gi,
      (__, attrs: string, item: string) => {
        // Checklist vira "- [x]" / "- [ ]" (padrão GitHub/Obsidian).
        const tarefa = /data-tarefa="([01])"/.exec(attrs);
        const marca = tarefa ? (tarefa[1] === "1" ? "- [x] " : "- [ ] ") : "- ";
        return marca + item.trim() + "\n";
      },
    );
    return "\n" + itens + "\n";
  });

  md = md
    .replace(/<h2[^>]*>([\s\S]*?)<\/h2>/gi, "\n## $1\n")
    .replace(/<h3[^>]*>([\s\S]*?)<\/h3>/gi, "\n### $1\n")
    .replace(/<h4[^>]*>([\s\S]*?)<\/h4>/gi, "\n#### $1\n")
    .replace(/<blockquote[^>]*>([\s\S]*?)<\/blockquote>/gi, (_, txt: string) =>
      "\n" + txt.trim().split("\n").map((l) => "> " + l.trim()).join("\n") + "\n",
    )
    .replace(/<pre[^>]*>([\s\S]*?)<\/pre>/gi, "\n```\n$1\n```\n")
    .replace(/<code[^>]*>([\s\S]*?)<\/code>/gi, "`$1`")
    .replace(/<a[^>]*href="([^"]*)"[^>]*>([\s\S]*?)<\/a>/gi, "[$2]($1)")
    .replace(/<(strong|b)[^>]*>([\s\S]*?)<\/\1>/gi, "**$2**")
    .replace(/<(em|i)[^>]*>([\s\S]*?)<\/\1>/gi, "*$2*")
    .replace(/<(s|strike|del)[^>]*>([\s\S]*?)<\/\1>/gi, "~~$2~~")
    .replace(/<mark[^>]*>([\s\S]*?)<\/mark>/gi, "==$1==")
    .replace(/<u[^>]*>([\s\S]*?)<\/u>/gi, "$1")
    .replace(/<hr[^>]*\/?>/gi, "\n---\n")
    .replace(/<br\s*\/?>/gi, "  \n")
    .replace(/<\/p>/gi, "\n\n")
    .replace(/<\/(tr|td|th|table|thead|tbody|div|li|ul|ol)>/gi, "\n")
    .replace(/<[^>]+>/g, "");

  return decodificarEntidades(md)
    .replace(/[ \t]+$/gm, "")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}

/** Cabeçalho YAML + corpo — o formato que o Obsidian/Notion entendem. */
export function anotacaoParaMarkdown(a: AnotacaoRich): string {
  const cat = CATEGORIA_MAP.get(a.categoria)?.rotulo ?? a.categoria;
  const linhas = [
    "---",
    `titulo: ${JSON.stringify(tituloExibido(a))}`,
    `categoria: ${cat}`,
    a.tags.length ? `tags: [${a.tags.join(", ")}]` : null,
    a.curso_titulo ? `livro: ${JSON.stringify(a.curso_titulo)}` : null,
    a.aula_titulo ? `mesa: ${JSON.stringify(a.aula_titulo)}` : null,
    `criado_em: ${a.criado_em}`,
    `atualizado_em: ${a.atualizado_em}`,
    "---",
    "",
    `# ${tituloExibido(a)}`,
    "",
    htmlParaMarkdown(a.conteudo_html),
  ];
  return linhas.filter((l) => l !== null).join("\n");
}

/** Nome de arquivo seguro a partir do título ("Mesa 3 — Ego" → "mesa-3-ego"). */
export function nomeArquivo(titulo: string, extensao: string): string {
  const base = titulo
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-zA-Z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .toLowerCase()
    .slice(0, 60) || "anotacao";
  return `${base}.${extensao}`;
}
