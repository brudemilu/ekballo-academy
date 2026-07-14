import { readFileSync, writeFileSync } from "node:fs";

const replacements = new Map([
  ["ﬁ", "fi"],
  ["ﬂ", "fl"],
  ["\u00ad", ""],
  ["", "Th"],
  ["", "o"],
  ["", "p"],
  ["", "i"],
  ["", "d"],
  ["", "e"],
  ["", "s"],
  ["", "q"],
  ["", "u"],
  ["", "r"],
  ["", "ã"],
  ["", "ç"],
  ["", "õ"],
]);

const cursos = [
  {
    migration: 192,
    slug: "milagres",
    titulo: "Milagres",
    autor: "C. S. Lewis",
    capa: "capas/milagres.jpg",
    source: "milagres-layout.txt",
    descricao:
      "Leitura guiada de Milagres, de C. S. Lewis. Em dezenove aulas, incluindo os apêndices, Lewis examina Naturalismo, Sobrenaturalismo, as leis da natureza, a Encarnação e os milagres da velha e da nova criação. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Capítulo 1 - O escopo deste livro", 11, 13],
      ["Capítulo 2 - O Naturalista e o Sobrenaturalista", 14, 21],
      ["Capítulo 3 - A principal dificuldade do Naturalismo", 22, 37],
      ["Capítulo 4 - Natureza e Sobrenatureza", 38, 49],
      ["Capítulo 5 - Uma dificuldade adicional no Naturalismo", 50, 56],
      ["Capítulo 6 - Respostas aos receios", 57, 63],
      ["Capítulo 7 - Um capítulo sobre pistas falsas", 64, 75],
      ["Capítulo 8 - Milagres e as leis da Natureza", 76, 84],
      ["Capítulo 9 - Um capítulo quase desnecessário", 85, 90],
      ["Capítulo 10 - \"Coisas vermelhas nojentas\"", 91, 107],
      ["Capítulo 11 - Cristianismo e religião", 108, 125],
      ["Capítulo 12 - A propriedade dos milagres", 126, 132],
      ["Capítulo 13 - Sobre a probabilidade", 133, 143],
      ["Capítulo 14 - O Grande Milagre", 144, 174],
      ["Capítulo 15 - Milagres da velha criação", 175, 188],
      ["Capítulo 16 - Milagres da nova criação", 189, 215],
      ["Capítulo 17 - Epílogo", 216, 221],
      ["Apêndice A - Sobre as palavras espírito e espiritual", 222, 227],
      ["Apêndice B - Sobre providências especiais", 228, 237],
    ],
  },
  {
    migration: 193,
    slug: "o-deus-que-destroi-sonhos",
    titulo: "O Deus que destrói sonhos",
    autor: "Rodrigo Bibo",
    capa: "capas/o-deus-que-destroi-sonhos.jpg",
    source: "o-deus-que-destroi-sonhos-layout.txt",
    descricao:
      "Leitura guiada de O Deus que destrói sonhos, de Rodrigo Bibo. Em dez aulas, o livro confronta a teologia centrada nos desejos humanos e chama o discípulo a trocar sonhos autônomos pela vontade de Deus. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Agradecimentos", 12, 13],
      ["Prefácio", 14, 19],
      ["Introdução - Quem é o seu Deus?", 20, 26],
      ["Capítulo 1 - A fábrica de sonhos", 27, 35],
      ["Capítulo 2 - Crucificando os sonhos", 36, 49],
      ["Capítulo 3 - Os sonhos de um discípulo", 50, 67],
      ["Capítulo 4 - Abrindo mão dos seus sonhos para viver a vontade de Deus", 68, 80],
      ["Capítulo 5 - Senhor, qual a sua vontade para minha vida?", 81, 93],
      ["Capítulo 6 - A oração de um discípulo", 94, 112],
      ["Considerações finais - O Deus selvagem", 113, 122],
    ],
  },
  {
    migration: 194,
    slug: "deuses-falsos",
    titulo: "Deuses Falsos",
    autor: "Timothy Keller",
    capa: "capas/deuses-falsos.jpg",
    source: "deuses-falsos-layout.txt",
    descricao:
      "Leitura guiada de Deuses Falsos, de Timothy Keller. Em oito aulas, Keller expõe como dinheiro, amor, sucesso, poder e outros desejos podem se tornar ídolos do coração, e aponta para a substituição desses falsos deuses pelo Deus vivo. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Introdução - A fábrica de ídolos", 6, 37],
      ["Amor não é tudo que você precisa", 38, 61],
      ["Dinheiro muda tudo", 62, 81],
      ["A sedução do sucesso", 82, 102],
      ["O poder e a glória", 103, 128],
      ["Ídolos em nossas vidas", 129, 153],
      ["O fim de deuses falsificados", 154, 163],
      ["Epílogo - Localizar e substituir seus ídolos", 164, 174],
    ],
  },
  {
    migration: 195,
    slug: "peso-da-gloria",
    titulo: "O Peso da Glória",
    autor: "C. S. Lewis",
    capa: "capas/peso-da-gloria.jpg",
    source: "peso-da-gloria-layout.txt",
    descricao:
      "Leitura guiada de O Peso da Glória, de C. S. Lewis. Em onze aulas, incluindo a introdução e o prefácio, a coletânea reúne sermões e ensaios sobre glória, guerra, pacifismo, transposição, membresia, perdão e vida cristã. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Introdução de Walter Hooper", 5, 15],
      ["Prefácio do autor à edição original", 16, 16],
      ["Capítulo 1 - O peso da glória", 17, 28],
      ["Capítulo 2 - Aprendizado em tempos de guerra", 29, 37],
      ["Capítulo 3 - Por que não sou um pacifista", 38, 51],
      ["Capítulo 4 - Transposição", 52, 63],
      ["Capítulo 5 - Teologia é poesia?", 64, 76],
      ["Capítulo 6 - O círculo íntimo", 77, 85],
      ["Capítulo 7 - Membresia", 86, 95],
      ["Capítulo 8 - Sobre o perdão", 96, 99],
      ["Capítulo 9 - Ato falho", 100, 104],
    ],
  },
  {
    migration: 196,
    slug: "grande-divorcio",
    titulo: "O Grande Divórcio",
    autor: "C. S. Lewis",
    capa: "capas/grande-divorcio.jpg",
    source: "grande-divorcio-layout.txt",
    descricao:
      "Leitura guiada de O Grande Divórcio, de C. S. Lewis. Em quinze aulas, o clássico alegórico acompanha uma viagem imaginativa entre o inferno e o céu, explorando desejo, arrependimento, graça e a impossibilidade de conservar o mal diante da glória. Cada aula traz a transcrição do texto, sem perguntas de reflexão.",
    aulas: [
      ["Prefácio", 25, 31],
      ["Um", 32, 36],
      ["Dois", 37, 45],
      ["Três", 46, 50],
      ["Quatro", 51, 57],
      ["Cinco", 58, 65],
      ["Seis", 66, 70],
      ["Sete", 71, 75],
      ["Oito", 76, 83],
      ["Nove", 84, 101],
      ["Dez", 102, 107],
      ["Onze", 108, 123],
      ["Doze", 124, 132],
      ["Treze", 133, 145],
      ["Quatorze", 146, 151],
    ],
  },
];

function normalizeChars(text) {
  for (const [from, to] of replacements) text = text.split(from).join(to);
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
    const joined = current
      .join(pullQuote ? "\n" : " ")
      .replace(/\s+([,.;:!?])/g, "$1")
      .replace(/\s+/g, pullQuote ? "\n" : " ")
      .trim();
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

function buildMigration(curso) {
  const pages = readFileSync(new URL(`../tmp/pdfs/${curso.source}`, import.meta.url), "utf8").split("\f");
  const aulas = curso.aulas.map(([titulo, start, end], index) => ({
    ordem: index + 1,
    titulo,
    conteudo: cleanRange(pages, start, end, titulo),
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

const applyScript = `// Aplica as migrations 192-196 (outros livros transcritos) via service role.
//
//   node scripts/apply-192-196-outros-livros.mjs
//
// Lê os .sql como fonte da verdade. Não cria atividades/perguntas.

import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const env = Object.fromEntries(
  readFileSync(new URL("../.env.local", import.meta.url), "utf8")
    .split("\\n")
    .filter((l) => l.includes("=") && !l.trim().startsWith("#"))
    .map((l) => {
      const i = l.indexOf("=");
      return [l.slice(0, i).trim(), l.slice(i + 1).trim()];
    })
);
const url = env.NEXT_PUBLIC_SUPABASE_URL;
const key = env.SUPABASE_SERVICE_ROLE_KEY;
if (!url || !key) throw new Error("Faltam NEXT_PUBLIC_SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY no .env.local");
const db = createClient(url, key, { auth: { persistSession: false } });

const migrations = ${JSON.stringify(cursos.map((c) => ({ slug: c.slug, file: migrationName(c), capa: c.capa, categoria: "ensino" })), null, 2)};

function parseCurso(sql, fallbackSlug) {
  const slug = (sql.match(/where slug = '([^']+)'/) || [])[1] || fallbackSlug;
  const titulo = (sql.match(/set titulo = \\$titulo\\$([\\s\\S]*?)\\$titulo\\$/) || sql.match(/\\$titulo\\$([\\s\\S]*?)\\$titulo\\$/) || [])[1];
  const descricao = (sql.match(/\\$desc\\$([\\s\\S]*?)\\$desc\\$/) || [])[1];
  const blocks = sql.split(/\\n\\s*select id into v_aula_id from public\\.aulas/).slice(1);
  const aulas = blocks.map((b) => {
    const ordem = Number((b.match(/and ordem = (\\d+)/) || [])[1]);
    const titulo = (b.match(/\\$t\\$([\\s\\S]*?)\\$t\\$/) || [])[1];
    const conteudo = (b.match(/\\$conteudo\\$([\\s\\S]*?)\\$conteudo\\$/) || [])[1];
    if (!ordem || !titulo || conteudo == null) throw new Error(\`Bloco mal-parseado (slug=\${slug}, ordem=\${ordem}, titulo=\${titulo})\`);
    return { ordem, titulo, conteudo: conteudo.replace(/^\\n/, "").replace(/\\n$/, "") };
  });
  if (!titulo || !descricao || !aulas.length) throw new Error(\`Não consegui parsear o curso \${slug}\`);
  const imagemUrl = (sql.match(/imagem_url = '([^']+)'/) || sql.match(/'([^']+)',\\n      false/) || [])[1] || \`/api/og/curso/\${slug}\`;
  return { slug, titulo, descricao, imagem_url: imagemUrl, categoria: "ensino", aulas };
}

async function applyOne(entry) {
  const sql = readFileSync(new URL(\`../supabase/migrations/\${entry.file}\`, import.meta.url), "utf8");
  const cursoData = parseCurso(sql, entry.slug);

  let { data: curso } = await db.from("cursos").select("id, publicado").eq("slug", cursoData.slug).maybeSingle();
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db
      .from("cursos")
      .insert({
        slug: cursoData.slug,
        titulo: cursoData.titulo,
        descricao: cursoData.descricao,
        imagem_url: cursoData.imagem_url,
        categoria: cursoData.categoria,
        is_pago: false,
        preco_centavos: 0,
        ordem: nextOrdem,
        publicado: true,
      })
      .select("id")
      .single();
    if (error) throw error;
    curso = data;
    console.log(\`✓ curso criado: \${cursoData.slug} (ordem \${nextOrdem})  id=\${curso.id}\`);
  } else {
    const { error } = await db
      .from("cursos")
      .update({
        titulo: cursoData.titulo,
        descricao: cursoData.descricao,
        imagem_url: cursoData.imagem_url,
        categoria: cursoData.categoria,
        publicado: true,
      })
      .eq("id", curso.id);
    if (error) throw error;
    console.log(\`• curso já existia: \${cursoData.slug}  id=\${curso.id} — atualizado e publicado\`);
  }

  for (const a of cursoData.aulas) {
    const { data: aula } = await db.from("aulas").select("id").eq("curso_id", curso.id).eq("ordem", a.ordem).maybeSingle();
    if (aula) {
      console.log(\`  • aula \${a.ordem}: \${a.titulo} já existia — mantida\`);
      continue;
    }
    const { error } = await db
      .from("aulas")
      .insert({ curso_id: curso.id, titulo: a.titulo, ordem: a.ordem, conteudo: a.conteudo })
      .select("id")
      .single();
    if (error) throw error;
    console.log(\`  ✓ aula \${a.ordem}: \${a.titulo}  (\${a.conteudo.length} chars)\`);
  }
}

for (const migration of migrations) await applyOne(migration);
console.log("\\nConcluído.");
`;

for (const curso of cursos) {
  writeFileSync(new URL(`../supabase/migrations/${migrationName(curso)}`, import.meta.url), buildMigration(curso));
}
writeFileSync(new URL("./apply-192-196-outros-livros.mjs", import.meta.url), applyScript);
