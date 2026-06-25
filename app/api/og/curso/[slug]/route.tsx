import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";

// Gerador de capa pros cursos da plataforma.
// Cada slug tem identidade visual própria, dentro da paleta da plataforma
// (bege/laranja/oliveira). Aspect 16:9, 1600x900. Sem foto — só tipografia
// e elementos geométricos.

type CapaConfig = {
  preLabel: string;
  titulo: string;
  subtitulo: string;
  rodape: string;
  bg: string; // gradiente css
  textoCor: string;
  acentoCor: string;
  preLabelCor: string;
  rodapeCor: string;
  badge?: string;
  livroUrl?: string; // se definido, layout vira "livro à esquerda + texto à direita"
};

const CAPAS: Record<string, CapaConfig> = {
  "90-dias-galatas-juizes-efesios": {
    livroUrl: "/capas/90-dias-galatas-juizes-efesios.jpg", preLabel: "DEVOCIONAL · 90 DIAS",
    titulo: "90 Dias em\nGálatas, Juízes e Efésios", subtitulo: "Explore as Escrituras dia a dia",
    rodape: "A partir do livro de Timothy Keller e Richard Coekin",
    bg: "linear-gradient(135deg, #12303A 0%, #245A66 52%, #4E9AA6 100%)",
    textoCor: "#EAF6F8", acentoCor: "#E6C84A", preLabelCor: "#A9CFD6", rodapeCor: "#A9CFD6",
  },
  "mundo-plural": {
    livroUrl: "/capas/mundo-plural.jpg", preLabel: "VIDA CRISTÃ · MUNDO PLURAL",
    titulo: "Mundo\nPlural", subtitulo: "Como viver fielmente em um mundo plural",
    rodape: "Estudo de fé e cultura",
    bg: "linear-gradient(135deg, #14202E 0%, #28455E 52%, #4E88A8 100%)",
    textoCor: "#EAF3FB", acentoCor: "#E6C84A", preLabelCor: "#A9C6DC", rodapeCor: "#A9C6DC",
  },
  "evangelho-segundo-os-apostolos": {
    livroUrl: "/capas/evangelho-segundo-os-apostolos.jpg", preLabel: "JOHN MACARTHUR",
    titulo: "O Evangelho\nSegundo os Apóstolos", subtitulo: "A fé que salva e o senhorio de Cristo",
    rodape: "Estudo sobre a graça que transforma",
    bg: "linear-gradient(135deg, #2A1E10 0%, #5E441C 52%, #B8903A 100%)",
    textoCor: "#FBF4E6", acentoCor: "#E6C84A", preLabelCor: "#D8C088", rodapeCor: "#D8C088",
  },
  "depressao": {
    livroUrl: "/capas/depressao.jpg", preLabel: "ISMAEL SOBRINHO",
    titulo: "Depressão", subtitulo: "Cuidado, esperança e o evangelho na dor",
    rodape: "A partir do livro de Ismael Sobrinho",
    bg: "linear-gradient(135deg, #161B24 0%, #2E3A4E 52%, #5E7088 100%)",
    textoCor: "#EAEEF4", acentoCor: "#E6C84A", preLabelCor: "#AEBACA", rodapeCor: "#AEBACA",
  },
  "igreja-centrada": {
    livroUrl: "/capas/igreja-centrada.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "Igreja\nCentrada", subtitulo: "Ministério equilibrado e centrado no evangelho na cidade",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #0E2226 0%, #1C4A50 52%, #3E8C92 100%)",
    textoCor: "#EAF6F7", acentoCor: "#E6C84A", preLabelCor: "#A9CFD2", rodapeCor: "#A9CFD2",
  },
  "o-significado-do-casamento": {
    livroUrl: "/capas/o-significado-do-casamento.jpg", preLabel: "TIMOTHY E KATHY KELLER",
    titulo: "O Significado\ndo Casamento", subtitulo: "Enfrentando as complexidades do compromisso com a sabedoria de Deus",
    rodape: "A partir do livro de Timothy e Kathy Keller",
    bg: "linear-gradient(135deg, #2A1418 0%, #5E2C34 52%, #B85462 100%)",
    textoCor: "#FBEAEE", acentoCor: "#E6C84A", preLabelCor: "#E0A9B2", rodapeCor: "#E0A9B2",
  },
  "galatas-para-voce": {
    livroUrl: "/capas/galatas-para-voce.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "Gálatas\npara Você", subtitulo: "A liberdade do evangelho da graça",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #0E2A24 0%, #1C5446 52%, #3E967E 100%)",
    textoCor: "#EAFBF4", acentoCor: "#E6C84A", preLabelCor: "#A9E0CE", rodapeCor: "#A9E0CE",
  },
  "o-evangelho-no-centro": {
    livroUrl: "/capas/o-evangelho-no-centro.jpg", preLabel: "CARSON E KELLER",
    titulo: "O Evangelho\nno Centro", subtitulo: "Renovando o coração, a igreja e o mundo",
    rodape: "A partir do livro de D. A. Carson e Timothy Keller",
    bg: "linear-gradient(135deg, #1A1A2E 0%, #34345A 52%, #6464A0 100%)",
    textoCor: "#EAEAFB", acentoCor: "#E6C84A", preLabelCor: "#AEAEDC", rodapeCor: "#AEAEDC",
  },
  "fe-e-trabalho": {
    livroUrl: "/capas/fe-e-trabalho.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "Como Integrar\nFé e Trabalho", subtitulo: "Conectando seu trabalho ao trabalho de Deus",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #2A2010 0%, #5E471C 52%, #B8903A 100%)",
    textoCor: "#FBF5E6", acentoCor: "#E6C84A", preLabelCor: "#D8C088", rodapeCor: "#D8C088",
  },
  "peregrinos-da-eternidade": {
    livroUrl: "/capas/peregrinos-da-eternidade.jpg", preLabel: "A. W. TOZER",
    titulo: "Peregrinos\nda Eternidade", subtitulo: "A busca incansável de Deus pelo homem",
    rodape: "A partir do livro de A. W. Tozer",
    bg: "linear-gradient(135deg, #1A2230 0%, #34465E 52%, #6488A0 100%)",
    textoCor: "#EAF2FB", acentoCor: "#E6C84A", preLabelCor: "#A9C2DC", rodapeCor: "#A9C2DC",
  },
  "o-deus-prodigo": {
    livroUrl: "/capas/o-deus-prodigo.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "O Deus\nPródigo", subtitulo: "Recuperando a essência da fé cristã",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #0C2A3E 0%, #1C5470 52%, #3E96B8 100%)",
    textoCor: "#EAF6FB", acentoCor: "#E6C84A", preLabelCor: "#A9CFE0", rodapeCor: "#A9CFE0",
  },
  "o-profeta-prodigo": {
    livroUrl: "/capas/o-profeta-prodigo.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "O Profeta\nPródigo", subtitulo: "Jonas e o mistério da misericórdia de Deus",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #11283E 0%, #234E70 52%, #4A88B0 100%)",
    textoCor: "#EAF3FB", acentoCor: "#E6B84A", preLabelCor: "#A9C6E0", rodapeCor: "#A9C6E0",
  },
  "encontros-com-jesus": {
    livroUrl: "/capas/encontros-com-jesus.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "Encontros\ncom Jesus", subtitulo: "Respostas inesperadas às grandes perguntas da vida",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #2A1A0E 0%, #5E3A1C 52%, #B8823A 100%)",
    textoCor: "#FBF2E6", acentoCor: "#E6C84A", preLabelCor: "#CDB088", rodapeCor: "#CDB088",
  },
  "o-natal-escondido": {
    livroUrl: "/capas/o-natal-escondido.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "O Natal\nEscondido", subtitulo: "O surpreendente significado de Jesus",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #1A1024 0%, #3A2456 52%, #6E54A0 100%)",
    textoCor: "#F1EAFB", acentoCor: "#E6C84A", preLabelCor: "#BCA9E0", rodapeCor: "#BCA9E0",
  },
  "a-cruz-do-rei": {
    livroUrl: "/capas/a-cruz-do-rei.jpg", preLabel: "TIMOTHY KELLER",
    titulo: "A Cruz\ndo Rei", subtitulo: "O Evangelho de Marcos — a vida de Jesus",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #2A0E10 0%, #5E1C22 52%, #B83A44 100%)",
    textoCor: "#FBEAEC", acentoCor: "#E6C84A", preLabelCor: "#E0A9AE", rodapeCor: "#E0A9AE",
  },
  "presenca-relacional-de-deus": {
    livroUrl: "/capas/presenca-relacional-de-deus.jpg",
    preLabel: "TEOLOGIA BÍBLICA · 3 CAPÍTULOS",
    titulo: "A Presença\nRelacional de Deus",
    subtitulo: "O centro coeso de toda a Escritura — do jardim ao jardim",
    rodape: "A partir do livro de J. Scott Duvall e J. Daniel Hays",
    bg: "linear-gradient(135deg, #2A1606 0%, #5E3A1A 52%, #C2862E 100%)",
    textoCor: "#FBF2E4",
    acentoCor: "#E0A23A",
    preLabelCor: "#CBAE84",
    rodapeCor: "#CBAE84",
  },
  "o-monge-e-o-executivo": {
    livroUrl: "/capas/o-monge-e-o-executivo.jpg",
    preLabel: "LIDERANÇA SERVIDORA · 7 ENCONTROS",
    titulo: "O Monge e\no Executivo",
    subtitulo: "Uma história sobre a essência da liderança",
    rodape: "A partir do livro de James C. Hunter",
    bg: "linear-gradient(135deg, #12262B 0%, #235058 52%, #4E9AA0 100%)",
    textoCor: "#EAF6F7",
    acentoCor: "#D9B26A",
    preLabelCor: "#A6CFD3",
    rodapeCor: "#A6CFD3",
  },
  "comentario-biblico-moody": {
    livroUrl: "/capas/comentario-biblico-moody.jpg",
    preLabel: "REFERÊNCIA · 66 LIVROS DA BÍBLIA",
    titulo: "Comentário\nBíblico Moody",
    subtitulo: "Gênesis a Apocalipse, comentado verso a verso",
    rodape: "Material de referência e consulta",
    bg: "linear-gradient(135deg, #2A2410 0%, #5A4E20 52%, #9A8838 100%)",
    textoCor: "#F6F0E0", acentoCor: "#E6C84A", preLabelCor: "#C8BC88", rodapeCor: "#C8BC88",
  },
  "moises": {
    livroUrl: "/capas/moises.jpg",
    preLabel: "HERÓIS DA FÉ · 15 AULAS",
    titulo: "Moisés",
    subtitulo: "Um homem dedicado e generoso",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #2A2A12 0%, #5A5A2A 52%, #9A9A52 100%)",
    textoCor: "#F6F4E6", acentoCor: "#E6C84A", preLabelCor: "#C8C89A", rodapeCor: "#C8C89A",
  },
  "davi": {
    livroUrl: "/capas/davi.jpg",
    preLabel: "HERÓIS DA FÉ · 25 AULAS",
    titulo: "Davi",
    subtitulo: "Um homem segundo o coração de Deus",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #2A1810 0%, #5A3420 52%, #9A6040 100%)",
    textoCor: "#F6ECE0", acentoCor: "#E0A85A", preLabelCor: "#C8A888", rodapeCor: "#C8A888",
  },
  "elias": {
    livroUrl: "/capas/elias.jpg",
    preLabel: "HERÓIS DA FÉ · 17 AULAS",
    titulo: "Elias",
    subtitulo: "Um homem de heroísmo e humildade",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #2A1C10 0%, #5A3C20 52%, #9A6838 100%)",
    textoCor: "#F6EEE2", acentoCor: "#E6B85A", preLabelCor: "#C8AC88", rodapeCor: "#C8AC88",
  },
  "ester": {
    livroUrl: "/capas/ester.jpg",
    preLabel: "HERÓIS DA FÉ · 14 AULAS",
    titulo: "Ester",
    subtitulo: "Uma mulher de sensibilidade e coragem",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #2A1024 0%, #5A2048 52%, #9A4080 100%)",
    textoCor: "#F6E6F0", acentoCor: "#E6A8D0", preLabelCor: "#C888B0", rodapeCor: "#C888B0",
  },
  "jo": {
    livroUrl: "/capas/jo.jpg",
    preLabel: "HERÓIS DA FÉ · 29 AULAS",
    titulo: "Jó",
    subtitulo: "Um homem de tolerância heróica",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #10242A 0%, #20485A 52%, #40809A 100%)",
    textoCor: "#E6F2F6", acentoCor: "#5AC8E6", preLabelCor: "#88B8C8", rodapeCor: "#88B8C8",
  },
  "vida-de-jesus": {
    livroUrl: "/capas/vida-de-jesus.jpg",
    preLabel: "HERÓIS DA FÉ · 21 AULAS",
    titulo: "Jesus",
    subtitulo: "A maior pessoa que já viveu",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #2A2410 0%, #5A4C20 52%, #9A8440 100%)",
    textoCor: "#F6F2E0", acentoCor: "#E6C84A", preLabelCor: "#C8BC88", rodapeCor: "#C8BC88",
  },
  "paulo": {
    livroUrl: "/capas/paulo.jpg",
    preLabel: "HERÓIS DA FÉ · 23 AULAS",
    titulo: "Paulo",
    subtitulo: "Um homem de coragem e graça",
    rodape: "A partir do livro de Charles R. Swindoll",
    bg: "linear-gradient(135deg, #10242A 0%, #1F4A44 52%, #3E8278 100%)",
    textoCor: "#E6F4F0", acentoCor: "#E6C84A", preLabelCor: "#88C8B8", rodapeCor: "#88C8B8",
  },
  "o-custo-do-discipulado": {
    livroUrl: "/capas/o-custo-do-discipulado.jpg",
    preLabel: "DISCIPULADO · 5 CAPÍTULOS",
    titulo: "O Custo do\nDiscipulado",
    subtitulo: "A doutrina da imitação de Cristo",
    rodape: "A partir do livro de Jonas Madureira",
    bg: "linear-gradient(135deg, #1B2B33 0%, #2E4A52 52%, #4E7C82 100%)",
    textoCor: "#EAF4F5",
    acentoCor: "#E07A4A",
    preLabelCor: "#9FC4C8",
    rodapeCor: "#9FC4C8",
  },
  "os-5-niveis-da-lideranca": {
    livroUrl: "/capas/os-5-niveis-da-lideranca.jpg",
    preLabel: "LIDERANÇA · 38 ETAPAS",
    titulo: "Os 5 Níveis\nda Liderança",
    subtitulo: "Passos comprovados para maximizar seu potencial",
    rodape: "A partir do livro de John C. Maxwell",
    bg: "linear-gradient(135deg, #061B33 0%, #0E3A66 52%, #2E6FB0 100%)",
    textoCor: "#EAF2FB",
    acentoCor: "#E6C84A",
    preLabelCor: "#9FC2E6",
    rodapeCor: "#9FC2E6",
  },
  "garota-que-ora": {
    livroUrl: "/capas/garota-que-ora.jpg",
    preLabel: "VIDA DE ORAÇÃO · 15 CAPÍTULOS",
    titulo: "O Poder da\nGarota que Ora",
    subtitulo: "Conversas com Deus sobre a vida real",
    rodape: "A partir do livro de Stormie Omartian",
    bg: "linear-gradient(135deg, #7A1247 0%, #B0246E 52%, #E05A9A 100%)",
    textoCor: "#FCE9F2",
    acentoCor: "#F2D14A",
    preLabelCor: "#F0A6C8",
    rodapeCor: "#F0A6C8",
  },
  "5-linguagens-do-amor-pratica": {
    livroUrl: "/capas/5-linguagens-do-amor-pratica.jpg",
    preLabel: "RELACIONAMENTOS · 365 LEITURAS",
    titulo: "As 5 Linguagens\ndo Amor na Prática",
    subtitulo: "Um ano de leituras para reflexão e aplicação",
    rodape: "A partir do livro de Gary Chapman",
    bg: "linear-gradient(135deg, #0E3A33 0%, #1F6258 52%, #3E9A8A 100%)",
    textoCor: "#EAF6F2",
    acentoCor: "#E6C84A",
    preLabelCor: "#A6CFC4",
    rodapeCor: "#A6CFC4",
  },
  "mais-que-um-carpinteiro": {
    livroUrl: "/capas/mais-que-um-carpinteiro.jpg",
    preLabel: "APOLOGÉTICA · 13 CAPÍTULOS",
    titulo: "Mais Que\num Carpinteiro",
    subtitulo: "A história deste livro pode mudar a sua história",
    rodape: "A partir do livro de Josh e Sean McDowell",
    bg: "linear-gradient(135deg, #1A0E07 0%, #4A2A14 52%, #9C5A2A 100%)",
    textoCor: "#F6ECE0",
    acentoCor: "#E0A85A",
    preLabelCor: "#D6A878",
    rodapeCor: "#D6A878",
  },
  "o-silencio-de-adao": {
    livroUrl: "/capas/o-silencio-de-adao.jpg",
    preLabel: "MASCULINIDADE · 16 CAPÍTULOS",
    titulo: "O Silêncio\nde Adão",
    subtitulo: "A coragem de homens que falam em vez de se calar",
    rodape: "A partir do livro de Larry Crabb",
    bg: "linear-gradient(135deg, #0E1A12 0%, #1F3A26 52%, #3E6B4A 100%)",
    textoCor: "#EAF6EC",
    acentoCor: "#D9B26A",
    preLabelCor: "#A6CFB0",
    rodapeCor: "#A6CFB0",
  },
  "pregos-bem-fixados": {
    livroUrl: "/capas/pregos-bem-fixados.jpg",
    preLabel: "PREGAÇÃO · 4 MARCAS",
    titulo: "Pregos Bem\nFixados",
    subtitulo: "Descubra seu estilo de pregação",
    rodape: "A partir do livro de Byron Forrest Yawn",
    bg: "linear-gradient(135deg, #0A0A0A 0%, #2A2A2A 52%, #6B6B6B 100%)",
    textoCor: "#F2F2F2",
    acentoCor: "#D9B26A",
    preLabelCor: "#B8B8B8",
    rodapeCor: "#B8B8B8",
  },
  "descubra-seus-dons": {
    livroUrl: "/capas/descubra-seus-dons.jpg",
    preLabel: "DONS ESPIRITUAIS · 9 CAPÍTULOS",
    titulo: "Descubra Seus\nDons Espirituais",
    subtitulo: "O que são, como achar os seus e usá-los",
    rodape: "A partir do livro de C. Peter Wagner",
    bg: "linear-gradient(135deg, #1A1206 0%, #4A3416 52%, #B8862E 100%)",
    textoCor: "#FBF4E6",
    acentoCor: "#E6B84A",
    preLabelCor: "#CBB07A",
    rodapeCor: "#CBB07A",
  },
  "homem-espiritual-vol-1": {
    preLabel: "WATCHMAN NEE · VOLUME 1",
    titulo: "O Homem\nEspiritual",
    subtitulo: "Espírito, alma e corpo · a carne · a alma · o corpo",
    rodape: "Volume 1 — A partir do livro de Watchman Nee",
    bg: "linear-gradient(135deg, #10221E 0%, #1E423A 52%, #4E8C72 100%)",
    textoCor: "#EAF6F1",
    acentoCor: "#D9B26A",
    preLabelCor: "#A6CDBD",
    rodapeCor: "#A6CDBD",
  },
  "homem-espiritual-vol-2": {
    preLabel: "WATCHMAN NEE · VOLUME 2",
    titulo: "O Homem\nEspiritual",
    subtitulo: "O espírito · intuição, comunhão e consciência",
    rodape: "Volume 2 — A partir do livro de Watchman Nee",
    bg: "linear-gradient(135deg, #14201E 0%, #28403C 52%, #5E8C84 100%)",
    textoCor: "#EAF6F4",
    acentoCor: "#D9B26A",
    preLabelCor: "#A6CDC6",
    rodapeCor: "#A6CDC6",
  },
  "homem-espiritual-vol-3": {
    preLabel: "WATCHMAN NEE · VOLUME 3",
    titulo: "O Homem\nEspiritual",
    subtitulo: "A análise da alma · emoção, mente e vontade",
    rodape: "Volume 3 — A partir do livro de Watchman Nee",
    bg: "linear-gradient(135deg, #1E1A12 0%, #423828 52%, #8C7A52 100%)",
    textoCor: "#F6F2EA",
    acentoCor: "#E0C079",
    preLabelCor: "#C9BCA0",
    rodapeCor: "#C9BCA0",
  },
  "graca-transformadora": {
    livroUrl: "/capas/graca-transformadora.jpg",
    preLabel: "ESTUDO · 20 CAPÍTULOS",
    titulo: "Graça\nTransformadora",
    subtitulo: "A graça que tem margens e nos leva à santidade",
    rodape: "A partir do livro de Luciano Subirá",
    bg: "linear-gradient(135deg, #0C1430 0%, #1E2C5A 52%, #C2862F 100%)",
    textoCor: "#EAF0FB",
    acentoCor: "#E6A23A",
    preLabelCor: "#A9B8D8",
    rodapeCor: "#A9B8D8",
  },
  "cartas-diabo-aprendiz": {
    livroUrl: "/capas/cartas-diabo-aprendiz.jpg",
    preLabel: "CLÁSSICO · 31 CARTAS",
    titulo: "Cartas de um Diabo\na seu Aprendiz",
    subtitulo: "A sátira espiritual de C. S. Lewis sobre a tentação",
    rodape: "A partir do livro de C. S. Lewis",
    bg: "linear-gradient(135deg, #1A1606 0%, #3E3410 52%, #B89A1E 100%)",
    textoCor: "#FBF6E4",
    acentoCor: "#E6C84A",
    preLabelCor: "#CBB873",
    rodapeCor: "#CBB873",
  },
  "enigma-biblia-gutenberg": {
    livroUrl: "/capas/enigma-biblia-gutenberg.jpg",
    preLabel: "ROMANCE JUVENIL · 12 CAPÍTULOS",
    titulo: "O Enigma da\nBíblia de Gutenberg",
    subtitulo: "Uma semana de mistério, fé e verdade",
    rodape: "A partir do livro de Maurício Zágari",
    bg: "linear-gradient(135deg, #0C1424 0%, #1E2C4E 52%, #3E5488 100%)",
    textoCor: "#EAF0FB",
    acentoCor: "#E0A85A",
    preLabelCor: "#A9B8D8",
    rodapeCor: "#A9B8D8",
  },
  "garota-segundo-coracao-de-deus": {
    livroUrl: "/capas/garota-segundo-coracao-de-deus.jpg",
    preLabel: "DEVOCIONAL · 11 AULAS",
    titulo: "Uma Garota Segundo\no Coração de Deus",
    subtitulo: "Vivendo uma aventura com Jesus",
    rodape: "A partir do livro de Elizabeth George",
    bg: "linear-gradient(135deg, #0E3A3E 0%, #1E6E72 52%, #46AEA8 100%)",
    textoCor: "#EAFBF8",
    acentoCor: "#F2899A",
    preLabelCor: "#A6D8D2",
    rodapeCor: "#A6D8D2",
  },
  "jornada-180": {
    preLabel: "PLANO · 6 MESES",
    titulo: "Jornada\n180º",
    subtitulo: "A Bíblia toda em seis meses de leitura",
    rodape: "Plano de leitura bíblica",
    bg: "linear-gradient(135deg, #0E2A2E 0%, #1C4E52 52%, #3E8C86 100%)",
    textoCor: "#ECFAF7",
    acentoCor: "#E6C266",
    preLabelCor: "#A6D2CC",
    rodapeCor: "#A6D2CC",
  },
  "construindo-pontes": {
    livroUrl: "/capas/construindo-pontes.jpg",
    preLabel: "ESTUDO · 10 AULAS",
    titulo: "Construindo\nPontes",
    subtitulo: "Aconselhamento bíblico de crianças e adolescentes",
    rodape: "A partir do livro de Julie Lowe",
    bg: "linear-gradient(135deg, #14302E 0%, #245A52 52%, #4FA38E 100%)",
    textoCor: "#ECFAF6",
    acentoCor: "#F0B86A",
    preLabelCor: "#A8D6CB",
    rodapeCor: "#A8D6CB",
  },
  "o-discipulo-radical": {
    livroUrl: "/capas/o-discipulo-radical.jpg",
    preLabel: "LEITURA · 8 MARCAS",
    titulo: "O Discípulo\nRadical",
    subtitulo: "Oito marcas do discipulado integral",
    rodape: "A partir do livro de John Stott",
    bg: "linear-gradient(135deg, #2A1014 0%, #6E1E28 52%, #B23A4A 100%)",
    textoCor: "#FBECEE",
    acentoCor: "#E6BE6A",
    preLabelCor: "#DBA4AC",
    rodapeCor: "#DBA4AC",
  },
  "eu-meu-pavio-curto": {
    livroUrl: "/capas/eu-meu-pavio-curto.jpg",
    preLabel: "LEITURA · 15 AULAS",
    titulo: "Eu, meu pavio\ncurto e Deus",
    subtitulo: "Vencendo a ira pela graça",
    rodape: "A partir do livro de Lisa Bevere",
    bg: "linear-gradient(135deg, #3A1606 0%, #8A3410 52%, #D9742A 100%)",
    textoCor: "#FBEEE2",
    acentoCor: "#F2CD6A",
    preLabelCor: "#E0AE84",
    rodapeCor: "#E0AE84",
  },
  "cristianismo-puro-simples": {
    livroUrl: "/capas/cristianismo-puro-simples.jpg",
    preLabel: "CLÁSSICO · 4 LIVROS",
    titulo: "Cristianismo\nPuro e Simples",
    subtitulo: "A defesa clássica da fé cristã",
    rodape: "A partir do livro de C. S. Lewis",
    bg: "linear-gradient(135deg, #101C36 0%, #1E3A66 52%, #3E68A0 100%)",
    textoCor: "#ECF1FA",
    acentoCor: "#E6C266",
    preLabelCor: "#A6C0DE",
    rodapeCor: "#A6C0DE",
  },
  "problema-do-sofrimento": {
    preLabel: "CLÁSSICO · 10 CAPÍTULOS",
    titulo: "O Problema\ndo Sofrimento",
    subtitulo: "Por que a dor num mundo de um Deus bom?",
    rodape: "A partir do livro de C. S. Lewis",
    bg: "linear-gradient(135deg, #1C1A2E 0%, #34315A 52%, #6A6498 100%)",
    textoCor: "#F1EFFA",
    acentoCor: "#E6C266",
    preLabelCor: "#BCB6D8",
    rodapeCor: "#BCB6D8",
  },
  "os-outros-da-biblia": {
    livroUrl: "/capas/os-outros-da-biblia.jpg",
    preLabel: "ESTUDO · 11 AULAS",
    titulo: "Os Outros\nda Bíblia",
    subtitulo: "História e cultura dos povos antigos",
    rodape: "A partir do livro de André Daniel Reinke",
    bg: "linear-gradient(135deg, #2E1A0E 0%, #6E3E1C 52%, #C2823A 100%)",
    textoCor: "#FBF1E4",
    acentoCor: "#EEC889",
    preLabelCor: "#D9B086",
    rodapeCor: "#D9B086",
  },
  "aqueles-da-biblia": {
    livroUrl: "/capas/aqueles-da-biblia.jpg",
    preLabel: "ESTUDO · 12 AULAS",
    titulo: "Aqueles\nda Bíblia",
    subtitulo: "História, fé e cultura do povo de Israel",
    rodape: "A partir do livro de André Daniel Reinke",
    bg: "linear-gradient(135deg, #12203A 0%, #284A6E 52%, #5A86B0 100%)",
    textoCor: "#ECF2FA",
    acentoCor: "#E6C266",
    preLabelCor: "#A8C2DE",
    rodapeCor: "#A8C2DE",
  },
  "nos-e-a-biblia": {
    livroUrl: "/capas/nos-e-a-biblia.jpg",
    preLabel: "ESTUDO · 16 AULAS",
    titulo: "Nós e\na Bíblia",
    subtitulo: "Bíblia, hermenêutica e identidade",
    rodape: "A partir do livro de André Daniel Reinke",
    bg: "linear-gradient(135deg, #122A24 0%, #21503F 52%, #4E8C6E 100%)",
    textoCor: "#ECFAF3",
    acentoCor: "#E6C266",
    preLabelCor: "#A6CFBC",
    rodapeCor: "#A6CFBC",
  },
  "pregacao-keller": {
    livroUrl: "/capas/pregacao-keller.jpg",
    preLabel: "ESTUDO · 10 AULAS",
    titulo: "Pregação",
    subtitulo: "Comunicando a fé na era do ceticismo",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #14233A 0%, #243E5C 52%, #4E7390 100%)",
    textoCor: "#EDF3FA",
    acentoCor: "#E2B86A",
    preLabelCor: "#A9C3DB",
    rodapeCor: "#A9C3DB",
  },
  "proverbios-para-criancas": {
    livroUrl: "/capas/proverbios-para-criancas.jpg",
    preLabel: "LEITURA · 31 DIAS",
    titulo: "Provérbios\npara Crianças",
    subtitulo: "31 dias de ensinamentos",
    rodape: "A partir do livro de Caiene Cassoli",
    bg: "linear-gradient(135deg, #1F5A66 0%, #2E8C8A 50%, #6FC3A8 100%)",
    textoCor: "#F2FBF8",
    acentoCor: "#FBD86A",
    preLabelCor: "#BFE6DC",
    rodapeCor: "#BFE6DC",
  },
  "herois-da-fe": {
    preLabel: "LEITURA · 20 BIOGRAFIAS",
    titulo: "Heróis\nda Fé",
    subtitulo: "Vinte homens que incendiaram o mundo",
    rodape: "A partir do livro de Orlando Boyer",
    bg: "linear-gradient(135deg, #2B1410 0%, #6E2A1C 52%, #B8842E 100%)",
    textoCor: "#FBF0E6",
    acentoCor: "#F0C66A",
    preLabelCor: "#DBB592",
    rodapeCor: "#DBB592",
  },
  "adoracao-biblica": {
    livroUrl: "/capas/adoracao-biblica.jpg",
    preLabel: "ESTUDO · 11 MESAS",
    titulo: "Adoração\nBíblica",
    subtitulo: "Os fundamentos da verdadeira adoração",
    rodape: "A partir do livro de Russell P. Shedd",
    bg: "linear-gradient(135deg, #1A2238 0%, #2E3A5C 45%, #B8923E 100%)",
    textoCor: "#FBF6EA",
    acentoCor: "#EFE0BC",
    preLabelCor: "#D9C088",
    rodapeCor: "#D9C088",
  },
  "carta-aos-pecadores": {
    livroUrl: "/capas/carta-aos-pecadores.jpg",
    preLabel: "ESTUDO · 11 CARTAS",
    titulo: "Carta aos\nPecadores",
    subtitulo: "Graça e verdade para quem luta",
    rodape: "A partir do livro de Douglas Gonçalves e Saulo Daniel",
    bg: "linear-gradient(135deg, #2A1614 0%, #5E2A24 52%, #B05A42 100%)",
    textoCor: "#FBEEE8",
    acentoCor: "#EEC9A8",
    preLabelCor: "#D9A98C",
    rodapeCor: "#D9A98C",
  },
  "o-cuidado-do-corpo": {
    livroUrl: "/capas/o-cuidado-do-corpo.jpg",
    preLabel: "ESTUDO · 14 MESAS",
    titulo: "O Cuidado\ndo Corpo",
    subtitulo: "Sabedoria bíblica para o bem-estar físico e espiritual",
    rodape: "A partir do livro de Luciano Subirá",
    bg: "linear-gradient(135deg, #15301F 0%, #2C5A3B 52%, #6FA85E 100%)",
    textoCor: "#EEFBEF",
    acentoCor: "#CCEABA",
    preLabelCor: "#9FC891",
    rodapeCor: "#9FC891",
  },
  corajosas: {
    livroUrl: "/capas/corajosas.jpg",
    preLabel: "LEITURA · 4 HISTÓRIAS",
    titulo: "Corajosas",
    subtitulo: "Coragem, identidade e valor aos olhos de Deus",
    rodape: "Ficção cristã — Arlene, Queren, Maria e Thaís",
    bg: "linear-gradient(135deg, #3A1633 0%, #6E2A54 52%, #C97AA0 100%)",
    textoCor: "#FBEEF5",
    acentoCor: "#F0C7DC",
    preLabelCor: "#DCA9C4",
    rodapeCor: "#DCA9C4",
  },
  "ego-transformado-keller": {
    preLabel: "ESTUDO · 4 AULAS",
    titulo: "Ego\nTransformado",
    subtitulo: "Identidade · Humildade · Autoesquecimento",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #3F4A1F 0%, #5B6B2E 60%, #8A9856 100%)",
    textoCor: "#FAF6E8",
    acentoCor: "#E8E4CC",
    preLabelCor: "#D6CFA8",
    rodapeCor: "#D6CFA8",
    livroUrl: "https://m.media-amazon.com/images/I/71Vb4sTcewL.jpg",
  },
  "olhe-para-jesus": {
    preLabel: "ESTUDO · 7 AULAS",
    titulo: "Olhe\npara Jesus",
    subtitulo: "O caminho da transformação",
    rodape: "A partir do livro de Douglas Gonçalves",
    bg: "linear-gradient(135deg, #6B2E1A 0%, #B8542E 50%, #D88A3F 100%)",
    textoCor: "#FFF4E8",
    acentoCor: "#FBE4C2",
    preLabelCor: "#F5D0A4",
    rodapeCor: "#F5D0A4",
    livroUrl: "https://m.media-amazon.com/images/I/51Mqaoc5B8L.jpg",
  },
  biblia: {
    preLabel: "LEITURA · 6 VERSÕES",
    titulo: "Bíblia",
    subtitulo: "ACF · NAA · NVT · NVI · ARA · ARC",
    rodape: "Selecione versículos e gere imagens prontas",
    bg: "linear-gradient(135deg, #E8DCC0 0%, #D4C29A 50%, #B89E72 100%)",
    textoCor: "#3D2F18",
    acentoCor: "#6B5530",
    preLabelCor: "#7A6238",
    rodapeCor: "#6B5530",
  },
  "devocional-anual": {
    preLabel: "12 TEMAS MENSAIS",
    titulo: "Devocional\nAnual",
    subtitulo: "365 dias com Cristo",
    rodape: "Pr. Bruno Fernandes",
    bg: "linear-gradient(135deg, #2E3A18 0%, #4A5A28 35%, #C66B2E 100%)",
    textoCor: "#FFF8EC",
    acentoCor: "#F5E4C0",
    preLabelCor: "#E8D8A8",
    rodapeCor: "#E8D8A8",
    badge: "365",
  },
  "seja-um-lider-de-verdade": {
    preLabel: "LEITURA · 13 CAPÍTULOS",
    titulo: "Seja um\nLíder de\nVerdade",
    subtitulo: "Os princípios da liderança cristã",
    rodape: "A partir do livro de John Haggai",
    bg: "linear-gradient(135deg, #1F2A38 0%, #2E4256 55%, #4A6B7A 100%)",
    textoCor: "#F2F6F8",
    acentoCor: "#CFE0E6",
    preLabelCor: "#A8C4CE",
    rodapeCor: "#A8C4CE",
    livroUrl: "https://m.media-amazon.com/images/I/71hF00oPVYL.jpg",
  },
  "o-desafio-de-todo-lider": {
    preLabel: "ESTUDO · LIDERANÇA CRISTÃ",
    titulo: "O Desafio\nde Todo\nLíder",
    subtitulo: "Da visão à ação",
    rodape: "A partir do livro de Elias Dantas, Ph.D.",
    bg: "linear-gradient(135deg, #241A12 0%, #4A3624 55%, #7E5C34 100%)",
    textoCor: "#F8F1E4",
    acentoCor: "#E9D2A4",
    preLabelCor: "#D4B985",
    rodapeCor: "#D4B985",
    livroUrl: "/capas/o-desafio-de-todo-lider.png",
  },
  "autoridade-espiritual": {
    preLabel: "ESTUDO · 20 CAPÍTULOS",
    titulo: "Autoridade\nEspiritual",
    subtitulo: "Autoridade e submissão",
    rodape: "A partir do livro de Watchman Nee",
    bg: "linear-gradient(135deg, #1C1630 0%, #3A2A50 52%, #6E4A86 100%)",
    textoCor: "#F6F0FA",
    acentoCor: "#E6C98A",
    preLabelCor: "#C9A9D8",
    rodapeCor: "#C9A9D8",
    livroUrl: "https://m.media-amazon.com/images/I/61AohjLEplL.jpg",
  },
  "blueprint-parach": {
    preLabel: "ESTUDO · LIDERANÇA DO REINO",
    titulo: "O Blueprint\nde Parach",
    subtitulo: "Lidere do transbordar, não da exaustão",
    rodape: "A partir do livro de Dr. Richard William",
    bg: "linear-gradient(135deg, #131D10 0%, #2C3B22 50%, #7E7A34 100%)",
    textoCor: "#F7F2E0",
    acentoCor: "#E8C56A",
    preLabelCor: "#CBC07E",
    rodapeCor: "#CBC07E",
    livroUrl: "/capas/blueprint-parach.jpg",
  },
  "igreja-simples": {
    preLabel: "ESTUDO · 9 CAPÍTULOS",
    titulo: "Igreja\nSimples",
    subtitulo: "Retornando ao processo de Deus para fazer discípulos",
    rodape: "A partir do livro de Thom S. Rainer & Eric Geiger",
    bg: "linear-gradient(135deg, #3A2614 0%, #7A5326 48%, #C98F49 100%)",
    textoCor: "#FBF2E0",
    acentoCor: "#E8C079",
    preLabelCor: "#D8B381",
    rodapeCor: "#D8B381",
    livroUrl: "/capas/igreja-simples.jpg",
  },
  contentamento: {
    preLabel: "ESTUDO · 11 CAPÍTULOS",
    titulo: "Contentamento",
    subtitulo: "Aprender a se contentar em toda e qualquer situação",
    rodape: "A partir do livro de Nancy Wilson",
    livroUrl: "/capas/contentamento.png",
    bg: "linear-gradient(135deg, #4A2433 0%, #7E3F54 52%, #C98AA0 100%)",
    textoCor: "#FBEFF2",
    acentoCor: "#E8B65C",
    preLabelCor: "#E6C2CC",
    rodapeCor: "#E6C2CC",
  },
  "discipulado-bonhoeffer": {
    preLabel: "ESTUDO · 15 CAPÍTULOS",
    titulo: "Discipulado",
    subtitulo: "A graça preciosa e o chamado a seguir Jesus",
    rodape: "A partir do livro de Dietrich Bonhoeffer",
    livroUrl: "/capas/discipulado-bonhoeffer.jpg",
    bg: "linear-gradient(135deg, #1C1A19 0%, #3A2320 52%, #7C2F26 100%)",
    textoCor: "#F4ECE4",
    acentoCor: "#C9A24B",
    preLabelCor: "#C9B7A6",
    rodapeCor: "#C9B7A6",
  },
  "oracao-keller": {
    preLabel: "ESTUDO · 15 CAPÍTULOS",
    titulo: "Oração",
    subtitulo: "Experimentando intimidade com Deus",
    rodape: "A partir do livro de Timothy Keller",
    livroUrl: "/capas/oracao-keller.jpg",
    bg: "linear-gradient(135deg, #11203A 0%, #1E3A5F 55%, #3E6FA0 100%)",
    textoCor: "#EAF1FA",
    acentoCor: "#E6B450",
    preLabelCor: "#AEC6E0",
    rodapeCor: "#AEC6E0",
  },
  "cristao-sociedade-nao-crista": {
    preLabel: "ESTUDO · 17 CAPÍTULOS",
    titulo: "O Cristão\nna Sociedade",
    subtitulo: "Posicionar-se biblicamente diante dos desafios de hoje",
    rodape: "A partir do livro de John Stott",
    livroUrl: "/capas/cristao-sociedade-nao-crista.jpg",
    bg: "linear-gradient(135deg, #122420 0%, #1F4039 55%, #3E7A66 100%)",
    textoCor: "#EAF3EE",
    acentoCor: "#E6C27A",
    preLabelCor: "#AFCDBF",
    rodapeCor: "#AFCDBF",
  },
  "cultura-da-honra": {
    preLabel: "ESTUDO · 8 CAPÍTULOS",
    titulo: "Cultura\nda Honra",
    subtitulo: "Vivendo em uma atmosfera sobrenatural",
    rodape: "A partir do livro de Danny Silk",
    livroUrl: "/capas/cultura-da-honra.jpg",
    bg: "linear-gradient(135deg, #2E2208 0%, #5E4715 55%, #A9842F 100%)",
    textoCor: "#FBF4E2",
    acentoCor: "#F2D27A",
    preLabelCor: "#DCC79A",
    rodapeCor: "#DCC79A",
  },
  "jesuscopy": {
    preLabel: "ESTUDO · 8 CAPÍTULOS",
    titulo: "JesusCopy",
    subtitulo: "Tornar-se uma cópia de Jesus",
    rodape: "A partir do livro de Douglas Gonçalves",
    bg: "linear-gradient(135deg, #161616 0%, #2C2C2C 55%, #555555 100%)",
    textoCor: "#F4F4F2",
    acentoCor: "#E0B24A",
    preLabelCor: "#BDBDBD",
    rodapeCor: "#BDBDBD",
    livroUrl: "/capas/jesuscopy.jpg",
  },
  "igreja-com-propositos": {
    preLabel: "ESTUDO · 20 CAPÍTULOS",
    titulo: "Uma Igreja\ncom Propósitos",
    subtitulo: "Edificando a igreja nos cinco propósitos de Deus",
    rodape: "A partir do livro de Rick Warren",
    bg: "linear-gradient(135deg, #14223A 0%, #21456E 55%, #3E80B0 100%)",
    textoCor: "#ECF3FA",
    acentoCor: "#E2B24A",
    preLabelCor: "#AECBE4",
    rodapeCor: "#AECBE4",
    livroUrl: "/capas/igreja-com-propositos.jpg",
  },
  "trelica-videira": {
    preLabel: "ESTUDO · 12 CAPÍTULOS",
    titulo: "A Treliça\ne a Videira",
    subtitulo: "A mentalidade de discipulado que muda tudo",
    rodape: "A partir do livro de Colin Marshall & Tony Payne",
    bg: "linear-gradient(135deg, #1E2B16 0%, #3C5226 55%, #6E8B3D 100%)",
    textoCor: "#F1F5E8",
    acentoCor: "#D9B24A",
    preLabelCor: "#C3D29E",
    rodapeCor: "#C3D29E",
    livroUrl: "/capas/trelica-videira.jpg",
  },
  "discipulado-contemplacao": {
    preLabel: "ESTUDO · 26 CAPÍTULOS",
    titulo: "Discipulado\ncomeça com\nContemplação",
    subtitulo: "Tornar-se como Jesus ao contemplá-Lo",
    rodape: "A partir do livro de Samuel Whitefield",
    bg: "linear-gradient(135deg, #5A0E10 0%, #8E1B1C 52%, #C0392B 100%)",
    textoCor: "#FCEFE6",
    acentoCor: "#F2B24C",
    preLabelCor: "#F0C9A0",
    rodapeCor: "#F0C9A0",
    livroUrl: "/capas/discipulado-contemplacao.jpg",
  },
  "lideranca-com-propositos": {
    preLabel: "ESTUDO · LIDERANÇA BÍBLICA",
    titulo: "Liderança\ncom\nPropósitos",
    subtitulo: "Princípios eficazes para o líder no século XXI",
    rodape: "A partir do livro de Rick Warren",
    bg: "linear-gradient(135deg, #2A1B0E 0%, #5A3E22 55%, #A07C46 100%)",
    textoCor: "#FAF3E6",
    acentoCor: "#E6C27A",
    preLabelCor: "#D4B585",
    rodapeCor: "#D4B585",
    livroUrl: "/capas/lideranca-com-propositos.jpg",
  },
  "campo-batalha-mente": {
    preLabel: "ESTUDO · 25 CAPÍTULOS",
    titulo: "Campo de\nBatalha\nda Mente",
    subtitulo: "Vencendo a batalha em sua mente",
    rodape: "A partir do livro de Joyce Meyer",
    bg: "linear-gradient(135deg, #0B1A2E 0%, #14365C 55%, #2E6BA0 100%)",
    textoCor: "#F0F5FB",
    acentoCor: "#E6B450",
    preLabelCor: "#AEC6E0",
    rodapeCor: "#AEC6E0",
    livroUrl: "/capas/campo-batalha-mente.jpg",
  },
};

let cachedCormorantBold: ArrayBuffer | undefined;
let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedInterItalic: ArrayBuffer | undefined;

async function loadFonts(origin: string) {
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(`${origin}/fonts/cormorant-bold.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(
      `${origin}/fonts/cormorant-italic.ttf`,
    ).then((r) => r.arrayBuffer());
  }
  if (!cachedInterItalic) {
    cachedInterItalic = await fetch(`${origin}/fonts/inter-italic.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  return {
    cormorantBold: cachedCormorantBold!,
    cormorantItalic: cachedCormorantItalic!,
    interItalic: cachedInterItalic!,
  };
}

export async function GET(
  req: NextRequest,
  context: { params: Promise<{ slug: string }> },
) {
  const { slug } = await context.params;
  const config = CAPAS[slug];
  if (!config) {
    return new Response(`capa não definida para slug "${slug}"`, {
      status: 404,
    });
  }

  const origin = new URL(req.url).origin;
  const fonts = await loadFonts(origin);

  const fontList = [
    { name: "Cormorant", data: fonts.cormorantBold, weight: 700 as const, style: "normal" as const },
    { name: "Cormorant", data: fonts.cormorantItalic, weight: 400 as const, style: "italic" as const },
    { name: "Inter", data: fonts.interItalic, weight: 400 as const, style: "italic" as const },
  ];

  const temLivro = !!config.livroUrl;
  // Capas locais (em /public) começam com "/"; precisam do origin pro Satori buscar.
  const capaSrc = config.livroUrl
    ? config.livroUrl.startsWith("/")
      ? `${origin}${config.livroUrl}`
      : config.livroUrl
    : undefined;

  // Formato retrato (3:4) — card padronizado pros cursos. Layout vertical com a
  // mesma moldura/identidade. Quando há capa de livro, ela aparece centralizada
  // e do mesmo tamanho em todos (object-contain + sombra), sobre o gradiente da
  // marca; quando não há (ex.: Bíblia, Devocional), usa a tipografia.
  if (new URL(req.url).searchParams.get("formato") === "retrato") {
    const pw = 900;
    const ph = 1200;
    if (temLivro) {
      // Capa real do livro: preenche o card inteiro (object-cover), limpa,
      // sem texto sobreposto — a própria arte já traz título e autor. Uma
      // borda interna sutil e um leve escurecimento nas pontas dão acabamento.
      return new ImageResponse(
        (
          <div
            style={{
              width: pw,
              height: ph,
              display: "flex",
              background: config.bg,
              position: "relative",
            }}
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={capaSrc!}
              alt=""
              width={pw}
              height={ph}
              style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: pw,
                height: ph,
                objectFit: "cover",
              }}
            />
            {/* vinheta sutil pra dar profundidade e fechar as bordas */}
            <div
              style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: pw,
                height: ph,
                display: "flex",
                background:
                  "radial-gradient(130% 100% at 50% 38%, rgba(0,0,0,0) 58%, rgba(0,0,0,0.34) 100%)",
              }}
            />
            {/* moldura interna discreta */}
            <div
              style={{
                position: "absolute",
                top: 26,
                left: 26,
                right: 26,
                bottom: 26,
                border: "1px solid rgba(255,255,255,0.16)",
                display: "flex",
              }}
            />
          </div>
        ),
        {
          width: pw,
          height: ph,
          fonts: fontList,
          headers: { "Cache-Control": "public, max-age=31536000, immutable" },
        },
      );
    }
    // Capa tipográfica (sem foto): template editorial — moldura dupla, inicial
    // gigante em marca-d'água, brilho suave e bloco de título centralizado.
    const inicial = (config.titulo.replace(/\n/g, " ").match(/[A-Za-zÀ-ÿ]/) || [
      "A",
    ])[0].toUpperCase();
    return new ImageResponse(
      (
        <div
          style={{
            width: pw,
            height: ph,
            display: "flex",
            flexDirection: "column",
            justifyContent: "space-between",
            background: config.bg,
            fontFamily: "Cormorant",
            position: "relative",
            padding: "94px 78px",
          }}
        >
          {/* brilho suave no topo (profundidade) */}
          <div
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              width: pw,
              height: ph,
              display: "flex",
              background:
                "radial-gradient(115% 80% at 22% 10%, rgba(255,255,255,0.12) 0%, rgba(255,255,255,0) 46%)",
            }}
          />
          {/* escurecimento inferior */}
          <div
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              width: pw,
              height: ph,
              display: "flex",
              background:
                "linear-gradient(to top, rgba(0,0,0,0.34) 0%, rgba(0,0,0,0) 42%)",
            }}
          />
          {/* inicial em marca-d'água */}
          <div
            style={{
              position: "absolute",
              right: -56,
              bottom: -210,
              fontFamily: "Cormorant",
              fontStyle: "italic",
              fontSize: 760,
              lineHeight: 1,
              color: config.acentoCor,
              opacity: 0.09,
              display: "flex",
            }}
          >
            {inicial}
          </div>
          {/* moldura dupla */}
          <div
            style={{
              position: "absolute",
              top: 30,
              left: 30,
              right: 30,
              bottom: 30,
              border: `1px solid ${config.acentoCor}`,
              opacity: 0.3,
              display: "flex",
            }}
          />
          <div
            style={{
              position: "absolute",
              top: 38,
              left: 38,
              right: 38,
              bottom: 38,
              border: `1px solid ${config.acentoCor}`,
              opacity: 0.14,
              display: "flex",
            }}
          />

          {/* topo: pré-label */}
          <div
            style={{
              position: "relative",
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 22,
              letterSpacing: "0.32em",
              color: config.preLabelCor,
              textTransform: "uppercase",
              display: "flex",
            }}
          >
            {config.preLabel}
          </div>

          {/* meio: título + régua + subtítulo */}
          <div
            style={{ position: "relative", display: "flex", flexDirection: "column" }}
          >
            <div
              style={{
                fontFamily: "Cormorant",
                fontWeight: 700,
                fontSize: 140,
                lineHeight: 0.95,
                color: config.textoCor,
                letterSpacing: "-0.02em",
                whiteSpace: "pre-wrap",
                display: "flex",
              }}
            >
              {config.titulo}
            </div>
            <div
              style={{
                display: "flex",
                width: 88,
                height: 4,
                background: config.acentoCor,
                marginTop: 32,
                marginBottom: 26,
              }}
            />
            <div
              style={{
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: 42,
                lineHeight: 1.15,
                color: config.acentoCor,
                maxWidth: 660,
                display: "flex",
              }}
            >
              {config.subtitulo}
            </div>
          </div>

          {/* rodapé */}
          <div
            style={{
              position: "relative",
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 23,
              letterSpacing: "0.06em",
              color: config.rodapeCor,
              display: "flex",
            }}
          >
            {config.rodape}
          </div>
        </div>
      ),
      {
        width: pw,
        height: ph,
        fonts: fontList,
        headers: { "Cache-Control": "public, max-age=31536000, immutable" },
      },
    );
  }

  const w = 1600;
  const h = 900;

  const layoutLivro = !!config.livroUrl;
  // Capas locais (em /public) começam com "/"; precisam do origin pro Satori buscar.
  const livroSrc = config.livroUrl
    ? config.livroUrl.startsWith("/")
      ? `${origin}${config.livroUrl}`
      : config.livroUrl
    : undefined;

  return new ImageResponse(
    (
      <div
        style={{
          width: w,
          height: h,
          display: "flex",
          flexDirection: "row",
          background: config.bg,
          fontFamily: "Cormorant",
          position: "relative",
        }}
      >
        {/* Moldura sutil */}
        <div
          style={{
            position: "absolute",
            top: 36,
            left: 36,
            right: 36,
            bottom: 36,
            border: `1px solid ${config.acentoCor}`,
            opacity: 0.25,
            display: "flex",
          }}
        />

        {/* Badge "365" se houver */}
        {config.badge && (
          <div
            style={{
              position: "absolute",
              top: 90,
              right: 130,
              fontFamily: "Cormorant",
              fontStyle: "italic",
              fontSize: 280,
              color: config.acentoCor,
              opacity: 0.18,
              lineHeight: 1,
              display: "flex",
            }}
          >
            {config.badge}
          </div>
        )}

        {/* Coluna da capa do livro (só quando livroUrl) */}
        {layoutLivro && (
          <div
            style={{
              width: 560,
              height: "100%",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              padding: "90px 20px 90px 90px",
            }}
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={livroSrc!}
              alt=""
              width={460}
              height={690}
              style={{
                maxWidth: 460,
                maxHeight: 690,
                objectFit: "contain",
                boxShadow: "0 30px 60px rgba(0,0,0,0.45)",
                borderRadius: 6,
              }}
            />
          </div>
        )}

        {/* Coluna de texto */}
        <div
          style={{
            flex: 1,
            display: "flex",
            flexDirection: "column",
            padding: layoutLivro ? "90px 90px 90px 40px" : "90px",
          }}
        >
          {/* Pré-label */}
          <div
            style={{
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 24,
              letterSpacing: "0.32em",
              color: config.preLabelCor,
              textTransform: "uppercase",
              display: "flex",
            }}
          >
            {config.preLabel}
          </div>

          {/* Espaçador flex */}
          <div style={{ display: "flex", flex: 1 }} />

          {/* Título */}
          <div
            style={{
              fontFamily: "Cormorant",
              fontWeight: 700,
              fontSize: layoutLivro ? 132 : 168,
              lineHeight: 0.94,
              color: config.textoCor,
              letterSpacing: "-0.02em",
              display: "flex",
              whiteSpace: "pre-wrap",
              marginBottom: 32,
            }}
          >
            {config.titulo}
          </div>

          {/* Divisor + subtítulo */}
          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: 24,
              marginBottom: 16,
            }}
          >
            <div
              style={{
                width: 80,
                height: 3,
                background: config.acentoCor,
                display: "flex",
              }}
            />
            <div
              style={{
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: layoutLivro ? 34 : 40,
                color: config.acentoCor,
                display: "flex",
              }}
            >
              {config.subtitulo}
            </div>
          </div>

          {/* Rodapé */}
          <div
            style={{
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 22,
              letterSpacing: "0.06em",
              color: config.rodapeCor,
              display: "flex",
              marginTop: 12,
            }}
          >
            {config.rodape}
          </div>
        </div>
      </div>
    ),
    {
      width: w,
      height: h,
      fonts: [
        {
          name: "Cormorant",
          data: fonts.cormorantBold,
          weight: 700,
          style: "normal",
        },
        {
          name: "Cormorant",
          data: fonts.cormorantItalic,
          weight: 400,
          style: "italic",
        },
        {
          name: "Inter",
          data: fonts.interItalic,
          weight: 400,
          style: "italic",
        },
      ],
      headers: {
        "Cache-Control": "public, max-age=31536000, immutable",
      },
    },
  );
}
