/**
 * Executa um comando de Instagram vindo do WhatsApp (issue #189) e responde
 * no próprio chat. Chamado pelo webhook depois de conferir que a mensagem é
 * do chat "Você" do dono; aqui não há sessão, então tudo usa o modo serviço.
 *
 * "publicar" não publica direto: marca o post como agendado para agora (ou
 * para o horário dito) e o cron dos agendados faz o resto. É o mesmo caminho
 * de todo post da plataforma — um só lugar que fala com o Instagram.
 */
import { systemCarrosselDaIdeia } from "@/lib/carrossel-ideia";
import { contextoDoPerfil, preferenciaDaRecusa } from "@/lib/conteudo-perfil";
import {
  aprenderPreferencia,
  atualizarConteudoCarrosselInstagram,
  atualizarExecucaoPiloto,
  deletarCarrosselInstagram,
  desagendarCarrosselInstagram,
  getCarrosselInstagram,
  getPendenteWhatsApp,
  getPerfilConteudo,
  listExecucoesPiloto,
  type PendenteWhatsApp,
  reagendarCarrosselInstagram,
  salvarCarrosselInstagram,
  setPendenteWhatsApp,
  ultimoVisualUsado,
} from "@/lib/db";
import { gerarCarrosselIA } from "@/lib/instagram";
import { ehStory, ogUrlDoSlide, type SlidePub } from "@/lib/instagram-imagens";
import {
  instrucaoDoModelo,
  MODELOS_AUTOMATICOS,
  sortearDiferente,
  TEMAS_AUTOMATICOS,
} from "@/lib/instagram-modelos";
import { instagramConfigurado } from "@/lib/instagram-publish";
import { lerJSONdaIA } from "@/lib/json-ia";
import { chamarLLMLendo } from "@/lib/llm";
import { podeVetar, quandoPorExtenso } from "@/lib/piloto";
import {
  type Ajuste,
  aplicarAjuste,
  aplicarDestaque,
  interpretarAjuste,
  lerAjusteDaIA,
  lerCercaDoTexto,
  lerTextoPronto,
  MARCA_TEXTO,
  MODELOS_TEXTO_PRONTO,
  pedidoDeAjuste,
  systemAjuste,
  systemTextoPronto,
} from "@/lib/post-texto-pronto";
import { siteBase } from "@/lib/site-url";
import { enviarImagemWhatsApp, enviarTextoWhatsApp } from "@/lib/whatsapp-enviar";
import {
  AJUDA_INSTAGRAM,
  type ComandoInstagram,
  type FormatoPost,
  interpretarQuando,
  MARCA_ROBO,
} from "@/lib/whatsapp-instagram";

/** Todo texto deste recurso sai por aqui, com a marca do robô na frente. */
function dizer(numero: string, mensagem: string) {
  return enviarTextoWhatsApp(
    numero,
    mensagem.startsWith(MARCA_ROBO) ? mensagem : `${MARCA_ROBO} ${mensagem}`,
  );
}

const PERGUNTA_FORMATO = [
  "Qual formato?",
  "• *1* — uma imagem só",
  "• *2* — carrossel",
  "• *3* — story",
  "",
  "Da próxima vez pode dizer junto: _post único sobre…_, _carrossel sobre…_ ou _story sobre…_",
].join("\n");

const AVISO_MONTANDO: Record<FormatoPost, string> = {
  unico: "⏳ Montando a imagem. Leva uns 15 segundos.",
  carrossel: "⏳ Montando o carrossel. Leva uns 20 segundos.",
  story: "⏳ Montando o story. Leva uns 15 segundos.",
};

// Quanto tempo a pergunta do formato espera pela resposta.
export const ESPERA_FORMATO_MIN = 30;

/** Há uma ideia guardada, sem rascunho, esperando o pastor dizer o formato? */
export function esperandoFormato(
  p: PendenteWhatsApp | null,
  agora: Date,
): p is PendenteWhatsApp {
  if (!p?.ideia || p.carrossel_id) return false;
  if (!p.atualizado_em) return true;
  return (
    agora.getTime() - new Date(p.atualizado_em).getTime() < ESPERA_FORMATO_MIN * 60_000
  );
}

// Quanto tempo depois da última prévia uma mensagem como "troca a foto" ainda
// é lida como ajuste do rascunho. Passado isso, volta a ser assunto da agenda.
export const ESPERA_AJUSTE_MIN = 120;

/** Há um rascunho na tela, recente, que um "corrige…" possa estar ajustando? */
export function rascunhoNaTela(p: PendenteWhatsApp | null, agora: Date): boolean {
  if (!p?.carrossel_id || !p.atualizado_em) return false;
  return (
    agora.getTime() - new Date(p.atualizado_em).getTime() < ESPERA_AJUSTE_MIN * 60_000
  );
}

// Cada "refazer" é uma chamada à IA e mais imagens. Depois disto, é melhor
// abrir o site e ajustar à mão.
export const REFAZER_MAX = 3;

const OPCOES = [
  "Responda:",
  "• *publicar* — vai ao ar agora",
  "• *publicar terça 19h* — fica agendado",
  '• *ajustar* + o que mudar — mexo só nisso (_ajustar texto: …_, _destacar "palavra" em amarelo_, _outra foto_)',
  "• *refazer* — faço outra versão",
  "• *cancelar* — descarto",
].join("\n");

const SEU_TEXTO = "_O seu texto foi na íntegra._";
const TEXTO_DA_IA =
  "_Escrevi a frase a partir da sua ideia. Para ir o seu texto exato: *ajustar texto:* + a frase._";

/**
 * Guarda o motivo de uma recusa como preferência e devolve o que acrescentar
 * à resposta. Sem motivo, não há o que aprender — e a resposta fica como era.
 */
async function aprender(motivo: string, titulo: string): Promise<string> {
  const frase = motivo ? preferenciaDaRecusa("outro", motivo, titulo) : null;
  if (!frase) return "";
  const guardou = await aprenderPreferencia(frase, true).catch(() => false);
  return guardou ? " Anotei o motivo: vou levar em conta nas próximas." : "";
}

/** Manda a prévia de uma imagem só (post único ou story) e o que dá para fazer com ela. */
async function mandarPrevia(
  numero: string,
  slide: SlidePub,
  legenda: string,
  nota: string,
): Promise<void> {
  const story = slide.formato === "story";
  const base = siteBase();
  if (base) {
    await enviarImagemWhatsApp(
      numero,
      ogUrlDoSlide(base, slide),
      `${MARCA_ROBO} ${story ? "O story" : "A imagem"}`,
    );
  }
  const frase = `${slide.texto.replace(/[{}~]/g, "")}${slide.ref ? `\n— ${slide.ref}` : ""}`;
  await dizer(
    numero,
    story
      ? // Story não tem legenda: a que a IA escreveu fica guardada, mas não é publicada.
        `*Story pronto*\n\n${frase}\n\n${nota}\nStory não leva legenda e some em 24 horas.\n\n${OPCOES}`
      : `*Imagem pronta*\n\n${frase}\n\n${nota}\n\n*Legenda*\n${legenda}\n\n${OPCOES}`,
  );
}

/**
 * Cria o rascunho a partir da ideia, guarda como pendente e manda a prévia.
 * `ajuste` é o pedido de um "refazer mais curto": vale só para esta versão.
 */
async function criar(
  numero: string,
  ideia: string,
  tentativas: number,
  ajuste = "",
  formato: FormatoPost = "carrossel",
): Promise<void> {
  const perfil = await getPerfilConteudo(true).catch(() => null);
  // Modelo e cor diferentes dos do post anterior: é o que impede o perfil de
  // ficar todo com a mesma cara. Escolhido ANTES do texto, porque cada modelo
  // pede a frase num formato.
  const ultimo = await ultimoVisualUsado().catch(() => ({ modelo: "", tema: "" }));
  const tema = sortearDiferente(TEMAS_AUTOMATICOS, ultimo.tema);
  const contexto = perfil ? contextoDoPerfil(perfil) : "";
  // Texto pronto (imagem única ou story): a frase do pastor vai na íntegra.
  // A IA só escolhe o destaque, a foto e escreve a legenda — ela nem devolve
  // o texto, então não tem como trocar uma palavra. Carrossel precisa repartir
  // a ideia em slides, por isso continua sendo escrito por ela.
  const pronto = formato === "carrossel" ? null : lerTextoPronto(ideia);
  if (pronto) {
    const cerca = await chamarLLMLendo(
      systemTextoPronto(contexto),
      `TEXTO DO PASTOR (não reescrever): ${pronto.texto}${pronto.ref ? `\nREFERÊNCIA QUE ELE ESCREVEU: ${pronto.ref}` : ""}${ajuste ? `\n\nAJUSTE PEDIDO PELO PASTOR (obrigatório): ${ajuste}` : ""}`,
      1200,
      (bruto) => lerCercaDoTexto(lerJSONdaIA(bruto)),
    );
    const slide: SlidePub = {
      // Destaque que não está no texto é ignorado: o texto não muda por causa dele.
      texto: aplicarDestaque(pronto.texto, cerca.destaque ? [cerca.destaque] : [])
        .texto,
      prompt: cerca.prompt,
      modo: "grifo",
      fonte: "anton",
      top: "",
      ref: pronto.ref,
      seed: Math.floor(Math.random() * 1_000_000),
      tema,
      tom: "escuro",
      modelo: sortearDiferente(MODELOS_TEXTO_PRONTO, ultimo.modelo),
      ...(formato === "story" ? { formato: "story" } : {}),
    };
    const { id } = await salvarCarrosselInstagram(
      { conteudo: ideia, slides: [slide] as never, legenda: cerca.legenda },
      true,
    );
    await setPendenteWhatsApp({ carrossel_id: id, ideia, tentativas });
    await mandarPrevia(numero, slide, cerca.legenda, SEU_TEXTO);
    return;
  }
  const modelo = sortearDiferente(MODELOS_AUTOMATICOS, ultimo.modelo);
  const carrossel = await gerarCarrosselIA(
    `IDEIA DO PASTOR: ${ideia}${ajuste ? `\n\nAJUSTE PEDIDO PELO PASTOR (obrigatório): ${ajuste}` : ""}`,
    // Story é uma imagem só, como o post único; muda o tamanho e onde é publicado.
    formato === "carrossel" ? "carrossel" : "unico",
    `${systemCarrosselDaIdeia(formato === "carrossel" ? "carrossel" : "unico", contexto)}\n\n${instrucaoDoModelo(modelo)}`,
  );
  const slides: SlidePub[] = carrossel.slides.map((s) => ({
    ...s,
    fonte: "anton",
    top: "",
    ref: "",
    seed: Math.floor(Math.random() * 1_000_000),
    tema,
    tom: "escuro",
    modelo,
    ...(formato === "story" ? { formato: "story" } : {}),
  }));
  const { id } = await salvarCarrosselInstagram(
    { conteudo: ideia, slides: slides as never, legenda: carrossel.legenda },
    true,
  );
  await setPendenteWhatsApp({ carrossel_id: id, ideia, tentativas });

  if (slides.length === 1) {
    await mandarPrevia(numero, slides[0], carrossel.legenda, TEXTO_DA_IA);
    return;
  }
  // A prévia é o primeiro slide; os outros vão em texto para não inundar o chat.
  const base = siteBase();
  if (base) {
    await enviarImagemWhatsApp(
      numero,
      ogUrlDoSlide(base, slides[0]),
      `${MARCA_ROBO} Slide 1 de ${slides.length}`,
    );
  }
  const textoSlides = slides
    .map((s, i) => `${i + 1}. ${s.texto.replace(/[{}]/g, "")}`)
    .join("\n");
  await dizer(
    numero,
    `*Carrossel pronto* (${slides.length} slides)\n\n${textoSlides}\n\n*Legenda*\n${carrossel.legenda}\n\n${OPCOES}`,
  );
}

async function publicar(numero: string, quando: string, agora: Date): Promise<void> {
  const pendente = await getPendenteWhatsApp();
  const post = pendente?.carrossel_id
    ? await getCarrosselInstagram(pendente.carrossel_id)
    : null;
  if (!post || post.status === "publicado") {
    await dizer(
      numero,
      "Não há rascunho esperando. Mande *post* + a ideia para eu montar um.",
    );
    return;
  }
  if (!instagramConfigurado()) {
    await dizer(
      numero,
      "O Instagram não está conectado no servidor, então não consigo publicar. O rascunho continua guardado no site.",
    );
    return;
  }
  const instante = interpretarQuando(quando, agora);
  if (!instante) {
    await dizer(
      numero,
      `Não entendi quando publicar ("${quando}"). Tente: *publicar*, *publicar hoje 20h*, *publicar amanhã 8h* ou *publicar terça 19h*.`,
    );
    return;
  }
  await reagendarCarrosselInstagram(post.id, instante, true);
  const eAgora = new Date(instante).getTime() - agora.getTime() < 60_000;
  await dizer(
    numero,
    eAgora
      ? "✅ Aprovado. Vai ao ar em até 5 minutos."
      : `✅ Agendado para ${quandoPorExtenso(instante)}. Se mudar de ideia, responda *cancelar*.`,
  );
}

/**
 * Muda só o que foi pedido no rascunho que está na tela: o texto, o trecho
 * destacado, a cor, a referência, a foto. Não gera outro rascunho e não conta
 * como "refazer". Pedido direto é lido sem IA; o resto ela traduz, e o que ela
 * devolve passa pela mesma aplicação — que não toca no que não foi pedido.
 */
async function ajustar(numero: string, pedido: string): Promise<void> {
  const pendente = await getPendenteWhatsApp();
  const post = pendente?.carrossel_id
    ? await getCarrosselInstagram(pendente.carrossel_id)
    : null;
  if (!pendente || !post || post.status === "publicado") {
    await dizer(numero, "Não há rascunho para ajustar. Mande *post* + a ideia.");
    return;
  }
  const slides = (post.slides ?? []) as unknown as SlidePub[];
  if (slides.length !== 1) {
    // Carrossel: o ajuste vale para o conjunto, então quem reescreve é a IA.
    await refazer(numero, pedido);
    return;
  }
  const atual = slides[0];
  let ajuste: Ajuste | null = interpretarAjuste(pedido);
  let resultado = ajuste ? aplicarAjuste(atual, ajuste) : null;
  // Sem leitura direta, ou com trecho que não está no texto: a IA interpreta.
  if (!resultado || !resultado.mudou.length) {
    ajuste = await chamarLLMLendo(
      systemAjuste(),
      pedidoDeAjuste(atual, pedido),
      900,
      (bruto) => lerAjusteDaIA(lerJSONdaIA(bruto)),
    ).catch(() => null);
    resultado = ajuste ? aplicarAjuste(atual, ajuste) : null;
  }
  if (!resultado?.mudou.length) {
    const faltou = resultado?.naoAchei.length
      ? ` Não achei no texto: "${resultado.naoAchei.join('", "')}".`
      : "";
    await dizer(
      numero,
      `Não consegui aplicar esse ajuste.${faltou} Tente assim:\n• *ajustar texto:* + a frase inteira\n• *destacar "trecho" em amarelo*\n• *outra foto* · *outra cor* · *outro modelo*`,
    );
    return;
  }
  const novo = resultado.slide;
  const mudouTexto = resultado.mudou.includes("o texto");
  // Se o pastor ditou o texto, o rascunho passa a ser "texto pronto": um
  // "refazer" depois disso não pode voltar a reescrever a frase.
  const ideia = mudouTexto
    ? `${MARCA_TEXTO}${novo.texto.replace(/[{}]/g, "")}${novo.ref ? `\n${novo.ref}` : ""}`
    : pendente.ideia;
  await atualizarConteudoCarrosselInstagram(
    post.id,
    { slides: [novo] as never, ...(mudouTexto ? { conteudo: ideia } : {}) },
    true,
  );
  await setPendenteWhatsApp({ ...pendente, ideia });
  const faltou = resultado.naoAchei.length
    ? ` Não achei no texto: "${resultado.naoAchei.join('", "')}".`
    : "";
  await mandarPrevia(
    numero,
    novo,
    post.legenda ?? "",
    `_Mudei ${resultado.mudou.join(", ")}; o resto ficou como estava._${faltou}`,
  );
}

async function refazer(numero: string, ajuste: string): Promise<void> {
  const pendente = await getPendenteWhatsApp();
  if (!pendente?.ideia) {
    await dizer(numero, "Não há rascunho para refazer. Mande *post* + a ideia.");
    return;
  }
  const anterior = pendente.carrossel_id
    ? await getCarrosselInstagram(pendente.carrossel_id)
    : null;
  // "refazer com a palavra X em amarelo" numa imagem só é um ajuste: muda o
  // que foi pedido e deixa o resto. Gerar tudo de novo era o que fazia a
  // correção se perder (issue #239).
  if (ajuste && anterior?.status === "rascunho" && anterior.slides?.length === 1) {
    await ajustar(numero, ajuste);
    return;
  }
  if (pendente.tentativas >= REFAZER_MAX) {
    await dizer(
      numero,
      `Já refiz ${REFAZER_MAX} vezes. Para mudar um detalhe sem refazer, responda *ajustar* + o que mudar. Ou abra o rascunho no site: ${siteBase()}/admin/instagram?aba=criar`,
    );
    return;
  }
  // Só apaga a versão anterior se ela ainda é rascunho (nunca um post agendado ou publicado).
  if (anterior?.status === "rascunho")
    await deletarCarrosselInstagram(anterior.id, true);
  await dizer(numero, "⏳ Fazendo outra versão…");
  // Refaz no mesmo formato da versão anterior.
  const slidesAnteriores = (anterior?.slides ?? []) as { formato?: string }[];
  const formato: FormatoPost = ehStory(slidesAnteriores)
    ? "story"
    : slidesAnteriores.length === 1
      ? "unico"
      : "carrossel";
  await criar(numero, pendente.ideia, pendente.tentativas + 1, ajuste, formato);
}

async function cancelarRascunho(numero: string, motivo: string): Promise<void> {
  const pendente = await getPendenteWhatsApp();
  const post = pendente?.carrossel_id
    ? await getCarrosselInstagram(pendente.carrossel_id)
    : null;
  if (!post) {
    await dizer(
      numero,
      "Não há rascunho esperando. Para tirar da fila o que o piloto agendou: *cancelar carrossel*, *cancelar reel* ou *cancelar tudo*.",
    );
    return;
  }
  if (post.status === "agendado") {
    await desagendarCarrosselInstagram(post.id, true);
    await dizer(
      numero,
      `🛑 Tirei da fila. O post voltou a ser rascunho e não vai ao ar.${await aprender(motivo, pendente?.ideia ?? "")}`,
    );
    return;
  }
  if (post.status === "rascunho") {
    await deletarCarrosselInstagram(post.id, true);
    await setPendenteWhatsApp({ carrossel_id: null, ideia: "", tentativas: 0 });
    await dizer(
      numero,
      `🗑️ Rascunho descartado.${await aprender(motivo, pendente?.ideia ?? "")}`,
    );
    return;
  }
  await dizer(numero, "Esse post já foi ao ar; não dá mais para cancelar por aqui.");
}

/** Veta peças que o piloto automático agendou na execução mais recente. */
async function cancelarDoPiloto(
  numero: string,
  alvo: "carrossel" | "reel" | "tudo",
  agora: Date,
  motivo: string,
): Promise<void> {
  const [execucao] = await listExecucoesPiloto(true);
  const tipos =
    alvo === "tudo"
      ? ["carrossel", "reel_ia"]
      : [alvo === "reel" ? "reel_ia" : "carrossel"];
  const vetadas: string[] = [];
  const titulos: string[] = [];
  const pecas = [];
  for (const p of execucao?.pecas ?? []) {
    if (tipos.includes(p.tipo) && podeVetar(p, agora)) {
      if (p.post_id) await desagendarCarrosselInstagram(p.post_id, true);
      vetadas.push(p.tipo === "reel_ia" ? "o Reel" : "o carrossel");
      if (p.titulo && !titulos.includes(p.titulo)) titulos.push(p.titulo);
      pecas.push({ ...p, estado: "vetado" as const });
    } else {
      pecas.push(p);
    }
  }
  if (!execucao || !vetadas.length) {
    await dizer(numero, "Não há nada do piloto agendado para cancelar.");
    return;
  }
  await atualizarExecucaoPiloto(execucao.id, { pecas });
  await dizer(
    numero,
    `🛑 Cancelei ${vetadas.join(" e ")}. Não vai ao ar.${await aprender(motivo, titulos.join(" / "))}`,
  );
}

/** Executa o comando e responde. Nunca lança: a falha vira uma mensagem no chat. */
export async function executarComandoInstagram(
  comando: ComandoInstagram,
  numero: string,
  agora = new Date(),
): Promise<void> {
  try {
    switch (comando.tipo) {
      case "ajuda":
        await dizer(numero, AJUDA_INSTAGRAM);
        return;
      case "criar":
        if (!comando.formato) {
          // Guarda a ideia e pergunta. Ideia sem rascunho = esperando o formato.
          await setPendenteWhatsApp({
            carrossel_id: null,
            ideia: comando.ideia,
            tentativas: 0,
          });
          await dizer(numero, PERGUNTA_FORMATO);
          return;
        }
        await dizer(numero, AVISO_MONTANDO[comando.formato]);
        await criar(numero, comando.ideia, 0, "", comando.formato);
        return;
      case "formato": {
        const esperando = await getPendenteWhatsApp();
        // Só vale como resposta se houver uma ideia esperando, e recente:
        // um "2" solto no chat, horas depois, não é conosco.
        if (!esperandoFormato(esperando, agora)) return;
        await dizer(numero, AVISO_MONTANDO[comando.formato]);
        await criar(numero, esperando.ideia, 0, "", comando.formato);
        return;
      }
      case "publicar":
        await publicar(numero, comando.quando, agora);
        return;
      case "refazer":
        await refazer(numero, comando.ajuste);
        return;
      case "ajustar":
        await ajustar(numero, comando.pedido);
        return;
      case "cancelar":
        if (comando.alvo === "rascunho") await cancelarRascunho(numero, comando.motivo);
        else await cancelarDoPiloto(numero, comando.alvo, agora, comando.motivo);
        return;
    }
  } catch (e) {
    console.error("[whatsapp-instagram]", e instanceof Error ? e.message : e);
    await dizer(
      numero,
      `⚠️ Não consegui: ${e instanceof Error ? e.message : "erro inesperado"}. Tente de novo em instantes.`,
    );
  }
}
