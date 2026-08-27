// =============================================================
// EKBALLO ACADEMY · Anexos — tipos, limites e helpers
//
// Isomorfo de propósito: o componente de upload ("use client") precisa dos
// mesmos limites e rótulos que o servidor usa. O acesso a dados fica em
// lib/anotacoes-anexos.ts, que importa Supabase e só roda no servidor.
// =============================================================

export const BUCKET_ANEXOS = "anotacoes";
export const TAMANHO_MAX = 30 * 1024 * 1024; // 30 MB — igual ao limite do bucket

export type Anexo = {
  id: string;
  anotacao_id: string;
  aluno_id: string;
  nome: string;
  caminho: string;
  tipo: string;
  tamanho: number;
  criado_em: string;
};

// Tipos aceitos. Espelha `allowed_mime_types` do bucket (migration 233): o
// banco é quem barra de verdade, isto aqui é para avisar antes de subir.
export const TIPOS_ACEITOS = [
  "image/jpeg", "image/png", "image/webp", "image/gif", "image/heic", "image/heif",
  "application/pdf", "text/plain", "text/markdown", "text/csv",
  "application/vnd.ms-powerpoint",
  "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  "application/vnd.oasis.opendocument.presentation",
  "application/msword",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  "application/vnd.oasis.opendocument.text",
  "application/vnd.ms-excel",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  "audio/mpeg", "audio/mp4", "audio/x-m4a", "audio/ogg", "audio/wav",
];

export function ehImagem(tipo: string): boolean {
  return tipo.startsWith("image/");
}

/** Rótulo curto por tipo, para o ícone do anexo na lista. */
export function familiaDoTipo(tipo: string): "imagem" | "pdf" | "slide" | "texto" | "audio" | "outro" {
  if (tipo.startsWith("image/")) return "imagem";
  if (tipo === "application/pdf") return "pdf";
  if (tipo.includes("presentation") || tipo.includes("powerpoint")) return "slide";
  if (tipo.startsWith("audio/")) return "audio";
  if (tipo.startsWith("text/") || tipo.includes("word") || tipo.includes("sheet") || tipo.includes("excel")) {
    return "texto";
  }
  return "outro";
}

/** "2,4 MB" — tamanho como a pessoa lê. */
export function tamanhoLegivel(bytes: number): string {
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${Math.round(bytes / 1024)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(1).replace(".", ",")} MB`;
}
