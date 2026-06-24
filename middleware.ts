import { type NextRequest } from "next/server";
import { updateSession } from "@/lib/supabase/middleware";

export async function middleware(request: NextRequest) {
  return await updateSession(request);
}

export const config = {
  matcher: [
    // Exclui /api (cada rota faz a própria auth; as imagens OG de card não
    // precisam de login) e estáticos. Antes, cada uma das ~64 imagens
    // /api/og/curso/* disparava um auth.getUser() de rede no middleware.
    "/((?!api|_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)",
  ],
};
