// Versão atual no servidor (SHA do commit do deploy). O cliente compara com o
// build que ele carregou (NEXT_PUBLIC_BUILD_ID) pra saber se há um deploy novo.
// Nunca cacheia — precisa refletir o deploy vigente em tempo real.
export const dynamic = "force-dynamic";

export async function GET() {
  // Mesmo id embutido no bundle (NEXT_PUBLIC_BUILD_ID, vindo de APP_BUILD_ID no
  // build) — inlined pelo Next em build-time, reflete a versão desta imagem.
  const build =
    process.env.NEXT_PUBLIC_BUILD_ID ??
    process.env.VERCEL_GIT_COMMIT_SHA ??
    "dev";
  return Response.json(
    { build },
    { headers: { "Cache-Control": "no-store, max-age=0" } }
  );
}
