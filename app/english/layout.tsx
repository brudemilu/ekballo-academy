import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Ekballo English",
  description: "Um curso premium de inglês cristão com foco em fala, fé, propósito e progresso diário.",
};

export default function EnglishLayout({ children }: { children: React.ReactNode }) {
  return <>{children}</>;
}
