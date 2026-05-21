import type { Config } from "tailwindcss";

export default {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        // ==================== PALETA EKBALLO · QUENTE ====================
        // Bege creme-mel — fundos, textos, neutros (era "mesa")
        // Mais quente: vai do creme manteiga ao chocolate quente
        bege: {
          50: "#FDF8EC",   // creme manteiga
          100: "#FAEED4",  // mel claro
          200: "#F4DBA8",  // mel
          300: "#EBC279",  // âmbar quente
          400: "#D9A04C",  // caramelo
          500: "#B57E2F",  // tostado
          600: "#8C5C20",  // caramelo profundo
          700: "#5E3D17",  // chocolate quente
          800: "#3D2710",  // marrom profundo
          900: "#221608",  // quase preto quente
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
        // Oliveira salva quente — natureza, vida, secundário
        // Verde com sub-tom de mostarda/khaki, sem o frio do azul
        oliveira: {
          50: "#F4F3E2",
          100: "#E4E1B5",
          200: "#CDC783",
          300: "#B0A654",
          400: "#928731",
          500: "#766B22",
          600: "#615821",   // signature warm olive
          700: "#46411A",
          800: "#2D2A12",
          900: "#161408",
        },
        // Alias mesa → bege (compatibilidade)
        mesa: {
          50: "#FDF8EC",
          100: "#FAEED4",
          200: "#F4DBA8",
          300: "#EBC279",
          400: "#D9A04C",
          500: "#B57E2F",
          600: "#8C5C20",
          700: "#5E3D17",
          800: "#3D2710",
          900: "#221608",
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
