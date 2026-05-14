import type { Metadata } from "next";
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
      <body className="bg-mesa-50 text-mesa-900 antialiased">
        {children}
      </body>
    </html>
  );
}
