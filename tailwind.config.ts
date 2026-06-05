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
        bege: {
          50: "#F6F5F3",   // fundo de página (greige clarinho)
          100: "#ECEAE7",  // superfície / banda
          200: "#DAD6D0",  // borda suave
          300: "#C6C1B9",  // borda forte / divisor
          400: "#A8A29A",  // ícones / muted
          500: "#837E75",  // texto secundário
          600: "#6B6660",  // texto suave
          700: "#4E4A45",  // texto secundário forte
          800: "#2A2724",  // títulos / texto forte
          900: "#1A1815",  // quase-preto quente
        },
        // Laranja terracota / pôr-do-sol — primary, CTA, energia
        // Mais profundo, mais saturado, sensação de barro queimado
        laranja: {
          50: "#FDF1E6",
          100: "#FBDDC0",
          200: "#F7BC91",
          300: "#F0935D",
          400: "#E76E2E",
          500: "#D55416",  // terracota signature
          600: "#B43E0E",
          700: "#88300B",
          800: "#5C2008",
          900: "#341204",
        },
        // Oliveira — antes verde-oliva (secundário). Na paleta laranja+cinza o
        // verde sai de cena: colapsado no MESMO cinza quente do "bege". Mantido
        // como alias só por compatibilidade com classes oliveira-* existentes.
        oliveira: {
          50: "#F6F5F3",
          100: "#ECEAE7",
          200: "#DAD6D0",
          300: "#C6C1B9",
          400: "#A8A29A",
          500: "#837E75",
          600: "#6B6660",
          700: "#4E4A45",
          800: "#2A2724",
          900: "#1A1815",
        },
        // Alias mesa → bege (compatibilidade) — mesmo cinza quente
        mesa: {
          50: "#F6F5F3",
          100: "#ECEAE7",
          200: "#DAD6D0",
          300: "#C6C1B9",
          400: "#A8A29A",
          500: "#837E75",
          600: "#6B6660",
          700: "#4E4A45",
          800: "#2A2724",
          900: "#1A1815",
        },
      },
      fontFamily: {
        serif: ["Georgia", "ui-serif", "serif"],
        sans: ["-apple-system", "BlinkMacSystemFont", "Inter", "Segoe UI", "system-ui", "sans-serif"],
      },
      animation: {
        "fade-up": "fade-up 0.7s cubic-bezier(0.22, 1, 0.36, 1) forwards",
        "fade-in": "fade-in 0.8s ease-out forwards",
        "scale-in": "scale-in 0.5s cubic-bezier(0.22, 1, 0.36, 1) forwards",
        "marquee": "marquee 40s linear infinite",
        "pulse-soft": "pulse-soft 2.4s cubic-bezier(0.4, 0, 0.6, 1) infinite",
        "float-slow": "float 6s ease-in-out infinite",
        "shimmer": "shimmer 3s linear infinite",
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
      },
    },
  },
  plugins: [],
} satisfies Config;
