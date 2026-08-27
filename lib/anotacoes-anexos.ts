// =============================================================
// EKBALLO ACADEMY · Anexos das anotações (server-side)
//
// O binário mora no bucket privado "anotacoes"; aqui ficam os metadados e as
// operações. O upload em si acontece no navegador, direto para o storage
// (ver components/AnexosAnotacao.tsx): passar um slide de 20 MB por dentro do
// Next só adicionaria um salto e um limite de payload no caminho.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";
import {
  BUCKET_ANEXOS,
  TAMANHO_MAX,
  TIPOS_ACEITOS,
  type Anexo,
} from "@/lib/anexos-meta";

export {
  BUCKET_ANEXOS,
  TAMANHO_MAX,
  TIPOS_ACEITOS,
  ehImagem,
  familiaDoTipo,
  tamanhoLegivel,
} from "@/lib/anexos-meta";
export type { Anexo } from "@/lib/anexos-meta";

// -------- Mock --------

const mockStore = ((globalThis as unknown as { __ekballoAnexos?: Anexo[] })
  .__ekballoAnexos ??= []);

// -------- Leitura --------

export async function listAnexos(
  anotacaoId: string,
  alunoId: string,
): Promise<Anexo[]> {
  if (isMockMode()) {
    return mockStore.filter(
      (a) => a.anotacao_id === anotacaoId && a.aluno_id === alunoId,
    );
  }
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacao_anexos")
    .select("*")
    .eq("anotacao_id", anotacaoId)
    .eq("aluno_id", alunoId)
    .order("criado_em", { ascending: true });
  if (error) {
    console.error("[anexos] listAnexos:", error.message);
    return [];
  }
  return (data || []) as Anexo[];
}

export async function getAnexo(id: string, alunoId: string): Promise<Anexo | null> {
  if (isMockMode()) {
    return mockStore.find((a) => a.id === id && a.aluno_id === alunoId) ?? null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("anotacao_anexos")
    .select("*")
    .eq("id", id)
    .eq("aluno_id", alunoId)
    .maybeSingle();
  return (data as Anexo) ?? null;
}

/**
 * Link temporário para o arquivo. Usado pela rota que serve o anexo — o
 * navegador nunca recebe o caminho do bucket, só o nosso endereço.
 */
export async function urlDoArquivo(
  caminho: string,
  segundos = 60 * 60,
): Promise<string | null> {
  if (isMockMode()) return null;
  const supabase = await createClient();
  const { data, error } = await supabase.storage
    .from(BUCKET_ANEXOS)
    .createSignedUrl(caminho, segundos);
  if (error) {
    console.error("[anexos] urlDoArquivo:", error.message);
    return null;
  }
  return data?.signedUrl ?? null;
}

// -------- Escrita --------

/**
 * Registra o anexo depois que o navegador subiu o arquivo. O caminho é
 * conferido contra o dono: mesmo que alguém forje a chamada, não consegue
 * apontar para a pasta de outra pessoa.
 */
export async function registrarAnexo(
  alunoId: string,
  entrada: {
    anotacao_id: string;
    nome: string;
    caminho: string;
    tipo: string;
    tamanho: number;
  },
): Promise<Anexo | null> {
  if (!entrada.caminho.startsWith(`${alunoId}/`)) {
    console.error("[anexos] caminho fora da pasta do dono:", entrada.caminho);
    return null;
  }
  if (entrada.tamanho > TAMANHO_MAX) return null;

  const linha = {
    aluno_id: alunoId,
    anotacao_id: entrada.anotacao_id,
    nome: String(entrada.nome).slice(0, 300),
    caminho: entrada.caminho,
    tipo: TIPOS_ACEITOS.includes(entrada.tipo) ? entrada.tipo : "application/octet-stream",
    tamanho: Math.max(0, Math.floor(entrada.tamanho)),
  };

  if (isMockMode()) {
    const novo: Anexo = {
      id: `mock-anexo-${mockStore.length + 1}`,
      criado_em: new Date().toISOString(),
      ...linha,
    };
    mockStore.push(novo);
    return novo;
  }

  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacao_anexos")
    .insert(linha)
    .select("*")
    .single();
  if (error) {
    console.error("[anexos] registrarAnexo:", error.message);
    return null;
  }
  return data as Anexo;
}

/** Apaga o registro E o arquivo — anexo órfão no bucket só ocupa espaço. */
export async function excluirAnexo(id: string, alunoId: string): Promise<boolean> {
  const anexo = await getAnexo(id, alunoId);
  if (!anexo) return false;

  if (isMockMode()) {
    const i = mockStore.findIndex((a) => a.id === id);
    if (i >= 0) mockStore.splice(i, 1);
    return true;
  }

  const supabase = await createClient();
  const { error: erroArquivo } = await supabase.storage
    .from(BUCKET_ANEXOS)
    .remove([anexo.caminho]);
  if (erroArquivo) {
    // Segue mesmo assim: o registro é o que a tela mostra; arquivo solto no
    // bucket é desperdício, não defeito visível.
    console.error("[anexos] remover arquivo:", erroArquivo.message);
  }
  const { error } = await supabase
    .from("anotacao_anexos")
    .delete()
    .eq("id", id)
    .eq("aluno_id", alunoId);
  if (error) {
    console.error("[anexos] excluirAnexo:", error.message);
    return false;
  }
  return true;
}

/**
 * Limpa os arquivos de uma anotação que vai ser apagada de vez. A linha da
 * tabela cai sozinha (cascade), mas o binário no bucket não.
 */
export async function excluirAnexosDaAnotacao(
  anotacaoId: string,
  alunoId: string,
): Promise<number> {
  const anexos = await listAnexos(anotacaoId, alunoId);
  if (anexos.length === 0) return 0;

  if (isMockMode()) {
    for (const a of anexos) {
      const i = mockStore.indexOf(a);
      if (i >= 0) mockStore.splice(i, 1);
    }
    return anexos.length;
  }

  const supabase = await createClient();
  const { error } = await supabase.storage
    .from(BUCKET_ANEXOS)
    .remove(anexos.map((a) => a.caminho));
  if (error) console.error("[anexos] limpar bucket:", error.message);
  return anexos.length;
}
