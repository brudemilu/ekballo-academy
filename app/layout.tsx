import type { Metadata, Viewport } from "next";
import { MockBanner } from "@/components/MockBanner";
import { WhatsAppFloat } from "@/components/WhatsAppFloat";
import { RegisterSW } from "@/components/RegisterSW";
import "./globals.css";

export const metadata: Metadata = {
  title: "Ekballo Academy — Famílias fortes. Discípulos maduros.",
  description:
    "Mais que encontros. Uma transformação. Na mesa somos formados pelo Espírito, somos enviados.",
  applicationName: "Ekballo Academy",
  manifest: "/manifest.json",
  appleWebApp: {
    capable: true,
    title: "Ekballo Academy",
    statusBarStyle: "default",
  },
  icons: {
    icon: [
      { url: "/favicon-32.png", sizes: "32x32", type: "image/png" },
      { url: "/icon-192.png", sizes: "192x192", type: "image/png" },
      { url: "/icon-512.png", sizes: "512x512", type: "image/png" },
    ],
    apple: [{ url: "/apple-icon.png", sizes: "180x180", type: "image/png" }],
  },
  openGraph: {
    title: "Ekballo Academy",
    description:
      "Famílias fortes. Discípulos maduros. Mais que encontros. Uma transformação.",
    type: "website",
  },
};

export const viewport: Viewport = {
  themeColor: "#5E3D17",
  width: "device-width",
  initialScale: 1,
  maximumScale: 5,
  // Permite zoom — não bloqueia acessibilidade
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR">
      <body className="bg-bege-50 text-bege-900 antialiased">
        <RegisterSW />
        <MockBanner />
        {children}
        <WhatsAppFloat />
      </body>
    </html>
  );
}
