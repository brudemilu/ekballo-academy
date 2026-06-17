// Mapa slug -> capa do livro (imagem em retrato).
// Usado pelos cards de curso para mostrar a capa real do livro, em vez da
// imagem OG 16:9. Mantém em sincronia com os `livroUrl` de
// app/api/og/curso/[slug]/route.tsx.
export const CAPA_LIVRO: Record<string, string> = {
  "ego-transformado-keller": "https://m.media-amazon.com/images/I/71Vb4sTcewL.jpg",
  "olhe-para-jesus": "https://m.media-amazon.com/images/I/51Mqaoc5B8L.jpg",
  "seja-um-lider-de-verdade": "https://m.media-amazon.com/images/I/71hF00oPVYL.jpg",
  "o-desafio-de-todo-lider": "/capas/o-desafio-de-todo-lider.png",
  "autoridade-espiritual": "https://m.media-amazon.com/images/I/61AohjLEplL.jpg",
  "blueprint-parach": "/capas/blueprint-parach.jpg",
  "igreja-simples": "/capas/igreja-simples.jpg",
  "contentamento": "/capas/contentamento.png",
  "discipulado-bonhoeffer": "/capas/discipulado-bonhoeffer.jpg",
  "oracao-keller": "/capas/oracao-keller.jpg",
  "cristao-sociedade-nao-crista": "/capas/cristao-sociedade-nao-crista.jpg",
  "cultura-da-honra": "/capas/cultura-da-honra.jpg",
  "discipulado-contemplacao": "/capas/discipulado-contemplacao.jpg",
  "lideranca-com-propositos": "/capas/lideranca-com-propositos.jpg",
  "campo-batalha-mente": "/capas/campo-batalha-mente.jpg",
  "trelica-videira": "/capas/trelica-videira.jpg",
  "igreja-com-propositos": "/capas/igreja-com-propositos.jpg",
  "jesuscopy": "/capas/jesuscopy.jpg",
};
