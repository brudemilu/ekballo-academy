import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";
const env = Object.fromEntries(readFileSync(new URL("../.env.local", import.meta.url),"utf8").split("\n").filter(l=>l.includes("=")&&!l.trim().startsWith("#")).map(l=>{const i=l.indexOf("=");return [l.slice(0,i).trim(),l.slice(i+1).trim()];}));
const db = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, {auth:{persistSession:false}});
for (const slug of ["cristianismo-puro-simples","olhe-para-jesus"]) {
  const { data: c } = await db.from("cursos").select("id").eq("slug",slug).single();
  const { count } = await db.from("aulas").select("id",{count:"exact",head:true}).eq("curso_id",c.id);
  console.log(`${slug}: ${count} aulas`);
}
