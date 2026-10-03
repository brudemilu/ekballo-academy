import { describe, expect, it } from "vitest";
import {
  blocosDoRoteiro,
  duracaoDaSaidaFfmpeg,
  filtroDoReel,
  planejarReel,
} from "@/lib/reel-narrado";

// =============================================================
// Reel narrado pela IA (issue #189). O vídeo é montado por uma
// linha de ffmpeg que ninguém lê depois: se o texto de um bloco
// entrar no tempo da fala de outro, ou o áudio começar junto em
// vez de em sequência, o Reel sai errado e só se descobre
// assistindo. Então os tempos e o filtro são conferidos aqui.
// =============================================================

describe("planejarReel · quando cada bloco entra e sai", () => {
  it("um bloco depois do outro, com um respiro entre eles e folga no fim", () => {
    const { trechos, total } = planejarReel([3, 5]);
    expect(trechos[0]).toEqual({ inicio: 0, fim: 3 });
    expect(trechos[1].inicio).toBeCloseTo(3.35, 5);
    expect(trechos[1].fim).toBeCloseTo(8.35, 5);
    expect(total).toBeCloseTo(9.15, 5);
  });

  it("fala curtíssima ainda fica meio segundo na tela", () => {
    expect(planejarReel([0.1]).trechos[0]).toEqual({ inicio: 0, fim: 0.5 });
  });

  it("sem blocos não há vídeo", () => {
    expect(planejarReel([])).toEqual({ trechos: [], total: 0 });
  });
});

describe("filtroDoReel · a linha do ffmpeg", () => {
  const { trechos, total } = planejarReel([3, 5]);
  const f = filtroDoReel(trechos, total);

  it("corta o fundo para 9:16 e limita à duração total", () => {
    expect(f).toContain(
      "[0:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920",
    );
    expect(f).toContain("trim=0:9.15");
  });

  it("cada texto aparece só durante a fala do seu bloco", () => {
    expect(f).toContain("[bg][t0]overlay=0:0:enable='between(t,0.00,3.00)'[o0]");
    // o último overlay fecha a cadeia de vídeo em [v]
    expect(f).toContain("[o0][t1]overlay=0:0:enable='between(t,3.35,8.35)'[v]");
  });

  it("cada áudio é atrasado até o início do seu bloco, e os dois são somados sem baixar o volume", () => {
    // entradas: 0 fundo, 1-2 textos, 3-4 áudios
    expect(f).toContain("[3:a]adelay=0:all=1[a0]");
    expect(f).toContain("[4:a]adelay=3350:all=1[a1]");
    expect(f).toContain("[a0][a1]amix=inputs=2:duration=longest:normalize=0");
    expect(f.endsWith("atrim=0:9.15[a]")).toBe(true);
  });

  it("com um bloco só, o overlay já sai em [v]", () => {
    const um = planejarReel([4]);
    expect(filtroDoReel(um.trechos, um.total)).toContain(
      "[bg][t0]overlay=0:0:enable='between(t,0.00,4.00)'[v]",
    );
  });
});

describe("blocosDoRoteiro · o que vai para a tela", () => {
  const bloco = (falar: string, tela: string) => ({
    momento: "corpo" as const,
    tempo: "",
    falar,
    tela,
    mostrar: "",
  });

  it("usa o texto da tela; sem ele, o começo da fala", () => {
    const b = blocosDoRoteiro({
      blocos: [bloco("Fala um.", "Tela um"), bloco("Fala dois, curta.", "")],
    });
    expect(b).toEqual([
      { falar: "Fala um.", tela: "Tela um" },
      { falar: "Fala dois, curta.", tela: "Fala dois, curta." },
    ]);
  });

  it("texto longo é cortado na última palavra inteira, com reticências", () => {
    const longa =
      "A humildade verdadeira não é pensar menos de si, é pensar menos em si mesmo sempre";
    const [b] = blocosDoRoteiro({ blocos: [bloco(longa, "")] });
    expect(b.tela.length).toBeLessThanOrEqual(61);
    expect(b.tela.endsWith("…")).toBe(true);
    expect(longa.startsWith(b.tela.slice(0, -1))).toBe(true);
    expect(b.falar).toBe(longa); // a voz diz tudo
  });

  it("bloco sem fala não entra", () => {
    expect(blocosDoRoteiro({ blocos: [bloco("   ", "Só tela")] })).toEqual([]);
  });
});

describe("duracaoDaSaidaFfmpeg", () => {
  it("lê a duração que o ffmpeg imprime", () => {
    expect(
      duracaoDaSaidaFfmpeg("Input #0, mp3\n  Duration: 00:00:05.23, start: 0.0"),
    ).toBeCloseTo(5.23, 5);
    expect(duracaoDaSaidaFfmpeg("  Duration: 00:01:30.50,")).toBeCloseTo(90.5, 5);
    expect(duracaoDaSaidaFfmpeg("arquivo inválido")).toBeNull();
  });
});
