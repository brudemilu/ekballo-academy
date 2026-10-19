import { describe, expect, it } from "vitest";
import type { MidiaIG } from "@/lib/status-whatsapp";
import {
  avisoDoRascunho,
  escolherParaTikTok,
  escolherPrivacidade,
  legendaParaTikTok,
  MAX_LEGENDA_TIKTOK,
  MAX_POR_RODADA,
  planoDeEnvio,
  situacaoDoStatus,
  tokenVencendo,
  urlDeAutorizacao,
} from "@/lib/tiktok";

// =============================================================
// Instagram → TikTok (issue #273). O que não pode acontecer: o
// mesmo Reel ir duas vezes, a primeira rodada despejar os Reels
// antigos, ou o envio do arquivo quebrar as regras de pedaços do
// TikTok.
// =============================================================

const LIGADO = new Date("2026-10-20T12:00:00Z");
const MB = 1024 * 1024;
const reel = (id: string, hora: string, extra: Partial<MidiaIG> = {}): MidiaIG => ({
  id,
  media_type: "VIDEO",
  media_product_type: "REELS",
  permalink: `https://www.instagram.com/reel/${id}/`,
  media_url: `https://cdn.ig/${id}.mp4`,
  caption: "Dá para estar na igreja todo domingo… e estar longe de Deus.\n\n#fé",
  timestamp: hora,
  ...extra,
});

describe("escolherParaTikTok", () => {
  it("manda só Reels publicados depois de ligar, do mais antigo ao mais novo", () => {
    const itens = escolherParaTikTok({
      midias: [
        reel("novo", "2026-10-21T21:30:00Z"),
        reel("velho", "2026-10-19T21:30:00Z"),
        reel("meio", "2026-10-20T21:30:00Z"),
      ],
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    expect(itens.map((i) => i.igMediaId)).toEqual(["meio", "novo"]);
  });

  it("não repete o que já foi", () => {
    const itens = escolherParaTikTok({
      midias: [reel("a", "2026-10-21T10:00:00Z")],
      jaEnviados: new Set(["a"]),
      desde: LIGADO,
    });
    expect(itens).toEqual([]);
  });

  it("ignora foto, carrossel e Reel sem arquivo", () => {
    const itens = escolherParaTikTok({
      midias: [
        reel("foto", "2026-10-21T10:00:00Z", {
          media_product_type: "FEED",
          media_type: "IMAGE",
        }),
        reel("sem", "2026-10-21T11:00:00Z", { media_url: undefined }),
      ],
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    expect(itens).toEqual([]);
  });

  it("prefere o arquivo original do sistema ao do Instagram", () => {
    const [item] = escolherParaTikTok({
      midias: [reel("a", "2026-10-21T10:00:00Z")],
      jaEnviados: new Set(),
      desde: LIGADO,
      originais: new Map([["a", "https://storage/original.mp4"]]),
    });
    expect(item.videoUrl).toBe("https://storage/original.mp4");
  });

  it("respeita o máximo por rodada", () => {
    const midias = Array.from({ length: 6 }, (_, i) =>
      reel(`r${i}`, `2026-10-21T1${i}:00:00Z`),
    );
    expect(
      escolherParaTikTok({ midias, jaEnviados: new Set(), desde: LIGADO }),
    ).toHaveLength(MAX_POR_RODADA);
  });
});

describe("legendaParaTikTok", () => {
  it("tira a linha de crédito da música do Instagram", () => {
    const l = legendaParaTikTok(
      'Antes de qualquer luta, permaneça.\n\n#fé\n\nMúsica: "Fearless First", Kevin MacLeod (incompetech.com), CC BY 4.0.',
    );
    expect(l).toBe("Antes de qualquer luta, permaneça.\n\n#fé");
  });

  it("corta no limite do TikTok sem partir palavra", () => {
    const l = legendaParaTikTok("palavra ".repeat(400));
    expect(l.length).toBeLessThanOrEqual(MAX_LEGENDA_TIKTOK);
    expect(l.endsWith("palavra…")).toBe(true);
  });

  it("legenda vazia continua vazia", () => {
    expect(legendaParaTikTok(undefined)).toBe("");
  });
});

describe("planoDeEnvio", () => {
  it("vídeo de até 64 MB vai inteiro, num pedaço só", () => {
    expect(planoDeEnvio(14 * MB)).toEqual({
      chunkSize: 14 * MB,
      total: 1,
      faixas: [{ inicio: 0, fim: 14 * MB - 1 }],
    });
  });

  it("vídeo maior vai em pedaços, e o último leva a sobra", () => {
    const tamanho = 100 * MB;
    const p = planoDeEnvio(tamanho);
    expect(p.total).toBe(3);
    expect(p.faixas[0]).toEqual({ inicio: 0, fim: 32 * MB - 1 });
    expect(p.faixas[2]).toEqual({ inicio: 64 * MB, fim: tamanho - 1 });
    // O último pedaço nunca passa de 128 MB.
    const ultimo = p.faixas[2].fim - p.faixas[2].inicio + 1;
    expect(ultimo).toBeLessThanOrEqual(128 * MB);
  });

  it("recusa vídeo vazio", () => {
    expect(() => planoDeEnvio(0)).toThrow();
  });
});

describe("escolherPrivacidade", () => {
  it("público quando o TikTok deixa", () => {
    expect(escolherPrivacidade(["PUBLIC_TO_EVERYONE", "SELF_ONLY"])).toBe(
      "PUBLIC_TO_EVERYONE",
    );
  });
  it("somente eu antes da aprovação do aplicativo", () => {
    expect(escolherPrivacidade(["SELF_ONLY"])).toBe("SELF_ONLY");
    expect(escolherPrivacidade(undefined)).toBe("SELF_ONLY");
  });
});

describe("situacaoDoStatus", () => {
  it("traduz o status do TikTok", () => {
    expect(situacaoDoStatus("SEND_TO_USER_INBOX")).toBe("no_rascunho");
    expect(situacaoDoStatus("PUBLISH_COMPLETE")).toBe("publicado");
    expect(situacaoDoStatus("FAILED")).toBe("erro");
    expect(situacaoDoStatus("PROCESSING_UPLOAD")).toBe("processando");
  });
});

describe("tokenVencendo", () => {
  const agora = new Date("2026-10-20T12:00:00Z");
  it("renova quando faltam menos de 10 minutos", () => {
    expect(tokenVencendo("2026-10-20T12:05:00Z", agora)).toBe(true);
    expect(tokenVencendo("2026-10-20T18:00:00Z", agora)).toBe(false);
    expect(tokenVencendo(null, agora)).toBe(true);
  });
});

describe("urlDeAutorizacao e aviso", () => {
  it("monta a tela de autorização com os escopos de envio", () => {
    const u = new URL(
      urlDeAutorizacao({ clientKey: "abc", redirectUri: "https://x/cb", state: "s1" }),
    );
    expect(u.origin).toBe("https://www.tiktok.com");
    expect(u.searchParams.get("scope")).toContain("video.upload");
    expect(u.searchParams.get("state")).toBe("s1");
  });

  it("o aviso do rascunho traz a primeira frase e diz o que fazer", () => {
    const a = avisoDoRascunho("Antes de qualquer luta, permaneça.\n\n#fé");
    expect(a).toContain('"Antes de qualquer luta, permaneça."');
    expect(a).toContain("rascunhos do TikTok");
  });
});
