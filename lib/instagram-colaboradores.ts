/**
 * Colaboradores de um post do Instagram (issue #256).
 *
 * O post sai no perfil do pastor e o convidado recebe um convite; quando
 * aceita, o post aparece também no perfil dele. A API aceita até 3 perfis, em
 * imagem única, carrossel e Reel — story não.
 *
 * Aqui fica só a parte pura: ler os perfis de onde quer que venham (campo do
 * painel, mensagem do WhatsApp, coluna do banco) e devolver nomes de usuário
 * limpos. Testado em testes/instagram-colaboradores.test.ts.
 */

export const MAX_COLABORADORES = 3;

// Nome de usuário do Instagram: letras, números, ponto e sublinhado, até 30.
const RE_USUARIO = /^[a-z0-9._]{1,30}$/;

/**
 * Lista de perfis, sem "@", em minúsculas, sem repetição, no máximo 3.
 * Aceita texto ("@joao, @maria"), link do perfil ou lista. O que não tem cara
 * de nome de usuário é descartado — mandar lixo para a API derruba o convite.
 */
export function normalizarColaboradores(valor: unknown): string[] {
  const pedacos = Array.isArray(valor)
    ? valor.map((v) => (typeof v === "string" ? v : ""))
    : typeof valor === "string"
      ? valor.split(/[\s,;]+/)
      : [];
  const vistos = new Set<string>();
  for (const bruto of pedacos) {
    const nome = bruto
      .trim()
      .replace(/^https?:\/\/(?:www\.)?instagram\.com\//i, "")
      .replace(/[/?#].*$/, "")
      .replace(/^@+/, "")
      .replace(/[.,;:!]+$/, "")
      .toLowerCase();
    if (RE_USUARIO.test(nome) && !/^\.|\.$/.test(nome)) vistos.add(nome);
    if (vistos.size >= MAX_COLABORADORES) break;
  }
  return [...vistos];
}

/** Tira acento e caixa. */
function plano(t: string): string {
  return t.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase().trim();
}

// "colaborar com @fulano", "colaboração @a e @b", "collab @x"
const RE_COLABORAR = /^(?:colabor\w*|collab\w*|colab)(?![a-z])/;
// "sem colaboração", "tirar colaborador", "remover a colaboração"
const RE_SEM =
  /^(?:sem|tir\w+|remov\w+|cancel\w+)\s+(?:a\s+|o\s+|os\s+)?(?:colabor\w*|collab\w*)/;

/**
 * Lê um pedido de colaboração vindo do WhatsApp. Devolve os perfis (lista
 * vazia = tirar a colaboração) ou null quando a mensagem não é sobre isso.
 * Só os trechos com "@" contam: "colaborar com a igreja" não vira convite.
 */
export function interpretarColaboracao(dito: string): string[] | null {
  const t = plano(dito || "");
  if (RE_SEM.test(t)) return [];
  if (!RE_COLABORAR.test(t)) return null;
  const arrobas = (dito.match(/@[A-Za-z0-9._]+/g) ?? []).join(" ");
  if (!arrobas) return null;
  return normalizarColaboradores(arrobas);
}

/** "@a, @b" — para mostrar na tela e nas respostas do robô. */
export function comArroba(perfis: string[]): string {
  return perfis.map((p) => `@${p}`).join(", ");
}
