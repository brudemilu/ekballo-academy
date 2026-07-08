// Preenche cursos.autor (da descrição + overrides) e recalcula cursos.ordem
// agrupando livros do mesmo autor DENTRO de cada categoria.
//
// Regra de ordenação final (global ordem, ascendente):
//   - categorias na ordem atual de aparição (não muda a ordem das seções);
//   - dentro da categoria: clusters por autor, cada cluster na posição da
//     PRIMEIRA aparição do autor (min ordem original) — preserva o fluxo atual
//     e só junta os iguais; dentro do cluster, mantém a ordem original.
//   - autor vazio/desconhecido vai para o fim da categoria (por ordem original).
//
//   node scripts/agrupar-autores.mjs          # aplica
//   node scripts/agrupar-autores.mjs --dry     # só relatório

import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const DRY = process.argv.includes("--dry");
const env = Object.fromEntries(
  readFileSync(new URL("../.env.local", import.meta.url), "utf8")
    .split("\n").filter((l) => l.includes("=") && !l.trim().startsWith("#"))
    .map((l) => { const i = l.indexOf("="); return [l.slice(0, i).trim(), l.slice(i + 1).trim()]; })
);
const db = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });

// Autores que eu conheço com certeza (slug -> autor). Override sobre a extração.
const OVERRIDE = {
  "fogo-no-parquinho": "Yago Martins", "nascimento-casamento-morte": "Timothy Keller",
  "como-flechas": "Luciano Subirá", "a-cultura-do-jejum": "Luciano Subirá", "99-nao-e-100": "João Paulo",
  "manso-e-humilde": "Dane Ortlund", "meu-amigo-espirito-santo": "Abe Huber",
  "o-que-cristo-pensa-da-igreja": "John Stott", "temperamentos-transformados": "Tim LaHaye",
  "temperamento-controlado-espirito": "Tim LaHaye", "o-evangelho-stott": "John Stott",
  "o-discipulo-stott": "John Stott", "a-biblia-stott": "John Stott", "a-igreja-stott": "John Stott",
  "o-mundo-stott": "John Stott", "o-problema-da-dor": "C. S. Lewis", "o-grande-abismo": "C. S. Lewis",
  "prefacio-ao-paraiso-perdido": "C. S. Lewis", "perdoar": "Timothy Keller",
  "uma-vida-com-propositos": "Rick Warren", "a-divina-revelacao-do-ceu": "Mary K. Baxter",
  "a-divina-revelacao-do-inferno": "Mary K. Baxter", "a-anatomia-de-uma-dor": "C. S. Lewis",
  "entendes-o-que-les": "Gordon Fee e Douglas Stuart", "cansei": "Adson Belo",
  "nada-mais-importa": "Junia Hayashi",
  // Clássicos que a descrição não deixa extrair limpo:
  "discipulado-bonhoeffer": "Dietrich Bonhoeffer", "problema-do-sofrimento": "C. S. Lewis",
  "campo-batalha-mente": "Joyce Meyer", "quatro-amores": "C. S. Lewis",
  "cartas-diabo-aprendiz": "C. S. Lewis", "cristianismo-puro-simples": "C. S. Lewis",
  "ken-ham-origem": "Ken Ham", "jesuscopy": "Douglas Gonçalves",
};

// Extrai autor da descrição. Âncora no ÚLTIMO ", de " / "livro de " / "por ",
// lê tokens até a pontuação de fim de frase — tratando iniciais ("C. S. Lewis":
// o ponto de "C." e "S." é inicial, o de "Lewis." fecha a frase).
function extrairAutor(desc) {
  if (!desc) return null;
  let idx = -1, len = 0;
  for (const p of [/,\s*de\s+/g, /\blivro de\s+/g]) {
    let m;
    while ((m = p.exec(desc))) { if (m.index >= idx) { idx = m.index; len = m[0].length; } }
  }
  if (idx < 0) return null;
  const tokens = desc.slice(idx + len).split(/\s+/);
  const out = [];
  for (let t of tokens) {
    if (t === "-" || t === "—" || t === "–") break;            // "Autor — frase..."
    if (/[(),;:—–]/.test(t)) { const h = t.replace(/[(),;:—–].*$/, ""); if (h) out.push(h.replace(/\.$/, "")); break; }
    const semPontos = t.replace(/\./g, "");
    const fimFrase = /\.$/.test(t) && semPontos.length > 1; // "Lewis." fecha; "C." não
    out.push(fimFrase ? t.replace(/\.$/, "") : t);
    if (fimFrase || out.length >= 8) break;
  }
  const a = out.join(" ").trim().replace(/\s+/g, " ").replace(/[.,]$/, "");
  return a && a.length >= 3 ? a : null;
}

// chave de agrupamento: só letras minúsculas (une "C. S. Lewis" e "C.S. Lewis").
function chaveAutor(a) {
  return (a || "").toLowerCase().normalize("NFD").replace(/[^a-z]/g, "");
}

const { data: cursos } = await db
  .from("cursos").select("id, slug, titulo, categoria, ordem, descricao, autor")
  .order("ordem", { ascending: true });

// Livros sem autor único (planos/coletâneas/devocionais) — força vazio.
const SEM_AUTOR = new Set(["90-dias-galatas-juizes-efesios", "jornada-180", "devocional-anual"]);

// 1) resolve autor
for (const c of cursos) {
  c.autorFinal = SEM_AUTOR.has(c.slug) ? "" : (OVERRIDE[c.slug] || c.autor || extrairAutor(c.descricao) || "");
}

// 2) recalcula ordem: categorias na ordem de aparição; dentro, clusters por autor
const catOrder = [];
const porCat = new Map();
for (const c of cursos) {
  const cat = c.categoria || "__sem__";
  if (!porCat.has(cat)) { porCat.set(cat, []); catOrder.push(cat); }
  porCat.get(cat).push(c);
}

const novaOrdem = [];
for (const cat of catOrder) {
  const lista = porCat.get(cat);
  // primeira aparição de cada autor
  const primeiraPos = new Map();
  lista.forEach((c, i) => {
    const k = chaveAutor(c.autorFinal);
    if (!primeiraPos.has(k)) primeiraPos.set(k, i);
  });
  const semAutor = (c) => chaveAutor(c.autorFinal) === "";
  lista.sort((a, b) => {
    // sem autor sempre por último
    if (semAutor(a) !== semAutor(b)) return semAutor(a) ? 1 : -1;
    const ka = chaveAutor(a.autorFinal), kb = chaveAutor(b.autorFinal);
    const pa = primeiraPos.get(ka), pb = primeiraPos.get(kb);
    if (pa !== pb) return pa - pb;            // cluster na 1ª aparição
    return a.ordem - b.ordem;                 // dentro do cluster, ordem original
  });
  novaOrdem.push(...lista);
}

// 3) aplica
let n = 1, updAutor = 0, updOrdem = 0;
const relatorio = {};
for (const c of novaOrdem) {
  const patch = {};
  if ((c.autor || "") !== c.autorFinal) { patch.autor = c.autorFinal || null; updAutor++; }
  if (c.ordem !== n) { patch.ordem = n; updOrdem++; }
  if (!DRY && Object.keys(patch).length) {
    const { error } = await db.from("cursos").update(patch).eq("id", c.id);
    if (error) throw error;
  }
  (relatorio[c.categoria] ||= []).push(`${c.autorFinal || "—"} · ${c.titulo}`);
  n++;
}

console.log(`autores preenchidos/ajustados: ${updAutor} | ordens mudadas: ${updOrdem}${DRY ? "  (DRY)" : ""}\n`);
for (const [cat, itens] of Object.entries(relatorio)) {
  console.log(`\n## ${cat}`);
  for (const it of itens) console.log("  " + it);
}
