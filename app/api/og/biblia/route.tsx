import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import { getLivro, getCapitulo, VERSAO_PADRAO } from "@/lib/biblia";

// Tamanhos:
//   feed  → 1080x1080 (Insta feed, WhatsApp)
//   story → 1080x1920 (Insta Story, Status WhatsApp)

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const livroId = Number(url.searchParams.get("livro") || "0");
  const cap = Number(url.searchParams.get("cap") || "0");
  const versParam = url.searchParams.get("v") || "";
  const formato = (url.searchParams.get("f") || "feed") as "feed" | "story";
  const versao = (url.searchParams.get("versao") || VERSAO_PADRAO).toUpperCase();

  const versNums = versParam
    .split(",")
    .map((s) => Number(s.trim()))
    .filter((n) => Number.isInteger(n) && n > 0);

  if (!livroId || !cap || versNums.length === 0) {
    return new Response("parâmetros inválidos: livro, cap, v obrigatórios", {
      status: 400,
    });
  }

  const [livro, todosDoCap] = await Promise.all([
    getLivro(livroId),
    getCapitulo(livroId, cap, versao),
  ]);
  if (!livro) return new Response("livro não encontrado", { status: 404 });

  const selecionados = todosDoCap
    .filter((v) => versNums.includes(v.versiculo))
    .sort((a, b) => a.versiculo - b.versiculo);

  if (selecionados.length === 0) {
    return new Response("nenhum versículo encontrado", { status: 404 });
  }

  // Renderiza ref ("Gênesis 1:1-3" ou "Salmos 23:1,3,5")
  const nums = selecionados.map((s) => s.versiculo);
  const isRange =
    nums.length > 1 && nums.every((n, i) => i === 0 || n === nums[i - 1] + 1);
  const refLabel = isRange
    ? `${livro.nome} ${cap}:${nums[0]}-${nums[nums.length - 1]}`
    : `${livro.nome} ${cap}:${nums.join(",")}`;

  // Junta o texto com versículos pequenos como sup
  const texto = selecionados
    .map((s, i) => (i === 0 ? s.texto : ` ${s.texto}`))
    .join("");

  // Dimensões + heurística pra tamanho de fonte
  const w = 1080;
  const h = formato === "story" ? 1920 : 1080;
  const charCount = texto.length;
  // Ajuste empírico
  const fontSize =
    formato === "story"
      ? charCount < 120
        ? 72
        : charCount < 240
          ? 58
          : charCount < 380
            ? 48
            : 40
      : charCount < 100
        ? 64
        : charCount < 200
          ? 52
          : charCount < 320
            ? 44
            : 36;

  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          padding: formato === "story" ? "120px 80px" : "100px 80px",
          background:
            "linear-gradient(135deg, #FBDDC0 0%, #F5C99A 45%, #E8A874 100%)",
          fontFamily: "serif",
          color: "#3D2811",
          position: "relative",
        }}
      >
        {/* Decoração — linha decorativa no topo */}
        <div style={{ display: "flex", alignItems: "center", gap: 16 }}>
          <div
            style={{
              width: 60,
              height: 4,
              background: "#D55416",
              borderRadius: 2,
            }}
          />
          <div
            style={{
              fontSize: 24,
              letterSpacing: 6,
              textTransform: "uppercase",
              color: "#8B4513",
              fontWeight: 600,
            }}
          >
            Palavra
          </div>
        </div>

        {/* Versículo central */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            justifyContent: "center",
            flex: 1,
            paddingTop: formato === "story" ? 60 : 40,
            paddingBottom: formato === "story" ? 60 : 40,
          }}
        >
          <div
            style={{
              fontSize,
              lineHeight: 1.35,
              fontStyle: "italic",
              fontWeight: 500,
              textAlign: "center",
              maxWidth: "100%",
              wordBreak: "break-word",
            }}
          >
            &ldquo;{texto}&rdquo;
          </div>
        </div>

        {/* Footer — referência + marca */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            gap: 28,
          }}
        >
          <div
            style={{
              display: "flex",
              alignItems: "baseline",
              gap: 14,
            }}
          >
            <div
              style={{
                fontSize: formato === "story" ? 44 : 36,
                fontWeight: 700,
                color: "#5E3D17",
              }}
            >
              {refLabel}
            </div>
            <div
              style={{
                fontSize: formato === "story" ? 20 : 16,
                letterSpacing: 4,
                color: "#8B4513",
                fontWeight: 600,
                textTransform: "uppercase",
              }}
            >
              {versao}
            </div>
          </div>
          <div
            style={{
              width: 120,
              height: 2,
              background: "#D55416",
              opacity: 0.6,
            }}
          />
          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: 14,
            }}
          >
            {/* Logo SVG inline */}
            <svg width="40" height="40" viewBox="0 0 32 32">
              <circle
                cx="16"
                cy="16"
                r="14"
                stroke="#D55416"
                strokeWidth="1.6"
                fill="none"
              />
              <path
                d="M9 19 L16 11 L23 19"
                stroke="#D55416"
                strokeWidth="1.8"
                fill="none"
                strokeLinecap="round"
                strokeLinejoin="round"
              />
              <line
                x1="9"
                y1="22.5"
                x2="23"
                y2="22.5"
                stroke="#5E3D17"
                strokeWidth="1.6"
                strokeLinecap="round"
              />
            </svg>
            <div style={{ display: "flex", flexDirection: "column" }}>
              <div
                style={{
                  fontSize: 26,
                  fontWeight: 700,
                  color: "#5E3D17",
                  letterSpacing: 1,
                }}
              >
                Ekballo
              </div>
              <div
                style={{
                  fontSize: 12,
                  letterSpacing: 4,
                  color: "#8B4513",
                  textTransform: "uppercase",
                }}
              >
                Academy
              </div>
            </div>
          </div>
        </div>
      </div>
    ),
    {
      width: w,
      height: h,
    }
  );
}
