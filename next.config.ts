import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  typedRoutes: false,
  // ffmpeg-static: não bundlar (mantém o caminho real do binário em node_modules)
  serverExternalPackages: ["ffmpeg-static"],
  // e garante que o binário entre no deploy da função de render (Vercel).
  outputFileTracingIncludes: {
    "/api/admin/instagram/reel-gerar": ["./node_modules/ffmpeg-static/**"],
  },
};

export default nextConfig;
