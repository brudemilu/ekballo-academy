/**
 * Texto pronto e ajustes no post pelo WhatsApp (issue #239).
 *
 * Duas queixas do Bruno deram origem a isto: ele mandava o texto do post e a
 * IA devolvia outra frase; pedia uma correção e recebia mais uma versão
 * inventada. A regra daqui em diante: o que o pastor escreveu vai para a
 * imagem NA ÍNTEGRA, e um ajuste muda só o que foi pedido.
 *
 * Aqui fica a parte pura — reconhecer um texto pronto, separar a referência,
 * marcar o trecho destacado, entender o pedido de ajuste. Quem fala com a IA
 * e com o banco é lib/whatsapp-instagram-executar.ts. Testado em
 * testes/post-texto-pronto.test.ts.
 */
import {
  MODELOS,
  type ModeloSlide,
  sortearDiferente,
  TEMAS_AUTOMATICOS,
} from "@/lib/instagram-modelos";

/** Como a ideia fica guardada quando é texto pronto: "texto: …". */
export const MARCA_TEXTO = "texto: ";
const RE_MARCA = /^(?:o\s+)?texto\s*[:–—-]\s*/i;

/**
 * Os modelos que mantêm a frase na ordem em que foi escrita. "cartaz" e
 * "bloco" tiram a palavra destacada do lugar — servem para a frase que a IA
 * escreve já pensando neles, não para o texto do pastor.
 */
export const MODELOS_TEXTO_PRONTO: ModeloSlide[] = [
  "cinema",
  "editorial",
  "impacto",
  "recorte",
  "sereno",
  "contraste",
  "carimbo",
  "gravura",
  "quadrinho",
  "caderno",
  "chamada",
  "muro",
];

/** Tira acento e caixa, para comparar. */
function plano(t: string): string {
  return t.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase();
}

const contarPalavras = (t: string) => t.split(/\s+/).filter(Boolean).length;

/** A ideia já veio marcada como texto pronto ("texto: …")? */
export function ehTextoMarcado(ideia: string): boolean {
  return RE_MARCA.test((ideia || "").trim());
}

/**
 * O que o pastor mandou é o TEXTO do post, e não um tema para a IA escrever?
 * Vale para o que foi digitado: aspas, quebra de linha ou uma frase inteira
 * com ponto final. "fé" e "o discipulado à mesa" continuam sendo temas.
 */
export function pareceTextoPronto(ideia: string): boolean {
  const t = (ideia || "").trim();
  if (ehTextoMarcado(t)) return true;
  const palavras = contarPalavras(t);
  if (/["“”«»]/.test(t) || /\n/.test(t)) return palavras >= 4;
  if (palavras >= 5 && /[.!?…]$/.test(t)) return true;
  return palavras >= 14;
}

/** Guarda a ideia como texto pronto (uma vez só). */
export function marcarTextoPronto(ideia: string): string {
  const t = (ideia || "").trim();
  return ehTextoMarcado(t) ? t : `${MARCA_TEXTO}${t}`;
}

// "Hebreus 10:23", "1 Coríntios 13.4-7", "Cântico dos Cânticos 2:4"
const LIVRO_CAP_VERS =
  "(?:[1-3]\\s?)?[A-Za-zÀ-ÿ]+(?:\\s+(?:d[eo]s?\\s+)?[A-Za-zÀ-ÿ]+){0,2}\\s+\\d{1,3}\\s*[:.]\\s*\\d{1,3}(?:\\s*[-–]\\s*\\d{1,3})?";
const RE_LINHA_REF = new RegExp(
  `^(?:[-–—]\\s*\\S.*|(?:livro|autor|autora|fonte|de)\\s*:.*|${LIVRO_CAP_VERS}\\.?)$`,
  "i",
);
const RE_REF_NO_FIM = new RegExp(
  `^([\\s\\S]+[.!?…”"»])\\s+[-–—(]?\\s*(${LIVRO_CAP_VERS})\\)?\\.?$`,
);

/**
 * Separa o texto da linha de autoria: "Livro: …", "— Tozer", "Hebreus 10:23".
 * A referência vai no lugar dela na imagem, pequena, e não no meio da frase.
 */
export function separarReferencia(bruto: string): { texto: string; ref: string } {
  const linhas = (bruto || "")
    .split(/\n+/)
    .map((l) => l.replace(/\s+/g, " ").trim())
    .filter(Boolean);
  if (linhas.length >= 2) {
    const ultima = linhas[linhas.length - 1];
    if (ultima.length <= 80 && RE_LINHA_REF.test(ultima)) {
      return {
        texto: linhas.slice(0, -1).join(" "),
        ref: ultima.replace(/^[-–—]\s*/, "").replace(/\.$/, ""),
      };
    }
  }
  const junto = linhas.join(" ");
  const noFim = junto.match(RE_REF_NO_FIM);
  if (noFim) return { texto: noFim[1].trim(), ref: noFim[2].trim() };
  return { texto: junto, ref: "" };
}

/** Tira as marcas que o desenho interpreta: o texto do pastor não as traz de propósito. */
function semMarcas(t: string): string {
  return t
    .replace(/[{}]/g, "")
    .replace(/~~/g, "")
    .replace(/\(\(|\)\)/g, "");
}

/**
 * O texto e a referência de uma ideia marcada como texto pronto; null se a
 * ideia é um tema.
 */
export function lerTextoPronto(ideia: string): { texto: string; ref: string } | null {
  const t = (ideia || "").trim();
  if (!ehTextoMarcado(t)) return null;
  const { texto, ref } = separarReferencia(semMarcas(t.replace(RE_MARCA, "")));
  return texto ? { texto, ref } : null;
}

const soLetras = (p: string) => plano(p).replace(/[^a-z0-9]/g, "");

/**
 * Marca com {chaves} os trechos pedidos, sem mexer em mais nada do texto.
 * Compara sem acento, caixa nem pontuação ("eu descerei" acha `"eu descerei".`).
 * `naoAchei` traz os trechos que não estão no texto.
 */
export function aplicarDestaque(
  texto: string,
  trechos: string[],
): { texto: string; naoAchei: string[] } {
  const palavras = semMarcas(texto).split(/\s+/).filter(Boolean);
  const chaves = palavras.map(soLetras);
  const marcada = palavras.map(() => false);
  const naoAchei: string[] = [];
  for (const trecho of trechos) {
    const alvo = trecho.split(/\s+/).map(soLetras).filter(Boolean);
    if (!alvo.length) continue;
    let achou = false;
    for (let i = 0; i + alvo.length <= chaves.length; i++) {
      if (alvo.every((a, k) => chaves[i + k] === a)) {
        for (let k = 0; k < alvo.length; k++) marcada[i + k] = true;
        achou = true;
        break;
      }
    }
    if (!achou) naoAchei.push(trecho);
  }
  // Palavras vizinhas marcadas entram no mesmo par de chaves.
  let saida = "";
  for (let i = 0; i < palavras.length; i++) {
    const abre = marcada[i] && !marcada[i - 1];
    const fecha = marcada[i] && !marcada[i + 1];
    saida += `${i ? " " : ""}${abre ? "{" : ""}${palavras[i]}${fecha ? "}" : ""}`;
  }
  return { texto: saida, naoAchei };
}

/** O que está entre {chaves} hoje, para manter o destaque quando o texto muda. */
export function destaquesAtuais(texto: string): string[] {
  return [...(texto || "").matchAll(/\{([^}]+)\}/g)].map((m) => m[1].trim());
}

// ---------------------------------------------------------------------------
// Cor
// ---------------------------------------------------------------------------

export type CorPedida =
  | { tema: (typeof TEMAS_AUTOMATICOS)[number] }
  // `clara`: some no fundo claro do modelo editorial — pede o modelo com foto.
  | { cor: string; clara?: boolean };

const CORES: [RegExp, CorPedida][] = [
  [/\b(?:dourad[oa]|ouro)\b/, { tema: "dourado" }],
  [/\b(?:laranja|terracota)\b/, { tema: "terracota" }],
  [/\bazul\b/, { tema: "azul" }],
  [/\bverde\b/, { tema: "verde" }],
  [/\b(?:vinho|bordo)\b/, { tema: "vinho" }],
  [/\bamarel[oa]\b/, { cor: "#F2C230", clara: true }],
  [/\bvermelh[oa]\b/, { cor: "#D63A2F" }],
  [/\bbranc[oa]\b/, { cor: "#FFFFFF", clara: true }],
  [/\brosa\b/, { cor: "#E0569B" }],
  [/\b(?:rox[oa]|lilas)\b/, { cor: "#8E5BD0" }],
];
const NOMES_DE_COR =
  "dourad[oa]|ouro|laranja|terracota|azul|verde|vinho|bordo|amarel[oa]|vermelh[oa]|branc[oa]|rosa|rox[oa]|lilas";

/** O nome de cor dito no pedido ("em amarelo", "de azul"), se houver. */
export function lerCor(dito: string): CorPedida | null {
  const t = plano(dito || "");
  return CORES.find(([re]) => re.test(t))?.[1] ?? null;
}

// ---------------------------------------------------------------------------
// Pedido de ajuste
// ---------------------------------------------------------------------------

export type Ajuste = {
  /** O texto inteiro, como o pastor escreveu agora. */
  texto?: string;
  /** Trocar um trecho por outro, sem tocar no resto. */
  trocar?: { de: string; para: string };
  /** Os trechos que ficam na cor de destaque. */
  destaques?: string[];
  /** Nome de cor dito no pedido, ou "outra" (qualquer uma diferente da atual). */
  cor?: string;
  ref?: string;
  outraFoto?: boolean;
  outroModelo?: boolean;
  /** O modelo pedido pelo nome ("modelo muro"). */
  modelo?: ModeloSlide;
  /** Descrição da foto nova, quando o pastor disse o que quer ver. */
  prompt?: string;
};

// Os verbos que abrem um pedido de ajuste. Só valem com um rascunho na tela:
// "mudar a reunião para quinta" é da agenda.
const RE_ABRE_AJUSTE =
  /^(?:ajust\w*|corrig\w*|corrij\w*|arrum\w*|mud(?:ar|a|e)|alter(?:ar|a|e)|troc(?:ar|a|que)|destac\w*|destaqu\w*|colo(?:car|ca|que)|poe|deix(?:ar|a|e)|tir(?:ar|a|e)|pint\w*|(?:o\s+)?texto\s*[:–—-]|outr[oa]\s+(?:foto|imagem|fundo|cor|modelo)|(?:no\s+)?modelo\s+[a-z]+)(?![a-z])/;

/** A mensagem parece um pedido para mexer no rascunho que está na tela? */
export function pareceAjuste(dito: string): boolean {
  return RE_ABRE_AJUSTE.test(plano((dito || "").trim()));
}

const RE_VERBO_GENERICO =
  /^(?:ajust\w*|corrig\w*|corrij\w*|arrum\w*)(?![\p{L}])[\s:,.–—-]*(?:(?:o|a|esse|este|isso|ai|aí)(?![\p{L}])\s*)?/iu;
const ASPAS = /["“«]([^"”»]+)["”»]/g;
const RE_FALA_DE_COR = new RegExp(
  `\\b(?:cor(?:es)?|colorid\\w*|destac\\w*|destaqu\\w*|pint\\w*|grif\\w*|${NOMES_DE_COR})\\b`,
);
const ARTIGO =
  "(?:(?:a|as|o|os)\\s+)?(?:(?:palavras?|frase|trecho|parte|express[aã]o)\\s+)?";
const FIM_DE_COR = `(?:\\s+(?:de|em|com|na|no|da|do)\\s+(?:uma\\s+)?(?:outra\\s+cor|cor\\b|${NOMES_DE_COR}).*)`;
const RE_DESTACAR = new RegExp(
  `(?:destac\\w*|destaqu\\w*|grif\\w*)\\s+${ARTIGO}(.+?)${FIM_DE_COR}?[.!]?$`,
  "i",
);
const RE_COLOCAR = new RegExp(
  `(?:colo(?:car|ca|que)|p[oõ]e|deix(?:ar|a|e)|pint\\w*)\\s+${ARTIGO}(.+?)${FIM_DE_COR}[.!]?$`,
  "i",
);

/**
 * Entende, sem IA, os pedidos de ajuste mais diretos. Devolve null quando o
 * pedido precisa de interpretação — aí quem lê é a IA (ver `systemAjuste`).
 */
export function interpretarAjuste(dito: string): Ajuste | null {
  const original = (dito || "").trim();
  const pedido = original.replace(RE_VERBO_GENERICO, "").trim();
  if (!pedido) return null;

  // "texto: …" — o texto inteiro, exatamente como veio.
  if (RE_MARCA.test(pedido)) {
    const { texto, ref } = separarReferencia(semMarcas(pedido.replace(RE_MARCA, "")));
    return texto ? { texto, ...(ref ? { ref } : {}) } : null;
  }

  const p = plano(pedido);
  const ajuste: Ajuste = {};
  // "modelo muro", "no modelo caderno": o modelo pedido pelo nome.
  const nomeado = p.match(/\bmodelo\s+(?:para\s+(?:o\s+)?|d[eo]\s+)?([a-z]+)/)?.[1];
  const chave = (Object.keys(MODELOS) as ModeloSlide[]).find(
    (k) => k === nomeado || plano(MODELOS[k].nome) === nomeado,
  );
  if (chave && chave !== "foto") ajuste.modelo = chave;
  // "outro modelo" chega aqui pelo "refazer" só com a última palavra.
  if (/^(?:modelo|layout|estilo|visual)$/.test(p)) return { outroModelo: true };
  if (/^(?:foto|imagem|fundo)$/.test(p)) return { outraFoto: true };
  if (/^cor$/.test(p)) return { cor: "outra" };
  if (
    /\b(?:outra|outro|troc\w+|mud\w+)\s+(?:(?:a|de|o)\s+)?(?:foto|imagem|fundo)\b/.test(
      p,
    )
  )
    ajuste.outraFoto = true;
  if (
    /\b(?:outro|troc\w+|mud\w+)\s+(?:(?:o|de)\s+)?(?:modelo|layout|estilo|visual)\b/.test(
      p,
    )
  )
    ajuste.outroModelo = true;

  // "troca X por Y" — no texto. ("troca a foto" e "troca a cor" não são isso.)
  const trocar = pedido.match(
    /troc(?:ar|a|que)\s+(?:(?:a|o)\s+)?(?:(?:palavra|frase|trecho)\s+)?["“«]?(.+?)["”»]?\s+por\s+["“«]?(.+?)["”».!]*$/i,
  );
  if (
    trocar &&
    !/^(?:a\s+|o\s+)?(?:foto|imagem|fundo|cor|modelo)\b/.test(plano(trocar[1]))
  )
    ajuste.trocar = { de: trocar[1].trim(), para: trocar[2].trim() };

  if (!ajuste.trocar && RE_FALA_DE_COR.test(p)) {
    const entreAspas = [...pedido.matchAll(ASPAS)].map((m) => m[1].trim());
    if (entreAspas.length) ajuste.destaques = entreAspas;
    else {
      const solto = pedido.match(RE_DESTACAR) ?? pedido.match(RE_COLOCAR);
      if (solto?.[1]) ajuste.destaques = [solto[1].trim()];
    }
    const cor = lerCor(pedido);
    if (cor) ajuste.cor = pedido;
    else if (
      /\b(?:outra|outras|diferente|troc\w+|mud\w+)\b.*\bcor(?:es)?\b|\bcor(?:es)?\s+diferentes?\b/.test(
        p,
      )
    )
      ajuste.cor = "outra";
  }
  return Object.keys(ajuste).length ? ajuste : null;
}

/** O slide como o ajuste o enxerga — os campos de SlidePub que ele pode mudar. */
export type SlideAjustavel = {
  texto: string;
  prompt: string;
  seed: number;
  tema?: string;
  cor?: string;
  modelo?: string;
  ref?: string;
};

/**
 * Aplica o ajuste ao slide. Só muda o que o ajuste traz; o que não foi pedido
 * fica como está. `mudou` descreve, em português, o que foi feito; `naoAchei`
 * lista os trechos pedidos que não existem no texto. `sorteio` é do teste.
 */
export function aplicarAjuste<S extends SlideAjustavel>(
  slide: S,
  ajuste: Ajuste,
  sorteio = Math.random(),
): { slide: S; mudou: string[]; naoAchei: string[] } {
  const novo: S = { ...slide };
  const mudou: string[] = [];
  const naoAchei: string[] = [];
  let destaques = ajuste.destaques?.filter(Boolean) ?? destaquesAtuais(slide.texto);
  let limpo = semMarcas(slide.texto).replace(/\s+/g, " ").trim();

  if (ajuste.texto?.trim()) {
    limpo = semMarcas(ajuste.texto).replace(/\s+/g, " ").trim();
    mudou.push("o texto");
  } else if (ajuste.trocar) {
    const { de, para } = ajuste.trocar;
    const onde = plano(limpo).indexOf(plano(de));
    // Só confia na posição se tirar o acento não mudou o tamanho do texto.
    if (onde >= 0 && plano(limpo).length === limpo.length) {
      limpo = `${limpo.slice(0, onde)}${para}${limpo.slice(onde + de.length)}`;
      destaques = destaques.map((d) => (plano(d) === plano(de) ? para : d));
      mudou.push("o texto");
    } else naoAchei.push(de);
  }

  let marcado = aplicarDestaque(limpo, destaques);
  if (ajuste.destaques?.length) {
    naoAchei.push(...marcado.naoAchei);
    if (marcado.naoAchei.length < ajuste.destaques.length) mudou.push("o destaque");
    // Nenhum trecho pedido está no texto: o destaque fica como estava.
    else marcado = aplicarDestaque(limpo, destaquesAtuais(slide.texto));
  }
  novo.texto = marcado.texto;

  if (ajuste.ref !== undefined && ajuste.ref.trim() !== (slide.ref ?? "")) {
    novo.ref = ajuste.ref.trim();
    mudou.push("a referência");
  }

  if (ajuste.cor) {
    const pedida = lerCor(ajuste.cor);
    if (pedida && "tema" in pedida) {
      novo.tema = pedida.tema;
    } else if (pedida) {
      novo.tema = undefined;
      novo.cor = pedida.cor;
      // Amarelo e branco não aparecem no fundo claro: vai para o modelo com foto.
      if (pedida.clara && novo.modelo === "editorial") novo.modelo = "cinema";
    } else {
      novo.tema = sortearDiferente(TEMAS_AUTOMATICOS, slide.tema, sorteio);
    }
    mudou.push("a cor");
  }

  if (ajuste.modelo && ajuste.modelo !== slide.modelo) {
    novo.modelo = ajuste.modelo;
    mudou.push("o modelo");
  } else if (ajuste.outroModelo) {
    novo.modelo = sortearDiferente(MODELOS_TEXTO_PRONTO, slide.modelo, sorteio);
    mudou.push("o modelo");
  }
  if (ajuste.outraFoto || ajuste.prompt?.trim()) {
    if (ajuste.prompt?.trim()) novo.prompt = ajuste.prompt.trim();
    // Semente nova = foto nova (a foto é guardada por descrição + semente).
    novo.seed = Math.floor(sorteio * 1_000_000);
    if (novo.seed === slide.seed) novo.seed += 1;
    // Fundo claro não tem foto: pedir outra foto é pedir o modelo com foto.
    if (novo.modelo === "editorial") novo.modelo = "cinema";
    mudou.push("a foto");
  }
  return { slide: novo, mudou, naoAchei };
}

// ---------------------------------------------------------------------------
// Pedidos à IA
// ---------------------------------------------------------------------------

const FOTO =
  "descrição EM INGLÊS de uma foto de reportagem ligada ao sentido do texto: diga quem, fazendo o quê, onde e com que luz (mãos numa Bíblia aberta, alguém de joelhos, uma escada num corredor escuro, gente à mesa). Sem texto na imagem, sem rosto em close.";

/**
 * O pedido para um post cujo TEXTO o pastor já escreveu. A IA não devolve o
 * texto — só o que cerca: o trecho a destacar, a foto e a legenda. Assim não
 * há como ela trocar uma palavra.
 */
export function systemTextoPronto(contextoPerfil: string): string {
  return `Você ajuda um pastor a montar um post de Instagram (ministério de discipulado Ekballo).
O pastor JÁ ESCREVEU o texto que vai na imagem. Ele vai exatamente como está: você NÃO reescreve, não resume, não corrige e não devolve esse texto.

Devolva só o que falta:
- "destaque": o trecho mais forte do texto, de 1 a 3 palavras, COPIADO letra por letra do texto (fica em outra cor).
- "prompt": ${FOTO}
- "legenda": o texto do post, de 3 a 5 frases pessoais e calorosas que desenvolvem a ideia, sem repetir a frase da imagem e sem cara de anúncio. Termine com 3 a 5 hashtags.

LIMITES DA LEGENDA
- NÃO escreva referência bíblica nem cite versículo, a menos que o pastor tenha escrito a referência. Se ele citou um livro ou autor, pode mencionar; não invente o que o livro diz.
- NÃO invente fato, número nem história. Sem promessa de cura ou prosperidade, sem tom de coach.
${contextoPerfil ? `\nQUEM ESTÁ FALANDO (dá a voz e os limites)\n${contextoPerfil}\n` : ""}
Responda SOMENTE com JSON válido:
{"destaque":"...","prompt":"...","legenda":"..."}`;
}

export type CercaDoTexto = { destaque: string; prompt: string; legenda: string };

const texto = (v: unknown) => (typeof v === "string" ? v.trim() : "");

/** Lê a resposta de `systemTextoPronto`. Lança se não vier a foto nem a legenda. */
export function lerCercaDoTexto(objeto: unknown): CercaDoTexto {
  const o = (objeto || {}) as Record<string, unknown>;
  const cerca = {
    destaque: texto(o.destaque),
    prompt: texto(o.prompt),
    legenda: texto(o.legenda),
  };
  if (!cerca.prompt && !cerca.legenda)
    throw new Error("a IA não devolveu a foto nem a legenda");
  return cerca;
}

/** O pedido para a IA traduzir um ajuste dito em linguagem livre. */
export function systemAjuste(): string {
  return `O pastor tem o rascunho de uma imagem para o Instagram e pediu um ajuste pelo WhatsApp. Diga, em JSON, o que mudar. Mude SÓ o que ele pediu.

Campos (use null em tudo que ele NÃO pediu):
- "texto": o texto inteiro da imagem depois do ajuste. Só preencha se ele pediu para mudar o texto. Se ele ditou o texto novo, copie letra por letra. Se pediu uma correção pontual (uma palavra, um erro), mude só aquilo e copie o resto letra por letra. Nunca resuma nem melhore por conta própria.
- "destaques": lista de trechos do texto (copiados letra por letra) que ele quer em outra cor ou em destaque.
- "cor": a cor que ele pediu, uma destas: dourado, terracota, azul, verde, vinho, amarelo, vermelho, branco, rosa, roxo. Se pediu "outra cor" sem dizer qual: "outra".
- "ref": a linha de autoria ou referência ("Livro: …", "Hebreus 10:23"), se ele pediu para pôr ou mudar. String vazia se pediu para tirar.
- "outraFoto": true se ele pediu outra foto, imagem ou fundo.
- "outroModelo": true se ele pediu outro modelo, layout ou estilo.
- "prompt": se ele descreveu a foto que quer, a descrição EM INGLÊS dessa foto.

Responda SOMENTE com JSON válido:
{"texto":null,"destaques":null,"cor":null,"ref":null,"outraFoto":false,"outroModelo":false,"prompt":null}`;
}

/** O que a IA recebe junto do pedido: o estado atual do rascunho. */
export function pedidoDeAjuste(slide: SlideAjustavel, pedido: string): string {
  return [
    `TEXTO ATUAL DA IMAGEM: ${semMarcas(slide.texto)}`,
    `TRECHO EM DESTAQUE HOJE: ${destaquesAtuais(slide.texto).join(" | ") || "(nenhum)"}`,
    `REFERÊNCIA HOJE: ${slide.ref || "(nenhuma)"}`,
    "",
    `PEDIDO DO PASTOR: ${pedido}`,
  ].join("\n");
}

/** Lê a resposta de `systemAjuste`. Lança se ela não pede nada. */
export function lerAjusteDaIA(objeto: unknown): Ajuste {
  const o = (objeto || {}) as Record<string, unknown>;
  const ajuste: Ajuste = {};
  if (texto(o.texto)) ajuste.texto = texto(o.texto);
  if (Array.isArray(o.destaques)) {
    const d = o.destaques.map(texto).filter(Boolean).slice(0, 4);
    if (d.length) ajuste.destaques = d;
  } else if (texto(o.destaques)) ajuste.destaques = [texto(o.destaques)];
  if (texto(o.cor)) ajuste.cor = texto(o.cor);
  if (typeof o.ref === "string") ajuste.ref = o.ref.trim();
  if (o.outraFoto === true) ajuste.outraFoto = true;
  if (o.outroModelo === true) ajuste.outroModelo = true;
  if (texto(o.prompt)) ajuste.prompt = texto(o.prompt);
  if (!Object.keys(ajuste).length) throw new Error("não entendi o que ajustar");
  return ajuste;
}
