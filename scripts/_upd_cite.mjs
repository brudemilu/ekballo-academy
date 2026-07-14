import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";
const env=Object.fromEntries(readFileSync(new URL("../.env.local",import.meta.url),"utf8").split("\n").filter(l=>l.includes("=")&&!l.trim().startsWith("#")).map(l=>{const i=l.indexOf("=");return [l.slice(0,i).trim(),l.slice(i+1).trim()];}));
const db=createClient(env.NEXT_PUBLIC_SUPABASE_URL,env.SUPABASE_SERVICE_ROLE_KEY,{auth:{persistSession:false}});
const [slug,path]=process.argv.slice(2);
const {data:c}=await db.from("cursos").select("id").eq("slug",slug).single();
const aulas=JSON.parse(readFileSync(path,"utf8")); let upd=0;
for(const a of aulas){const {data:row}=await db.from("aulas").select("id,conteudo").eq("curso_id",c.id).eq("ordem",a.ordem).maybeSingle(); if(row&&row.conteudo!==a.conteudo){await db.from("aulas").update({conteudo:a.conteudo}).eq("id",row.id); upd++;}}
console.log(`${slug}: ${upd} aulas atualizadas`);
