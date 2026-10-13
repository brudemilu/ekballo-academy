import { describe, expect, it } from "vitest";
import { systemAssistente } from "@/lib/assistente";
import { systemCarrosselDaIdeia } from "@/lib/carrossel-ideia";
import { systemAnaliseReferencia } from "@/lib/conteudo-perfil";
import { systemCortes } from "@/lib/cortes";
import { systemCarrosselPadrao } from "@/lib/instagram";
import {
  ARROBA_PADRAO,
  identidadeDaConta,
  identidadeDoEndereco,
  identidadeNoEndereco,
  logoPermitida,
  MARCA_PADRAO,
  ministerioParaIA,
  seloDoEndereco,
} from "@/lib/instagram-identidade";
import { ogUrlDoSlide } from "@/lib/instagram-imagens";
import { fundoClaro } from "@/lib/instagram-selo";
import { systemPacote } from "@/lib/pacote";
import { systemRoteiro } from "@/lib/roteiro";

const slide = {
  texto: "Sede santos",
  prompt: "igreja ao amanhecer",
  modo: "dourado",
  fonte: "anton",
  seed: 7,
};

describe("identidadeDaConta", () => {
  it("monta a assinatura e o @ com arroba", () => {
    expect(
      identidadeDaConta({ assinatura: " IMW 2ª Região ", usuario: "imw2regiao" }),
    ).toEqual({
      marca: "IMW 2ª Região",
      arroba: "@imw2regiao",
    });
  });

  it("não duplica a arroba e deixa de fora o que a conta não tem", () => {
    expect(identidadeDaConta({ assinatura: "", usuario: "@imw2regiao" })).toEqual({
      arroba: "@imw2regiao",
    });
    expect(identidadeDaConta({ assinatura: "", usuario: "" })).toEqual({});
  });
});

describe("identidade no endereço da imagem", () => {
  it("a conta principal não muda o endereço: as imagens dela continuam as mesmas", () => {
    const sem = ogUrlDoSlide("https://x", slide);
    const principal = ogUrlDoSlide("https://x", slide, {
      marca: MARCA_PADRAO,
      arroba: ARROBA_PADRAO,
    });
    expect(principal).toBe(sem);
    expect(sem).not.toContain("marca=");
  });

  it("outra conta leva a assinatura e o @ dela", () => {
    const url = new URL(
      ogUrlDoSlide("https://x", slide, {
        marca: "IMW 2ª Região",
        arroba: "@imw2regiao",
      }),
    );
    expect(identidadeDoEndereco(url.searchParams)).toEqual({
      marca: "IMW 2ª Região",
      arroba: "@imw2regiao",
    });
  });

  it("sem parâmetros, a rota desenha com a assinatura da conta principal", () => {
    expect(identidadeDoEndereco(new URLSearchParams())).toEqual({
      marca: MARCA_PADRAO,
      arroba: ARROBA_PADRAO,
    });
  });

  it("corta assinatura comprida demais, que estouraria a arte", () => {
    const p = new URLSearchParams();
    identidadeNoEndereco(p, { marca: "x".repeat(200) });
    expect(p.get("marca")).toHaveLength(40);
    expect(
      identidadeDoEndereco(new URLSearchParams({ marca: "y".repeat(200) })).marca,
    ).toHaveLength(40);
  });
});

describe("a logo da conta", () => {
  const storage = "https://ekballo.exemplo.com.br/storage/v1/object/public";

  it("aceita só o nosso Storage e os arquivos de /marcas do próprio site", () => {
    expect(logoPermitida(`${storage}/instagram/abc.png`, storage)).toBe(
      `${storage}/instagram/abc.png`,
    );
    expect(logoPermitida("/marcas/iwe-2-regiao.png", storage)).toBe(
      "/marcas/iwe-2-regiao.png",
    );
  });

  it("recusa endereço de fora, caminho que sobe de pasta e o que não é imagem", () => {
    // a rota busca esse endereço: sem a trava, viraria um buscador de URL alheia
    expect(logoPermitida("https://example.com/x.png", storage)).toBe("");
    expect(logoPermitida("//example.com/x.png", storage)).toBe("");
    expect(logoPermitida("/marcas/../../.env", storage)).toBe("");
    expect(logoPermitida("/api/admin/alunos", storage)).toBe("");
    expect(logoPermitida(`${storage}/instagram/abc.svg`, storage)).toBe("");
    expect(logoPermitida(`${storage}.evil.com/x.png`, storage)).toBe("");
    // sem Storage configurado, nenhum endereço de fora passa
    expect(logoPermitida("https://qualquer.com/x.png", "")).toBe("");
    expect(logoPermitida("", storage)).toBe("");
  });

  it("vai no endereço da arte com o texto de baixo, e volta como selo", () => {
    const identidade = identidadeDaConta({
      assinatura: "IMW 2ª Região",
      usuario: "iwe2regiao",
      logo_url: "/marcas/iwe-2-regiao.png",
      logo_clara_url: "/marcas/iwe-2-regiao-clara.png",
      logo_legenda: "2ª Região",
    });
    const url = new URL(ogUrlDoSlide("https://x", slide, identidade));
    expect(
      seloDoEndereco(url.searchParams, {
        storagePublico: storage,
        origem: "http://127.0.0.1:3000",
      }),
    ).toEqual({
      logoSrc: "http://127.0.0.1:3000/marcas/iwe-2-regiao.png",
      logoClaraSrc: "http://127.0.0.1:3000/marcas/iwe-2-regiao-clara.png",
      legenda: "2ª Região",
    });
  });

  it("conta sem logo não tem selo, mesmo com texto preenchido", () => {
    const identidade = identidadeDaConta({
      assinatura: "Ekballo Academy",
      usuario: "brunofesantos",
      logo_url: "",
      logo_legenda: "2ª Região",
    });
    const url = new URL(ogUrlDoSlide("https://x", slide, identidade));
    expect(url.searchParams.has("logo")).toBe(false);
    expect(url.searchParams.has("logot")).toBe(false);
    expect(
      seloDoEndereco(url.searchParams, { storagePublico: storage, origem: "http://x" }),
    ).toBeNull();
  });

  it("logo de fora pedida direto no endereço é ignorada: a arte sai sem selo", () => {
    const p = new URLSearchParams({
      logo: "https://example.com/x.png",
      logot: "Golpe",
    });
    expect(
      seloDoEndereco(p, { storagePublico: storage, origem: "http://x" }),
    ).toBeNull();
  });
});

describe("qual versão da logo vai em cada arte", () => {
  it("fundo de papel leva a logo original; foto e fundo escuro, a clara", () => {
    for (const m of ["editorial", "gravura", "caderno"]) {
      expect(fundoClaro(m, "escuro")).toBe(true);
    }
    for (const m of ["cinema", "impacto", "foto", "cartao", "muro", ""]) {
      expect(fundoClaro(m, "claro")).toBe(false);
    }
  });

  it("os modelos só de texto seguem o tom escolhido", () => {
    expect(fundoClaro("checklist", "claro")).toBe(true);
    expect(fundoClaro("checklist", "escuro")).toBe(false);
    expect(fundoClaro("citacao", "claro")).toBe(true);
  });
});

describe("o nome do ministério nos pedidos à IA", () => {
  it("a conta principal mantém o texto de sempre", () => {
    expect(ministerioParaIA()).toBe("um ministério cristão de discipulado (Ekballo)");
    expect(ministerioParaIA("  ")).toBe(
      "um ministério cristão de discipulado (Ekballo)",
    );
    expect(systemRoteiro(30, "")).toContain(
      "Instagram de um ministério cristão de discipulado (Ekballo).",
    );
  });

  it("outra conta é apresentada pelo nome dela, sem citar o Ekballo", () => {
    for (const pedido of [
      systemRoteiro(30, "", "IMW 2ª Região"),
      systemPacote("", "IMW 2ª Região"),
      systemCarrosselDaIdeia("carrossel", "", "IMW 2ª Região"),
      systemCarrosselPadrao("carrossel", "IMW 2ª Região"),
      systemAssistente("", "13 de outubro de 2026", "", "IMW 2ª Região"),
      systemCortes("", "IMW 2ª Região"),
      systemAnaliseReferencia("IMW 2ª Região"),
    ]) {
      expect(pedido).toContain("um ministério cristão (IMW 2ª Região)");
      expect(pedido).not.toContain("Ekballo");
    }
  });
});
