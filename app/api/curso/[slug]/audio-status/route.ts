import { NextRequest, NextResponse } from "next/server";
import { getCursoBySlug } from "@/lib/db";

// Status da geração de áudio de um curso (pro polling da UI). Só números de
// progresso — sem dado sensível.
//   GET /api/curso/<slug>/audio-status -> { status, progresso, total }
export const dynamic = "force-dynamic";

export async function GET(_req: NextRequest, ctx: { params: Promise<{ slug: string }> }) {
  const { slug } = await ctx.params;
  const curso = await getCursoBySlug(slug);
  if (!curso) return NextResponse.json({ erro: "curso não encontrado" }, { status: 404 });
  return NextResponse.json({
    status: curso.audio_status ?? "nenhum",
    progresso: curso.audio_progresso ?? 0,
    total: curso.audio_total ?? 0,
  });
}
