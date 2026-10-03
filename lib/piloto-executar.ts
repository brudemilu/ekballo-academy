/**
 * A execução semanal do piloto automático (issue #189): escolhe a fonte, gera
 * as peças, agenda o que vai ao ar sozinho, guarda o que espera o pastor e
 * avisa no WhatsApp. Roda em segundo plano, disparada pelo cron ou pelo botão
 * "Rodar agora" — nunca há usuário logado aqui, por isso tudo que lê e grava
 * usa o modo serviço do lib/db.ts.
 *
 * Ordem das etapas pensada para o pior caso: o aviso só sai DEPOIS que tudo
 * foi gravado, e o que foi agendado respeita a janela de veto mesmo se o
 * aviso falhar — o pastor ainda vê na tela do piloto.
 */
import { diaSP } from "@/lib/conteudo-calendario";
import { trechoFalado } from "@/lib/cortes";
import {
  atualizarExecucaoPiloto,
  criarIdeiaConteudo,
  getCorteConteudo,
  getPerfilConteudo,
  getPilotoConfig,
  listAulasByCurso,
  listCortesConteudo,
  listCursosPublicados,
  salvarCarrosselInstagram,
  salvarPilotoConfig,
  salvarRoteiroConteudo,
} from "@/lib/db";
import { diaAnoFromDateStr, getDevocionalDoDia } from "@/lib/devocionais";
import { isMockMode } from "@/lib/mock-data";
import { gerarPecasDaFonte, slidesParaSalvar } from "@/lib/pacote-gerar";
import {
  escolherFonte,
  horariosDaExecucao,
  mensagemDoPiloto,
  type PecaPiloto,
  type PilotoConfig,
  type TipoFontePiloto,
} from "@/lib/piloto";
import { lerEApagar, montarReelNarrado } from "@/lib/reel-narrado";
import {
  type FonteRoteiro,
  MIN_FONTE,
  type Roteiro,
  recortarFonte,
} from "@/lib/roteiro";
import { siteBase } from "@/lib/site-url";
import { createServiceClient } from "@/lib/supabase/service";
import { enviarTextoWhatsApp } from "@/lib/whatsapp-enviar";

const MARCA_AVALIACAO = "[[AVALIACAO_PARACH]]";
const DURACAO_REEL = 30;

const CENA_PADRAO = "sunrise light over quiet mountains";

/**
 * Monta o Reel, sobe para o Storage e devolve a URL pública (é de lá que o
 * Instagram busca o vídeo na hora de publicar).
 */
async function montarEGuardarReel(
  roteiro: Roteiro,
  execucaoId: string,
  cena: string,
): Promise<string> {
  const reel = await montarReelNarrado(roteiro, {
    id: execucaoId,
    cena,
    seed: Date.now() % 1000,
  });
  const bytes = await lerEApagar(reel.arquivo);
  // No modo demonstração não há Storage: o vídeo foi montado de verdade, só não fica guardado.
  if (isMockMode()) return `mock://reel-${execucaoId}.mp4`;
  const storage = createServiceClient().storage.from("instagram");
  const caminho = `reels/piloto-${execucaoId}.mp4`;
  const { error } = await storage.upload(caminho, bytes, {
    contentType: "video/mp4",
    upsert: true,
  });
  if (error) throw new Error(`não consegui guardar o vídeo: ${error.message}`);
  return storage.getPublicUrl(caminho).data.publicUrl;
}

type FonteEscolhida = {
  tipo: TipoFontePiloto;
  fonte: FonteRoteiro;
  /** O que gravar na configuração para a próxima semana não repetir. */
  avanco: Partial<PilotoConfig>;
};

/** A próxima mesa do livro seguido, depois da última já usada. */
async function fonteDoLivro(config: PilotoConfig): Promise<FonteEscolhida | null> {
  if (!config.curso_id) return null;
  const [aulas, cursos] = await Promise.all([
    listAulasByCurso(config.curso_id, true),
    listCursosPublicados(true),
  ]);
  const proxima = aulas
    .filter((a) => a.conteudo && !a.conteudo.startsWith(MARCA_AVALIACAO))
    .find(
      (a) => config.ultima_mesa_ordem === null || a.ordem > config.ultima_mesa_ordem,
    );
  if (!proxima?.conteudo) return null;
  const curso = cursos.find((c) => c.id === config.curso_id);
  return {
    tipo: "livro",
    fonte: {
      tipo: "mesa",
      titulo: curso ? `${curso.titulo} · ${proxima.titulo}` : proxima.titulo,
      autor: curso?.autor || undefined,
      texto: proxima.conteudo,
    },
    avanco: { ultima_mesa_ordem: proxima.ordem },
  };
}

/**
 * O devocional do dia, lido pelo cliente de serviço: `getDevocionalDoDia` usa
 * a sessão de quem está logado, e aqui não há ninguém logado.
 */
async function devocionalDoDia(hoje: string) {
  if (isMockMode()) return getDevocionalDoDia(hoje);
  const sb = createServiceClient();
  const campos =
    "titulo, versiculo_ref, versiculo_texto, versiculo_versao, reflexao, autor";
  const doDia = await sb
    .from("devocionais")
    .select(campos)
    .eq("data", hoje)
    .eq("publicado", true)
    .maybeSingle();
  if (doDia.data) return doDia.data;
  // Sem devocional escrito para a data, vale o do ciclo anual.
  const anual = await sb
    .from("devocional_anual")
    .select(campos)
    .eq("dia_ano", diaAnoFromDateStr(hoje))
    .eq("publicado", true)
    .maybeSingle();
  return anual.data;
}

async function fonteDoDevocional(hoje: string): Promise<FonteEscolhida | null> {
  const dev = await devocionalDoDia(hoje).catch(() => null);
  if (!dev) return null;
  return {
    tipo: "devocional",
    fonte: {
      tipo: "devocional",
      titulo: `Devocional · ${dev.titulo || dev.versiculo_ref}`,
      autor: dev.autor || undefined,
      texto: `${dev.versiculo_ref} (${dev.versiculo_versao}): ${dev.versiculo_texto}\n\n${dev.reflexao}`,
    },
    avanco: {},
  };
}

/**
 * A pregação mais recente já analisada na aba Cortes e ainda não usada. A
 * fonte é o que foi DITO nos três melhores momentos — é o próprio pastor
 * falando, então o conteúdo já é dele.
 */
async function fonteDaPregacao(config: PilotoConfig): Promise<FonteEscolhida | null> {
  const recente = (await listCortesConteudo(true)).find(
    (c) => c.status === "pronto" && c.momentos.length > 0,
  );
  if (!recente || recente.id === config.ultimo_corte_id) return null;
  const corte = await getCorteConteudo(recente.id, true);
  if (!corte) return null;
  const texto = corte.momentos
    .slice(0, 3)
    .map((m) => trechoFalado(corte.transcricao, m.inicio, m.fim))
    .filter(Boolean)
    .join("\n\n");
  if (texto.length < MIN_FONTE) return null;
  return {
    tipo: "pregacao",
    fonte: { tipo: "livre", titulo: corte.titulo || "Pregação", texto },
    avanco: { ultimo_corte_id: corte.id },
  };
}

/** Monta as fontes disponíveis e fica com a que `escolherFonte` indicar. */
async function decidirFonte(
  config: PilotoConfig,
  hoje: string,
): Promise<FonteEscolhida | null> {
  const quer = (t: TipoFontePiloto) => config.fontes.includes(t);
  const [pregacao, livro, devocional] = await Promise.all([
    quer("pregacao") ? fonteDaPregacao(config).catch(() => null) : null,
    quer("livro") ? fonteDoLivro(config).catch(() => null) : null,
    quer("devocional") ? fonteDoDevocional(hoje) : null,
  ]);
  const tipo = escolherFonte(config, {
    pregacaoNova: Boolean(pregacao),
    proximaMesa: Boolean(livro),
    devocional: Boolean(devocional),
  });
  return tipo === "pregacao"
    ? pregacao
    : tipo === "livro"
      ? livro
      : tipo === "devocional"
        ? devocional
        : null;
}

/** Roda uma execução do começo ao fim. Nunca lança: a falha fica gravada na execução. */
export async function executarPiloto(
  execucaoId: string,
  agora = new Date(),
): Promise<void> {
  const pecas: PecaPiloto[] = [];
  try {
    const config = await getPilotoConfig(true);
    const escolhida = await decidirFonte(config, diaSP(agora));
    if (!escolhida) {
      throw new Error(
        "Não achei de onde tirar o conteúdo desta semana: o livro acabou, não há devocional do dia e não há pregação nova analisada.",
      );
    }
    const { texto } = recortarFonte(escolhida.fonte.texto);
    if (texto.length < MIN_FONTE)
      throw new Error("A fonte escolhida é curta demais para virar conteúdo.");
    const fonte = { ...escolhida.fonte, texto };
    const origem = { tipo: escolhida.tipo, titulo: fonte.titulo };
    await atualizarExecucaoPiloto(execucaoId, { fonte: origem });

    const perfil = await getPerfilConteudo(true);
    const gerado = await gerarPecasDaFonte(fonte, {
      perfil,
      duracaoReel: DURACAO_REEL,
      comPecas: config.pecas.carrossel,
      // O Reel da IA é montado em cima do roteiro, mesmo que o pastor não queira gravá-lo.
      comRoteiro: config.pecas.roteiro || config.pecas.reel_ia,
    });
    const horarios = horariosDaExecucao(agora, config);

    if (config.pecas.carrossel) {
      if (gerado.pecas) {
        const { id } = await salvarCarrosselInstagram(
          {
            conteudo: `${fonte.titulo}\n\n${gerado.pecas.tema}`.trim(),
            slides: slidesParaSalvar(gerado.pecas) as never,
            legenda: gerado.pecas.carrossel.legenda,
            // Agendado: o cron dos agendados publica na hora, se ninguém vetar.
            agendadoPara: horarios.carrossel,
          },
          true,
        );
        pecas.push({
          tipo: "carrossel",
          titulo: gerado.pecas.tema || fonte.titulo,
          quando: horarios.carrossel,
          post_id: id,
          estado: "agendado",
        });
      } else {
        pecas.push({
          tipo: "carrossel",
          titulo: "",
          quando: null,
          estado: "falhou",
          detalhe: gerado.erros.pecas,
        });
      }
    }

    if (config.pecas.roteiro) {
      if (gerado.roteiro) {
        const salvo = await salvarRoteiroConteudo(
          {
            roteiro: gerado.roteiro,
            duracao: DURACAO_REEL,
            fonte: { tipo: fonte.tipo, titulo: fonte.titulo, autor: fonte.autor },
          },
          true,
        );
        // Entra no calendário no dia do Reel: é quando o vídeo gravado deveria sair.
        await criarIdeiaConteudo(
          {
            titulo: salvo.titulo,
            nota: `Roteiro de ${DURACAO_REEL}s preparado pelo piloto automático.\nDe: ${fonte.titulo}`,
            formato: "roteiro",
            data_planejada: diaSP(horarios.reel),
          },
          { roteiro_id: salvo.id },
          true,
        );
        pecas.push({
          tipo: "roteiro",
          titulo: salvo.titulo,
          quando: null,
          roteiro_id: salvo.id,
          estado: "pronto",
        });
      } else {
        pecas.push({
          tipo: "roteiro",
          titulo: "",
          quando: null,
          estado: "falhou",
          detalhe: gerado.erros.roteiro,
        });
      }
    }

    if (config.pecas.reel_ia) {
      if (gerado.roteiro) {
        try {
          // A cena de fundo vem do primeiro slide do carrossel quando há: lá a
          // IA já foi instruída a pedir objetos e paisagens, sem rostos.
          const cena = gerado.pecas?.carrossel.slides[0]?.prompt || CENA_PADRAO;
          const videoUrl = await montarEGuardarReel(gerado.roteiro, execucaoId, cena);
          const { id } = await salvarCarrosselInstagram(
            {
              conteudo: `${fonte.titulo}\n\nReel narrado pelo piloto automático`,
              slides: [] as never,
              legenda: gerado.roteiro.legenda,
              agendadoPara: horarios.reel,
              tipo: "reel",
              videoUrl,
            },
            true,
          );
          pecas.push({
            tipo: "reel_ia",
            titulo: gerado.roteiro.titulo,
            quando: horarios.reel,
            post_id: id,
            estado: "agendado",
          });
        } catch (e) {
          pecas.push({
            tipo: "reel_ia",
            titulo: gerado.roteiro.titulo,
            quando: null,
            estado: "falhou",
            detalhe:
              e instanceof Error ? e.message.slice(0, 160) : "falha ao montar o vídeo",
          });
        }
      } else {
        pecas.push({
          tipo: "reel_ia",
          titulo: "",
          quando: null,
          estado: "falhou",
          detalhe: gerado.erros.roteiro,
        });
      }
    }

    if (!pecas.some((p) => p.estado !== "falhou")) {
      throw new Error("A IA não conseguiu montar nenhuma peça desta vez.");
    }

    // A fonte só "anda" (próxima mesa, pregação usada) quando algo foi de fato produzido.
    await salvarPilotoConfig(
      { ...escolhida.avanco, ultima_fonte: escolhida.tipo },
      true,
    );
    await atualizarExecucaoPiloto(execucaoId, { status: "pronto", pecas, erro: null });

    const link = `${siteBase()}/admin/instagram?aba=piloto`;
    const falhaNoAviso = config.telefone
      ? await enviarTextoWhatsApp(
          config.telefone,
          mensagemDoPiloto({ fonte: origem, pecas }, link),
        )
      : "sem telefone configurado";
    await atualizarExecucaoPiloto(execucaoId, {
      aviso_enviado: !falhaNoAviso,
      // Sem aviso o pastor não sabe que há algo agendado: fica registrado à vista.
      erro: falhaNoAviso
        ? `O aviso no WhatsApp não saiu (${falhaNoAviso}). As peças estão agendadas mesmo assim.`
        : null,
    });
  } catch (e) {
    await atualizarExecucaoPiloto(execucaoId, {
      status: "erro",
      pecas,
      erro: e instanceof Error ? e.message : "O piloto falhou.",
    }).catch(() => {});
  }
}
