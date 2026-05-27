// Script: busca NAA pra cada referência via bolls.life e gera SQL UPDATE.
// Saída no stdout — colar no execute_sql do Supabase.

const LIVROS = {
  "Gênesis": 1, "Êxodo": 2, "Levítico": 3, "Números": 4, "Deuteronômio": 5,
  "Josué": 6, "Juízes": 7, "Rute": 8, "1 Samuel": 9, "2 Samuel": 10,
  "1 Reis": 11, "2 Reis": 12, "1 Crônicas": 13, "2 Crônicas": 14,
  "Esdras": 15, "Neemias": 16, "Ester": 17, "Jó": 18, "Salmos": 19,
  "Salmo": 19, "Provérbios": 20, "Eclesiastes": 21, "Cantares": 22,
  "Isaías": 23, "Jeremias": 24, "Lamentações": 25, "Ezequiel": 26,
  "Daniel": 27, "Oseias": 28, "Oséias": 28, "Joel": 29, "Amós": 30,
  "Obadias": 31, "Jonas": 32, "Miqueias": 33, "Miquéias": 33,
  "Naum": 34, "Habacuque": 35, "Sofonias": 36, "Ageu": 37, "Zacarias": 38,
  "Malaquias": 39, "Mateus": 40, "Marcos": 41, "Lucas": 42, "João": 43,
  "Atos": 44, "Romanos": 45, "1 Coríntios": 46, "2 Coríntios": 47,
  "Gálatas": 48, "Efésios": 49, "Filipenses": 50, "Colossenses": 51,
  "1 Tessalonicenses": 52, "2 Tessalonicenses": 53,
  "1 Timóteo": 54, "2 Timóteo": 55, "Tito": 56, "Filemom": 57,
  "Hebreus": 58, "Tiago": 59, "1 Pedro": 60, "2 Pedro": 61,
  "1 João": 62, "2 João": 63, "3 João": 64, "Judas": 65, "Apocalipse": 66,
};

import fs from "node:fs";
const REFS_FILE = process.argv[2];
const REFS = JSON.parse(fs.readFileSync(REFS_FILE, "utf8"));

function parseRef(ref) {
  // Ex: "2 Coríntios 5:17", "Filipenses 3:13-14"
  const m = ref.match(/^(.+?)\s+(\d+):(\d+)(?:-(\d+))?$/);
  if (!m) throw new Error(`ref inválida: ${ref}`);
  const livroNome = m[1].trim();
  const cap = Number(m[2]);
  const vStart = Number(m[3]);
  const vEnd = m[4] ? Number(m[4]) : vStart;
  const livroId = LIVROS[livroNome];
  if (!livroId) throw new Error(`livro desconhecido: ${livroNome}`);
  return { livroId, cap, vStart, vEnd };
}

function stripHtml(s) {
  return s
    .replace(/<sup[^>]*>.*?<\/sup>/gi, "")
    .replace(/<i[^>]*>(.*?)<\/i>/gi, "$1")
    .replace(/<b[^>]*>(.*?)<\/b>/gi, "$1")
    .replace(/<em[^>]*>(.*?)<\/em>/gi, "$1")
    .replace(/<strong[^>]*>(.*?)<\/strong>/gi, "$1")
    .replace(/<br\s*\/?>/gi, " ")
    .replace(/<[^>]+>/g, "")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/\s+/g, " ")
    .trim();
}

async function fetchNAA(livroId, cap) {
  const url = `https://bolls.life/get-text/NAA/${livroId}/${cap}/`;
  const resp = await fetch(url);
  if (!resp.ok) throw new Error(`bolls ${resp.status} pra ${url}`);
  return await resp.json();
}

function escapeSqlString(s) {
  return s.replace(/'/g, "''");
}

async function main() {
  const cache = new Map(); // "livroId-cap" -> versículos[]
  const updates = [];
  for (const { dia_ano, ref } of REFS) {
    try {
      const { livroId, cap, vStart, vEnd } = parseRef(ref);
      const key = `${livroId}-${cap}`;
      if (!cache.has(key)) {
        const data = await fetchNAA(livroId, cap);
        cache.set(key, data);
        await new Promise((r) => setTimeout(r, 80)); // gentil com bolls
      }
      const verses = cache.get(key);
      const selected = verses
        .filter((v) => v.verse >= vStart && v.verse <= vEnd)
        .sort((a, b) => a.verse - b.verse)
        .map((v) => stripHtml(v.text || ""))
        .join(" ");
      if (!selected) {
        console.error(`!! sem texto pra ${ref} (dia ${dia_ano})`);
        continue;
      }
      updates.push(
        `update devocional_anual set versiculo_texto = '${escapeSqlString(selected)}', versiculo_versao = 'NAA' where dia_ano = ${dia_ano};`,
      );
      console.error(`  ok dia ${dia_ano}: ${ref}`);
    } catch (e) {
      console.error(`!! erro dia ${dia_ano} (${ref}): ${e.message}`);
    }
  }
  console.log(updates.join("\n"));
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
