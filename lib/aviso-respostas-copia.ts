import { normalizeTelefoneBR } from "@/lib/telefone";

// =============================================================
// QUEM RECEBE EM CÓPIA O AVISO DE RESPOSTA
//
// O aviso de "Miguel/Luiza respondeu" tem um destino principal (o líder)
// e pode ter outros telefones em cópia — quem acompanha junto.
//
// Os números vêm da env AVISO_RESPOSTAS_COPIA e NUNCA do código: este
// repositório é público, e telefone de gente não é coisa de se publicar.
// =============================================================

/**
 * Lê a lista da env e devolve os telefones prontos para o envio
 * ("5531999998888"), sem repetição e sem o destino principal.
 *
 * Separa por vírgula, ponto e vírgula ou quebra de linha — NÃO por espaço,
 * para aceitar o número do jeito que se escreve: "(31) 99999-8888".
 * Entrada que não é telefone brasileiro válido é descartada: mandar para
 * número torto não dá erro, dá mensagem que nunca chega.
 */
export function telefonesEmCopia(
  bruto: string | undefined | null,
  principal?: string | null,
): string[] {
  const doPrincipal = normalizeTelefoneBR(principal || "") || (principal || "").trim();
  const vistos = new Set<string>();
  for (const pedaco of (bruto || "").split(/[,;\n]+/)) {
    const tel = normalizeTelefoneBR(pedaco);
    if (!tel || tel === doPrincipal) continue;
    vistos.add(tel);
  }
  return [...vistos];
}
