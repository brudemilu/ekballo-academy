import type { Metadata } from "next";
import { PaginaLegal } from "@/components/PaginaLegal";

export const metadata: Metadata = { title: "Termos de Uso · Ekballo Academy" };

// Exigida pelo TikTok para cadastrar o aplicativo (issue #273).

export default function Termos() {
  return (
    <PaginaLegal
      rotulo="Termos"
      titulo="Termos de Uso"
      atualizada="19 de outubro de 2026"
    >
      <p>
        A Ekballo Academy é uma plataforma de discipulado e leitura mantida pelo
        ministério Ekballo. Ao se cadastrar e usar a plataforma, você concorda com estes
        termos.
      </p>

      <h2>O que a plataforma oferece</h2>
      <p>
        Leituras organizadas em mesas de discipulado, espaço para escrever reflexões,
        devolutiva pastoral, caderno de anotações pessoal e avisos pelo WhatsApp. O
        acesso é liberado pela liderança do ministério.
      </p>

      <h2>O que esperamos de quem usa</h2>
      <p>
        Usar a plataforma para o propósito dela: ler, refletir e crescer em comunidade.
        Não publicar conteúdo ofensivo, ilegal ou que exponha outras pessoas, e não
        compartilhar o seu acesso com terceiros.
      </p>

      <h2>Conteúdo</h2>
      <p>
        Os textos das leituras pertencem aos seus autores e editoras e são
        disponibilizados para uso de estudo dentro da plataforma. As reflexões e
        anotações que você escreve continuam sendo suas.
      </p>

      <h2>Publicação em redes sociais</h2>
      <p>
        O painel administrativo permite à equipe do ministério publicar conteúdos nas
        próprias contas de Instagram e TikTok. Essas publicações seguem também os termos
        de cada rede, e só acontecem nas contas que a própria equipe conectou e pode
        desconectar a qualquer momento.
      </p>

      <h2>Alterações</h2>
      <p>
        Estes termos podem ser atualizados. A data no alto da página mostra a versão em
        vigor. Dúvidas podem ser levadas à liderança do ministério pelos canais de
        atendimento habituais. A forma como tratamos os seus dados está na{" "}
        <a href="/privacidade">Política de Privacidade</a>.
      </p>
    </PaginaLegal>
  );
}
