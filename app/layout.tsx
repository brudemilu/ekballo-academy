import type { Metadata } from "next";
import { MockBanner } from "@/components/MockBanner";
import { WhatsAppFloat } from "@/components/WhatsAppFloat";
import "./globals.css";

export const metadata: Metadata = {
  title: "Ekballo Academy — Famílias fortes. Discípulos maduros.",
  description:
    "Mais que encontros. Uma transformação. Na mesa somos formados pelo Espírito, somos enviados.",
  openGraph: {
    title: "Ekballo Academy",
    description:
      "Famílias fortes. Discípulos maduros. Mais que encontros. Uma transformação.",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR">
      <body className="bg-bege-50 text-bege-900 antialiased">
        <MockBanner />
        {children}
        <WhatsAppFloat />
      </body>
    </html>
  );
}
