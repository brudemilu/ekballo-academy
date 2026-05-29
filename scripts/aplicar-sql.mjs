// Aplica arquivo(s) SQL no banco via Supabase Management API.
// PAT lido de env SUPABASE_PAT ou do arquivo /tmp/sbpat.
// Uso: node scripts/aplicar-sql.mjs supabase/migrations/055_*.sql [outro.sql ...]
import { readFile } from "node:fs/promises";

const REF = process.env.SUPABASE_REF || "yasfxwqomvhmxxqnunat";
let PAT = process.env.SUPABASE_PAT;
if (!PAT) {
  try { PAT = (await readFile("/tmp/sbpat", "utf8")).trim(); } catch {}
}
if (!PAT) { console.error("Falta SUPABASE_PAT (env) ou /tmp/sbpat."); process.exit(1); }

const files = process.argv.slice(2);
if (!files.length) { console.error("Informe ao menos um arquivo .sql"); process.exit(1); }

for (const f of files) {
  const sql = await readFile(f, "utf8");
  process.stdout.write(`→ aplicando ${f} (${(sql.length / 1024).toFixed(0)} KB)… `);
  const res = await fetch(`https://api.supabase.com/v1/projects/${REF}/database/query`, {
    method: "POST",
    headers: { Authorization: `Bearer ${PAT}`, "Content-Type": "application/json" },
    body: JSON.stringify({ query: sql }),
  });
  const txt = await res.text();
  if (!res.ok) { console.log("FALHOU"); console.error(`  HTTP ${res.status}: ${txt.slice(0, 800)}`); process.exit(1); }
  console.log("ok", txt.length > 2 ? `→ ${txt.slice(0, 200)}` : "");
}
console.log("Concluído.");
