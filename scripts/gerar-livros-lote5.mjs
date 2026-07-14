import { readFileSync, writeFileSync } from "node:fs";

// Gera as migrations 197-199 (livros da leva 5) a partir dos .txt em tmp/pdfs/.
// Mesma lógica de gerar-outros-livros.mjs; sem perguntas de reflexão.
//
//   node scripts/gerar-livros-lote5.mjs

const replacements = new Map([
  ["ﬁ", "fi"],
  ["ﬂ", "fl"],
  ["­", ""],
]);

const cursos = [
  {
    migration: 197,
    slug: "a-igreja-gloriosa",
    titulo: "A Igreja Gloriosa",
    autor: "Watchman Nee",
    capa: "capas/a-igreja-gloriosa.jpg",
    source: "a-igreja-gloriosa-layout.txt",
    stripHeaders: true,
    descricao:
      "Leitura guiada de A Igreja Gloriosa, de Watchman Nee. Em oito aulas, incluindo prefácio, apresentação e apêndice, Nee expõe o propósito eterno de Deus com a igreja — o descanso de Deus, a prefiguração de Eva, o Corpo e a noiva de Cristo, o filho varão e a Nova Jerusalém. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Prefácio", 6, 7],
      ["Apresentação", 8, 9],
      ["Capítulo 1 - O plano de Deus e o descanso de Deus", 10, 29],
      ["Capítulo 2 - A prefiguração de Eva", 30, 47],
      ["Capítulo 3 - O Corpo de Cristo e a noiva de Cristo", 48, 71],
      ["Capítulo 4 - \"E ela deu à luz um filho varão\"", 72, 101],
      ["Capítulo 5 - A cidade santa, a Nova Jerusalém", 102, 155],
      ["Apêndice - Os vencedores e o mover dispensacional de Deus", 156, 161],
    ],
  },
  {
    migration: 198,
    slug: "a-quem-enviarei",
    titulo: "A Quem Enviarei?",
    autor: "Watchman Nee",
    capa: "/api/og/curso/a-quem-enviarei",
    source: "a-quem-enviarei-layout.txt",
    // Capítulos começam no meio da página; extrai por marcador "Capítulo N"
    // (páginas 2..36; a 1 é rosto+índice) em vez de faixa de página.
    splitByMarker: { contentStart: 2, contentEnd: 36 },
    descricao:
      "Leitura guiada de A Quem Enviarei?, de Watchman Nee. Em nove aulas, incluindo o prefácio, uma coletânea de mensagens sobre a necessidade que Deus tem do homem, fazer as obras de Deus, agradar ao Senhor e servi-lo em espírito. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Prefácio", 2, 2],
      ["Capítulo 1 - A quem enviarei?", 3, 5],
      ["Capítulo 2 - Fazer as obras de Deus", 6, 13],
      ["Capítulo 3 - Agradar ao Senhor", 14, 17],
      ["Capítulo 4 - Servindo a Deus no Espírito", 18, 20],
      ["Capítulo 5 - Aprendendo a servir — I", 21, 22],
      ["Capítulo 6 - Aprendendo a servir — II", 23, 25],
      ["Capítulo 7 - O homem de Deus e o profeta velho", 26, 29],
      ["Capítulo 8 - O peitoral do juízo", 30, 36],
    ],
  },
  {
    migration: 199,
    slug: "casamento-blindado",
    titulo: "Casamento Blindado 2.0",
    autor: "Renato e Cristiane Cardoso",
    capa: "capas/casamento-blindado.jpg",
    source: "casamento-blindado-layout.txt",
    descricao:
      "Leitura guiada de Casamento Blindado 2.0, de Renato e Cristiane Cardoso. Em vinte e cinco aulas, incluindo a introdução, o casal ensina a blindar o casamento contra o divórcio — resolução de problemas, diferenças entre homem e mulher, finanças, filhos, sexo e perdão. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Introdução", 9, 22],
      ["Capítulo 1 - Por que blindar seu casamento?", 23, 29],
      ["Capítulo 2 - É mais embaixo", 30, 34],
      ["Capítulo 3 - A mochila nas costas", 35, 51],
      ["Capítulo 4 - A arte de resolver problemas", 52, 58],
      ["Capítulo 5 - Resolvendo problemas como uma empresa", 59, 67],
      ["Capítulo 6 - Os dez passos para resolver problemas", 68, 82],
      ["Capítulo 7 - Instalando um para-raios no seu casamento", 83, 88],
      ["Capítulo 8 - \"O casamento não deu certo\"", 89, 95],
      ["Capítulo 9 - A ligação que salvou nosso casamento", 96, 101],
      ["Capítulo 10 - O sol do meu planeta", 102, 108],
      ["Capítulo 11 - A maldição do homem e da mulher", 109, 116],
      ["Capítulo 12 - O livramento", 117, 127],
      ["Capítulo 13 - A raiz de todos os divórcios e casamentos infelizes", 128, 139],
      ["Capítulo 14 - A ordem dos relacionamentos", 140, 151],
      ["Capítulo 15 - Como homens e mulheres funcionam", 152, 157],
      ["Capítulo 16 - Naturalmente programados", 158, 169],
      ["Capítulo 17 - Necessidades básicas da mulher", 170, 179],
      ["Capítulo 18 - Necessidades básicas do homem", 180, 191],
      ["Capítulo 19 - Sexo", 192, 206],
      ["Capítulo 20 - Como os filhos afetam o casamento", 207, 220],
      ["Capítulo 21 - Follow the money", 221, 232],
      ["Capítulo 22 - 27 ferramentas para resolver problemas", 233, 264],
      ["Capítulo 23 - O amor caro", 265, 280],
      ["Capítulo 24 - Mantendo a blindagem", 281, 288],
    ],
  },
];

function normalizeChars(text) {
  for (const [from, to] of replacements) text = text.split(from).join(to);
  // Conserta ligadura fi/fl que este PDF extrai como "f " + i/l.
  // Meio de palavra: "signif icado" -> "significado".
  text = text.replace(/([A-Za-zÀ-ÿ])f ([il])/g, "$1f$2");
  // Início de palavra: "f ilho", "f inal", "f im" -> "filho", "final", "fim"
  // ("f" sozinho não é palavra em PT, então é sempre ligadura quebrada).
  text = text.replace(/\bf ([il])/g, "f$1");
  return text.normalize("NFC");
}

// Cabeçalho corrido: primeira linha da página com título/livro em caixa-alta,
// eventualmente com número de página antes/depois. Também "CAPÍTULO UM" etc.
function isRunningHeader(line) {
  const t = line.trim();
  if (/^\d{1,3}$/.test(t)) return true; // número de página solto
  // remove número de página nas pontas
  const core = t.replace(/^\d{1,3}\s+/, "").replace(/\s+\d{1,3}$/, "").trim();
  if (!core) return true;
  const letters = core.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, "");
  // linha curta, toda em caixa-alta, com poucas palavras => cabeçalho/título de página
  const words = core.split(/\s+/).length;
  return letters.length >= 5 && core === core.toUpperCase() && words <= 9 && core.length <= 60;
}

function isLikelyPullQuote(line) {
  const letters = line.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, "");
  return letters.length >= 12 && line === line.toUpperCase();
}

function cleanRange(pages, start, end, title, stripHeaders = false) {
  const rawLines = [];
  for (let page = start; page <= end; page += 1) {
    const pageLines = (pages[page - 1] ?? "").split("\n");
    if (stripHeaders) {
      // remove a primeira linha não-vazia da página se for cabeçalho corrido
      let firstIdx = pageLines.findIndex((l) => l.trim());
      if (firstIdx >= 0 && isRunningHeader(pageLines[firstIdx])) pageLines[firstIdx] = "";
      // remove números de página soltos em qualquer lugar
      for (let i = 0; i < pageLines.length; i += 1) {
        if (/^\s*\d{1,3}\s*$/.test(pageLines[i])) pageLines[i] = "";
      }
    }
    rawLines.push(...pageLines);
    rawLines.push("");
  }

  const paragraphs = [];
  let current = [];
  let pullQuote = false;

  function flush() {
    if (!current.length) return;
    let joined;
    if (pullQuote) {
      // bloco em caixa-alta: preserva cada linha (colapsa só espaços internos),
      // sem explodir a linha em uma palavra por quebra
      joined = current.map((l) => l.replace(/[ \t]+/g, " ").trim()).join("\n").trim();
    } else {
      joined = current
        .join(" ")
        .replace(/([a-zà-ÿ])-\s+/g, "$1") // rejunta hifenização de fim de linha (passa- gens -> passagens)
        .replace(/\s+([,.;:!?])/g, "$1")
        .replace(/\s+/g, " ")
        .trim();
    }
    if (joined && joined.toLowerCase() !== title.toLowerCase()) paragraphs.push(joined);
    current = [];
    pullQuote = false;
  }

  for (const rawLine of rawLines) {
    let line = normalizeChars(rawLine).trim();
    if (!line) {
      flush();
      continue;
    }

    if (line.toLowerCase() === title.toLowerCase()) continue;
    // descarta cabeçalho corrido "A IGREJA GLORIOSA" e o título do capítulo em caixa-alta
    if (/^[pq\s]+$/.test(line)) continue;
    if (/^[a-z](?:\s+[a-z]){1,}$/i.test(line)) continue;
    if (/^(Document Outline|Table of Contents)$/i.test(line)) continue;

    const newParagraph = /^\s{2,}\S/.test(rawLine) || isLikelyPullQuote(line) !== pullQuote;
    if (newParagraph) flush();

    pullQuote = isLikelyPullQuote(line);
    current.push(line);
  }
  flush();

  return paragraphs.join("\n\n").replace(/\n{3,}/g, "\n\n").trim();
}

function dollar(tag, value) {
  if (value.includes(`$${tag}$`)) throw new Error(`Conteúdo contém delimitador $${tag}$`);
  return `$${tag}$${value}$${tag}$`;
}

function migrationName(curso) {
  return `${curso.migration}_curso_${curso.slug.replaceAll("-", "_")}.sql`;
}

// Extrai capítulos por marcador "Capítulo N" (para livros de fluxo contínuo,
// onde os capítulos não começam no topo da página).
function buildAulasByMarker(pages, curso) {
  const { contentStart, contentEnd } = curso.splitByMarker;
  const full = cleanRange(pages, contentStart, contentEnd, "", curso.stripHeaders);
  const parts = full.split(/\n\nCap[íi]tulo\n\n(\d+)\n\n/);
  // parts = [prefácio, "1", corpo1, "2", corpo2, ...]
  const byNum = new Map();
  const prefacio = parts[0].trim();
  for (let i = 1; i < parts.length; i += 2) byNum.set(Number(parts[i]), parts[i + 1].trim());

  return curso.aulas.map(([titulo], index) => {
    const ordem = index + 1;
    if (index === 0) return { ordem, titulo, conteudo: prefacio }; // Prefácio
    const capNum = index; // aula 2 = capítulo 1, etc.
    let corpo = byNum.get(capNum) ?? "";
    // remove a linha-título redundante do capítulo (ex.: "Fazer as obras de Deus")
    const tituloCore = titulo.replace(/^Cap[íi]tulo\s+\d+\s*[-–]\s*/, "").trim();
    const firstBreak = corpo.indexOf("\n\n");
    if (firstBreak > 0) {
      const firstPara = corpo.slice(0, firstBreak).trim();
      if (firstPara.toLowerCase() === tituloCore.toLowerCase()) corpo = corpo.slice(firstBreak).trim();
    }
    // conserta a capitular perdida do capítulo 1 ("odemos"/"P cooperação")
    if (capNum === 1) {
      corpo = corpo.replace(/^odemos/, "Podemos").replace(/de sua\n\nP cooperação/, "de sua cooperação");
    }
    return { ordem, titulo, conteudo: corpo };
  });
}

function buildMigration(curso) {
  const pages = readFileSync(new URL(`../tmp/pdfs/${curso.source}`, import.meta.url), "utf8").split("\f");
  const aulas = curso.splitByMarker
    ? buildAulasByMarker(pages, curso)
    : curso.aulas.map(([titulo, start, end], index) => ({
        ordem: index + 1,
        titulo,
        conteudo: cleanRange(pages, start, end, titulo, curso.stripHeaders),
      }));

  return `-- Curso: ${curso.titulo} (${curso.autor}) — transcrição sem perguntas.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = '${curso.slug}';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      '${curso.slug}',
      ${dollar("titulo", curso.titulo)},
      ${dollar("desc", curso.descricao)},
      '${curso.capa}',
      false,
      0,
      'ensino',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = ${dollar("titulo", curso.titulo)},
        descricao = ${dollar("desc", curso.descricao)},
        imagem_url = '${curso.capa}',
        categoria = 'ensino',
        publicado = true
    where id = v_curso_id;
  end if;

${aulas
  .map((a) => {
    if (!a.conteudo) throw new Error(`Aula sem conteúdo: ${curso.slug} / ${a.titulo}`);
    return `  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = ${a.ordem};
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, ${dollar("t", a.titulo)}, ${a.ordem},
${dollar("conteudo", a.conteudo)})
    returning id into v_aula_id;
  end if;`;
  })
  .join("\n\n")}
end;
$migration$;
`;
}

for (const curso of cursos) {
  const name = migrationName(curso);
  writeFileSync(new URL(`../supabase/migrations/${name}`, import.meta.url), buildMigration(curso));
  const totalChars = curso.aulas.length;
  console.log(`✓ ${name}  (${totalChars} aulas)`);
}
console.log("\nMigrations geradas. Confira o conteúdo antes de aplicar.");
