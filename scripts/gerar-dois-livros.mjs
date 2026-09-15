import { readFileSync, writeFileSync } from "node:fs";

const replacements = new Map([
  ["ﬁ", "fi"],
  ["ﬂ", "fl"],
  ["\u00ad", ""],
]);

function normalize(text) {
  for (const [from, to] of replacements) text = text.split(from).join(to);
  return text
    .normalize("NFC")
    .replace(/([a-zà-ÿ])[-­]\s+/gi, "$1")
    .replace(/[ \t]+/g, " ");
}

function clean(text, title) {
  const paragraphs = [];
  let current = [];

  function flush() {
    const value = normalize(current.join(" "))
      .replace(/\s+([,.;:!?])/g, "$1")
      .trim();
    if (value && value.toLowerCase() !== title.toLowerCase()) paragraphs.push(value);
    current = [];
  }

  for (const raw of text.split("\n")) {
    const line = raw.trim();
    if (!line || /^\d{1,3}$/.test(line)) {
      flush();
      continue;
    }
    if (/^(A busca da santidade|O cristão e a cultura)$/i.test(line)) continue;
    current.push(line);
  }
  flush();
  return paragraphs.join("\n\n").replace(/\n{3,}/g, "\n\n").trim();
}

function section(text, marker, nextMarker) {
  const start = text.lastIndexOf(marker);
  if (start < 0) throw new Error(`Marcador não encontrado: ${marker}`);
  const end = nextMarker ? text.lastIndexOf(nextMarker) : text.length;
  if (end <= start) throw new Error(`Ordem inválida: ${marker}`);
  return text.slice(start, end);
}

function makeBook({ slug, titulo, autor, categoria, source, sections, capa }) {
  const text = readFileSync(source, "utf8");
  const aulas = sections.map((item, index) => ({
    ordem: index + 1,
    titulo: item.titulo,
    conteudo: clean(section(text, item.marker, sections[index + 1]?.marker), item.titulo),
  }));
  if (aulas.some((aula) => aula.conteudo.length < 200)) {
    throw new Error(`Aula curta em ${slug}`);
  }
  writeFileSync(
    `tmp/livros/${slug}.json`,
    JSON.stringify({ slug, titulo, autor, categoria, capa, aulas }),
  );
  console.log(`${slug}: ${aulas.length} aulas, ${aulas.reduce((n, aula) => n + aula.conteudo.length, 0)} caracteres`);
}

makeBook({
  slug: "a-busca-da-santidade",
  titulo: "A Busca da Santidade",
  autor: "Jerry Bridges",
  categoria: "santidade",
  source: "/tmp/busca-santidade.txt",
  capa: "/capas/a-busca-da-santidade.jpg",
  sections: [
    ["Prólogo", "PRÓLOGO"],
    ["Prefácio", "PREFÁCIO"],
    ["Capítulo 1 - A santidade é para você", "1. A SANTIDADE É PARA VOCÊ"],
    ["Capítulo 2 - A santidade de Deus", "2. A SANTIDADE DE DEUS"],
    ["Capítulo 3 - A santidade não é uma opção", "3. A SANTIDADE NÃO É UMA OPÇÃO"],
    ["Capítulo 4 - A santidade de Cristo", "4. A SANTIDADE DE CRISTO"],
    ["Capítulo 5 - Uma mudança de reinos", "5. UMA MUDANÇA DE REINOS"],
    ["Capítulo 6 - A batalha por santidade", "6. A BATALHA POR SANTIDADE"],
    ["Capítulo 7 - Ajuda na batalha diária", "7. AJUDA NA BATALHA DIÁRIA"],
    ["Capítulo 8 - Obediência - não vitória", "8. OBEDIÊNCIA — NÃO VITÓRIA"],
    ["Capítulo 9 - Mortificando o pecado", "9. MORTIFICANDO O PECADO"],
    ["Capítulo 10 - O lugar da disciplina pessoal", "10. O LUGAR DA DISCIPLINA PESSOAL"],
    ["Capítulo 11 - Santidade no corpo", "11. SANTIDADE NO CORPO"],
    ["Capítulo 12 - Santidade no espírito", "12. SANTIDADE NO ESPÍRITO"],
    ["Capítulo 13 - A santidade e a nossa vontade", "13. A SANTIDADE E A NOSSA VONTADE"],
    ["Capítulo 14 - Hábitos de santidade", "14. HÁBITOS DE SANTIDADE"],
    ["Capítulo 15 - Santidade e fé", "15. SANTIDADE E FÉ"],
    ["Capítulo 16 - Santidade num mundo ímpio", "16. SANTIDADE NUM MUNDO ÍMPIO"],
    ["Capítulo 17 - A alegria da santidade", "17. A ALEGRIA DA SANTIDADE"],
    ["Uma nota adicional", "UMA NOTA ADICIONAL"],
    ["O autor", "O AUTOR"],
  ].map(([titulo, marker]) => ({ titulo, marker })),
});

makeBook({
  slug: "o-cristao-e-a-cultura",
  titulo: "O Cristão e a Cultura",
  autor: "Michael Horton",
  categoria: "cultura",
  source: "/tmp/cristao-cultura.txt",
  capa: "/capas/o-cristao-e-a-cultura.jpg",
  sections: [
    ["Introdução", "Por vezes os hinos me confundem."],
    ["Capítulo 1 - Como ser um cristão secular", "Como ser um cristão secular"],
    ["Capítulo 2 - Esfera de soberania: cuidar dos nossos próprios afazeres", "Esfera de soberania:"],
    ["Capítulo 3 - Vã filosofia: uma desculpa para o anti-intelectualismo?", "Vã filosofia"],
    ["Capítulo 4 - O cristianismo e as artes", "O cristianismo e as artes"],
    ["Capítulo 5 - A arte na vida do cristão", "A arte na vida do cristão"],
    ["Capítulo 6 - O cristianismo e a ciência moderna: não podemos ser amigos?", "O cristianismo e a ciência moderna"],
    ["Capítulo 7 - Trabalhar para o final de semana", "Trabalhar para o final de semana"],
    ["Capítulo 8 - Um mundo enlouquecido", "Um mundo enlouquecido"],
    ["Conclusão - No mundo, mas não do mundo", "Conclusão"],
  ].map(([titulo, marker]) => ({ titulo, marker })),
});