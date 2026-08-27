"use client";

// =============================================================
// EKBALLO ACADEMY · Anexos da anotação
//
// PDF e slide da aula, foto do quadro, gravação — guardados junto do texto.
//
// O arquivo vai do navegador DIRETO para o storage: um slide de 20 MB
// passando por dentro do Next só somaria um salto e esbarraria no limite de
// corpo da requisição. Depois de subir, avisamos o servidor para registrar o
// anexo. A pasta de destino começa com o id do dono, e é isso que a policy
// do bucket confere — ninguém escreve na pasta de outro.
// =============================================================

import { useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import {
  TIPOS_ACEITOS,
  TAMANHO_MAX,
  tamanhoLegivel,
  familiaDoTipo,
  ehImagem,
  type Anexo,
} from "@/lib/anexos-meta";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";
const BUCKET = "anotacoes";

const ICONE: Record<string, string> = {
  imagem: "🖼️",
  pdf: "📕",
  slide: "📊",
  texto: "📄",
  audio: "🎧",
  outro: "📎",
};

/** "Aula 3: perspectivas.pdf" → "aula-3-perspectivas.pdf" */
function nomeSeguro(nome: string): string {
  const ponto = nome.lastIndexOf(".");
  const base = (ponto > 0 ? nome.slice(0, ponto) : nome)
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-zA-Z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .toLowerCase()
    .slice(0, 60) || "arquivo";
  const ext = (ponto > 0 ? nome.slice(ponto + 1) : "")
    .replace(/[^a-zA-Z0-9]/g, "")
    .toLowerCase()
    .slice(0, 8);
  return ext ? `${base}.${ext}` : base;
}

export function AnexosAnotacao({
  anotacaoId,
  alunoId,
  anexosIniciais,
  onInserirNoTexto,
}: {
  anotacaoId: string;
  alunoId: string;
  anexosIniciais: Anexo[];
  /** Imagens podem ir para dentro do texto, no ponto do cursor. */
  onInserirNoTexto?: (html: string) => void;
}) {
  const [anexos, setAnexos] = useState<Anexo[]>(anexosIniciais);
  const [enviando, setEnviando] = useState<string | null>(null);
  const [erro, setErro] = useState<string | null>(null);
  const [arrastando, setArrastando] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  async function enviarArquivo(arquivo: File) {
    setErro(null);

    if (arquivo.size > TAMANHO_MAX) {
      setErro(`"${arquivo.name}" tem ${tamanhoLegivel(arquivo.size)} — o limite é ${tamanhoLegivel(TAMANHO_MAX)}.`);
      return;
    }
    if (arquivo.type && !TIPOS_ACEITOS.includes(arquivo.type)) {
      setErro(`Tipo não aceito (${arquivo.type || "desconhecido"}). Vale imagem, PDF, slide, texto e áudio.`);
      return;
    }

    setEnviando(arquivo.name);
    try {
      const caminho = `${alunoId}/${anotacaoId}/${crypto.randomUUID()}-${nomeSeguro(arquivo.name)}`;

      if (!MOCK) {
        const supabase = createClient();
        const { error } = await supabase.storage
          .from(BUCKET)
          .upload(caminho, arquivo, {
            contentType: arquivo.type || "application/octet-stream",
            upsert: false,
          });
        if (error) throw new Error(error.message);
      }

      const res = await fetch(`/api/anotacoes/${anotacaoId}/anexos`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          nome: arquivo.name,
          caminho,
          tipo: arquivo.type || "application/octet-stream",
          tamanho: arquivo.size,
        }),
      });
      if (!res.ok) throw new Error(`registro falhou (${res.status})`);
      const { anexo } = (await res.json()) as { anexo: Anexo };
      setAnexos((lista) => [...lista, anexo]);
    } catch (e) {
      setErro(`Não consegui anexar "${arquivo.name}": ${(e as Error).message}`);
    } finally {
      setEnviando(null);
    }
  }

  async function enviarVarios(lista: FileList | File[]) {
    for (const arquivo of Array.from(lista)) {
      await enviarArquivo(arquivo);
    }
    if (inputRef.current) inputRef.current.value = "";
  }

  async function excluir(anexo: Anexo) {
    const res = await fetch(`/api/anotacoes/anexos/${anexo.id}`, { method: "DELETE" });
    if (res.ok) setAnexos((lista) => lista.filter((a) => a.id !== anexo.id));
  }

  function inserirImagem(anexo: Anexo) {
    onInserirNoTexto?.(
      `<p><img src="/api/anotacoes/anexos/${anexo.id}/arquivo" alt="${anexo.nome.replace(/[<>&"]/g, "")}"></p>`,
    );
  }

  return (
    <div>
      {/* Área de soltar */}
      <div
        onDragOver={(e) => {
          e.preventDefault();
          setArrastando(true);
        }}
        onDragLeave={() => setArrastando(false)}
        onDrop={(e) => {
          e.preventDefault();
          setArrastando(false);
          if (e.dataTransfer.files?.length) void enviarVarios(e.dataTransfer.files);
        }}
        onClick={() => inputRef.current?.click()}
        className={`mb-2 cursor-pointer rounded-lg border-2 border-dashed px-3 py-3 text-center transition ${
          arrastando
            ? "border-laranja-400 bg-laranja-50"
            : "border-mesa-300 hover:border-laranja-300 hover:bg-laranja-50/40"
        }`}
      >
        <p className="text-[11px] font-medium text-mesa-600">
          {enviando ? `Enviando ${enviando}…` : "📎 Anexar arquivo"}
        </p>
        <p className="mt-0.5 text-[10px] leading-relaxed text-mesa-400">
          PDF, slide, foto, áudio — até {tamanhoLegivel(TAMANHO_MAX)}. Arraste ou clique.
        </p>
      </div>

      <input
        ref={inputRef}
        type="file"
        multiple
        accept={TIPOS_ACEITOS.join(",")}
        onChange={(e) => e.target.files && void enviarVarios(e.target.files)}
        className="hidden"
      />

      {erro && (
        <p className="mb-2 rounded-lg bg-erro-50 px-2 py-1.5 text-[10px] leading-relaxed text-erro-600">
          {erro}
        </p>
      )}

      {anexos.length === 0 ? (
        <p className="px-1 text-[10px] leading-relaxed text-mesa-400">
          Nenhum arquivo ainda. O material da aula fica guardado aqui, junto da
          anotação.
        </p>
      ) : (
        <ul className="space-y-1.5">
          {anexos.map((anexo) => {
            const familia = familiaDoTipo(anexo.tipo);
            return (
              <li
                key={anexo.id}
                className="group rounded-lg border border-mesa-200 bg-white p-2"
              >
                <div className="flex items-start gap-2">
                  <span className="flex-none text-sm">{ICONE[familia]}</span>
                  <div className="min-w-0 flex-1">
                    <a
                      href={`/api/anotacoes/anexos/${anexo.id}/arquivo`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="block truncate text-[11px] font-medium text-mesa-800 hover:text-laranja-600"
                      title={anexo.nome}
                    >
                      {anexo.nome}
                    </a>
                    <p className="text-[10px] text-mesa-400">
                      {tamanhoLegivel(anexo.tamanho)}
                    </p>
                  </div>
                  <span className="flex flex-none items-center gap-0.5">
                    {ehImagem(anexo.tipo) && onInserirNoTexto && (
                      <button
                        onClick={() => inserirImagem(anexo)}
                        title="Colocar a imagem dentro do texto"
                        className="rounded px-1 text-[11px] text-mesa-500 hover:bg-laranja-50 hover:text-laranja-700"
                      >
                        ＋
                      </button>
                    )}
                    <button
                      onClick={() => excluir(anexo)}
                      title="Remover anexo"
                      className="rounded px-1 text-[11px] text-mesa-400 hover:bg-erro-50 hover:text-erro-500"
                    >
                      ✕
                    </button>
                  </span>
                </div>

                {/* Miniatura: com foto, o nome do arquivo não diz nada */}
                {ehImagem(anexo.tipo) && (
                  // eslint-disable-next-line @next/next/no-img-element
                  <img
                    src={`/api/anotacoes/anexos/${anexo.id}/arquivo`}
                    alt={anexo.nome}
                    loading="lazy"
                    className="mt-1.5 max-h-28 w-full rounded border border-mesa-200 object-cover"
                  />
                )}
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}
