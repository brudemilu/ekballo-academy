import type { Metadata } from "next";
import { displayEnglish, uiEnglish } from "@/app/fonts/ekballo";

export const metadata: Metadata = {
  title: "Ekballo English",
  description: "Um curso premium de inglês cristão com foco em fala, fé, propósito e progresso diário.",
};

// As fontes ficam presas ao /english de propósito. A plataforma de leitura
// segue em Georgia + fonte do sistema: são dois produtos com temperamentos
// diferentes — um pede contemplação, o outro pede cinco minutos agora.
export default function EnglishLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className={`${displayEnglish.variable} ${uiEnglish.variable} font-ui`}>
      {children}
    </div>
  );
}
