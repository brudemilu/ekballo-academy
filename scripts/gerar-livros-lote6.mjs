import { readFileSync, writeFileSync } from "node:fs";

// Gera as migrations 291-292 (livros da leva 6) a partir dos .txt em tmp/pdfs/.
// Mesma lógica de gerar-livros-lote5.mjs; sem perguntas de reflexão.
// Os dois PDFs desta leva não têm cabeçalho corrido nem número de página no
// texto extraído, então não há stripHeaders aqui.
//
//   pdftotext -layout "<pdf>" tmp/pdfs/<slug>-layout.txt
//   node scripts/gerar-livros-lote6.mjs

const replacements = new Map([
  ["ﬁ", "fi"],
  ["ﬂ", "fl"],
  ["­", ""],
]);

const cursos = [
  {
    migration: 291,
    slug: "a-busca-da-santidade",
    titulo: "A Busca da Santidade",
    autor: "Jerry Bridges",
    capa: "capas/a-busca-da-santidade.jpg",
    source: "a-busca-da-santidade-layout.txt",
    descricao:
      "Leitura guiada de A Busca da Santidade, de Jerry Bridges. Em vinte aulas, incluindo prólogo, prefácio e uma nota adicional, o autor trata da responsabilidade do cristão na santificação: a santidade de Deus, a batalha diária contra o pecado, obediência, disciplina pessoal, hábitos, fé e a alegria de viver para Deus. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Prólogo", 7, 8],
      ["Prefácio", 9, 11],
      ["Capítulo 1 - A santidade é para você", 12, 18],
      ["Capítulo 2 - A santidade de Deus", 19, 26],
      ["Capítulo 3 - A santidade não é uma opção", 27, 33],
      ["Capítulo 4 - A santidade de Cristo", 34, 39],
      ["Capítulo 5 - Uma mudança de reinos", 40, 47],
      ["Capítulo 6 - A batalha por santidade", 48, 53],
      ["Capítulo 7 - Ajuda na batalha diária", 54, 62],
      ["Capítulo 8 - Obediência — não vitória", 63, 66],
      ["Capítulo 9 - Mortificando o pecado", 67, 75],
      ["Capítulo 10 - O lugar da disciplina pessoal", 76, 83],
      ["Capítulo 11 - Santidade no corpo", 84, 89],
      ["Capítulo 12 - Santidade no espírito", 90, 96],
      ["Capítulo 13 - A santidade e a nossa vontade", 97, 102],
      ["Capítulo 14 - Hábitos de santidade", 103, 106],
      ["Capítulo 15 - Santidade e fé", 107, 113],
      ["Capítulo 16 - Santidade num mundo ímpio", 114, 118],
      ["Capítulo 17 - A alegria da santidade", 119, 122],
      ["Uma nota adicional", 123, 123],
    ],
  },
  {
    migration: 292,
    slug: "o-cristao-e-a-cultura",
    titulo: "O Cristão e a Cultura",
    autor: "Michael Scott Horton",
    capa: "capas/o-cristao-e-a-cultura.jpg",
    source: "o-cristao-e-a-cultura-layout.txt",
    descricao:
      "Leitura guiada de O Cristão e a Cultura, de Michael Scott Horton. Em dez aulas, incluindo introdução e conclusão, o autor discute o lugar do cristão no mundo — vocação secular, esferas de soberania, o valor do intelecto, as artes, a ciência, o trabalho e o fim da História — recusando tanto a fuga do mundo quanto a rendição a ele. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Introdução", 13, 16],
      ["Capítulo 1 - Como ser um cristão secular", 17, 36],
      ["Capítulo 2 - Esfera de soberania: cuidar dos nossos próprios afazeres", 37, 53],
      [
        'Capítulo 3 - "Vã filosofia": uma desculpa para o anti-intelectualismo?',
        54,
        71,
      ],
      ["Capítulo 4 - O cristianismo e as artes", 72, 93],
      ["Capítulo 5 - A arte na vida do cristão", 94, 110],
      [
        "Capítulo 6 - O cristianismo e a ciência moderna: não podemos ser amigos?",
        111,
        131,
      ],
      ["Capítulo 7 - Trabalhar para o final de semana", 132, 154],
      ["Capítulo 8 - Um mundo enlouquecido", 155, 167],
      ["Conclusão - No mundo, mas não do mundo", 168, 195],
    ],
  },
];

function normalizeChars(text) {
  for (const [from, to] of replacements) text = text.split(from).join(to);
  // Conserta ligadura fi/fl que alguns PDFs extraem como "f " + i/l.
  text = text.replace(/([A-Za-zÀ-ÿ])f ([il])/g, "$1f$2");
  text = text.replace(/\bf ([il])/g, "f$1");
  return text.normalize("NFC");
}

function isLikelyPullQuote(line) {
  const letters = line.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, "");
  return letters.length >= 12 && line === line.toUpperCase();
}

function cleanRange(pages, start, end, title) {
  const rawLines = [];
  for (let page = start; page <= end; page += 1) {
    rawLines.push(...(pages[page - 1] ?? "").split("\n"));
    rawLines.push("");
  }

  const paragraphs = [];
  let current = [];
  let pullQuote = false;

  function flush() {
    if (!current.length) return;
    let joined;
    if (pullQuote) {
      joined = current
        .map((l) => l.replace(/[ \t]+/g, " ").trim())
        .join("\n")
        .trim();
    } else {
      joined = current
        .join(" ")
        .replace(/([a-zà-ÿ])-\s+/g, "$1") // rejunta hifenização de fim de linha
        .replace(/\s+([,.;:!?])/g, "$1")
        .replace(/\s+/g, " ")
        .trim();
    }
    if (joined && joined.toLowerCase() !== title.toLowerCase()) paragraphs.push(joined);
    current = [];
    pullQuote = false;
  }

  for (const rawLine of rawLines) {
    const line = normalizeChars(rawLine).trim();
    if (!line) {
      flush();
      continue;
    }

    if (line.toLowerCase() === title.toLowerCase()) continue;
    if (/^(Document Outline|Table of Contents)$/i.test(line)) continue;

    const newParagraph =
      /^\s{2,}\S/.test(rawLine) || isLikelyPullQuote(line) !== pullQuote;
    if (newParagraph) flush();

    pullQuote = isLikelyPullQuote(line);
    current.push(line);
  }
  flush();

  return paragraphs
    .join("\n\n")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}

// Remove do começo do capítulo as linhas de rótulo ("Capítulo 4", "1.") e a
// repetição do título que a diagramação imprime na página de abertura.
function stripTituloDeAbertura(conteudo, titulo) {
  const nucleo = titulo
    .replace(/^Cap[íi]tulo\s+\d+\s*-\s*/, "")
    .replace(/^Conclusão\s*-\s*/, "")
    .trim();
  const descartaveis = [/^Cap[íi]tulo\s+\d+$/i, /^\d+\.?$/, /^Conclusão$/i];

  // Normaliza para comparar: aspas tipográficas, hifenização de fim de linha
  // ("anti-  intelectualismo") e espaços colapsados.
  const chave = (t) =>
    t
      .replace(/[“”]/g, '"')
      .replace(/-\s+/g, "-")
      .replace(/\s+/g, " ")
      .trim()
      .replace(/^\d+\.\s*/, "") // "1. A SANTIDADE É PARA VOCÊ" -> título puro
      .toLowerCase();

  const partes = conteudo.split("\n\n");
  let i = 0;

  // 1) rótulos de abertura ("Capítulo 4", "1.", "Conclusão")
  while (i < partes.length && descartaveis.some((re) => re.test(partes[i].trim())))
    i += 1;

  // 2) o título impresso na abertura — que a diagramação pode ter partido em
  //    vários parágrafos ("Esfera de soberania: cuidar dos nossos próprios" +
  //    "afazeres"), então consome parágrafos enquanto forem prefixo do título.
  const alvo = chave(nucleo);
  let acumulado = "";
  for (let j = i; j < partes.length; j += 1) {
    acumulado = chave(`${acumulado} ${partes[j]}`);
    if (acumulado === alvo) {
      i = j + 1;
      break;
    }
    if (!alvo.startsWith(acumulado)) break;
  }

  return partes.slice(i).join("\n\n").trim();
}

function dollar(tag, value) {
  if (value.includes(`$${tag}$`))
    throw new Error(`Conteúdo contém delimitador $${tag}$`);
  return `$${tag}$${value}$${tag}$`;
}

function migrationName(curso) {
  return `${curso.migration}_curso_${curso.slug.replaceAll("-", "_")}.sql`;
}

function buildMigration(curso) {
  const pages = readFileSync(
    new URL(`../tmp/pdfs/${curso.source}`, import.meta.url),
    "utf8",
  ).split("\f");
  const aulas = curso.aulas.map(([titulo, start, end], index) => ({
    ordem: index + 1,
    titulo,
    conteudo: stripTituloDeAbertura(cleanRange(pages, start, end, titulo), titulo),
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
  const sql = buildMigration(curso);
  writeFileSync(new URL(`../supabase/migrations/${name}`, import.meta.url), sql);
  console.log(
    `✓ ${name}  (${curso.aulas.length} aulas, ${(sql.length / 1024).toFixed(0)} kB)`,
  );
}
console.log("\nMigrations geradas. Confira o conteúdo antes de aplicar.");
