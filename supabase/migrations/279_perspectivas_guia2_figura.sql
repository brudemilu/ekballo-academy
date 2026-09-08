-- 279_perspectivas_guia2_figura.sql
-- O guia da Lição 2 traz uma linha do tempo (2000 a.C. a Cristo, com caixas de
-- referências bíblicas) que a extração achatava em três faixas de texto
-- ilegíveis — os rótulos de uma linha do diagrama saíam emendados uns nos
-- outros, fora de qualquer ordem de leitura. Passa a ser figura, recortada do
-- próprio PDF, como já se fez com a linha do tempo da Lição 1.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  update aulas set conteudo = $conteudo$A maioria de nós estuda a Bíblia abordando uma história de cada vez. Lições geralmente são aplicadas unicamente às nossas questões pessoais. Por causa disso, pode ser que pensemos, erradamente, que a Bíblia seja uma coleção de histórias desconectadas entre si, sem nenhum propósito maior e integrador. Além disso, ainda podemos estar errados — de um modo bastante egoísta — em pensar que a Bíblia só diz respeito às nossas vidas pessoais. A realidade é que ela diz muito mais sobre Deus do que sobre nós mesmos. Com Deus no centro, a Bíblia pode ser entendida como uma só grande narrativa e não como uma coleção de histórias desunidas e de afirmações antigas. É uma história que percorre cada parte das Escrituras — e ainda está se desdobrando até hoje.

Esta história abrangente da Bíblia é sobre aquilo que Deus começou e um dia completará. Quando observamos Deus agindo ao longo da Bíblia, nos deparamos com Sua paixão zelosa. Cristo quer que participemos dessa paixão para entrarmos em Sua missão.

Um renomado líder de missões disse uma vez: “Deixe meu coração ser partido pelas coisas que partem o coração de Deus”. Mais adiante no curso, exploraremos as coisas que entristecem o coração de Deus. Neste momento, começaremos com o que faz o coração de Deus “vibrar”. Vamos deixar que nossos corações primeiramente se alegrem com as coisas que alegram o coração do Senhor. Então, quando nossos corações estiverem alinhados com os desejos do coração de Deus, teremos nossos corações também partidos com aquilo que parte o coração de Deus.

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Explicar como toda a história da Bíblia se desdobra para o propósito da glória de Deus de se manifestar em uma adoração global.

2. Entender a adoração como um ato relacional em que Deus se revela e que tanto agrada a Deus quanto demonstra o Seu amor pelas pessoas.

3. Explicar a história da Bíblia em que Deus revela Sua glória às nações para receber glória delas.

4. Demonstrar a ligação entre vários eventos principais da história da Bíblia e o tema central do plano divino; receber glória global através da adoração dos povos.

5. Reconhecer o propósito missionário encontrado na oração do “Pai Nosso”.

6. Explicar o significado da frase: “As missões existem, porque não há adoração”.

7. Explicar como Deus sempre usou tanto uma força expansiva quanto uma força atrativa para avançar o Seu propósito missionário.

NO NÍVEL AVANÇADO:

8. Compreender como Jesus envia Seus seguidores em missões, da mesma maneira que o Pai o enviou em missão.

9. Entender que nossa motivação principal na missão é a esperança de que Deus seja amado e adorado entre todos os povos.

10. Dar alguns exemplos bíblicos de como Deus envolve o Seu povo em Sua missão, revelando-a a ele.

11. Explicar como a compaixão pelas necessidades das pessoas pode ser integrada à paixão pela glória de Deus.

Palavra chave:

[cite] PAIXÃO Paixão é dedicação àquilo que é realmente digno. Aqueles que se dedicam àquilo que é o mais digno – a glória de Deus – vivem com um desprendimento cheio de alegria. Os seus corações se satisfazem com o desejo de ver Jesus sendo fervorosamente adorado. Esse amor vem a dominar e integrar todos os demais desejos, de modo que vivam na liberdade de um propósito singular.

1. A HISTÓRIA DA SUA GLÓRIA

A história da Bíblia é mais sobre Deus do que sobre pessoas. Para verificarmos como essas histórias formam uma única e contínua história, precisaremos de um novo entendimento de três termos bíblicos:

Glória: valor intrínseco, substância, brilho e beleza.

O Nome de Deus: além da função de referência e revelação, expressa a reputação pública de Deus.

Adoração: aquilo que glorifica a Deus por reconhecer a Sua glória e por honrá-lo com as ofertas de louvor das nações. Adoração não somente satisfaz e revela a Deus, mas também expressa Seu amor pelos povos, pois os leva ao lugar de maior honra diante dEle.

[cite] Leia Hawthorne (cap. 4, p. 41-43): A História da Sua Glória, até a seção “Adoração”.

As duas direções da glória de Deus. Em toda a Bíblia, o propósito da missão de Deus pode ser visto em duas direções: Deus revela Sua glória a todos os povos para receber glória de todos os povos.

Evangelização mundial é a expressão mais completa que Deus utiliza para revelar Sua glória às nações. O propósito da evangelização mundial é que Deus receba glória das nações.

[cite] Continue lendo Hawthorne: A História da Sua Glória até a seção “A Bíblia como a História de Deus”.

A. Abraão: Um Povo para o Seu nome

Abraão inicia a história glorificando abertamente o nome de Deus. A sua vida nos oferece uma previsão da história que seguiria a família da fé: ele fez o nome de Deus conhecido em adoração. Deus engrandeceu o Seu nome através do Seu grande poder redentor. O resultado foi um evento de adoração multinacional dirigido pela figura messiânica de Melquisedeque. Abraão foi abençoado para abençoar — com um propósito maior — para que as nações adorassem o próprio Deus em gratidão.

[cite] Seguindo os três primeiros exemplos, descreva a reputação que Deus procura, preenchendo os espaços da última coluna do exercício abaixo. Procure os versículos em sua Bíblia.

[cite] A fama de Deus entre as nações O nome de Deus: O fama de Deus: Função: Referência (Palavras Função: Reputação (A expressão pública da usadas para se referir a Deus) fama mundial de Deus)

Melquisedeque - Gênesis 14. 1-20 Na presença de Abraão, o rei do Gênesis 14.20: “... que entregou os seus “Deus altíssimo” adversários nas suas mãos”. sodoma e outros reis

Jetro - Êxodo 18.7 - 12 Êxodo 18.11: “Agora sei que o SENHOR é “O Senhor” (Yahweh) Depois da liberação do Egito maior que todos os deuses”.

Os Gibeonitas - Josué 9. 3-10 Josué 9. 9-10: “... Por causa da fama do Cananeus que fingiram ser um povo “O SENHOR o seu Deus” Senhor, o seu Deus. Pois ouvimos falar dele, que veio de uma terra distante e que de tudo o que fez no Egito”. ouviu o nome de Deus

Moisés - Éxodo 33.15 - 34.8 No sinal, Êxodo 34. 6-7: (Escreva o que Deus prodepois que Deus disse que passaria por “O SENHOR Deus“ clamou ser seu nome (Dica: São os dois Moisés e proclamaria Seu nome versículos inteiros).

Números 14.14: O que as nações tinham Moisés - Números 14. 1-21 ouvido. Depois que Deus disse que Ele Números 14. 15-16: O que as nações condestruiria o povo Moisés orou, com “O SENHOR“ cluíriam se Deus destruísse o povo. argumentos baseados no nome de Números 14. 17-18: O que Moisés entendia Deus ser a vontade de Deus a respeito da Sua reputação entre as nações

Jonas - Jonas 3.4 - 4.2 Jonas 4.2: A verdade sobre Deus que Jonas não “Deus” (Elohim) Compare com Moisés acima: quis divulgar para uma nação gentia.

Malaquias 1.14: Malaquias - Malaquias 1.11-14 ”pois eu sou um grande ______________ Deus descreve como a adoração que é e o meu __________________________ é “O Senhor dos exércitos“ pura e de todo o coração revela a Sua (ou deve ser) _______________________ glória real. entre as __________________”.

B. A Grande Revelação:

Deus revela o Seu nome às nações no Êxodo. O estabelecimento do povo de Israel na terra e a abertura do templo deixaram Seu propósito ainda mais claro.

O Êxodo: O momento crucial em que Deus revela a Si mesmo mundialmente, distinguindo e honrando Seu nome acima de qualquer outro deus.

A Conquista: A maneira que Deus estabeleceu a pureza da adoração a Ele mesmo.

O Templo: A maneira que Deus sinalizou que pessoas de todas as nações poderiam encontrá-lo e adorá-lo pessoalmente.

[cite] Continue lendo Hawthorne (cap. 4, p. 43-47): A História da Sua Glória, até a seção “As nações percebem”.

C. O Grande Adiamento:

Justamente quando parecia que Israel ia fazer conhecido o nome de Deus entre as nações, Salomão abriu caminho para a idolatria. A idolatria profanou, ou tornou comum, o nome da reputação internacional que Deus tinha santificado, ou exaltado, à vista das nações. Então, seguiram-se séculos de altos e baixos na luta contra a idolatria. Deus finalmente retirou o povo da terra e o enviou às nações em um período de cativeiro conhecido como o Exílio.

D. A Persistência de Deus e a Promessa Renovada

Deus nunca desistiu de Sua promessa e de Seu propósito originais. O povo foi trazido de volta à terra, o templo foi reconstruído e o Messias ainda era esperado. A palavra de Deus é clara sobre essa restauração; era tudo para o cumprimento do Seu propósito global. Muitas outras expressões dos salmistas e profetas esclarecem o propósito de Deus de ser adorado.

E. A Glória de Deus em Cristo

Jesus Cristo cumpriu o propósito de revelar a glória de Deus ao mundo para receber glória das nações. Podemos verificar isto em dois aspectos:

Orações pelo Nome. Através da oração que ensinou e das orações que orou, podemos ver como Jesus conduziu toda a Sua vida com a finalidade de cumprir o propósito primeiro de fazer o nome de Deus conhecido em todo o mundo. “Santificado seja o Seu nome” significa que este nome é para ser distinguido, exaltado e honrado. Nenhuma oração poderia ser mais fundamental para o propósito missionário de Deus.

Uma casa de adoração de todos os povos. O texto em Isaías citado por Jesus no templo deixa claro que Deus se alegra em receber adoração de outras nações além daquela de Israel. O templo era destinado a ser um lugar de adoração ao qual todos os povos poderiam facilmente ter acesso para encontrar Deus, adorando-o em oração.

[cite] Leia Isaías 56.6-7 cuidadosamente para ver o contexto da declaração: “porque a minha casa será chamada casa de oração...”. Note as referências à oração no versículo 7. Que tipo de oração é descrita? Quem está oferecendo essa oração? Jesus não somente citou esse versículo, mas também o ensinou quando foi provavelmente o momento mais público do seu ministério (Mc 11.17). Que tipos de oração Jesus queria promover? Esta passagem muitas vezes é usada para encorajar a oração em favor das nações. Esta percepção é válida, mas perde o ponto mais importante do ensino ardente de Cristo e da purificação do templo: a esperança de que as próprias nações orarão em adoração de todo coração.

[cite] Continue lendo Hawthorne (cap. 4, p. 47-53): A História da Sua Glória, até a seção “Um ministério de excelsa glória com Paulo”.

[cite] O que Deus fez para sua glória em cada um dos pontos sucessivos da história? Continue o versículo no espaço abaixo, ou acrescente outro comentário que descreva as ações e intenções de Deus.

[figura] /figuras/perspectivas/linha-do-tempo-adoracao.png | A adoração ao longo da história de Israel

[cite] Êxodo 9. 13-16 1 Reis 8. 41-43 “Deixe o meu povo ir para...” “Quanto ao extrangeiro”

2. MISSÃO CENTRADA EM DEUS

Exploramos como o propósito da glória de Deus se desdobra na história. John Piper reitera o argumento de que devemos concentrar a nossa motivação missionária na glória de Deus em adoração pelas nações. Piper diz que a evangelização mundial é secundária, é o meio para alcançar o fim. A glória de Deus é o propósito primário para a missão. Há missões porque não há adoração.

A. A Paixão de Deus

A supremacia de Deus sobre outros deuses estabelece um fundamento lógico e claro para a missão. Mas, encontramos uma motivação ainda mais forte no entusiasmo inesgotável de Deus, que haja louvor vindo de todas as nações. Adoração é tanto o combustível quanto o alvo de missões.

B. Compaixão centrada em Deus

Chamar as nações à adoração é buscar o melhor interesse delas. Nosso entendimento do valor redentor da adoração pode motivar os nossos atos de compaixão até mesmo quando diminui nosso sentimento de amor uns pelos outros. À medida que as nações veem a dignidade de adorar ao Deus vivo, Seu chamado para se aproximarem através da adoração se torna o auge de todas as bênçãos que Ele concede. Torna-se a mensagem mais fácil de compartilhar no mundo: “Louvai ao Senhor... todos os povos”.

[cite] Leia Piper (cap. 5, p. 57-58): Alegrem-se os povos.

3. CUMPRINDO A TAREFA MISSIONÁRIA

Como deveria Israel cumprir o mandato missionário inerente à promessa de Deus, que através dele todas as nações seriam abençoadas? Pode parecer que Israel teve somente um papel passivo: atraindo as nações à adoração a Deus. Alguns concluem que não houve um mandato ativo para ir às nações até os dias do Novo Testamento. Olhe novamente para o relato bíblico e veja o plano de Deus, firme e constante, tanto enviando seu povo às nações a fim de declarar a verdade no Seu nome, como atraindo as nações para se juntarem ao Seu povo em adoração.

A. Duas Forças

Jonathan Lewis descreve dois mecanismos, ou forças de missão, que estavam constantemente ativas. São elas: Expansiva ou Centrífuga. Encontra-se ao longo da história das Escrituras a dinâmica para fora, o que Lewis chama de força expansiva. Outros a chamam de força centrífuga de missões, ou a estrutura do “ide”.

Atrativa ou Centrípeta. Há também por toda a Bíblia a dinâmica para dentro, o que Lewis chama de força atrativa. Outros a chamam de força centrípeta de missões, ou a estrutura do “vinde”.

[cite] Leia Lewis (dentro do cap. 7, p. 64-65): As duas forças.

B. Jonas

Jonas é um dentre vários personagens no Antigo Testamento que foi enviado por Deus para além das fronteiras de Israel. Johannes Verkuyl não considera o envio de Jonas uma exceção, mas um exemplo da atitude egocêntrica do povo de Deus. Ele crê que, através do Espírito Santo, o livro de Jonas ainda fala para a Igreja de hoje. Note como este livro descreve a ira de Jonas quando Deus demonstra compaixão além das fronteiras de Israel, mesmo sabendo que o próprio nome de Deus devia ser conhecido mundialmente como um Deus “gracioso e compassivo”. Observe a descrição da maneira pela qual Jonas rejeita reconhecer o propósito da aliança de Deus com Israel para a salvação das nações.

[cite] Leia Verkuyl (cap. 8, p. 73-76): A base bíblica do mandato missionário mundial, a partir de “O livro de Jonas” até “O período interbíblico”.

4. O VALOR DE CADA ETNIA

Nos parágrafos finais de “A História da Sua Glória”, Hawthorne afirma que Deus “anseia que o único transbordar de amor, justiça, sabedoria e adoração venha de todos os povos” (página 62b). Aquilo a que Hawthorne se refere como “a maravilha característica de cada grupo de pessoas” é parte do motivo pelo qual o Salmo 96:7 conclama as “famílias dos povos” a dar ao Senhor “glória e força” (ver Hawthorne, página 52b). A beleza e valor das culturas humanas, por mais que, agora, as vejamos distorcidas e obscurecidas pelo mal, é algo que a Bíblia celebra com antecipação. Na era vindoura, embora a cidade de Deus seja iluminada pela glória de Deus (Apocalipse 21:23), ela será adornada com as glórias de todas as etnias da humanidade. As nações “trarão para ela a glória e a honra das nações” (Apocalipse 21:26).

Essa alta consideração pela cultura e pelo calor distintivo de cada tribo, língua e povo pode ser vista nos relatos da criação das Escrituras. Miriam Adeney descreve como Deus capacitou a humanidade para criar cultura e florescer em comunidades distintas. Isso significa que a realidade e o valor de cada etnia estão enraizados na criação. Deus valoriza e se deleita com as culturas da humanidade, mesmo que agora, por causa do pecado, como observa Adeney, “as culturas que criamos agora estão repletas de maldade”. Ao buscarmos cumprir o nosso papel na missão de Deus, devemos avaliar e valorizar a cultura desde o ponto de vista de Deus. O trabalho missionário pode ser visto como uma capacitação dos povos para que eles possam começar a trazer a Deus uma medida da “glória e honra das nações”.

[cite] Leia na plataforma o artigo da Adeney, “Deus é dalgônico?”: O evangelho a globalização e como Deus enxerga a diversidade cultural. Somente a seção “Um lugar na história.”

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

5. COOPERANDO COM DEUS EM MISSÃO

O artigo de Tim Dearborn é um dos mais importantes desse curso. Pondere nele cuidadosamente. Ele faz uma das mais importantes distinções possíveis: Nós podemos ver a nossa missão como uma série de projetos de atendimento a necessidades, energizados pela conscientização dos problemas do mundo, ou podemos enquadrar nosso entendimento de missão como um convite para juntar-se a Deus enquanto Ele realiza Seu propósito no mundo. O que torna possível cumprir a missão na segunda proposta é uma visão de Deus realizando Sua missão através da história. Até aqui no curso, temos traçado a história de como Deus tem buscado Sua glória e Seu Reino.

A. Além da Obrigação

Dearborn explora algumas atitudes comuns em relação à motivação da missão. Ele expõe a inadequação de sermos compelidos pelas necessidades humanas. Se a sua paixão primária é direcionada às atividades da missão, a missão inevitavelmente “se degenerará para uma tarefa cansativa e insuportável”. Em vez disso, ele sugere que há uma única paixão: “Quando o Rei e Seu Reino são a força unificadora e controladora e o único objetivo de tudo o que fazemos”, então, a missão se torna uma aventura de alegria, paixão e esperança.

B. Deus em Missão com Sua Igreja

Dearborn diz que é melhor afirmar que “o Deus da missão tem uma Igreja no mundo” que dizer que “a Igreja tem uma missão para Deus no mundo”. Isso significa que a missão de Deus é sempre maior que a missão que Ele confiou à Sua Igreja. Em um sentido muito real, isso significa que não somos necessários. Como essa ideia se compara com o que Piper e Hawthorne têm afirmado?

C. A Realidade Integradora:

O Rei e Seu Reino. Tantas agendas concorrentes e necessidades divergentes chamam nossa atenção. Elas geralmente se somam a notícias tristes de problemas insolúveis. Ao invés de juntar a isso um desafio exaustivo e sem fim, Dearborn nos chama a enxergar a grande vitória de Cristo e a realidade de como o próprio Deus estabelece Seu Reino vindouro. Ele nos tem concedido um papel fundamental, “mas a obra continua sendo de Deus”. D. Sinais do Reino Anote a declaração de Dearborn de que a Igreja não deve ser um “trilho subterrâneo” para o céu. Temos o privilégio de ter um papel na grande história da revelação do Reino de Deus. Ele deseja que nos tornemos sinais vivos de Seu Reino e promovamos sinais da vida do Reino no mundo. Como esses sinais do Reino de Deus trazem glória a Deus?

[cite] Leia na plataforma Dearborn: Além do Dever.

6. EM MISSÃO COM JESUS

Talvez seja mais importante entender a maneira pela qual Jesus envia os seus seguidores do que entender o que Ele os envia a fazer.

A. Assim Como o Pai Me Enviou

Considere uma das declarações mais poderosas em todas as Escrituras: “Assim como o Pai me enviou, eu os envio” (João 20.21 – NVI).

A maneira de Deus. Podemos entender este versículo como dizendo: “Assim como o Pai me enviou, assim também, da mesma maneira, eu os estou enviando”. Como o Pai enviou o Filho? O Pai amou e ouviu o Filho. O Filho amou e observou o que o Pai iniciou. Jesus, em intimidade dinâmica com o Pai, continuou o que o Pai tinha feito através da história. Jesus envia da mesma maneira pela qual foi enviado. O propósito de Deus. O versículo também significa: “Assim como o Pai me enviou, assim também, vocês são enviados para alcançar o mesmo propósito histórico pelo qual Eu fui enviado”. Isso nos deixa perplexos. Jesus confiou a pessoas comuns as mesmas grandiosas causas que o Pai lhe confiou.

B. Deus em Missão

Henry Blackby e Avery Willis descrevem Deus em missão através da história. Embora as frases sejam curtas e simples, elas são profundas. Como Dearborn, eles descrevem a missão de Deus como uma busca do estabelecimento de Seu Reino, porém integrada ao Seu Reino eles veem o Nome de Deus sendo glorificado e o mundo sendo reconciliado com Deus.

1. Deus dá início à Missão. Examine os exemplos de Deus iniciando um ato de avanço de Sua missão pela revelação do que Ele estava para fazer. Em cada caso, Deus dá a Seu povo uma tarefa para cumprir e ainda assim era Ele quem realizava tudo. Por que Deus escolheu fazer as coisas dessa forma? Blackaby e Willis afirmam que Deus deseja ter um relacionamento poderoso, porém amoroso com o Seu povo.

2. Jesus: Em Missão com Seu Pai. Há inúmeros apelos para entendermos nossa missão como uma imitação ou continuação da obra de Jesus no mundo. O que Blackaby e Willis oferecem é algo bem diferente. Observe. Em vez de um chamado para imitar as atividades de Jesus, eles descrevem o que significa seguir o exemplo de Jesus ao unir-se a Seu Pai na Missão. O resultado foi que “Jesus uniu Sua vida à Missão de Seu Pai”. Considere como você pode estar ouvindo a Deus falar com você no decorrer desse curso. Como você pode decidir seguir o exemplo de Cristo para que você possa unir sua vida com a missão de Deus?

[cite] Leia Blackaby/Willis (cap. 6, p. 59-62): Em missão com Deus.

7. PAIXÃO PELA GLÓRIA DE DEUS

Paulo era motivado pela esperança de que Deus fosse glorificado entre as nações. Conforme descrito em Romanos 15, como era a missão que Paulo visava completar? Pode ou deveria ser a nossa visão hoje? Steven Hawthorne descreve três mudanças práticas que devemos considerar enquanto reconhecemos a nossa parte na história contínua da glória de Deus.

A. Aprofunde a motivação básica

Quando missão é meramente uma resposta compassiva à necessidade humana, a motivação pode se limitar a sentimentos de cuidado para com as pessoas. Mobilização pode se limitar em gerar sentimentos de culpa. Mas, quando se define missão primeiramente como um empreendimento que traz algo para Deus, e em segundo como algo que traz benefício às pessoas, então, tanto a nossa motivação quanto a nossa mobilização pode ser mais equilibradas. Assim, a compaixão de fato pode se aprofundar também. Podemos ser profundamente movidos por necessidades enquanto agimos ousadamente para o mais alto propósito de Deus.

B. Defina a tarefa

Focalizando na glória de Deus, percebemos o valor de plantar igrejas entre os povos: elas se tornam uma expressão da santificação daquilo que há de melhor naquela cultura. Essa pode ser uma das melhores motivações para plantar movimentos de igrejas entre cada grupo étnico. A abordagem de grupos étnicos não é tão importante quanto a visão do resultado de grupos étnicos.

C. Una esforços

O que é mais importante? Evangelismo ou ação social? É uma falsa dicotomia que é resolvida quando olhamos para além daquilo que acontece para as pessoas (o que é geralmente enfatizado tanto em evangelismo quanto em ação social) e tomamos como alvo a glória, o louvor e a honra para Deus. Uma visão singular da glória de Deus pode unir e motivar esforços para servir pessoas na sua necessidade atual tanto quanto salvar pessoas da perdição eterna.

[cite] Continue lendo Hawthorne (cap. 4, p. 53-56): A História da Sua Glória (até o final).

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

TURA DE DE CO$conteudo$
   where curso_id = v_curso and ordem = 8;
end
$curso$;
