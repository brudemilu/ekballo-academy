-- 295_perspectivas_mcclung.sql
-- McClung (cap. 30), "Paixão apostólica" — a décima leitura da Lição 4, que
-- ficou de fora na migration 294 porque faltava a p. 210, a abertura do
-- capítulo. Com ela a Lição 4 fecha em 14 de 14.
--
-- PROCEDÊNCIA da p. 210: FOTO (HEIC, ~334 DPI), não scan. A foto tem
-- perspectiva — as linhas correm tortas e a página curva —, e o OCR degradava
-- do meio para baixo, devolvendo 2.916 caracteres de uma página de ~4.000.
-- Por isso esta página foi TRANSCRITA À MÃO a partir da imagem, que está
-- nítida a olho. As p. 211-213 vêm do OCR do PDF escaneado, como as demais.
--
-- A emenda entre as duas fontes foi conferida: a p. 210 termina em "precisa de
-- ajuda para" e a p. 211 continua em "descobrir como cultivar essa paixão".
--
-- McClung entra na ordem 32, entre Anthony e Glasser, que é onde o guia o chama.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 32;
  update aulas set ordem = ordem - 1000 + 1 where curso_id = cid and ordem >= 1000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — McClung, cap. 30: Paixão apostólica', 'Floyd McClung

FLOYD MCCLUNG é diretor da All Nations, uma rede internacional de plantação de igrejas e treinamento de liderança. Trabalhou como diretor internacional da JOCUM durante muitos anos. Floyd hoje é líder de uma comunidade de evangelismo e treinamento na África do Sul, a qual atua entre os pobres e não alcançados da região. Ele é autor de 14 livros, entre eles O imensurável amor de Deus (São Paulo: Vida, 2006) e Living on the Devil''s Doorstep [Vida na soleira do Diabo].

O que é paixão apostólica? O termo “paixão” pode ser usado para descrever tudo, desde um romance até as sensações mais agudas de fome. Não sei o que significa para você, mas para mim paixão significa tudo que uma pessoa se dispõe a sofrer por alguma coisa. Na verdade, esse é o significado presente na raiz da palavra, que vem do latim pasere, “sofrer”. Significa algo pelo qual ansiamos tanto que estamos dispostos a sacrificar qualquer coisa para alcançá-lo. A palavra “apóstolo” significa “enviado”, “mensageiro”. “Paixão apostólica”, portanto, é a escolha intencional e deliberada de viver para adorar a Jesus entre as nações. Implica estar comprometido até a morte com a disseminação de sua glória. É a qualidade daqueles que sentem um amor ardente por Jesus, que sonham ver toda a terra coberta com a glória do Senhor.

Consigo perceber quando a paixão apostólica morre em meu coração. Isso acontece quando não passo meu momento de devoção sonhando com o tempo em que Jesus será adorado em línguas que ainda não são ouvidas no céu. Sei que falta paixão em minha vida quando canto sobre o céu, mas vivo como se meu lar fosse aqui na terra. A paixão apostólica morre em meu coração quando sonho mais sobre esportes, brinquedos, lugares que ainda não visitei e pessoas que ainda não conheci que com as nações adorando a Jesus.

Também perco a paixão quando tomo decisões com base no perigo envolvido, e não na glória que Deus receberá. Os que têm paixão apostólica planejam ir, mas estão dispostos a ficar. Você sabe que tem essa paixão se fica profundamente decepcionado quando Deus não o chama para deixar sua casa e aventurar-se entre os que nunca ouviram o nome dele. Se você não sofrer e não se sacrificar por alguma coisa, então não tem paixão por ela. Se você diz que fará algo por Jesus, mas não sofre por ele, então não tem paixão por ele nem por seus propósitos na terra.

Como se faz para obter a “paixão apostólica”? É como pedir uma pizza, com a garantia de que ela chegará à sua casa em 30 minutos? É por meio de uma linha 0800? Ou melhor, pode-se enviar uma doação de 15 reais em troca de receber em domicílio um pouco dessa paixão? Se você é como eu, precisa de ajuda para Floyd McClung descobrir como cultivar essa paixão. Sinto-me motivado quando leio como o apóstolo Paulo a adquiriu. Ele, na verdade, a escolheu.

Paulo diz, em Romanos 15, que sua ambição ou paixão, se preferir era tornar Cristo conhecido. Para ele, esse desejo começou com uma revelação de Jesus que ele cultivou por toda a vida. Paulo não se encontrou com Cristo apenas no caminho de Damasco: continuou a se encontrar com ele todos os dias. Essa revelação de Jesus e o estudo dos propósitos de Deus trouxeram à luz a paixão apostólica de Paulo. Conhecer a Jesus e torná-lo conhecido consumiu toda a vida do apóstolo. Ele se gloriava em Cristo Jesus, no seu serviço para Deus (v. 17). Em comparação com isso, todo o resto era esterco, lixo, refugo repugnante. À ambição de Paulo nascia da compreensão de que Deus anseia ver seu Filho glorificado entre as nações. Ela era direcionada a tornar “agradável à oferta dos gentios, santificada pelo Espírito Santo” (v. 16).

O entusiasmo humano não pode sustentar a paixão apostólica. Quando Deus investe a paixão dele mesmo o desejo de ver seu nome glorificado entre todos os povos em você, é preciso cultivar o que Deus lhe dá. Quatro coisas o ajudarão; 1. Desprendimento apostólico Muitos querem os frutos do ministério de Paulo sem, contudo, pagar o preço que o apóstolo pagou, Ele morreu. Ele morreu para tudo. Ele morria diariamente, Ele foi crucificado com Cristo, Esse homem genioso e obstinado sabia que precisava morrer para o próprio eu. Sabia que, em sua carne, não poderia gerar a revelação de Jesus nem sustentar o coração de Cristo. Então ele morreu, Ele abandonou sua vida. Ele abandonou a si próprio.

Vivemos num mundo de paixões conflitantes, Se não morrermos para nós mesmos e enehermos nossa vida com a ardente paixão pela adoração a Deus entre as nações, acabaremos cultivando outras paixões, É possível enganar à nós mesmos, pensando que temos paixões

À bíblicas quando, na verdade, tudo que fizemos foi batizar os valores de nossa cultura e darlhes nomes cristãos, Teremos escolhido a paixão apostólica apenas quando nosso coração estiver cheio do desejo de Deus, que é ver seu Filho adorado entre as nações,

Posso incentivá-lo, caro amigo, a renunciar sua vida? Desafio você a fazer esta oração: “Senhor, seja implacável comigo, revelando minha ambição egoísta e minha falta de disposição em morrer para mim mesmo”, Garanto-lhe que ele não tardará a responder à sua oração, 2. Foco apostólico O maior inimigo da ambição de ver Jesus adorado entre as nações é a falta de foco. Você pode correr de lá para cá, gastando energia em bons ministérios, sem dar sequer um passo em direção às nações, Não tenho nada contra os projetos e ministérios que existem por aí, pois são servos de Deus que os realizam, e não questiono a obediência deles a Deus. Todavia, a Igreja tem um chamado apostólico, uma missão apostólica. Deus nos chamou para irmos às nações. Precisamos nos concentrar nisso, ou estaremos desobedecendo ao Senhor,

Concentrar-se no quê? Creio que Deus quer para si mesmo um povo, Atividade sem o desejo de que Deus tenha para si um povo é apenas atividade, e não missões, Você pode ter evangelismo sem missões. Ministérios de curto prazo são ótimos, contanto que se concentrem em formar obreiros para plantar igrejas. Talvez você diga: “Não tenho chamado para plantar igrejas”. Tem, sim! É sempre a vontade de Deus ter pessoas que adorem seu Filho em todas as nações, Você não precisa se preocupar com a possibilidade de entristecer a Deus se tentar plantar uma igreja. Parece loucura o fato de as pessoas caírem na ilusão de que precisam de um chamado especial para salvar almas, discipular pessoas e reuni-las para amar à Jesus. Seja qual for o ministério que exerça, você precisa entender uma coisa: plantar igrejas não é para nós, é para Deus, Nós o fazemos para que Deus tenha um povo que o adore!

Há alguns anos, um aluno de uma escola bíblica nos pedidos dos profetas e nas súplicas choro-Depois de fazer isso, volte, e talvez eu pense e quando sem ter uma revelação da glória de

O: 3. Oração apostólica ofereceu-se para ajudas David Wilkerson, que munistrava nas ruas da cidade de Nova York Wilkerson perguntou-lhe quanto tempo ele costumava passar em oração. O jovem aluno estimou 20 minutos por dia. Wilkerson disselhe: “Volte daqui a um mês e ore duas horas por dia, todos os dias, durante esses 30 dias. na possibilidade de soltá-lo nestas ruas cheias de assassinato, estupro, violência e perigo. Se eu o enviar agora, com seus 20 minutos por dia, estaria enviando um soldado à batalha sem arma alguma, e você seria morto”.

Você pode ir para o céu sem muita oração. Você pode ter um momento de devoção deum munuto todos os dias, e Deus ainda o amará, mas você não ouvirá a frase:“Muito bem, servo bom e fiel” conversando com Deus apenas um minuto por dia. Não sobreviverá com esse tipo de oração nos lugares dificeis em que Jesus não é conhecido nem adorado. Eis um desafio para você: leia tudo que Paulo escreveu sobre oração e depois pergunte: “Estou disposto a orar assim?”. Paulo afirmou orar “noite e dia",“com lágrimas”, “sem cessar”, “com ações de graças”, a “no Espírito”, “com intrepidez”, por “tristeza segundo Deus”, contra “o Maligno”. 4. Determinação apostólica Se você vive sem a visão da glória de Deus aencher a terra, você corre o perigo de servir apenas a sonhos próprios de grandeza, esperando a próxima grande obra que Deus lhe der para fazer. Há um número grande de cristão supernutridos e submotivados, escondidos sob a desculpa de que Deus não falou com eles. Estão esperando ouvir vozes ou ter sonhos tudo isso enquanto vivem para ganhar dinheiro, economizar para o futuro, vestir-se bem e se divertir.

O apóstolo Paulo era guiado pela paixão. Atos 20 e 21 relata sua determinação em seguir para Jerusalém, apesar da expectativa de e da veemente reprovação dos amigos. Por que

wa

Paixão apostóica Paulo iria contra a própria intuição, sem falar sas de seus amigos mais chegados? Ele tinha uma revelação de maior prioridade, de maior motivação: a glória de Deus.

À determinação apostólica começa com a paixão pela glória de Deus entre as nações, e dai a pergunta: “Onde o servirei?”. A maioria dos cristãos faz o contrário. Eles perguntam onde Deus entre as nações. Não é à toa que nunca ouvem Deus dizer: “Vá!”. Eles não cultivaram a paixão pelas paixões de Deus. Desejos inferiores os mantêm cativos. Talvez jamais percebam isso.

Entregue seus dons, vocações e talentos ao Senhor. Aproxime-se de Deus. Fique na presença de Deus até ansiar agir em nome dele. Permaneça ali e nutra o desejo de ver a terra encharcada de louvor a Deus. Só então você poderá confiar em seu coração se ouvir Deus dizer: “Fique”. Apenas os que anseiam difundir a glória do Senhor entre as nações têm o direito de ficar.

Se você tem paixão apostólica, então é uma das pessoas mais perigosas da terra. O mundo não governa mais seu coração. Você não é mais seduzido por ganhos pessoais, e sim dedicado a disseminar a glória de Deus entre as nações. Você pações deste mundo. Você não teme a perda. Até ousa crer que pode receber o privilégio de morrer por espalhar a fama do Senhor pela terra. As paixões do Pai tornam-se paixões suas também. Você encontra satisfação e significado nele e crê que ele está sempre com você, até o fim da vida. Você se rendeu a Deus evive para o Cordeiro. Satanás o teme, e os anjos aplaudem você.

Seu maior sonho é que o nome de Jesus seja louvado em línguas jamais ouvidas no céu. Sua recompensa será o olhar de puro deleite que espera ver nos olhos dele quando você depositar aos seus pés a justa recompensa pelo sofrimento

Você terá, então, a paixão apostólica!

Poyd MeCung vo EDER USE ICT III DS TIO ADIAR OA ARA DTIMETTSASPRDAI PI Ire regue,

Perguntas para estudo da maneira em que a palavra “paixão” é normalmente usada? 2. McClung sugere que todos são chamados para plantar igrejas entre todos os povos, Estaria com isso dizendo que todos precisam fazer um esforço para ser missionários? Ou está dizendo que o desejo de Deus por glória exige que todo crente faça tudo que puder para a glória do Senhor? Quala relação entre paixão e disposição para sofrer?', 32
from cursos where slug = 'perspectivas';

commit;
