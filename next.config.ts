import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  typedRoutes: false,
  // Inclui bin/yt-dlp no bundle das funções que importam lib/youtube
  outputFileTracingIncludes: {
    "/api/admin/youtube-mp3/route": ["./bin/yt-dlp"],
    "/api/admin/youtube-meta/route": ["./bin/yt-dlp"],
    "/admin/youtube/page": ["./bin/yt-dlp"],
  },
};

export default nextConfig;
