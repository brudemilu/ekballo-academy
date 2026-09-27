import { afterEach, describe, expect, it } from "vitest";
import { baseParaLink } from "@/lib/matricula";

// =============================================================
// O link do convite de matrícula é a primeira coisa que o discípulo
// recebe quando entra numa temática. Atrás do Traefik, o `origin` da
// requisição é o bind interno do container — e foi assim que saíram
// convites apontando pra "https://0.0.0.0:3000" de jul/2026 a set/2026
// (issue #183), sem nada explodir: a mensagem sai como "enviado".
// =============================================================

const SITE = process.env.NEXT_PUBLIC_SITE_URL;
const WEBHOOK = process.env.WEBHOOK_PUBLIC_BASE;

afterEach(() => {
  if (SITE === undefined) delete process.env.NEXT_PUBLIC_SITE_URL;
  else process.env.NEXT_PUBLIC_SITE_URL = SITE;
  if (WEBHOOK === undefined) delete process.env.WEBHOOK_PUBLIC_BASE;
  else process.env.WEBHOOK_PUBLIC_BASE = WEBHOOK;
});

describe("baseParaLink · endereço que o discípulo consegue abrir", () => {
  it("usa o domínio público mesmo quando o origin é o bind interno", () => {
    process.env.NEXT_PUBLIC_SITE_URL = "https://ekballo.escoladodiscipuloimw.com.br";
    expect(baseParaLink("https://0.0.0.0:3000")).toBe(
      "https://ekballo.escoladodiscipuloimw.com.br",
    );
  });

  it("tira a barra do fim pra não montar link com barra dupla", () => {
    process.env.NEXT_PUBLIC_SITE_URL = "https://ekballo.escoladodiscipuloimw.com.br/";
    expect(`${baseParaLink("https://0.0.0.0:3000")}/cursos/x`).toBe(
      "https://ekballo.escoladodiscipuloimw.com.br/cursos/x",
    );
  });

  it("devolve vazio quando não há env e o origin é o bind interno", () => {
    delete process.env.NEXT_PUBLIC_SITE_URL;
    delete process.env.WEBHOOK_PUBLIC_BASE;
    expect(baseParaLink("https://0.0.0.0:3000")).toBe("");
    expect(baseParaLink("nem-url")).toBe("");
  });

  it("aceita o origin em dev local, onde ele realmente abre", () => {
    delete process.env.NEXT_PUBLIC_SITE_URL;
    delete process.env.WEBHOOK_PUBLIC_BASE;
    expect(baseParaLink("http://localhost:3000")).toBe("http://localhost:3000");
  });
});
