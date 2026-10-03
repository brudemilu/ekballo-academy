import { describe, expect, it } from "vitest";
import { caminhoDoFundo } from "@/lib/fundo-cache";
import { modelosGemini, textoDoGemini } from "@/lib/llm";

// =============================================================
// Motores de IA do Instagram (issue #189). O que se testa aqui é
// o que quebra calado: uma env mal preenchida que deixa a
// corrente sem modelo nenhum, uma resposta bloqueada do Gemini
// tratada como texto, e o cache de fundo devolvendo a imagem de
// outro slide.
// =============================================================

describe("modelosGemini · ordem de tentativa", () => {
  it("sem env usa a lista padrão, do mais novo estável ao mais antigo", () => {
    expect(modelosGemini(undefined)).toEqual(["gemini-3.5-flash", "gemini-2.5-flash"]);
    expect(modelosGemini("  ")).toEqual(["gemini-3.5-flash", "gemini-2.5-flash"]);
  });

  it("a env troca a lista e tolera espaço e vírgula sobrando", () => {
    expect(modelosGemini(" gemini-a , gemini-b,, ")).toEqual(["gemini-a", "gemini-b"]);
  });
});

describe("textoDoGemini", () => {
  it("junta as partes de texto da primeira candidata", () => {
    const json = {
      candidates: [{ content: { parts: [{ text: '{"a":' }, { text: "1}" }] } }],
    };
    expect(textoDoGemini(json)).toBe('{"a":1}');
  });

  it("resposta bloqueada, vazia ou torta vira null (a corrente passa ao próximo)", () => {
    expect(textoDoGemini({ candidates: [{ finishReason: "SAFETY" }] })).toBeNull();
    expect(
      textoDoGemini({ candidates: [{ content: { parts: [{ text: "   " }] } }] }),
    ).toBeNull();
    expect(textoDoGemini({ candidates: [] })).toBeNull();
    expect(textoDoGemini(null)).toBeNull();
  });
});

describe("caminhoDoFundo · chave do cache no Storage", () => {
  it("o mesmo prompt e seed dão sempre o mesmo caminho", async () => {
    const a = await caminhoDoFundo("an open bible on a table", 7);
    const b = await caminhoDoFundo("  an open bible on a table ", 7);
    expect(a).toBe(b);
    expect(a).toMatch(/^fundos\/v2\/[0-9a-f]{32}\.jpg$/);
  });

  it("mudar a seed ou o prompt muda o caminho", async () => {
    const base = await caminhoDoFundo("an open bible on a table", 7);
    expect(await caminhoDoFundo("an open bible on a table", 8)).not.toBe(base);
    expect(await caminhoDoFundo("a burning torch", 7)).not.toBe(base);
  });
});
