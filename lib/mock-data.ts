// =============================================================
// EKBALLO ACADEMY · Dataset MOCK para teste local
// Ativado quando NEXT_PUBLIC_MOCK_MODE=true (padrão em .env.local)
// =============================================================

import type { Profile, Curso, Aula, Atividade, Alternativa } from "@/lib/types";

export const MOCK_USER_ID = "mock-lucas";

export const MOCK_PROFILE: Profile = {
  id: MOCK_USER_ID,
  nome: "Pr. Bruno Fernandes",
  email: "bruno@ekballo.com.br",
  is_admin: true,
  turma: "Mesa 01",
  created_at: "2026-04-01T10:00:00Z",
};

export const MOCK_ALUNOS: Profile[] = [
  MOCK_PROFILE,
  { id: "aluno-1b", nome: "Lucas Fernandes (Cowork)", email: "iabolsa@bmbr.com.br", is_admin: false, turma: "Mesa 01", created_at: "2026-04-02T08:00:00Z" },
  { id: "aluno-2", nome: "Maria Helena Andrade", email: "maria.helena@email.com", is_admin: false, turma: "Mesa 01", created_at: "2026-04-08T14:21:00Z" },
  { id: "aluno-3", nome: "João Pedro Costa", email: "joao.pedro@email.com", is_admin: false, turma: "Mesa 01", created_at: "2026-04-10T09:05:00Z" },
  { id: "aluno-4", nome: "Beatriz Souza", email: "beatriz.souza@email.com", is_admin: false, turma: "Mesa 02", created_at: "2026-04-15T20:30:00Z" },
  { id: "aluno-5", nome: "Pedro Henrique", email: "pedro.h@email.com", is_admin: false, turma: "Mesa 02", created_at: "2026-04-18T07:14:00Z" },
  { id: "aluno-6", nome: "Camila Ribeiro", email: "camila.ribeiro@email.com", is_admin: false, turma: "Mesa 02", created_at: "2026-04-20T16:42:00Z" },
  { id: "aluno-7", nome: "Lucas Fernandes (cadastro)", email: "lucas.f@email.com", is_admin: false, turma: "Mesa 03", created_at: "2026-05-02T11:30:00Z" },
  { id: "aluno-8", nome: "Ana Caroline", email: "ana.c@email.com", is_admin: false, turma: "Mesa 03", created_at: "2026-05-09T08:00:00Z" },
];

export const MOCK_CURSOS: Curso[] = [
  {
    id: "curso-1",
    slug: "mesa-aberta",
    titulo: "Mesa Aberta",
    descricao:
      "O curso âncora da Ekballo Academy. Sete aulas curtas para entender o coração do discipulado relacional, da formação à mesa, do envio à multiplicação. Para todo discípulo que está começando a caminhada.",
    imagem_url: null,
    is_pago: false,
    preco_centavos: 0,
    ordem: 1,
    publicado: true,
    created_at: "2026-04-01T00:00:00Z",
  },
  {
    id: "curso-2",
    slug: "fundamentos-do-discipulado",
    titulo: "Fundamentos do Discipulado",
    descricao:
      "Doze encontros aprofundando os pilares: identidade em Cristo, vida no Espírito, comunidade comprometida, missão integral. Atividades de reflexão semanais com devolutiva pastoral.",
    imagem_url: null,
    is_pago: false,
    preco_centavos: 0,
    ordem: 2,
    publicado: true,
    created_at: "2026-04-05T00:00:00Z",
  },
  {
    id: "curso-3",
    slug: "envio-a-semente-plantada",
    titulo: "Envio: a semente plantada",
    descricao:
      "Curso aprofundado para discípulos maduros que estão sendo enviados. Quatro módulos sobre liderança pastoral, multiplicação, plantio e cuidado de novos discípulos. Inclui mentoria por 90 dias.",
    imagem_url: null,
    is_pago: true,
    preco_centavos: 19700,
    ordem: 3,
    publicado: true,
    created_at: "2026-04-20T00:00:00Z",
  },
  {
    id: "curso-4",
    slug: "ego-transformado-keller",
    titulo: "Ego Transformado",
    descricao:
      "Estudo guiado a partir do livro de Timothy Keller (Vida Nova). Quatro aulas curtas sobre identidade, autoesquecimento e a humildade que brota do evangelho. Cada aula libera a próxima quando todas as questões são respondidas corretamente.",
    imagem_url: null,
    is_pago: false,
    preco_centavos: 0,
    ordem: 4,
    publicado: true,
    created_at: "2026-05-14T00:00:00Z",
  },
];

export const MOCK_AULAS: Aula[] = [
  // Mesa Aberta (7 aulas)
  { id: "aula-1", curso_id: "curso-1", titulo: "A mesa antes da palavra", ordem: 1, video_url: null, conteudo: `Antes do sermão, do estudo, da pregação — a mesa. Jesus discipulou andando, comendo, conversando. A mesa é o método anterior à fala. Quando a comunhão é real, a Palavra encontra solo preparado.\n\nNo evangelho de Lucas, mais de dez encontros transformadores acontecem ao redor de uma mesa. Não foi por acaso. A mesa derruba muros: hierarquia, formalidade, distância. Na mesa, todos comem o mesmo pão. Todos compartilham o mesmo cálice. Todos olham nos olhos.\n\nA primeira pergunta da formação Ekballo não é "o que você sabe?" mas "com quem você come?". Porque é ali, na mesa, que se vê a verdade da vida — e onde ela pode ser transformada.`, created_at: "2026-04-01T00:00:00Z" },
  { id: "aula-2", curso_id: "curso-1", titulo: "Discípulo, não aluno", ordem: 2, video_url: null, conteudo: `Aluno aprende conteúdo. Discípulo aprende vida. A diferença entre os dois define se a transformação é cosmética ou raiz.\n\nO aluno termina o curso. O discípulo entra numa caminhada. O aluno é avaliado pela prova. O discípulo é formado pela presença. Aqui, nesta plataforma, você não estuda sobre Jesus — você aprende a andar com Ele, em comunidade, debaixo de uma liderança que te conhece.\n\nA Ekballo Academy é uma ferramenta. Não é o método. O método é a mesa. O Mestre é o Espírito. Esta plataforma só serve quando aproxima você desses dois.`, created_at: "2026-04-01T00:00:00Z" },
  { id: "aula-3", curso_id: "curso-1", titulo: "Famílias como solo", ordem: 3, video_url: null, conteudo: `A primeira eclésia é a casa. Se o discipulado não chega na cozinha, na conversa de casal, na oração antes de dormir, ele não chegou em lugar nenhum. Famílias fortes são solo. Sem solo bom, a semente morre.\n\nNeste módulo a pergunta principal é simples: o que da sua vida espiritual fica no domingo de manhã e o que chega na quarta-feira à noite? Onde o discipulado precisa atravessar a porta da sua casa?`, created_at: "2026-04-01T00:00:00Z" },
  { id: "aula-4", curso_id: "curso-1", titulo: "O Espírito como Mestre", ordem: 4, video_url: null, conteudo: `Não somos formados por cursos. Somos formados pelo Espírito. Cursos são instrumentos — Ele é o Mestre.\n\nEsta é uma plataforma honesta sobre seus limites. Ela ajuda você a refletir, organizar pensamentos, manter ritmo. Mas a transformação real acontece no encontro pessoal com o Espírito Santo, na oração, na adoração, na obediência ao texto bíblico.\n\nUse esta ferramenta como degrau, nunca como destino.`, created_at: "2026-04-01T00:00:00Z" },
  { id: "aula-5", curso_id: "curso-1", titulo: "Maturidade como envio", ordem: 5, video_url: null, conteudo: `A maturidade cristã não é um destino, é um envio. O sinal de que alguém amadureceu é que ele começa a derramar. Quem foi formado, forma. Quem foi servido, serve. Quem foi enviado, envia.\n\nA palavra "Ekballo" no grego do Novo Testamento significa "lançar para fora", "expulsar", "enviar". Jesus usa essa palavra ao mandar discípulos para a seara. A maturidade nunca foi para reter — sempre foi para enviar.`, created_at: "2026-04-01T00:00:00Z" },
  { id: "aula-6", curso_id: "curso-1", titulo: "Comunidade que se compromete", ordem: 6, video_url: null, conteudo: `Não é grupo que se reúne — é família que se compromete. A diferença está no nível de exposição, vulnerabilidade e responsabilidade mútua. Comunidade rasa ensina pouco. Comunidade comprometida transforma.\n\nNo Ekballo, comunidade é quando alguém pode te ligar às 23h porque está em crise. É quando você sabe o nome dos filhos da outra família. É quando há discordância dita na cara, com amor, sem se desfazer.`, created_at: "2026-04-01T00:00:00Z" },
  { id: "aula-7", curso_id: "curso-1", titulo: "A mesa continua", ordem: 7, video_url: null, conteudo: `Este curso termina, mas a mesa não. Você foi convidado a continuar — em outra trilha, em outro encontro, em outra família. O Espírito te chamou para mais. Aceite o próximo passo.\n\nQuando você terminar este curso, sugiro que entre no "Fundamentos do Discipulado" — doze encontros mais profundos, com atividades semanais de reflexão. E continue na sua mesa local, presencialmente. A plataforma é extensão, nunca substituto.`, created_at: "2026-04-01T00:00:00Z" },
  // Fundamentos do Discipulado (12 aulas) — só os títulos para o índice
  { id: "aula-8", curso_id: "curso-2", titulo: "Identidade em Cristo: filho antes de servo", ordem: 1, video_url: null, conteudo: "Conteúdo desta aula em construção. Em breve.", created_at: "2026-04-05T00:00:00Z" },
  { id: "aula-9", curso_id: "curso-2", titulo: "Vida no Espírito: dependência diária", ordem: 2, video_url: null, conteudo: "Conteúdo desta aula em construção.", created_at: "2026-04-05T00:00:00Z" },
  { id: "aula-10", curso_id: "curso-2", titulo: "Comunidade comprometida: para além do grupo", ordem: 3, video_url: null, conteudo: "Conteúdo desta aula em construção.", created_at: "2026-04-05T00:00:00Z" },
  { id: "aula-11", curso_id: "curso-2", titulo: "Missão integral: a fé que age", ordem: 4, video_url: null, conteudo: "Conteúdo desta aula em construção.", created_at: "2026-04-05T00:00:00Z" },
  // Envio (4 módulos)
  { id: "aula-12", curso_id: "curso-3", titulo: "Liderança pastoral: cuidar antes de gerenciar", ordem: 1, video_url: null, conteudo: "Conteúdo do curso pago em construção.", created_at: "2026-04-20T00:00:00Z" },
  // ===== Ego Transformado (Keller) — 4 aulas =====
  { id: "k-aula-1", curso_id: "curso-4", titulo: "Introdução: A liberdade resultante do autoesquecimento", ordem: 1, video_url: null, conteudo: `Keller começa com uma pergunta que vai atravessar o livro inteiro: o que distingue um coração radicalmente transformado pela graça de Deus? Ele esclarece de saída que não está falando de comportamento moral — é perfeitamente possível fazer ações virtuosas com o coração cheio de medo, orgulho ou sede de poder. A questão é o que acontece dentro, na raiz.\n\nA resposta vem do texto de 1Coríntios 3.21–4.7. Em Corinto, a igreja estava fragmentada por facções — "eu sou de Paulo", "eu sou de Apolo". Para Paulo, a raiz da divisão era uma só: orgulho e vanglória. E aqui Keller faz um movimento brilhante. Mostra que toda cultura humana tem dois grandes diagnósticos para o mau comportamento — e que ambos erram o alvo.\n\nA cultura tradicional dizia: o problema é hubris, autoestima alta demais. As pessoas agem mal porque se acham importantes. A solução era humilhar, repreender, expor o erro.\n\nA cultura moderna inverteu: o problema é baixa autoestima. As pessoas agem mal porque não se valorizam. A solução é elogiar, encorajar, aumentar a autoimagem. Keller cita o New York Times e a psicóloga Lauren Slater para mostrar que essa segunda tese — apesar de dominante — não tem evidência empírica nenhuma.\n\nE então Paulo entra com uma terceira via, completamente diferente. Ele não está nem do lado tradicional, nem do moderno. Está dizendo algo que não cabe em nenhuma dessas categorias. O que ele está dizendo é o que o livro inteiro vai destrinchar.`, created_at: "2026-05-14T00:00:00Z" },
  { id: "k-aula-2", curso_id: "curso-4", titulo: "A condição natural do ego humano", ordem: 2, video_url: null, conteudo: `Paulo usa uma palavra grega muito específica: physioō. Não é a palavra comum para orgulho (hubris), é uma palavra rara que significa literalmente "superinflado, inchado, distendido além do tamanho normal". A imagem é de um órgão humano que recebeu tanto ar que está prestes a explodir. Essa, segundo Paulo, é a condição natural do ego humano — não em algumas pessoas piores, mas em todos.\n\nKeller decompõe essa imagem em quatro marcas: o ego natural é vazio, dolorido, atarefado e frágil.\n\nVazio, primeiro. Não há nada no centro do ego — ele é oco. Citando Kierkegaard, Keller mostra que o ego natural é fundamentado em algo que não é Deus. Ele busca em outras coisas — sucesso, beleza, aprovação, romance, ministério — o senso de valor que só Deus pode dar. E como nada disso enche o espaço de Deus, tudo "chacoalha lá dentro".\n\nDolorido, segundo. Quando o corpo está saudável, você não pensa nele. Mas o ego dói o tempo todo — vive chamando atenção para si, vive sendo ferido. Quando alguém "feriu seus sentimentos", os sentimentos não foram feridos. Foi o ego que se machucou.\n\nAtarefado, terceiro. O ego vive ocupado preenchendo o vazio. Faz isso de duas formas: comparação e vanglória. Citando C.S. Lewis em Cristianismo puro e simples, Keller mostra que orgulho é, por definição, competitivo — ninguém se orgulha de ser rico, mas de ser mais rico. Tudo vira currículo.\n\nFrágil, quarto. Qualquer coisa superinflada está prestes a estourar. Por isso, complexo de superioridade e complexo de inferioridade são, no fundo, a mesma coisa — um está superinflado e teme ser desinflado, o outro já foi desinflado.\n\nKeller fecha citando Madonna: "o que me impulsiona é o medo de ser medíocre... minha luta não terminou e nunca terminará". Isso é o ego insaciável, em estado puro.`, created_at: "2026-05-14T00:00:00Z" },
  { id: "k-aula-3", curso_id: "curso-4", titulo: "A visão transformada do eu", ordem: 3, video_url: null, conteudo: `Aqui Keller mostra Paulo dizendo algo que sai completamente das nossas categorias. Em 1Coríntios 4.3-4, Paulo afirma: "pouco me importa se sou julgado por vós, ou por qualquer tribunal humano; de fato, nem eu julgo a mim mesmo". Leia essa frase de novo. Paulo não está dizendo "não me importo com vocês — só comigo". Está dizendo: "não me importo nem com vocês, nem comigo". Ele saiu do tribunal por inteiro.\n\nO conselho moderno sobre baixa autoestima é claro: "esqueça os outros, defina seus próprios padrões, viva por eles". Keller mostra por que isso não funciona — os próprios padrões viram outra prisão. Trocar o tribunal externo pelo tribunal interno não liberta — só muda o juiz.\n\nPaulo não cai nessa armadilha. Não se julga porque saiu do jogo. E a beleza disso aparece quando ele diz, em 1Timóteo 1.15: "sou o principal dos pecadores". Não "era". "Sou". Como alguém que se confessa o pior dos pecadores tem ao mesmo tempo tanta confiança e estabilidade? Porque ele não conecta seus pecados — nem suas realizações — à sua identidade.\n\nAqui entra a famosa citação de C.S. Lewis. Quando você conversa com uma pessoa verdadeiramente humilde, você não sai dizendo "que humilde". Você sai pensando: "essa pessoa pareceu interessada em mim". Porque a humildade do evangelho não é pensar em si como mais (orgulho) nem como menos (falsa humildade). É simplesmente pensar menos em si mesmo.\n\nE aí Keller dá um teste prático: a pessoa que se esqueceu de si não fica devastada por críticas. Mas — atenção — também não as ignora. Ela ouve a crítica sem ser destruída e ainda assim a entende como oportunidade real de mudança. Esse é o sinal.`, created_at: "2026-05-14T00:00:00Z" },
  { id: "k-aula-4", curso_id: "curso-4", titulo: "Como alcançar uma visão transformada do eu", ordem: 4, video_url: null, conteudo: `Esta é a aula mais curta e a mais importante. Como Paulo chegou ao ponto de não se importar nem com a opinião dos outros nem com a própria? Não foi por força de vontade. Foi porque alguém — o único cuja opinião realmente importa — já tinha se pronunciado sobre ele.\n\nKeller introduz aqui a ideia que sintetiza o livro inteiro: o evangelho cristão é a única forma de identidade onde o veredicto vem antes do desempenho. Em todo outro sistema — religioso, filosófico, secular — o desempenho leva ao veredicto. Você atua para descobrir quem você é. Você performa para conquistar aprovação. E como Madonna confessou, esse veredicto definitivo nunca chega.\n\nNo evangelho a ordem se inverte. Antes que eu faça qualquer coisa, antes que eu prove qualquer mérito, Deus já me declarou: "tu és o meu filho amado, em ti me agrado" (Marcos 1.11). Esse veredicto não vem do meu desempenho — vem do desempenho perfeito de Cristo, imputado a mim na cruz. Jesus foi julgado em meu lugar. O tribunal está encerrado. "Agora já não há condenação alguma para os que estão em Cristo Jesus" (Romanos 8.1).\n\nE então o desempenho aparece — mas de outro lugar. Eu ajudo as pessoas não para me sentir bem, não para preencher o vazio. Eu ajudo porque já sou amado. O veredicto garante o desempenho, em vez de o desempenho garantir o veredicto.\n\nKeller fecha com uma palavra prática para quem já crê mas continua sendo "arrastado de volta para o tribunal" todos os dias. A solução não é tentar se sentir mais valorizado. A solução é reviver o evangelho. Cada vez que você ora. Cada vez que vai à igreja. A todo instante, perguntando-se: "por que estou de novo no tribunal? Ali não é mais o meu lugar".`, created_at: "2026-05-14T00:00:00Z" },
];

export const MOCK_ATIVIDADES: Atividade[] = [
  // Aula 1 - Mesa antes da palavra
  { id: "atv-1", aula_id: "aula-1", pergunta: "Em qual mesa você foi mais transformado(a) na vida? Descreva a cena: quem estava, o que se conversava, o que aconteceu em você.", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  { id: "atv-2", aula_id: "aula-1", pergunta: "Hoje, onde está a mesa que te forma? Se não há uma, o que está te impedindo de criá-la?", ordem: 2, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  // Aula 3 - Famílias como solo
  { id: "atv-3", aula_id: "aula-3", pergunta: "Como o discipulado tem chegado (ou não chegado) na sua casa? O que da sua família precisa ser orado, conversado, restaurado?", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  // Aula 5 - Maturidade como envio
  { id: "atv-4", aula_id: "aula-5", pergunta: "Quem você está discipulando hoje? Se ninguém, por quê? E quem o Espírito está colocando no seu coração para começar?", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  { id: "atv-5", aula_id: "aula-5", pergunta: "Maturidade como envio: que passo concreto de envio você se sente desafiado(a) a dar nas próximas quatro semanas?", ordem: 2, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  // Aula 6 - Comunidade
  { id: "atv-6", aula_id: "aula-6", pergunta: "Olhando a sua comunidade hoje, ela é mais 'grupo que se reúne' ou 'família que se compromete'? Onde está o próximo passo de aprofundamento?", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  // Aula 7 - A mesa continua
  { id: "atv-7", aula_id: "aula-7", pergunta: "Qual o próximo passo da sua caminhada? Escreva uma palavra-síntese que você quer levar deste curso para o resto do ano.", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-01T00:00:00Z" },
  // Aula 8 - Fundamentos
  { id: "atv-8", aula_id: "aula-8", pergunta: "O que muda quando você se entende primeiro filho, depois servo? Onde isso ainda não desceu na sua vida prática?", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-05T00:00:00Z" },

  // ====== CURSO 04: EGO TRANSFORMADO (KELLER) — 10 questões MC ======
  // Aula K1 - Liberdade resultante do autoesquecimento
  { id: "k-atv-1", aula_id: "k-aula-1", ordem: 1, tipo: "multipla_escolha", razao: "Keller abre o livro perguntando: \"Quais são as marcas de um coração radicalmente transformado pela graça de Deus?\". Tudo o que vem depois é resposta a essa pergunta.", pergunta: "Qual é a pergunta central que abre o livro de Keller, ao analisar 1Coríntios 3.21–4.7?", created_at: "2026-05-14T00:00:00Z" },
  { id: "k-atv-2", aula_id: "k-aula-1", ordem: 2, tipo: "multipla_escolha", razao: "Keller diz literalmente que Paulo apresenta uma forma de enxergar o eu \"completamente diferente da abordagem das culturas tradicionais e modernas/pós-modernas\".", pergunta: "Qual o problema comum tanto da abordagem tradicional (autoestima alta = causa do mal) quanto da moderna (baixa autoestima = causa do mal)?", created_at: "2026-05-14T00:00:00Z" },
  // Aula K2 - Condição natural do ego
  { id: "k-atv-3", aula_id: "k-aula-2", ordem: 1, tipo: "multipla_escolha", razao: "A palavra grega physioō, usada por Paulo, está relacionada ao termo \"fole\" — a imagem é de um órgão humano superinflado, prestes a explodir.", pergunta: "A palavra grega physioō, que Paulo usa para descrever o ego natural, significa literalmente:", created_at: "2026-05-14T00:00:00Z" },
  { id: "k-atv-4", aula_id: "k-aula-2", ordem: 2, tipo: "multipla_escolha", razao: "Keller lista exatamente essas quatro: vazio (não tem nada no centro), dolorido (vive ferido), atarefado (vive se comparando) e frágil (qualquer coisa superinflada está prestes a estourar).", pergunta: "Quais são as quatro marcas do ego humano natural, segundo Keller?", created_at: "2026-05-14T00:00:00Z" },
  { id: "k-atv-5", aula_id: "k-aula-2", ordem: 3, tipo: "multipla_escolha", razao: "Keller usa Madonna como exemplo de alguém autoconsciente o suficiente para confessar que mesmo no auge do sucesso o ego permanece um \"buraco negro\" que nunca se enche.", pergunta: "O exemplo da Madonna (\"o que me impulsiona é o medo de ser medíocre... minha luta nunca terminará\") ilustra qual verdade sobre o ego?", created_at: "2026-05-14T00:00:00Z" },
  // Aula K3 - Visão transformada do eu
  { id: "k-atv-6", aula_id: "k-aula-3", ordem: 1, tipo: "multipla_escolha", razao: "Paulo recusa o jogo da autoestima por inteiro: nem busca veredicto nos outros, nem em si mesmo. Saiu do tribunal humano e do tribunal interno.", pergunta: "Em 1Coríntios 4.3-4, Paulo diz: \"pouco me importa se sou julgado por vós... nem eu julgo a mim mesmo\". O que ele está dizendo, segundo Keller?", created_at: "2026-05-14T00:00:00Z" },
  { id: "k-atv-7", aula_id: "k-aula-3", ordem: 2, tipo: "multipla_escolha", razao: "C.S. Lewis: \"a essência da humildade resultante do evangelho não é pensar em mim mesmo como se eu fosse mais nem pensar em mim mesmo como se eu fosse menos; é pensar menos em mim mesmo\".", pergunta: "Segundo a famosa citação de C.S. Lewis em \"Cristianismo puro e simples\", o que é a verdadeira humildade do evangelho?", created_at: "2026-05-14T00:00:00Z" },
  { id: "k-atv-8", aula_id: "k-aula-3", ordem: 3, tipo: "multipla_escolha", razao: "Keller: a pessoa esquecida de si \"não se sente ferida, não fica mal quando criticada\" — mas, diferente de quem só ignora, ainda \"a entende como oportunidade de mudança\".", pergunta: "Qual o \"teste simples\" que Keller apresenta para identificar uma pessoa que se esqueceu de si mesma?", created_at: "2026-05-14T00:00:00Z" },
  // Aula K4 - Como alcançar
  { id: "k-atv-9", aula_id: "k-aula-4", ordem: 1, tipo: "multipla_escolha", razao: "Keller: \"é somente no evangelho de Jesus Cristo que o veredicto é dado antes de desempenharmos nossas ações\". Em todas as outras formas de identidade, é o desempenho que leva ao veredicto.", pergunta: "O que torna o evangelho cristão radicalmente diferente de toda outra forma de identidade, segundo Keller?", created_at: "2026-05-14T00:00:00Z" },
  { id: "k-atv-10", aula_id: "k-aula-4", ordem: 2, tipo: "multipla_escolha", razao: "Keller: \"temos de reviver o evangelho cada vez que orarmos. Temos de revivê-lo sempre que vamos à igreja. Temos de reviver o evangelho a todo instante e perguntar a nós mesmos por que estamos no tribunal. Ali não é mais o nosso lugar.\"", pergunta: "Para alguém que já crê mas todos os dias se vê \"arrastado de volta para o tribunal\", qual a orientação prática de Keller?", created_at: "2026-05-14T00:00:00Z" },
];

// ============== ALTERNATIVAS para o curso Keller ==============
const mkAlt = (atvId: string, ordem: number, texto: string, correta: boolean): Alternativa => ({
  id: `${atvId}-alt-${ordem}`,
  atividade_id: atvId,
  texto,
  correta,
  ordem,
});

export const MOCK_ALTERNATIVAS: Alternativa[] = [
  // K1 — questão 1
  mkAlt("k-atv-1", 1, "Como ter mais sucesso na vida cristã?", false),
  mkAlt("k-atv-1", 2, "Quais são as marcas de um coração radicalmente transformado pela graça de Deus?", true),
  mkAlt("k-atv-1", 3, "Como aumentar a autoestima do crente moderno?", false),
  mkAlt("k-atv-1", 4, "Como vencer os adversários da igreja?", false),
  // K1 — questão 2
  mkAlt("k-atv-2", 1, "A tradicional está totalmente certa, a moderna está errada.", false),
  mkAlt("k-atv-2", 2, "A moderna está totalmente certa, a tradicional está errada.", false),
  mkAlt("k-atv-2", 3, "Ambas tratam o ego como o centro do problema, mas Paulo aponta para algo completamente diferente.", true),
  mkAlt("k-atv-2", 4, "Ambas são complementares e podem ser combinadas.", false),
  // K2 — questão 3
  mkAlt("k-atv-3", 1, "Vazio e quieto.", false),
  mkAlt("k-atv-3", 2, "Inflado, inchado, distendido além do tamanho normal (relacionada a \"fole\").", true),
  mkAlt("k-atv-3", 3, "Sólido e bem formado.", false),
  mkAlt("k-atv-3", 4, "Pequeno e insignificante.", false),
  // K2 — questão 4
  mkAlt("k-atv-4", 1, "Forte, sólido, alegre e satisfeito.", false),
  mkAlt("k-atv-4", 2, "Inflado, contente, atarefado e seguro.", false),
  mkAlt("k-atv-4", 3, "Vazio, dolorido, atarefado e frágil.", true),
  mkAlt("k-atv-4", 4, "Vazio, sereno, livre e leve.", false),
  // K2 — questão 5
  mkAlt("k-atv-5", 1, "Que apenas pessoas famosas têm crise de ego.", false),
  mkAlt("k-atv-5", 2, "Que o sucesso, eventualmente, resolve a insegurança.", false),
  mkAlt("k-atv-5", 3, "Que o ego é insaciável — todo desempenho exige outro desempenho, e a despensa nunca enche.", true),
  mkAlt("k-atv-5", 4, "Que humildade é uma qualidade só dos pobres.", false),
  // K3 — questão 6
  mkAlt("k-atv-6", 1, "Que devemos seguir nossos próprios padrões em vez dos padrões dos outros.", false),
  mkAlt("k-atv-6", 2, "Que sua consciência está limpa e por isso ele se sente inocente.", false),
  mkAlt("k-atv-6", 3, "Que ele saiu do tribunal — sua identidade não depende nem da opinião dos outros nem da própria opinião sobre si.", true),
  mkAlt("k-atv-6", 4, "Que ele desistiu de tentar ser uma pessoa boa.", false),
  // K3 — questão 7
  mkAlt("k-atv-7", 1, "Pensar em si mesmo como inferior aos outros.", false),
  mkAlt("k-atv-7", 2, "Pensar em si mesmo como superior, mas sem demonstrar.", false),
  mkAlt("k-atv-7", 3, "Pensar menos em si mesmo (não \"mais\" nem \"menos\", simplesmente menos).", true),
  mkAlt("k-atv-7", 4, "Não pensar em mais nada além de si mesmo.", false),
  // K3 — questão 8
  mkAlt("k-atv-8", 1, "Ela se sente arrasada por toda crítica.", false),
  mkAlt("k-atv-8", 2, "Ela ignora completamente toda crítica para se proteger.", false),
  mkAlt("k-atv-8", 3, "Ela ouve a crítica sem ser destruída por ela e a entende como oportunidade de mudança.", true),
  mkAlt("k-atv-8", 4, "Ela nunca recebe críticas porque é perfeita.", false),
  // K4 — questão 9
  mkAlt("k-atv-9", 1, "O cristão não precisa de nenhum veredicto sobre si.", false),
  mkAlt("k-atv-9", 2, "O veredicto é dado antes do desempenho — não depois.", true),
  mkAlt("k-atv-9", 3, "Deus avalia apenas as boas obras, ignorando as más.", false),
  mkAlt("k-atv-9", 4, "O desempenho cristão é maior que o de outras religiões.", false),
  // K4 — questão 10
  mkAlt("k-atv-10", 1, "Tentar ter mais pensamentos positivos sobre si mesmo.", false),
  mkAlt("k-atv-10", 2, "Estabelecer padrões pessoais mais altos para conquistar autoestima.", false),
  mkAlt("k-atv-10", 3, "Reviver o evangelho cada vez que orar, for à igreja, e a todo instante — lembrando que o julgamento já terminou em Cristo.", true),
  mkAlt("k-atv-10", 4, "Parar de ir à igreja para evitar a comparação com outros crentes.", false),
];

export type MockResposta = {
  id: string;
  atividade_id: string;
  aluno_id: string;
  texto: string;
  comentario_lider: string | null;
  comentario_lider_em: string | null;
  created_at: string;
  updated_at: string;
};

export const MOCK_RESPOSTAS: MockResposta[] = [
  {
    id: "r-1", atividade_id: "atv-1", aluno_id: "aluno-2",
    texto: "A mesa que mais me transformou foi a da casa dos meus avós, num domingo de Páscoa. Tinha eu, meus pais, meus tios, primos, e meu avô que naquele ano estava com câncer terminal. Ele orou pela família com uma paz que eu nunca tinha visto. Falou de Jesus de um jeito que doeu de tão real. Naquela noite eu entendi que evangelho não é discurso, é vida vivida. Foi ali que decidi que queria ser discípulo, não só frequentador.",
    comentario_lider: "Maria, sua resposta me emocionou. Esse tipo de mesa — onde a fé encontra a fragilidade humana — é exatamente o que a Ekballo quer recuperar. Pergunta para você nesta semana: existe alguém na sua vida hoje que precisa de uma mesa assim, e que pode estar esperando você convidar?",
    comentario_lider_em: "2026-05-10T19:30:00Z",
    created_at: "2026-05-08T22:14:00Z", updated_at: "2026-05-08T22:14:00Z",
  },
  {
    id: "r-2", atividade_id: "atv-2", aluno_id: "aluno-2",
    texto: "Hoje minha mesa de formação é meu grupo pequeno na quinta à noite. Mas confesso que tem virado mais reunião do que mesa. Falamos de coisas, mas não nos abrimos de verdade. Acho que o que me impede de criar uma mesa mais profunda é medo de me expor.",
    comentario_lider: "O nome do que você descreveu é importante: medo de se expor. Quase todo mundo na comunidade sente isso. A mesa só vira mesa quando alguém quebra o silêncio primeiro. Eu desafio você nesta semana: na próxima quinta, conta uma vulnerabilidade real, mesmo que pequena. Vai ver o efeito.",
    comentario_lider_em: "2026-05-11T08:00:00Z",
    created_at: "2026-05-09T20:00:00Z", updated_at: "2026-05-09T20:00:00Z",
  },
  {
    id: "r-3", atividade_id: "atv-1", aluno_id: "aluno-3",
    texto: "A mesa que mais me transformou foi durante o luto do meu irmão, há dois anos. Foram três pessoas da igreja que vieram comer comigo todos os domingos por seis meses. Não me deram conselhos. Só comeram, choraram quando eu chorei, riram quando eu ri. Foi ali que entendi que a igreja não é programa, é presença.",
    comentario_lider: null, comentario_lider_em: null,
    created_at: "2026-05-12T21:15:00Z", updated_at: "2026-05-12T21:15:00Z",
  },
  {
    id: "r-4", atividade_id: "atv-3", aluno_id: "aluno-3",
    texto: "Em casa o discipulado ainda não chegou de verdade. Minha esposa e eu lemos a Bíblia individualmente, mas raramente oramos juntos. Os filhos veem a gente indo na igreja, mas não veem a gente vivendo Jesus na semana. Preciso começar a oração da família antes de dormir.",
    comentario_lider: null, comentario_lider_em: null,
    created_at: "2026-05-13T22:45:00Z", updated_at: "2026-05-13T22:45:00Z",
  },
  {
    id: "r-5", atividade_id: "atv-3", aluno_id: "aluno-4",
    texto: "Solteira, morando sozinha. A 'família' aqui pra mim é a comunidade Mesa 02 mesmo. E o discipulado tem chegado sim — através do meu líder, da Camila, e das duas com quem divido apartamento. Mas vejo que precisei reaprender que minha 'casa' espiritual não é só onde durmo, é onde sou conhecida.",
    comentario_lider: "Beatriz, isso é maturidade. Casa não é endereço, é vínculo. Continue investindo nessas relações com profundidade — sua geração precisa de testemunhas de que solteiros também formam famílias espirituais profundas.",
    comentario_lider_em: "2026-05-12T10:20:00Z",
    created_at: "2026-05-10T18:00:00Z", updated_at: "2026-05-10T18:00:00Z",
  },
  {
    id: "r-6", atividade_id: "atv-4", aluno_id: "aluno-5",
    texto: "Hoje não estou discipulando ninguém de forma intencional. Tenho amizades na igreja, mas nada estruturado. O Espírito tem colocado no meu coração o nome do Mateus, um cara da minha célula que tá engatinhando na fé. Acho que vou convidar pra um café semanal.",
    comentario_lider: "Pedro, esse 'café semanal' é exatamente onde Jesus começou. Antes de planejar, comece. Faça o convite essa semana mesmo. Me conta como foi.",
    comentario_lider_em: "2026-05-13T07:30:00Z",
    created_at: "2026-05-11T14:00:00Z", updated_at: "2026-05-11T14:00:00Z",
  },
  {
    id: "r-7", atividade_id: "atv-5", aluno_id: "aluno-5",
    texto: "Passo concreto: começar o discipulado com o Mateus. Outro passo: estudar para liderar a próxima Mesa Aberta da nossa célula em julho.",
    comentario_lider: null, comentario_lider_em: null,
    created_at: "2026-05-11T14:05:00Z", updated_at: "2026-05-11T14:05:00Z",
  },
  {
    id: "r-8", atividade_id: "atv-1", aluno_id: "aluno-6",
    texto: "Foi numa retiro de jovens em 2018. A mesa era literalmente um café da manhã longo, na beira do lago, com 8 pessoas. Lembro que falamos por três horas sobre vocação. Sai dali sabendo que ia largar o emprego e ir para o seminário. E foi.",
    comentario_lider: "Camila, esse café da manhã virou uma virada vocacional inteira. Histórias assim mostram por que insistimos no método da mesa. Pergunta provocadora: quem precisa de uma mesa dessas, hoje, para tomar uma decisão grande, e está esperando alguém marcar?",
    comentario_lider_em: "2026-05-09T08:30:00Z",
    created_at: "2026-05-07T09:15:00Z", updated_at: "2026-05-07T09:15:00Z",
  },
  {
    id: "r-9", atividade_id: "atv-6", aluno_id: "aluno-6",
    texto: "Minha comunidade hoje é família que se compromete. Mas teve um custo: três anos de presença consistente, perdoar duas crises grandes, abrir mão de uma promoção que ia me tirar da cidade. Comprometimento não é sentimento, é decisão acumulada.",
    comentario_lider: "Frase pra emoldurar: 'comprometimento não é sentimento, é decisão acumulada'. Posso citar essa em uma das aulas? Quero que mais gente ouça.",
    comentario_lider_em: "2026-05-10T11:00:00Z",
    created_at: "2026-05-08T15:30:00Z", updated_at: "2026-05-08T15:30:00Z",
  },
  {
    id: "r-10", atividade_id: "atv-7", aluno_id: "aluno-2",
    texto: "Palavra-síntese: COMEÇAR. Tenho adiado começar a discipular alguém porque acho que preciso estar pronta. Esse curso me mostrou que ninguém começa pronto. A gente começa porque é chamado, e amadurece andando.",
    comentario_lider: null, comentario_lider_em: null,
    created_at: "2026-05-13T19:50:00Z", updated_at: "2026-05-13T19:50:00Z",
  },
  {
    id: "r-11", atividade_id: "atv-2", aluno_id: "aluno-7",
    texto: "Acho que ainda não tenho uma mesa de formação real. Faço parte de um grupo, mas é mais social. O que me impede é não saber por onde começar a aprofundar.",
    comentario_lider: null, comentario_lider_em: null,
    created_at: "2026-05-13T08:30:00Z", updated_at: "2026-05-13T08:30:00Z",
  },
  {
    id: "r-12", atividade_id: "atv-8", aluno_id: "aluno-4",
    texto: "Quando entendo que sou filha primeiro, paro de tentar 'merecer' aprovação. O lugar onde isso ainda não desceu é no trabalho — continuo me esforçando demais para provar que sou competente. A insegurança da identidade aparece ali.",
    comentario_lider: "Beatriz, esse é um dos discernimentos mais importantes da vida cristã. Quando o trabalho deixa de ser palco de aprovação e vira lugar de serviço, muita coisa muda. Sugestão: ore essa semana especificamente sobre o trabalho. Veja o que muda.",
    comentario_lider_em: "2026-05-13T11:00:00Z",
    created_at: "2026-05-12T22:00:00Z", updated_at: "2026-05-12T22:00:00Z",
  },
  {
    id: "r-13", atividade_id: "atv-1", aluno_id: "aluno-8",
    texto: "Acabei de me cadastrar. Vou refletir essa semana e respondo até domingo!",
    comentario_lider: null, comentario_lider_em: null,
    created_at: "2026-05-13T18:20:00Z", updated_at: "2026-05-13T18:20:00Z",
  },
];

export type MockMatricula = {
  aluno_id: string; curso_id: string;
  matriculado_em: string; concluido_em: string | null;
};

export const MOCK_MATRICULAS: MockMatricula[] = [
  // Mesa Aberta — todos
  { aluno_id: "aluno-2", curso_id: "curso-1", matriculado_em: "2026-04-08T14:21:00Z", concluido_em: "2026-05-13T19:50:00Z" },
  { aluno_id: "aluno-3", curso_id: "curso-1", matriculado_em: "2026-04-10T09:05:00Z", concluido_em: null },
  { aluno_id: "aluno-4", curso_id: "curso-1", matriculado_em: "2026-04-15T20:30:00Z", concluido_em: null },
  { aluno_id: "aluno-5", curso_id: "curso-1", matriculado_em: "2026-04-18T07:14:00Z", concluido_em: null },
  { aluno_id: "aluno-6", curso_id: "curso-1", matriculado_em: "2026-04-20T16:42:00Z", concluido_em: "2026-05-08T15:30:00Z" },
  { aluno_id: "aluno-7", curso_id: "curso-1", matriculado_em: "2026-05-02T11:30:00Z", concluido_em: null },
  { aluno_id: "aluno-8", curso_id: "curso-1", matriculado_em: "2026-05-09T08:00:00Z", concluido_em: null },
  // Fundamentos
  { aluno_id: "aluno-2", curso_id: "curso-2", matriculado_em: "2026-05-13T20:00:00Z", concluido_em: null },
  { aluno_id: "aluno-4", curso_id: "curso-2", matriculado_em: "2026-05-12T22:00:00Z", concluido_em: null },
  { aluno_id: "aluno-6", curso_id: "curso-2", matriculado_em: "2026-05-08T15:35:00Z", concluido_em: null },
  // Envio (curso pago)
  { aluno_id: "aluno-6", curso_id: "curso-3", matriculado_em: "2026-04-25T10:00:00Z", concluido_em: null },
];

export const MOCK_PROGRESSO: { aluno_id: string; aula_id: string; concluido_em: string }[] = [
  // aluno-2 (Maria) concluiu todas de Mesa Aberta
  { aluno_id: "aluno-2", aula_id: "aula-1", concluido_em: "2026-05-08T22:30:00Z" },
  { aluno_id: "aluno-2", aula_id: "aula-2", concluido_em: "2026-05-09T19:00:00Z" },
  { aluno_id: "aluno-2", aula_id: "aula-3", concluido_em: "2026-05-10T20:00:00Z" },
  { aluno_id: "aluno-2", aula_id: "aula-4", concluido_em: "2026-05-11T19:00:00Z" },
  { aluno_id: "aluno-2", aula_id: "aula-5", concluido_em: "2026-05-12T20:00:00Z" },
  { aluno_id: "aluno-2", aula_id: "aula-6", concluido_em: "2026-05-13T18:00:00Z" },
  { aluno_id: "aluno-2", aula_id: "aula-7", concluido_em: "2026-05-13T19:50:00Z" },
  // aluno-3 está na 4
  { aluno_id: "aluno-3", aula_id: "aula-1", concluido_em: "2026-05-12T22:00:00Z" },
  { aluno_id: "aluno-3", aula_id: "aula-2", concluido_em: "2026-05-13T22:00:00Z" },
  { aluno_id: "aluno-3", aula_id: "aula-3", concluido_em: "2026-05-13T23:00:00Z" },
  // aluno-6 (Camila) concluiu Mesa Aberta inteira
  { aluno_id: "aluno-6", aula_id: "aula-1", concluido_em: "2026-05-07T10:00:00Z" },
  { aluno_id: "aluno-6", aula_id: "aula-2", concluido_em: "2026-05-07T18:00:00Z" },
  { aluno_id: "aluno-6", aula_id: "aula-3", concluido_em: "2026-05-08T08:00:00Z" },
  { aluno_id: "aluno-6", aula_id: "aula-4", concluido_em: "2026-05-08T12:00:00Z" },
  { aluno_id: "aluno-6", aula_id: "aula-5", concluido_em: "2026-05-08T14:00:00Z" },
  { aluno_id: "aluno-6", aula_id: "aula-6", concluido_em: "2026-05-08T15:30:00Z" },
  { aluno_id: "aluno-6", aula_id: "aula-7", concluido_em: "2026-05-08T16:00:00Z" },
];

// ============== Helpers ==============

export function isMockMode(): boolean {
  return process.env.NEXT_PUBLIC_MOCK_MODE === "true";
}

export function findCurso(slug: string) {
  return MOCK_CURSOS.find((c) => c.slug === slug);
}

export function aulasByCurso(cursoId: string) {
  return MOCK_AULAS
    .filter((a) => a.curso_id === cursoId)
    .sort((a, b) => a.ordem - b.ordem);
}

export function findAula(aulaId: string) {
  return MOCK_AULAS.find((a) => a.id === aulaId);
}

export function atividadesByAula(aulaId: string) {
  return MOCK_ATIVIDADES
    .filter((a) => a.aula_id === aulaId)
    .sort((a, b) => a.ordem - b.ordem);
}

export function respostasByAluno(alunoId: string) {
  return MOCK_RESPOSTAS.filter((r) => r.aluno_id === alunoId);
}

export function progressoByAluno(alunoId: string) {
  return MOCK_PROGRESSO.filter((p) => p.aluno_id === alunoId);
}

export function matriculasByAluno(alunoId: string) {
  return MOCK_MATRICULAS.filter((m) => m.aluno_id === alunoId);
}

// ===== Estado mutável de respostas MC (apenas em modo mock) =====
// Map: `${alunoId}::${atividadeId}` → alternativaId
const MOCK_MC_ANSWERS = new Map<string, string>();

export function setMockMcAnswer(alunoId: string, atividadeId: string, alternativaId: string) {
  MOCK_MC_ANSWERS.set(`${alunoId}::${atividadeId}`, alternativaId);
}

export function getMockMcAnswer(alunoId: string, atividadeId: string): string | undefined {
  return MOCK_MC_ANSWERS.get(`${alunoId}::${atividadeId}`);
}

export function alternativasByAtividade(atividadeId: string): Alternativa[] {
  return MOCK_ALTERNATIVAS.filter((a) => a.atividade_id === atividadeId).sort((a, b) => a.ordem - b.ordem);
}

// Retorna true se TODAS as MC da aula foram respondidas corretamente pelo aluno
export function aulaCompletaMC(alunoId: string, aulaId: string): boolean {
  const mcs = MOCK_ATIVIDADES.filter((a) => a.aula_id === aulaId && a.tipo === "multipla_escolha");
  if (mcs.length === 0) return true; // aulas sem MC não bloqueiam
  for (const atv of mcs) {
    const altSelId = MOCK_MC_ANSWERS.get(`${alunoId}::${atv.id}`);
    if (!altSelId) return false;
    const alt = MOCK_ALTERNATIVAS.find((a) => a.id === altSelId);
    if (!alt || !alt.correta) return false;
  }
  return true;
}
