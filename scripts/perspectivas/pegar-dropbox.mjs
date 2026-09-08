// Captura o conteúdo de um PDF do Dropbox pelo visualizador: o link vem com
// download desabilitado, mas a página de preview carrega o texto (JSON com a
// posição de cada trecho) e as páginas em PNG.
//
// Espera o stream de texto chegar antes de rolar — a página é uma SPA e
// demora a resolver o documento; rolar às cegas devolve captura vazia.
import { chromium } from "playwright-core";
import fs from "node:fs";

const [url, prefixo] = process.argv.slice(2);
const browser = await chromium.launch({ headless: true, executablePath: process.env.CHROME_BIN });
const ctx = await browser.newContext({
  userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36",
  locale: "pt-BR",
});
const page = await ctx.newPage();

let imgs = 0, temTexto = false;
page.on("response", async (res) => {
  const u = res.url();
  try {
    if (u.includes("/p/pdf_txt/")) {
      fs.writeFileSync(`${prefixo}-texto.json`, await res.body());
      temTexto = true;
    } else if (u.includes("/p/pdf_img/")) {
      fs.writeFileSync(`${prefixo}-pag${String(imgs++).padStart(2, "0")}.png`, await res.body());
    }
  } catch {}
});

try {
  await page.goto(url, { waitUntil: "commit", timeout: 60000 });
} catch (e) {
  console.log(`${prefixo}: FALHA ao abrir — ${e.message.split("\n")[0]}`);
  await browser.close();
  process.exit(1);
}

// espera o documento resolver (até 60s)
for (let i = 0; i < 30 && !temTexto; i++) await page.waitForTimeout(2000);

if (!temTexto) {
  console.log(`${prefixo}: FALHA — preview não carregou. titulo="${await page.title()}"`);
  await browser.close();
  process.exit(1);
}

// rola pra forçar o carregamento de todas as páginas em imagem
let antes = -1;
for (let i = 0; i < 25 && imgs !== antes; i++) {
  antes = imgs;
  for (let j = 0; j < 3; j++) {
    await page.mouse.wheel(0, 2500);
    await page.waitForTimeout(700);
  }
}
console.log(`${prefixo}: OK titulo="${await page.title()}" imagens=${imgs}`);
await browser.close();
