import { describe, expect, it } from "vitest";
import { lerJSONdaIA } from "@/lib/json-ia";

// =============================================================
// Leitura da resposta da IA (issue #189). Quando o Gemini não
// responde, os modelos de reserva erram o formato de jeitos
// previsíveis — e o usuário via "Expected double-quoted property
// name in JSON at position 250" na tela. O conserto só pode
// mexer na forma: se alterar o CONTEÚDO de um texto que vai ser
// publicado, é pior que falhar.
// =============================================================

describe("lerJSONdaIA", () => {
  it("lê JSON certo, com ou sem cerca de código e conversa em volta", () => {
    expect(lerJSONdaIA('{"a":1}')).toEqual({ a: 1 });
    expect(
      lerJSONdaIA('Claro! Aqui está:\n```json\n{"a":1}\n```\nEspero ter ajudado.'),
    ).toEqual({ a: 1 });
  });

  it("conserta vírgula sobrando antes de fechar objeto e lista", () => {
    const torto = `{
      "slides": [
        {"texto": "um", "modo": "circulo",},
        {"texto": "dois"},
      ],
      "legenda": "fim",
    }`;
    expect(lerJSONdaIA(torto)).toEqual({
      slides: [{ texto: "um", modo: "circulo" }, { texto: "dois" }],
      legenda: "fim",
    });
  });

  it("tira comentário de linha fora de string", () => {
    expect(lerJSONdaIA('{\n  // o gancho\n  "gancho": "Você ora?"\n}')).toEqual({
      gancho: "Você ora?",
    });
  });

  it("NÃO mexe no que está dentro de um texto", () => {
    // vírgula antes de chave, duas barras e aspas escapadas DENTRO do texto ficam intactas
    const r = lerJSONdaIA(
      '{"legenda": "Veja em https://ekballo.com, ok? ,} \\"fim\\"",}',
    ) as { legenda: string };
    expect(r.legenda).toBe('Veja em https://ekballo.com, ok? ,} "fim"');
  });

  it("sem conserto, a mensagem sai em português e é a que o chamador pediu", () => {
    expect(() => lerJSONdaIA("não consegui")).toThrow(
      "a IA devolveu uma resposta que não consegui ler — tente de novo",
    );
    expect(() => lerJSONdaIA('{"a": }', "o roteiro veio ilegível")).toThrow(
      "o roteiro veio ilegível",
    );
    expect(() => lerJSONdaIA("")).toThrow(/não consegui ler/);
  });

  it("nunca devolve a mensagem técnica do JSON.parse", () => {
    try {
      lerJSONdaIA('{"a": 1 "b": 2}');
      expect.unreachable();
    } catch (e) {
      expect((e as Error).message).not.toMatch(/position|Expected|Unexpected/);
    }
  });
});
