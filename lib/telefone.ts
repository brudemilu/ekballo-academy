// =============================================================
// EKBALLO ACADEMY · Formatação/normalização de telefone BR
// Armazenamos sempre como dígitos com prefixo 55 (E.164 sem +),
// ex.: "5511999998888". A UI exibe "(11) 99999-8888".
// =============================================================

// Mantém só os dígitos
function digits(s: string): string {
  return (s || "").replace(/\D+/g, "");
}

// Recebe a entrada do usuário e devolve a versão formatada
// para exibição em tempo real no input:
//   "" → ""
//   "1"          → "(1"
//   "11"         → "(11) "
//   "11999"      → "(11) 999"
//   "11999998"   → "(11) 99999-8"      (celular 9 dígitos)
//   "1199998888" → "(11) 9999-8888"    (fixo 8 dígitos)
//   "11999998888"→ "(11) 99999-8888"
export function formatTelefoneBR(input: string): string {
  let d = digits(input);
  // Tira o "55" se o usuário começou com ele
  if (d.startsWith("55") && d.length > 11) d = d.slice(2);
  d = d.slice(0, 11);
  if (d.length === 0) return "";
  if (d.length <= 2) return `(${d}`;
  if (d.length <= 6) return `(${d.slice(0, 2)}) ${d.slice(2)}`;
  if (d.length <= 10) {
    // 8 dígitos depois do DDD (fixo)
    return `(${d.slice(0, 2)}) ${d.slice(2, 6)}-${d.slice(6)}`;
  }
  // 9 dígitos depois do DDD (celular)
  return `(${d.slice(0, 2)}) ${d.slice(2, 7)}-${d.slice(7)}`;
}

// Recebe o que tá no input e devolve o valor a ser persistido no banco.
// - Aceita celular (11 dígitos) ou fixo (10 dígitos) brasileiro
// - Sempre devolve com prefixo 55 (ex.: "5511999998888")
// - Devolve null se inválido
export function normalizeTelefoneBR(input: string): string | null {
  let d = digits(input);
  if (d.startsWith("55") && (d.length === 12 || d.length === 13)) {
    d = d.slice(2);
  }
  if (d.length !== 10 && d.length !== 11) return null;
  return `55${d}`;
}

// Formata o valor armazenado pra exibição "(11) 99999-8888"
export function displayTelefone(stored: string | null | undefined): string {
  if (!stored) return "";
  return formatTelefoneBR(stored);
}
