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
  atualizarExecucaoPiloto,
  deletarCarrosselInstagram,
  desagendarCarrosselInstagram,
  getCarrosselInstagram,
  getPendenteWhatsApp,
  getPerfilConteudo,
  listExecucoesPiloto,
  reagendarCarrosselInstagram,
  salvarCarrosselInstagram,
  setPendenteWhatsApp,
} from "@/lib/db";
import { gerarCarrosselIA } from "@/lib/instagram";
import { ogUrlDoSlide, type SlidePub } from "@/lib/instagram-imagens";
import { instrucaoDoModelo, MODELO_AUTOMATICO } from "@/lib/instagram-modelos";
import { instagramConfigurado } from "@/lib/instagram-publish";
import { TEMA_PADRAO } from "@/lib/instagram-render";
import { podeVetar, quandoPorExtenso } from "@/lib/piloto";
import { siteBase } from "@/lib/site-url";
import { enviarImagemWhatsApp, enviarTextoWhatsApp } from "@/lib/whatsapp-enviar";
import {
  AJUDA_INSTAGRAM,
  type ComandoInstagram,
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

// Cada "refazer" é uma chamada à IA e mais imagens. Depois disto, é melhor
// abrir o site e ajustar à mão.
export const REFAZER_MAX = 3;

const OPCOES = [
  "Responda:",
  "• *publicar* — vai ao ar agora",
  "• *publicar terça 19h* — fica agendado",
  "• *refazer* — faço outra versão",
  "• *cancelar* — descarto",
].join("\n");

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

/**
 * Cria o rascunho a partir da ideia, guarda como pendente e manda a prévia.
 * `ajuste` é o pedido de um "refazer mais curto": vale só para esta versão.
 */
async function criar(
  numero: string,
  ideia: string,
  tentativas: number,
  ajuste = "",
): Promise<void> {
  const perfil = await getPerfilConteudo(true).catch(() => null);
  const carrossel = await gerarCarrosselIA(
    `IDEIA DO PASTOR: ${ideia}${ajuste ? `\n\nAJUSTE PEDIDO PELO PASTOR (obrigatório): ${ajuste}` : ""}`,
    "carrossel",
    `${systemCarrosselDaIdeia("carrossel", perfil ? contextoDoPerfil(perfil) : "")}\n\n${instrucaoDoModelo(MODELO_AUTOMATICO)}`,
  );
  const slides: SlidePub[] = carrossel.slides.map((s) => ({
    ...s,
    fonte: "anton",
    top: "",
    ref: "",
    seed: Math.floor(Math.random() * 1_000_000),
    tema: TEMA_PADRAO,
    tom: "escuro",
    modelo: MODELO_AUTOMATICO,
  }));
  const { id } = await salvarCarrosselInstagram(
    { conteudo: ideia, slides: slides as never, legenda: carrossel.legenda },
    true,
  );
  await setPendenteWhatsApp({ carrossel_id: id, ideia, tentativas });

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

async function refazer(numero: string, ajuste: string): Promise<void> {
  const pendente = await getPendenteWhatsApp();
  if (!pendente?.ideia) {
    await dizer(numero, "Não há rascunho para refazer. Mande *post* + a ideia.");
    return;
  }
  if (pendente.tentativas >= REFAZER_MAX) {
    await dizer(
      numero,
      `Já refiz ${REFAZER_MAX} vezes. Para ajustar no detalhe, abra o rascunho no site: ${siteBase()}/admin/instagram?aba=criar`,
    );
    return;
  }
  // Só apaga a versão anterior se ela ainda é rascunho (nunca um post agendado ou publicado).
  const anterior = pendente.carrossel_id
    ? await getCarrosselInstagram(pendente.carrossel_id)
    : null;
  if (anterior?.status === "rascunho")
    await deletarCarrosselInstagram(anterior.id, true);
  await dizer(numero, "⏳ Fazendo outra versão…");
  await criar(numero, pendente.ideia, pendente.tentativas + 1, ajuste);
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
        await dizer(numero, "⏳ Montando o carrossel. Leva uns 20 segundos.");
        await criar(numero, comando.ideia, 0);
        return;
      case "publicar":
        await publicar(numero, comando.quando, agora);
        return;
      case "refazer":
        await refazer(numero, comando.ajuste);
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
