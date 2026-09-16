-- 294_perspectivas_licao4.sql
-- Nove das dez leituras que faltavam na Lição 4, nas posições em que o guia as
-- chama. Fica de fora McClung (cap. 30): o PDF enviado não traz a p. 210, a
-- página de abertura do capítulo — o texto começa no meio de uma frase, sem
-- título nem biografia. Entra quando essa página chegar.
--
-- PROCEDÊNCIA: PDF ESCANEADO (284 DPI), sem camada de texto — transcrição por
-- OCR, sem prova por contagem de caracteres.
--
-- 15 das 61 páginas vieram TORTAS no scan (12 deitadas a 90°, 3 de cabeça para
-- baixo). A orientação é medida página a página com o OSD do tesseract e
-- corrigida antes da leitura; sem isso o OCR devolvia letra embaralhada.
--
-- Remontagem por coordenadas, como na Lição 2: calha entre colunas descoberta
-- pelo vale de densidade (25%-65% da largura, porque as páginas de abertura têm
-- a coluna da biografia em ~30%), régua vertical descartada na origem, e NENHUM
-- recorte de sangria. As biografias de Thomas e Tson foram transcritas à mão.
--
-- Winter cap. 34 entra como capítulo INTEIRO numa aula só: a Lição 4 pede um
-- trecho (p. 245-247 e 249) e a Lição 5 pede o capítulo todo (p. 245-255).

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- abre espaço: Lição 5 em diante desce 9 posições
  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 32;
  update aulas set ordem = ordem - 1000 + 9 where curso_id = cid and ordem >= 1000;

  -- as quatro leituras que já existiam na Lição 4 assumem suas novas posições
  update aulas set ordem = 30 where curso_id = cid and titulo like 'Lição 4 · Leitura — Thomas: O Vale%';
  update aulas set ordem = 31 where curso_id = cid and titulo like 'Lição 4 · Leitura — Anthony%';
  update aulas set ordem = 32 where curso_id = cid and titulo like 'Lição 4 · Leitura — Glasser%';
  update aulas set ordem = 39 where curso_id = cid and titulo like 'Lição 4 · Leitura — Coleman%';
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Hawthorne, cap. 16: Atos de obediência', 'ftos de obediência Edo 1 6

Steven C€. Hawthorne

é Pro o ME STEVEN CE HAWINONNE é fundador e diretor de WayMakers, em Austin, Texas, nos Estados Unidos. É coeditor Solivro Missões transculturais (São ER ap Ras ap

peisonç cosmopolitas o Projeto Josué. Ele tcoautor (com Graham Kendrick) de Proyerwalking: Proying on Site with “Insight (Orando e caminhando: orando nolocal e com entendimento) e autor de vários artigos.

O: apóstolos obedeceram prontamente à Grande Comissão?

Talvez seja melhor perguntar se eles obedeceram a Jesus. Se obediência à Grande Comissão significa que eles deveriam ter feito as malas e se mudado para a Sibéria um ou dois meses após ouvirem a ordem de Jesus para discipular as nações, como Mateus a relata, então talvez tenham sido lentos, Contudo, pela forma em que Lucas relata a ordem de Cristo e a subsequente obediência dos apóstolos, espero ser tão obediente quanto eles foram.

Pode parecer, após uma leitura mista de Mateus e Atos, que os apóstolos caminharam a passos lentos para lançar a missão global de Mateus 28. Contudo, o relato de Lucas, por si só, é bastante instrutivo para nós. Precisamos compreender, de fato, o que Lucas quis dizer antes de concluir que os apóstolos deixaram de cumprir algo que Mateus escreveu.'' Observando mais de perto a história de Lucas podemos encontrar três maneiras pelas quais os líderes apostólicos de Atos demonstraram ser obedientes: persistência na visão do quadro geral, intrepidez no testemunho público e fidelidade em ajudar os povos a seguir a Cristo sem os entraves culturais não essenciais, Persistência na visão do quadro geral Jesus, antes de partir e depois deixar alguns “mandamentos por intermédio do Espírito Santo aos apóstolos que escolhera, foi elevado às alturas” (At 1.2). Como Jesus fez isso? No dia de sua ressurreição, ele encontrou dois de seus seguidores na estrada para Emaús (Lc 24.13-35). Eles faziam parte do círculo íntimo de crentes, mas não dos Doze. Provavelmente, estavam a caminho de um lugar seguro, longe de Jerusalém.

Os inimigos de Jesus o haviam assassinado, a despeito da multidão de adoradores que afluíra para a cidade. As autoridades hostis não teriam dificuldade para descobrir e aniquilar os líderes remanescentes do movimento, portanto seus seguidores poderiam ser caçados a qualquer momento.

Marcos diz que eles foram obedientes, sem dizer que demoraram (Mc 16.20). Mateus nada menciona além da comissão. João apenas conta profeticamente o último ato de obediência de Pedro (Jo 21.18),

de Cristo sozinho céus. À plenitude da glória do Messias, refletida nas Escrituras que Jesus explicava, está relacionada com obediência a ele por parte das nações Is 2.2-4;

fato de Jerusalém não ser o lar deles mostra quão errado é interpretar Atos 1.8 como em geral se faz: uma sucessão progressiva de evangelismo a partir do lar até terras distantes. Essa visão simplista torna a cidade em que vivemos semeserve para alienar os esforços evangelísticos de hoje do desenrolar histórico que Jesus queria enfatizar. A realidade é que i houve apenas um ponto de partida para o evangelho, Na história de Deus, nunca haverá outro ponto de Pentecostes subsequente, Toda iniciativa posterior é um desenvolvimento sequencial daquele derramamento do Espírito Santo e daquela obediência, Estamos agora nos “confins da terra”, e não repetindo a cena de alcançar “nossa Jerusalém”. Atos 1.8 é tanto

referência geográfica histórica, Qualquer lugar do continente americano é mais distante de Jerusalém do

À única coisa que restou aos dois discípulos foi ouvir as palavras, aparentemente grosseiras, de um estranho que, na verdade, era Jesus: “O néscios e tardos de coração para crer em tudo o que os profetas disseram! Porventura, não convinha que o Cristo padecesse e entrasse na sua glória?”. Foi com base nesse esboço sofrimento seguido de glória que Jesus discorreu sobre toda a história das Escrituras (v. 26,27),a qual fazia sentido com um Messias no centroe no fim de tudo. Ela culminava com o Messias escolhido de Deus entrando em “sua glória”. A expressão “sua glória” era uma visão do Messias adentrando uma era de honra e paz duradoura para todas as nações.? À história das Escrituras tinha coerência e culminação no Messias.

Com uma esperança tão voraz agora acesa (eles disseram: “Porventura, não nos ardiao coração...2”, 24.32), os discípulos correram de volta à zona de perigo em Jerusalém, entrando novamente na sala trancada em que os apóstolos mantinham luto escondidos (Jo 20.19; Lc 24.33). De repente, o próprio Cristo apareceu no aposento, repetindo o mesmo desdobramento das Escrituras. Jesus revelou ainda mais detalhes sobre como ele entraria em sua glória: seu nome seria honrado universalmente com a proclamação de perdão dos pecados para todos os povos. Foi nesse momento que ele acrescentou um item significativo para a E obediência estratégica deles: a expansão glo-Í bal de sua glória seria lançada “começando de Jerusalém” (Lc 24.45-47).

Lucas continua seu relato dos 39 dias seguintes e no livro de Atos ele mostra que Jesus

2 A expressão “sua glória” não se refere à ascensão Ez 37.24-28; S1 2; 22; 89; 110 etc.). lhante à cidade singular de Jerusalém, por meio da expressão uma quanto todos os lugares da África e da Ásia,

revisitou a história do Reino de Deus várias vezes. Foi durante um desses encontros que instruiu severamente os apóstolos a não saírem de Jerusalém (At 1.4). Ordenar a um grupo que permaneça na cidade parece ser um jeito estranho de começar um movimento missionário. Um fato muito ignorado, porém, ajudou nesse processo: Jerusalém não era o lar deles! Aqueles homens eram da Galileia. Anjos mensageiros, que por certo conheciam bem a geografia, chamaram-nos “galileus” (At 1.11)? Também a elite de Jerusalém conseguiria facilmente distinguir o sotaque galileu deles (Mt 26.73; Lc 22.59).

Jerusalém era o lugar mais perigoso do mundo para eles. Inimigos declarados, com poder suficiente para matar com impunidade, haviam tentado prendê-los no jardim dias antes (Mc 14.50-52; Jo 18.8,9) e, provavelmente, tentariam novamente. Não é à toa que Lucas relata que Jesus ordenou a permanência em Jerusalém. Se não o tivesse feito, eles teriam saído de fininho de volta ao conforto de seus lares na Galileia. Contudo, aqueles homens e mulheres seguiram rigorosamente as ordens de Jesus e permaneceram na cidade.

Devemos admirar sua coragem! Eles permaneceram e oraram no aposento onde se hospedavam e, quando receberam o derramamento de poder que lhes fora prometido, imediatamente foram ao público. Daquele momento em diante, eles permaneceram à vista do público, às vezes com o risco da própria vida.

Quando a perseguição surgiu, os apóstolos não se dispersaram, pois o testemunho deles em

a (v. “nossa Jerusalém”. Essa noção espantosamente etnocêntrica

Jerusalém ainda não havia terminado. Eles permaneceram onde era mais estratégico e também mais perigoso. Foram presos, humilhados, censurados e espancados mais de uma vez (At 4,1-21; 5.17-41), e ainda assim continuaram. Tiago foi morto (12.2), mesmo assim eles permaneceram em Jerusalém, recusando-se a fugir e permitindo que os poderes da oposição os encontrassem. Depois de Pedro ser preso, foi necessário que um anjo o livrasse para, finalmente, convencê-lo a buscar um lugar mais seguro, fora da cidade (12.17). No entanto, não há indicação de que outro dos Doze tenha partido com ele. Como vemos, os discípulos eram extremamente obedientes, nenhuma ameaça parecia intimidá-los. A lição da obediência para hoje Assim como ocorreu na estrada para Emaús, devemos estar atentos para que o próprio Cristo se aproxime de nós, mesmo em nossos momentos mais fúteis e ensimesmados, e nos relembre o “quadro geral” de tudo que Deus tem feito ao longo da história humana. Sem dúvida, Cristo pode hoje nos dar ordens “por intermédio do Espírito Santo”. Essa instrução específica será mesclada com a visão do quadro geral da glória de Cristo. À disposição dos apóstolos em obedecer pode ter sido tênue e confusa, porém foi suficiente para que o Pai os enchesse de determinação e firme obediência para que pudessem enfrentar aquele momento histórico. Intrepidez quando o testemunho público é custoso Os apóstolos foram fiéis à ordem de Cristo? pelo relato de Lucas, eles deveriam posicionarse publicamente como testemunhas (Lc 24.48; At 1.8). Agir como “testemunha”, de acordo com Lucas, não envolve necessariamente a comunicação pessoal e individual do evangelho a amigos e familiares. Apenas em tempos recentes o termo “testemunha” igualou-se à comunicação geral do evangelho, À forma em que Lucas

utiliza o termo “testemunha” revela que, quase sempre que alguém agiu como testemunha, o fez publicamente”.

Por que uma declaração pública nas praças emas ruas era tão importante? Deus queria algo mais significativo que uma conscientização generalizada da ressurreição de Cristo. Deus estava estabelecendo uma Igreja inabalável. Uma testemunha não só afirmava os fatos de Jesus, mas, por sua disposição para sofrer, estabelecia também o profundo valor de seguir a Jesus.

À provação da publicidade serviu para distinguir o movimento dos seguidores de Cristo, colocando a Igreja à vista do povo. Homens e mulheres comuns tornaram-se figuras públicas, assim como seu caráter semelhante ao de Cristo. Até mesmo seus inimigos “reconheceram que haviam eles estado com Jesus” (At 4.13). A vida daqueles discípulos tornou-se uma expressão dos mais altos ideais do povo (5.13). À função do testemunho não podia ser reduzida a uma breve ação comunicativa: era um processo, que se desenvolveu por semanas, meses ou mais.

Testemunhar está relacionado com o paradoxo de vergonha e glória. Depois de um julgamento no tribunal, Pedro e seus parceiros no testemunho regozijaram-se por terem sido considerados dignos de sofrer opróbrio pelo nome de Cristo. Jesus comunica a Paulo, por intermédio de Ananias, que ele seria “um instrumento escolhido para levar o meu nome perante os gentios e reis, bem como perante os filhos de Israel”. Parecia um cargo elevado, mas o custo era alto, visto que testemunhar implicava sofrer. À frase seguinte do Senhor acerca de Paulo foi esta: “Eu lhe mostrarei quanto lhe importa sofrer pelo meu nome” (At 9.15,16). A vergonha deles era glória para Cristo. Alição da obediência para hoje Testemunhar não é tanto o compartilhamento pessoal do evangelho quanto o estabelecimento público da Igreja. Será necessário mais que boa lábia para plantar igrejas onde elas não existem.

O drama de Atos pode ser um retrato de como se planta uma igreja. Pode haver exceções, porém na maioria das vezes a história diz que os movimentos cristocêntricos duradouros precisam emergir à vista do público. Movimentos secretos tendem a enfraquecer e, muitas vezes, desaparecem de vez. Os movimentos que resistem bravamente trazem o nome de Cristoe, ao mesmo tempo, demonstram muito do que é reconhecido como os mais elevados ideais do povo. Como isso ocorre? Por meio de homens e mulheres (geralmente nativos comuns, em vez de missionários) falsamente acusados e colocados em situação de testemunhar abertamente. É nesse momento que o valor de seguir a Cristo se estabelece. Fidelidade para acelerar a expansão do evangelho Em Jerusalém, os apóstolos demonstravam que. serviam conscientemente ao avanço da Palavra de Deus (At 6.4). No entanto, eles não ficaram acampados em Jerusalém, mas acompanharam a expansão do evangelho com interesse vigilante. Quando souberam do avanço do evangelho, imediatamente saíram para validá-lo,abençoá-lo e apoiá-lo (8.14-25; 11.22). Quando ficou claro que as igrejas haviam se multiplicado por toda a Judeia, Galileia e Samaria, o próprio Pedro percorreu a região, viajando “por toda parte” e A ajudando a Igreja a crescer (9.31,32). “à Foi durante essa empreitada que Pedro rece-É beumais instruções do próprio Espírito Santo: “Disse-lhe o Espírito: Estão aí dois homens que te procuram; levanta-te, pois, desce e vai com eles, nada duvidando; porque eu os enviei” (10.19,20). Pedro já foi caracterizado como racista à porta de Cornélio, quando murmurou algo como: “Eu nem devia estar aqui, Que raios você quer?”, Leia você mesmo as palavras dele a Cornélio. Para mim, parecem mais as palavras de alguém que pede desculpas por atitudes passadas, refletindo uma prontidão para obedecer: “Vós bem sabeis que é proibido a um judeu ajuntar-se ou mesmo aproximar-se a alguém de outra raça; mas Deus me demonstrou que a ne-

nhum homem considerasse comum ou imundo; por isso, uma vez chamado, vim sem vacilar”,

Poucas horas depois de ouvir o Espírito Santo lhe ordenar que leve o evangelho aos gentios, Pedro adentrou a casa de Cornélio, cujas portas o Espírito abrira dramaticamente. No entanto, outra porta se abriu naquele dia, e foi Pedro e os outros apóstolos que Deus usou para mantê-la aberta. Não era uma porta para facilitar a ida de missionários aos povos, e sim a porta da fé, que permitia a todas as nações seguir a Jesus sem se divorciarem de sua cultura.

Visto que os apóstolos tinham sido fiéis ao permanecerem em Jerusalém, eles estavam em posição de manter aberta a porta que Deus abrira para as nações. “Começando de Jerusalém” (Lc 24.47) representava a inauguração de um movimento mundial. Deus uniu os apóstolos em corpo, coração e mente para um dos momentos mais importantes da História: o concílio de Jerusalém, registrado em Atos 15. A essa altura, o evangelho estava muito perto de se tornar apenas mais um grupo sectário do judaísmo. Em vez disso, os apóstolos reunidos foram capazes de afirmar que Deus “abrira aos gentios a porta da fé” (At 14.27).

Alguns dos cristãos primitivos pensavam que Deus queria que todos os gentios salvos aderissem às tradições culturais e religiosas do povo de Israel. Alguns insistiam em que crentes gentios fossem circuncidados, tornando-se, em essência, prosélitos da cultura religiosa judaica, em vez de simplesmente seguirem a Jesus. Isso significava que os gentios precisariam, para todos os efeitos, abandonar seu povo se quisessem servir a Deus. Ele deixou claro, porém, nos acontecimentos registrados em Atos, que, embora os gentios devessem cultivar a união espiritual com Israel, nenhum gentio precisaria se tornar culturalmente um judeu. Não era necessário deixar a família, nem suas raízes, nem seu nome para se tornar discípulo de Cristo.

Pedro lembrou os apóstolos de que eles haviam outrora reconhecido que Deus queria que a mensagem da vida chegasse às nações. Eles tinham louvado “a Deus, dizendo: Logo;

a por proibição da idolatria da alimentação de animais estrangulados clara ligação proibições feitas ao patriarca (Gn 9.1-17). Existiria uma alusão a Gênesis na imoralidade mencionada em Atos (15.20, 29; 21.25)? A ideia hebraica da causa do dilúvio certamente está ligada às uniões ilícitas de Gn 6.1-6. Não importa se os participantes eram humanos ou angélicos. Essa é a primeira ocorrência clara de pecado sexual, para desgosto de Deus. Escrito lis aci a Sei A AA IE DA CRE eb AS DOT GDA UN ANP NUR

para 1. Que indicadores você percebe escritos de Lucas de apóstolos foram obedientes às

instruções que receberam? Que indicadores há de que eles foram tardios em obedecer?

O significa “testemunhar”? Hawthorne distingue entendimento moderno pessoal indi-

vidual do entendimento antigo de caráter público e judicial. Que valor tem o testemunho pú3. Coloque-se papel de indivíduo de um povo não alcançado e então explique as duas

steven Hawthome também aos gentios foi por Deus concedidoo arrependimento para vida” (At 11.18). A fim de convencer a todos, Pedro relatou sua história; Paulo contou o que Deus estava fazendo em determinado momento; Tiago declarou que as promessas de Deus contidas nas Escrituras estavam sendo cumpridas, À decisão foi denão colocar nenhum empecilho ou obstáculo diante "daporta que Deus abrira para as nações (15.131). Nenhuma obra da lei (significando “lei” as tradições culturais e religiosas) seria exigida para a salvação.” Homens e mulheres de qualquer povo seriam salvos pela fé e seguiriam a Cristo, no que Paulo mais tarde chamaria “obediência porf(Rm 1.5)

Como podemos observar, em movimentos de larga escala, é raro que pessoas sejam tão dispostas ou tão fiéis em seguir uma linha de ação que transcenda tão completamente os preconceitos religiosos do dia a dia. Poucos movimentos na História foram tão rápidos ou tão determinados em permitir que outros povosseguissem a Deus de maneiras culturalmente diversas do movimento original. Eles viram Deus abrir a porta da fé para os povos gentios. Eles estavam decididos a não permitir que nenhuma barreira impedisse algum povo de seguir a Cristo na simples liberdade da fé.

Eles determinaram que não houvesse exigências, exceto

blico em Atos? Quanto tempo demorou até

barreiras: a do muro e a do abismo.

137 [7 A lição da obediência para hoje Nos dias de hoje, não temos sido tão intrépidos em manter a porta aberta para a fé. Milhares de grupos étnicos são impedidos de seguir a Cristo. Milhões de pessoas são afastadas do evangelho não por Cristo ou pelo arrependimento que ele exige, mas porque zelotes tradicionalistas cristãos, embora bem-intencionados, têm exigido aderência às chamadas tradições culturais “cristãs”. Assuntos superficiais como alimentação, vestuário, música, nome de família e outras questões periféricas não constituem o cerne do evangelho. Insistir em que tais coisas são essenciais equivale a instituir uma “circuncisão cristã”, que Deus não exige nesses termos. Deus abriu a porta da fé, pois não poderíamos fazê-lo sozinhos. O que podemos fazer é levar adiante a obediência corajosa do concílio de Atos 15. Hoje, precisamos fazer tudo que estiver ao nosso alcance para receber em Cristo as pessoas que passam através da porta da fé, ajudando-as a seguir a Cristo sem lhes impor o “maior encargo” (At 15.28) de tradições baseadas na Bíblia que não são essenciais à obediência a Cristo pela fé. Só então o evangelho será declarado, e as nações poderão seguir a Cristo “sem impedimento algum” (28.31). as que Deus fizera a toda humanidade meio de Noé. A

com sangue tem com as

o e esse tipo de testemunho ser posto em prática?

4 e rmtctam O muro e o abismo A tarefa missionária constituída de duas partes. A primeira é certificar-se de que o evangelho seja compreendido, de modo a revelar Cristo e sua salvação. A segunda é certificar-se de que o evangelho seja recebido, de modo a abrir o caminho para Cristo. Não raro, vemos a comunicação como a tarefa maior, uma vez que esse muro se ergue diante do missionário. Contudo, a tarefa maior é servir as pessoas para que elas sigam a Cristo de maneira consistente com sua cultura.

O muro da comunicação O abismo da conversão

e Barreira da compreensão e Barreira da aceitação

e Desafio enfrentado pelo missionário e Desafio enfrentado pelo povo ouvinte

e Comunicar o evangelho Seguir a Cristo

e O milagre da revelação Milagre do arrependimento

e Visto na Escala E e Visto na Escala P Por cima do muro: comunicação transcultural Por cima do abismo: facilitando o seguir a Cristo Devemos nos esforçar para transmitir as boas novas Devemos nos esforçar para vermos as boas novas de modo inteligível a todos os povos, na língua e recebidas por todos os povos, mas ninguém deve cultura deles. A comunicação é trabalho nosso: mi- rejeitar a Cristo pela falsa impressão de que ele o nimizar a dificuldade que qualquer povo tiver para está convocando a cometer suicídio cultural, a abancompreender a mensagem de Deus. Devemos co- donar ou se divorciar de seu povo. No entanto, não municar O evangelho com clareza para que o milagre se deve divulgar uma “graça barata”, uma converda revelação de Cristo, que Deus pretende realizar são rápida e fácil. Sem dúvida, Deus chama todos no evangelho, não tenha empecilhos. Todo artifício ao arrependimento, mas o arrependimento não é criativo deve ser examinado. Nenhuma língua-mãe uma declaração de lealdade ao estilo de vida ou às deve continuar obscura ou sem tradução, se isso tradições eclesiásticas ocidentais. significar que a Palavra de Deus não conseguirá "alcançar um coração pronto para ouvir.

O hindu vegetariano não deve temer tornar-se cristão porque os cristãos supostamente devem comer carne e beber sangue. Os chineses podem relutar em seguir a Jesus por entenderem erroneamente que a conversão significa repudiar seus ancestrais. O nômade não deve ser obrigado a acreditar que todos os crentes precisam viver em cidades e falar inglês. Esses mal-entendidos parecem banais, entretanto, para homens e mulheres de grupos não alcançados, constituem verdadeiras barreiras, da magnitude de uma operação de mudança de sexo. Cristo não morreu para que os muçulmanos possam comer carne de porco ou para que os aborígenes usem sapatos.

Não basta ouvir o evangelho. Não é o bastante entendê-lo. As pessoas precisam ter condições de ver o evangelho ser praticado em todo o seu frescor radical e poder celeste. Esse tipo de realidade só pode ser visto na comunhão e na adoração de uma igreja naquela cultura. Podemos dizer que o verbo precisa fazer-se carne novamente naquela cultura.', 28 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Thomas, cap. 15: O momento decisivo — libertando o evangelho', 'O decisivo: 1 5

libertando evangelho

M. R. feanmesesanana

M. R. THOMAS é indiano. Suas reflexões são fruto de décadas de discipulado entre o povo hindu. Atualmente, trabalha para uma grande empresa de tecnologia da informação na Índia, ao mesmo tempo em que dá continuidade ao seu ministério entre os hindus. Usado com permissão.

mis ca que di OShindius IUsado com permissão.

A maior crise que a Igreja do Novo Testamento já enfrentou foi

a verdade um choque cultural, embora alguns acreditassem que o problema fosse doutrinário. Eles não podiam imaginar a vida sem Moisés e sem a lei. Com o passar dos séculos, as leis de Moisés haviam se tornado mais que religião. Tornaram-se tradições, profundamente arraigadas, que deram aos judeus sua identidade como povo. Deus, porém, mostrou a Paulo que os gentios não poderiam conviver com as tradições judaicas. Paulo compreendeu que os gentios não deveriam ser forçados a aceitar um evangelho atolado em confusão sobre o que era graça o que era simples tradição judaica.

Quando foi exigido que os novos convertidos adotassem um novo conjunto de costumes para fazer parte da “família de Deus”, eles rapidamente confundiram a graça, que é recebida pela fé, com obras. Além do mais, se adotassem uma nova cultura humana, se tornariam estranhos para seu próprio povo. Isso, por sua vez, realém do que se encontra nas Escrituras corresponde a impor usa pesa que não deveria carregar. Qualquer coisa além das Escrituras é excesso, Isso pode parecer óbvio, mas é algo que geralmente ignoramos. É um distúrbio que causa tensão que se repete por toda a história das missões. Ele onia tensão asnda hoje, quando mão insistimos em fazer emendas ao evangelho da graça. O ministério terreno de Jesus Quando q Senhor Jesus incumbiy seus seguidores de fazer dascípulos de todas as nações, eles deveriam ser suas testemunhas em Durante o tempo em que permancocu com os discipubos, fesus revciou-s como o Filho de Deus e os iremos para à taneía que cimbam pela fremme. Jesus [nes disse: “Assam como Pas mae enviou, eu tambéra vos envia” (Ja 21.21). Ele poomeses o Espírico Santo mara lhes dar poder e guiá-los. A bes de missões teve um inágama prometido, o evangelho foi pregado 4 um público de céu (Ar 25). Seguazs-se umas enorme seação, e milhares creram

130 em Cristo. Atos 112 relata o crescimento do evangelho de Jerusalém a Antioquia, num período de cerca de 14 anos. O evangelho para os judeus Foi um período sem igual: o movimento do evangelho ocorreu quase que inteiramente dentro da comunidade judaica. Deus havia preparado a comunidade judaica durante um período de 2 mil anos para seu Messias, Eles tinham a Palavra de Deus nos escritos de Moisés, nos Profetas e nos Salmos, Eles conheciam toda a história e tinham a promessa do Messias. Os primeiros discípulos compreenderam o evangelho como o verdadeiro cumprimento das profecias messiânicas, Eles acreditaram que Jesus era o Messias prometido.

Essa verdade sobre Jesus e suas experiências como “testemunhas” da morte e ressurreição de Cristo forçaram os judeus convertidos alevaro evangelho a todo o mundo judaico. O evangelho se encaixava muito bem nas práticas judaicas religiosas já existentes. Como sempre, suasatividades concentravam-se ao redor do templo. Eles continuavam seguindo as tradições, os costumes e as festas judaicas. Eles creram em tudo que Jhes era familiar, exceto que, em Jesus, agora tinham seu Messias. Em sua mente, o judaísmo havia sído confirmado. As antígas Escrituras haviam sido cumpridas. À maioria dos judeus convertidos não estava consciente de que eram, k E na verdade, parte de uma obra nova e completa “realizada pelo próprio Deus, a O evangelho para os gentios Alguns entendiam melhor as mudanças queo cristianismo traria, Estevão deve ter compreendido que seria impossível a mensagem do evangelho ficar confinada às fronteiras do judaísmo, Ele com certeza percebeu que o templo, com seus rituais e costumes, era coisa do passado, Sua defesa, quando foi preso, revela sua compreensão acerca dos propósitos de Deus. Ele foi conduzido ao Sinédrio sob a acusação de haver falado “contra o lugar santo e contraa efe de ter declarado que “Jesus, o Nazareno,

O momento decisivo: libertando 6 evangei, destruirá este lugar e mudará os costumes Que Moisés nos deu” (At 6.13,14). Quando Estéva, respondeu, fazendo menção de Isaías 66.1,2 suas palavras refletiam a mudança radical que Jesus comunicou à mulher samaritana no poço

que a hora “já chegou, em que os verdadeiros adoradores adorarão o Pai em espírito e em verdade” (Jo 4.23).

Estêvão foi apedrejado até a morte. Com a perseguição deflagrada, muitos judeus convertidos foram forçados a fugir de Jerusalém. Para eles, o templo deixara de ser o centro de adoração: o evangelho fora geograficamente ampliado. “Os que foram dispersos por causa da tribulação que sobreveio a Estêvão se espalharam até à Fenícia, Chipre e Antioquia, não anunciando a ninguém a palavra, senão somente aos judeus” (At 11.19), Esses cristãos, contudo, ainda acreditavam que Jesus era propriedade exclusiva dos judeus. De seu ponto de vista, eles eram os “herdeiros” do evangelho, porém alguns deles “falavam [do evangelho) também aos gregos"(At 11.20). Esse fato é de grande importância.

Foi, na verdade, um momento decisivo! Deus abençoou seus esforços e “a mão do Senhor estava com eles, e muitos, crendo, se converteram ao Senhor” (At 11.21). Esse fato provocou o movimento do evangelho rumo 40 mundo gentio, enquanto as equipes apostólicas de Paulo, Barnabé e outros partiam de Antioquia. Atos 13—28 registra a expansão do evangelho no mundo gentio, Não foi sem tensão e conflito, mas por meio deles os propósitos eternos de Deus foram esclarecidos e compreendidos.

À compreensão sobre o abismo entre o mundo dos judeus convertidos e o dos gentios ajuda-nos a compreender e aprender com as tensões com que os primeiros discípulos tiveram de lidar, Houve um caso excepcional, antes de Antioquia e da missão de Paulo aos gentios, no qualo evangelho se esvaziou de seu modelo judaico e chegou à casa de um gentio. Fora visita do apóstolo Pedro ao lar de Cornélio, ofcial militar romano que era “piedoso e temente

a Deus e, de contínuo, orava (At 10.2). Pedro visitou Cornélio coagido pelo Espírito "Santo, Ele chegou a dizer ao seu anfitrião gentão:“Vós bem sabeis que é proibido aum judeu juntar-se ou mesmo aproximar-se a alguém de outra raça” (v. 28). Entretanto, Deus havia preparado Pedro de uma maneira tão especial que o ajudou a acrescentar: mas Deus me "demonstrou que a nenhum homem considerasse comum ou imundo”, Pedro venceu um grande bloqueio mental e, quando ouviu a história de Cornélio, recebeu nova compreensão, que o levou a exclamar: “Reconheço, por verdade, que Deus não faz acepção de pessoas; pelo contrário, em qualquer nação, aquele que o teme e fazo que é justo lhe é aceitável” (v, 34,35).

Com essa nova atitude, Pedro começou a explicar o evangelho a todos que haviam se reunido na casa de Cornélio. Antes mesmo de terminar, Deus homologou a sua mensagem, enviando o Espírito Santo! Os judeus convertidos “admiraram-se, porque também sobre os gentios foi derramado o dom do Espírito Santo” (v, 45). Pedro, no entanto, teve problemas quando regressou a Jerusalém. Os judeus convertidos de lá “o arguiram, dizendo: Entraste em casa de homens incircuncisos e comeste com eles” (At 11.2,3). Pedro explicou o que "havia acontecido. Com isso, os que o criticavam concluíram: “Logo, também aos gentios foi por Deus concedido o arrependimento para vída” (v. 18). E Esse primeiro episódio oferece um vislum“bre das lutas que os primeiros discípulos experimentaram para compreender a obra de Deus ea expansão do evangelho, mas as verdadeiras tensões ainda estavam por vir. Deus havia escolhido Paulo para levar o evangelho aos gentãos, Provavelmente demorou vários anos para “Paulo entender os propósitos de Deus em relação aos judeus e a todos os povos, Ele entendeuqueo evangelho de Cristo era diferente da Jeje da tradição judaicas e que a salvação era pela fé em Jesus Cristo, independentemente da lei, Ele percebeu que o evangelho da graça era para todos e que não havia diferença entre

judeu e gentio. Essa constatação não foi invenção sua: foi-lhe revelada. Foi a mensagem que pregou em sua primeira viagem missionária, com Barnabé, quando Deus “abrira aos gentios a porta da fé” (At 14.27). Muitos gentios aceitaram a Cristo nessa época, e o evangelho foi semeado em solo gentio.

Alguns judeus convertidos, provavelmente de Jerusalém e da Judeia, não concordavam com a mensagem de Paulo. Eles diziam: “Se não vos circuncidardes segundo o costume de Moisés, não podeis ser salvos” (At 15.1). Eles foram “corrigir” o evangelho que Paulo pregava, acreditando que ele havia omitido a necessidade da circuncisão. Ele não informara os gentios de que eles deveriam observar os costumes judaicos nem os havia instruído a guardar os dias especiais e as festas. Quando Paulo soube disso, ficou furioso.

Na assembleia de Jerusalém, alguns dos judeus convertidos insistiam em que “é necessário circuncidá-los e determinar-lhes que observem a lei de Moisés” (At 15.5). É importante notar o processo e a base sobre a qual as conclusões foram traçadas enquanto os apóstolos e os presbíteros avaliavam a questão. Após muita discussão e debate, Pedro recordou o episódio de Cornélio e as lições que surgiram de sua experiência. Ele disse; “Deus, que conhece os corações, lhes deu testemunho, concedendo o Espírito Santo a eles, como também a nós nos concedera, E não estabeleceu distinção alguma entre nós e eles, purificando-lhes pela fé o coração” (v, 8,9). Depois Pedro tocou nas questões fundamentais: “Agora, pois, por que tentais a Deus, pondo sobre a cerviz dos discípulos um jugo que nem nossos pais puderam suportar, nem nós?” (v. 10). Paulo e Barnabé falaram em seguida, e “toda a multidão silenciou, passando a ouvira Barnabé e a Paulo, que contavam quantos sinais e prodígios Deus fizera por meio deles entre os gentios” (v. 12). Finalmente, Tiago falou, citando Amós. Repetindo a observação de Pedro, declarou: “Pelo que, julgo eu, não devemos perturbar aqueles que, dentre os gentios, se convertem a Deus” (v. 19).

EEE SEDES SEE SEE DOCES EAR E SI EE ESSES EEE DEST ARESTAS AE

Perguntas para estudo 2. Que processo os missionários deveriam criar para determinar se algumas práticas naturais

ser ou novos convertidos?

[PA 132 O evangelho hoje A pureza e a mobilidade do evangelho estavam em jogo naquele dia. A essência do evangelho foi diferenciada de sua origem cultural judaica. Até onde as boas novas teriam ido se Paulo tivesse perdido esse debate? Todo o movimento dos seguidores de Cristo chamado “o Caminho” teria terminado como uma das centenas de seitas oriundas dos fragmentos do judaísmo, que agora estão extintas. Em vez disso, Deus orquestrou uma mudança surpreendente: para seguir a Cristo, os gentios não tinham mais que se tornar culturalmente judeus. Deus abriu a porta da fé para as nações. 1. Que normas culturais os cristãos modernos

que abraçam a fé?

devem toleradas resistidas pelos

O momento decisivo: libertando o evangelho

Antes que pudessem obedecer à Grande Comissão e levar o evangelho a todas as nações, os discípulos do primeiro século tiveram de separar a glória ilimitada de Jesus dos modelos culturais do judaísmo. Esse é o nosso desafio hoje. Nós, também, devemos separar Jesus de nossas tradições religiosas, do “nosso” cristianismo. Nós, também, devemos livrar o evangelho das emendas que temos feito à graça de Jesus Cristo. Nós, também, devemos estar prontos para saudar as formas em Cristo é obedecido, mas de modo diferente, entre as diversas culturas das nações. Só então o evangelho continuará a seguir em frente, “sem impedimento algum” (At 28.31). têm acrescentado às perspectivas bíblicas para os', 29 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Winter, cap. 34: As duas estruturas da missão redentora de Deus', 'As duas estruturas da Al

redentora de Deus

PRO” E RALPH. WINTER foi convidado para ser professor de missões na School of World Mission, do Fuller Theological con arara tomo ente asp os

do fudendo eng depois, ala é sá aspata, Muberta, fundaram uma sociedade Ê missionária denominada Frontier Mission Fellowship, em Pasadena, na E Califórnia. Essa empreitada deu origem ao U.S. Center for World Mission e à Wii Carey International University, Que cooperam com outras missões em É tarefas pioneiras no campo missionário. É:

Ralph D. Winter Numa palestra apresentada à Consulta Missionária Pan-Asiática, realizada em agosto de 1973, em Seul, na Coreia do Sul, Ralph Winter descreveu as formas que as duas “estruturas redentoras” de Deus, existentes em cada sociedade humana, tém assumido no decorrer da História. Sua tese consta de duas implicações principais: devemos aceitar ambas as estruturas, representadas na Igreja da atualidade por meio da igreja local e da sociedade missionária, como legítimas e necessárias; 2) as igrejas não ocidentais devem organizar e empregar sociedades missionárias caso descjem se desincumbir de sua responsabilidade nesse setor.

Dar deste artigo demonstrar que ainda haverá dois ti-

pos básicos de estruturas no movimento, quer o cristianismo adote uma forma ocidental, quer uma feição asiática, Daremos maior destaque à existência dessas duas estruturas conforme vêm se apresentando através dos séculos. Isso servirá para definir, ilustrar e comparar sua natureza e importância. Explicaremos também a razão pela qual nossos esforços em qualquer parte do mundo hoje só terão mais eficácia se ambas as estruturas estiverem plena e devidamente envolvidas neles. Estruturas redentoras no período do Novo Testamento Em primeiro lugar, vamos reconhecer a estrutura tão carinhosamente intitulada “a Igreja do Novo Testamento” como sendo basicamente uma sinagoga cristã." A obra missionária de Paulo consistia principalmente em visitar as sinagogas espalhadas pelo Império Romano, a começar pela Ásia Menor, tornando claro aos crentes judeus e gentios daquelas sinagogas que o Messias viera em Jesus Cristo, o Filho de Deus; que em Cristo existia uma autoridade final ainda maior que a de Moisés; que isso tornava possível

Mal podemos imaginar meios fornecidos mais providencialmente para a missão cristã alcançar a comunidade gentia, Onde quer que a comunidade de Cristo se apresentasse, encontrava à mão os instrumentos necessários para alcançar as nações: um povo vivendo sob a promessa da ahança e sob uma eleição responsável e as Escrituras, a revelação de Deus a todos os homens. Essas coisas convengiam na sinagoga aberta. Os eristãos tinham na sinagoga livre acesso às comunidades judaicas. Foi na sinagoga que os primeiros convertidos gentios declararam sua fé em Jesus, V. Richard R, DeRidder, The Dispersion of the People af God (Rampen: Kok, 1971), p. 87.

a À To, TI “No tempo de Paulo, Ávia significava o que hoje entendemos por Ásia Menor, a Turquia da atualidade. Naquele tempo,

alcance viria mais tarde. *Fica designação anciãos oração, cristãos organizavam culto conforme o padrão da sinagoga. A provisão de uma distribuição diária de alimento para as viúvas os necessitados reflete a prática corrente nas sinagogas (At 2.42;6.1). Ê possível que a epístola de Tiago reflita a situação predominante em

é literalmente “sinagoga”, palavra mais costumeira, “igreja”. V. Glenn W. Barker, William L. Lane

Ramsey Michaels, The Nexo Testament Speaks (New York: Harper and Row Co., 1969), p.

O ganhar os gentios sem forçar sobre eles qualquer adaptação cultural às determinações rituais da lei mosaica, À inovação da obra de Paulo resultou na criação de sinagogas que não eram apenas cristãs, mas também gregas.

Muito poucos cristãos, lendo casualmente o Novo Testamento ou tendo apenas o Novo Testamento à disposição, imaginariam quantos evangelistas judeus andaram por todo o império antes de Paulo, pessoas que, segundo o próprio Jesus, rodeavam “o mar e a terra para fazerum prosélito”, Paulo seguiu os passos deles, edificou sobre os esforços deles e foi além deles com o novo evangelho que pregava, o qual permitia que os gregos permanecessem gregos, sem a necessidade de circuncidar-se ou de assimilar o estilo de vida judeu.

Ao que parece, Paulo, além de percorrer todas as sinagogas da Ásia, após o que declarou que “todos os habitantes da Ásia" ouviram o evangelho, também criou, quando a ocasião exigiu, novas comunidades de crentes, semelhantes às sinagogas, como unidades básicas de sua atividade missionária. À primeira estrutura no cenário do Novo Testamento é, portanto, o que geralmente chamamos “Igreja neotestamentária”. Ela foi estruturada segundo o modelo das sinagogas judaicas, reunindo a comunidade dos fiéis em qualquer lugar. À característica marcante dessa estrutura é a inclusão de velhos e moços, homens e mulheres. Observe também que Paulo desejava formar essas comunidades com ex-judeus e com não judeus de fala grega.

O contexto do Novo Testamento contém ainda outra estrutura, totalmente diversa. Embora saibamos muito pouco sobre a estrutura do trabalho evangelístico pelo qual os judeus, antes da época de Paulo, tentavam fazer proninguém imaginava o que esse termo a ter

evidente, pela de e pelo culto de Jerusalém. Em Tiago 2.2, a referência é a um homem rico nessa passagem e não a

sélitos, sabemos, como já foi mencionado, que eles atuavam em todo o Império Romano. Seria surpreendente se Paulo não seguisse de modo geral o mesmo processo, e temos muito mais conhecimento sobre o modo em que o apóstolo operava. Na verdade, ele foi enviado pela igreja de Antioquia, mas depois que saíu de Antioquia parece ter atuado por conta própria. Quando necessário, a pequena equipe por de organizada tinha autossuficiência econômica Ele recebia seu sustento não só da igreja de Antioquia, mas, de vez em quando, de outras igrejas surgidas como resultado de seu esforço evangelístico. À equipe de Paulo pode ser considerada uma estrutura. Embora sua estruturação e forma não estejam explicadas em detalhes nos documentos existentes, verificamos que a Igreja neotestamentária também não aparece definida em termos concretos nas páginas do Novo Testamento. Em ambos os casos, a ausência de qualquer definição desse tipo implica a preeástência de um padrão de relacionamento geral. mente aceito, tanto para a Igreja quanto para a equipe missionária formada por Paulo.

À estrutura que chamamos “Igreja neotestamentária” é, portanto, um protótipo de todas as comunidades cristãs subsequentes: jovens e velhos, homens e mulheres reuniam-se da mesma forma em que famílias biológicas normais se agregam. No entanto, o grupo missionário de Paulo pode ser considerado um protótipo de todos os esforços missionários posteriores organizados por obreiros fiéis e experimentados, que tomaram uma segunda decisão: participar da segunda estrutura, embora continuassem a ser membros da primeira.

Observe bem o compromisso adicional. Veja também que a estrutura resultante foi definitivamente maior que o amplo esforço evangelístico

que os de Jerusalém se para presta entra “na vossa sinagoga”. O termo empregado por Tags

126-7.

“Dynamic Equivalence Churches, Missiology: An International Reviero, v. 1, 0.1, 1973, p. 39ss. (Os cristãos, como se diz, recorriam à formação de “clubes de sepultamento”, que eram legais como meio para comu-

Raiph D Winter da igreja de Antioquia. Opiniões pessoais sobre “a estrutura de Antioquia não importam. O fato é que não se tratava simplesmente da igreja de Antioquia agindo a distância, era algo dife-Tente, Consideremos a equipe missionária como à segunda das duas estruturas redentoras no período do Novo Testamento.

Em resumo, é importante observar que nenhuma das duas estruturas, por assim dizer, “desceu do céu”. À princípio, pode parecer chocante que Deus fizesse uso do padrão judaico de sinagoga ou de evangelismo, mas isso não deve surpreender mais que o fato de Deus haver empregado a língua pagã grega, guiando osescritores bíblicos pelo Espírito Santo a empregar termos como kyrios (originariamente um termo pagão) e moldando-os de forma a transmitira revelação cristã. O Novo Testamento refere-se a uma sinagoga dedicada a Satanás, mas isso não significa que os cristãos, para fugir a tal padrão, não pudessem se reunir de acordo com o modelo da sinagoga. Essas considerações nos preparam para o que vem a seguir na históriada expansão do evangelho, porque vemos em data posterior outros padrões escolhidos pelos cristãos, cujas origens foram igualmente “padrões tomados de empréstimo”, como no período do Novo Testamento.

Na verdade, a implicação missiológica profunda de tudo isso é que o Novo Testamento está tentando nos mostrar como tomar emprestado padrões eficazes e libertar os futuros missionários da necessidade de seguir a forma exata dasinagoga judaica e da equipe missionária judaica, permitindo que escolham estruturas autóctones equivalentes nas inúmeras situações com que irão deparar ao longo da história da Igrejae ao redor do mundo. Essas estruturas irão corresponder fielmente à função dos padrões que Paulo empregou, se não à sua forma! Não é deadmirar que um volume considerável de literatura missiológica dos dias de hoje ressalte o fato de o cristianismo ter empregado as diversas línguas “o nhãoe culto,

247 e culturas existentes na comunidade humana de todo o mundo mais que qualquer outra religião e, ao fazê-lo, ter abandonado todos os esforços de canonizar como universal qualquer expansão formal e mecânica da Igreja do Novo Testamento. Como diz Kraft, procuramos a equivalência dinâmica, e não a cópia exata.* O desenvolvimento inicial das estruturas cristãs na cultura romana Vimos que o movimento cristão foi edificado sobre dois tipos diferentes de estruturas, que já existiam na tradição cultural judaica. Nossa tarefa agora é verificar se os equivalentes práticos dessas duas estruturas se manifestaram na tradição cultural romana quando o evangelho invadiu aquele mundo mais vasto.

Como é natural, o padrão primitivo da sinagoga manteve-se como estrutura cristã durante algum tempo. À rivalidade entre cristãos e judeus tendia, entretanto, a enfraquecê-la como padrão cristão e, em alguns casos, a eliminá-la, especialmente onde havia o risco de as congregações judaicas da Dispersão instigarem a perseguição pública contra as sinagogas cristãs, supostamente desviadas. Ão contrário dos judeus, os cristãos não tinham autorização oficial para uma alternativa ao culto imperial romano. Assim, enquanto cada sinagoga era consideravelmente independente das outras, o padrão cristão foi em seguida assimilado pelo contexto romano, e os bispos receberam autoridade sobre mais de uma igreja, com uma jurisdição territorial em nada diferente do modelo do governo civil romano. Essa tendência ficou bem confirmada quando o reconhecimento oficial do cristianismo causou impacto total: a própria palavra latina usada para designar a região sob a autoridade de um juiz romano foi tomada por empréstimo: “diocese”, que delimitava a área das paróquias.

De qualquer modo, embora o padrão mais “congregacional” da sinagoga independente

[E tosse cala vez dando lugar ao modelo romano “associativo”, a nova ugrçia paroquial cristã ainda mantinha a organização basica da sinagoga, isto é, à mescla de jovens e velhos, homens e mulheres a saber, um organismo biologicamente autoperpetuante.

Enquanto isso, a tradição monástica, em diversas formas primitivas, desenvolveu-se como uma segunda estrutura. À nova prolifera estrutura não tinha ligação alguma com a equipe missionária de que Paulo participou. Na verdade, era bascada substancialmente na estrutura mulitar romana, mais que em qualquer outra fonte isolada. O exemilitar Pacômio conquistou 3 mil discípulos e atraiu a atenção de indivíduos como Basího de Cesareia e, a seguir, por meio de Basílio, a de João Cassiano, que trabalhou no sul da Gália em data posterior.* Esses homens desenvolveram uma estrutura disciplinada, tomada principalmente de empréstimo dos militares, que permitia aos cristãos nominais uma segunda escolha um compromisso adicional específico.

Talvez seja prudente fazer uma pequena pausa aqui, Qualquer referência aos mosteiros produz um choque cultural nos protestantes. A Reforma protestante lutou desesperadamente contra certas condições infames predominantes nofimdo período medieval, que durou mil anos, “4 Nãoé nosso desejo negar o fato de as condições nos mosteiros nem sempre serem ideais. O que os protestantes em geral sabem acerca dos mosteiros talvez seja correto no que diz respeito a certas situações, mas o estereótipo protestante popular certamente não pode descrever com precisão tudo que aconteceu naqueles mil anos! No decorrer dos séculos houveram períodos distintos e uma larga variedade de movimentos monásticos radicalmente diversos uns dos outros, conforme veremos a seguir. Qualquer generalização sobre um fenômeno tão vasto está fadada a ser mera caricatura, preconceituosa indigna de confiança.

Kenneth Scott Latourerte, 4 History cf Christianity (New

“Kenneth Latourerte, (New York:

AN AS MÃO rede Dus Apresentarei apenas um exemplo de como nossos estereótipos protestantes podem estar errados. Ouvimos falar com frequência de que os monges “fugiam do mundo”, Compare essa ideia com a descrição a seguir, feita por um erudito missionário batista: A regra beneditina e as muitas outras deriva das dela provavelmente ajudaram a dignificar o trabalho, até mesmo o trabalho braçal nos campos, Esse conceito representava o contraste absoluto com a ideia aristocrática da condição servil do trabalho manual, predominante em grande parte da sociedade antiga e adotada também pelos guerreiros e pelos relugiosos não monásticos, os quais constituíam a classe média alta da Idade Média Aos mosteiros obviamente se devia grande parte do cultivo das terras e o desenvolvimento dos métodos agrícolas, No ambiente do barbarismo, os mosteiros eram os centros da vida ordeira e organizada, e os monges eram incumbidos da construção reparos das estradas, Até o advento das cidades, no século XI, eles foram os pioneiros da indústria e do comércio. As oficinas dos mosteiros preservaram as atividades industriais do Império Romano O uso primitivo do calcário argiloso para melhoria do solo é atribuído a eles, As grandes ordens monásticas francesas lideraram a colonização agrícola da Europa ocidental. Os cistercienses, em especial, fizeram de suas casas centros de agricultura e contribuíram para o desenvolvimento dessa ocupação. Com seus irmãos leigos e trabalhadores contratados, eles se tornaram grandes proprietários de terras, Na Hungria e na fronteira alemã, os cistercienses foram particularmente importantes na conversão do solo em terra cultivável e no incremento à colonização. Na Polônia, também os mosteiros germânicos estabeleceram padrões avançados na agricultura e introduziram o artesanato.” York: Harper and Brother, 1953), p. 181, 221-34.

“Jerônimo e Agostinho e muitos outros mestres agora como o período medieval recuperou à examinaremos q advento formal das principais Podemos dizer que o perísdo medocçal verve “estruturas monásticas. Basta por ora observar início quando Impéria Raras do acidente teiro ambos significativos ns transmissão e govemo civil de Roma, rexudus, é mucsma éno-

D.Mintes, The Warp amê tive Wioat ct tire Churistiaes Mrosemosr, dm: Raligin WWamsor E. Porox Ibeaver

Para os líderes missionários, o desmoronar do estereitipo “os monges fugiam do mundo" é. ainda mais dramática e decisivamente fortalecido pelo magnífico registro dos peregrinos irlandeses, monges celtas que fizeram mais para conver-— ter ox anglo saxões que a missão de Agostinho e contribuíram mais para a evangelização da Exropa ocidental e até mesmo da Europa central que qualquer outra força crista.

Desdeo princípio, essa segunda estrutura foi significativa para a expansão do movimento cristão. Embora os protestantes tenham adquirido um preconceito inato contra ela, por diversos motivos, como fá vimos, não podemos negar o fato de que sem essa estrutura seria difícil tmaginar até mesmo a continuidade vital da tradição cristã através dos séculos. Os prorestantes ficam igualmente consternados com a outra estrutura paroquial e diocesana. Na verdade, a relativa fraqueza e a superficialidade da estrutura diocesana é que tornam a estrutu“ra monástica tão significativa, Homens como Jerônimo e Agostinho, por exemplo, não são considerados monges pelos protestantes, e sim grandes eruditos, e teólagas como João Calvino apoiaram-se fortemente nas obras desses monges. Entretanto, os protestantes em geral “não dão qualquer crédito à estrutura na qual monásticos trabalharam, sem a qualo labor protestante teria muito pouco alicerce sobre que edificar, pois nem mesmo teria a Biblia.

Acompanhemos agora o desenrolar desses acontecimentos no período seguinte, onde que já havia, Há pelo século IV, dois tipos muito diferentes de estruturas a diocese e o mostamente como a smagoga crustã primitiva co

É. aínda mais importante para nosso propósito observar que, embora as duas estruturas medievais sejam formalmente diversas das duas estruturas da época do Novo Testamento e his toricamente não tenham relação com estas, aínda assim são funcionalmente as mesmas, À fira de analisar convenientemente as semelhanças de funcionamento que contimuam a existir, vamas chamar “modalício” à sinagoga e a dincese, enquanto à equipe missionária é ao mosteiro chamaremos “sadalício”, Modalício é à comunidade estruturada na qual não há distinção de sexo ou de idade, enquanto sodalício é à comunidade estruturada da qual só pode ser mem bro o adulto que tomou uma segunda decisão, além da que o tornou membro do modalício. A filiação ao sodalício, portanto, está limitada à idade, ao sexo ou ao estado civil, Nesses termos, tanto a denominação quanto a igreja local são modalícios, enquanto a agência missionária ou o grupo de homens crentes que se reúne regularmente com determinado propósito são sodalícios.!

Nesse período pós-bíblico inicial havia pouca relação entre modalício é sodalício, enquanto na época de Paulo sua equipe missionária especificamente nutria as igrejas, 6 que constitua uma simbiose bastante significativa. Veremos saudável relacionamento neotestamentário entre o modalício e o sodalícia. A síntese medieval do modalício e do sodalício

o começou a desmoronar Até certa pomtis, pá dirão dinvesma, pela fara de engusr a muadela des cum resultado, osmgunssas massor imqrontêmeis

(cristianismo diwcesano) ficou mais comprome- nescente da “igreja” celta na Inglaterra era voss Gregório pediu ao seu amigo Agostinho que lício, alcançada pela Igreja Romana, talvez seja tura para realizar essa missão, não ser so- modalício, seja do sodalício, fosse campeã pebastante perigosa, fim de cumprir aquela im- cristão, quer na forma de modalício, quer na de portante missão em nome do papa. O curioso sodalício. (A lista dos bispos em Roma é, em

(O 250 de outra forma. À sobrevivência do modalício tida porque os invasores do primeiro período medieval geralmente pertenciam a um ramo diferente da fé cristã eram arianos. Assim, em muitos lugares eram encontrados os dois tipos de igreja cristã: a “ariana” e a “católica”, em esquinas opostas na rua principal algo parecido com o que acontece hoje, quando temos igrejas metodistas e presbiterianas, uma diante da outra na mesma rua,

Repetimos, no entanto, que não pretendemos desmerecer a forma paroquial ou diocesana do cristianismo, apenas destacar que nesse periodo da época medicval as casas especializadas chamadas “mosteiros”, ou seus equivalentes, vieram a ser muito mais importantes na perpetuação do movimento cristão que o sistema organizado de paróquias, que frequentemente chamamos “igreja”, como se não houvesse nenhuma outra estrutura constituindo a igreja.

Talvez a ilustração mais notável da importância do relacionamento entre o modalício e o sodalício do primeiro período medieval seja a colaboração entre Gregório, o Grande, eo homem mais tarde chamado Agostinho de Cantuária. Embora Gregório, como bispo da diocese de Roma, fosse o dirigente de um modalício, tanto ele quanto Agostinho eram produto de casas monásticas fato que reflete a predominância já existente do padrão do sodalício na estrutura cristã. De qualquer modo, implantar ali a estrutura diocesana, pois o cristianismo celta fora profundamente prejudicado pela invasão dos guerreiros saxões.

Por mais forte que fosse Gregório em sua

a o dalício, na época um mosteiro beneditino. Por isso, pediu a Agostinho e a outros membros do mesmo mosteiro que empreendessem a viagem,

a é que o propósito da missão não era ampliara

As duas estruturas da missão redentora deem forma beneditina do monasticismo. O sema rede de sodalícios, uma vez que simplesmns não existia o sistema paroquial na área cla Agostinho foi à Inglaterra a fim de estabelecer o cristianismo diocesano, embora ele mesma não fosse um sacerdote diocesano.

Esse tipo de trabalho é bem característico Durante um longo período de tempo, talvez roi anos, à construção e a reconstrução dos moda lícios foram quase sempre obra de sodalicios Equivale a dizer que os mosteiros foram a foste eo ponto real de convergência da nova encrgs e da vitalidade que fluíam para o lado diocesano do movimento cristão. Pensamos na momentos reforma de Cluny, depois na dos cistercienses, então na dos frades e, por fim, na dos jesuítas

todas promovidas por sodalícios, mas que contribuíram maciçamente para a construção e reconstrução do corpus christianum, à rede de dioceses que os protestantes costumam identificar como “o” movimento cristão.

Havia rivalidade entre as duas estruturas, em muitos pontos: entre o bispo e o abade, diocese e o mosteiro, o modalício e o sodalicio. A grande conquista do período medieval fo: a síntese definitiva, delicadamente elaborada, mediante a qual as ordens católicas podiam fuzcionar lado a lado com as paróquias e dioceses católicas, sem que as duas estruturas entrassem em conflito e causassem algum recuo no mowimento. A harmonia entre o modalício e o sodamovimento mundial cristão, e continua sendo a mais importante vantagem organizacional de Roma até os dias de hoje.

Observe, entretanto, que não é intenção

a rene de vitalidade durante a época medieval Na realidade, não existe nenhuma continuidade organizacional impressionante no movimento muitos aspectos, uma construção pouco com

Sé chamado de crentes”

PT. fiávele, infelizmente, não apresenta um ponto sequer de convergência para o movimento cristão como um todo.) No entanto, está claro que o sodalício, conforme recriado muitas e muitas vezes por diferentes líderes, foi quase sempre a força motriz, a fonte de inspiração e renovação que transbordou do papado e criou os movimentos reformistas que abençoaram o cristianismo diocesano de tempos em tempos.

O exemplo mais significativo é a subida de Hildebrando (Gregório VII) ao trono papal, que introduziu no próprio Vaticano os ideais,a dedicação e a disciplina do movimento monástico, Nesse sentido, não seria então o papado, com o Colégio dos Cardeais, a diocese e a estrutura paroquial da Igreja Romana, em algunsaspectos, um elemento secundário, uma derivação da tradição monástica, e não o contrário? Seja qual for o caso, parece apropriado que os sacerdotes da tradição monástica sejam chamados “padres regulares”, enquanto os sacerdotes da diocesee da paróquia pad sejam denominados “padres seculares”. Anúales são voluntariamente regidos por usa regula, enquanto estes constituem um grupo diferente, “fora de” ou “cortado de”, algo inferiores é às comunidades de pessoas que tomaram uma segunda decisão e são regidas pelas regras. secularização” dessa entidade. Na prolongada administração semiautônoma pelo menos, e a Secularização das ordens ficou afastada.

Podemos observar que o perigo estrutural da secularização ainda existe. Está presente sempre que os interesses especiais de uma associação religiosa missionária de elite (sodalí-So) passa para o domínio total de um governo eclesiástico, uma vez que o modalício cristão (as igrejas) inevitavelmente representa os in“teresses mais amplos e, sem dúvida, internos de um grande grupo composto por todos os típos de cristãos, os quais, como membros que

tomaram apenas a “primeira decisão”, são em geral menos exigentes.

Não podemos deixar o período medieval sem nos referirmos aos muitos movimentos não oficializados e geralmente perseguidos que também caracterizaram essa época. À Bíblia talvez seja nisso tudo o primeiro e principal propulsor, como vemos no caso de Pedro Valdo. Sua obra permanece como uma demonstração poderosa do poder simples de uma tradução vernacular da Bíblia, numa situação em que o povo era incapaz de compreender a tradução clássica de Jerônimo ou a celebração da missa em latim. Havia muitos grupos chamados “anabatistas

muitas partes da Europa. Uma das caracferísticas principais desses movimentos de re-POVAÇÃO é qe eles não ão produzir uma simples pasticipaçã o celibatária, embora fone UMA de nuas ORSRASNENIENARO IENINAIRDDA FRA A geraá ponsa doopaniviam enunaidados

de extnços Pres Homufiias, entendo, pola transmissão biológica e cultural, preservar uma forma elevada e esclarecida de cristianismo. sir ara clico nfreatavam epa ção so forte

ações tio sérica quua sara iequso ve julgar seu vigor pelo seu progresso. Contudo, é importante observar que as comunidades menonitas

À

“uma igreja e constitui

experimento significativo na estrutura cristã. a sf ti do bora

a pç (envolvendo famílias inteiras) e, ainda assim, em seus primeiros anos, pode ter a vitalidade ca seletividade de um sodalício. Retornaremos q esse fenômeno na próxima seção.

Temos aqui espaço apenas para destacar que o período medieval de mil anos não pode ser considerado à parte do papel desempenhado pelos sodalícios, em termos de durabilidade e qualidade da fé cristã. O que aconteceu em Roma é apenas a ponta do iceberg, quando muito, e representa um nível bem superficial e

O polsuco. Ele apresenta marcante contraste com às fontes fundamentalistas de estudo bíblico e obediência radical encontradas nos diversos sodalicios desse milénio momentoso. A redescoberta protestante dos sodalícios Em sua fase inicial, o movimento protestante tentou sobreviver sem qualquer tipo de estrutura de sodalício. Desagradava a Martinho Lutero à visível polarização existente entre a vitalidade que descobrira em sua ordem monástica a vida paroquial insincera de sua época. Insatisfeito com essa separação, ele abandonou o sodalício no qual encontrara a fé e aproveitou-se das forças políticas de seu tempo para lançar um movimento de renovação integral da vida eclesiástica. À princípio, ele até tentou omitira estrutura característica da diocese romana, porém o movimento luterano acabou produzindo uma estrutura diocesana que representou, em grande parte, o reaproveitamento da tradição diocesana romana. O movimento luterano, entretanto, não restaurou os sodalícios, isto é,as ordens católicas, que haviam sido tão proeminentes na tradição romana.

Creio que essa omissão representa o maior erro da Reforma e a maior fraqueza da tradição protestante que dela resultou. Não fosseo mo-. vimento pietista, os protestantes teriam ficado desprovidos de qualquer estrutura organizada dentro de sua tradição. À tradição pietista,em A” cada nova manifestação de sua força, foi sem dúvida alguma um sodalício, visto que era um caso de adultos se reunindo e se dedicando a Ps novos começos e a objetivos mais elevados como cristãos, sem entrar em conflito com as reuniões já programadas da igreja existente. O fenômeno do sodalício que alimenta o modalício é notável no caso do trabalho inicial de John Wesley. Ele proibiu de maneira absoluta o abandono das igrejas paroquiais. Um exemplo contemporâneo é o amplo e influente avivamento da África Oriental, que já envolveu até agora um milhão de pessoas, mas que tem evitado qualquer choque com o funcionamento das igrejas locais. Por sua vez, as igrejas que não lutaram

As duas estruturas da missão redentora de Des, contra esse movimento têm sido grandemente abençoadas por ele.

O movimento pretista e as novas comunida des anabatistas, contudo, acabaram retornando ao nível do crescimento biológico, revertendo o modelo comum de vida congregacional. Ele regrediu do nível do sodalício para o do modalício e na maioria dos casos tornou-se muito depressa ineficiente como estrutura missionária ou como força de renovação.

O que mais nos interessa é o fato de que, falhando na exploração da potencialidade dos sodalícios, os protestantes não dispuseram de nenhum mecanismo para as missões por quase trezentos anos, até que William Carey propusesse “o uso de meios para a conversão dos pagãos”. À palavra-chave “meios” refere-se à necessidade de um sodalício, de uma iniciativa organizada, mas não eclesiástica, de pessoas interessadas. Assim, a Sociedade Missionária Batista, resultante dessa iniciativa, constitui um dos avanços organizacionais mais significativos da tradição protestante. Ela desencadeou o uso cada vez maior de “meios” para a conversão de pagãos e encontramos nos anos que se seguiram um grupo de sociedades organizadas em moldes semelhantes: LMS e NMS em 1795, CMS em 1799, CFBS em 1804, ABCFM em 1810, ABMB em 1814, GMS em 1815, DMS em 1821, FEM em 1822 e BM em 1924 12 sociedades em 32 anos! Depois que esse método de atuação foi claramente compreendido pelos protestantes, 300 anos de energias latentes explodiram no que veio a ser, na expressão de Latourette, “o Grande Século”.

O século XIX marca o início das atividades missionárias dos protestantes. Pormotivos que o espaço não permite explicar, foi também o século de maré mais baixa da energia missionária católica. De modo espantoso, os protestantes, nesse único século, edificando sobre a expansão mundial sem precedentes do Oadente, igualaram-se aos 18 séculos de esforços missionários anteriores. Não há dúvida de que as realizações nesse século fizeram a corrente protestante transformar-se de simples remanso

esmopeu,i mpotente e fechado, em potência eristã mundial, Olhando para trás, do ponto em que nos encontramos hoje, é difícil crer que o movimento protestante tenha começado a se destacar há tão pouco tempo.

Contudo, em termos de organização, o ve-Sculo que permitiu ao protestantismo tornar se vital foi o desenvolvimento da estrutura dos sodalícios, que aproveitou o “voluntarismo” vital Aatente no protestantismo, vindo à superfície na forma de novas agências missionárias de todos os tipos, nacionais e estrangeiras. Verdadeiras ondas de iniciativas evangélicas transformaram o mapa do cristianismo, especialmente nos Estados Unidos, mas também na Inglaterra e em grau menor na Escandinávia e no continente europeu. Por volta de 1840, o fenômeno dos sodalícios missionários era tão notável nos Estados Unidos que a expressão “império evangélico" e outras equivalentes foram usadas para se refesir a ele, dando início a uma pequena oposição eclesiástica contra essa nova e luminosa maniestação da segunda estrutura. Isso nos levaao próximo ponto. O mal-entendido contemporâneo acerca do sodalício Quase todos os esforços missionários do século XIX, patrocinados por juntas interdenominacionais ou denominacionais foram substancialmente fruto de iniciativas no geral independentes das estruturas clericais ligadas pa elas. Na metade final do século XIX, duas tradições estruturais separadas pareciam destacar-se cada vez mais,

De um lado, surgiram homens como Henry Venne Rufus Anderson, pensadores estratégicos afrente das sociedades mais antigas a Church Missionary Society, da Inglaterra, e a American Board of Commissioners for Foreign Missions, respectivamente, Estes homens foram os gran«des defensores dos sodalícios semiautônomos, adotando uma atitude que não foi a princípio sontestada por nenhum grupo significativo de líderes das estruturas eclesiásticas. Do outro lado, achava-se a perspectiva centralizadora

dos líderes denominacionais, principalmente os presbiterianos, que ganharam terreno quase sem nenhum contratempo nos últimos 65 anos do século XIX. No começo do século XX, portanto, as estruturas antes independentes, apenas igadas às denominações, passaram a ser gradativamente dominadas pelas igrejas, Como resultado parcial, Já pelo fim do século XIX, houve uma nova explosão de sodalícios, totalmente separados, chamados “missões de fé”, com a Missão ao Interior da China de Hudson Taylor na liderança. Esse padrão foi principalmente um ressurgimento do modelo estabelecido no início do século, antes da tendência que levou à formação das juntas denominacionais, mas isso não é totalmente reconhecido.

Todas essas mudanças aconteceram lentamente. É sempre difícil impor atitudes, mas parece claro que os protestantes sempre se sentiram um tanto inseguros quanto à Jegitimidade da segunda estrutura, o sodalício. À tradição anabatista enfatizava de modo consistente o conceito de uma comunidade pura de crentes e não se interessou então pelo voluntarismo que viesse a envolver apenas parte da comunidade crente. As denominações americanas, por sua vez, que não recebiam a verba dos impostos religiosos, como ocorria no continente europeu, eram geralmente comunidades mais seletivas e mais vígorosas que as igrejas estatais europeias, Pelo menos em sua exuberância juvenil, sentiam-se muito capazes, como denominações, de proporcionar toda a iniciativa necessária para as missões estrangeiras. Essa é a razão de as muitas denominações novas dos Estados Unidos se inclinarem a agir como se o controle eclesiástico centralizado dos esforços missionários fosse o único padrão correto,

Em vista disso, uma reformulação quase total ocorreu na maioria dos esforços missionários relacionados com as estruturas denominacionais, por ocasião da Segunda Guerra Mundial. Isto é, quase todas as juntas denominacionais mais antigas, embora antes semiautônomas ou quase independentes, passaram a fazer parte das provisões orçamentárias unificadas, e assim por

de de sodalícios exerceu trágica membros CERA igreja participem iniciativas on aisbpior depo rirnndo da bi rs sabe

O diante. Ao mesmo tempo, em parte como resultado dessa mudança, um novo grupo de estru-Mundial. Como no caso anterior das missões de fé, as novas missões tendham a dar pouca atenção para a centralização das missões na igreja.

“A Igreja Anglicana, com suas sociedades missionárias, representa a síntese medieval e assim, quase inconscientemente, também as sodora. Até hoje, existe grande confusão entreos protestantes a respeito da legitimidade e do re-

À cegueira protestante quanto à necessida-

missionários ainda mais peça a situação. Às missões protestantes, a presumir que la, apenas esse modelo deveria a ser estabelecido, isto é, AA igrejas. Mesmo nos casos em semiautônomos, é o modalício, e não o sodalício, em sua obra missionária, a estabelecer igrejas, e (missionárias) que não fizeram parte da tradição protestante durante séculos e sem as quais não teria havido iniciativa missionária, mesmo assim parece não perceber o significado da própria eles simplesmente fundaram igrejas, mas não se preocuparam o bastante para garantir queo tipo de estrutura missionária no qual trabalham também seja estabelecido no campo. Na verda-

1 de, muutas das agências missionárias fendadas após a Segunda Guerra Mundial, em vista de ros, nem sequer tentaram estabelecer sgresas durante muitos anos trabalharam apenas como tentando ajudar as igrejas que já existiam.

A pergunta a ser feita é: quanto tempo irá «e passar até que as igrejas mais jovens dos chamados territórios missionários do mundo não (3 qual o movimento protestante na Europa «pesou tarde demais)? Isto é, quando irão perceos da de

CSPE PE transculturais? Alguns sinais de esperança já

ai à não será muito maior. Temos um exemplo disso na obra notável da Fraternidade Melanésia, nas “lhas Salomã Ele presume a necessidade e a importância da tornam claro que Deus, por meio de seu Santo Espírito, clara e consistentemente usou outra estrutura além do modalício (e, às vezes, apesar dele). Tentamos ajudar aqui os líderes eclesiástias estruturas e a necessidade não só de existirem, mas de trabalharem juntas e em harmosia, para o cumprimento da Grande Comissão e de tudo que Deus deseja para nossa época.

Rego O winter O O caseira o e e o o

Perguntas para estudo Defina Smodalício” e “sodalício” e dê exemplos de cada um. 2 Você concorda com a tese de Winter de que as estruturas de sodalicio dentro das igrejas são o legítimas é necessárias? Qual o significado prático de vua resposta? 3. Explique a importância de se saber distinguir entre forma e função, De acordo com Winter, qual foi “o maior erro da Reforma e à maior fraqueza da tradição protestante que dela resultou”? Ú', 33 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Tson, cap. 28: Sofrimento e martírio — a estratégia de Deus no mundo', 'a estratégia de Deus no mundo

Sofrimento Bo] RA os

JOSEF TSON foi presidente da Sociedade Missionária Romena e é fundador do Instituto Bíblico Oradea (atualmente conhecido como Instituto Bíblico Emmanuel), na Romênia.

aa e martírio:

Josef Tson pet esus Cristo, o Rei dos reis e Senhor dos senhores, faz convo-

e exige dedicação total a ele, Nada deste mundo pai, mãe, marido, esposa, filho, filha, bens materiais deve ficar entre ele e seus filhos, Jesus espera que os convocados aprendam dele e se tornem semelhantes a ele, depois os envia pelo mundo como seu Pai o enviou, para que divulguem sua mensagem e sejam suas testemunhas. Ele sabe que o mundo odiará suas testemunhas se voltará impiedosamente contra elas. Entretanto, ele espera que esses enviados reajam ao ódio com amor e enfrentem violência, aceitando-a com alegria. Devem seguir seu exemplo, sofrendo e morrendo pelo mundo perdido, O sofrimento e o martírio são motivados pela fidelidade a ele e suportados para o propósito da expansão do evangelho. Os discípulos de Cristo não buscam nessas coisas benefícios próprios nem infligem a si mesmos esses sofrimentos. Seu objetivo não é sofrer e morrer: é a pessoa de Cristo e a causa de Cristo no mundo, a expansão de seu evangelho.

Sofrer por Cristo não é apenas sofrer perseguição. Começa quando alguém deixa seus parentes próximos para servir a Jesus, Para alguns, significa vender seus bens e dá-los aos pobres, o que muitas vezes significa doá-los para a propagação do evangelho. Para outros, sofrer por Cristo pode significar afligir-se em oração ou afligir-se e batalhar para a edificação do Corpo e o aperfeiçoamento dos santos. Mais uma vez, para esclarecer esse conceito, sofrer por Cristo não é um sofrimento infligido pela própria pessoa. O discípulo de Cristo procura fazer a vontade de Cristo e promover sua causa. Sofrer por Cristo, porém, significa, sim, que o discípulo se envolverá voluntariamente em sofrimentos e viverá uma vida de sacrifício por Cristo e seu evangelho.

Além disso, o discípulo de Cristo pensa como escravo; está totalmente à disposição e do Mestre. É o Mestre quem decide que tipo de serviço o discípulo irá realizar, O primeiro dever do discípulo, portanto, é descobrir a vontade do Mestre e cumpri-la com alegria e paixão. Se o discípulo cumprir seu dever, seu Mestre estará sempre com ele, vivendo nele e através dele para realizar os propósitos divinos.

O martírio é a missão de Deus a alguns de seus eleitos, os quais literalmente devem morrer pelo bem de Cristo e de seu

ESTES ED ESSE IES TETE PRI EITA IES oa Deparei com extrema pobreza e sofrimento durante meu ministério no período da guerra em Angola. Fiquei mais próxima do havia perdido maioria dos familiares, de mulheres haviam sido estupradas de forma cruel e estavam machucadas por dentro e por fora. O povo vivia sem nenhum conforto: sem lençóis, sem sabão, comida escassa e ruim, muitas vezes sem suprimentos de remédios para fraturas, sem visitas de futuro. Em algumas ocasiões, achei-me também doente incapaz Antônia L. Van der Meer (Tonica) é diretora da Escola de Missões do Centro Evangélico de Missões (CEM). Serviu como o ministério entre universitários, lecionando em escolas bíblicas e fazendo capelania hospitalar. Doutora em missiologia

Extraído de seu artigo em William D. Taylor (Org.), Missiologia global (Londrina: Descoberta, 2001), p. 215. Usado

G 202 evangelho. Pelo que vemos nas Escrituras, parece existir um número determinado de filhos de Deus predestinados por ele para esse sacrifício supremo. Para alguns, o martírio pode ocorrer num processo rápido, como ser baleado ou decapitado, mas para outros pode ser precedido de tortura. Deus pode ter em seu plano um longo martírio de labutar num campo de trabalho ou a miséria e a dor de um longo período de prisão. Numa situação como essa, mesmo que o cristão seja libertado e sua morte ocorra em casa, em razão dos problemas de saúde resultantes do longo tempo de detenção e sofrimento, creio que Deus ainda considera tal morte um martírio. Na sociedade atual, mais sofisticada, o martírio pode significar a internação forçada num hospital psiquiátrico uma forma moderna de tortura e talvez a forma mais cruelde martírio, pois a saúde mental da pessoa e até sua personalidade são destruídas por meio de drogas e outros suplícios psicológicos.

Deus faz todas as coisas com um propósito. Se ele escolhe chamar seus filhos para o sofrimento e o sacrifício da própria vida, deve ter propósitos muito importantes a realizar por E meio deles. Por isso, é dever dos filhos obede-. A cer ao Pai, mesmo quando não compreendem

propósito ou a lógica por trás de sua ordem. Contudo, ele deseja que seus filhos desenvolvam uma mente como a dele. Portanto, ele já revelou sua mente, seus propósitos e seus métodos aos Pobreza e sofrimento

parentes, sem esperança para o assessora da Aliança Bíblica Universitária do Brasil. Trabalhou pela Asia Graduate School of Theology, publicou o livro Eu, com permissão.

Sofrimento e martírio: a estratégia de Deus no mundo seus filhos por meio de sua Palavra escrita e na Palavra encarnada.

Deus interferiu na História quando enviou seu Filho encarnado como Escravo sofredor, que terminaria sua vida terrena com tortura e martírio. Nesse episódio, Deus nos revela que o sofrimento e o sacrifício de si mesmo representam o método divino de resolver os problemas da rebelião, da maldade e do pecado do ser humano. O sacrifício de si mesmo é o único método coerente com a natureza divina. Por exemplo: Deus não pode reagir ao ódio com ódio, porque seo fizer estará adotando não somente o método, mas também a natureza daquele que é o criador do ódio: o Diabo. Deus só pode corresponder com amor, porque ele é amor. Sofrendo e sacrificando-se por aqueles que o odeiam, ele demonstra a essência da divindade.

Os que são nascidos de Deus tornam-se participantes da natureza de Deus (2Pe 1.4). Portanto, os filhos de Deus são chamados para resolver os problemas deste mundo com o amor ágape, que é a natureza divina (1Jo 4.4-21). Mais que isso, Cristo uniu-se aos seus irmãos numa união comparável à sua união com o Pai (Jo 17.21-26). Cristo vive neles e continua a sua obra no mundo por meio deles, mas não mudou a estratégia que usava quando estava no mundo. Seu método ainda é o método da cruz. Com isso em mente, Cristo disse aos seus discípulos que os enviaria ao mundo

Antônia Leonora Van der Meer

e durante dez anos em Angola e Moçambique, implantando missionário? diversos artigos.

de dormir, mas sabia que precisava fazer algo, compartilhar o amor de Deus com eles, orar, ler a Palavra de Deus e ouvir as histórias tristes daquele povo. Eu levava sabão para um, uma toalha para outro, um pouco

Era importante que pessoas soubessem que eu estava disposta ouvir ajudar, Eles não esperavam é que eu resolvesse todos os seus problemas, mas em resposta 305 meus anseios, muitos creram: órfãos jovens que serviram como soldados contra a própria vontade mulheres. Notava-se transformação na face

o estado mórbido da desesperança. Muitos descobriram uma profunda alegria, esperança e significado em sua vida quando entenderam o amor de Deus por eles. Eles entende-

que eram meros Sei que à guerra é de fato um grande mal, sei também que graça Deus pode manifestar-se em cada um em cada contexto.

Em outras palavras, ele os enviou nas mesmas condições, para vencer pelo mesmo método, isto é, o método da cruz. Por essa razão, Jesus pediu que cada um tomasse a própria cruze seguisse seu exemplo, indo por todo o mundo a pregar o evangelho (testemunhar), servir os outros e morrer pelos outros. À cruz represento envolvimento sacrifical voluntário no cumprimento dos propósitos do Pai para com a humanidade, A

Três o coisas básicas ad são conquistadas pela morte dos mártires: ad

É id died E E E a derrota de Satanás;

A a glória sria de De or ô martírio a vitória da verdade de Deus E O mundo não resgatado pofie de cegueira epi" ritual. Os olhos dos incrédulos estão obscurecidospor Satanás, daí a aversão à luz da verdade. Para quem vive há muito tempo na escuridão, suma luz radiante que resplandeça de repente pode causar-lhe dor. Ele não suporta a luz. Odeiaaluze fazo possível para destruí-la Jesus explicou a reação da humanidade à sua vinda ao mundo nesses termos (Jo 3.19,20) e disse aos seus discípulos que esperassem exatamente o mesmo tratamento, de grãos para outro ainda uma xícara de água no é disposto a corresponder ao amor de Deus.

as É deles. Um sorriso alegre substituía ram que eram ainda capazes de servir, não

de pessoas neste planeta considera sua religião um de seus tesouros mais preciosos. Por isso, dizer a eles pus fé está errada su qu não é verdadeira usasse ums ofensa imperdoável para eles. À tentativa de vadias eua religião é recebida É cos um ataque à sua identidade nacional”. por isso que os missionários cristãos são recebidos com hostilidade e essa aonde quer ir cheguem com o evangelho. sua parte, o missionário deve estar convencido de que a população para a qual está levando a Palavra vive é na mentira de Satanás e, em consequência do disso, está condenada ao inferno. Se o missionário não estiver convencido disso não arriscará sua vida para acender a luz no meio a deles.

Todavia, quando o embaixador de Cristo fala a verdade em amor e enfrenta a morte com alegria, algo estranho, um milagre acontece: os olhos dos incrédulos são abertos, e eles conseguem enxergar a verdade de Deus. Isso os leva a crer no evangelho. Desde que os olhos do centyrião foram abertos no Calvário, desde que ele creu que Jesus era o Filho de Deus porque havia presenciado sua morte (Mc 15.39), milhares de mártires cristãos pelos séculos têm produzido os mesmos resultados. Era o que Tertuliano tinha em mente quando escreveu que o sangue dos mártires é semente da qual nascem novos convertidos. Inúmeras pessoas neste planeta já deserto. O povo, porém, estava desejoso de ouvir e

parasitas sociais.

De deram testemunho de que as trevas que haviam sobre elas foram dissipadas depois queum missionário foi morto, No entanto, incontáveis regiões e povos do mundo hoje experimentam uma cegueira que só será superada depois que muitos cristãos tiverem entregado a própria vida em martírio. O martírio e a derrota de Satanás Jesus entendia sua vinda a este mundo como uma invasão à casa de um homem forte para roubar seus bens (Mt 12.29). A morte de Jesus teria como resultado a expulsão do príncipe deste mundo (Jo 12,31-33), e a mesma consequência teria o ministério de seus discípulos (Le 10.17-19). Jesus os ensinava a não temeros que podiam matar apenas o corpo, e os exortava a perder corajosamente a vida para obter a vitória (Mt 10.26-39). Por isso, João estava simplesmente seguindo os ensinamentos do Senhor quando descreveu a derrota e a expulsão de Satanás por meio da morte dos mártires, em Apocalipse 12,9-11,

Satanás tem duas ferramentas com as quais bo mantém o ser humano em cativeiro e na escravidão. Sua primeira ferramenta é o pecado. O pecado é o “certificado de propriedade” de Satanás, mas esse documento foi pregado na cruz do Calvário e cancelado pela morte de Cristo (C1 2.14,15). À segunda ferramenta de Satanás é o medo da morte (Hb 2.14,15). Mais uma vez, pela sua morte, Jesus eliminou o medo da morte. Quando os mártires enfrentam amorte sem temor, a última ferramenta de Satanás é inutilizada, e ele é subjugado e derrotado.

Como enganador das nações, Satanás conserva o ser humano em escravidão mantendo-o na cegueira do engano, Quando, por meio dos mártires, a verdade de Deus resplandece entreas nações, os que viviam no cativeiro das trevas reagem e se voltam para Deus. A morte dos mártires abre os olhos dos incrédulos e, quando veem a luz, o poder de Satanás sobre eles é extinto, Temos muitas outras provas dessa realidade nolivro do Apocalipse, onde vemos o conhecimento de Deus invadindo as nações como consequência

da morte dos mártires (Ap 11.1-19; 14.1-12; 15.2-4).Os mártires contribuirão para a derrota de Satanás, levando todas as nações a Deus por meio de seu testemunho e sua morte.

A história de Jó mostra outro aspecto da derrota de Satanás pela fidelidade do povo de Deus em meio ao sofrimento. À recusa de Jó em amaldiçoar a Deus demonstrou a toda a população do céu que Deus tinha verdadeiros adoradores na terra, provando assim que Satanás estava errado. O sofrimento de Jó foi visto pelas hostes do céu como um raro espetáculo. Parece que Paulo tinha a experiência de Jó em mente quando, ao falar do sofrimento dos apóstolos, disse que eles vieram a ser “espetáculo ao musdo, tanto a anjos, como a homens” (1Co 4.9).

Escrevendo da prisão acerca de seu munistério, Paulo diz aos efésios que os “principados e potestades nos lugares celestiais” agora têm 2 oportunidade de conhecer a “multiforme sabedoria” de Deus manifesta pela Igreja (Ef3.10). Paulo se refere à mesma sabedoria descrita em 1Coríntios 1.17-31. Esta é a sabedoria de Deus, que o mundo considera o máximo da loucura ele enviou seu único Filho para morrer numa cruz. À manifestação da sabedoria de Deus neste mundo, porém, não terminou com Cristo na cruz: ela continua em seus filhos quando eles obedecem à ordem de Deus de ir pelo mundo e sacrificar-se pela causa de Cristo. Quando vencem pela morte, os filhos de Deus demonstram a sua sabedoria a todo o Universo. Além disso, pelo testemunho e pela morte deles, Satanás é desacreditado e derrotado. O martírio e a glória de Deus Para Jesus, o resultado de sua crucificação cs consequente glorificação de sua pessoa era a glorificação de Deus (Jo 12.27-32; No entanto, a morte por crucificação eraum dos modos mais vergonhosos e bárbaros de execução. Como poderia tal morte glorificara Deus? À resposta torna-se clara quando vemos o que essa ação revelou ao mundo, No sofrimento vo-Juntário de Cristo para a salvação do homem, foi revelada a verdadeira natureza de Deus Sus

essência mostrou ser o perfeito amor, dando- O martírio tem o poder de revelar o amor de se total e incondicionalmente aos outros, até Deus aos que estão em trevas, Aí está o poder mesmo enfrentando a dor e a morte por eles. para convencer e persuadir: eles veem o amor de Aglória de Deus resplandece através da beleza Deus na morte do mártir e são constrangidos a e do resplendor do sacrificio de si mesmo como crer no amor e no sacrificio de Deus por eles. em nenhum outro lugar, e o mais importante; Paulo demonstra a mesma ideia no conceito de essa glória de Deus, a glória de seu amor sa- refletir a imagem de Cristo ou da glória de Deus erifical, resplandece em cada martírio. Por essa aos outros por meio do sofrimento e de nosso razão, João indica “com que gênero de morte sacrificio por amor aos outros (200 3.18; 4.1-Pedro havia de glorificar a Deus" (Jo 21.19). 15). Como o conhecimento de Cristo e da graça Eratambém a razão pela qual Paulo estava tão de Deus é espalhado cada vez mais através do determinado a glorificar a Cristo pela morte sacrificio dos filhos de Deus, cada vez mais ações (Fp 1.20). de graças, louvor e glória são dados a Deus. DULCE EAR ORESTES o DOI SI eee ea pe ju

Perguntas para estudo 1, Como Tson limita sua definição de martírio? Qualquer tipo de sofrimento acaba sendo sofrer

por Cristo? 2 Como Tson acha que morrer para Cristo influi na derrota de Satanás? 3. Explique como o martírio pode glorificar a Deus. E

Paixão Re apostólica 3

E,

anda FLOYD MCCLUNG é diretor da All Nations, uma rede internacional de plantação de igrejas e treinamento dee mer, sei muitos anos. Floyd hoje é líder de uma comunidade de evangelismo é treinamento na África do Sul, a qual atua entre os pobres e não alcançados da região. Ele é autor de 14 ros, neta per or on the Devils Doorstep [Vida na soleira do Diabo).

Og é paixão apostólica?

O termo “paixão” pode ser usado para descrever tudo, desde um romance até as sensações mais agudas de fome. Não seio que significa para você, mas para mim paixão significa tudo que uma pessoa se dispõe a sofrer por alguma coisa. Na verdade, esse é o significado presente na raiz da palavra, que vem do latim paserre, “sofrer”. Significa algo pelo qual ansiamos tanto que estamos dispostos a sacrificar qualquer coisa para alcançá-lo. A palavra “apóstolo” significa “enviado”, “mensageiro”. “Paixão apostólica”, portanto, é a escolha intencional e deliberada de viver para adorar. a Jesus entre as nações. Implica estar comprometido até a morte com a disseminação de sua glória. É a qualidade daqueles que sentem um amor ardente por Jesus, que sonham ver toda a terra coberta com a glória do Senhor.

Consigo perceber quando a paixão apostólica morre em meu coração. Isso acontece quando não passo meu momento de devoção sonhando com o tempo em que Jesus será adorado em línguas que ainda não são ouvidas no céu. Sei que falta paixão em minha vida quando canto sobre o céu, mas vivo como se meu lar fosse aqui na terra. À paixão apostólica morre em meu coração quando sonho mais sobre esportes, brinquedos, lugares que ainda não visitei e pessoas que ainda não conheci que com as nações adorando a Jesus.

Também perco a paixão quando tomo decisões com base no perigo envolvido, e não na glória a que Deus receberá. Os que têm paixão apostólica planejam ir, mas estão dispostos a ficar. Você sabe que tem essa paixão se fica profundamente decepcionado quando Deus não o chama para deixar sua casa e aventurar-se entre os que nunca ouviram o nome dele. Se você não sofrer e não se sacrificar por alguma coisa, então não tem paixão por ela. Se você diz que fará algo por Jesus, mas não sofre por ele, então não tem paixão por ele nem por seus propósitos na terra.

Como se faz para obter a “paixão apostólica”? É como pedir uma pizza, com a garantia de que ela chegará à sua casaem minutos? É por meio de uma linha 0800? Ou melhor, pode-se enviar uma doação de 15 reais em troca de receber em domicího um pouco dessa paixão? Se você é como eu, precisa de ajuda para', 34 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Bezerra, cap. 26: A missão de interceder', 'A missão de interceder

Durvalina B, Bezerra

e 1 E E nes” DUSENAÁINIA O. DESEANA É diaibero do Seminário Betel Brasileiro (São Paulo), coordenadora da Rede de Mobilização de Mulheres de Ação Global para o Estado de São Paulo e vice-presidente do Conselho Nacional de Oração. e Ela é ex-presidente da AMT da APM é autora dos livros A missão de interceder (Londrina: Descoberta, 2001) e Ministério cristão É gude Horizonte:

Extraído de A missão de interceder. Usado com permissão.

6 O intercessor precisa estar atento à intervenção de Deus na his-

tória das nações e conhecer seus feitos entre os povos. Está Deus agindo hoje? É ele o controlador do Universo, o Senhor da História, o Rei das nações? Era calamitosa a situação política e religiosa de Israel na época da morte do rei Uzias, provavelmente no ano 740 a.C. Isaías, entretanto, entrou no templo e viu o Senhor assentado no “alto e sublime trono” (Is 6). Isso demonstra que não há circunstância, por mais desalentadora, que possa ofuscar a glória da majestade divina. Ele está no trono!

O intercessor não é aquele santo que se enclausura para orar, alheio à realidade. Antes, ele é aquele que se coloca na torre de vigia (Hc 2.1). Ele está no lugar secreto de oração, mas atento ao progresso tecnológico, aos acordos de paz entre as nações, à atuação dos governantes para reduzir a fome e a miséria, aos programas de desarmamento, à luta contra a corrupção. Está atento porque conhece seu Deus e pode identificar as marcas da atuação divina

por exemplo, se ele traz ruína como expressão de sua justiça sobre as nações opressoras, como no caso do Egito, quando os próprios magos confessaram: “Isto é o dedo de Deus” (Êx 8.19). Deus também abençoa e faz prosperar as nações, como o reino da Babilônia, quando seu rei reconheceu que o Altíssimo reina (Dn 4.26,32)! Nosso Deus julga e redime as nações. Assim, o intercessor deve ser um bom observador, pois “oração consiste de atenção; a qualidade da atenção conta na qualidade da oração”

Deus intervém nos acontecimentos mundiais e espera que seus servos interajam nesse contexto e, com sua vida e atitudes, influenciem sua época, isto é, que o povo de Deus faça história. Os reinos do Egito, da Babilônia e da Pérsia sofreram sensíveis transformações pela presença do povo judeu no meio deles. Se crermos que nosso Deus é o Senhor da História e que somos seu instrumento jo operação neste mundo, faremos diferença na comunidade em que estivermos dá inseridos. à

O rei Davi, preocupado em saber os sinais dos tempos e o que Israel devia fazer, designou a tribo de Issacar para estudar as épocas (1Cr 12.32). É necessário conhecer as épocas para distinguir

Cathy Schaller, Learning to Stand in the Council of the Lord (Colorado Springs: Dawn Ministries, 1992).

o hairds “época”, “ocasião não mensurável”) de Deus. Só assim seremos capazes de seguir seus eltiais e atuar em nossa realidade, cooperando corn os planos etemos de Deus,

O imundo a ser alcançado é“um mundo em enise" basta acompanhar os noticiários! Podenes ver essa crise por dois ângulos: um positivo eum negativo. Os diversos indicadores de crise, cotno a violência, a expansão do tráfico de dropas, Os sequestros e os assaltos resultam numa desesperada necessidade de segurança e de qualidade de vida para vencer o medo co estresse À etise sociveconómica torna o ser humano mais receptivo à mensagem de esperança, principalmente quando esta vem seguida de ação social, As populações dos países em desenvolvimento estão mais abertas à uma nova mensagem e buscam uma nova dimensão de vida,

No entanto, as crises tornam os povos resistentes a Deus, Nos países ricos e desenvolvidos, a mensagem do evangelho tornou-se obsoleta, O povo, sem nenhum escrúpulo, declara não precisar de Deus, enquanto as igrejas lutam con= trá o nominalismo e a apatia espiritual,

A ação de Deus não se limita às nações ricas ou pobres, aos povos receptivos ou resistentes ao evangelho. “Quem te não temeria a ti, 6 Rei das nações?” (Jr 10.7), O nosso Deus é livre para agir em todo o mundo, Jesus afirmou: “O campo é o mundo”, Procuremos ver as nações como campos prontos para a colheita e também como desafios à tarefa missionária da Jgreja, Visão dos campos prontos para a ceifa Presenciamos um tempo de grandes transfor= mações e grandes colheitas, Precisamos aten tar para a ordem de Cristo: "Erguei os olhos e vede os campos, pois já branquejam para a ceifa” (Jo 4,35),

De forma dramática, vimos a queda do “comunismo no Leste Europeu, À antiga União Soviética, a Albânia, à Romênia e outras nações dominadas pelo ateísmo tornaram-se campo missionário com grande recepção à Palavra de

Patrick Jobnstone, Intercendo mundial (Belo Horizome:

"o Deus, Os que antecipam a visão do Resno cons firmam que for Deus quem agiu, Não foi Midiad Gorbachey o responsável pela abertura dos por tões de ferro do comunismo, na antiga União Soviética, em 1989, Ele for um instrumento de Deus, À história se repete, como aconteceu com Ciro,o persa, também um instrumento na mão de Deus, que permitiu aos judeus regressar do exílio da Babilônia e reedificar a cidade de Jerusalém, entre 538 e 457 40, (Ed 1,1,2).

A igreja orou! Irmão André, fundador e presidente emérito da Missão Portas Abertas, lançou a campanha “Sete anos de oração pela União Soviética” em 1984, um programa de oração a que a Igreja aderiu em várias partes do mundo, Lembro-me dos programas semanais de missões do Betel Brasileiro, do quanto os alunos clamavam pelos povos sob o regime opressor, No fim do primeiro ano da campanha, muitos irmãos presos por sua fé foram hibertados, Em 1989, aconteceu o que ninguém esperava: o muro de Berlim catu! Um grande sinal do desmoronamento da Cortina de Ferro, Não poderíamos imaginar que nossos olhos contemplariam essa façanha da mão do grande Rei,

A China, país mais populoso do mundo, continua comunista, Por que a Cortina de Bambu ainda não se abriu? Não devemos ver a mão do Altíssimo apenas quando ele sinaliza com feitos políticos, Não há sinal mais glorioso que 6 avanço da Igreja chinesa; é maior que em muitos países livres, mesmo que custe caro o testemunho dos fiéis. Em 1949, quando Mao Tsé-tung tomou o país comunista, havia 1,8 milhão de cristãos. Em Burcau de Estatística do Estado da China estimou, confidencialmente, 63 milhões de cristãos? Nosso rei tem o domínio dos tempos dos modos, Para ele, não há portas fechadas!

Há uma igreja que cresce, explosivamente; no maior país de população muçulmana do mundo; a igreja da Indonésia, Os muçulmanos neofundamentalistas, para deter o número AMEM, 1993), p. 204.

Patrick Johnstone, Lhe Church Bigger Than You Think (Vendor: Christian Focus Publications; WEC, 1998), p. 129

e crescente de conversões, iniciaram uma acirrada perseguição à Igreja, que piorou nitidamente desde 1996. Mais de 500 igrejas foram destruídas, lojas saqueadas, mulheres estupradas, casas de cristãos incendiadas. A mortandade deixou milhares de órfãos. O crescimento da igreja da Indonésia, mesmo com as recentes violências, a fome e a miséria pelo colapso econômico, é milagre de Deus! “Segundo relatórios, os evangelistas não estão conseguindo atender aos pedidos de batismo. Na história, podemos ver um quadro de aumento de perseguição, cada aumento seguido por conversões,”

À maior igreja local do mundo hoje não está na Europa, berço do protestantismo, nem nos Estados Unidos, país que mais enviou míssionários aos demais continentes. Está na Coreia do Sul, que passou a ser um modelo de crescimento de igreja, modelo de uma igreja que ora e que implantou um significativo programa de envio de missionários a vários países. À cidade de Seul há 110 anos não tinha uma única igreja. Hoje, das dez maiores igrejas do mundo, sete estão na capital sul-corcana.*

Prevê-se que o continente africano, que há 200 anos era considerado um cemitério de missionários, será o primeiro continente a contabilizar maioria cristã em sua população. Em 1900, os cristãos africanos eram 8 milhões,em me 1990 esse número subiu para 275 milhões. À A África Oriental tem experimentado um grande reavivamento. Às igrejas Anglicana e Lutera-Pi "na da Zâmbia e da Etiópia expressam grande fervor espiritual. As denominações pentecostais nativas crescem extraordinariamente.

A América Latina foi marcada por um notável crescimento da Igreja no século XX. Em 1980, o número de evangélicos era de milhões, passando para 46 milhões em 1990, O número dobrou em apenas uma década! O Brasil, em 1960, tinha 4 milhões de evangélicos; em 1990, eram 26 milhões. É a terceira

Patrick Johnstone, Intercessão mundial, p. S4, 171.

Patick Jotinstone, Intercessão mundial, p. 115.

ammntmeum maior comunidade evangélica do mundo, 4 que mais envia missionários e a que possui miau número de centros de treinamento agências missionárias em toda a América Latina” O rápido crescimento da visão missionária é notáve! No Congresso Missionário Ibero-Americano (COMIBAM), em 1987, Luis Bush declarou “O Brasil deixa de ser apenas um campo mússionário para se tornar uma força missionária”,

O avanço do evangelho está cumprindo a profecia de Habacuque 2.14:“A terra se encherá do conhecimento da glória do Senhor, como as águas cobrem o mar”, Alegramo-nos com o que Deus está fazendo, mas não nos esqueçamos de que há muitos clamando; “Passa à Macedônia e ajuda-nos”. O desafio das nações Após Israel vencer dezenas de reinos e nações, conquistar vasta região e se estabelecer na terra prometida, o Senhor fala a Josué: “Já estás velho, entrado em dias, e ainda muitíssima terra ficou para se possuir” (Js 13.1). Há muito que fazer!

Existem milhares de povos não alcançados, sem uma testemunha de Jesus, vivendo na Janela 10/40, área geográfica compreendendo norte e noroeste africano, o sul da Ásia e o Oriente Médio, onde se concentram os três blocos das maiores religiões do mundo: budismo, islamismo e hinduísmo, cujas barreiras culturais e políticas representam os maiores desafios contemporâneos à proclamação do evangelho.

Intercedamos urgente insistentemente para que Deus desperte a Igreja. Roguemos ao Senhor da seara que mande trabalhadores! Em muitos países fechados para o evangelho, como o mundo árabe, é proibida a entrada de missionários, e nos países que sofrem as sequelas da guerra fome e miséria faz-se necessário orar para que o Senhor desperte profissionais liberais, “fazedores de tendas” dispostos a cumprir a missão como bivocacionais, As agências

1. Em termos práticos, como seria possível alguém “estudar as épocas”, como fez a tribo de 2. Cite algumas razões da demora para se receber resposta das intercessões. Quando interce-

demos pelos povos, demora é maior ou menor? Por quê?

Purvalima B. Bezerra estão pedindo médicos, enfermeiros, técnicos agrícolas, engenheiros, nutricionistas, professores, pessoas com qualificação profissional e vocação missionária, a fim de levar ao mundo o evangelho integral, que alcance, ao mesmo tempo, o espírito, a alma e o físico daqueles que foram feitos à imagem de Deus.

O apóstolo Paulo tinha os olhos abertos para ver os desafios das nações, mas sua maior atenção estava naqueles que nunca ouviram a Palavra de Deus. Ele tinha visão e prontidão para ir aos lugares em que Cristo ainda não fora anunciado. Oremos pelos pastores e líderes da igreja brasileira e por todos os missionários, para que sigam o exemplo desse grande missionário do primeiro século e possam dizer como ele:“Para não construir sobre alicerces colocados por ou-. tros, tenho me esforçado sempre para anunciar o evangelho nos lugares onde ainda não se falou de Cristo” (Rm 15.20, NTLH). Intercedamos para fazer cumprida a palavra profética: “Hão

197 ey de vê-lo aqueles que não tiveram notícia dele, e compreendê-lo os que nada tinham ouvido a seu respeito” (Rm 15.21). A responsabilidade é nossa! À evangelização do mundo precisa ser feita para que se cumpra a profecia do Senhor Jesus:“Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim” (Mt 24.14), Queremos dizer: “Maranata!”. Evangelizemos o mundo em nossa geração.

Ora eficazmente quem pode ver Deus na História e, assim, acompanha e participa do programa divino para o estabelecimento completo do seu Reino. “À conexão entre a intercessão e os eventos mundiais não é fácil de ser estabelecida aqui na terra, mas, um dia, nós veremos como o poder da oração causou impacto no mundo.”

“A grande tragédia da vida não são as orações não respondidas, mas as que não foram feitas” (F. B. Meyer). E É EE A TOSSE onto Soro oa não ooo coesa para estudo', 35 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Irmão André, cap. 27: Se eu tiver que morrer', 'eu tiver que morrer

Se em a A A a E

k a O runÃo smoet é fundador de gue teve imo em 1955 e conta hoje mania ão DO ni a qe cido b0 passes dotnacor A Missão ipod Portas prsngio, Abertas usstentando cristãos autóciones em terras hosns, de modo que possem tevar adiante à 6 fusão do evangeino, ate onde for posswe! O famoso hvro ecran vendeu mais de 10 mindes de cópias em 35 domas.

BA irmão André Mg último encontro com o pastor iraniano Haik Hovsepian-VÊ Mehr foi especialmente memorável. Por muitos anos, ele pastoreou igrejas no Iraque, declarando sábia e abertamente o evangelho. Quando nos despedimos, apertamos as mãos, é ele me disse: “Irmão André, quando eles me matarem será porque estou falando, não porque estou calado”, Ele disse “quando” e não “se”, pois sabia que seria morto e, no mês seguinte, ele foi assassinado. Ele sofreu por causa de sua fé durante anos e foi morto pela sua fidelidade em declará-la, Ele era um espécime raro precioso, porém não estava sozinho. Há milhões de cristãos perseguidos vivendo em áreas onde sua fé custa muito caro, principalmente quando é proclamada. Enquanto sofrem com Cristo, tornam-se a mensagem que diz:“Estou disposto a morrer por ele”; e também: “Estou disposto a morrer por você, porque foi isso que Cristo fez”.

Estou convencido de que estamos vivendo no que parece ser o mais cruel período da História, pois mais pessoas sofrem pelo nome de Cristo que em qualquer outra geração. Os cristãos que não estão sob perseguição devem valer-se de todos os meios para ajudar os irmãos perseguidos. Eles precisam de nós mais do que nunca: nossa presença, nosso encorajamento, nosso apoio, nosso ensino, nossa comunhão e, talvez mais que tudo, nossas orações.

Nossas orações são cruciais, uma vez que as melhores orações nos levarão às nossas melhores ações. Lembro-me de outro homem a um grupo minoritário de judeus provenientes de onde hoje se localiza o lrã. Ele era um homem de boa reputação e alta posição, Ao receber notícias sobre a situação desesperadora em Jerusalém, ele se sentou e chorou por muitos dias, mas também as recebeu como um chamado para agi. Ele intercedeu pelo povo de Deus nos altos círculos do governo e foi audacioso no trabalho de apoio a um povo humilhado, como nós hoje devemos ser. À oração de Neemias ensina-os a orar com paixão, precisamos orar agora mais do que nunca.

As circunstâncias do povo de Deus em Jerusalém naqueles dias eram semelhantes ao sofrimento que os cristãos suportam em muitas nações atualmente. Neemias soube que o templo estava em:

irmão André E ruínas e que o nome de Deus estava sendo desonrado. Há nações onde a habitação de Deus temsofrido tão severamente por tantas gerações que já não existe a Igreja lá. Às vezes, tenho "me referido a essa igreja sofrida como “a igreja sumida”, mas há lugares onde nunca existiu mesmo uma igreja, e, quando forem plantadas Agrejas nesses lugares, elas certamente irão sofrer. Como reagir aos relatos sobre o povo de Deus que é espancado, aprisionado, escravizado, violentado e exposto ao frio e à fome? À reação de Neemias foi incrível: mesmo sendo um homem de ação e um experiente administrador, ele jejuoue orou diante do Deus dos céus.

À paixão com que orou foi ainda mais importante que sua petição. Três aspectos da paixão na oração de Neemias que vale a pena observar:

seu zelo pela glória de Deus;

o amor pelo seu povo;

contar sua vida como nada.

Neemias lembrou a Deus a promessa de reunir seu povo e trazê-lo de todas as partes do mundo para adorar seu nome abertamente (Ne 1.8,9). O zelo pela glória e pelo nome de Jesus deveriam ser também a motivação de todos nós. No entanto, quantos têm essa atitude? Estamos orando pela glória do nome de Deus, ou oramos apenas por nós mesmos?

Neemias identificou-se com seu povo. Ele desfrutava uma situação relativamente confortável, e aqueles problemas não estavam relacionados diretamente a ele.Contudo, ele se identificava tanto com a família do povo de Deus que orou a favor deles como se fosse o responsável por aquele infortúnio. Esse senso de responsabilidade impeliu-o à ação. Temos à vestido pano de saco, como Neemias, pelos pecados de nosso povo, da Igreja? Ou preferimos lavar as mãos e passar a culpa para os políticos e para a liderança da Igreja? A compaixão de Neemias levou-o à ação porque ele tinhao povo sofredor como sua família. Ele também se identificava como servo de Deus e sabia que,

199 para servir a Deus, tinha de servir ao próximo. Ele não se esquivava do contato com o povo, tinha compaixão deles.

Após apelar pela glória de Deus e reconhecera própria culpa, de sua família e de seu povo, ele finalmente chega à petição: “Concede que seja bem sucedido hoje o teu servo e dá-lhe mercê perante este homem (o rei)”. Neemias estava colocando sua vida em risco ao apelar para um rei pagão a favor de Jerusalém e do povo judeu. De que Neemias tinha medo? De que os cristãos no Irã, Iraque, Egito e Paquistão têm medo? Eles temem o líder de seu pais, o qual, por definição, tem uma fé diferente e pode suprimir a minoria cristã com impunidade. Aprendemos de Neemias que, nesses países, devemos orar para encontrar favor aos olhos do líder. Oremos, pois, para que os líderes cristãos no Irã, e em todos os outros países, possam encontrar favor diante dos que estão no poder. Podemos fazer esse pedido com coragem, pois todo líder presta contas a Deus, seja num país muçulmano, seja na China comunista, seja num país supostamente cristão.

Quando pedimos para alcançar favor diante de líderes de regimes hostis ao evangelho, ficamos em posição de expressar o favor de Deus para com eles. À única solução, de acordo com a Bíblia, é o perdão e a reconciliação, Certa vez, visitei uma cidade que fora totalmente destruída numa noite por ordem de um muçulmano mau. Mais de 10 mil cristãos ficaram desabrigados e tiveram todos os seus pertences destruídos. Numa grande reunião com cristãos e muçulmanos, falamos de perdão e reconciliação.

Devemos orar corajosamente pela obtenção de favor, mas não com presunção. Em muitos casos, Deus permite um testemunho ainda maior de sua glória, quando ele manifesta seu favor, como no caso de Estêvão, cujas últimas palavras foram as mesmas últimas palavras de perdão de Jesus (Le 23.34; At 7.60). A história de Neemias não é simples, pois mesmo com o líder expressando seu favor, ele suportou anos de oposição. Da mesma forma, não devemos

Qu same esperar um processo tranquilo, mas devemos e expressar profunda compaixão e desejo pelo buscar o que vale a pena, não importa o preço. bem-estar do povo, Depois disso devemos ado-Só poderemos orar como Neemias se tivermos tara atitude de Ester (Et 4.16) e deixar o resto a atitude de Neemias: zelar pela glória de Deus com Deus: “Se perecer, pereci”. Gai Dic VOS Sei ASAS SUIS META a tTA BRISA TA oo as OTTO Ii A

Perguntas para estudo 1, Por que os cristãos devem orar para obter o favor de líderes hostis ao evangelho? 2. Como operam as três paixões na oração de Neemias (glória, amor e desprendimento da vida)?', 36 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Fernando, cap. 21: A supremacia de Cristo', 'PA) Roso “E AUT FERNANDO trabalha como diretor nacional da Youth for Christ (Mocidade para Cristo), no Sri Lanka, desde 1976. Também atua como A OR à autor de nove livros em cingalés e/ ou inglés, entre eles The Christan''s

Adaptado e condensado de sua obra A supremacia de Cristo (São o Usado com permissão.

de Cristo Ê, 1 O pluralismo é a filosofia predominante de nossos dias. As reli-

giões orientais adotaram uma postura missionária agressiva. O pensamento da Nova Era já afetou profundamente as múltiplas esferas da sociedade ocidental, Já o movimento evangélico, pincipalmente nas Américas, parece ter perdido seu compromisso incisivo em relação à verdade radical do evangelho. O pensamento cristão vem se desviando de suas bases absolutas, algo evidenciado pelo volume de questionamentos da possibilidade de se conhecer a verdade. Uma pesquisa realizada por George Barna revelou que 67% dos norte-americanos acreditam não existir uma verdade absoluta. Ainda mais surpreendente é constatar que 53% dos que alegam ser cristãos conservadores declararam a inexistência de uma verdade absoluta." Com tamanhas mudanças na mente de tantos membros da Igreja, o pluralismo e o relatívismo tornaram-se, em muitos círculos, a chave para a compreensão das verdades espirituais.

À filosofia do pluralismo é básica para o cerne das doutrinas do movimento da Nova Era e até mesmo para algumas teologias que se dizem cristãs. Combina igualmente com o pensamento budista e hinduísta. Não estamos falando do pluralismo que admite diferenças políticas, étnicas e culturais na sociedade ou na Igreja. Apontamos aqui para “uma postura filosófica” que reconhece rmais deum princípio ou de uma afirmação conclusiva e proclama, portanto, ser impossível reconhecer um sistema de pensamento como verdade absoluta. O pluralismo religioso abraça uma nova ideia de revelação. Ao longo dos séculos, os cristãos sempre entenderam a revelação como o desvendar divino da verdade à humanidade. Criam que ele agia de formas acessíveis a todos os povos, por meio da natureza e da consciência, especificamente nas Escrituras e, de modo supremo, em Jesus Cristo. De acordo com o pluralismo relígioso, a verdade não nos é apresentada: nós a descobrimos pela experiência. Os escritos sagrados das várias religiões são considerados descobertas por meio da experiência humana do único Deus. Como as diversas religiões são consideradas expressões

Jesus and The World Religions, in: John Hick (Org.), The Myth of God Incarnate (London: SCM Press, 1977),

MO à dan diferentes do absoluto, acredita-se que cadauma contenha facetas da verdade.

A maioria dos estudiosos sérios de religião reconhece, contudo, que cada religião gira sobre um eixo diferente. O fato é que as similaridades entre o cristianismo e as outras religiões estão em questões periféricas, não nos pontos essenciais da fé. É um grave erro afirmar que todas ensinam a mesma coisa. Os que hoje promovem o pluralismo precisam considerar que essa atitude é oposta ao pensamento da Igreja neotestamentária. Os mestres e escritores do Novo Testamento respondiam ao pluralismo de sua época com fortes afirmações da exclusividade e da supremacia de Cristo. O ministério de Paulo em Atenas (At 17.16-34) e as epístolas aos Colossenses e aos Efésios são bons exemplos. Apesar da negação da supremacia de Cristo estar angariando adeptos mundo afora, a própriavida e obra de Jesus apresentam bases razoáveis para que se creia que Jesus é, de fato, supremo. Jesus, a Verdade absoluta À luz da evolução do pensamento contemporâneo, não é surpreendente que muitos cristãos da atualidade questionem a validade de afirmar uma revelação única e absoluta. Nesse ambiente de incerteza em relação à verdade, os cristãos bíblicos afirmam que podemos conhecer a verdade absoluta. Declaramos tê-la encontrado pá em Jesus aquele Jesus que é a Verdade. Ele —diz:“Eu sou o caminho, e a verdade, ea vida” (Jo 14.6). Quando Jesus declarou ser a Verdade, sua intenção era declarar-se a personificação, a é encarnação da verdade. Jesus não diz somente: “O que digo é a verdade”, no sentido de “eu sou verdadeiro”, mas: “Eu sou a Verdade” a expressão máxima da realidade. Essa revelação não é algo descoberto pela experiência. O pluralista diz que a revelação cristã é, na verdade, o registro das experiências religiosas de deter-

The Gospel of John, in: The Daily Bible Study, ed. rev. p. 167-85.

pá minado povo. Afirmamos, porém, que ela é a verdade absoluta, comunicada por Deus, e não uma descoberta da humanidade.

Jesus valida seu direito a declarar-se q Verdade nos versículos que se seguem a João 14.6. Ele primeiro expande a declaração, explicando o significado do que afirmava: ser a Verdade significa ser igual a Deus, O versículo 7 diz: “Se vós me tivésseis conhecido, conhecerfeis também a meu Pai”, Conhecer a Jesus é conhecer o Pai. Leon Morris, quanto à afirmação de Jesus sobre podermos conhecer a Deus, ressalta que ele “transcende qualquer afirmação feita normalmente pelos santos da Antiguidade

Jesus introduz, aos que creem, algo novo e extraordinário na experiência religiosa: o real conhecimento de Deus”.

Jesus estabelece outro ponto significativo em João 14.7. Ele diz: “Desde agora o conheceis e o tendes visto”. Jesus está dizendo que os discípulos já tinham visto a Deus Pai. William Barclay comenta: “É bem possível que, para o mundo da Antiguidade, essa tenha sido a mais incrível declaração feita por Jesus. Para os gregos, Deus era caracteristicamente o invisível. Para os judeus, o fato de que nenhum homem jamais viu a Deus era um artigo de fé” Contudo, Jesus declara ser igual a Deus, e diz que, ao vê-lo, vemos a Deus Pai.

Do ensinamento de Jesus em João 14.6,7, concluímos que a verdade absoluta pode ser conhecida porque o absoluto se concretizou na História pela pessoa de Jesus (v. Jo 1.14,18). Esse é o argumento que nos leva a crer na verdade absoluta. Dizemos que Jesus é Deus. Portanto, conhecer a Jesus é conhecer o absoluto. O fato de crermos num evangelho cristão absoluto é uma extensão de cremos que Jesus é Deus encarnado. É interessante que John Hick, talvez o pluralista mais destacado desta geração, rejeite a doutrina cristã da encarnação. ed. (Philadelphia: Westminster, 1975), v. 2, p. 159.

The Christ of the Indian Road, in: Selections from E. Stanley Jones (Nashville: Abingdon, 1972), p. 224.

Uma reação pessoal à verdade Chegamos agora à pergunta: como, e em que sentido, conhecemos a verdade absoluta? Se a verdade é uma pessoa, então podemos conhecê-la do jeito que conhecemos as pessoas

pelos fatos a seu respeito e por meio do relacionamento. Conhecemos o absoluto por meio de um relacionamento, porque foi assim que ele escolheu comunicar a verdade. Eleo fez pessoalmente. Portanto, para ingressar no conhecimento do absoluto precisamos conhecer a Deus. O evangelho de João tem muito a dizer sobre crer como o meio de conhecer a Deus. A palavra “crer” aparece 98 vezes em João. Essencialmente, significa “confiar”. J. Carl Laney diz: “Crer em Cristo não se refere somente ao assentimento intelectual com premissa a respeito de Cristo. O conceito bíblico de crer significa, isto sim, uma resposta pessoal e um compromisso com a pessoa de Cristo”* É isso que nos dá acesso a um conhecimento da verdade absoluta.

E. Stanley Jones conta a história de um médico incrédulo que estava para morrer. Um médico cristão assentou-se ao seu lado e pediulhe que se entregasse, que cresse em Cristo. O médico moribundo ficou escutando o colega, admirado. Finalmente, entendeu a mensagem e, exultante, exclamou: “Durante toda a minha vida procurei crer em algo, mas agora vejo que a questão é saber em quem crer!”.º Crer é entregar-nos a Jesus. Nós o amamos como amigo e o seguimos por tê-lo como nosso Senhor. Essa é a razão de Cristo não dizer: “Segue meu ensinamento”, mas: “Segue-me”.

Por conhecer o absoluto pessoalmente, podemos dizer que conhecemos a verdade absoluta, mas esse conhecimento não é algo meramente subjetivo. No âmago do evangelho cristão, residem alguns fatos objetivos. O evangelho de Jesus está inserido no contexto de coisas que aconteceram na História e até mesmo em reivindicações feitas por ele, Há propostas da reve-

John, in: Moody Gospel Commentary (Chicago: Moody,

7 Readings in Jobn''s Gospel, reimpr. (Wilton: Moorhouse

lação divina que não admitem meios-termos, e averdade sobre o relacionamento de Jesus com Deus é uma delas. Por exemplo, em João 14,11 ele ordena aos seus discípulos: “Crede-me que estou no Pai, e o Pai, em mim; crede ao menos por causa das mesmas obras”. As palavras de Jesus afirmam que ele é absoluto Em João 14,10, Jesus explica como podemos confiar em suas reivindicações de igualdade a Deus e, por isso, de verdade absoluta: “As palavras que eu vos digo não as digo por mim mesmo; mas o Pai, que permanece em mim, faz as suas obras”. Quando Jesus fala, é o Pai quem está agindo por seu intermédio. A resposta que esperaríamos de Jesus era: “O Pai fala através de mim”. Em vez disso, ele diz: “O Pai que vive em mim, ele está realizando sua obra”. Diz o arcebispo William Temple: “As palavras de Jesus são as obras de Deus”?

Jesus está mostrando nesse texto a seriedade de suas palavras. Quando ele fala, Deus fala. Suas palavras confirmam sua condição divina. As palavras de Jesus têm valor confirmatório, em dois sentidos. Primeiro: sua relevância e perspicácia penetrantes sugerem que não é uma pessoa qualquer que está falando e que em suas palavras está a resposta de Deus para os problemas da vida. Segundo: diante de suas declarações, chegamos à conclusão inevitável de que Jesus se considera igual a Deus.

Nos 20 séculos desde o ministério público de Jesus, muitos têm aceitado como verdadeiras as afirmações de Jesus acerca de si mesmo pela simples leitura dos evangelhos. Ouvi uma história sobre um jovem incrédulo que estudava inglês e exercitava sua leitura num dos evangelhos. Um dia, ele se levantou subitamente em plena aula, caminhou pela sala e declarou: “Estas não são as palavras de um homem: são as palavras de Deus!”. Jesus afirma que suas palavras convencerão as pessoas. 1992), p. 20. Barlow, 1985), p. 225.

The Gospel According to St, John, in: The New International Commentary on The New Testament (Grand Rapids:

166 Dez características das palavras de Jesus 1. Seu ensinamento é profundo, porém simples. O bispo Stephen Neill diz: “A identificação com o cotidiano é visível em muitos dos ensinamentos de Jesus. Talvez por isso suas palavras possuam o poder extraordinário de mover 0 coração de homens e mulheres por quase 20 séculos”.* Os guardas do templo enviados para prender a Jesus voltaram sem ele. Quando questionados: “Por que não o trouxestes?”, responderam: “Jamais alguém falou como este homem” (Jo 7.45,46). 2. Elefala com grande autoridade. Pouco antes de regressar ao céu, Jesus declarou aos seus discípulos: “Toda a autoridade me foi dada no céu e na terra” (Mt 28.18). Sua maneira de falar é compatível com alguém que ouse fazer tal afirmação. À respeito dos próprios ensinamentos, ele diz: “Passará o céu e a terra, porém as minhas palavras não passarão” (Mt 24.35). Depois do Sermão do Monte, “estavam as multidões maravilhadas da sua doutrina; porque ele as ensinava como quem tem autoridade e não como os escribas” (Mt 7.28,29). R. T. France diz: “Qualquer outro mestre judaico embasaria seu ensinamento com extensivas citações das Escrituras e menção do nome de seus mestres para dar peso à sua opinião. A autoridade desses homens será sempre de segunda mão, mas não a de Jesus. Naquilo E" que dizia, ele simplesmente legislou”.º 3. Eleafirma ter autoridade para perdoar peca-Bd dos. Quando Jesus perdoa os pecados de um paralítico e o povo questiona seu direito de fazê-lo, ele dá como evidência a realização de um milagre. Diz que o milagre é “para que saibais que o Filho do Homem tem sobre a terra autoridade para perdoar pecados” (Mc 2.10). 4. Ele não se limita a dizer: “Segue meus ensinamentos”, mas: “Segue-me”e exige exclusiva The Supremacy of Jesus (London: Hodder and Stoughton, Jesus the Radical (Leicester: InterVarsity, 1989), p. 204, Eerdmans, 1971), p. 313.

Asupremaciade Cristo fidelidade. Ele diz: “Quem ama seu paí ou sua mãe mais do que a mim não é digno de mim; quem ama seu filho ou sua filha mais do que a mim não é digno de mim; e quem não toma a sua cruz e vem após mim não é digno de mim” (Mt 10.37,38). 5. Eleassume títulos do Antigo Testamento pertencentes a Deus. Em Salmos 27.1, lemos: “O Senhor é a minha luz e a minha salvação”, Jesus diz: “Eu sou a luz do mundo” (Jo 8.12). Salmos 23.1 diz: “O Senhor é o meu Pastor”. Jesus diz: “Eu sou o bom pastor” (Jo 10.11). 6. Elese considera digno de receber a honra devida a Deus. Isaías 42.8 diz: “Eu sou o Senhor, este é o meu nome; a minha glória, pois, não a darei a outrem, nem a minha honra, às imagens de escultura”. Ele diz: “O Pai a ninguém julga, mas ao Filho confiou todo julgamento, a fim de que todos honrem o Filho do modo por que honram o Pai. Quem não honra o Filho não honra o Pai que o enviou” (Jo 5.22,23). 7. Eleafirma ter um relacionamento pai-filho exclusivo com Deus. Ele se diz Filho de Deus e trata-o por “meu Pai”. “Meu Pai” não é como os judeus normalmente se referiam a Deus. Podiam eventualmente dizer “nosso Pai”. Mesmo quando usavam “meu Pai” em alguma oração, geralmente o qualificavam com “que estás no céu”, isso “para remover a sugestão de familiaridade”.!º As várias referências nos evangelhos demonstram que Jesus pretendia deixar claro que tinha um relacionamento com Deus impossível a qualquer outro ser humano. 8. Eleafirma ser o Juiz da humanidade. Em João, ele diz de si mesmo: “[O Pai] lhe deu autoridade para julgar, porque é o Filho do Homem” (Jo 5.27). Leon Morris destaca que, “se em algo Jesus fosse menor que Deus, essa declaração deixaria de ter 1984), p. 67.

The Lord from Heaven (Liecester; Downers Grove: InterVarsity, 1974), p. 36. 2 Apud W. Griffith Thomas, Christianity Is Christ, reimpr. (New Canaan: Keats, 1981), p. 26.

Ajith Fernando qualquer validade nenhum ser criado pode determinar o destino eterno de outras criaturas”." 9. Ele promete nos dar coisas que só Deus pode dar. Em João 5.21, ele diz: “Assim como o Pai ressuscita e vivifica os mortos, assim também o Filho vivifica aqueles a quem quer”. Também é ele que dará “água [...)a jorrar para a vida eterna” (Jo 4.14). Ele fala em dar “minha paz” (Jo 14.27) e “minha alegria” (Jo 15.11, NVT). 10. Seus oponentes, os líderes judaicos, entenderam as implicações do que ele reivindicava. Numa discussão sobre o sábado, Jesus fez a seguinte afirmação: “Meu Pai trabalha até agora, e eu trabalho também”. O versículo seguinte diz: “Por isso, pois, os judeus ainda mais procuravam matá-lo, porque não somente violava o sábado, mas também dizia que Deus era seu próprio Pai, fazendo-se igual a Deus” (Jo 5.17,18). A respeito das palavras de Cristo, alguém disse: “Se quem nos fala aqui não for uma autoridade sobre-humana, então estamos diante de uma arrogância sobre-humana”.! As obras de Jesus autenticam suas palavras Jesus sabia, entretanto, que algumas pessoas não aceitariam suas afirmações chocantes sobre seus direitos. Por isso, ele diz, em João 14.11:“Crede-me que estou no Pai, e o Pai, em mim; crede ao menos por causa das mesmas obras”. Jesus quis nos dizer que quem considerasse suas obras teria de concordar com suas palavras. À primeira forma de contemplar suas obras é através de sua vida irrepreensível. Até os que não aceitam certas reivindicações em geral concordam que Jesus viveu uma vida exemplar, Se ele foium homem bom, não devemos, então, considerar com seriedade o que ele coerentemente falava de si mesmo? Outra maneira de contemplar as obras de Jesus é através de seus milagres, Nos evangelhos,

167 «o os milagres são quase sempre apresentados como evidências que fundamentam as reivindicações de Cristo. Quando o povo murmurou contra a afirmação de que Jesus era capaz de perdoar os pecados do paralítico, ele curou o homem “para que saibais que o Filho do Homem tem sobre a terra autoridade para perdoar pecados” (Mc 2.8-11). Os judeus, certa vez, acusaram-nos de blasfêmia, dizendo: “Não é por obra boa que te apedrejamos, e sim por causa da blasfêmia, pois, sendo tu homem, te fazes Deus a ti mesmo” (Jo 10.33). Jesus retrucou: “Se não faço as obras de meu Pai, não me acrediteis; mas, se faço, e não me credes, crede nas obras; para que possais saber e compreender que o Pai está em mim, e eu estou no Pai” (Jo 10.37,38).

Quem analisar com seriedade as obras de Cristo terá de aceitar suas reivindicações de supremacia absoluta, porque suas obras autenticam suas palavras. Tenho um amigo no Sri Lanka que era budista devoto e ávido leitor. Um dia, ele foi à biblioteca pública de sua cidade e retirou um livro sobre a vida de Cristo. Concluída a leitura, ele percebeu que a vida de Jesus fora única na história da humanidade. Ele se deu conta de que as reivindicações de Jesus exigiam uma postura. Foi procurar alguém que pudesse contar-lhe mais acerca de Cristo. O contato com os cristãos levou-o a se tornar um fervoroso seguidor de Jesus Cristo.

Se cremos que os evangelhos apresentam um relato objetivo da vida Cristo, não podemos abraçar o pluralismo moderno. O senhorio absoluto de Cristo não aparece apenas em passagens isoladas dos evangelhos. Pelo contrário, resplandece através de todo o texto. Se tirarmos as passagens que ensinam o senhorio absoluto de Cristo, não restará vida alguma de Cristo. O mesmo material que prova ter sido ele um homem bom também evidencia que ele é Senhor absoluto. É impossível dizer que Jesus foi bom, mas não absoluto, À posição pluralista sobre essa questão é insustentável,

esp. Craig Blomberg, The Historical Reliability of the Gospels (Leicester; Downers Grove: InterVarsity, 1987). Baseado nos gráficos de Griffith Thomas, cit., 34,

[A 168

É claro que os pluralistas poderão rejeitara veracidade dos evangelhos e assim descartar as reivindicações de Cristo nas Escrituras. Muitos pluralistas argumentam que essas declarações não foram feitas por Jesus, e sim inventadas pelos escritores dos evangelhos, baseados em experiências pessoais subjetivas, em ideias próprias e em conceitos a respeito de Cristo. Está além do propósito deste artigo dar uma resposta a essa questão, mas gostaria de dizer que há uma forte defesa da veracidade histórica dos evangelhos, amplamente demonstrada em vários livros recentes.” Uma defesa panorâmica do Cristo absoluto Muitos se sentem atraídos pelos diferentes aspectos da compreensão de que Cristo é absoluto. Quando abrem o coração para um aspecto, os outros logo fazem sentido. Contudo, a atração maior do evangelho está no efeito cumulativo de todos esses pontos. Outros já ensinaram as coisas que Jesus ensinou. Recentemente, um líder muito conhecido no Sri Lanka, um advogado, apresentou um argumento que muitos consideraram convincente contra a singularidade do cristianismo. Ele mostrou, para tanto, que os ensinamentos éticos de Jesus também são encontrados em outras religiões. Até certo ponto, isso é verdade, mas os ensinamentos de Jesus não são a essência do evangelho. Seus ensinamentos éticos estão arraigados nas afirmações de que ele é absoluto.

À característica do evangelho que o torna exclusivo é a sua inteireza. Jesus foio exemplo perfeito de ser humano santo e amoroso. Ensinou verdades sublimes, declarou-se iguala Deus e realizou milagres para autenticar suas declarações. Mais que isso, sacrificou sua vida, afirmando ser necessária sua morte para salvar o mundo. Deus deu provas da validade desse plano de salvação quando ressuscitou a Jesus dentre os mortos. Aí está o argumento decisivo, O aspecto mais singular do evangelho de Jesus

op. p.

A supremacia de Cristo é sua morte e ressurreição para salvar o mundo inteiro, Isso distingue o evangelho das demais religiões do mundo. A alegria da verdade Há uma intensa alegria pela verdade que nos revela, na era em que vivemos, a nova aliança, Quando nos rendemos a Jesus, entramos num relacionamento com a verdade e percebemos que conhecemos o absoluto. Nesta geração confusa, é dessa verdade que as pessoas têm sede, Esta geração confusa têm sede disso! Quanta alegria resulta da descoberta de tal verdade! Ela nos oferece um fundamento eterno sobre o qual podemos construir a vida. Esse fundamento, por sua vez, cria uma enorme segurança, que jorra de nós em forma de alegria constante.

Jesus descreveu sucintamente essa experiência quando disse: “Conhecereis a verdade, e à verdade vos libertará” (Jo 8.32). À medida que experimentamos a verdade, deixamos de ser dependentes deste mundo instável para alcançar realização, libertação do poder desumanizador do pecado e liberdade para viver numa dimensão da eternidade onde existem fontes de plena alegria (Sl 16.11), capazes de satisfazer nossas aspirações mais profundas. Entender que Jesus é a Verdade é uma experiência inexistente em outras religiões. É uma experiência com o Deus eterno, e somente o Deus eterno pode nos dar alegria plena. Jesus, o Caminho Seo cristianismo é Cristo, então sua cruz é a chave que nos dá acesso à compreensão acerca de Jesus. À ênfase à semana que antecedeu a crucificação é evidência da importância que os discípulos davam à sua morte. O relato ocupa cerca de 30% de Mateus, 37% de Marcos, 25% de Lucas e 41% de João. O teólogo inglês P.T. Forsyth afirma: “Cristo é para nós exatamente o que é sua cruz, Tudo que Cristo foi no céu ou na terra está presente em sua entrega ali

The Cruciality of the Cross (London: Hodder and Stoughton, 1909), 44-5.

memo Você não pode entender a Cristo até entender sua cruz”! Quando Jesus diz, em João 14.6, que é o Caminho, ele está nos comunicando que, por meio de sua morte, ele se tornará o Caminho, como revela o contexto desse verstculo (Jo 13.33-—14.5).

O que a cruz de Cristo alcançou é tão vasto e tão profundo que, no decorrer da história da Igreja, gerou múltiplas interpretações.!* Descreveremos aqui sua abrangência, considerando seis conceitos neotestamentários.

1. Substituição. Talvez a característica mais básica da morte de Jesus é que ele tomou nosso lugar e levou o castigo de nossos pecados. Ele foi nosso substituto. Pedro, o primeiro ase revoltar contra a ideia de Jesus ser crucificado, mais tarde escreveu duas significativas afirmações a esse respeito: “Ele mesmo [carregouJem seu corpo, sobre o madeiro, os nossos pecados, para que nós, mortos para os pecados, vivamos para a justiça; por suas chagas, fostes sarados” (1Pe 2.24);“Cristo morreu, uma única vez, pelos pecados, o justo pelos injustos, para conduzir-vos a Deus; morto, sim, na carne, mas vivificado no espírito” (1Pe 3.18).

2. Perdão. O resultado imediato de nossa apropriação dos benefícios da morte de Cristo é o perdão dos pecados. Sua morte foi necessária para que o perdão fosse garantido, como explica Hebreus 9.22: “Quase todas as coisas, segundo a lei, se purificam com sangue; e, sem derramamento de sangue, não há remissão”. À mensagem de perdão é um dos aspectos mais revolucionários do evangelho cristão e, namaioria das religiões, ela não existe.

3. Propiciação. Essa palavra está associada aos rituais do templo, onde sacrifícios eram oferecidos para desviar a ira de Deus contra o pecado, O sentido dela fica bem claro na paráfrase de 1João 2.2 da Bíblia Viva: “Ele foi quem levou sobre si a ira de Deus contra os nossos pecados

Para uma exposição abrangente dos diferentes pontos df the Death of Christ (Grand Rapids: Baker, 1985).

I, “Justification”, in: Walter A. Elwell (Org.), e P-

e nos trouxe à comunhão com Deus” (tradução da versão inglesa). À propiciação enfatiza a seriedade do pecado, pela ira de Deus contra ele, aqual foi suportada por Jesus. Talvez a razão de nossa dificuldade em aceitar tal conceito resida no fato de que a doutrina da ira de Deus tem sido negligenciada pela Igreja. Hoje, ficamos surpresos ao ler acerca de Deus: “Tu és tão puro de olhos, que não podes ver o mal” (Hc 1.13). Perdemos o repúdio ao pecado encontrado na Bíblia. Contudo, tanto no Antigo quanto no Novo Testamento, a ira é considerada parte da essência de Deus.

4. Redenção. Essa palavra vem do contexto do mercado. Naquela época, os escravos eram adquiridos por um preço. Trata-se da aquisição de nossa salvação pelo pagamento exigido por nossos pecados. Efésios 1.7 diz: “[Em Jesus Cristo] temos a redenção, pelo seu sangue, a remissão dos pecados, segundo a riqueza da sua graça”. O foco incide sobre a libertação do cativeiro do pecado mediante o preço pago por Cristo.

5. Justificação. Essa palavra vem do contexto dos tribunais e significa “pronunciar, aceitar e tratar como justo”. Essa figura denota “um ato judicial de administração da justiça nesse caso, pronunciando-se um veredicto de inocência e assim eliminando qualquer possibilidade de condenação”.”” Romanos 4.25 diz: Jesus] foi entregue por causa das nossas transgressões e ressuscitou por causa da nossa justificação”. Romanos 5.16-18 descreve como se deu nossa justificação:

O julgamento derivou de uma só ofensa,

para a condenação; mas a graça transcorre

de muitas ofensas, para a justificação. Se, pela

ofensa de um e por meio de um só, reinou a

morte, muito mais os que recebem a abun-

dância da graça e o dom da justiça reinarão

p. de vista sobre a questão, v. H. D. McDonald, The Atonement The Evangelica! Dictionary of Theology (Grand Rapids: Baker,

Apud Douglas R. Groothius, Unmasking The New Age (Downer Grove; InterVarsity, 1986), 21.

em vida por meio de um só, a saber, Jesus

Cristo. Pois assim como, por uma só ofen-

sa, veio o juízo sobre todos os homens para

condenação, assim também, por um só ato de

justiça, veto a graça sobre todos os homens

para a justificação que dá vida.

6. Reconciliação. Essa palavra vem do contexto familiar e da amizade. Paulo diz: “Deus estava em Cristo reconciliando consigo o mundo, não imputando aos homens as suas transgressões, e nos confiou a palavra da reconciliação” (2Co 5.19). A reconciliação é necessária porque o pecado é rebelião contra Deus e resulta em inimizade entre Deus e a humanidade. Romanos 5.10 diz: “Se nós, quando inimigos, fomos reconciliados com Deus mediante a morte do seu Filho, muito mais, estando já reconciliados, seremos salvos pela sua vida”. O resultado é “paz com Deus” (Rm 5.1) e ingresso em sua família pela adoção (Jo 1.12). O desafio da cruz Jesus é o caminho da salvação. Ele veio ao mundo com o propósito de trazer salvação à humanidade. Esse fato deixa subentendido que não podemos nos salvar e que não há outro caminho para a salvação, exceto por meio de Jesus. O cristianismo, portanto, é uma religião de graça, pois Deus age por meio de Cristo para nos salvar. Muitos, diante da dimensão da graça f dafécristã, perguntam: “Não deveria ser nossa a iniciativa de alcançar a salvação? Por que outro morreria por nós?”. À maioria das pessoas gostaria de poder salvar-se. Stephen Neill declara: “A última coisa que os seres humanos de hoje desejam é que alguém faça algo por eles”.”* A mensagem da cruz fere o orgulho do coração humano, que é a essência do pecado, O pecado de Adão e Eva foi querer salvar-se, independentemente de Deus. Eles não queriam depender de um Deus supremo para a salvação

Apud Douglas R. Groothius, op. cit., p.21.

ou para qualquer outra necessidade. O mesmo acontece hoje. Às pessoas gostam de pensar que estão se salvando. Por estarem separadas do Criador, experimentam uma sensação agradável, que as ajuda a calar temporariamente a voz da insegurança e do vazio interior. Talvez por isso religiões como o budismo, o hinduísmo ca Nova Era, que oferecem aos seus adeptos maneiras de se salvarem por meio de sucessivas existências (reencarnação), estejam crescendo no Ocidente.

Igualmente distantes da ideia bíblica de que somos culpados perante Deus e necessitarmos de salvação são as crenças do hinduísmo e da Nova Era, que afirmam sermos todos integrantes da Divindade. A declaração do guru Swami Muktananda, que muito influenciou Werner Erhard, fundador da Est and Forum, expressa o pensamento de muitos nos dias de hoje: “Reverencie a si mesmo. Honre e adore seu próprio ser. Deus reside em seu interior. Deus é você”. Theodore Roszak, analista do movimento da Nova Era, diz que nosso alvo é “acordar o deus adormecido na raiz do ser humano” 2º A humanidade, em seu estado natural de rebeldia contra Deus, prefere essa forma de salvação.

Quando alguém me pergunta: “Não devemos pagar por nossos pecados?”, costumo responder que o princípio de pagar os pecados está em todas as religiões. A Bíblia diz: “Não vos enganeis: de Deus não se zomba; pois aquilo que o homem semear, isso também ceifará” (Gl 6.7). Os budistas e hindus dão a isso o nome de carma. Entretanto, os efeitos de um princípio ou lei podem ser desfeitos por uma força mais poderosa. Considere a lei da gravidade. De acordo com essa lei, se eu levantar um livro e soltá-lo, ele irá cair, mas posso usar outra força mais poderosa para vencer a força que opera na lei da gravidade. Se pego o livro que está caindo e levanto o braço, posso vencer a lei da gravidade e fazer o livro mudar de direção. Quando ajo

Ajith Fernando assim, não quebro a lei da gravidade. Uso uma força que cancela seus efeitos.

Deus fez algo semelhante conosco. Ele nos criou para vivermos com ele, mas optamos por uma vida independente. Com isso, amontoamos sobre nós mesmos uma terrível carga de culpa. Os que tentam desfazer-se disso por esforço próprio logo descobrem que sua força é insuficiente. Por mais que tentem, não conseguem fazer a balança da vida pender para o outro lado. O evangelho cristão afirma que, vendo nossa condição decaída, o Criador não nos abandonou. Ele acionou a lei do amor e deixou que isso nos salvasse. Contudo, Deus agiu sem quebrara lei da justiça ou cancelar suas exigências. O que ele fez, por meio do amor, foi satisfazer todas as exigências. As exigências da justiça não foram ignoradas nem canceladas. Foram inteiramente cumpridas, mas único modo de satisfazê-las era fazer com que seu Filho imaculado recebesseo castigo que nos era devido. Trata-se deum amor incrível. Ele fez por nós o que não podíamos fazer. Isso é graça, cujo resultado é a salvação. Conheço muitos hindus e budistas que, desesperados em seus esforços por se salvar, descobriram ser a mensagem da salvação pela graça de Cristo realmente uma boa nova. Jesus, a Vida A maneira pela qual Jesus é a Vida (Jo 14.6) é outro aspecto importante da supremacia de Cristo. A vida eterna é o resultado principalde sua obra salvífica (Jo 3.16; 5.24). Jesus diz que essa vida é um relacionamento que temos com ele. Em João 17.3, ele declara: “A vida eterna é esta: que te conheçam a ti, o único Deus verdadeiro, e a Jesus Cristo, a quem enviaste”.

Em João 10.11, Jesus ensina que nosso relacionamento com ele baseia-se em seu compromisso conosco: “Eu sou o bom pastor. O bom pastor dá a vida pelas ovelhas”. Em seguida Jesus passa a falar dos egoístas, que nos desapontam, gente que não tem o mesmo compromisso conosco. Eles nos abandonam na hora da necessidade, em vez de cuidar de nós, como Jesus faz, Ele diz: “O mercenário, que não é

171 (um pastor, a quem não pertencem as ovelhas, vê viro lobo, abandona as ovelhas e foge; então, o lobo as arrebata e dispersa. O mercenário foge, porque é mercenário e não tem cuidado com as ovelhas” (Jo 10.12,13). Jesus sabe que o mundo está cheio de relacionamentos fracassados. Às feridas profundas causadas por pessoas que nos decepcionam ocupam um grande espaço em nossa vida emocional. Seu compromisso em nos curar das feridas provocadas por este mundo é um importante aspecto da singularidade de Cristo.

Em João 10.10, Jesus descreve a vida que ele nos concede: “Eu vim para que tenham vida e a tenham em abundância”. É uma vida de completa realização em consequência do relacionamento amoroso com Deus. Essa realização não é um prazer impessoal ou um “toque” divino em determinadas experiências. Todos os outros modos de vida ficam aquém da vida plena que sóo Criador pode oferecer. Foi o que Francisco de Assis (1182-1226) descobriu. Era filho de um rico mercador de tecidos. Depois do despertar espiritual de Francisco, assim que se tornou adulto, seu pai se convenceu de que o filho ficara louco e o denunciou. Francisco abraçou a pobreza, mas não sentiu falta das riquezas renunciadas. Ele disse: “Para quem provou de Deus, toda doçura deste mundo fica amarga”. Jesus explicou esse mesmo tipo de realização, dizendo: “Eu sou o pão da vida; o que vem a mim jamais terá fome” (Jo 6.35). Quando o abraçamos, nossa ambição e a inquietação saudáveis não são perdidas. Isso tornaria a vida desinteressante. Na verdade, adquirimos uma nova sede de Deus, de sua glória e de seus caminhos, mas a fome mundana, que tira nossa alegria e nossa paz, é substituída por algo maior.

Deus nos criou para nos relacionarmos com ele. É melhor estar morto que separado dele. Como diz João: “Aquele que tem o Filho tem a vida; aquele que não tem o Filho de Deus não tem a vida” (1Jo 5.12). O ser humano, criado para a vida, sente falta da vida que há em Cristo. Agostinho (354-430) declarou: “Fizeste-nos para ti, e nosso coração se inquieta até

encontrar descanso em ti”. O famoso inventor e matemático Blaise Pascal (1623-1662) referiu-se a essa inquietação como um vazio em forma de Deus, existente em todo ser humano. A obra de Cristo em nós remove essa inquietação e nos concede a realização que buscamos na vida. Esse é o aspecto subjetivo da singularidade de Cristo, e, num mundo que dá tanta ênfase à experiência subjetiva, talvez seja uma das qualidades mais atraentes do cristianismo para quem ainda não crê. Sua obra dá origem a uma nova humanidade Deus também nos criou para termos um relacionamento mútuo, e o evangelho atende também a essa necessidade, de forma singular, por meio do que podemos chamar “nova humanidade”. Um dos grandes efeitos da obra de Cristo éa formação dessa nova humanidade. Paulo a denomina Corpo de Cristo. Jesus fala dessa nova humanidade no discurso sobre sua morte, em João 10.16: “Ainda tenho outras ovelhas, não deste aprisco; a mim me convém conduzi-las; elas ouvirão a minha voz; então, haverá um rebanho e um pastor”.

Alguns alegam que a referência a “outras ovelhas” pressupõe a possibilidade de salvação para pessoas fora da Igreja. Dizem que a obra de Cristo conquistou a salvação para todos, dentro e fora da Igreja, mas é improvável que um livro que enfatize tanto a necessidade de crer em Cristo para a salvação ensine a possibilidade de ser salvo sem essa fé. O verbo pisteuo, “crer”, aparece 98 vezes em João.?! Na verdade, Jesus afirma: “Elas ouvirão a minha voz; então, haverá um rebanho e um pastor”. A ideia é de que essas pessoas aceitarão o evangelho. Quando Jesus se refere a “ovelhas deste aprisco”, parece referir-se aos judeus. Às “outras ovelhas”, portanto, seriam os não-judeus. Jesus está dizendo que sua morte também atrairá gentios para o rebanho,

2 É surpreendente que o substantivo pistis não apareça em

Esse é um tema que aparece em outros textos de João (11.52; 12.20,21). Isso também está subentendido nas declarações que apresentam Jesus como Salvador do mundo inteiro (Jo 1.29,

O resultado de trazer ovelhas para o aprisco é a nova humanidade “em Cristo”. Em Romanos 5.10-20 e 1Coríntios 15.20-22, Paulo contrasta a nova humanidade com a antiga, Essas passagens afirmam que aqueles que estão em Adão sofrem a consequência do pecado de Adão, enquanto os que estão em Cristo recebem o benefício do ato salvífico de Jesus.

João 10.16 ensina que a morte de Cristo possibilitou a entrada de outras ovelhas ao aprisco de Cristo, mas para isso a Igreja precisa sair, ir até as ovelhas e arrebanhá-las. João 10.16, portanto, é um versículo missionário. William Barclay, comentando esse versículo, diz: “O sonho de Cristo depende de nós. Nós é que podemos ajudá-lo a tornar o mundo um único rebanho debaixo de seu pastoreio”.? Assim, não é de estranhar que o clímax da descrição da morte de Jesus em João 10.11-15 seja o desafio missionário do versículo 16. O grande teólogo escocês James Denney (1856-1917), ao falar numa convenção missionária, para surpresa dos presentes, passou a maior parte de sua palestra explicando o significado da propiciação. Essa exposição, entretanto, lhe deu a base para concluir que, se existe propiciação, então nossa prioridade deve ser anunciá-la ao mundo (missões).

Na última parte de João 10.16, Jesus menciona o resultado da chegada dessas outras ovelhas:“Haverá um rebanho e um pastor”. O que temos aqui é a primeira declaração sobre a Igreja universal, algo que, mais tarde, Paulo apresentará em detalhes. Ele usará a figura do Corpo de Cristo para referir-se à Igreja? e definirá os que “estão em Cristo” pela fé como seus integrantes. Aqui, Jesus está dizendo que os gentios serão incluídos e pertencerão ao mesmo rebanho que João nem sequer uma vez.

Robert Banks, Pauls Idea of Community (Grand Rapids: Eerdemans; 1988), 116.

Ajith Fernando argumenta e sustenta que a aponta para a 3. Por que é essencial afirmar a singularidade de Cristo numa atmosfera de pluralismo?

Ajith Fernando os judeus. Se os ouvintes judeus tivessem entendido essa declaração de Jesus, iriam considerá-la um pensamento revolucionário. Eles sempre se consideraram separados e superiores às outras raças por serem o povo escolhido de Deus.“Somente pela aquisição de plena cidadania é que um gentio podia ingressar em grupos religiosos judaicos.” Jesus está sugerindo aqui que sua morte tornaria esse passo desnecessário. Uma importante dimensão do registro bíblico da obra de Cristo é sua ênfase no fato dea cruzearessurreição terem apagado as distinções terrenas entre os povos. Esse é o tema que a Igreja tem deixado de pregar e praticar, mas com certeza é uma característica singular que o evangelho apresenta a um mundo dividido por preconceitos comunitários e desavenças. A ressurreição é a prova O cristianismo assegura que seu fundador é singular e exclusivo, coisa que nenhuma outra religião ousa fazer. Mas como saber se essas alegações são verdadeiras? Já citamos diversas razões, mas nenhuma se iguala à ressurreição de Jesus. Na conclusão de sua mensagem aos curiosos atenienses, Paulo diz: [Deus] disso deu certeza a todos, ressuscitando-o [Cristo] dentre os mortos” (At 17.31, ARC). Apesar de [e dee a in pena DS 55 pa e ei

Perguntas 1. Como

premacia de Cristo”? 2. Explique como a morte de Cristo, descrita

“nova humanidade”?

173 tudo que Jesus ensinou acerca de sua missão, até seus discípulos ficaram atônitos diante de sua morte. No domingo de Páscoa, quando as mulheres compartilharam as novas da ressurreição informadas pelo anjo, Lucas 24.11 diz que “tais palavras lhes pareciam um como delírio, e não acreditaram nelas”. Quando os discípulos descobriram que Jesus de fato havia ressuscitado, ninguém foi capaz de detê-los. Eles foram proclamar que Jesus era o Messias (Cristo) até aos cidadãos mais hostis de Jerusalém. Pedro declarou, sobre a ressurreição de Jesus: “A este Jesus, que vós crucificastes, Deus o fez Senhor e Cristo” (At 2.36). O Novo Testamento, portanto, ensina que a ressurreição foi a autenticação divina da supremacia de Jesus.

O Criador do mundo apresentou de fato a solução plena para o dilema humano. Por isso, é suprema; por isso, é singular; por isso, é absoluta; por isso, temos a audácia de, nesta era pluralista, dizer que o Jesus retratado na Bíblia é singular e também supremo. Ele é nossa mensagem ao mundo. Certa vez, um hindu perguntou ao dr. E. Stanley Jones:

O que o cristianismo oferece que não encontramos em nossa religião?

Ele respondeu:

Jesus Cristo.

p. en ai Ad a aa ado st int para estudo

singularidade de Cristo “suem João 10.11-16, proporciona esperança para a', 37 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Snyder, cap. 19: A Igreja no plano de Deus', 'A Igreja plano de Deus 1 9

no Le eg Aé per, sá ne És E

EA

A

usmesa ERAS pe vinda Tyndile Seminary (Canadá), Foipastor é professor de seminário em São Paulo e em Chicago Escreveu diversos a, aro sas ancião Rei (São Paulo. ABU, 2004], Problem df ilimestins [O problema dos odres) e Liberating the Church (Libertando algreai.

Excertos de The Communitpofthe Kang (Downars Grove: Intervarsty, 1977) Usado com permissão.

Howard A, Snyder pr ser bíblicos, devemos enxergar a Igreja e o evangelho den-

tro do plano cósmico de Deus. Creio que Deus está salvando almas e as está preparando para o céu, porém nunca aceitaria tal definição como apropriada à missão da Igreja. É muito limitada. Não é uma definição bíblica, pois a Bíblia fala de um plano geral de Deus para toda a criação. Senhor de uma grande casa Qual é esse plano cósmico? Encontra-se descrito do modo mais resumido possível nos três primeiros capítulos de Efésios, pelos quais iniciarei minha análise bíblica. Dois fatos marcantes emergem desses capítulos. Primeiro: Deus tem um plano e um propósito. Segundo: esse plano abrange todo o Universo.

Paulo fala da “vontade de Deus” (Ef 1.1), do “beneplácito de sua vontade” (v. 5), do “mistério da sua vontade, segundo o seu beneplácito que propusera em Cristo” (v. 9). Repetidamente, Paulo afirma que Deus nos “escolheu” e “predestinou” de acordo com sua vontade. Paulo desejava falar de resultado à Igreja e, dentro do contexto, do plano e propósito de Deus.

Observe especialmente o versículo 10, A palavra grega para “dispensação” é oikonomia, a qual deriva da palavra oikos, “casa”, “família”, Diz respeito à supervisão de uma casa, ou ao plano ou organização da administração de uma casa. À ideia “é de uma grande casa ou família, da qual Deus é o Senhor, e que apresentaum sistema de administração sabiamente estipulado por ele”: Aqui encontramos um propósito divino para a salvação, o qual é metódico e elaborado com antecedência.” A figura de linguagem empregada por Paulo é bastante apropriada, visto que em outro lugar ele se refere à Igreja como “a família [0iteos] de Deus” (2.19), às vezes a mesma figura abrange todo o mundo habitado (a palavra “ecumênico” vem da mesma raiz). De sorte que a ideia de um plano

Robertson Nicoll (Org.), The Expositork Greek Testament (Grand Rapids: Eerdmans, 1961), 3, p. 259. Da mesma forma nossa palavra “econômico”. Observe também a palavra citonomia e suas várias traduções em Ef 3.2; CI 1.25, TFimi Le 16.2-4.

“Gerhard Kirrel Gerhard Friedrich (Org), Theolagical Dictionary of the Neve Testament (Grand Rapids: Eerdmans, 1964-1974), v. 5, p. 151-2,

O cósmico está implícita aqui no uso das palavras empregadas por Paulo. Talvez Paulo tenha até pensado nas parábolas de Jesus nas quais Deus é representado como o senhor de uma casa cexige prestação de contas no Reino de Deus (Mt 13.27;

Paulo também vê o plano de Deus dentro de uma perspectiva cósmica, O plano de Deus é fazer convergir nele todas as coisas tanto as do céu como da terra" (Ef 10). Cinco vezes Paulo fala das “regiões celestiais “Deuséo“Pai de todos, o qual é sobre todos, ot ar tager de todos e está em todos”, e Cristo “subiu acima de todos a sam encher todas as coisas” Na A nen de Dado ana to ae De pla 2 dra o a oês Cá pos

a Pa epnjaea as ado es É aa di Co Eanes ad e vcugo ed propos sua direita nos lugares celestiais, acima de todo principado, e potestade, e poder, e domínio, e de todo nome que se possa referir, não só no presente século, mas também no vindouro. E pôs todas as coisas debaixo dos pés, e para ser o cabeça sobre todas as coisas, á o deu à qua igreja, a qual é o seu corpo, a plenitude daquele que a Lda óticos cria tódas dé coisas”

Que sublime ponto de partida para a compreensão da Igreja e do Reino! Não ousamos nos precipitar em direção a textos prediletos, como 2.8,9, 4.11,12 ou 6.10-20, sem dedicar total atenção ao plano de Deus, o qual depende da vitória de Cristo. A Palavra de Deus é clamissão à medida que vemos a Igreja como parte do plano e propósito que Deus tem para toda acriação. Não um plano reserva Mas qual é o plano geral de Deus? Apenasisto: que Deus possa glorificar a si mesmo pela união de todas as coisas em Cristo. “O plano de Deus é unir e reconciliar todas as coisas em Cristo, de 17.8. Esses textos comprovam que Cristo foi indicado para Deus é eterno.

Gerhard Kittel Gerhard Friedrich, op. cit. v. 2, p.

ie modo que os homens possam novamente servir ao seu Criador”

À ideta-chave é sem dúvida a reconciliação. O plano dívino objetiva restaurar à criação, a fim de recuperá-la, num cumprimento glorioso, do dano provocado à humanidade e à natureza pela Queda. O desígnio divino de reconciliar todas as coisas em Cristo reafirma seu desejo inicial, demonstrado na criação, e agora adaptado à realidade da presença do pecado no mundo. Eneretanto, essa é à forma humana de expressar o plano, que encara a realidade de baixo para cima. Não devemos imaginar que o plano cósmico quyino de reconciliação seja o “plano Bº, o segundo melhor plano, o plano reserva que Deus preparou caso a criação resultasse em fracasso, pois o plano eterno de Deus já existia antes da queda e da criação, existia na mente de Deus «ne. da criação do mundo” (Ef 1.4)!

los MNA siena contatado P é msdetilito adia cais Deus não apenas de pessoas, mas de é “todas as coisas, tanto as do céu, como as da terra (Ef 1,10). Ou, como Paulo A se expressa em Colossenses 1.20, é a intenção de Deus por a io de e Cri Cristo ir liar ias “consi “consigo mesmo to-Us d PETAAS, RIP PENIS Es amd nos céus Um dos itens Casas perda no é a reconciliação do ser humano com Deus por meio do Sangue de Jesus Cristo, Entretanto, a reconcilia-SÃO obtida por Cristo atinge todas as alicnações resultantes de nosso pecado entre o homem que esse pensamento possa ser, as Escrituras ensinam que essa reconciliação inclui até mesmo a redenção do universo físico dos efeitos do pecado. Assim, tudo estará devidamente sob o senhorio de Jesus Cristo (Rm 8.19-21).A New International Version, ao traduzir Efésios 1.10, diz que o propósito de Deus é “trazer todas as coisas conjuntamente no céu e sobre a terra para debaixo de uma só cabeça, a saber, Cristo” ser o Salvador desde a eternidade e que o plano do Reino de 681-2.

e para indicar os sacramentos, mas também para se referir a toda a ação de Deus na História, todo o tempo preenchido pelo Espírito em Jesus Cristo Creio que devemos voltar a empregar essa palavra sentido mais amplo protundo” (The

Esse é o plano geral de Deus, como visto em Efésios. À mesma perspectiva permeia outros escritos paulinos, especialmente os dois primeiros capítulos de Colossenses. Em 2Coríntios 5.17-21 aprendemos que “Deus estava em Cristo reconcihando consigo o mundo” e que confiou à Igreja tanto a mensagem (fogos) quanto o ministério (diakonia) da reconciliação. Semelhante importância tem o ensino de Romanos 8, de que, no plano de Deus, a liberdade de salvação do cristão se estenderá a toda a criação, pois “a própria criação será redimida do cativeiro da corrupção, para a hberdade da glória dos filhos de Deus” (Rm 8.21).

Em todos esses textos, Paulo principia com o fato da salvação individual e coletiva pormeio de Cristo. Com isso, ele posiciona a salvação pessoal numa perspectiva cósmica. Aqui não há qualquer possibilidade de optarmos por outra ideia de salvação: não existe o conceito de um túnel espiritual. À redenção do ser humano é o centro do plano de Deus, não a circunferência. Paulo muda de uma fotografia em close parauma imagem panorâmica. Na maioria das vezes, ele utiliza uma lente de aproximação para obter algum detalhe da redenção pessoal, mas às vezes cobre uma área bem maior, a qual abrange “todas as coisas” (visíveis e invisíveis; passadas, presentes e futuras; nos céus e sobre a terra; todosos principados e poderes) que fazem parte do cenário cósmico-histórico. Para entender E, o que Deus realizou em Cristo a favor e por á meio do homem, devemos recuar um pouco e olhar para o propósito cósmico de Deus em sua inteireza.

Esse é o ponto de vista de Paulo acerca do plano geral de Deus. Mas será que também é o ponto de vista da Bíblia em geral? Em outras passagens, encontramos, em essência, a mesma perspectiva, pois toda a Escritura é resultado do sopro divino. Todas as promessas de restauração cósmica encontradas no Antigo Testamento

“AA, Van Ruler, citando W. C. van Unmik, observa que Christian Church and the Old Testament, p. 78-9).

de Deus aplicam-se aqui, atingindo o clímax na sublime visão de Isaías (Is 11,6-9; 35.1-10; 65.17-25). A mensagem básica do livro de Apocalipse é a união harmoniosa de todas as coisas sob o senhorio de Cristo, enquanto todo mal e toda discórdia são destruídos. Num contexto um tanto diferente, essa mesma perspectiva “sintetizadora” é evidente em Hebreus 1 e 2. As parábolas do Reino, contadas por Jesus, também apontam nessa direção. Ainda Isaías, Pedro e João mencionam a criação de um novo céu e uma nova terra (Is 65.17, 66.22; 2Pe 3.13; Ap 21.1). O testemunho das Escrituras é consistente: o mesmo Deus que criou perfeito o Universo e o sustém em sua condição decaída (Hb 1.3) restaurará todas as coisas por meio da obra de Jesus Cristo. Como teremos oportunidade de ver, a tarefa particular de Paulo é enfatizar o papel da Igreja nessa redenção cósmica.

É impossível compreender plenamente esse plano cósmico, a oikonomia divina que une todas as coisas em Cristo. É por isso que Paulo se refere continuamente a esse plano como um segredo ou algo escondido, um mysterisn.* Entretanto, é possível pelo menos compreender o esboço desse plano e que este plano está centrado na grande obra reconciliadora e reconquistadora de Jesus, a qual foi realizada por meio de sua vida, morte ressurreição e agora está sendo aplicada pela operação contínua do Espírito Santo. Agora ou depois? Um problema bem espinhoso aqui é a questão do mal. Se Deus está reconciliando consigo mesmo “todas as coisas” por meio de Jesus Cristo, o que acontecerá com os que rejeitam a Cristo e com Satanás e seu reino? À Bíblia não responde a todas as nossas perguntas, mas deixa claro que toda autoridade e poder estranhos serão destruídos (1Co 15.24,25). Jesus foi incisivo a respeito da destruição eterna dos ímpios “os pais da Igreja empregavam a palavra mysterion não apenas

7 The God Who Is There (Downers Grove; InterVarsity Press, 1968) [publicado no Brasil por Refúgio Editora sob o título f O Deus intervém). V, Francis A. Schaeffer, Poluição e a morte do homem (Rão de Janeiro: JUERP, 1976), p. 71-5. 2 A tradução “pela igreja” é ambígua e assim reforça o fato de que a Igreja é o agente plano

(por exemplo, Mt 25.31-46). Apocalipse revela

que Satanás e seus seguidores sofrerão julgamen-

entrará na nova Jerusalém (21.27). Essas passagens apresentam o que os Salmos proclamam repetidas vezes. Deus, o Rei, conquistará todos

os seus inimigos. Nossa compreensão do plano

divino de reconciliação deve ser consistente com tais passagens bíblicas, mesmo que não compre-

endamos plenamente como isso sucederá.

Quando Deus concluirá sua obra reconciliadora? Quase todos os cristãos admitem que, em algum sentido, Deus está conduzindo a História

a um clímax cósmico, porém uma ala da Igreja

afirma: “Não agora, mas depois”. Outro grupo

retruca: “Não depois, mas agora!”. Essa discussão gira em torno da natureza do Reino de Deus.

Deumilado, estão os que adiam a presença real

do Reino para depois da volta de Cristo ((Não agora, mas depois!”) esperam hoje apenas uma

renovação substancial no âmbito da experiên"cia religiosa do indivíduo, mas não na política, nem naarte, nem na educação, nem na cultura em geral, nem mesmo na Igreja. Do outro lado,

estão os que enfatizam com tal veemência a renovação social no presente que negam ou obscurecema conversão pessoal e a futura volta

de Cristo no tempo e no espaço e não levam

a-sério a profunda pecaminosidade e rebeldia

doser humano.

Nossa esperança é que os cristãos ortodoxos de todo o mundo percebam que o Reino de Deus não é nem totalmente presente nem à totalmente futuro. O Reino de Deus (auniãode todas as coisas debaixo do senhorio de Cristo)

está entre nós agora, mas também está vindo e

ainda virá. Sem dúvida, essa é uma das lições

das parábolas do Reino.

Francis Schaeffer expõe esse ponto de vis-

ta mais equilibrado quando se refere a uma

“cura substancial” já agora em todas as áreas

de alienação provocada pelo pecado. Ão evitar

“John Bright, The Kingdom of God (Nashville: Abingdon

nO os extremos, encontrados às vezes tanto no pré-milenarismo quanto no pós-milenarismo, Schaefer afirma que os cristãos não devem lançar toda a reconciliação real num futuro escatológico nem esperar perfeição absoluta agora. À promessa de Deus é de uma cura substancial agora e uma cura completa depois da volta de Cristo.”

Isso significa que Deus já iniciou a reconciliação de todas as coisas na história humana. À “plenitude dos tempos” já veio (Gl 4.4; Ef1.10), mas não em sua absoluta plenitude. O ato decisivo da obra reconciliadora de Deus aconteceu em Jesus Cristo. O plano cósmico de Deus agora está se revelando.

À Igreja não é o Reino, mas está ligada ao Reino. É o povo do Reino de Deus, a “comunidade escatológica” que já vive sob o governo de Deus e proclama esse governo,* Os discípulos de Jesus são colaboradores de Deus na apresentação do Reino, pois a Cabeça e o Corpo agem conjuntamente (2Co 1Co 3.9). Contudo, mesmo em ação, a Igreja sabe e confessa que a vinda plena do Reino aguarda a revelação final de Jesus por ocasião de sua segunda vinda.

Devemos agora examinar mais detalhadamente a questão do lugar da Igreja dentro do plano geral de Deus. Qual o lugar da Igreja dentro do plano cósmico de Deus? O que é, de fato, a Igreja? Uma frase notável ocorre em Efésios 3.10: Paulo afirma que o plano cósmico de Deus é que, “pela igreja, a multiforme sabedoria de Deus se torne conhecida, agora, dos principados e potestades nos lugares celestiais”.?

Examinemos mais detidamente o texto de Efésios:

Quando ledes, podeis compreender o meu

discernimento do mistério de Cristo, o qual,

em outras gerações, não foi dado a conhe-

do de Deus.

revelado aos seus santos apóstolos e profe-

tas, no Espírito, a saber, que os gentios são

coerdeiros, membros do mesmo corpo e co-

participantes da promessa em Cristo Jesus

por meio do evangelho A mim, o menor

de todos os santos, me for dada esta graça de

pregar aos gentios o evangelho das inson-

dáveis riquezas de Cristo e manifestar qual

seja a dispensação [cikonomsa, “administra-

ção”) do mistério, desde os séculos, oculto

em Deus, que criou todas as coisas, para que,

pela igreja, a multiforme sabedoria de Deus

se torne conhecida, agora, dos principados e

potestades nos lugares celestiais, segundo o

eterno propósito que estabeleceu em Cristo

O mistério, agora conhecido, é que tanto Judeus quanto gentios podem participar da redenção prometida por Deus. De fato, o judeu e o gentão são conduzidos juntos a “um sócorpo”. Como Paulo já explicou, por meio de Jesus Cristo, Deus “de ambos fez um” e derrubou “a parede da separação que estava no meio, a inimizade”, Dessa forma, todos os cristãos sioum só corpo, um “novo homem”. Isso aconteceu “por intermédio da cruz, destruindo [Deus] por ela a inimizade” (Ef 2.14-16).

Observe aqui as duas dimensões. Crentes judeus e gentios são reconciliados tanto com Deus e também um com o outro. Passaram a participar de um relacionamento reconcilia-A dor com Jesus, relacionamento que transcende “o e destrói a antiga inimizade que nutríam um é pelo outro, Não são mais inimigos: agora são irmãos irmãs.

Qual é, então, o mistério do plano de Deus? É que, pelo poder redentor de Cristo, Deus age com tal poder que é capaz de vencer o ódio e superar as hostilidades. O mistério não é simplesmente que o evangelho seja pregado aos gentios, mas que por meio dessa pregação os crentes gentios são “coerdeiros” e“membros do mesmo corpo”.

É nesse contexto que podemos compreender o versículo 10, A “multiforme sabedoria de

A Igreja no plano de Deus Deus” se torna agora conhecida por obra do amor reconciliador de Cristo, amor que une judeus e gentios como irmãos na comunidade do povo de Deus, a Igreja. Mas só judeus gentios? Será que o milagre do evangelho encerra com a reconciliação entre judeus e gentios no primeiro século de nossa era? É certo que não! Há mais coisas relacionadas ao mistério do plano de Deus. À reconciliação inicial e histórica revela que Deus reconcilia consigo mesmo, pelo sangue da cruz, pessoas e povos alienados. Começou com a reconciliação entre judeu e gentio e se amplia para alcançar livre e escravo, homem e mulher, negro e branco, rico e pobre (Cl 3.10,11; G1 3.28).

É por essa razão que Paulo pode afirmar que, agora, “pela igreja, a multiforme sabedoria de Deus” se torna “conhecida dos principados e potestades nos lugares celestiais”. Pois é precisamente na Igreja que essa reconciliação acontece. A Igreja é o fruto do amor reconciliador de Cristo e, dessa forma, a revelação da multiforme sabedoria de Deus. Na qualidade de Corpo de Cristo, a Igreja participa da obra reconciliadora de Cristo.

É nesse sentido que a Igreja é o agente do plano de Deus. Essa é a razão por que Pedro, Paulo, Tiago e João insistem tanto em que os crentes se reconciliem um com o outro, para que analisem criteriosamente sua maneira de andar, evitem toda parcialidade e andem em amor e em comunhão com os irmãos e irmãs. Sua fidelidade, e a nossa, tem grande significado para o Reino.

À Igreja é mais que o agente divino da evangelização ou das mudanças sociais. Ela é, em submissão a Cristo, o agente de todo propósito cósmico de Deus. O Reino de Deus está víndo, e, enquanto a vinda do Reino ocorre na História, antes da volta de Cristo, o plano de Deus será realizado por meio da Igreja. Isso está de pleno acordo com o que já vimos, O plano de Deus é reunir todas as coisas em Cristo, a Igreja é o Corpo de Cristo, O que Deus faz em Jesus Cristo e o que faz na Igreja por meio dela são parte de um todo,

três pontos a seguir são um resumo do capítulo 12 de Howard A, Snyder, The Problem of Wineskins: Church Structure

Howard A. Snyder

Qualquer que seja a maneira em que compreendamos a Igreja, esta deve ser vista em relação aos propósitos do Reino de Deus, mas dizer que a Igreja é o agente do Reino de Deus pode significar coisas radicalmente diferentes, caté contraditórias, de acordo o que entendemos ser a Igreja. Assim, devemos analisar com cuidado a ideia bíblica de Igreja. A perspectiva bíblica A Bíblia afirma que a Igreja é nada menos queo Corpo de Cristo. É a Noiva de Cristo (Ap 21.9), o rebanho de Deus (1Pe 5.2),0 templo vivodo Espírito Santo (Ef 2.21,22). Virtualmente, todas as figuras de linguagem empregadas pela Bíblia em relação à Igreja enfatizam um relacionamento essencial, vivo e amoroso entre Cristo e a Igreja. Isso salienta o papel-chave da Igreja dentro do plano de Deus e nos relembra que “Cristo amou a igreja e a si mesmo se entregou por ela” (Ef 5.25). Se a Igreja é o Corpo de Cristo (isto é, o meio pelo qual a Cabeça age no mundo), então a Igreja é uma parte indispensável do evangelho, e a eclesiologia é inseparável da soteriologia. Portanto, adotar uma postura antieclesiástica significaria diluir o próprio evangelho e, ao mesmo tempo, demonstrar uma compreensão errônea daquilo que a Bíblia quer dizer com “a igreja”.

A Bíblia apresenta a Igreja no meio da cultura, lutando para ser fiel, mas algumas vezes corrompida por alianças contrárias à sua natureza, como o paganismo e o legalismo judaico. Na Bíblia, os aspectos terreno e celeste da Igreja encaixam-se com perfeição num todo e assim não nos deixam com duas igrejas incompatíveis ou com uma Igreja composta de dois níveis diferentes, A Igreja é una: é o Corpo uno de Cristo, que agora existe tanto na terra quanto “nos lugares celestiais” (Ef 1.3; Esse conceito de Igreja é tremendamente relevante para a época atual por razões que são básicas, do ponto de vista bíblico da Igreja,

“Os in a Technological Age (Downers Grove; InterVarsity Press,

Em primeiro lugar, a Bíblia vê a Igreja pela perspectiva cosmo-histórica. À Igreja é o povo de Deus, povo que ele vem formando e pelo qual vem agindo através da História. Nesse sentidoa Igreja tem raízes que chegam ao Antigo Testamento, até mesmo à Queda. Sua missão se projeta para toda a história restante e para toda a eternidade. Essa linha horizontal é a dimensão histórica.

À dimensão cósmica nos faz lembrar que nosso mundo espaço-temporal é de fato parte de um universo mais amplo e espiritual no qual Deus reina. À Igreja é o Corpo dado a Cristo, o Salvador conquistador. Deus escolheu posicionar a Igreja junto com Cristo bem no centro de seu plano de reconciliar o mundo consigo mesmo (Ef 1.20-23).

À missão da Igreja é, portanto, glorificar a Deus por meio da continuação, no mundo, das obras do Reino, que Jesus iniciou (Mt 5.16). Isso ao mesmo tempo justifica e requer o ministério mais amplo da Igreja de “evangelizar os pobres,

proclamar libertação aos cativos e restauração da vista aos cegos, pôr em liberdade os oprimidos, e apregoar o ano aceitável do Senhor” (Lc 4.18,19).

Em segundo lugar, a Bíblia vê a Igreja em termos carismáticos, dons do Espírito não institucionais. Num sentido amplo, a Igreja é uma instituição, porém no aspecto mais básico é uma comunidade carismática. Ela existe pela graça (charis) de Deus e é edificada por meio dos dons da graça (charismata) conferidos pelo Espírito. Do ponto de vista bíblico, a Igreja não está estruturada da mesma maneira que uma empresa comercial ou uma universidade, e sim como o corpo humano com base na vida. Em seu nível mais básico, é uma comunidade, não uma hierarquia; um organismo, não uma organização (1Co 12; Rm 12.5-8; Ef 4.1-6; Mt 18.20; 1Pe

Em terceiro lugar, a Bíblia vê a Igreja como a comunidade do povo de Deus. Aqui o cósmico e o 1975).

Evangelism and Man''s Search for Freedom, Justice, and Fulfillment, in: J. D. Douglas (Org.), Let the Earth Hear His 2 De modo semelhante, Hans King descreve a Igreja como “a povo de Deus a comunidade dos fiéis”. A Igreja é “a comunidade do de Deus, chamado fora chamado juntos” (Structures of the Church [London:

[A 156 carismático se unem, e vemos a Igreja inserida no mundo e também a transcendê-lo,

Uma vez que a Igreja é o povo de Deus, ela inclui todo o povo de Deus de todas as épocas e de todos os lugares, bem como aqueles que já cruzaram a fronteira espaço-temporal e vivem na presença imediata de Deus. O povo de Deus, porém, deve possuir uma expressão local e visível. Nesse nível, a Igreja é a comunidade do Espírito Santo. Samuel Escobar explica: “Deus chama os que se tornam seu povo a fazerem parte de uma comunidade. Assim, a nova humanidade que Cristo está criando se torna visível em comunidades cuja qualidade de vida reflete o exemplo de Cristo”.!

A Igreja descobre sua identidade nesse ritmo constante e complementar de ser um povo e uma comunidade, tanto dentro de uma cidade ou de uma cultura quanto no contexto mundial. Povo e comunidade, juntos, constituem o que o Novo Testamento chama ekklesia, a Igrejade Deus dos “chamados para fora” e dos chamados para estar juntos.

As figuras bíblicas para a igreja Corpo de Cristo, Noiva de Cristo, família, temploou videira de Deus, entre outros nos proporcio“nam a ideia básica da Igreja. Qualquer definição contemporânea tem de estar em harmonia com essas figuras. Contudo, são metáforas, não definições. Creio que a definição mais bíblicaé dizer que a Igreja é a comunidade do povo de Deus. Os dois elementos distintivos aqui são a Igreja como povo, uma nova raça ou humanidade, e a Igreja como comunidade ou comunhão a koinonia do Espírito Santo.” A comunidade do povo de Deus Esses conceitos gêmeos enfatizam que a Igreja é, primeiramente, povo, e não uma estrutura institucional, Enfatizam que a Igreja não éuma simples coleção de indivíduos isolados, mas tem Voice (Lausanne: World Wide Publications, 1975), p. 312,

À Igreja no plano de Deus uma natureza corporativa ou comunitária que é absolutamente essencial à sua existência, Finalmente, essas verdades mostram que ser uma comunidade e um povo é um dom de Deus, graças à obra de Jesus Cristo e à habitação do Espírito Santo: não é produzida por técnicas ou planos humanos. À Igreja é constituída pelo povo de Deus por obra de Jesus Cristo, e essa realidade abre as portas à possibilidade de uma comunidade verdadeira e profunda. Aqui a ilustração do Corpo adquire um sentido adicional, que abrange tanto o fato de sua existência quanto a comunidade como o fato de sua existência como povo.

Esse conceito da existência de um povo está arraigado ao Antigo Testamento e ressalta o fato objetivo da atuação divina através da História para chamar e preparar uma “raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus” (1Pe 2.9; v. Ex 19.5,6). A palavra grega traduzida nesse versículo por “povo” é /aos, da qual derivam os vocábulos em português “leigo” e “laicato”. Isso nos faz lembrar que a Igreja toda é um laicato, um povo. Aqui a ênfase recai sobre a universalidade da Igreja o povo de Deus espalhado por todo o mundo em centenas de denominações, movimentos e outras estruturas. É a realidade corporativa, mundial e abrangente de multidões de homens e mulheres que, por toda a História, têm se reconciliado com Deus, por meio de Jesus Cristo. Esse fato celebra a ação de Deus na História para constituir um povo peregrino e está especialmente relacionado com o conceito da aliança. Vista pela perspectiva cosmo-histórica, a Igreja é o povo de Deus.

A Igreja é também uma comunidade ou comunhão, uma koinonia. Essa ênfase é mais claramente encontrada no Novo Testamento e surge da experiência do Pentecostes. Se o fato da existência do povo ressaltar a continuidade

a E De IR CARS ELE DRESDEN SA ACERTAR TSE PALEANDOS ORAR ESESNNÃ SENTE EDER]

Perguntas para estudo 1. Diga com suas palavras qual é o plano cósmico de Deus, Qual o papel da Igreja nesse plano?

que distingue a Igreja do Reino? Que implicações essa distinção traz para a missionária? 3. Você concorda Snyder Igreja é instituição mais comunidade

carismática? Quais as implicações práticas desse conceito para a plantação de igrejas?

eme do plano de Deus do Antigo para o Novo Testamento, a ideia de comunidade chama a atenção para a “nova aliança”, o “vinho novo”, a “coisa nova” que Deus fez na ressurreição de Jesus Cristo e no batismo com o Espírito Santo no dia de Pentecostes. Aqui a ênfase recai sobre a Jocalidade da Igreja em sua vida comum, intensa e interativa. Vista como organização carismática, a Igreja é a comunidade do Espírito Santo.

Como comunidade, a vida locale temporal da Igreja é enfatizada num determinado contexto cultural. Aqui descemos das maiores alturas para o dia a dia dos cristãos, para o fato de viverem juntos, partilhando uma vida comum. Aqui também deparamos com o problema dos odres de vinho a necessidade de lidar com as estruturas práticas, a fim de permitir a existência da verdadeira comunidade e encorajá-la.

Falar da Igreja como comunidade é ter um ponto de vista um tanto mais restrito, visto quea Igreja é mais que comunidade: é também o povo de Deus espalhado, o fermento do evangelho na massa do mundo, disperso e trabalhando em cada área da sociedade. Todavia, a comunidade é essencial, pois onde ela está ausente e onde não há estruturas trabalhando pela nutrição dessa comunidade, o fermento se torna ineficaz, eo sal perde seu sabor.

É crucial (especialmente numa situação mundial e multicultural como a que a Igreja enfrenta hoje em dia) esclarecer que a essência da Igreja é o povo, não a organização; que 2. O

ela é uma comunidade, não uma instituição. À grande Jinha divisória que marca o pensamento contemporâneo acerca da Igreja está situada exatamente aqui. Biblicamente, a Igreja é a comunidade do povo de Deus, e essa é uma realidade espiritual válida para todas as culturas, mas as instituições eclesiásticas seminários, denominações, juntas missionárias, editoras ou o que quer que sejam não constituem a Igreja. Elas são, na verdade, instituições de apoio criadas para servir à Igreja em sua vida e missão. Estão culturalmente limitadas e podem ser sociologicamente entendidas e avaliadas, mas não são a Igreja. Quando se confundem tais instituições com a Igreja ou quando são vistas como componentes essenciais da Igreja, surge toda espécie de ideias desafortunadas e errôneas, e a Igreja fica amarrada a uma expressão cultural momentânea e particular.

À Igreja é o Corpo de Cristo, a comunidade do Espírito Santo, o povo de Deus. É a comunidade do Rei e, no mundo, agente do plano divino de reconciliar todas as coisas. Ser agente divino do Reino não pode ser considerado apenas um meio entre vários outros, pois desde a cruz e para toda a eternidade permanece incontestável que “Cristo amou a igreja e a si mesmo se entregou por ela, para que a santificasse, tendo-a purificado por meio da lavagem de água pela palavra, para a apresentar a si mesmo igreja gloriosa, sem mácula, nem ruga, nem coisa semelhante, porém santa e sem defeito” (Ef5.25-27).

obra menos uma e uma', 38 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 4 · Leitura — Pinto, cap. 20: O que a Bíblia ensina sobre os não alcançados', 'O Bíblia sobre É,

Carlos O, Cardoso Pinto

que a ea sf É E

Ad f hi uunuam CARLOS O. CARDOSO PINTO é reitor do Seminário Bíblico Palavra da Vidaem Alba Fo Pulo, Pesci detonado sea ep ai

Extraído da revista Copocitando, APM, 1999, u 7. Usado com permissão.

alcançados O últimos anos viram um tremendo aumento no interesse

por missões participação na tarefa missionária por parte da Igreja brasileira, Centenas de missionários brasileiros varreram o globo terrestre plantando igrejas, discipulando, “fazendo tendas” e se esforçando para cumprir a Grande Comissão, Isso é o que deveria ser feito há muito tempo. O COMIBAM, em 1987, foi o despertador histórico de que a Igreja brasileira precisava.

No entanto, nas escolas de teologia, nos bancos das igrejas pior de tudo, nos púlpitos das igrejas, a ideia de que a evangelização dos não alcançados é necessária e urgente continua a ser forte e constantemente contestada,

À isso corresponde a postura pós-moderna da sociedade em geral, para quem os absolutos foram abolidos e qualquer questão de fé passou a ser inviolavelmente individual, sem direito a proselitismo e à conversão, O neopanteísmo promovido acintosamente pela mídia secular sob a forma de novelas, anúncios, filmes e “especiais” também contribui para incitar a pergunta: “Não é melhor deixar os adeptos de religiões naturais aos cuidados de seus deuses e espíritos?”

Mesmo entre os chamados evangélicos conservadores começam a surgir vozes questionando a pregação de um tormento eterno para os perdidos, especialmente para os que jamais ouviram a pregação do evangelho, Punição temporária, seguida de extinção, parece ser a opção mais popular entre os que rejeitam o conceito de um inferno eterno como incompatível com a natureza amorosa de Deus,

À situação é de tal modo confusa que numa recente conferência missionária promovida por organizações teologicamente conservadoras apenas 37% dos entrevistados criam que “uma pessoa que nunca tenha ouvido o evangelho está eternamente perdida”, “po Já 25% acreditavam que “a pessoa será salva ou perdida com base em quão bem seguiu à verdade que conhecia”,

Tais questionamentos revelam um enorme desafio a toda a estrutura teológica conservadora, O quadro abaixo resume as diversas áreas da teologia que ficarão comprometidas se essas dúvidas não forem sanadas com respostas bíblicas e relevantes.

A natureza não é suficiente? Bibliologia

Cartas O, Cardoso Pinto [A CT O caráter de Deus A singularidade de Cristo primaria A necessidade do homem

“A ira de Deus se revela do céu contra toda impiedade e perversão dos homens que detêma verdade pela injustiça; porquanto o que de Deus se pode conhecer é manifesto entre eles, porque Deus lhes manifestou. Porque os atributos invisíveis de Deus, assim o seu eterno poder, como também a sua própria divindade, claramente se reconhecem, desde o princípio do mundo, sendo percebidos por meio das coisas que foram criadas. Tais homens são, por isso, indesculpáveis; porquanto, tendo conhecimento de Deus, nãoo glonficaram como Deus, nem lhe deram graças; antes, se tornaram nulos em seus próprios raciocínios, obscurecendo-se-lhes o coração insensato. Inculcando-se por sábios, tornaram-se loucos e mudaram a glória do Deus incorruptível em semelhança da imagem de homem corruptível, bem como de aves, quadrúpedes e répteis. Por isso, Deus entregou tais homens à imundícia, pelas concupiscências de seu próprio coração, para desonrarem o seu corpo entre si; pois eles mudaram a verdade de Deus em mentira, adorando e servindo a criatura em lugar do Criador, o qual é bendito eternamente. Amém! Por causa disso, os entregou Deus a paixões infames; porque até as mulheres mudaram o modo natural de suas relações íntimas por outro, contrário à natureza; semelhantemente, os homens também, deixando o contacto natural da mulher, se inflamaram mutuamente em sua sensualidade, cometendo torpeza, homens com homens, e recebendo, em si mesmos, a merecida punição do seu erro, E, por haverem desprezado 9 conhecimento de Deus, o próprio Deus os entregou a uma disposição mental reprovável, Ko

OD

Teologia própria

Hamartologia para praticarem coisas inconvenientes, cheios de toda injustiça, malícia, avareza e maldade; possuídos de inveja, homicídio, contenda, dolo e malignidade; sendo difamadores, caluniadores, aborrecidos de Deus, insolentes, soberbos, presunçosos, inventores de males, desobedientes aos pais, insensatos, pérfidos, sem afeição natural e sem misericórdia, Ora, conhecendo eles a sentença de Deus, de que são passíveis de morte os que tais coisas praticam, não somente as fazem, mas também aprovam os que assim procedem” (Rm 1,18-32), O que podemos aprender de útil nessa perspectiva quanto aos não alcançados? Em primeiro lugar, que todos os homens têm acesso a alguma revelação de Deus, Não existe a chamada ignorância desculpável em relação a Deus, ainda que possa haver em relação a Jesus. Mesmo quem alegue a última não poder alegar a primeira,

Em segundo lugar, essa ignorância não é algo passivo e inocente. É deliberada e implica culpa. À ira de Deus se manifesta contra os que resistem à verdade pela injustiça (v. 18), contra os que não deram a Deus a glória devida, antes o reduziram à forma e aos atributos das criaturas (v. 23,25), sentindo-se assim à vontade para justificar suas práticas pecaminosas e continuar nelas, Deturparam o verdadeiro conhecimento disponível e se alienaram deliberadamente de Deus, À idolatria que caracteriza a humanidade não é uma busca, mas uma fuga de Deus,

Assim, ainda que “quem não crê no Filho” já esteja julgado (Jo 3.36), essa acusação últi-

O eram wma nem sequer precisará ser invocada contra es que tiverem contra sta culpa prévia de haver rejeitado ao Pai em sua revelação geral, Uma ilustração do triste cotidiano brasileiro pode nos ajudar a entender, Em 1993, assistimos chocados à chamada “chacina de Vigário Geral", em que 21 pessoas foram covardemente assassinadas por supostos policiais, Alguns desses criminosos já foram julgados e sentenciados, As sentenças chegam a 420 anos, Supondo que a pena tivesse de ser totalmente cumprida (o Codigo penal brasileiro impede isso), nenhum dos condenados chegaria a pagar um quarto dos crimes cometidos, Os três primeiros assassinatos seriam suficientes para extinguir sua vida na prisão, À sentença total, 420 anos, permanece, embora apenas 60 anos (a culpa dos três primeiros) sejam suficientes para que vida se pague com vida, Não conhecer a Cristo éa ofensa máxima, mas não conhecer a Deus (a primeira ofensa) é suficiente para condenar eternamente o homem que rejeita e distorce o conhecimento oferecido pelo próprio Deus a todos os homens, em todo lugar e em todas as épocas.

Pensando em termos missionários, alcançar os não alcançados é essencial para que eles tomem conhecimento de sua precária situação, É preciso que eles se convertam dos ídolos ao Deus vivo e verdadeiro e que então se voltem para o Filho. Deixá-los em sua pseudo-harmonia com a natureza é condená-los irremediavelmente à perdição. É preciso que conheçam a Jesus como o agente único desse perdão. É

Quando as multidões viram o que Paulo fize-

ra, gritaram em lingua licaônica, dizendo: Os

deuses, em forma de homens, baixaram até

nós, À Barnabé chamavam Júpiter, e a Paulo,

Mercúnio, porque era este o principal porta-

dor da palavra. O sacerdote de Júpiter, cujo

templo estava em frente da cidade, trazendo

para junto das portas touros e grinaldas, que-

na sacnificar juntamente com as multidões.

Porém, ouvindo isto, os apóstolos Bamabé e

Paulo, rasgando as suas vestes, saltaram para

o meio da multidão, clamando: Senhores, por

QUO BOA ON0ÍnA sODTO NÃO SicUNgada,

que fazeis isto? Nós também somos homens

como vós, sujeitos aos mesmos sentimentos,

e vos anunciamos o evangelho para que des-

tas coisas vãs vos convertais ao Deus vivo, que

fez o céu, a terra, o mar e tudo o que há neles;

o qual, nas gerações passadas, permitiu que

todos os povos andassem nos seus próprios

caminhos; contudo, não se deixou ficar sem

testemunho de si mesmo, fazendo o bem,

dando-vos do céu chuvas e estações frutife-

ras, enchendo o vosso coração de fartura e

de alegria, Dizendo isto, foi ainda com difi-

culdade que impediram as multidões de lhes

oferecerem sacrifícios (At 14,11-18),

Na ótica do pós-modernismo, esse é um dos incidentes mais lamentáveis de toda a Escritura, pois Paulo e Barnabé arrogantemente rejeitam a expressão espontânea e criativa de religiosidade do povo de Listra, a favor de conceitos abstratos que não podiam compreender. Paulo e Barnabé deveriam aceitar aquela concretização da vivência espiritual dos listrenos, pois Deus certamente teria se agradado de sua sinceridade, e não a rejeitaria.

Se levarmos a Bíblia a sério, no entanto, o que essa passagem nos ensina? Primeiro de tudo, ela ensina o poder deturpador da idolatria sobre a mente humana. Embora homens, em toda parte, sejam por natureza feitos para Deus e anseiem por uma revelação dele, por um encontro com ele, no momento em que algo assim acontece, o Deus único é atomizado, dividido em vários, cada um representando um dos infinitos atributos etemos de Deus (o que os teria feito identificar Bamabé com Zeus Júpiter)?

Em segundo lugar, demonstra que o objetivo missionário de Paulo era converter os gentios idólatras ao verdadeiro Deus (observe a ênfase teocêntrica do v. 15), por meio do evangelho. À humanidade tem de prestar contas a Deus, Ele é o objeto de nossa fé (v. 1Pe 1.21), e sua revelação em Cristo (sua encamação, vida, morte, ressurreição e Reino) é o conteúdo cognitivo dessa fé.

Cartos O Cardoso Pinto

Em terceiro lugar, fala da paciência divina para com a obstinação humana de fazer caminhos que o ignorem e deformem pela idolatria (v. 16-17). Essa paciência, todavia, não significa conivência com o pecado. O testemunho dado pela natureza e pela providência (a preservação e renovação divinas do Universo a favor das criaturas) é incriminador, como Paulo deixa claro em Romanos 1.18-32.

Em quarto lugar, fala de um Deus benevolente para com o homem (v. 17). Seria contraditório afirmar a benevolência no plano material e questioná-la no plano espiritual. Que Deus esquizofrênico trataria bem o homem na terra para depois, injustamente, destruí-lo para sempre no inferno? O liberal e o ateu, que propõem a bondade da natureza como alternativa para a bondade de Deus, pelo menos são coerentes quando negam a existência ou a necessidade de um inferno. À coerência impede que os chamados conservadores afirmem a bondade temporal de Deus e questionem sua Justiça punitiva. Se cremos que Deus étãobom com os índios ianomâmis, por exemplo, em vez de questionar sua justiça pela condenação eterna desses índios devemos concentrar nossas energias espirituais em orar por um derramamento do Espírito entre eles e contribuir para que isso seja possível, sustentando ali verdadeiros servos de Deus que os encaminhem à verdade.

Paulo, levantando-se no meio do Arcópago,

disse: Senhores atenienses! Em tudo vos vejo

acentuadamente religiosos; porque, passan-

do e observando os objetos de vosso culto,

encontrei também um altar no qual está ins-

erito: Ao Deus Desconhecido. Pois esse que

adorais sem conhecer é precisamente aquele

que eu vos anuncio, O Deus que fez o mundo

e tudo o que nele existe, sendo ele Senhor

do céu e da terra, não habita em santuários

feitos por mãos humanas, Nem é servido

por mãos humanas, como se de alguma coisa

precisasse; pois ele mesmo é quem a todos

dá vida, respiração e tudo mais, de um só fez

toda a raça humana para habitar sobre toda fé

a face da terra, havendo fixado os tempos

previamente estabelecidos e os lamstes da suz

habitação; para buscarem à Deus se, pos-

ventura, tateando, o possam achas, bem que

não está longe de cada um de nós, pois nele

vivemos, nos movernos, existimos, como

alguns dos vossos poetas tém dito: Porque

dele também somos geração. Sendo, pos,

geração de Deus, não devemos pensar que

a divindade é semelhante ao ouro, à prata ou

à pedra, trabalhados pela arte c imaginação

do homem. Ora, não levou Deus em conta

os tempos da ignorância, agora, porém, no-

tifica aos homens que todos, em toda parte,

se arrependam; porquanto estabeleceu um

dia em que há de julgar o mundo com jus-

tiça, por meio de um varão que destinou

acreditou diante de todos, ressuscitando-o

Essa passagem complementa as duas anteriores, pois fala da possibilidade de conhecer a Deus (v. 27), à luz do fato de ele ter dado testemunho externo na criação (v. 24), na consciência humana, de que somos criaturas dele (v. 26) e dependentes dele (v. 26,28), e na percepção de que, sendo criaturas morais e volitivas, superiores às imagens que criamos de supostos deuses, não podemos tolerar nem promover a idolatria (v. 29), mesmo quando ela se aproxima da verdade (v. o altar ao Deus Desconhecido, v. 23).

Note-se também, como é crucial o conhecimento (v. 23). É possível adorar, ou seja, reverenciar sem conhecer. O conhecimento, porém, é essencial. Sem ele, a adoração subjetiva, por mais fervorosa, é inútil e condenatória, pois serve apenas como tentativa de subornar a um Deus que, por não ser conhecido, precisa ser aplacado como outra divindade qualquer.

Mais uma vez, a paciência de Deus (v. 30) não é conivência nem ignorância. As gerações passadas terão de prestar contas de sua rejeição à verdade e da idolatria que se seguiu. É necessário agora arrepender-se em relação a Deus, mas tal arrependimento precisa levar em conta sua revelação em Jesus Cristo precisa olhar

[ER TOP e De e repair comics romoe À 1. Quais os motivos possíveis para o cristão não crer no tormento eterno dos perdidos? 2. Além das passagens bíblicas destacadas, quais os outros textos importantes para a questão do

162 de frente os fatos objetivos da cruz, da ressur-= reição e do juízo. Não é possível fazer como os missionários católicos entre as tribos primitivas do Norte do Brasil: apenas uma adição Deus acima dos espíritos da selva, dos espíritos dos mortos, das divindades astrais como seosimples conhecimento da existência de Deus fosse suficiente para escusar a idolatria, a feitiçaria, a incredulidade, a promiscuidade, a violência co constante terror em que vivem essas tribos.

Para Paulo, e para nós também, as missões são um pacote fechado. Não podemos escolher ao nosso bel-prazer os artigos doutrinários aserem transmitidos. Não podemos transigir com

destino do não alcançado? Rs, É

O que a Bíblia ensina sobre os não alcançados a singularidade, nem com a exclusividade, nem com a inescapável necessidade do evangelho, Fazer isso seria incorrer em condenação pela indiferença para com o drama dos não alcançados e por leviandade em relação ao infinito custo que o Deus trino pagou pela salvação dos seres humanos.

Toda a Escritura nos fala de um Deus que ama demais para permitir que o homem se contente com qualquer amor que não se sacrifique, com qualquer fé que dependa de quem não a merece, com qualquer esperança que seja menos que certeza. Poderíamos nós, evangélicos brasileiros, nos contentar com menos que isso? para estudo', 40 from cursos where slug = 'perspectivas';

commit;
