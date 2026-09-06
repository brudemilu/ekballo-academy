// =============================================================
// EKBALLO ACADEMY · Modo de visão (servidor)
// Lê o cookie que diz se o master está olhando a plataforma pelos
// olhos de um discípulo. Ver a nota em lib/permissoes.ts.
// =============================================================

import { cookies } from "next/headers";
import { COOKIE_VISAO, VISAO_ALUNO } from "@/lib/permissoes";

export async function visaoAlunoAtiva(): Promise<boolean> {
  try {
    const store = await cookies();
    return store.get(COOKIE_VISAO)?.value === VISAO_ALUNO;
  } catch {
    // Fora de um contexto de request (render estático, build): visão normal.
    return false;
  }
}
