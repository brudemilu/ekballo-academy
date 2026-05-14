import type { Config } from "tailwindcss";

export default {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        // Paleta Ekballo
        mesa: {
          50: "#FBF8F2",
          100: "#F7F2E8",
          200: "#EDE2C9",
          300: "#D9C49A",
          400: "#C8A876",
          500: "#A88556",
          600: "#85643F",
          700: "#5C3A2E",
          800: "#3E2820",
          900: "#231510",
        },
        oliveira: {
          50: "#F2F5F0",
          100: "#E0E8DC",
          200: "#BFCDB7",
          300: "#94AC89",
          400: "#6E8C62",
          500: "#506B45",
          600: "#3E5C3A",
          700: "#2F4530",
          800: "#1F2E22",
          900: "#121A14",
        },
      },
      fontFamily: {
        serif: ["Georgia", "ui-serif", "serif"],
        sans: ["-apple-system", "BlinkMacSystemFont", "Inter", "Segoe UI", "system-ui", "sans-serif"],
      },
      animation: {
        "fade-up": "fade-up 0.6s ease-out",
        "fade-in": "fade-in 0.8s ease-out",
      },
      keyframes: {
        "fade-up": {
          "0%": { opacity: "0", transform: "translateY(16px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        "fade-in": {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
      },
    },
  },
  plugins: [],
} satisfies Config;
