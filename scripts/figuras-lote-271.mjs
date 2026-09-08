// =============================================================
// Varredura de figuras — leva 271 (set/2026)
//
// Cinco livros do acervo traziam diagrama ou gravura no miolo que a carga
// original descartou. O trabalho aqui é o mesmo das levas 241-244: separar
// figura de verdade de ornamento (ícone de rede social, vinheta de abertura
// repetida, anúncio da editora, foto do autor) e colocar cada uma na mesa
// certa.
//
// Como a mesa é descoberta: a página do PDF é extraída em texto e as
// sequências de 8 palavras dela são procuradas no conteúdo das mesas do
// curso. A mesa que casa mais âncoras é a mesa da figura, e a posição da
// primeira âncora diz o parágrafo em que a figura entra. Páginas de figura
// costumam ter pouco texto, então a busca varre também as vizinhas (±2) — o
// deslocamento usado decide se a imagem entra antes ou depois do parágrafo.
//
// Uso:
//   node scripts/figuras-lote-271.mjs <mesas.json> <saida.sql>
// onde mesas.json é `select json_agg(...)` de (slug, id, ordem, titulo,
// conteudo) das mesas dos cinco cursos.
// =============================================================

import { execFileSync } from "node:child_process";
import { readFileSync, writeFileSync, mkdirSync, copyFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const RAIZ = join(dirname(fileURLToPath(import.meta.url)), "..");
const PDFS = join(process.env.HOME, "Downloads", "Livros subidos");

// Páginas escolhidas na triagem visual (folhas de contato de 102 candidatas).
// Descartados: capa, folha de rosto, ícones de Instagram/Facebook/Twitter,
// aberturas de parte só com texto, vinheta repetida em todo capítulo, catálogo
// da editora e caderno de fotos do autor.
const ALVOS = [
  {
    pdf: "Casamento_blindado_2.0 (Casal_Cardoso).pdf",
    slug: "casamento-blindado",
    figuras: [
      { pag: 43, nome: "temperamentos" },
      { pag: 59, nome: "ciclo-do-conflito" },
      { pag: 144, nome: "familia-de-origem" },
      { pag: 147, nome: "ordem-dos-relacionamentos" },
      { pag: 217, nome: "novo-casal" },
    ],
  },
  {
    pdf: "Destinados a Reinar  - Joseph Prince.pdf",
    slug: "destinados-a-reinar",
    figuras: [
      { pag: 112, nome: "raiz" },
      { pag: 147, nome: "oferta-pelo-pecado" },
      { pag: 149, nome: "holocausto" },
      { pag: 171, nome: "arca-da-alianca" },
    ],
  },
  {
    pdf: "FAVOR IMERECIDO - Joseph Prince.pdf",
    slug: "favor-imerecido",
    figuras: [
      { pag: 114, nome: "oferta-1" },
      { pag: 115, nome: "oferta-2" },
      { pag: 116, nome: "oferta-3" },
      { pag: 266, nome: "arca-1" },
      { pag: 267, nome: "propiciatorio" },
    ],
  },
  {
    pdf: "Liderança_A_Inteligência_emocional.pdf",
    slug: "lideranca-inteligencia-emocional",
    figuras: [{ pag: 56, nome: "estilos-de-lideranca" }],
  },
  {
    pdf: "Seitas e Heresias - Raimundo de Oliveira.pdf",
    slug: "seitas-e-heresias",
    figuras: [
      { pag: 17, nome: "catolicismo" },
      { pag: 28, nome: "kardec" },
      { pag: 31, nome: "sessao-espirita" },
      { pag: 60, nome: "queda-da-babilonia" },
      { pag: 65, nome: "paraiso-russelita" },
      { pag: 84, nome: "darwin" },
      { pag: 109, nome: "escudo-da-trindade" },
      { pag: 112, nome: "blavatsky" },
      { pag: 118, nome: "marx" },
      { pag: 122, nome: "kremlin" },
      { pag: 129, nome: "racionalismo" },
      { pag: 142, nome: "maconaria" },
    ],
  },
];

const norm = (s) =>
  s.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, " ").trim();

function textoDaPagina(pdf, pag) {
  try {
    return execFileSync("pdftotext", ["-f", String(pag), "-l", String(pag), join(PDFS, pdf), "-"], {
      encoding: "utf8",
    });
  } catch {
    return "";
  }
}

/** Mesa (e posição no texto) em que a página do PDF cai. */
function acharMesa(pdf, pag, mesas) {
  let melhor = null;
  for (const desloc of [0, 1, -1, 2, -2]) {
    const palavras = norm(textoDaPagina(pdf, pag + desloc)).split(" ").filter((w) => w.length > 2);
    if (palavras.length < 14) continue;
    const ancoras = [];
    for (let i = 0; i + 8 <= palavras.length; i += 4) ancoras.push(palavras.slice(i, i + 8).join(" "));
    for (const m of mesas) {
      const casadas = ancoras.filter((a) => m.n.includes(a));
      const acertos = casadas.length;
      if (acertos && (!melhor || acertos > melhor.acertos)) {
        melhor = { mesa: m, acertos, casadas, desloc };
      }
    }
    if (melhor && melhor.acertos >= 3) break;
  }
  return melhor;
}

/**
 * Índice do parágrafo em que a figura entra. Uma âncora pode não estar em
 * parágrafo nenhum quando ela cai na emenda de dois (o PDF quebra a frase na
 * virada de página), então tenta-se cada âncora casada e, no fim, a primeira
 * metade delas.
 */
function paragrafoDaAncora(mesa, casadas) {
  const paragrafos = mesa.conteudo.split("\n\n").map(norm);
  for (const a of casadas) {
    const idx = paragrafos.findIndex((p) => p.includes(a));
    if (idx !== -1) return idx;
  }
  for (const a of casadas) {
    const metade = a.split(" ").slice(0, 4).join(" ");
    const idx = paragrafos.findIndex((p) => p.includes(metade));
    if (idx !== -1) return idx;
  }
  return null;
}

const mesasTodas = JSON.parse(readFileSync(process.argv[2], "utf8"));
const saida = process.argv[3] ?? join(RAIZ, "supabase/migrations/271_figuras_cinco_livros.sql");

const linhas = [];
const relatorio = [];

for (const alvo of ALVOS) {
  const mesas = mesasTodas
    .filter((m) => m.slug === alvo.slug)
    .map((m) => ({ ...m, n: norm(m.conteudo || "") }));
  const porMesa = new Map();

  for (const fig of alvo.figuras) {
    const achado = acharMesa(alvo.pdf, fig.pag, mesas);
    if (!achado) {
      relatorio.push(`SEM MESA: ${alvo.slug} p${fig.pag}`);
      continue;
    }
    const { mesa, casadas, desloc, acertos } = achado;
    const idx = paragrafoDaAncora(mesa, casadas);
    if (idx === null) {
      relatorio.push(`SEM PARÁGRAFO: ${alvo.slug} p${fig.pag} (mesa ${mesa.ordem})`);
      continue;
    }
    const arquivo = `mesa${String(mesa.ordem).padStart(2, "0")}-${fig.nome}.png`;
    const destino = join(RAIZ, "public/figuras", alvo.slug, arquivo);
    mkdirSync(dirname(destino), { recursive: true });
    copyFileSync(
      join(process.env.FIGS_DIR, `${alvo.slug}-p${String(fig.pag).padStart(3, "0")}.png`),
      destino,
    );

    // Casou pela página seguinte → no livro a imagem vem ANTES desse texto.
    const antes = desloc > 0;
    const lista = porMesa.get(mesa.id) ?? [];
    lista.push({ idx, antes, caminho: `/figuras/${alvo.slug}/${arquivo}` });
    porMesa.set(mesa.id, lista);
    relatorio.push(
      `${alvo.slug} p${fig.pag} → mesa ${mesa.ordem} §${idx} ${antes ? "antes" : "depois"} (${acertos} âncoras) ${arquivo}`,
    );
  }

  // Um UPDATE por mesa, com as figuras entrando de trás para frente para os
  // índices dos parágrafos não se moverem.
  for (const [aulaId, figuras] of porMesa) {
    const mesa = mesas.find((m) => m.id === aulaId);
    const paragrafos = mesa.conteudo.split("\n\n");
    figuras
      .sort((a, b) => b.idx - a.idx || Number(b.antes) - Number(a.antes))
      .forEach((f) => {
        paragrafos.splice(f.antes ? f.idx : f.idx + 1, 0, `[figura] ${f.caminho}`);
      });
    const novo = paragrafos.join("\n\n");
    linhas.push(
      `-- ${alvo.slug} · mesa ${mesa.ordem} (${figuras.length} figura${figuras.length > 1 ? "s" : ""})\n` +
        `update aulas set conteudo = $conteudo$${novo}$conteudo$ where id = '${aulaId}';`,
    );
  }
}

const sql = `-- =============================================================
-- 271 · Figuras de miolo de cinco livros (varredura set/2026)
--
-- Diagramas e gravuras que estão no original e não tinham sido carregados:
-- os quatro esquemas de Casamento Blindado, as ilustrações do tabernáculo de
-- Destinados a Reinar e Favor Imerecido, o quadro de estilos de liderança de
-- Liderança e Inteligência Emocional e as gravuras de Seitas e Heresias.
--
-- Gerada por scripts/figuras-lote-271.mjs. Os arquivos vão em
-- public/figuras/<slug>/ e entram no site com o rebuild da imagem.
-- =============================================================

begin;

${linhas.join("\n\n")}

commit;
`;

writeFileSync(saida, sql);
console.log(relatorio.join("\n"));
console.log(`\n${linhas.length} mesas alteradas → ${saida}`);
