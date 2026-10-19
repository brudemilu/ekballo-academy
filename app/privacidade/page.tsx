import type { Metadata } from "next";
import { PaginaLegal } from "@/components/PaginaLegal";

export const metadata: Metadata = {
  title: "Política de Privacidade · Ekballo Academy",
};

// Exigida pelo TikTok para cadastrar o aplicativo (issue #273), e devida a
// quem se cadastra na plataforma de qualquer forma.

export default function Privacidade() {
  return (
    <PaginaLegal
      rotulo="Privacidade"
      titulo="Política de Privacidade"
      atualizada="19 de outubro de 2026"
    >
      <p>
        A Ekballo Academy é uma plataforma de discipulado e leitura. Esta página explica
        quais dados guardamos, para que servem e como você pode pedir que sejam
        apagados.
      </p>

      <h2>O que guardamos de quem se cadastra</h2>
      <p>
        Nome, e-mail de acesso, telefone (quando informado), a turma, as reflexões que
        você escreve nas mesas, o seu progresso nas leituras e as anotações do seu
        caderno. As anotações são privadas: só você as vê, a menos que escolha
        compartilhá-las com o líder.
      </p>
      <p>
        Usamos esses dados apenas para o funcionamento da plataforma: dar acesso às
        leituras, permitir a devolutiva pastoral sobre as suas reflexões e enviar avisos
        pelo WhatsApp. Não vendemos nem cedemos dados a ninguém, e não usamos os dados
        para publicidade.
      </p>

      <h2>Contas de redes sociais conectadas</h2>
      <p>
        A equipe que administra a plataforma pode conectar as próprias contas de
        Instagram e TikTok ao painel administrativo, para publicar os conteúdos do
        ministério. Nesse caso guardamos somente o necessário para publicar: o
        identificador da conta, o nome público e as chaves de acesso que a própria rede
        fornece. As chaves ficam no servidor, protegidas, e nunca aparecem em nenhuma
        tela.
      </p>
      <p>
        Do TikTok, usamos apenas o nome e a foto do perfil (para mostrar qual conta está
        conectada) e a permissão de enviar vídeos. Não lemos seguidores, mensagens nem
        dados de outras pessoas. A conexão pode ser desfeita a qualquer momento pelo
        botão &quot;desconectar&quot; no painel ou nas configurações do próprio TikTok;
        ao desconectar, as chaves são apagadas.
      </p>

      <h2>Onde os dados ficam</h2>
      <p>
        Em servidor próprio da plataforma, com acesso restrito à equipe responsável. Os
        dados de quem se cadastra só são lidos por quem precisa deles para o
        acompanhamento pastoral.
      </p>

      <h2>Seus direitos</h2>
      <p>
        Você pode pedir a qualquer momento uma cópia dos seus dados, a correção do que
        estiver errado ou a exclusão da sua conta e de tudo o que está ligado a ela,
        conforme a Lei Geral de Proteção de Dados (LGPD). Basta falar com a liderança do
        ministério pelos canais de atendimento habituais.
      </p>
    </PaginaLegal>
  );
}
