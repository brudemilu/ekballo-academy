// =============================================================
// EKBALLO ACADEMY · Sanitizador de HTML do caderno de anotações
//
// O editor de anotações é um contentEditable: o que chega no servidor é HTML
// montado pelo navegador — e, quando o discípulo cola de um site, pode vir
// qualquer coisa junto (script, iframe, onclick, javascript: em href).
// Como a anotação é depois renderizada com dangerouslySetInnerHTML, gravar
// HTML cru seria XSS armazenado — contra o próprio autor, que é quem a lê.
//
// A estratégia é RECONSTRUIR, não "remover o que parece perigoso": o texto é
// tokenizado e só volta pra saída aquilo que está explicitamente na
// whitelist. Tag desconhecida é desembrulhada (perde a tag, mantém o texto);
// tag perigosa é descartada COM o conteúdo; atributo fora da lista some.
// =============================================================

// Tags que sobrevivem. Tudo que o editor produz está aqui.
const TAGS_PERMITIDAS = new Set([
  "p", "br", "hr",
  "strong", "b", "em", "i", "u", "s", "strike", "del", "mark", "sub", "sup",
  "h2", "h3", "h4",
  "blockquote", "pre", "code",
  "ul", "ol", "li",
  "table", "thead", "tbody", "tr", "th", "td",
  "span", // só sobrevive quando é marca-texto (vira <mark>); senão desembrulha
  "a",
  "img",  // apenas anexos da própria pessoa — ver `srcDeAnexo` abaixo
]);

// Tags cujo CONTEÚDO também precisa morrer (não basta tirar a tag).
const TAGS_LETAIS = new Set([
  "script", "style", "iframe", "object", "embed", "noscript",
  "template", "title", "textarea", "svg", "math", "link", "meta", "base",
]);

// Tags vazias (sem fechamento).
const TAGS_VAZIAS = new Set(["br", "hr", "img"]);

// Imagem só é aceita quando aponta para o endereço interno do anexo
// (/api/anotacoes/anexos/{id}/arquivo). Assim não entra imagem de fora —
// que vazaria o IP de quem lê para um servidor alheio — nem data: URI, que
// engordaria a anotação em megabytes.
const RE_SRC_ANEXO = /^\/api\/anotacoes\/anexos\/[0-9a-zA-Z-]{1,64}\/arquivo$/;

function srcDeAnexo(src: string): string | null {
  const limpo = src.trim();
  return RE_SRC_ANEXO.test(limpo) ? limpo : null;
}

// Blocos: usados pra saber onde quebrar linha ao converter em texto puro.
const TAGS_BLOCO = new Set([
  "p", "h2", "h3", "h4", "blockquote", "li", "tr", "pre", "hr", "div", "br",
]);

// Marca-texto: o editor usa `hiliteColor` (que o navegador materializa como
// <span style="background-color: …">). Aqui a cor é casada com a paleta e o
// span vira <mark data-cor="…"> — assim o CSS controla a aparência e nenhum
// `style` cru entra no banco.
export const CORES_MARCADOR: Record<string, string> = {
  amarelo: "#FEF08A",
  verde: "#BBF7D0",
  rosa: "#FBCFE8",
  azul: "#BAE6FD",
  laranja: "#FFDECF",
};

const HEX_PARA_COR = new Map(
  Object.entries(CORES_MARCADOR).map(([nome, hex]) => [hex.toLowerCase(), nome]),
);
// A mesma cor em rgb() — o Chrome normaliza o style pra rgb ao serializar.
for (const [nome, hex] of Object.entries(CORES_MARCADOR)) {
  const r = parseInt(hex.slice(1, 3), 16);
  const g = parseInt(hex.slice(3, 5), 16);
  const b = parseInt(hex.slice(5, 7), 16);
  HEX_PARA_COR.set(`rgb(${r}, ${g}, ${b})`, nome);
  HEX_PARA_COR.set(`rgb(${r},${g},${b})`, nome);
}

const ALINHAMENTOS = new Set(["left", "center", "right", "justify"]);

// Entrelinha por bloco, guardada como número inteiro (18 = 1,8). Não é style
// inline (que não entra aqui por segurança): o CSS traduz o atributo.
const ENTRELINHA_MIN = 12;
const ENTRELINHA_MAX = 26;

// Escapa texto preservando entidades que já estavam bem-formadas
// (senão um "&nbsp;" colado viraria "&amp;nbsp;" na tela).
function escaparTexto(txt: string): string {
  return txt
    .replace(/&(?!#\d+;|#x[0-9a-fA-F]+;|[a-zA-Z][a-zA-Z0-9]{1,10};)/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

function escaparAtributo(valor: string): string {
  return escaparTexto(valor).replace(/"/g, "&quot;");
}

// href seguro: http(s), mailto, tel e caminhos internos. Barra javascript:,
// data: e vbscript: — inclusive escritos com espaço/quebra no meio
// ("java\nscript:"), truque clássico pra driblar filtro ingênuo.
function hrefSeguro(bruto: string): string | null {
  const v = bruto.trim().replace(/[\u0000-\u0020]/g, "");
  if (!v) return null;
  if (/^(https?:|mailto:|tel:)/i.test(v)) return v;
  if (/^[/#]/.test(v)) return v;
  // Sem esquema explícito e parecendo domínio → assume https
  if (/^[\w.-]+\.[a-z]{2,}(\/|$)/i.test(v)) return `https://${v}`;
  return null;
}

type Atributos = Record<string, string>;

function lerAtributos(bruto: string): Atributos {
  const attrs: Atributos = {};
  const re = /([a-zA-Z_:][-\w:.]*)\s*(?:=\s*(?:"([^"]*)"|'([^']*)'|([^\s"'>`]+)))?/g;
  let m: RegExpExecArray | null;
  while ((m = re.exec(bruto))) {
    const nome = m[1].toLowerCase();
    attrs[nome] = m[2] ?? m[3] ?? m[4] ?? "";
  }
  return attrs;
}

// Devolve os atributos que a tag pode manter, já serializados.
function atributosPermitidos(tag: string, attrs: Atributos): string {
  const saida: string[] = [];

  const alinhar = (attrs["data-align"] || "").toLowerCase();
  if (ALINHAMENTOS.has(alinhar) && TAGS_BLOCO.has(tag)) {
    saida.push(`data-align="${alinhar}"`);
  }

  const entre = parseInt(attrs["data-entrelinha"] || "", 10);
  if (
    TAGS_BLOCO.has(tag) &&
    Number.isFinite(entre) &&
    entre >= ENTRELINHA_MIN &&
    entre <= ENTRELINHA_MAX
  ) {
    saida.push(`data-entrelinha="${entre}"`);
  }

  if (tag === "a") {
    const href = hrefSeguro(attrs.href || "");
    if (!href) return ""; // link sem destino seguro vira texto simples
    saida.push(`href="${escaparAtributo(href)}"`);
    // Abrir fora não pode dar acesso ao window da plataforma.
    saida.push('target="_blank"', 'rel="noopener noreferrer nofollow"');
  }

  if (tag === "img") {
    const src = srcDeAnexo(attrs.src || "");
    if (!src) return ""; // imagem de fora: descartada junto com a tag
    saida.push(`src="${escaparAtributo(src)}"`);
    saida.push(`alt="${escaparAtributo((attrs.alt || "Anexo").slice(0, 200))}"`);
    saida.push('loading="lazy"');
  }

  if (tag === "mark") {
    const cor = (attrs["data-cor"] || "").toLowerCase();
    saida.push(`data-cor="${CORES_MARCADOR[cor] ? cor : "amarelo"}"`);
  }

  if (tag === "li") {
    // Checklist: data-tarefa="0" (aberta) / "1" (feita).
    const t = attrs["data-tarefa"];
    if (t === "0" || t === "1") saida.push(`data-tarefa="${t}"`);
  }

  if (tag === "ul" && attrs["data-lista"] === "tarefas") {
    saida.push('data-lista="tarefas"');
  }

  if (tag === "td" || tag === "th") {
    for (const attr of ["colspan", "rowspan"]) {
      const n = parseInt(attrs[attr] || "", 10);
      if (Number.isFinite(n) && n > 1 && n <= 50) saida.push(`${attr}="${n}"`);
    }
  }

  if (tag === "ol") {
    const n = parseInt(attrs.start || "", 10);
    if (Number.isFinite(n) && n > 1 && n <= 9999) saida.push(`start="${n}"`);
  }

  return saida.length ? " " + saida.join(" ") : "";
}

// span[style=background-color] → <mark data-cor>. Qualquer outro span some.
function spanViraMark(attrs: Atributos): string | null {
  const style = (attrs.style || "").toLowerCase();
  const m = style.match(/background(?:-color)?\s*:\s*([^;]+)/);
  if (!m) return null;
  return HEX_PARA_COR.get(m[1].trim()) ?? null;
}

/**
 * Devolve HTML seguro para gravar e renderizar.
 * `maxBytes` corta conteúdo absurdo (colagem de página inteira) antes de
 * qualquer processamento — o campo no banco é text, mas a página precisa abrir.
 */
export function sanitizarHtml(bruto: string, maxBytes = 400_000): string {
  if (!bruto) return "";
  const entrada = bruto.length > maxBytes ? bruto.slice(0, maxBytes) : bruto;

  let saida = "";
  const pilha: string[] = []; // tags abertas que foram mantidas
  let i = 0;

  while (i < entrada.length) {
    const abre = entrada.indexOf("<", i);
    if (abre === -1) {
      saida += escaparTexto(entrada.slice(i));
      break;
    }
    if (abre > i) saida += escaparTexto(entrada.slice(i, abre));

    // Comentário / doctype / CDATA: descarta inteiro.
    if (entrada.startsWith("<!--", abre)) {
      const fim = entrada.indexOf("-->", abre);
      i = fim === -1 ? entrada.length : fim + 3;
      continue;
    }
    if (entrada.startsWith("<!", abre) || entrada.startsWith("<?", abre)) {
      const fim = entrada.indexOf(">", abre);
      i = fim === -1 ? entrada.length : fim + 1;
      continue;
    }

    const fecha = entrada.indexOf(">", abre);
    if (fecha === -1) {
      // "<" solto no meio do texto — trata como texto mesmo.
      saida += escaparTexto(entrada.slice(abre));
      break;
    }

    const interior = entrada.slice(abre + 1, fecha);
    const ehFechamento = interior.startsWith("/");
    const corpo = ehFechamento ? interior.slice(1) : interior;
    const nomeMatch = corpo.match(/^([a-zA-Z][\w:-]*)/);
    if (!nomeMatch) {
      i = fecha + 1;
      continue;
    }
    let tag = nomeMatch[1].toLowerCase();
    // Colagem do Word/Google Docs vem com namespace (<o:p>, <w:br>).
    if (tag.includes(":")) tag = tag.split(":").pop() as string;

    // Tag letal: pula o bloco inteiro, conteúdo junto.
    if (TAGS_LETAIS.has(tag)) {
      if (ehFechamento) {
        i = fecha + 1;
        continue;
      }
      const reFim = new RegExp(`</\\s*${tag}\\b[^>]*>`, "i");
      const resto = entrada.slice(fecha + 1);
      const achou = resto.match(reFim);
      i = achou?.index === undefined
        ? entrada.length
        : fecha + 1 + achou.index + achou[0].length;
      continue;
    }

    if (ehFechamento) {
      if (pilha.length && pilha[pilha.length - 1] === tag) {
        pilha.pop();
        saida += `</${tag}>`;
      } else if (pilha.length && pilha[pilha.length - 1] === "__drop__") {
        pilha.pop(); // fecha uma tag que tinha sido desembrulhada
      }
      i = fecha + 1;
      continue;
    }

    const attrs = lerAtributos(corpo.slice(nomeMatch[1].length));
    const autoFechada = corpo.trimEnd().endsWith("/");

    // <span> só existe como marca-texto; o resto desembrulha.
    if (tag === "span") {
      const cor = spanViraMark(attrs);
      if (cor) {
        pilha.push("mark");
        saida += `<mark data-cor="${cor}">`;
      } else if (!autoFechada) {
        pilha.push("__drop__");
      }
      i = fecha + 1;
      continue;
    }

    if (!TAGS_PERMITIDAS.has(tag)) {
      // Desembrulha: o conteúdo continua, a tag some. Empilha um marcador
      // pra que o </div> correspondente também seja engolido.
      if (!autoFechada) pilha.push("__drop__");
      i = fecha + 1;
      continue;
    }

    const attrsOk = atributosPermitidos(tag, attrs);
    if (tag === "img" && !attrsOk) {
      i = fecha + 1; // imagem sem origem confiável: descartada
      continue;
    }
    if (tag === "a" && !attrsOk) {
      if (!autoFechada) pilha.push("__drop__"); // link inseguro: fica só o texto
      i = fecha + 1;
      continue;
    }

    if (TAGS_VAZIAS.has(tag)) {
      saida += `<${tag}${attrsOk}>`;
    } else if (autoFechada) {
      saida += `<${tag}${attrsOk}></${tag}>`;
    } else {
      pilha.push(tag);
      saida += `<${tag}${attrsOk}>`;
    }
    i = fecha + 1;
  }

  // Fecha o que ficou aberto (HTML truncado pelo maxBytes, por exemplo).
  while (pilha.length) {
    const tag = pilha.pop() as string;
    if (tag !== "__drop__") saida += `</${tag}>`;
  }

  return saida.trim();
}

const ENTIDADES: Record<string, string> = {
  "&nbsp;": " ",
  "&amp;": "&",
  "&lt;": "<",
  "&gt;": ">",
  "&quot;": '"',
  "&#39;": "'",
  "&apos;": "'",
  "&mdash;": "—",
  "&ndash;": "–",
  "&hellip;": "…",
  "&ldquo;": "“",
  "&rdquo;": "”",
  "&lsquo;": "‘",
  "&rsquo;": "’",
};

/** HTML → texto puro (busca, prévia do card, export .txt). */
export function htmlParaTexto(html: string): string {
  if (!html) return "";
  let txt = html;
  // Marca as quebras antes de arrancar as tags.
  txt = txt.replace(/<\s*(br|hr)\s*\/?\s*>/gi, "\n");
  txt = txt.replace(
    new RegExp(`</\\s*(${[...TAGS_BLOCO].join("|")})\\s*>`, "gi"),
    "\n",
  );
  txt = txt.replace(/<[^>]*>/g, "");
  txt = txt.replace(/&#(\d+);/g, (_, n) => String.fromCodePoint(Number(n)));
  txt = txt.replace(/&#x([0-9a-f]+);/gi, (_, n) => String.fromCodePoint(parseInt(n, 16)));
  for (const [ent, ch] of Object.entries(ENTIDADES)) {
    txt = txt.split(ent).join(ch);
  }
  return txt
    .replace(/\u00a0/g, " ")
    .replace(/[ \t]+\n/g, "\n")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}

/** Primeiras `n` letras do texto, cortando em espaço (prévia do card). */
export function resumir(texto: string, n = 220): string {
  const limpo = texto.replace(/\s+/g, " ").trim();
  if (limpo.length <= n) return limpo;
  const corte = limpo.slice(0, n);
  const espaco = corte.lastIndexOf(" ");
  return (espaco > n * 0.6 ? corte.slice(0, espaco) : corte) + "…";
}

/** Contagem de palavras — mostrada no rodapé do editor. */
export function contarPalavras(texto: string): number {
  const limpo = texto.trim();
  if (!limpo) return 0;
  return limpo.split(/\s+/).length;
}
