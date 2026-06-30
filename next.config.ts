import type { NextConfig } from "next";

// Identidade do build: o SHA do commit no Vercel (ou "dev" em local). Embutido no
// bundle do cliente (NEXT_PUBLIC_BUILD_ID) e lido em runtime por /api/version —
// o UpdatePrompt compara os dois pra detectar um deploy novo e oferecer atualizar.
const buildId = process.env.VERCEL_GIT_COMMIT_SHA ?? "dev";

const nextConfig: NextConfig = {
  typedRoutes: false,
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
