// imprime quantas aulas (de cursos de leitura publicados) faltam ter áudio
import { readFileSync } from "node:fs";import { createClient } from "@supabase/supabase-js";
const env=Object.fromEntries(readFileSync(new URL("../.env.local",import.meta.url),"utf8").split("\n").filter(l=>l.includes("=")&&!l.trim().startsWith("#")).map(l=>{const i=l.indexOf("=");return[l.slice(0,i).trim(),l.slice(i+1).trim()]}));
const db=createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY,{auth:{persistSession:false}});
const {data:cursos}=await db.from("cursos").select("id,external_path,slug");
const exclui=new Set((process.env.EXCLUI_AUDIO||"comentario-biblico-moody").split(",").map(s=>s.trim()).filter(Boolean));
let falta=0;
for(const c of cursos){ if(c.external_path||exclui.has(c.slug)) continue;
  const {data:a}=await db.from("aulas").select("audio_leitura_url,conteudo").eq("curso_id",c.id);
  for(const x of (a||[])) if((x.conteudo||"").trim().length>=200 && !x.audio_leitura_url) falta++;
}
console.log(falta);
