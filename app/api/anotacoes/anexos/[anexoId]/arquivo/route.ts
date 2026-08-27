import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { getAnexo, urlDoArquivo } from "@/lib/anotacoes-anexos";

type Ctx = { params: Promise<{ anexoId: string }> };

// Endereço estável do arquivo: /api/anotacoes/anexos/{id}/arquivo
//
// O link assinado do storage expira, então não serve para ficar dentro do
// texto de uma anotação (a imagem quebraria dias depois). Esta rota confere
// a sessão a cada acesso e só então redireciona para o link temporário —
// assim o endereço no HTML nunca muda e o arquivo continua privado.
export async function GET(_req: Request, { params }: Ctx) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  const { anexoId } = await params;

  const anexo = await getAnexo(anexoId, session.userId);
  if (!anexo) {
    return NextResponse.json({ ok: false, erro: "não encontrado" }, { status: 404 });
  }

  const url = await urlDoArquivo(anexo.caminho);
  if (!url) {
    return NextResponse.json({ ok: false, erro: "arquivo indisponível" }, { status: 502 });
  }
  return NextResponse.redirect(url);
}
