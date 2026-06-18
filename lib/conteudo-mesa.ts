// Parser do conteúdo de uma mesa (aula) em blocos, pro Modo Leitura.
// Espelha a lógica do componente AulaConteudo (split por "\n\n", "[cite] "
// vira citação, "[quadro]" vira tabela, linha em CAIXA ALTA vira título),
// mas devolve uma lista plana de blocos — ideal tanto pra rolagem quanto
// pra paginação em folhas.

export type BlocoMesa =
  | { tipo: "titulo"; texto: string }
  | { tipo: "paragrafo"; texto: string; lista: boolean }
  | { tipo: "cite"; texto: string }
  | { tipo: "quadro"; texto: string };

// Linha em CAIXA ALTA, curta, sem minúsculas → título de seção.
function ehTitulo(linha: string): boolean {
  const t = linha.trim();
  if (t.length < 2 || t.length > 70) return false;
  if (t.startsWith("•")) return false;
  if (/[a-zàáâãäçéêëíîïóôõöúûü]/.test(t)) return false;
  if (!/[A-ZÀÁÂÃÄÇÉÊËÍÎÏÓÔÕÖÚÛÜ]/.test(t)) return false;
  return true;
}

export function parseMesa(conteudo: string): BlocoMesa[] {
  const blocos: BlocoMesa[] = [];

  for (const bruto of conteudo.split("\n\n")) {
    const p = bruto.trim();
    if (!p) continue;

    if (p.startsWith("[cite] ")) {
      blocos.push({ tipo: "cite", texto: p.slice(7).trim() });
      continue;
    }
    if (/^\[quadro\]/i.test(p)) {
      blocos.push({ tipo: "quadro", texto: p });
      continue;
    }

    // Separa linhas-título (CAIXA ALTA) das linhas de prosa.
    let buffer: string[] = [];
    const flush = () => {
      if (!buffer.length) return;
      const temBullet = buffer.some((l) => l.trim().startsWith("•"));
      const txt = buffer.join("\n");
      blocos.push({
        tipo: "paragrafo",
        // Prosa contínua: junta as quebras de linha do PDF num fluxo só
        // (deixa reflowar bonito nas colunas). Listas (•) preservam as quebras.
        texto: temBullet
          ? txt.trim()
          : txt.replace(/\s*\n\s*/g, " ").replace(/\s{2,}/g, " ").trim(),
        lista: temBullet,
      });
      buffer = [];
    };

    for (const linha of bruto.split("\n")) {
      if (ehTitulo(linha)) {
        flush();
        blocos.push({ tipo: "titulo", texto: linha.trim() });
      } else {
        buffer.push(linha);
      }
    }
    flush();
  }

  return blocos;
}
