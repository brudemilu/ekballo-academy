// Dados e lógica da "Avaliação de Liderança Parach" (Apêndice A do livro
// O Blueprint de Parach). Instrumento diagnóstico de 40 afirmações em escala
// 1–5. Parte 1 identifica o dom quíntuplo (5 seções × 5 = 25 perguntas);
// Parte 2 calcula o Índice de Florescimento (Florescimento − Esforço).
// Tudo é auto-relato — não há resposta "certa".

export type GiftKey = "apostolo" | "profeta" | "evangelista" | "pastor" | "mestre";

export const ESCALA: { v: number; curto: string; label: string }[] = [
  { v: 1, curto: "Raramente", label: "Raramente / Nunca" },
  { v: 2, curto: "Ocasional", label: "Ocasionalmente" },
  { v: 3, curto: "Às vezes", label: "Às vezes" },
  { v: 4, curto: "Frequente", label: "Frequentemente" },
  { v: 5, curto: "Quase sempre", label: "Quase sempre" },
];

export type Pergunta = { n: number; texto: string };
export type Secao = {
  id: string;
  titulo: string;
  parte: 1 | 2;
  tipo: "dom" | "esforco" | "florescimento";
  gift?: GiftKey;
  max: number;
  perguntas: Pergunta[];
};

export const SECOES: Secao[] = [
  {
    id: "A", titulo: "Tendências Apostólicas", parte: 1, tipo: "dom", gift: "apostolo", max: 25,
    perguntas: [
      { n: 1, texto: "Quando vejo uma necessidade ou lacuna no ministério, meu primeiro instinto é construir algo novo em vez de me encaixar em estruturas existentes." },
      { n: 2, texto: "Sou energizado por abrir caminhos — iniciar novos projetos, plantar igrejas, lançar organizações ou estabelecer novo território." },
      { n: 3, texto: "Naturalmente penso em termos de sistemas, fundamentos e saúde organizacional de longo prazo, em vez de necessidades pastorais imediatas." },
      { n: 4, texto: "Acho difícil manter o que já está estabelecido; sou atraído pelo que ainda não existe." },
      { n: 5, texto: "As pessoas frequentemente recorrem a mim para visão estratégica e direção de longo alcance." },
    ],
  },
  {
    id: "B", titulo: "Tendências Proféticas", parte: 1, tipo: "dom", gift: "profeta", max: 25,
    perguntas: [
      { n: 6, texto: "Com frequência percebo coisas sobre pessoas, situações ou atmosferas espirituais que outros parecem não notar." },
      { n: 7, texto: "Sinto um forte peso quando percebo que as pessoas se afastaram do propósito original de Deus, e sou compelido a falar a verdade mesmo quando é desconfortável." },
      { n: 8, texto: "Valorizo profundamente a autenticidade; tenho pouca tolerância para “falsidade” espiritual ou jogos religiosos." },
      { n: 9, texto: "Às vezes me sinto isolado ou incompreendido porque vejo coisas que outros não veem — ou não querem ver." },
      { n: 10, texto: "Quando recebo uma palavra ou revelação de Deus, sinto como fogo nos meus ossos — não consigo ficar em silêncio." },
    ],
  },
  {
    id: "C", titulo: "Tendências Evangelísticas", parte: 1, tipo: "dom", gift: "evangelista", max: 25,
    perguntas: [
      { n: 11, texto: "Sou naturalmente atraído por pessoas que ainda não conhecem Jesus, e conversas sobre fé fluem com naturalidade com elas." },
      { n: 12, texto: "Sinto um senso de urgência pelos perdidos — um impulso interior que me compele a compartilhar o evangelho." },
      { n: 13, texto: "Sou energizado ao ver pessoas chegarem à fé; poucas coisas me trazem maior alegria do que testemunhar uma conversão." },
      { n: 14, texto: "Consigo tornar a mensagem do evangelho clara, atraente e acessível para pessoas de diversas origens." },
      { n: 15, texto: "Sinto-me mais à vontade alcançando pessoas novas do que cuidando e nutrindo as que já estão na igreja." },
    ],
  },
  {
    id: "D", titulo: "Tendências Pastorais", parte: 1, tipo: "dom", gift: "pastor", max: 25,
    perguntas: [
      { n: 16, texto: "Sou naturalmente atraído por pessoas que estão feridas ou lutando, e acho fácil me sentar com elas em sua dor." },
      { n: 17, texto: "Lembro-me de detalhes sobre a vida das pessoas — suas histórias, famílias, lutas — e acompanho ao longo do tempo." },
      { n: 18, texto: "Sinto um forte senso de responsabilidade pelo bem-estar daqueles sob meus cuidados; levo os fardos deles pessoalmente." },
      { n: 19, texto: "Priorizo relacionamento e presença acima de programas e produtividade." },
      { n: 20, texto: "Sou protetor do meu “rebanho” — atento ao perigo espiritual, ao falso ensino ou a qualquer coisa que possa prejudicar aqueles que pastoreio." },
    ],
  },
  {
    id: "E", titulo: "Tendências de Ensino", parte: 1, tipo: "dom", gift: "mestre", max: 25,
    perguntas: [
      { n: 21, texto: "Tenho um amor profundo pelo estudo das Escrituras, escavando abaixo da superfície para entender contexto, línguas originais e profundidade teológica." },
      { n: 22, texto: "Sou incomodado por imprecisão teológica ou ensino superficial; sinto-me compelido a trazer clareza e precisão." },
      { n: 23, texto: "Encontro grande satisfação em tornar verdades complexas simples e acessíveis." },
      { n: 24, texto: "Penso naturalmente no porquê por trás das crenças — doutrina e coerência lógica importam profundamente para mim." },
      { n: 25, texto: "As pessoas frequentemente vêm a mim com perguntas sobre as Escrituras ou sobre como aplicar a verdade bíblica." },
    ],
  },
  {
    id: "F", titulo: "Indicadores de Esforço", parte: 2, tipo: "esforco", max: 35,
    perguntas: [
      { n: 26, texto: "Frequentemente sinto que estou correndo uma corrida para a qual nunca me inscrevi — exausto, atrasado, incapaz de alcançar." },
      { n: 27, texto: "Meu senso de valor sobe e desce com os “números” — frequência, conversões, orçamento, métricas de crescimento." },
      { n: 28, texto: "Regularmente me sinto culpado quando tiro tempo para descansar, como se estivesse decepcionando as pessoas." },
      { n: 29, texto: "Carrego o peso do ministério em grande parte sozinho; acredito que se eu não segurar tudo, tudo vai desmoronar." },
      { n: 30, texto: "Frequentemente digo “sim” a pedidos mesmo quando deveria dizer “não”, porque não suporto decepcionar pessoas." },
      { n: 31, texto: "Sinto-me mais à vontade falando sobre Deus do que passando tempo sem pressa com Deus." },
      { n: 32, texto: "Experimento com frequência sintomas físicos de estresse que atribuo às demandas do ministério." },
    ],
  },
  {
    id: "G", titulo: "Indicadores de Florescimento", parte: 2, tipo: "florescimento", max: 40,
    perguntas: [
      { n: 33, texto: "Minha liderança flui de descanso genuíno e conexão com Deus, não de ansiedade sobre resultados." },
      { n: 34, texto: "Fiz paz com minhas limitações; conheço minha faixa e estou contente nela." },
      { n: 35, texto: "Consigo genuinamente celebrar o sucesso de outros líderes sem me sentir ameaçado." },
      { n: 36, texto: "Tenho um ritmo de descanso sabático que é inegociável, não algo que encaixo quando possível." },
      { n: 37, texto: "Regularmente recebo de outros, em vez de apenas dar; sou pastoreado enquanto pastoreio." },
      { n: 38, texto: "Quando oro, passo mais tempo ouvindo do que falando." },
      { n: 39, texto: "Meço o sucesso pela fidelidade, em vez de pelos resultados visíveis." },
      { n: 40, texto: "Tenho uma orientação de longo prazo, ritmando-me para décadas em vez de correr rumo ao esgotamento." },
    ],
  },
];

export const DONS: Record<GiftKey, { nome: string; armadilha: string; funcao: string }> = {
  apostolo: { nome: "Apóstolo", armadilha: "Eu preciso construir tudo sozinho.", funcao: "o solo — estabelece o terreno para que tudo mais cresça" },
  profeta: { nome: "Profeta", armadilha: "Eu preciso mudá-los.", funcao: "o clima — mantém o jardim alinhado com o blueprint do Agricultor" },
  evangelista: { nome: "Evangelista", armadilha: "Eu preciso salvá-los.", funcao: "o polinizador — carrega vida para os lugares selvagens" },
  pastor: { nome: "Pastor", armadilha: "Eu preciso carregar todos eles.", funcao: "o jardineiro — garante que cada planta seja regada e conhecida" },
  mestre: { nome: "Mestre", armadilha: "Eu preciso saber tudo.", funcao: "o sistema de raízes — dá a profundidade que sustenta o jardim" },
};

export function classificarDom(score: number): string {
  if (score >= 20) return "Quase certamente um dom principal";
  if (score >= 15) return "Provavelmente secundário";
  if (score >= 10) return "Presente, mas não dominante";
  return "Não significativo";
}

export type Faixa = { nome: string; descricao: string; cor: "verde" | "oliveira" | "ambar" | "laranja" | "vermelho" };

export function faixaFlorescimento(indice: number): Faixa {
  if (indice >= 20) return { nome: "Transbordamento Saudável", descricao: "Você está liderando a partir do descanso.", cor: "verde" };
  if (indice >= 5) return { nome: "Estável, mas Vulnerável", descricao: "Padrões saudáveis, mas em risco em estações de alto estresse.", cor: "oliveira" };
  if (indice >= -4) return { nome: "Ponto de Inflexão", descricao: "Atenção imediata necessária.", cor: "ambar" };
  if (indice >= -19) return { nome: "Zona de Esgotamento", descricao: "Liderando a partir da exaustão; intervenção necessária.", cor: "laranja" };
  return { nome: "Risco de Colapso", descricao: "Busque apoio imediatamente.", cor: "vermelho" };
}

export type DomResultado = { gift: GiftKey; nome: string; score: number; classificacao: string };
export type Resultado = {
  doms: DomResultado[];
  principal: DomResultado;
  secundario: DomResultado;
  esforco: number;
  florescimento: number;
  indice: number;
  faixa: Faixa;
  armadilha: string;
  completo: boolean;
};

const GIFTS: GiftKey[] = ["apostolo", "profeta", "evangelista", "pastor", "mestre"];

export function pontuar(respostas: Record<number, number>): Resultado {
  const somaSecao = (s: Secao) => s.perguntas.reduce((acc, p) => acc + (respostas[p.n] || 0), 0);
  const doms: DomResultado[] = GIFTS.map((g) => {
    const sec = SECOES.find((s) => s.gift === g)!;
    const score = somaSecao(sec);
    return { gift: g, nome: DONS[g].nome, score, classificacao: classificarDom(score) };
  }).sort((a, b) => b.score - a.score);

  const esforco = somaSecao(SECOES.find((s) => s.tipo === "esforco")!);
  const florescimento = somaSecao(SECOES.find((s) => s.tipo === "florescimento")!);
  const indice = florescimento - esforco;

  const total = SECOES.reduce((acc, s) => acc + s.perguntas.length, 0);
  const respondidas = SECOES.reduce(
    (acc, s) => acc + s.perguntas.filter((p) => respostas[p.n]).length,
    0
  );

  return {
    doms,
    principal: doms[0],
    secundario: doms[1],
    esforco,
    florescimento,
    indice,
    faixa: faixaFlorescimento(indice),
    armadilha: DONS[doms[0].gift].armadilha,
    completo: respondidas === total,
  };
}

export const TOTAL_PERGUNTAS = SECOES.reduce((acc, s) => acc + s.perguntas.length, 0);
