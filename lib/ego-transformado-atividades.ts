// =============================================================
// Atividades do curso "Ego Transformado" (Timothy Keller, Vida Nova 2014)
// Espelha o que está no banco em produção (migrações 004, 007, 009).
//
// Estrutura por aula:
//   - ordem 1 e 2: reflexões (perguntas abertas, obrigatórias)
//   - ordem 3 a 12: 10 questões de múltipla escolha (na ordem do capítulo)
//
// Cada MC tem 4 alternativas, sendo exatamente uma correta.
// =============================================================

import type { Atividade, Alternativa } from "@/lib/types";

const REFLEXAO_TS = "2026-05-21T00:00:00Z";
const MC_TS = "2026-05-14T00:00:00Z";

type AltTuple = readonly [string, boolean];

function mc(
  aulaId: string,
  ordem: number,
  pergunta: string,
  razao: string,
  alts: readonly AltTuple[]
): { atividade: Atividade; alternativas: Alternativa[] } {
  const atvId = `${aulaId}-mc-${String(ordem).padStart(2, "0")}`;
  return {
    atividade: {
      id: atvId,
      aula_id: aulaId,
      ordem,
      tipo: "multipla_escolha",
      razao,
      pergunta,
      created_at: MC_TS,
    },
    alternativas: alts.map(([texto, correta], i) => ({
      id: `${atvId}-alt-${i + 1}`,
      atividade_id: atvId,
      ordem: i + 1,
      texto,
      correta,
    })),
  };
}

function ref(aulaId: string, ordem: 1 | 2, pergunta: string): Atividade {
  return {
    id: `${aulaId}-ref-${ordem}`,
    aula_id: aulaId,
    ordem,
    tipo: "reflexao",
    razao: null,
    pergunta,
    created_at: REFLEXAO_TS,
  };
}

// --- Reflexões (2 por capítulo, ordem 1 e 2) ---
export const EGO_REFLEXOES: Atividade[] = [
  ref("k-aula-1", 1, "Que pergunta este capítulo deixou no seu coração?"),
  ref("k-aula-1", 2, "Onde você tem buscado se sentir alguém de valor?"),
  ref("k-aula-2", 1, "Das quatro marcas — vazio, dolorido, atarefado, frágil — qual você reconhece mais em você hoje?"),
  ref("k-aula-2", 2, "Em que momento da sua semana o seu ego doeu?"),
  ref("k-aula-3", 1, "Em que parte da sua vida você ainda está tentando provar quem você é?"),
  ref("k-aula-3", 2, "Como você costuma reagir quando recebe uma crítica?"),
  ref("k-aula-4", 1, "Onde você ainda performa para se sentir aceito?"),
  ref("k-aula-4", 2, "O que você quer praticar essa semana para lembrar que Deus já se pronunciou sobre você?"),
];

// --- MCs por capítulo (10 cada, ordem 3 a 12) ---
const MCS = [
  // ========= K1 — Introdução =========
  mc("k-aula-1", 3,
    "Qual é a pergunta central que abre o livro de Keller, ao analisar 1Coríntios 3.21–4.7?",
    'Keller abre o livro perguntando: "Quais são as marcas de um coração radicalmente transformado pela graça de Deus?". Tudo o que vem depois é resposta a essa pergunta.',
    [
      ["Como ter mais sucesso na vida cristã?", false],
      ["Quais são as marcas de um coração radicalmente transformado pela graça de Deus?", true],
      ["Como aumentar a autoestima do crente moderno?", false],
      ["Como vencer os adversários da igreja?", false],
    ]),
  mc("k-aula-1", 4,
    "Qual passagem bíblica Keller usa como base para este estudo?",
    "Keller fundamenta toda a reflexão em 1Coríntios 3.21—4.7, onde Paulo trata da divisão na igreja de Corinto.",
    [
      ["Romanos 8.1-7", false],
      ["1Coríntios 3.21—4.7", true],
      ["Mateus 5.1-12 (Bem-aventuranças)", false],
      ["Salmo 139.23-24", false],
    ]),
  mc("k-aula-1", 5,
    "O que estava por trás da divisão na igreja de Corinto, segundo Paulo?",
    "Paulo identifica orgulho e vanglória como a raiz: os coríntios usavam relacionamentos com Paulo, Apolo e Cefas como trampolim para um jogo de poder, formando facções.",
    [
      ["Discordâncias doutrinárias sobre o batismo", false],
      ["Diferenças culturais entre judeus e gentios", false],
      ["Orgulho e vanglória — formação de facções em torno de líderes", true],
      ["Falta de recursos financeiros para manter a igreja", false],
    ]),
  mc("k-aula-1", 6,
    'Na visão das culturas tradicionais, o que era o "hubris" — causa apontada para o mau comportamento humano?',
    "Hubris é palavra grega que significa soberba ou autoestima elevada demais. As culturas tradicionais explicavam o mau comportamento atribuindo-o a esse excesso de auto-importância.",
    [
      ["Falta de educação formal", false],
      ["Soberba — autoestima elevada demais", true],
      ["Vergonha ou baixa autoestima", false],
      ["Ignorância religiosa", false],
    ]),
  mc("k-aula-1", 7,
    "Como a sociedade ocidental contemporânea explica o mau comportamento humano?",
    "A crença moderna inverteu a tradicional: hoje se acredita que as pessoas agem mal por falta de autoestima e valorização muito baixa de si mesmas.",
    [
      ["Autoestima elevada demais (igual à visão tradicional)", false],
      ["Influência de fatores espirituais malignos", false],
      ["Falta de autoestima — autovalorização muito baixa de si mesmas", true],
      ["Predisposição genética", false],
    ]),
  mc("k-aula-1", 8,
    "O que Lauren Slater concluiu, no artigo do New York Times citado por Keller?",
    "Slater relatou que as pesquisas mostram que pessoas com autoestima elevada são mais perigosas que as de baixa autoestima — contrariando a teoria moderna dominante.",
    [
      ["Que a baixa autoestima é o maior problema social do país", false],
      ["Que pessoas com autoestima elevada são mais perigosas que as de baixa autoestima", true],
      ["Que autoestima não tem nenhuma relação com comportamento", false],
      ["Que só pessoas religiosas têm autoestima saudável", false],
    ]),
  mc("k-aula-1", 9,
    'Por que a "teoria da baixa autoestima como causa do mau comportamento" é tão atraente, segundo Keller?',
    "Ela é atraente porque não exige nenhum julgamento moral — basta animar a pessoa e ajudá-la a se desenvolver, sem precisar repreender o erro.",
    [
      ["Porque tem comprovação científica robusta", false],
      ["Porque permite resolver problemas sem precisar fazer julgamento moral", true],
      ["Porque foi desenvolvida por psicólogos cristãos", false],
      ["Porque tem apoio direto da Bíblia", false],
    ]),
  mc("k-aula-1", 10,
    "Como as culturas tradicionais lidavam com o mau comportamento das pessoas?",
    "Nas culturas tradicionais, as pessoas eram repreendidas, convencidas do erro e alertadas da sua maldade — abordagem oposta à animação moderna.",
    [
      ["Encorajando, elogiando e oferecendo terapia", false],
      ["Ignorando o problema até passar", false],
      ["Repreendendo, convencendo do erro e alertando da maldade", true],
      ["Excluindo a pessoa da convivência social", false],
    ]),
  mc("k-aula-1", 11,
    "Qual o problema comum tanto da abordagem tradicional (autoestima alta = causa do mal) quanto da moderna (baixa autoestima = causa do mal)?",
    'Keller diz literalmente que Paulo apresenta uma forma de enxergar o eu "completamente diferente da abordagem das culturas tradicionais e modernas/pós-modernas".',
    [
      ["A tradicional está totalmente certa, a moderna está errada.", false],
      ["A moderna está totalmente certa, a tradicional está errada.", false],
      ["Ambas tratam o ego como o centro do problema, mas Paulo aponta para algo completamente diferente.", true],
      ["Ambas são complementares e podem ser combinadas.", false],
    ]),
  mc("k-aula-1", 12,
    "Quais são as três coisas que Paulo revela nesse texto, segundo Keller?",
    "Paulo revela: (1) a condição natural do ego humano, (2) a visão transformada do eu pelo evangelho, e (3) como alcançar essa visão transformada.",
    [
      ["Três tipos de pecado, três culturas e três castigos", false],
      ["A condição natural do ego, a visão transformada do eu, e como alcançá-la", true],
      ["Como ser admirado pela igreja, pela cidade e por Deus", false],
      ["Três métodos de aumentar a autoestima", false],
    ]),

  // ========= K2 — A condição natural do ego humano =========
  mc("k-aula-2", 3,
    'Por que Paulo escolheu a palavra "physioō" em vez de "hubris" para falar sobre orgulho?',
    'Physioō é uma palavra incomum, usada quase exclusivamente por Paulo — sugerindo que ele queria ensinar algo específico sobre o ego humano que a palavra comum "hubris" não captava.',
    [
      ['Porque "hubris" não existia no grego do seu tempo', false],
      ["Porque queria ensinar algo específico sobre o ego — physioō é uma palavra rara usada quase só por ele", true],
      ["Porque queria evitar parecer crítico aos coríntios", false],
      ["Porque foi um erro de copista preservado nas cópias", false],
    ]),
  mc("k-aula-2", 4,
    "A palavra grega physioō, que Paulo usa para descrever o ego natural, significa literalmente:",
    'A palavra grega physioō, usada por Paulo, está relacionada ao termo "fole" — a imagem é de um órgão humano superinflado, prestes a explodir.',
    [
      ["Vazio e quieto.", false],
      ['Inflado, inchado, distendido além do tamanho normal (relacionada a "fole").', true],
      ["Sólido e bem formado.", false],
      ["Pequeno e insignificante.", false],
    ]),
  mc("k-aula-2", 5,
    "Quais são as quatro marcas do ego humano natural, segundo Keller?",
    "Keller lista exatamente essas quatro: vazio (não tem nada no centro), dolorido (vive ferido), atarefado (vive se comparando) e frágil (qualquer coisa superinflada está prestes a estourar).",
    [
      ["Forte, sólido, alegre e satisfeito.", false],
      ["Inflado, contente, atarefado e seguro.", false],
      ["Vazio, dolorido, atarefado e frágil.", true],
      ["Vazio, sereno, livre e leve.", false],
    ]),
  mc("k-aula-2", 6,
    "Segundo Kierkegaard (citado por Keller), em torno do que o coração humano natural costuma criar sua identidade?",
    "Para Kierkegaard, o ego natural se fundamenta em algo além de Deus — busca em sucesso, beleza, aprovação ou propósito o senso de valor que só Deus pode dar.",
    [
      ["Em torno de Deus, naturalmente", false],
      ["Em torno da razão e da lógica", false],
      ["Em torno de algo que não é Deus", true],
      ["Em torno da consciência coletiva da humanidade", false],
    ]),
  mc("k-aula-2", 7,
    'Quando dizemos que "alguém feriu nossos sentimentos", o que está realmente acontecendo, segundo Keller?',
    "Keller mostra que sentimentos não podem ser feridos — quem se sente machucado é o ego (o nosso eu, a nossa identidade). É o ego que dói.",
    [
      ["Os sentimentos foram realmente feridos", false],
      ["Os sentimentos continuam ótimos — quem se machucou foi o ego (nossa identidade)", true],
      ["É apenas uma figura de linguagem sem significado real", false],
      ["Deus é quem está nos disciplinando", false],
    ]),
  mc("k-aula-2", 8,
    "Segundo C.S. Lewis (citado por Keller), qual é a essência do orgulho?",
    "Para Lewis, o orgulho é competitivo por definição: ninguém se orgulha de ter algo, mas de tê-lo em quantidade MAIOR que os outros.",
    [
      ["A satisfação de ter algo em abundância", false],
      ["A competitividade — ter MAIS do que os outros", true],
      ["A coragem de defender a própria honra", false],
      ["A capacidade de se afirmar em público", false],
    ]),
  mc("k-aula-2", 9,
    "No exemplo do menino que fazia coisas que detestava (xadrez, voluntariado) por insistência da mãe, o que Keller está ilustrando?",
    'Keller usa o exemplo para mostrar como o ego vive construindo um "currículo" que impressione — fazemos coisas pelas quais não temos interesse só para nos sobressair.',
    [
      ["A importância da disciplina e da obediência aos pais", false],
      ['Como o ego vive construindo um "currículo" que impressione, mesmo em coisas que detestamos', true],
      ["Que pais sempre sabem o que é melhor para os filhos", false],
      ["A virtude do serviço aos pobres", false],
    ]),
  mc("k-aula-2", 10,
    "Por que complexo de superioridade e complexo de inferioridade são basicamente a mesma coisa, segundo Keller?",
    "Ambos resultam de um ego superinflado: um vive com medo de ser desinflado, o outro já foi desinflado. Os dois estão presos à mesma dinâmica.",
    [
      ["Porque ambos têm raízes na infância", false],
      ["Porque ambos resultam de um ego superinflado — um teme estourar, o outro já estourou", true],
      ["Porque os dois são curados com o mesmo medicamento", false],
      ["Porque ambos são problemas exclusivamente femininos", false],
    ]),
  mc("k-aula-2", 11,
    "Por que Keller diz que o ego natural é frágil?",
    "Qualquer coisa superinflada está prestes a estourar — é a imagem da bexiga cheia demais. Por estar inflado em vez de saciado, o ego natural é inerentemente instável.",
    [
      ["Por causa da genética e da idade", false],
      ["Pela falta de exercício espiritual", false],
      ["Porque qualquer coisa superinflada está prestes a estourar", true],
      ["Pela ausência de elogios recebidos", false],
    ]),
  mc("k-aula-2", 12,
    'O exemplo da Madonna ("o que me impulsiona é o medo de ser medíocre... minha luta nunca terminará") ilustra qual verdade sobre o ego?',
    'Keller usa Madonna como exemplo de alguém autoconsciente o suficiente para confessar que mesmo no auge do sucesso o ego permanece um "buraco negro" que nunca se enche.',
    [
      ["Que apenas pessoas famosas têm crise de ego.", false],
      ["Que o sucesso, eventualmente, resolve a insegurança.", false],
      ["Que o ego é insaciável — todo desempenho exige outro desempenho, e a despensa nunca enche.", true],
      ["Que humildade é uma qualidade só dos pobres.", false],
    ]),

  // ========= K3 — A visão transformada do eu =========
  mc("k-aula-3", 3,
    "Em 1Coríntios 4.1,2, o que Paulo lembra aos coríntios sobre seu papel?",
    "Paulo se apresenta como ministro de Deus encarregado dos mistérios divinos, com uma obra a realizar — não como alguém que precisa do veredicto deles para se sentir alguém.",
    [
      ["Que ele é o maior apóstolo da igreja", false],
      ["Que ele é ministro de Deus encarregado dos mistérios divinos, com uma obra a realizar", true],
      ["Que ele merece respeito por ter chegado primeiro à cidade", false],
      ["Que ele precisa do apoio financeiro deles", false],
    ]),
  mc("k-aula-3", 4,
    'Quando Paulo diz "pouco me importa se sou julgado por vós", o que a palavra "julgado" significa, segundo Keller?',
    'A palavra tem o sentido de "ser alvo de um veredicto" — Paulo está dizendo que não precisa que ninguém (nem ele mesmo) pronuncie um veredicto definitivo sobre quem ele é.',
    [
      ["Ser condenado em um tribunal criminal", false],
      ["Ser corrigido em uma sala de aula", false],
      ["Ser alvo de um veredicto definitivo sobre quem você é", true],
      ["Ser conhecido por suas obras", false],
    ]),
  mc("k-aula-3", 5,
    'Em 1Coríntios 4.3-4, Paulo diz: "pouco me importa se sou julgado por vós... nem eu julgo a mim mesmo". O que ele está dizendo, segundo Keller?',
    "Paulo recusa o jogo da autoestima por inteiro: nem busca veredicto nos outros, nem em si mesmo. Saiu do tribunal humano e do tribunal interno.",
    [
      ["Que devemos seguir nossos próprios padrões em vez dos padrões dos outros.", false],
      ["Que sua consciência está limpa e por isso ele se sente inocente.", false],
      ["Que ele saiu do tribunal — sua identidade não depende nem da opinião dos outros nem da própria opinião sobre si.", true],
      ["Que ele desistiu de tentar ser uma pessoa boa.", false],
    ]),
  mc("k-aula-3", 6,
    "Por que estabelecer os próprios padrões (em vez de seguir os dos outros) não resolve o problema, segundo Keller?",
    "Não funciona porque qualquer padrão sério eu não consigo cumprir e qualquer padrão frouxo me condena por ter padrões baixos — em ambos os casos, o tribunal interno continua condenando.",
    [
      ["Porque é considerado arrogante pela sociedade", false],
      ["Porque a Bíblia proíbe explicitamente", false],
      ["Padrões sérios eu não consigo cumprir, e padrões frouxos me condenam por serem baixos", true],
      ["Porque a sociedade contemporânea impede", false],
    ]),
  mc("k-aula-3", 7,
    'Em 1Timóteo 1.15, Paulo se declara "o principal dos pecadores". Por que essa afirmação é impressionante, segundo Keller?',
    'Porque Paulo usa o tempo presente ("sou", não "era") — e mesmo assim mantém estabilidade, confiança e segue na obra à qual foi chamado. Foge às nossas categorias.',
    [
      ["Porque Paulo era de fato o pior pecador da história", false],
      ['Porque ele usa o tempo presente ("sou", não "era") e mesmo assim mantém estabilidade e confiança', true],
      ["Porque Timóteo precisava ouvir isso para sua própria fé", false],
      ["Porque é uma declaração de humildade fingida, uma estratégia retórica", false],
    ]),
  mc("k-aula-3", 8,
    "O que Paulo faz com seus pecados e suas realizações, segundo Keller?",
    "Paulo enxerga ambos — pecados e realizações — mas se recusa a conectá-los à sua identidade. Eles não definem quem ele é.",
    [
      ["Esconde os pecados e celebra publicamente as realizações", false],
      ["Confessa os pecados e esquece tudo o mais", false],
      ["Enxerga ambos, mas se recusa a conectá-los à sua identidade", true],
      ["Aceita os dois como definidores de quem ele é", false],
    ]),
  mc("k-aula-3", 9,
    "Segundo Keller, o que Paulo descreve como humildade NÃO tem nenhuma relação com:",
    'Keller faz questão de dizer que a humildade do evangelho "não tem nenhuma relação com nossa ideia de humildade" — não é nem alta nem baixa autoestima, é uma terceira coisa.',
    [
      ["Com o evangelho de Cristo", false],
      ["Com a doutrina cristã", false],
      ['Com a nossa ideia comum de "humildade" — não é alta nem baixa autoestima', true],
      ["Com a vida prática diária", false],
    ]),
  mc("k-aula-3", 10,
    'Segundo a famosa citação de C.S. Lewis em "Cristianismo puro e simples", o que é a verdadeira humildade do evangelho?',
    'C.S. Lewis: "a essência da humildade resultante do evangelho não é pensar em mim mesmo como se eu fosse mais nem pensar em mim mesmo como se eu fosse menos; é pensar menos em mim mesmo".',
    [
      ["Pensar em si mesmo como inferior aos outros.", false],
      ["Pensar em si mesmo como superior, mas sem demonstrar.", false],
      ['Pensar menos em si mesmo (não "mais" nem "menos", simplesmente menos).', true],
      ["Não pensar em mais nada além de si mesmo.", false],
    ]),
  mc("k-aula-3", 11,
    "Que imagem Keller usa para descrever o ego de uma pessoa verdadeiramente humilde segundo o evangelho?",
    "O ego dela é como os dedos dos pés: simplesmente exerce sua função, sem implorar por atenção. Ele trabalha, mas não chama a atenção para si.",
    [
      ["Um músculo forte e visível", false],
      ["Um castelo bem fortificado", false],
      ["Os dedos dos pés — simplesmente exerce sua função sem chamar atenção", true],
      ["Uma vela apagada", false],
    ]),
  mc("k-aula-3", 12,
    'Qual o "teste simples" que Keller apresenta para identificar uma pessoa que se esqueceu de si mesma?',
    'Keller: a pessoa esquecida de si "não se sente ferida, não fica mal quando criticada" — mas, diferente de quem só ignora, ainda "a entende como oportunidade de mudança".',
    [
      ["Ela se sente arrasada por toda crítica.", false],
      ["Ela ignora completamente toda crítica para se proteger.", false],
      ["Ela ouve a crítica sem ser destruída por ela e a entende como oportunidade de mudança.", true],
      ["Ela nunca recebe críticas porque é perfeita.", false],
    ]),

  // ========= K4 — Como alcançar uma visão transformada do eu =========
  mc("k-aula-4", 3,
    'Como Paulo alcançou o "bendito autoesquecimento", segundo Keller?',
    "Não foi por força de vontade nem por seguir padrões. Foi porque alguém — o único cuja opinião realmente importa — já havia se pronunciado sobre ele.",
    [
      ["Por anos de meditação e disciplina espiritual", false],
      ["Por ter passado por muitos sofrimentos", false],
      ["Porque o único cuja opinião realmente importa já havia se pronunciado sobre ele", true],
      ["Por estudar filosofia grega", false],
    ]),
  mc("k-aula-4", 4,
    "Segundo Keller, o que Paulo, Madonna e todos nós buscamos?",
    "Buscamos um veredicto definitivo que afirme que somos importantes e valiosos — e fazemos isso todos os dias, colocando-nos em um tribunal.",
    [
      ["Sucesso material e fama", false],
      ["Aprovação dos pais", false],
      ["Um veredicto definitivo que afirme que somos importantes e valiosos", true],
      ["Aprovação dos amigos próximos", false],
    ]),
  mc("k-aula-4", 5,
    'Por que Paulo usa a metáfora do "tribunal" mesmo sabendo que os coríntios não eram um tribunal?',
    "Para mostrar que o problema da autoestima — alta ou baixa — é que todos os dias nos colocamos em julgamento, buscando um veredicto sobre quem somos.",
    [
      ["Porque a Lei Romana usava essa imagem", false],
      ["Porque era uma piada interna com os coríntios", false],
      ["Para mostrar que todos os dias nos colocamos em julgamento, buscando veredicto sobre quem somos", true],
      ["Porque ele teve experiência judicial recente", false],
    ]),
  mc("k-aula-4", 6,
    "Em outras religiões (ateísmo, budismo, islamismo), qual é a relação entre desempenho e veredicto, segundo Keller?",
    "Em todas essas, é o desempenho que leva ao veredicto — você precisa atuar bem para descobrir que é alguém. Por isso vive todo dia em julgamento.",
    [
      ["Não há relação — são sistemas que ignoram veredictos", false],
      ["Veredicto e desempenho são independentes", false],
      ["O desempenho leva ao veredicto — por isso a pessoa vive em julgamento todos os dias", true],
      ["Os veredictos são dados aleatoriamente", false],
    ]),
  mc("k-aula-4", 7,
    "O que torna o evangelho cristão radicalmente diferente de toda outra forma de identidade, segundo Keller?",
    'Keller: "é somente no evangelho de Jesus Cristo que o veredicto é dado antes de desempenharmos nossas ações". Em todas as outras formas de identidade, é o desempenho que leva ao veredicto.',
    [
      ["O cristão não precisa de nenhum veredicto sobre si.", false],
      ["O veredicto é dado antes do desempenho — não depois.", true],
      ["Deus avalia apenas as boas obras, ignorando as más.", false],
      ["O desempenho cristão é maior que o de outras religiões.", false],
    ]),
  mc("k-aula-4", 8,
    "No cristianismo, qual é a BASE do veredicto positivo de Deus sobre o crente?",
    "É o desempenho perfeito de Cristo, imputado a nós. Quando cremos, Deus nos vê com as ações perfeitas de Cristo, como se fossem nossas.",
    [
      ["O nosso bom comportamento e nossas obras", false],
      ["O desempenho perfeito de Cristo, imputado a nós", true],
      ["Nossa decisão pessoal de seguir Jesus", false],
      ["Os méritos dos nossos antepassados", false],
    ]),
  mc("k-aula-4", 9,
    "Por que Jesus precisou ser julgado e condenado, segundo Keller?",
    "Para nos substituir — Jesus recebeu a condenação que merecíamos e encarou o julgamento que deveria ser nosso, para que não precisássemos enfrentar mais nenhum.",
    [
      ["Porque Ele cometeu pecados que precisavam ser pagos", false],
      ["Para nos substituir — recebeu a condenação que merecíamos", true],
      ["Para ensinar como suportar injustiça com paciência", false],
      ["Para cumprir uma profecia secundária do Antigo Testamento", false],
    ]),
  mc("k-aula-4", 10,
    'Quando Deus diz ao cristão "Tu és o meu filho amado, em ti me agrado" (Marcos 1.11), o que está acontecendo, segundo Keller?',
    "Deus está atribuindo ao crente as ações perfeitas de Cristo, como se fossem dele, e adotando-o como filho. O veredicto vem da obra de Cristo, não do desempenho do crente.",
    [
      ["Deus está respondendo ao bom desempenho do cristão", false],
      ["Deus está atribuindo ao crente o desempenho perfeito de Cristo e adotando-o como filho", true],
      ["É uma promessa apenas para o futuro, ainda não realizada", false],
      ["Deus está se referindo apenas a Jesus, não ao crente", false],
    ]),
  mc("k-aula-4", 11,
    "Por que todos os outros sistemas de identidade (não-cristãos) falham, segundo Keller?",
    "Porque neles o veredicto nunca chega — como Madonna confessou, mesmo no auge do sucesso o desempenho jamais alcança o veredicto supremo que a pessoa busca.",
    [
      ["Porque seus seguidores são preguiçosos", false],
      ["Porque o veredicto nunca chega — o desempenho jamais alcança o veredicto supremo", true],
      ["Porque eles não têm uma escritura sagrada", false],
      ["Porque dependem de líderes humanos falíveis", false],
    ]),
  mc("k-aula-4", 12,
    'Para alguém que já crê mas todos os dias se vê "arrastado de volta para o tribunal", qual a orientação prática de Keller?',
    'Keller: "temos de reviver o evangelho cada vez que orarmos. Temos de revivê-lo sempre que vamos à igreja. Temos de reviver o evangelho a todo instante e perguntar a nós mesmos por que estamos no tribunal. Ali não é mais o nosso lugar."',
    [
      ["Tentar ter mais pensamentos positivos sobre si mesmo.", false],
      ["Estabelecer padrões pessoais mais altos para conquistar autoestima.", false],
      ["Reviver o evangelho cada vez que orar, for à igreja, e a todo instante — lembrando que o julgamento já terminou em Cristo.", true],
      ["Parar de ir à igreja para evitar a comparação com outros crentes.", false],
    ]),
];

export const EGO_MCS: Atividade[] = MCS.map((m) => m.atividade);
export const EGO_ALTERNATIVAS: Alternativa[] = MCS.flatMap((m) => m.alternativas);
