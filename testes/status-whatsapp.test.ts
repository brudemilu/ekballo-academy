import { describe, expect, it } from "vitest";
import {
  avisoParaEncaminhar,
  chamadaDaLegenda,
  escolherParaStatus,
  MAX_POR_RODADA,
  type MidiaIG,
  textoDoReel,
} from "@/lib/status-whatsapp";

// =============================================================
// Instagram → Status do WhatsApp (issue #258). O que não pode
// acontecer: o mesmo Reel ir duas vezes para o Status de todos os
// contatos, ou a primeira rodada despejar os posts antigos.
// =============================================================

const LIGADO = new Date("2026-10-13T12:00:00Z");
const reel = (id: string, hora: string, extra: Partial<MidiaIG> = {}): MidiaIG => ({
  id,
  media_type: "VIDEO",
  media_product_type: "REELS",
  permalink: `https://www.instagram.com/reel/${id}/`,
  thumbnail_url: `https://cdn/${id}.jpg`,
  caption: "Oração não é pedido de socorro. É relacionamento.\n\n#oração #fé",
  timestamp: hora,
  ...extra,
});
const story = (id: string, hora: string, video = false): MidiaIG => ({
  id,
  media_type: video ? "VIDEO" : "IMAGE",
  media_product_type: "STORY",
  media_url: `https://cdn/${id}.${video ? "mp4" : "jpg"}`,
  timestamp: hora,
});

describe("escolherParaStatus", () => {
  it("Reel novo vira Status com a capa e o link na legenda", () => {
    const [item] = escolherParaStatus({
      midias: [reel("A", "2026-10-13T22:01:00Z")],
      stories: [],
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    expect(item.origem).toBe("reel");
    expect(item.envio).toMatchObject({ tipo: "image", url: "https://cdn/A.jpg" });
    expect((item.envio as { legenda: string }).legenda).toContain(
      "https://www.instagram.com/reel/A/",
    );
  });

  it("sem capa, vai o texto com o link", () => {
    const [item] = escolherParaStatus({
      midias: [reel("A", "2026-10-13T22:01:00Z", { thumbnail_url: undefined })],
      stories: [],
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    expect(item.envio.tipo).toBe("text");
  });

  it("story é repetido como imagem ou vídeo", () => {
    const itens = escolherParaStatus({
      midias: [],
      stories: [
        story("S1", "2026-10-13T13:00:00Z"),
        story("S2", "2026-10-13T14:00:00Z", true),
      ],
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    expect(itens.map((i) => i.envio.tipo)).toEqual(["image", "video"]);
  });

  it("o que já foi mandado não vai de novo", () => {
    expect(
      escolherParaStatus({
        midias: [reel("A", "2026-10-13T22:01:00Z")],
        stories: [story("S1", "2026-10-13T13:00:00Z")],
        jaEnviados: new Set(["A", "S1"]),
        desde: LIGADO,
      }),
    ).toEqual([]);
  });

  it("nada publicado antes de ligar entra — a primeira rodada não despeja o passado", () => {
    expect(
      escolherParaStatus({
        midias: [reel("VELHO", "2026-10-09T21:01:00Z")],
        stories: [story("SV", "2026-10-13T11:59:00Z")],
        jaEnviados: new Set(),
        desde: LIGADO,
      }),
    ).toEqual([]);
  });

  it("foto e carrossel do feed não vão: só Reel e story", () => {
    expect(
      escolherParaStatus({
        midias: [
          reel("F", "2026-10-13T22:01:00Z", {
            media_product_type: "FEED",
            media_type: "IMAGE",
          }),
        ],
        stories: [],
        jaEnviados: new Set(),
        desde: LIGADO,
      }),
    ).toEqual([]);
  });

  it("uma rodada manda poucos, do mais antigo para o mais novo", () => {
    const stories = [5, 1, 4, 2, 3].map((n) =>
      story(`S${n}`, `2026-10-13T1${n + 2}:00:00Z`),
    );
    const itens = escolherParaStatus({
      midias: [],
      stories,
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    expect(itens).toHaveLength(MAX_POR_RODADA);
    expect(itens.map((i) => i.igMediaId)).toEqual(["S1", "S2", "S3"]);
  });
});

describe("texto do Reel", () => {
  it("usa a primeira linha da legenda, sem hashtag nem o crédito da música", () => {
    expect(
      chamadaDaLegenda("#fé #oração\nMúsica: X\nDeus continua cuidando. #Jesus"),
    ).toBe("Deus continua cuidando.");
    expect(chamadaDaLegenda("")).toBe("");
  });

  it("corta legenda longa sem partir palavra", () => {
    const longa = "palavra ".repeat(40).trim();
    const c = chamadaDaLegenda(longa, 50);
    expect(c.length).toBeLessThanOrEqual(51);
    expect(c.endsWith("…")).toBe(true);
    expect(c).not.toMatch(/palavr…$/);
  });

  it("sempre termina com o link", () => {
    expect(textoDoReel(reel("A", "2026-10-13T22:01:00Z"))).toMatch(
      /Assista aqui: https:\/\/www\.instagram\.com\/reel\/A\/$/,
    );
  });
});

describe("modo aviso", () => {
  it("manda a mesma peça e diz o que fazer com ela", () => {
    const [item] = escolherParaStatus({
      midias: [reel("A", "2026-10-13T22:01:00Z")],
      stories: [],
      jaEnviados: new Set(),
      desde: LIGADO,
    });
    const aviso = avisoParaEncaminhar(item);
    expect(aviso.midia).toBe(item.envio);
    expect(aviso.instrucao).toContain("Reel");
    expect(aviso.instrucao).toContain("Meu status");
  });
});
