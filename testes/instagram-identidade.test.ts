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
  MARCA_PADRAO,
  ministerioParaIA,
} from "@/lib/instagram-identidade";
import { ogUrlDoSlide } from "@/lib/instagram-imagens";
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
