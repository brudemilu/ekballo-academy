import type { NextConfig } from "next";

// Identidade do build: o SHA do commit no Vercel (ou "dev" em local). Embutido no
// bundle do cliente (NEXT_PUBLIC_BUILD_ID) e lido em runtime por /api/version —
// o UpdatePrompt compara os dois pra detectar um deploy novo e oferecer atualizar.
// APP_BUILD_ID: id de build injetado no Docker/self-hosted (Contabo). Vercel usa
// o SHA do commit. Sem nenhum dos dois (local), fica "dev".
const buildId =
  process.env.APP_BUILD_ID ?? process.env.VERCEL_GIT_COMMIT_SHA ?? "dev";

const nextConfig: NextConfig = {
  typedRoutes: false,
  // Gera um servidor Node autocontido para a imagem Docker/Portainer.
  output: "standalone",
  env: {
    NEXT_PUBLIC_BUILD_ID: buildId,
  },
  // ffmpeg-static: não bundlar (mantém o caminho real do binário em node_modules)
  serverExternalPackages: ["ffmpeg-static"],
  // e garante que o binário entre no deploy da função de render (Vercel).
  outputFileTracingIncludes: {
    "/api/admin/instagram/reel-gerar": ["./node_modules/ffmpeg-static/**"],
  },
};

export default nextConfig;
