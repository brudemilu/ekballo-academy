import { describe, expect, it } from "vitest";
import {
  diagnostico,
  forcaDeCrescimento,
  formatoDoPost,
  porFormato,
  postsQueMaisCresceram,
  resumoDoCrescimento,
} from "@/lib/crescimento";
import type { PostPainel } from "@/lib/painel";

// =============================================================
// Crescimento do perfil (issue #225). O que não pode acontecer:
// o painel dizer "zero" onde o Instagram não informou nada, tirar
// conclusão de dois posts, ou chamar de Reel o que não é.
// =============================================================

const HOJE = "2026-10-06";

function post(diasAtras: number, extra: Partial<PostPainel> = {}): PostPainel {
  const d = new Date(Date.UTC(2026, 9, 6 - diasAtras, 15));
  return {
    id: `p${diasAtras}-${extra.mediaType ?? "IMAGE"}-${Math.round((extra.reach ?? 0) as number)}`,
    caption: "legenda",
    mediaType: "IMAGE",
    timestamp: d.toISOString(),
    likes: 10,
    comments: 1,
    reach: 300,
    permalink: "https://instagram.com/p/x",
    interacoes: 11,
    salvos: 0,
    compartilhamentos: 2,
    seguiu: 0,
    visitasPerfil: 1,
    ...extra,
  };
}

describe("formatoDoPost", () => {
  it("separa Reel, carrossel e imagem", () => {
    expect(formatoDoPost(post(1, { reel: true, mediaType: "VIDEO" }))).toBe("reel");
    expect(formatoDoPost(post(1, { mediaType: "VIDEO" }))).toBe("reel");
    expect(formatoDoPost(post(1, { mediaType: "CAROUSEL_ALBUM" }))).toBe("carrossel");
    expect(formatoDoPost(post(1))).toBe("imagem");
  });
});

describe("resumoDoCrescimento", () => {
  it("soma os sinais do período e compara o alcance com os seguidores", () => {
    const r = resumoDoCrescimento(
      [post(1, { reach: 200 }), post(5, { reach: 400 }), post(10, { reach: 600 })],
      HOJE,
      2000,
    );
    expect(r.posts).toBe(3);
    expect(r.alcanceTipico).toBe(400);
    expect(r.alcanceSobreSeguidores).toBe(0.2);
    expect(r.compartilhamentos).toBe(6);
    // 6 envios em 1.200 alcançados = 0,5 a cada 100.
    expect(r.enviosPorCemAlcancados).toBeCloseTo(0.5);
  });

  it("post fora da janela não entra", () => {
    const r = resumoDoCrescimento([post(1), post(45)], HOJE, 1000);
    expect(r.posts).toBe(1);
  });

  it("número que o Instagram não informou fica 'sem dado', não zero", () => {
    const semSinais = {
      salvos: null,
      compartilhamentos: null,
      seguiu: null,
      visitasPerfil: null,
    };
    const r = resumoDoCrescimento([post(1, semSinais), post(2, semSinais)], HOJE, 1000);
    expect(r.compartilhamentos).toBeNull();
    expect(r.salvos).toBeNull();
    expect(r.seguiuPelosPosts).toBeNull();
    expect(r.enviosPorCemAlcancados).toBeNull();
  });

  it("zero informado continua sendo zero", () => {
    const r = resumoDoCrescimento([post(1, { salvos: 0 })], HOJE, 1000);
    expect(r.salvos).toBe(0);
  });

  it("sem seguidores conhecidos não inventa a proporção", () => {
    expect(
      resumoDoCrescimento([post(1)], HOJE, null).alcanceSobreSeguidores,
    ).toBeNull();
  });
});

describe("porFormato", () => {
  it("dá a média de envios de cada formato, do mais usado ao menos", () => {
    const linhas = porFormato(
      [
        post(1, { reel: true, mediaType: "VIDEO", compartilhamentos: 8 }),
        post(2, { reel: true, mediaType: "VIDEO", compartilhamentos: 4 }),
        post(3, { compartilhamentos: 1 }),
        post(4, { compartilhamentos: 1 }),
        post(5, { compartilhamentos: 1 }),
      ],
      HOJE,
    );
    expect(linhas.map((l) => l.formato)).toEqual(["imagem", "reel"]);
    expect(linhas[1].compartilhamentos).toBe(6);
    expect(linhas[0].compartilhamentos).toBe(1);
  });

  it("formato sem nenhum post não aparece", () => {
    expect(porFormato([post(1)], HOJE).map((l) => l.formato)).toEqual(["imagem"]);
  });
});

describe("postsQueMaisCresceram", () => {
  it("ordena por seguidor novo, envio e salvamento, e explica o motivo", () => {
    const lista = postsQueMaisCresceram(
      [
        post(1, { compartilhamentos: 3, salvos: 0, seguiu: 0, reach: 301 }),
        post(2, { compartilhamentos: 1, salvos: 0, seguiu: 2, reach: 302 }),
        post(3, { compartilhamentos: 0, salvos: 0, seguiu: 0, reach: 303 }),
      ],
      HOJE,
    );
    expect(lista).toHaveLength(2);
    expect(lista[0].motivo).toBe("2 seguidores novos · 1 envio");
    expect(lista[1].motivo).toBe("3 envios");
  });

  it("seguidor novo pesa mais que envio", () => {
    expect(
      forcaDeCrescimento(post(1, { seguiu: 1, compartilhamentos: 0 })),
    ).toBeGreaterThan(forcaDeCrescimento(post(1, { seguiu: 0, compartilhamentos: 4 })));
  });
});

describe("diagnostico", () => {
  it("com poucos posts só avisa que ainda não dá para dizer nada", () => {
    const a = diagnostico([post(1), post(2)], HOJE, 3000);
    expect(a.map((x) => x.chave)).toEqual(["poucos"]);
  });

  it("perfil que só fala com quem já segue: aponta a bolha, o envio e o ritmo", () => {
    // O retrato do @brunofesantos em out/2026: alcance de ~10% dos seguidores,
    // quase nenhum envio, ninguém seguindo a partir de post.
    const posts = [3, 12, 20, 40, 55].map((d) =>
      post(d, { reach: 330, compartilhamentos: 2, salvos: 0, seguiu: 0 }),
    );
    const chaves = diagnostico(posts, HOJE, 3245).map((x) => x.chave);
    expect(chaves).toContain("bolha");
    expect(chaves).toContain("sem-seguidor");
    expect(chaves).toContain("pouco-envio");
    expect(chaves).toContain("pouco-salvo");
    expect(chaves).toContain("ritmo");
  });

  it("o detalhe traz o número que disparou a regra", () => {
    const posts = [3, 12, 20].map((d) => post(d, { reach: 330 }));
    const bolha = diagnostico(posts, HOJE, 3245).find((x) => x.chave === "bolha");
    expect(bolha?.detalhe).toContain("330 pessoas");
    expect(bolha?.detalhe).toContain("10%");
  });

  it("perfil saudável não recebe alerta", () => {
    const posts = Array.from({ length: 12 }, (_, i) =>
      post(i * 2 + 1, {
        reach: 2000 + i,
        compartilhamentos: 60,
        salvos: 30,
        seguiu: 5,
      }),
    );
    expect(diagnostico(posts, HOJE, 3000)).toEqual([]);
  });

  it("aponta o formato mais enviado quando há base nos dois", () => {
    const reels = [1, 3, 5].map((d) =>
      post(d, {
        reel: true,
        mediaType: "VIDEO",
        reach: 2000 + d,
        compartilhamentos: 40,
        salvos: 20,
        seguiu: null,
      }),
    );
    const imagens = [2, 4, 6, 8, 10, 12, 14, 16, 18].map((d) =>
      post(d, { reach: 2100 + d, compartilhamentos: 10, salvos: 20, seguiu: 5 }),
    );
    const formato = diagnostico([...reels, ...imagens], HOJE, 3000).find(
      (x) => x.chave === "formato",
    );
    expect(formato?.titulo).toBe("Reel é o formato mais enviado");
  });
});
