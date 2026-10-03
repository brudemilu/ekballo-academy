import type { NextConfig } from "next";

// Identidade do build: o SHA do commit no Vercel (ou "dev" em local). Embutido no
// bundle do cliente (NEXT_PUBLIC_BUILD_ID) e lido em runtime por /api/version —
// o UpdatePrompt compara os dois pra detectar um deploy novo e oferecer atualizar.
// APP_BUILD_ID: id de build injetado no Docker/self-hosted (Contabo). Vercel usa
// o SHA do commit. Sem nenhum dos dois (local), fica "dev".
const buildId = process.env.APP_BUILD_ID ?? process.env.VERCEL_GIT_COMMIT_SHA ?? "dev";

const nextConfig: NextConfig = {
  typedRoutes: false,
  // Gera um servidor Node autocontido para a imagem Docker/Portainer.
  output: "standalone",
  env: {
    NEXT_PUBLIC_BUILD_ID: buildId,
  },
  // ffmpeg-static: não bundlar (mantém o caminho real do binário em node_modules)
  // msedge-tts: TTS do áudio de leitura — externo p/ o tracing incluir no standalone.
  serverExternalPackages: ["ffmpeg-static", "msedge-tts"],
  // e garante que o binário/lib entre no deploy da função de render.
  outputFileTracingIncludes: {
    "/api/admin/instagram/reel-gerar": ["./node_modules/ffmpeg-static/**"],
    // Cortes de pregação: o ffmpeg reduz o áudio antes da transcrição.
    "/api/admin/instagram/cortes": ["./node_modules/ffmpeg-static/**"],
    "/api/cron/gerar-audio-tick": [
      "./node_modules/msedge-tts/**",
      "./node_modules/ws/**",
    ],
  },
  // Capas dos livros: o padrão do Next para arquivos de public/ é
  // `max-age=0`, conservador porque ele não sabe o que muda e o que não muda.
  // Para as capas isso sai caro: com a Cloudflare na frente, `max-age=0` faz o
  // edge revalidar contra o box (em Paris) a cada visita — `cf-cache-status:
  // REVALIDATED` em vez de `HIT`. São 253 capas na estante; é viagem de ida e
  // volta que não precisava existir.
  //
  // Um dia de frescor, e mais trinta servindo a cópia velha enquanto atualiza
  // por baixo. O `stale-while-revalidate` é o que torna isso seguro sem nome de
  // arquivo versionado: capa trocada aparece sozinha na visita seguinte, sem
  // depender de purge manual no painel. Quem precisar do efeito imediato
  // (trocou a capa errada, por exemplo) purga pela Cloudflare.
  async headers() {
    return [
      {
        source: "/capas/:arquivo*",
        headers: [
          {
            key: "Cache-Control",
            value: "public, max-age=86400, stale-while-revalidate=2592000",
          },
        ],
      },
    ];
  },
};

export default nextConfig;
