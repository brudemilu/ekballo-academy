import type { ReactNode } from "react";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { Logo } from "@/components/Logo";
import { getCurrentSession } from "@/lib/db";

export const metadata = { title: "Marca — Ekballo Academy" };

// Paleta extraída da própria logo (components/Logo.tsx + public/icon.svg).
const CORES: { hex: string; nome: string; uso: string }[] = [
  { hex: "#D55416", nome: "Terracota", uso: "Cor de destaque — o traço do círculo e do telhado." },
  { hex: "#5E3D17", nome: "Marrom", uso: "Enraizamento — a linha de base e o texto do ícone." },
  { hex: "#F0C997", nome: "Bege", uso: "Fundo quente (base do gradiente do ícone)." },
  { hex: "#FBDDC0", nome: "Bege claro", uso: "Fundo quente (topo do gradiente) e a variante clara." },
  { hex: "#2A2724", nome: "Greige-800", uso: "Texto forte “Ekballo”." },
  { hex: "#837E75", nome: "Greige-500", uso: "Texto suave “Academy”." },
];

function Secao({ titulo, children }: { titulo: string; children: ReactNode }) {
  return (
    <section className="mb-8 rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">{titulo}</h2>
      {children}
    </section>
  );
}

export default async function MarcaPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  return (
    <AdminShell current="marca" session={session}>
      <div className="mb-8">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Identidade visual
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">A marca Ekballo</h1>
        <p className="mt-2 max-w-2xl text-mesa-600">
          Referência interna: como a logo foi construída, o que cada elemento significa
          e a origem do nome. Tudo aqui é feito em código (SVG), então é fiel e escalável.
        </p>
      </div>

      {/* Logo ao vivo */}
      <Secao titulo="A logo">
        <div className="grid gap-4 sm:grid-cols-3">
          <div className="flex items-center justify-center rounded-xl border border-mesa-200 bg-white p-8">
            <Logo />
          </div>
          <div className="flex items-center justify-center rounded-xl border border-mesa-700 bg-mesa-800 p-8">
            <Logo variant="light" />
          </div>
          <div className="flex items-center justify-center rounded-xl border border-mesa-200 bg-mesa-50 p-8">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/icon.svg" alt="Ícone do app Ekballo" width={104} height={104} className="rounded-2xl" />
          </div>
        </div>
        <p className="mt-3 text-center text-xs text-mesa-500">
          Versão padrão · versão clara (para fundo escuro) · ícone do app (PWA / favicon)
        </p>
      </Secao>

      {/* O nome */}
      <Secao titulo="O nome — Ekballo">
        <p className="text-justify leading-relaxed text-mesa-700 hyphens-auto">
          <strong>Ekballo</strong> vem do grego <em>ἐκβάλλω</em> (<em>ekballō</em>), que significa
          “lançar para fora”, “enviar”, “impelir”. É o verbo que aparece nas palavras de Jesus em
          <strong> Mateus 9:38</strong>: “Rogai, pois, ao Senhor da seara que <em>envie</em> (ekballō)
          trabalhadores para a sua seara.” Não é um envio morno: a palavra carrega força e direção —
          alguém sendo <em>lançado</em> com propósito para a colheita.
        </p>
        <p className="mt-3 text-justify leading-relaxed text-mesa-700 hyphens-auto">
          Por isso o nome traduz bem a missão do ministério: formar e <em>enviar</em> discípulos
          maduros — não espectadores, mas pessoas inflamadas e mandadas para o mundo. “Academy”
          reforça o lado de formação: um lugar onde se aprende para depois ser enviado.
        </p>
      </Secao>

      {/* O símbolo */}
      <Secao titulo="O símbolo">
        <p className="mb-4 text-justify leading-relaxed text-mesa-700 hyphens-auto">
          São três traços simples dentro de um círculo, que juntos formam uma <strong>casa dentro de
          uma comunidade</strong>:
        </p>
        <ul className="space-y-2 text-mesa-700">
          <li className="flex gap-2">
            <span aria-hidden>○</span>
            <span><strong>Círculo</strong> — unidade, comunidade e aliança; algo contínuo, sem fim.</span>
          </li>
          <li className="flex gap-2">
            <span aria-hidden>△</span>
            <span><strong>Triângulo / telhado</strong> — um teto apontando para cima (abrigo e elevação).</span>
          </li>
          <li className="flex gap-2">
            <span aria-hidden>—</span>
            <span><strong>Linha de base</strong> — o chão da casa: firmeza e enraizamento.</span>
          </li>
        </ul>
        <p className="mt-4 text-justify leading-relaxed text-mesa-700 hyphens-auto">
          Telhado + base formam um <strong>lar</strong>; o lar dentro do círculo diz “família forte
          dentro da comunidade” — exatamente o lema <em>“Famílias fortes. Discípulos maduros.”</em> O
          teto subindo também ecoa o sentido de <em>Ekballo</em>: movimento para fora e para o alto.
        </p>
      </Secao>

      {/* As cores */}
      <Secao titulo="As cores">
        <div className="grid gap-3 sm:grid-cols-2">
          {CORES.map((c) => (
            <div key={c.hex} className="flex items-center gap-3 rounded-xl border border-mesa-200 p-3">
              <span
                className="h-12 w-12 flex-none rounded-lg border border-black/10"
                style={{ backgroundColor: c.hex }}
              />
              <div className="min-w-0">
                <p className="font-medium text-mesa-800">
                  {c.nome} <span className="font-mono text-xs text-mesa-500">{c.hex}</span>
                </p>
                <p className="text-sm text-mesa-600">{c.uso}</p>
              </div>
            </div>
          ))}
        </div>
        <p className="mt-4 text-justify leading-relaxed text-mesa-700 hyphens-auto">
          A paleta é quente e terrosa de propósito: terracota e bege remetem a barro e terra
          (acolhimento, simplicidade), e o marrom dá peso e raiz. Nada gritante — uma marca calma,
          enraizada e confiável.
        </p>
      </Secao>

      {/* A tipografia */}
      <Secao titulo="A tipografia">
        <p className="text-justify leading-relaxed text-mesa-700 hyphens-auto">
          A fonte é <strong>serifada</strong> (clássica, com cara de livro e de Palavra), passando
          confiança. “Ekballo” aparece em destaque, com peso forte e leve espaçamento; “Academy” vai
          menor, em caixa alta e bem espaçado — aquele ar refinado e sóbrio.
        </p>
      </Secao>
    </AdminShell>
  );
}
