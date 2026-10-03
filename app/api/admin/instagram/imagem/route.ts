import { type NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { fundoComCache } from "@/lib/fundo-cache";
import {
  chaveDaImagem,
  estiloValido,
  formatoValido,
  normalizarCena,
  promptCompleto,
  SYSTEM_CENA,
  validarDescricao,
} from "@/lib/imagem-livre";
import { gerarImagem } from "@/lib/instagram";
import { chamarLLM } from "@/lib/llm";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * Imagem livre (aba Imagens em /admin/instagram). Admin-only.
 *  - POST { descricao }                              → a cena em inglês, pronta para gerar
 *  - GET  ?cena=&estilo=&f=feed|story|quadrado&seed= → a imagem (JPEG)
 *
 * São dois passos de propósito: a tradução é feita UMA vez, e as quatro
 * variações são quatro GETs que o navegador dispara em paralelo, cada uma com
 * a sua semente e o seu cache.
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const corpo = await req.json().catch(() => null);
  const v = validarDescricao(corpo?.descricao);
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
  try {
    const cena = normalizarCena(await chamarLLM(SYSTEM_CENA, v.valor, 400));
    return NextResponse.json({ ok: true, cena });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao preparar a imagem." },
      { status: 500 },
    );
  }
}

export async function GET(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const q = req.nextUrl.searchParams;
  const cena = (q.get("cena") || "").trim().slice(0, 500);
  const estilo = q.get("estilo");
  const formato = q.get("f");
  const seed = Number.parseInt(q.get("seed") || "", 10);
  if (
    cena.length < 8 ||
    !estiloValido(estilo) ||
    !formatoValido(formato) ||
    !Number.isFinite(seed)
  ) {
    return NextResponse.json({ error: "Pedido inválido." }, { status: 400 });
  }

  const origem = await fundoComCache(chaveDaImagem(cena, estilo, formato, seed), () =>
    gerarImagem(promptCompleto(cena, estilo), { seed, formato }),
  );
  if (!origem) {
    return NextResponse.json(
      {
        error:
          "Não consegui gerar a imagem agora. A cota grátis de imagens do dia pode ter acabado; ela volta às 21h (horário de Brasília).",
      },
      { status: 503 },
    );
  }

  // Sempre devolve os bytes (e não um redirect para o Storage): assim o botão
  // "Baixar" funciona, porque o arquivo vem da mesma origem da página.
  let bytes: Uint8Array;
  if (origem.startsWith("data:")) {
    bytes = Uint8Array.from(atob(origem.split(",")[1] || ""), (c) => c.charCodeAt(0));
  } else {
    const res = await fetch(origem, { signal: AbortSignal.timeout(20_000) });
    if (!res.ok)
      return NextResponse.json(
        { error: "Não consegui ler a imagem guardada." },
        { status: 502 },
      );
    bytes = new Uint8Array(await res.arrayBuffer());
  }
  return new Response(new Blob([bytes as BlobPart], { type: "image/jpeg" }), {
    headers: {
      "Content-Type": "image/jpeg",
      "Cache-Control": "private, max-age=86400",
      ...(q.get("dl") === "1"
        ? { "Content-Disposition": `attachment; filename="imagem-${seed}.jpg"` }
        : {}),
    },
  });
}
