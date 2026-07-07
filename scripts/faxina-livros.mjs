// Faxina cosmética nos livros transcritos (só os que já estão em bom português).
// Corrige artefatos de extração de PDF SEM tocar no conteúdo textual:
//   A) Remonta pull-quotes estilhaçados (caixa-alta quebrada uma-palavra-por-linha)
//      e assinaturas verticais (RODRIGO\nBIBO\nDE\nAQUINO -> RODRIGO BIBO DE AQUINO).
//   B) Remove marcadores de nota inline do tipo "[ 24 ]" (não linkam a nada no leitor).
//
// NÃO mexe em: seções de notas/bibliografia no fim dos capítulos (os números ali são
// marcadores de referência estruturados) nem em notas [N. T.]/[N. E.].
//
// Uso:
//   node scripts/faxina-livros.mjs           # PREVIEW: gera relatório, não grava
//   node scripts/faxina-livros.mjs --apply   # aplica no banco
//
// Deuses Falsos é DE PROPÓSITO deixado de fora (texto é tradução automática quebrada;
// precisa de reimportação de uma fonte boa, não de faxina).

import { readFileSync, writeFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const APPLY = process.argv.includes("--apply");

const SLUGS = [
  "os-clas-da-lua",
  "a-lideranca-pastoral",
  "maturidade-espiritual-do-lider",
  "ate-que-sejamos-um",
  "qual-a-missao-da-igreja",
  "esperanca-em-tempos-de-medo",
  "cosmovisoes-em-conflito",
  "chega-de-regras",
  "nao-apagueis-o-espirito",
  "para-que-todos-sejam-um",
  "o-espirito-santo-consolador",
  "surpreendido-por-deus",
  "a-obra-consumada-de-cristo",
  "ate-que-nada-mais-importe",
  "como-orar-lewis",
  "reflexoes-cristas-lewis",
  "paixao-pelas-almas",
  "cristao-contagiante",
  "as-cronicas-de-narnia",
  "plantar-igrejas",
  "pastoreando-coracao-crianca",
];

const env = Object.fromEntries(
  readFileSync(new URL("../.env.local", import.meta.url), "utf8")
    .split("\n")
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

// ——— helpers ———

// É um "fragmento em caixa-alta" (pedaço de pull-quote / assinatura)?
// Tem ao menos uma letra e NENHUMA letra minúscula.
function isCaps(block) {
  const letters = block.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, "");
  if (letters.length < 1) return false;
  return block === block.toUpperCase();
}

function limparEspacos(s) {
  return s
    .replace(/[ \t]+/g, " ")          // espaços múltiplos -> 1
    .replace(/ +([,.;:!?”»)\]])/g, "$1") // espaço antes de pontuação
    .replace(/([“«(\[]) +/g, "$1")    // espaço depois de abre-aspas/parêntese
    .trim();
}

function faxina(txt) {
  let s = txt;

  // (B) remove marcadores de nota inline "[ 24 ]" (com espaço interno — padrão distintivo).
  //     Remove também o espaço que vem antes, se houver.
  s = s.replace(/ ?\[ \d{1,3} \]/g, "");

  // (A) reassembla pull-quotes / assinaturas.
  // 1) quebra em blocos por linha em branco.
  const blocosRaw = s.split(/\n{2,}/);
  // 2) dentro de cada bloco, \n simples vira espaço (prosa normal não tem \n simples).
  const blocos = blocosRaw
    .map((b) => limparEspacos(b.replace(/\n/g, " ")))
    .filter((b) => b.length > 0);

  // 3) funde CORRIDAS (>=2) de blocos totalmente em caixa-alta num bloco só.
  const out = [];
  let i = 0;
  while (i < blocos.length) {
    if (isCaps(blocos[i])) {
      let j = i;
      while (j < blocos.length && isCaps(blocos[j])) j++;
      if (j - i >= 2) {
        out.push(limparEspacos(blocos.slice(i, j).join(" ")));
        i = j;
        continue;
      }
    }
    out.push(blocos[i]);
    i++;
  }

  return out.join("\n\n").trim();
}

// diff simples: mostra os primeiros N trechos que mudaram
function trechosMudados(antes, depois, ctx = 45, max = 4) {
  const res = [];
  // acha a 1ª e últimas divergências grosso modo por blocos
  const aB = antes.split(/\n{2,}/);
  const dB = depois.split(/\n{2,}/);
  const n = Math.max(aB.length, dB.length);
  for (let k = 0; k < n && res.length < max; k++) {
    if ((aB[k] || "") !== (dB[k] || "")) {
      res.push({
        antes: (aB[k] || "«(bloco removido)»").slice(0, ctx * 2),
        depois: (dB[k] || "«(bloco removido)»").slice(0, ctx * 2),
      });
    }
  }
  return res;
}

const relatorio = [];
let totalMudadas = 0;

for (const slug of SLUGS) {
  const { data: curso } = await db.from("cursos").select("id, titulo").eq("slug", slug).maybeSingle();
  if (!curso) {
    relatorio.push(`\n### ${slug} — NÃO ENCONTRADO`);
    continue;
  }
  const { data: aulas } = await db
    .from("aulas")
    .select("id, ordem, titulo, conteudo")
    .eq("curso_id", curso.id)
    .order("ordem");

  relatorio.push(`\n## ${curso.titulo} (${slug})`);
  for (const a of aulas || []) {
    const limpo = faxina(a.conteudo);
    if (limpo === a.conteudo) continue;
    totalMudadas++;
    const dChars = limpo.length - a.conteudo.length;
    const dParag = limpo.split(/\n{2,}/).length - a.conteudo.split(/\n{2,}/).length;
    relatorio.push(
      `\n- [${a.ordem}] ${a.titulo}  (${dChars >= 0 ? "+" : ""}${dChars} chars, ${dParag} parág.)`
    );
    for (const t of trechosMudados(a.conteudo, limpo)) {
      relatorio.push(`    ANTES : ${JSON.stringify(t.antes)}`);
      relatorio.push(`    DEPOIS: ${JSON.stringify(t.depois)}`);
    }
    if (APPLY) {
      const { error } = await db.from("aulas").update({ conteudo: limpo }).eq("id", a.id);
      if (error) throw new Error(`update ${slug} #${a.ordem}: ${error.message}`);
    }
  }
}

const header = APPLY
  ? `# FAXINA APLICADA — ${totalMudadas} aulas atualizadas\n`
  : `# PREVIEW (nada gravado) — ${totalMudadas} aulas mudariam\n(rode com --apply para gravar)\n`;
const texto = header + relatorio.join("\n") + "\n";

const outPath = new URL("../scripts/faxina-livros.preview.txt", import.meta.url);
writeFileSync(outPath, texto);
console.log(texto);
console.log(`\n>>> relatório salvo em scripts/faxina-livros.preview.txt`);
console.log(APPLY ? ">>> MUDANÇAS GRAVADAS NO BANCO." : ">>> PREVIEW apenas. Nada foi gravado.");
