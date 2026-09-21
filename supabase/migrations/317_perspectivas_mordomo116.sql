-- 317_perspectivas_mordomo116.sql
-- O capítulo 116 (Mordomo), última leitura que faltava do livro. Com ele as doze
-- lições ficam completas no que depende do livro.
--
-- POR QUE ELE FICOU PARA TRÁS: no lote de 19/set a p. 776 saiu fora de foco e
-- estourada de claro (brilho médio 245 de 255, desvio 21) e não havia o que
-- recuperar. Pedi a refotografia.
--
-- A REFOTOGRAFIA VEIO COM SEIS PÁGINAS, e o capítulo tem oito. Ela cobre as
-- p. 769 e 772-776, mas NÃO as p. 770 e 771 — que o lote anterior tinha e
-- estavam boas. O capítulo foi montado juntando os dois: p. 769-775 do lote de
-- 19/set e a p. 776 da refotografia, agora legível (desvio 35 contra 21).
--
-- O FECHO FOI REFEITO À MÃO. A p. 776 traz a citação em bloco virando de página,
-- dois parágrafos de conclusão em duas colunas e a caixa de perguntas; a
-- remontagem automática embaralhou tudo, quebrando a pergunta 3 em três pedaços
-- fora de ordem e jogando um parágrafo do corpo no meio das perguntas. Reli a
-- página e remontei na ordem correta, com a nota de rodapé 9 recuperada do pé da
-- p. 775.
--
-- Mantida a concordância do original em "o envio do obreiros" (pergunta 1): é
-- erro do impresso, e a regra aqui é transcrição literal.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 104;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 12 · Leitura — Mordomo, cap. 116: De volta para o futuro: missão empresarial e missões transculturais',
       'João Mordomo

JOÃO MORDOMO (pseudônimo) atua há mais de 15 anos como missionário transcultural na Bélgica e no Brasil. Serviu como plantador de igreja, pastor, evangelista e palestrante sobre missões e liderança em 40 países. É cofundador de duas agências missionárias, entre elas, a CCI-Brasil (que tem foco especial no mundo muçulmano), da qual é diretor presidente. Auxilia no grupo de trabalho Business as Mission, do Movimento Lausanne.

Areia de Paulo como consultor de uma renomada empresa multinacional havia decolado. Não obstante, seu descontentamento crescia, à medida que sentia um profundo anseio de fazer diferença para Deus, mais do que achava estar fazendo como profissional. Sabiamente, foi aconselhar-se com seu pastor e com outras pessoas bem-intencionadas. Eles entenderam que Deus estava chamando ele e sua esposa, Maria, para a obra missionária. Paulo não tinha como argumentar a respeito. Ele sentia o chamado de Deus em sua vida. Era algo genuíno. Seus conselheiros sugeriram que ele deixasse o emprego e fosse para o único lugar que realmente poderia prepará-los para aquela tarefa: o seminário. Deveria também providenciar seu sustento pela igreja, valendo-se de uma tradicional agência missionária. Embora tivesse a sensação incômoda de que essa talvez não fosse a melhor opção para ele, ninguém parecia capaz de oferecer uma alternativa. Assim, ele deixou o emprego, e o casal foi para o seminário.

Seis anos mais tarde, Paulo e Maria tinham no currículo quatro anos de seminário e dois anos de experiência em missões transculturais, mas estavam de volta ao Brasil, frustrados e pensando que talvez nunca mais voltassem ao campo missionário. Contudo, um missionário amigo do casal sugeriu que entrassem em contato com uma agência missionária conhecida por ser inovadora. Eles telefonaram e contaram sua história ao diretor “na RaRama E JOÃO MORDOMO (pseudônimo) duahámaisde ISanoscomo ua toe cars am de igreja, pastor evangelista é palestrante sobre missões e liderança em países. É cofundador de duas agências missionárias, entre elas, o pç diretor presidente. Ausdlia no grupo de trabalho Business as Mission, do Movimento Lausanne.

da missão. Após ouvir com atenção, ele respondeu: “Então vocês acharam que o curso do seminário os havia preparado para missões, mas na verdade o curso secular, na área empresarial, os preparou tanto quanto o seminário, ou até melhor, para as missões, não foi?”. Essa declaração soou verdadeira no coração de Paulo e ele imediatamente entendeu que, um dia, voltaria a ser missionário, mas um Zipo diferente de missionário, adotando um modelo diferente de missões.

A história de Paulo não é a única. Acontece o tempo todo, no mundo inteiro. Pessoas se sentem vocacionadas para as missões, e a única resposta que a liderança da igreja sabe dar é: “Abandone sua profissão; vá para o seminário; seja ordenado; providencie seu sustento; seja enviado como missionário a outro país Essa resposta costumava ser boa, há uma geração ou pouco mais, porém os tempos mudaram, e esse “modelo tradicional de missões” deixou de ser o mais apropriado para muitos lugares. Se realmente quisermos levara mensagem do evangelho aos povos não alcançados, precisamos de um modelo que: 1. Ajude nossos missionários a superar os quatro maiores obstáculos que eles enfrentam.

Isso significa ter um modelo que os ajude a “sair, entrar, ficar e se inserirem”. 2. Sirva como facilitador mais efetivo à igreja, a fim de que ela cumpra a missão de tornar Deus conhecido, amado e adorado entre os povos por meio da salvação de indivíduos e da transformação de famílias, comunidades e sociedades (Sl 96.3,4; Ml 1.11;

Sair O fator econômico muitas vezes é um grande empecilho no envio de missionários ao campo, em razão da falta de recursos financeiros. Não é nada fácil levantar e manter o sustento financeiro. De acordo com uma pesquisa de Ted Limpic, “as agências missionárias brasileiras citam ''falta de apoio financeiro como a maior causa do desgaste missionário”. Essa é uma realidade muito triste, mas compreensível, por diversas razões. Primeira: a situação econômica de nosso país nas últimas décadas tem sído caracterizada pela miséria e pela corrupção. Pode-se argumentar que não há muito dinheiro disponível para distribuir ou que ele não está nas mãos das pessoas certas. Segunda: a igreja brasileira é jovem e ainda não desenvolveu o hábito de contribuir de forma sacrifical para as missões

Felizmente, esse modelo existe! É criativo, inovador, dinâmico e uma ferramenta poderosapara levar o evangelho aos quatro cantos da terra de uma forma natural, holística e eficaz. Você deve estar se perguntando: “O que é? Qual o nome desse novo modelo tão maravilhoso”. Bem, de fato, é um modelo maravilhoso, mas não é novo. Podemos dizer que esse modelo nos leva “de volta para o futuro”! Pode parecer transculturais. Terceira: é, acima de tudo, creio eu, uma questão de visão e mordomia. Não posso contar quantas vezes ouvi comentários como este, que um líder brasileiro envolvido em missões ouviu em sua igreja: “Esqueça essa ideia, pastor! Esse negócio de missões não é para nós do Terceiro Mundo. Missões são para as igrejas da América do Norte e da Europa, que têm tradição nessa área e recursos financeiros novo para nós, mas foi empregado com sucesso pelo apóstolo Paulo, por muitos cristãos da Igreja primitiva, pelos nestorianos, pelos morávios, por William Carey e por muitos outros. É chamado “missão empresarial”.

Essa visão é limitada, distorcida e, em alguns casos, até mesmo antibíblica, pois as missões transculturais acabam sendo negligenciadas. Entretanto, será que missionários em potencial devem ser desqualificados para o serviço do Senhor num contexto transcultural apenas

Os obstáculos ao missionário Primeiramente, vamos atentar para os quatro obstáculos mencionados acima. Em seguida, apresentaremos informação mais detalhada porque sua igreja não tem visão bíblica e sacrifical no que diz respeito à missão de Deus a todos os povos, ou porque o Brasil e a igreja brasileira muitas vezes enfrentam dificuldades sobre a “missão empresarial” (doravante, ME). Ficará cada vez mais evidente por que a ME é uma forma tão efetiva de causar impacto nos povos não alcançados do mundo, para a glória de nosso Rei.

econômicas? À resposta óbvia é não! Toda a terra pertence a Deus, e tudo que nela há (Ex 19.5; (11.16)! E a missão é de Deus! À resposta, então, é encontrar um modelo mais apropriado que possa utilizar os recursos globais de Deus

Wilham D. Taylor, (Org.), Valioso demais para que se perca (Londrina: Oswaldo Prado, A New Way of Sending Missionanies: Lessons from 33, n. 1, jan. 2005, p. 52.

Descoberta, 1997). Brazil, Missiology: An International Review, para à glória dele no mundo. Não se trata apenas de dinheiro, mas de pessoas, os filhos de Deus, até mesmo os chamados “leigos”, muitas vezes subestimados.

longo prazo nem permitem um impacto mais duradouro. Quem já ouviu falar de um turista, digamos, no Turcomenistão ou na Arábia Saudita, que resida no país há vários anos, morando

Todavia, as finanças são apenas o primeiro de quatro obstáculos a serem vencidos, eo modelo missionário tradicional, mesmo quando o obreiro consegue seu sustento, geralmente não proporciona os meios para superar os três obstáculos seguintes, Entrar em apartamento alugado, e que fale com fluênciaoturcomeno ou o árabe? Não tente fazer isso em casa! Simplesmente não funciona, Mesmo que o obreiro consiga morar no país durante anos, há muito tempo ele já perdeu a credibilidade. Temos visto, em nossa experiência, que o cosmopolita perceberá logo que o “turista” é um missionário. O restante do povo possi-

Fico muito animado quando leio histórias de pessoas como o Irmão André, George Verwer e outros que arriscam a vida a fim de, ainda que por pouco tempo, infiltrar-se em contextos comunistas ou muçulmanos para compartilhar Cristo ou encorajar os crentes. Agradeço ao Senhor pela vida deles e oro para que Deus continue a chamar outros obreiros. Também velmente presumirá que se trata de um espião ou de alguém envolvido em negócios ilícitos. Afinal, como é que alguém que aparentemente não trabalha consegue pagar suas contas?

O alvo da maioria das organizações de missões de fronteira é ajudar a estabelecer movimentos de plantação de igrejas. Isso não acontece da noite para o dia. É algo que leva sou grato ao Senhor pelos milhares de obreiros transculturais de todo o mundo que, como mesmo chamado e convicção, procuram entrar em países do norte da África, no Oriente Médio ouna Ásia Central como turistas ou estudantes para ali permanecer alguns meses ou poucos anos na tentativa de fazer a causa de Deus avançar naqueles lugares. São meios viáveis de anos e décadas, senão séculos, para criar raízes. Tampouco as comunidades, sociedades, povos e nações são transformados numa única geração. Para que nossos missionários causem um impacto duradouro, eles precisam encontrar meios viáveis e com credibilidade para se inserirem na cultura.

entrada em nações de acesso restrito, mas não oferecem soluções dignas de crédito no longo prazo. Devemos reconhecer que pouquíssimas pessoas conseguem entrar nesses países, mesmo como turistas ou estudantes, e, ainda que consigam entrar nessas condições, o fato é que muitos povos não alcançados vivem em regiões do país onde turistas e estudantes não costumam 1r e se tornam suspeitos se forem. Sem

Inserir-se É claro que permanecer durante décadas no meio de um povo não é garantia de um ministério efetivo, nem de que vidas serão transformadas, igrejas serão plantadas e sociedades serão modificadas. Infelizmente, essa lição foi aprendida em lugares como Ruanda, em 1994, onde no mínimo 700 mil cristãos foram mortos por outros cristãos em questão de meses, porque dúvida, existe um meio melhor de entrar nesses contextos tão fechados. Ficar de entrar é difícil, ficar pode ser quase impossível, especialmente com visto de turista ou de estudante, uma vez que ambos são viáveis para muitos meses ou talvez muitos anos, mas não têm credibilidade para uma permanência de a rivalidade tribal estava muito mais arraigada neles que o cristianismo.

Obreiros transculturais devem encontrar mecanismos pelos quais possam se inserir em redes sociais e fazer uma proclamação plena do evangelho, em palavras e ações. Eles devem alcançar o âmago, a cosmovisão de uma cultura, e a melhor maneira de fazê-lo é estando ombro a ombro com as pessoas, no dia a dia, identificando-se com elas enquanto lutam para sobreviver e lidam com questões existenciais,

O modelo tradicional de missões, com bastante frequência, não encoraja nem permite que o ministério encarnacional, do tipo “nas trincheiras”, “corpo a corpo”, “mão na massa" acon= teça, O Verbo que se fez carne c habitou entre nós não foi um profissional indiferente da religião! Ele pôde identificar-se com o povo porque enfrentou os mesmos dilemas que eles como parte de sua existência humana, e isso significou trabalhar pelo próprio sustento durante grande parte de sua vida, Ele entendeu e praticou, no sentido mais real, a “teologia da presença” (Fp 2.5-8; Hb 4,15), Sem dúvida, essa questão deveria receber mais que atenção simbólica de nossa parte, se tentamos imitá-lo, ao mergulhar nas culturas que desejamos alcançar. Missão empresarial Sair, entrar, ficar, penetrar. Esse é o desafio que nossos missionários enfrentam, e é cada vez mais difícil vencê-lo com o modelo de missões tradicional, Qual a solução, então? Estou convencido de que o modelo ME nos servirá bem no século XXI, mobilizando nossos missionários como chama algumas para trabalhar ess tros tipos de ministérios ou empreendimentos missionários, Essas empresas do Reina levam é sério o mandamento bíblico de alcançaros são alcançados e servir aos pobres e oprimidos, em particular nas áreas em que 0 evangelho ainda precisa ser aceito, O que está em questão é sina atividade transcultural com a atenção voltada para áreas de pobreza endêmica e/ ou comu nidades e povos não evangelizados, O modes ME significa um empreendimento empresarid com perspectiva do Reino de Deus, cujo propósito seja cumprir a missão de Deus,

2. O modelo ME proporciona oportunidades para que todo o povo de Deus participe da missão da Igreja no mundo, Como resultado da tradição e de uma interpretação pobre das Escrituras, temos na Igreja uma falsa dicotomia, que 2parentemente valoriza mais o clero que 0 Jaicato, O clero “trabalha no ministério”, enquanto os leigos financiam o ministério por meio de sex trabalho! Ed Silvoso explica isso muito bem, fazendo uso de uma analogia do futebol:

Um punhado de jogadores, todos precisando desesperadamente de descanso, correm pelo para um ministério de fronteiras holístico, cfetivo e que agrade a Deus, Mas o que é o modelo “missão empresarial” e como funciona?

1. O modelo ME tem uma perspectiva do Reino de Deus. Trata-se de uma “empresa do Reino”. As empresas ME partem da premissa teológica de que Deus deseja ser conhecido, amado e adorado entre todos os povos do mundo. Elas reconhecem que todos os cristãos têm um chamado para amar servir a Deus de todo o coração, alma, mente e força, bem como para amar e servir o próximo. Elas reconhecem ainda que Deus chama algumas pessoas para trabalhar para o Reino em atividades profissionais, assim campo enquanto centenas de milhares de espectadores assistem a tudo em seus 2ssentos confortáveis, Os jogadores são os tminístros que empregam quase toda a energia, e os espectadores representam os leigos, cuia participação se limita a um papel secundário, principalmente o de tornar todo o empreendimento viável financeiramente. Mas a míssio Dei (“missão de Deus”) ser glorificado entre todos os povos por meio da salvação individual de pessoas é para tado o Corpo de Cristo, não apenas para parte dele. À separação entre clero e laicato “não apenas

Grande parte do que apresento a seguir baseia-se no Lausanne Occasional Paper on Business as Mission, que asadesses crever e foi editado por Mats Tunchag, Wayne McGee e Josie Plummer. É preciso destacar que, embora haja um rezcól consenso no conteúdo do artigo, o que apresento a seguir é minha compreensão, descrição e desejo pessozis em seleção ao modelo ME. Não falo em nome de toda a comissão responsável pelo texto de Lausanne, é Ed Silvoso, Anvinted for Business: How Christians Can Use Their Influence in the Marketplace to Change the Wertd (Ves tura: Regal, 2002), p. 24.

A não encontra base no Novo Testamento como ambém contradiz o ente ndimento do Novo Testamento do que seja a mmissio Dei em Cristo em sua Igreja” é Durante grande parte dahistória da Igreja, tem sido prestado um desserviço à missio Dei por meio de uma estrutura que promove a passividade dos leigos. Dallas Willard afirma: “A divisão dos papéis e funções legítimas da vida humana em sagrado e secular causa um dano incalculável à nossa vida individuale à causa de Cristo. Pessoas santas devem deixar de considerar “as obras da igreja como seu curso natural de ação e assumir a ordem santana fazenda, na indústria, na lei, na educação, no sistema bancário e no jornalismo”.º E, é claro,

4, O modelo ME diz respeito a empresas legítimas, e esse modelo de missões não é indulgente com as empresas de fachada”, “Empresas de fachada” são na verdade, pseudoempresas, que não funcionam de fato, mas existem unicamente para servir de base e/ ou fachada para missionários, a fim de que recebam vistos e entrem em países que, de outro modo, estariam fechados para eles. Essa es é ia abor aci do missiontár distarçado e tem pouco valor compensatório. Ê ii do egada muitas vezes por pessoas que têm Pouco interesse em negócios e tentam fazer O MHMMO possível de trabalho secular.

Como Rundle Steffen demonstr ão dás no Mondo ee tunas ra ai a

O modelo ME baseia-se no princípio WE da missão Ea holística, que procura trazer todos os aspectos da vida e do ministério a uma unidade orgânica e bíblica. Isso inclui o cuidado de Deus nas questões relacionadas a negócios, como desenvolvimento econômico, emprego e desemp rego, justiça social e econbenica “OHS0 é distribuição de PPOIFROS DARIAM CCANVOS A toda a humanidade. Esses são aspectos da obra redentora de Deus por meio de Jesus Cristoede sua igreja que fazem parte do modelo ME. Infelizmente, o evangelismo e as questões sociais ainda são tratados como assuntos separados, sem relação um com o outro. Isso pressupõe uma divisão entre o que denominamos “sagrado” ou “espiritual e o que consideramos “secular” ou “físico. À cosmovisão bíblica, no entanto, €a que promove uma visão da vida, integrada e sem emendas. O ministério não deve ser compartimentalizado nem dividido em duas partes: “espiritual” e físico”. O modelo ME é uma expressão desse paradigma verdadeiramen“te holístico, integrado.

terroristas também encontram dificuldades para atuar abertamente na maioria “e dos países e também descobriram a utilidade do trabalho de fi alados ni dido tanta hi ácida fot da tl podia feia focaia coicondas es dy

A ME consiste de empresas reais, que geram riquezas e lucros. São construídas com base qm planos empresariais viáveis, sendo susten,syeis financeiramente (lucrativas) e produzem mercadorias ou prestam serviços pelos quais as pessoas estão dispostas a pagar. Os lucros são ym elemento essencial do negócio, em todas as culturas. Sem lucros, à empresa não pode sobreviver nem cumprir seu propósito. À ME encara os lucros como bons, desejáveis e benéficos para Deuse seus propósitos, contanto que não sejam opressivos, não lesem os clientes nem resultem da venda de produtos e serviços que não honram a Cristo e ao evangelho. Subsídios temporários podem ser utilizados para estabelecer a iniciativa de uma empresa ME, mas subsídios permanentes ou apoio financeiro sem expectativa de lucro máximo estão mais próximos

Mark Balfour, Abolish the Laity: New Wineskins, Hopeful Ampbibian Website. Disponível em: <http://hopefulamphibian.blogs.com/hopeful amphibian/2005/01/abolish the Jaihtml>. Acessado em: 10 abr. 2005.

É O espírito das disciplinas (Rão de Janeiro Habacuc, 2003).

Steve Rundle Tom Steffen, Great Commission Companies: The Emerging Role of Business in Missions (Downers Grove: InterVarsity, 2003), p. 22.

Steve Rundle Tom Steffen, op. cit,, p. 41-2.

de ministérios beneficentes ou com base em doações que iniciativas do tipo ME,

5. O modelo ME diz respeito a missões legttimas e não é indulpente para com as “missões de fachada”, Outra abordagem que não encontra espaço nos genuínos empreendimentos do tipo ME são as empresas que fingem ter motivações cristãs, mas funcionam apenas para benefício econômico próprio, e não para o Reino de Deus. Nem essas, nem as empresas dirigidas por cristãos, porém sem uma estratégia claramente voltada para o Reino, são consideradas empresas do tipo ME.

Uma empresa do modelo ME tem não sopropósitos e os valores do Reino de Deus em todos os aspectos de seu funcionamento. Se determinadas precauções não forem tomadas, O modelo “empresas com visão missionária” pode reforçar a falsa dicotomia sacro-secular ou clérigo-leigo, limitando a empresa e as pessoas nela envolvidas a um papel de financiadoras do verdadeiro ministério”. Embora o financiamento seja uma função importante, a ME diz respeito a empresas que visam ao lucro e buscam intencionalmente participar da missão global de Deus em todas os aspectos de sua existência,

7. O modelo ME está relacionado a ministérios no local de trabalho, mas é diferente deles. Minismente um plano empresarial, mas também um plano para cumprir a Grande Comissão. Tem alvos ministeriais claramente definidos: onde,a quem e como servir. Esse plano pode incluir a contratação de não cristãos a fim de ganhá-los para Cristo. Pode incluir a criação de programas o 4 de ação social na comunidade em que a empresa está inserida. As opções são ilimitadas, mas o plano deve ser intencional e estar idealmente ligado a um movimento local de plantação de igrejas, assim como o trabalho “secular” do apóstolo Paulo parecia ter sempre como motivação estabelecer e desenvolver movimentos de plantação de igrejas.

6. O modelo ME é diferente de “empresas com visão missionária”. Os lucros de um negócio podem ser investidos no sustento de missões e ministérios. Igualmente, funcionários podem doar térios no local de trabalho são essencialmente monoculturais e se concentram em levar o evangelho às pessoas onde elas trabalham, preferencialmente por meio do testemunho de colegas de trabalho ou companheiros de profissão. Esses ministérios incentivam a integração de princípios bíblicos em todos os aspectos da prática profissional, para a glória de Deus. A ME, naturalmente, inclui esses elementos de ministério no local de trabalho.

Quando um ministério desse tipo tem início numa empresa que pertence a cristãos, com o objetivo de promover o Reino de Deus, haverá uma considerável sobreposição. Enquanto o ministério no local de trabalho pode escolher limitar seu enfoque exclusivamente no contexto da empresa em si (“dentro”), uma ME se concentrará tanto no ambiente interno (“dentro”)

parte de seu salário para causas filantrópicas. Isso ocorre nas empresas envolvidas em missões ou com visão missionária e é essencial paraos empreendimentos missionários.

Embora essa prática deva ser incentivada, nenhum de nós, porém, gostaria de ser operado por um cirurgião cuja única ambição seja ganhar dinheiro para entregar à igreja! Ão contrário, esperamos que ele tenha as habilidades e motivações corretas para realizar cirurgias com da empresa quanto além dela (“através”), geralmente com uma perspectiva transcultural. Procura aproveitar a energia os recursos da empresa no sentido de causar impacto intencional de missões numa comunidade ou, em larga escala, numa nação. Além disso, enquanto o ministério no local de trabalho pode acontecer em qualquer ambiente, a ME, na intenção de cumprir a ordem de alcançar “todos os povos”, procura atuar em áreas na quais as necessidades excelência e integridade profissional. De igual modo, uma empresa do modelo ME deve produzir mais que mercadorias e serviços a fim de gerar novas riquezas. Ela procura cumprir os físicas e espirituais são maiores.

8. O modelo ME está relacionado aos fazedores de tendas”, mas difere deles. O modelo missionário “fazedores de tendas” refere-se principalmente à prática de profissionais cristãos que se sustentam inanceiramente, trabalhando como empregados ou exercendo sua profissão. Dessa maneira, eles são capazes de conduzir um ministério sem depender de doações e sem acarretar um peso ao povo a quem servem. O modelo “fazedores de tendas” pressupõe a integração de trabalho e testemunho e incentiva o evangelismo feito por cristãos leigos, e não por clérigos e profissionais de ministério.

Em lugares onde os fazedores de tendas são parte de empreendimentos empresariais que viabilizam alvos de missões transculturais, há uma considerável sobreposição com o mo-

10. O modelo ME é inovador e criativo. Os planos da empresa e do ministério, bem como as metodologias, estratégias e outros são intencionalmente criativos e diversificados, assim como Deus nos criou com uma gama surpreendente de formas, tamanhos e cores. O modelo ME procura desenvolver e reproduzir cristãos inovadores, que assumem riscos. Vamos chamá-los empreendedores do Reino”. À respeito deles, diz Rundle:

São genuínos homens de negócio com competência confirmada pelo menos em uma área de administração empresarial. São dodelo ME. Entretanto, embora um “fazedor de tendas” possa pertencer ao quadro de uma empresa, a empresa em si pode não ser uma parte de seu ministério, como acontece na ME. À ME vê a empresa como o meio e a mensagem e com frequência envolve a “geração de emprego” como parte de sua missão. Nos “fazedores de tendas”, isso está mais relacionado a “inserirse no mercado de trabalho, ou seja, conseguir um emprego em algum lugar a fim de viabilitar o ministério modelo ME está relacionado às microempresas, mas difere delas. O tamanho da empresa importa? Sim e não. Existem programas de microempresas cristãs que ajudam a gerar a renda necessária para famílias e pessoas e resultam no desenvolvimento da comunidade, na plantação de igrejas e no discipulado de vidas. O desenvolvimento de microempresas cristãs tados de dons espirituais de forma muito semelhante aos missionários tradicionais, mas são chamados e equipados para usar esses dons no contexto de uma empresa. Os empreendedores do Reino têm um desejo sincero de ver comunidades de fé surgirem nos lugares mais áridos espiritualmente e estão dispostos a viver e trabalhar nesses lugares para fazer com que isso aconteça. Em vez de olhar para seu trabalho como uma distração, os empreendedores do Reino encaram-no como um contexto necessário para que seu ministério tenha um alcance real. As batalhas diárias cumprir prazos, agradar os clientes, ser vítima de corrupção são precisamente as coisas que lhes permitem dar forma a0 discipulado cristão no cotidiano.” Conclusão tem sido bem aceito, é produtivo para o Reino etem um papel legítimo na definição e prática mais abrangente da ME.

Noentanto,a ênfase da ME está geralmente em empresas de maior porte (pequenas e médias), às quais pouca atenção tem sido dada. Se Vamos encarar a dimensão do desafio diante de nós, precisamos pensar e agir grande, indo além das microempresas, até as pequenas, mé-Miase grandes.

Podemos resumir todos esses itens acima fazendo a seguinte pergunta e respondendo-a: “Com que as empresas do modelo ME se parecem?”. Temos a resposta na concepção de Rundle e Steffen:

Não há limites para o formato que uma companhia da Grande Comissão pode ter. Não obstante, todas elas têm em comum algumas características básicas, que nos permitem definir uma companhia da Grande Comissão como um “negócio lucrativo, com responsabilidade social, administrado por profissionais do Reino e criado com o propósito específico de glorificar a Deus e promover o crescimento e a multiplicação de igrejas locais nas partes menos evangelizadas e desenvolvidas do mundo”.

9 Steve Rundle, Preparing the Next Generation of Kingdom Entrepreneurs, in: Tetsunao Yamamori e Kenneth A. Eldred (Org.), On Kingdom Business: Transforming Missions Through Entrepreneurial Strategies (Wheaton: Crossway, 2003), p. 229-30.

Espero que, a essa altura, você esteja curioso e interessado! A “missão empresarial” pode e, acredito, deve cada vez mais se tornar o modelo de missões escolhido para o século XXI. Ele mobiliza forças missionárias emergentes, como as da igreja evangélica no Brasil. Ele serve como catalisador para inspirar e encorajar as pessoas a ingressar nos negócios e permanecer ali e a ingressar em missões e permanecer ali. Ele compartilha uma visão e capacita os leigos — a equipe missionária do século XXI — a ir aos 85% dos povos não alcançados e menos alcançados do mundo, que vivem em países de acesso restrito e onde os missionários do modelo tradicional não conseguem entrar e modelos tradicionais muitas vezes não funcionam.

Esse modelo, talvez mais que qualquer outro, permite, nas palavras do movimento de Lausanne, que “toda a Igreja leve todo o evangelho a todo homem em todo o mundo”, ad maiorem Dei gloriam — para maior glória de Deus!

10 Op. cit., p. 41.

Perguntas para estudo

1. A motivação principal por optar pela estratégia da “missão empresarial” (ME) pode ser financeira, quando a igreja local não dispõe de recursos suficientes para o envio do obreiros pelo método tradicional?

2. Qual o papel da igreja local perante um empreendimento que visa ao lucro, como a ME?

3. O modelo ME, segundo o autor, permite que “todo o povo de Deus participe da missão da Igreja no mundo”. Explique.', 104
  from cursos where slug = 'perspectivas';

commit;
