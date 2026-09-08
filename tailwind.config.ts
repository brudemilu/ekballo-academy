import type { Config } from "tailwindcss";

export default {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        // ============ PALETA EKBALLO · TERRACOTA + CINZA QUENTE ============
        // Neutro = CINZA QUENTE (greige): fundos, textos, bordas, superfícies.
        // Mantém o nome "bege" por compatibilidade (era creme-mel; agora greige).
        // Sub-tom levemente quente (R>G>B) pra casar com o terracota, sem frieza.
        // Neutro = greige quente, agora MAIS CLARO e limpo (fundos luminosos,
        // menos "abafado"). Sub-tom quente pra casar com o coral.
        bege: {
          50: "#FBFAF8",   // fundo de página (greige bem claro/limpo)
          100: "#F3F0EB",  // superfície / banda
          200: "#E6E1D9",  // borda suave
          300: "#D2CCC2",  // borda forte / divisor
          400: "#A9A299",  // ícones / muted
          500: "#7E786F",  // texto secundário
          600: "#635E56",  // texto suave
          700: "#48433E",  // texto secundário forte
          800: "#262320",  // títulos / texto forte
          900: "#16130F",  // quase-preto quente
        },
        // Coral / terracota VIBRANTE — primary, CTA, energia.
        // Saturado e luminoso ("mais vivo"), sem virar neon.
        laranja: {
          50: "#FFF2EC",
          100: "#FFDECF",
          200: "#FFBB9C",
          300: "#FF9165",
          400: "#FF6E3A",
          500: "#FF5A2C",  // coral signature (CTA)
          600: "#E84310",
          700: "#B4320C",
          800: "#7C2208",
          900: "#3F1103",
        },
        // Oliveira — antes verde-oliva (secundário). Na paleta laranja+cinza o
        // verde sai de cena: colapsado no MESMO cinza quente do "bege". Mantido
        // como alias só por compatibilidade com classes oliveira-* existentes.
        oliveira: {
          50: "#FBFAF8",
          100: "#F3F0EB",
          200: "#E6E1D9",
          300: "#D2CCC2",
          400: "#A9A299",
          500: "#7E786F",
          600: "#635E56",
          700: "#48433E",
          800: "#262320",
          900: "#16130F",
        },
        // ---- Feedback do English ----
        // Precisavam existir: o "acerto" usava oliveira-600, e a paleta
        // colapsou oliveira em cinza — ou seja, acertar pintava a tela de
        // cinza. E o erro não podia usar o coral, que é o botão principal:
        // errado e "clique aqui" na mesma cor confunde.
        acerto: {
          50: "#EAF3EE",
          200: "#B9D7C6",
          500: "#2F6B4F",
          600: "#255840",
          700: "#1B4230",
        },
        erro: {
          50: "#FDECEA",
          200: "#F5C2BC",
          500: "#B3261E",
          600: "#8F1E17",
        },
        // Alias mesa → bege (compatibilidade) — mesmo greige quente claro
        mesa: {
          50: "#FBFAF8",
          100: "#F3F0EB",
          200: "#E6E1D9",
          300: "#D2CCC2",
          400: "#A9A299",
          500: "#7E786F",
          600: "#635E56",
          700: "#48433E",
          800: "#262320",
          900: "#16130F",
        },
      },
      fontFamily: {
        serif: ["Georgia", "ui-serif", "serif"],
        sans: ["-apple-system", "BlinkMacSystemFont", "Inter", "Segoe UI", "system-ui", "sans-serif"],
        // Só no English (ver app/fonts/ekballo.ts). O resto da plataforma
        // continua em Georgia + fonte do sistema, de propósito: são dois
        // produtos com temperamentos diferentes.
        display: ["var(--fonte-display)", "Georgia", "serif"],
        ui: ["var(--fonte-ui)", "-apple-system", "sans-serif"],
      },
      transitionTimingFunction: {
        // A curva assinatura do projeto (expo-out): sai rápido, assenta macio.
        saida: "cubic-bezier(0.22, 1, 0.36, 1)",
        // Saída de tela: acelera e some — o inverso da entrada.
        entrada: "cubic-bezier(0.4, 0, 1, 1)",
        // Mudança pequena de estado (cor, opacidade, borda).
        suave: "cubic-bezier(0.4, 0, 0.2, 1)",
      },
      transitionDuration: {
        // Escala nomeada. Elemento maior se move mais devagar — é hierarquia,
        // não inconsistência. Ver o bloco MOVIMENTO em globals.css.
        instantaneo: "120ms",
        rapido: "200ms",
        padrao: "320ms",
        lento: "520ms",
        cena: "900ms",
      },
      animation: {
        "fade-up": "fade-up 0.7s cubic-bezier(0.22, 1, 0.36, 1) forwards",
        "fade-in": "fade-in 0.8s ease-out forwards",
        "scale-in": "scale-in 0.5s cubic-bezier(0.22, 1, 0.36, 1) forwards",
        "marquee": "marquee 40s linear infinite",
        "pulse-soft": "pulse-soft 2.4s cubic-bezier(0.4, 0, 0.6, 1) infinite",
        "float-slow": "float 6s ease-in-out infinite",
        "shimmer": "shimmer 3s linear infinite",
        // ---- MOVIMENTO DE INTERFACE (ver globals.css para a escala) ----
        // Entradas de conteúdo. Curva de saída: começa rápido e assenta.
        "surgir": "surgir var(--dur-padrao) var(--ease-saida) forwards",
        "surgir-baixo": "surgir-baixo var(--dur-padrao) var(--ease-saida) forwards",
        // Modal/diálogo: o painel cresce de 96%, o véu só esmaece.
        "modal-entra": "modal-entra var(--dur-padrao) var(--ease-saida) forwards",
        "modal-sai": "modal-sai var(--dur-rapido) var(--ease-entrada) forwards",
        "veu-entra": "fade-in var(--dur-rapido) ease-out forwards",
        // Folha que sobe do rodapé — é como o celular espera abrir painel.
        "folha-sobe": "folha-sobe var(--dur-padrao) var(--ease-saida) forwards",
        // Aviso/toast entrando pelo canto.
        "aviso-entra": "aviso-entra var(--dur-padrao) var(--ease-saida) forwards",
        // Esqueleto de carregamento: respiração lenta, nunca pisca.
        "esqueleto": "esqueleto 1.6s var(--ease-suave) infinite",
        "esqueleto-brilho": "esqueleto-brilho 1.8s linear infinite",
        // Indicador de progresso indeterminado (barra que percorre).
        "percorre": "percorre 1.1s var(--ease-suave) infinite",
      },
      keyframes: {
        "fade-up": {
          "0%": { opacity: "0", transform: "translateY(24px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        "fade-in": {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        "scale-in": {
          "0%": { opacity: "0", transform: "scale(0.96)" },
          "100%": { opacity: "1", transform: "scale(1)" },
        },
        "marquee": {
          "0%": { transform: "translateX(0)" },
          "100%": { transform: "translateX(-50%)" },
        },
        "pulse-soft": {
          "0%, 100%": { transform: "scale(1)", opacity: "1" },
          "50%": { transform: "scale(1.05)", opacity: "0.92" },
        },
        "float": {
          "0%, 100%": { transform: "translateY(0)" },
          "50%": { transform: "translateY(-12px)" },
        },
        "shimmer": {
          "0%": { backgroundPosition: "-200% 0" },
          "100%": { backgroundPosition: "200% 0" },
        },
        // ---- MOVIMENTO DE INTERFACE ----
        // Deslocamentos curtos de propósito: 8-12px lê como "chegou",
        // 30px lê como "voou", que cansa quando acontece a cada navegação.
        "surgir": {
          "0%": { opacity: "0", transform: "translateY(8px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        "surgir-baixo": {
          "0%": { opacity: "0", transform: "translateY(-8px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        "modal-entra": {
          "0%": { opacity: "0", transform: "scale(0.96) translateY(8px)" },
          "100%": { opacity: "1", transform: "scale(1) translateY(0)" },
        },
        "modal-sai": {
          "0%": { opacity: "1", transform: "scale(1)" },
          "100%": { opacity: "0", transform: "scale(0.97)" },
        },
        "folha-sobe": {
          "0%": { transform: "translateY(100%)" },
          "100%": { transform: "translateY(0)" },
        },
        "aviso-entra": {
          "0%": { opacity: "0", transform: "translateY(12px) scale(0.98)" },
          "100%": { opacity: "1", transform: "translateY(0) scale(1)" },
        },
        "esqueleto": {
          "0%, 100%": { opacity: "1" },
          "50%": { opacity: "0.45" },
        },
        "esqueleto-brilho": {
          "0%": { transform: "translateX(-100%)" },
          "100%": { transform: "translateX(100%)" },
        },
        "percorre": {
          "0%": { transform: "translateX(-100%)" },
          "100%": { transform: "translateX(400%)" },
        },
      },
    },
  },
  plugins: [],
} satisfies Config;
