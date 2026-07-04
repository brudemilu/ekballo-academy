// Camada de armazenamento OFFLINE (client-only). Guarda no IndexedDB:
//  - store "livros": texto de todas as aulas + capa (blob) + metadados
//  - store "audios": os MP3 da narração (um blob por aula), tocados via object URL
// Tudo funciona sem internet depois de baixado. Pede storage persistente pra não
// ser despejado sob pressão de espaço.

const DB_NOME = "ekballo-offline";
const DB_VERSAO = 1;

export type AulaOffline = {
  ordem: number;
  titulo: string;
  conteudo: string;
  temAudio: boolean;
  perguntas: { ordem: number; pergunta: string }[];
};

export type LivroOffline = {
  slug: string;
  titulo: string;
  capaBlob: Blob | null;
  aulas: AulaOffline[];
  baixadoEm: number;
  tamanhoBytes: number;
};

function abrir(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    const req = indexedDB.open(DB_NOME, DB_VERSAO);
    req.onupgradeneeded = () => {
      const db = req.result;
      if (!db.objectStoreNames.contains("livros")) {
        db.createObjectStore("livros", { keyPath: "slug" });
      }
      if (!db.objectStoreNames.contains("audios")) {
        db.createObjectStore("audios", { keyPath: "id" });
      }
    };
    req.onsuccess = () => resolve(req.result);
    req.onerror = () => reject(req.error);
  });
}

function tx<T>(
  store: string,
  modo: IDBTransactionMode,
  fn: (s: IDBObjectStore) => IDBRequest<T>
): Promise<T> {
  return abrir().then(
    (db) =>
      new Promise<T>((resolve, reject) => {
        const t = db.transaction(store, modo);
        const req = fn(t.objectStore(store));
        req.onsuccess = () => resolve(req.result);
        req.onerror = () => reject(req.error);
        t.oncomplete = () => db.close();
      })
  );
}

const audioId = (slug: string, ordem: number) => `${slug}#${ordem}`;

export async function getLivro(slug: string): Promise<LivroOffline | undefined> {
  return tx("livros", "readonly", (s) => s.get(slug));
}

export async function listarLivros(): Promise<LivroOffline[]> {
  const todos = await tx<LivroOffline[]>("livros", "readonly", (s) => s.getAll());
  return (todos || []).sort((a, b) => b.baixadoEm - a.baixadoEm);
}

export async function removerLivro(slug: string): Promise<void> {
  const livro = await getLivro(slug);
  await tx("livros", "readwrite", (s) => s.delete(slug));
  if (livro) {
    for (const a of livro.aulas) {
      await tx("audios", "readwrite", (s) => s.delete(audioId(slug, a.ordem))).catch(() => {});
    }
  }
}

export async function getAudioBlob(slug: string, ordem: number): Promise<Blob | null> {
  const r = await tx<{ id: string; blob: Blob } | undefined>("audios", "readonly", (s) =>
    s.get(audioId(slug, ordem))
  );
  return r?.blob ?? null;
}

export async function espacoUsado(): Promise<{ usadoMB: number; totalMB: number } | null> {
  if (!("storage" in navigator) || !navigator.storage.estimate) return null;
  const est = await navigator.storage.estimate();
  return {
    usadoMB: Math.round((est.usage || 0) / 1048576),
    totalMB: Math.round((est.quota || 0) / 1048576),
  };
}

type PacoteApi = {
  slug: string;
  titulo: string;
  capaUrl: string;
  aulas: {
    ordem: number;
    titulo: string;
    conteudo: string;
    audioUrl: string | null;
    perguntas: { ordem: number; pergunta: string }[];
  }[];
};

// Baixa um curso inteiro (texto + capa + narração) pro IndexedDB.
// onProgress recebe (feito, total) contando capa + cada MP3.
export async function baixarCurso(
  slug: string,
  onProgress?: (feito: number, total: number) => void
): Promise<void> {
  // Storage persistente: evita o navegador despejar os downloads.
  try {
    if (navigator.storage?.persist) await navigator.storage.persist();
  } catch {
    /* segue mesmo assim */
  }

  const res = await fetch(`/api/curso/${slug}/pacote-offline`, { cache: "no-store" });
  if (!res.ok) throw new Error(`Falha ao baixar o pacote (${res.status})`);
  const pacote: PacoteApi = await res.json();

  const comAudio = pacote.aulas.filter((a) => a.audioUrl);
  const total = comAudio.length + 1; // +1 = capa
  let feito = 0;
  const passo = () => onProgress?.(++feito, total);

  // Capa
  let capaBlob: Blob | null = null;
  try {
    const c = await fetch(pacote.capaUrl, { cache: "no-store" });
    if (c.ok) capaBlob = await c.blob();
  } catch {
    /* capa é opcional */
  }
  passo();

  // Áudios
  let tamanho = capaBlob?.size ?? 0;
  for (const a of comAudio) {
    try {
      const r = await fetch(a.audioUrl!, { cache: "no-store" });
      if (r.ok) {
        const blob = await r.blob();
        tamanho += blob.size;
        await tx("audios", "readwrite", (s) => s.put({ id: audioId(slug, a.ordem), blob }));
      }
    } catch {
      /* uma aula sem áudio não impede o resto */
    }
    passo();
  }

  const livro: LivroOffline = {
    slug: pacote.slug,
    titulo: pacote.titulo,
    capaBlob,
    aulas: pacote.aulas.map((a) => ({
      ordem: a.ordem,
      titulo: a.titulo,
      conteudo: a.conteudo,
      temAudio: !!a.audioUrl,
      perguntas: a.perguntas,
    })),
    baixadoEm: Date.now(),
    tamanhoBytes: tamanho,
  };
  await tx("livros", "readwrite", (s) => s.put(livro));
}
