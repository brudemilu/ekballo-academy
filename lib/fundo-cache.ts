/**
 * Guarda no Storage os fundos gerados por IA, para o mesmo (prompt, seed)
 * devolver sempre a MESMA imagem sem gerar de novo.
 *
 * Antes o único cache era um Map em memória: sumia a cada reinício do app, e
 * abrir um rascunho antigo regerava (e gastava cota de) todos os fundos — às
 * vezes com outro resultado, porque o modelo de reserva não aceita seed.
 *
 * Sem service role (modo mock, dev sem chave) cai de volta só na memória.
 */
import { gerarFundoLivre } from "@/lib/instagram";
import { createServiceClient } from "@/lib/supabase/service";

const BUCKET = "instagram";
// v2: fundos do FLUX.2 em 4:5. Mudar o prefixo invalida o cache inteiro — é o
// que se quer quando o modelo ou o estilo-base mudam.
const PREFIXO = "fundos/v2";

const memoria = new Map<string, string>();
const MEMORIA_MAX = 120;

function lembrar(chave: string, valor: string) {
  memoria.set(chave, valor);
  if (memoria.size > MEMORIA_MAX) {
    const maisAntiga = memoria.keys().next().value;
    if (maisAntiga !== undefined) memoria.delete(maisAntiga);
  }
}

/** Caminho estável do fundo no bucket: hash de (prompt, seed). */
export async function caminhoDoFundo(prompt: string, seed: number): Promise<string> {
  const dados = new TextEncoder().encode(`${prompt.trim()}|${seed}`);
  const hash = await crypto.subtle.digest("SHA-256", dados);
  const hex = Array.from(new Uint8Array(hash).slice(0, 16))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
  return `${PREFIXO}/${hex}.jpg`;
}

function bytesDeDataUrl(dataUrl: string): Uint8Array {
  const bin = atob(dataUrl.split(",")[1] || "");
  const bytes = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
  return bytes;
}

/**
 * Devolve a imagem de fundo para (prompt, seed): URL pública do Storage quando
 * dá para guardar, data URL quando não dá, null se a geração falhou.
 */
export async function obterFundo(prompt: string, seed: number): Promise<string | null> {
  const chave = `${prompt.trim()}|${seed}`;
  const emMemoria = memoria.get(chave);
  if (emMemoria) return emMemoria;

  let storage: ReturnType<
    ReturnType<typeof createServiceClient>["storage"]["from"]
  > | null = null;
  let caminho = "";
  try {
    storage = createServiceClient().storage.from(BUCKET);
    caminho = await caminhoDoFundo(prompt, seed);
    const url = storage.getPublicUrl(caminho).data.publicUrl;
    const existe = await fetch(url, {
      method: "HEAD",
      signal: AbortSignal.timeout(8_000),
    });
    if (existe.ok) {
      lembrar(chave, url);
      return url;
    }
  } catch {
    storage = null; // sem Storage: segue só com a memória
  }

  const gerado = await gerarFundoLivre(prompt, seed);
  if (!gerado) return null;

  if (storage) {
    try {
      const { error } = await storage.upload(caminho, bytesDeDataUrl(gerado), {
        contentType: "image/jpeg",
        upsert: true,
      });
      if (!error) {
        const url = storage.getPublicUrl(caminho).data.publicUrl;
        lembrar(chave, url);
        return url;
      }
    } catch {
      // falhou ao guardar: ainda serve a imagem desta vez
    }
  }
  lembrar(chave, gerado);
  return gerado;
}
