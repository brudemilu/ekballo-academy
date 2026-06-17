// Atualiza aulas.conteudo (limpeza de aberturas/vazamentos) por (slug, ordem),
// lendo os JSONs já limpos em /tmp. Só UPDATE — não cria nada.
import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";
const env = Object.fromEntries(readFileSync(new URL("../.env.local", import.meta.url),"utf8").split("\n").filter(l=>l.includes("=")&&!l.trim().startsWith("#")).map(l=>{const i=l.indexOf("=");return [l.slice(0,i).trim(),l.slice(i+1).trim()];}));
const db = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY,{auth:{persistSession:false}});
const mapa = [
  ["oracao-keller","/tmp/oracao.json"],
  ["cristao-sociedade-nao-crista","/tmp/cristao.json"],
  ["cultura-da-honra","/tmp/honra.json"],
  ["campo-batalha-mente","/tmp/campo.json"],
  ["lideranca-com-propositos","/tmp/lideranca.json"],
];
for (const [slug,path] of mapa){
  const { data:curso } = await db.from("cursos").select("id").eq("slug",slug).single();
  const aulas = JSON.parse(readFileSync(path,"utf8"));
  let upd=0;
  for (const a of aulas){
    const { data:row } = await db.from("aulas").select("id,conteudo").eq("curso_id",curso.id).eq("ordem",a.ordem).maybeSingle();
    if (!row){ console.log(`  ! ${slug} ordem ${a.ordem} não existe`); continue; }
    if (row.conteudo !== a.conteudo){
      const { error } = await db.from("aulas").update({ conteudo:a.conteudo }).eq("id",row.id);
      if (error) throw error;
      upd++;
    }
  }
  console.log(`${slug}: ${upd} aulas atualizadas (de ${aulas.length})`);
}
console.log("Concluído.");
