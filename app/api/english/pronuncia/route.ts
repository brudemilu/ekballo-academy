import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { transcreverFala } from "@/lib/pronuncia";
import { normalizarResposta, respostaCorreta } from "@/lib/english-tipos";

// =============================================================
// EKBALLO ENGLISH · Confere a pronúncia do aluno
//
// Recebe o áudio gravado no aparelho, transcreve e compara com a
// frase esperada. Substitui o reconhecimento do navegador, que só
// funcionava no Chrome/Edge do computador — e portanto não corrigia
// quem estava no celular.
//
// O áudio não é salvo em lugar nenhum: vive na memória durante a
// requisição e some depois. Ver o aviso em lib/pronuncia.ts.
// =============================================================

export const runtime = "nodejs";

const LIMITE_BYTES = 4 * 1024 * 1024; // ~4 MB cobre bem mais que uma frase

export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  let form: FormData;
  try {
    form = await req.formData();
  } catch {
    return NextResponse.json({ erro: "envio inválido" }, { status: 400 });
  }

  const audio = form.get("audio");
  const esperado = String(form.get("esperado") || "").trim();
  const aceitasCru = String(form.get("aceitas") || "[]");

  if (!(audio instanceof Blob) || audio.size === 0) {
    return NextResponse.json({ erro: "áudio ausente" }, { status: 400 });
  }
  if (audio.size > LIMITE_BYTES) {
    return NextResponse.json({ erro: "gravação longa demais" }, { status: 413 });
  }
  if (!esperado) {
    return NextResponse.json({ erro: "frase esperada ausente" }, { status: 400 });
  }

  let aceitas: string[] = [];
  try {
    const lido = JSON.parse(aceitasCru);
    if (Array.isArray(lido)) aceitas = lido.filter((x) => typeof x === "string");
  } catch { /* segue sem variantes */ }

  const nome = String(form.get("nome") || "fala.webm");
  const r = await transcreverFala(audio, nome);
  if (!r.ok) return NextResponse.json({ erro: r.erro }, { status: 502 });

  // Aceita também quando a frase esperada aparece DENTRO do que foi
  // transcrito: o Whisper costuma acrescentar pontuação, hesitação ou
  // uma palavra solta antes/depois, e reprovar por isso seria injusto
  // com quem falou certo.
  const dito = normalizarResposta(r.transcricao);
  const alvo = normalizarResposta(esperado);
  const correto =
    respostaCorreta(r.transcricao, esperado, aceitas) ||
    (alvo.length > 0 && dito.includes(alvo));

  return NextResponse.json({ ok: true, transcricao: r.transcricao, correto });
}
