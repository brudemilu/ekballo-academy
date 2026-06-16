// Aplica a migration 107 (casca do curso "Liderança com Propósitos") via
// service role, fora do MCP. Cria APENAS o registro do curso (com a capa)
// para o card aparecer na lista. Sem aulas. Idempotente por slug.
//
//   node scripts/apply-107-lideranca-propositos.mjs

import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

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

const CURSO = {
  slug: "lideranca-com-propositos",
  titulo: "Liderança com Propósitos",
  descricao:
    'Um estudo de liderança cristã a partir da vida de Neemias — o homem que reconstruiu os muros de Jerusalém em 52 dias. A cada capítulo, um princípio: como um líder se forma, ora, planeja, motiva, organiza um projeto, enfrenta oposição, resolve conflitos, vence as tentações do poder e sustenta o sucesso ao longo do tempo. Inspirado em "Liderança com Propósitos", de Rick Warren, o curso traz o princípio central de cada etapa, o exemplo bíblico de Neemias, a aplicação pelos cinco propósitos (Comunhão, Discipulado, Ministério, Evangelismo e Adoração) e perguntas para você examinar a própria liderança.',
  imagem_url: "/api/og/curso/lideranca-com-propositos",
  is_pago: false,
  preco_centavos: 0,
  publicado: true,
};

const existente = await db
  .from("cursos")
  .select("id")
  .eq("slug", CURSO.slug)
  .maybeSingle();

if (existente.error) throw existente.error;

if (existente.data) {
  console.log(`Curso "${CURSO.slug}" já existe (id ${existente.data.id}). Nada a fazer.`);
} else {
  const { data: max } = await db
    .from("cursos")
    .select("ordem")
    .order("ordem", { ascending: false })
    .limit(1)
    .maybeSingle();
  const ordem = (max?.ordem ?? 0) + 1;
  const { data, error } = await db
    .from("cursos")
    .insert({ ...CURSO, ordem })
    .select("id")
    .single();
  if (error) throw error;
  console.log(`Curso criado: ${CURSO.slug} (id ${data.id}, ordem ${ordem}).`);
}
