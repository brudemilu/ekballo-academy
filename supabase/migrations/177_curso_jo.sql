-- Curso: Jó (Charles R. Swindoll) — slug jo. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'jo';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('jo','Jó','Estudo a partir de Jó, de Charles R. Swindoll. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/jo', false, 0, 'ensino', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Jó: Um Homem de Tolerância Heróica$t$, 1,
$conteudo$escassez de heróis me perturbou durante anos. Não sou o único. Meus amigos, pessoas que encontro e autores que leio concordam que as fileiras de heróis ficaram notavelmente reduzidas. Quer seja devido aos cínicos desta época que se agradam em enfatizar os defeitos mais insignificantes dos famosos, ou porque aqueles que antes admirávamos à distância deixaram de ser aprovados nos testes de tornassol mais exatos, ou porque o público simplesmente se cansou da síndrome do herói decaído; até a idéia de chamar alguém de herói caiu em desfavor na cultura de hoje. O medo de encontrar algum fato oculto que desmereça aquele que admiramos roubou a confiança antes depositada em outros.

Não obstante, continuo convencido de que precisamos de heróis. Sem levar em conta as imperfeições da humanidade, nossos corações anseiam por ser estimulados pelos exemplos de idoneidade sendo modelados na vida diária. Somos fortalecidos por vidas exemplares, especialmente daqueles que alcançaram o direito de ser respeitados pelo seu caráter, sacrifício, paciência e capacidade de prosseguir apesar

10 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

das dificuldades, injustiças, sofrimentos e fracassos. Nossos heróis não precisam ser perfeitos. Devem, porém, ser corajosos, autênticos, lúcidos e decididos a perseverar, não importa o sacrifício ou o preço pago. Necessitamos de heróis íntegros e sólidos, homens e mulheres que possamos admirar, não por exemplificarem uma explosão rápida de bravura, mas por representarem a essência da grandeza e permanecerem nela até o fim. Terminar em pé é uma parte vital da coragem. Visto existir “tão grande nuvem de testemunhas” a nos servir de incentivo, temos mais capacidade para perseverar.

Peter Gibbon, em sua esplêndida obra, A Call to Heroism, concorda:

Não consigo imaginar um mundo sem heróis, um mundo sem genialidade e nobreza, sem empreendimentos sublimes, propósitos elevados, coragem transcendente, riscos e sofrimento. Um mundo assim seria cinzento, tedioso, monótono. Quem nos mostraria o caminho ou estabeleceria os limites? Quem nos serviria de inspiração e nos consolaria? Quem nos energizaria e nos protegeria da escuridão?1

Ao compreender a constante importância de modelos de grandeza em quem possamos confiar, comecei a escrever no fim do século passado uma série de livros baseados na vida de homens e mulheres selecionados cujas biografias aparecem nas páginas da Bíblia. Chamei a série de Heróis da Fé. Nos quatro últimos anos publiquei seis volumes. A reação tem sido maravilhosamente gratificante. Se você examinou comigo o perfil desses personagens, irá lembrar-se das vidas que estudamos juntos:

Davi: Um Homem Segundo o Coração de Deus

Ester: Uma Mulher de Sensibilidade e Coragem

José: Um Homem Integro e Indulgente

Moisés: Um Homem Dedicado e Generoso

INTRODUÇÃO 11

Elias: Um Homem de Heroísmo e Humildade

Paulo: Um Homem de Coragem e Graça

Descobri no ano passado outro herói no texto bíblico. Não estava escondido nem era obscuro, mas eu não tinha compreendido quão importante ele era até que iniciei uma investigação completa da sua pessoa e do que havia suportado. Ele aparece ousadamente no livro antigo que leva o seu nome. Mas, uma vez que a maior parte de sua história está tão cheia de sofrimento e perdas, humilhações e dificul­ dades, enquanto sofre uma enfermidade debilitante e trava um deba­ te longo e inflamado com vários amigos, é certo que quase ninguém tomou tempo para examinar a fundo a sua vida. Um rápido olhar para as suas circunstâncias deixa o leitor entristecido e confuso. Na opinião de muitos, Jó é um estudo patético da tragédia — pouco mais do que uma vítima indefesa de um tratamento injusto, em vez de ter sido um homem de enorme perseverança.

Pelo contrário, um exame cuidadoso da vida desse indivíduo - especialmente sua reaçao às experiências penosas que se abateram sobre a sua existência antes pacífica e dedicada a dar honra a Deus — irá convencer-nos de que este é outro herói com qualidades de caráter dignas de serem imitadas.

Antes de iniciarmos nossa jornada no mundo de Jó, devo fazer uma pausa para expressar meus agradecimentos àqueles em meu mundo que ajudaram o nascimento do sétimo volume desta série biográfica. Em primeiro lugar e principalmente, Michael Hyatt, vice-presidente-executivo e um dos editores da Thomas Nelson Publishers, foi quem me encorajou a tomar da pena e colocar meus pensamentos no papel. Mike e meu amigo de muitos anos, David Moberg, do W Publishing Group, continuaram a acreditar neste projeto e me incentivaram grandemente durante a preparação des­ ta obra específica.

Carol Spencer, minha assistente-executiva, transformou fiel, paciente e eficientemente minhas páginas escritas a mão em um manuscrito de aspecto profissional que correspondeu às exigências e

12 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

prazos dos editores. Embora sua experiência no mundo dos negócios fosse vasta, ela nunca empreendera um projeto desta espécie. Não obstante, aceitou de bom grado os desafios com um sorriso cativante e cheia de boa vontade, integrando as muitas horas extras necessárias em sua agenda já ocupada.

Graças a Carol, especialmente, é que este livro está em suas mãos hoje. Além de Carol, devo agradecer a Mary Hollingsworth e sua esplêndida equipe pela diligência e atenção aos detalhes ao revisar a cópia final e dar o acabamento necessário ao manuscrito antes de enviá-lo à gráfica.

Há outro grupo de pessoas que merecem atenção especial. Estou me referindo à congregação da Stonebriar Community Church, em Frisco, Texas. Não tenho só o privilégio de servir como pastor-fundador deste admirável rebanho, mas também devo mencionar que foram eles os primeiros a ouvir os resultados de meu trabalho no texto de Jó, na maioria das manhãs de domingo, durante todo o ano de 2002. Eles foram um exemplo de grande paciência enquanto voltávamos aos numerosos e algumas vezes enfadonhos capítulos do Livro de Jó, semana após semana. Não estou dizendo que começaram a se cansar debaixo do fardo, mas posso afirmar que ao chegar o dia em que anunciei que estávamos praticamente no fim do nosso estudo de Jó, o lugar explodiu em aplausos ruidosos, espontâneos! Possa Deus recompensá-los abundantemente pela sua paciência.

Quero finalmente agradecer a Cynthia, minha esposa há quarenta e oito anos e parceira dedicada no ministério. Embora eu ficasse colado a esta mesa durante todos esses meses, completando este livro — e tenho mantido um programa similar a este desde que comecei a escrever, nos idos de 1975 não a ouvi se queixar uma única vez. Pelo contrário, sempre me apoiou e encorajou, disposta a sacrificar seus próprios planos e preferências, a fim de ajudar-me a realizar a tarefa em mãos. Meu amor e gratidão por ela não conhecem limites.

Chegou agora o momento de voltarmos no tempo e conhecer o homem na terra de Uz que irá logo surgir de uma página antiga e transformar-se em um herói moderno em seu coração.

INTRODUÇÃO 13

Minha esperança é que você venha a compreender pessoalmente a verdade do que Paulo escreveu certa vez sobre as Escrituras do Antigo Testamento:

Mesmo que tenha sido incluído nas Escrituras há muito tempo, você pode estar certo de que é escrito para nós. Deus quer que uma combinação de seu chamado firme e constante, e o conselho caloroso e pessoal da Escritura passe a caracte­ rizar-nos, mantendo-nos atentos para o que quer que ele venha a fazer em seguida.

Romanos 15:4 (Tradução Livre)

Com isso em mente, pode ser desejo de Deus preparar você para algumas das coisas que Jó teve de suportar. Já que essa é uma possibi­ lidade muito real, sugiro que preste bastante atenção em tudo que vai ler. Quem sabe o que Deus fará em seguida?

— CHUCK SWINDOLL

Dallas, Texas

Q/m. Ao/nem e/e íoferãncia /e ro ic a$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quem são os heróis de fé que Deus usou para fortalecer e sustentar a sua caminhada nos momentos mais difíceis?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que significa, na sua vida, "terminar em pé" mesmo depois de atravessar dores, perdas e injustiças?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que maneira a perseverança de Jó diante do sofrimento pode preparar o seu coração para aquilo que Deus ainda fará em seguida?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Preparando o Palco para o Desastre$t$, 2,
$conteudo$A

vida é difícil. Esta declaração incisiva representa uma avaliação acurada da nossa existência neste planeta. Quando o escritor do livro bíblico chamado Jó tomou sua caneta para escrever esta história, ele poderia ter começado com uma sentença praticamente similar e igualmente incisiva: “A vida é injusta”.

Ninguém pode contestar a opinião de que a vida é pontuada de dificuldades, angústias e problemas. A maioria de nós aprendeu a enfrentar a realidade de que a vida é difícil. Mas será injusta? Alguma coisa nos golpeia, bem no fundo, tornando quase intolerável para nós aceitar e resistir às injustiças. Nosso impulso de justiça supera nossa paciência com o sofrimento. Dois exemplos me vêm à mente.

Você nasceu e foi criado no Canadá e patina no gelo desde quando pode se lembrar. Durante os anos de seu crescimento, enquanto esquiava sobre o gelo, você sonhava que no futuro participaria das Olimpíadas. Esquiar é difícil. Você cai vez após vez, mas em cada queda aprende outra lição e aperfeiçoa a sua técnica a cada ano. Você acaba esquiando muito bem. Consegue um treinador especial e arranja

18 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

uma parceira também originária de sua terra natal. Vocês dois patinam em direção ao seu sonho mútuo de participar das Olimpíadas de Inverno de Salt Lake City, em 2002.

O seu momento chega afinal. Quando seus nomes são anunciados, vocês deslizam suave e graciosamente em direção ao gelo. O sonho de ambos tornou-se realidade. Vocês executam a sua rotina com perfeição - melhor do que jamais executaram. Ao terminar, sabem intimamente que foi um desempenho digno da medalha de ouro. Vocês dois estão em êxtase...até que recebem as notas. O coração afunda. Ao verem os números compreendem que vão receber a medalha de prata e outro par, menos qualificado, receberá a de ouro. Nesse momento a vida fica difícil. Em algumas horas, no entanto, você vai descobrir que o julgamento foi uma fraude, que a competição não passou de uma armação. De fato, um dos juizes veio a ser afastado mais tarde. Você não sabia disso ao ver o placar. Quando descobre tudo, a dificuldade passa a ser injustiça, você não consegue tolerar a idéia de aceitar a medalha de prata.

Meu segundo exemplo não tem um final tão bom. Você é uma mãe sozinha, morando a 19km de uma oferta de emprego na cidade de Houston. Pensa então seriamente em mudar com seus três filhos (todos com menos de quinze anos) para o sul, a fim de aceitar um trabalho muito melhor, ganhando muito mais numa empresa que está realmente progredindo. Você muda e começa a trabalhar na Enron. Sente-se satisfeita e ao mesmo tempo exaurida. As coisas estão realmente melhorando. Tudo vai tão bem que você decide investir nas ações da empresa. Ganhar dinheiro é ótimo, o futuro parece brilhante, e tudo indica que esse será um investimento de primeira ordem. Até o novo estádio de Houston vai receber o nome da Enron Corporation. Um dia, porém, você ouve alguns comentários preocupantes na sala de café.

Os boatos no escritório não são encorajadores. Você duvida, indaga, e acaba procurando esquecer o assunto porque, afinal de contas, você sente que toda a sua vida está lá, sua aposentadoria, sua assistência médica e também sua segurança financeira. De repente,

PREPARANDO O PALCO PARA O DESASTRE 19

quase antes de poder piscar, recebe um aviso de demissão. É o fim. Você perde tudo. A culpa não é sua; você estava fazendo um bom trabalho. Você mudou pelas razões certas e agora enfrenta a ameaça de perder a casa. A vida é difícil enquanto você pensa sobre como falar com seus filhos.

Alguns dias depois, enquanto está no chuveiro, você nota um pequeno caroço sob o seio esquerdo. Seu estômago se revolve. Você não consegue acreditar. Dois dias mais tarde, a biópsia revela um câncer agressivo. Oh! esqueci de dizer que três anos antes seu marido fugiu com sua assistente muito mais jovem e atraente, e, por falar nisso, tudo vai bem com eles. Os dois possuem carros novos, empre­ gos estáveis e bem pagos, e não têm filhos. E você? Você vai ter de morar na casa de seus pais idosos, nenhum dos quais com muita saúde, e a casinha deles só tem três quartos. Um dia você encara a verdade: a vida não é só difícil, é categoricamente injusta.

Bem-vindo ao mundo de Jó.

Sem perceber, você acabou de entrar no território de Jó. (Alguns indivíduos ainda pensam que a Bíblia é irrelevante!) A história de Jó não só é relevante, como representa uma das mais antigas e melhores composições literárias de todos os tempos. Alguns a datariam dos dias de Génesis. Em vista da idade avançada de Jó, ela se enquadra na categoria das histórias escritas durante os dias dos patriarcas. Martinho Lutero usou certa vez estas duas palavras ao referir-se a Jó: magnífico e sublime. O ensaísta escocês do século XIX, Thomas Carlyle, escre­ veu: “Em minha opinião, não há nada que tenha sido escrito na Bí­ blia ou fora dela de igual mérito literário.”1 Victor Hugo, o poeta francês, concluiu que Jó pode ser considerado talvez como a maior obra-prima da mente humana.

Eugene Peterson, um de nossos escritores contemporâneos, em sua paráfrase do Antigo Testamento, diz o seguinte em sua intro­ dução a Jó:

Jó não é importante para nós apenas por causa do seu sofri­ mento. E importante por ter sofrido da mesma maneira que

20 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

sofremos — nas áreas vitais da família, saúde pessoal e coisas materiais. Jó é igualmente importante para nós por ter indagado diligentemente e protestado ousadamente contra o seu sofrimento. Ele de fato “subiu ao alto” com suas perguntas.

Não é o sofrimento que nos preocupa. É o sofrimento injusto. Quase todos nós, enquanto crescíamos, tivemos a experiência de desobedecer a nossos pais e sermos castigados por isso. Quando essa punição estava ligada a um mau comportamento, havia nela certo senso de justiça: Quando erramos, somos castigados.

Quando ficamos mais velhos, porém, uma das surpresas é que passamos a ver que não existe uma correlação real entre o tamanho do erro que cometemos e o sofrimento que experimentamos. Uma surpresa ainda maior é que muitas vezes acontece justamente o oposto: fazemos o que é certo e somos punidos. Fazemos o melhor possível e, no momento em que estamos certos de receber a recompensa, somos golpeados e cambaleamos.2

UMA ANÁLISE RÁPIDA E SÓRDIDA

Essas palavras descrevem exatamente o que aconteceu a Jó. A vida não era simplesmente difícil; ela tornou-se absolutamente injusta. Você pode desconhecer a agonia de Jó. É fácil pensar que uma história assim tão antiga é do conhecimento de todos, mas quem sabe ela não seja nova para você. Permita-me então oferecer em algumas linhas uma análise rápida.

Jó era um homem de piedade genuína, incomparável. Um homem de merecida prosperidade. Homem piedoso, extremamente rico, excelente marido e pai fiel. Devido a uma brutal e súbita série de calamidades, Jó ficou reduzido a uma massa retorcida de prostração e sofrimento. O extraordinário acúmulo de desastres que o assaltaram teria sido suficiente para acabar com qualquer um de nós hoje.

PREPARANDO O PALCO PARA O DESASTRE 21

Jó vai à falência, fica sem lar, indefeso e sem filhos. Vê-se junto às sepulturas novas de seus filhos numa colina batida pelo vento. Sua mulher soluça ao seu lado enquanto se ajoelha perto do marido, ten­ do acabado de ouvi-lo dizer: “O S e n h o r o deu e o S e n h o r o tomou; bendito seja o nome do S en h o r!” (Jó 1:21). Ela se inclina sobre ele e sussurra em segredo: “Amaldiçoa a Deus e morre” (2:9). Faça uma pausa e reflita sobre a tristeza do casal — lembre-se também de que esse homem nada fizera para merecer uma dor assim insuportável.

Tenho um amigo que também está no ministério. Ao enviarlhe um e-mail recentemente, mencionei meus planos de escrever um livro sobre Jó, chamando-o de “Um Herói Perseverante”. Ele me respondeu prontamente e me advertiu sobre tratar de assuntos desse tipo. “Você nunca sabe o que acontece quando lida com his­ tórias como a de Jó”, escreveu ele. “Muitas vezes você acaba como participante do que está escrevendo.” Isso me fez sentir um arrepio na espinha. A fim de não me amargurar, ele acrescentou este toque de humor: “Tenho um amigo que estava dirigindo pelas estradas do Texas tarde da noite e procurou uma estação de rádio que lhe fizes­ se companhia. Acabou sintonizado num pregador rural que estava começando uma série de sermões sobre Jó. O pregador deu este título à sua mensagem: “Não Consigo Comer de Dia, Não Consigo Dormir à Noite e a Mulher Que Amo Não Me Trata Bem”.3 Nada mau. Essa é a história de Jó em menos de vinte palavras. Só uma diferença existe: não há nada de engraçado nela. O sofrimento injusto nunca provoca risos.

Miséria e mistério são acrescentados ao insulto e à injúria dos desastres de Jó na vida real. Enquanto fica ali sentado, coberto de úlceras cheias de pus pelo corpo, as quais provocam febre e uma coceira enlouquecedora e incessante, ele olha para o rosto de três amigos que entram em cena. Estes ficam sentados, olhando para o homem durante sete dias e sete noites, sem pronunciar qualquer palavra. Imagine só. Primeiro, não o reconhecem, o que mostra algo sobre a extensão do inchaço e das feridas que o cobriam. O espetáculo faz com que fiquem sem palavras durante uma semana.

22 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Infelizmente, não permanecem em silêncio. Quando afinal falam, não têm nada a dizer senão atribuir culpa, fazer acusações e dirigir insultos. “Você está recebendo o que merece.” Embora façam seus comentários cortantes em termos muito mais filosóficos, mostram-se impiedosos. O sofrimento de Jó apenas intensifica-se.

Sua miséria transforma-se em mistério diante do silêncio de Deus. Se as palavras dos supostos amigos são difíceis de ouvir, o silêncio de Deus torna-se absolutamente intolerável.

Só no capítulo 38 do livro é que Deus finalmente quebra o silên­ cio. Tente imaginar: em apenas alguns meses você se torna objeto das acusações dos seus supostos amigos e os céus parecem de chumbo, enquanto roga por respostas do Todo-Poderoso, que permanece mis­ teriosamente mudo. Nada o conforta. Tudo é tão injusto; você nada fez para merecer tal aflição. O começo do livro é assim.

VAMOS VOLTAR E COMEÇAR DE NOVO

A história começa com o currículo notável de um homem excelente. Jó pode tornar-se nosso herói da perseverança, mas devemos lembrar que ele é apenas um homem e não um super-homem. Não é um anjo em corpo humano. E somente um homem.

“Havia um homem na terra de Uz, cujo nome era Jó; homem íntegro e reto” (Jó 1:1). Isto não significa perfeito; significa que ele não fazia concessões aós erros morais. Seus negócios eram feitos com integridade. Ele cumpria a sua palavra. Tratava os outros com justiça. Como resultado, era respeitado pelos que o rodeavam, quer dentro ou fora da família. Era reto. Respeitava a Deus e evitava constante­ mente o mal. Era um homem de caráter. No que se referia à família, Jó tinha sido abençoado com sete filhos e três filhas. Na ocasião em que a história de Jó é contada, os dez já são adultos. A vida dele estava em seu apogeu.

Naquele ponto ele havia acumulado um grande número de bens. Entre eles, 7.000 ovelhas. Grande parte da lã dos animais era vendi­ da. O que restava podia ser tecido e transformado em roupas quentes para os dias frios de inverno.

PREPARANDO O PALCO PARA O DESASTRE 23

O sustento da família seria obtido desses animais e de acres de plantações. Havia também 3.000 camelos. Imagino que Jó oferecia um “sistema de transporte” para as caravanas que iam do leste para o oeste. Seus camelos eram sem dúvida alugados. Aqueles camelos serviam também para seu transporte pessoal. Ele possuía mil bois, que trabalhavam em pares para arar os campos férteis, preparando o solo para a plantação de sementes que eram mais tarde colhidas, provendo abundância de alimento. Sabemos também que havia 500 jumentas. Na antiguidade, as jumentas forneciam a iguaria da época - leite de jumenta.

Acima de tudo isso, Jó possuía uma família feliz e saudável, com dez filhos adultos morando nas proximidades. Nada de fral­ das para trocar, banhos para dar, rodízio de carros para a escola. Nada de grandes refeições a serem preparadas. Nada de lanches escolares. Nada de meninos tatuados, guiando carros brilhantes, aparecendo na porta da frente e buzinando para chamar suas filhas. Nem filhas adolescentes com anéis no nariz e piercings na barriga correndo pela casa. Tudo isso já passara para Jó e sua esposa. Jó tinha controlado tudo, e surpreendentemente ninguém o critica­ va porque não havia nada a criticar sobre ele. Jó exercia controle total sobre tudo.

O falecido J. Vernon McGee escreveu o seguinte a respeito de Jó: “Este homem viveu no luxo. A última parte do versículo 3 nos indicaria que ele era uma combinação de Howard Hughes, John D. Rockefeller, Henry Ford e todos os reis do petróleo do Texas juntos.”4 Ao ler isso, lembrei-me de que o autor escrevera essas palavras na década de 1970. Vamos examinar a realidade: com o colapso económico em fins da década de 1980, o mais perto que os donos das empresas petrolíferas se aproximaram do dinheiro foi quando bombearam gasolina no posto da Texaco da esquina. Hoje poderíamos dizer que ele era Bill Gates, Donald Trump e Ross Perot combinados em um só. Jó era sadio, rico, bom e pie­ doso, mas não era inacessível.

Você vai notar que ele tinha as suas preocupações.

24 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Seus filhos iam às casas uns dos outros e faziam banquetes, cada um por sua vez, e mandavam convidar as suas três irmãs a comerem e beberem com eles. Decorrido o turno de dias de seus banquetes, chamava Jó a seus filhos e os santificava; levantava-se de madrugada e oferecia holocaustos segundo o número de todos eles, pois dizia: Talvez tenham pecado os meus filhos e blasfemado contra Deus em seu coração. Assim o fazia Jó continuamente.

Jó 1:4, 5

Ao oferecer dez ofertas queimadas em nome de cada jovem adulto, ele se preocupava com a idéia de que poderia haver no coração deles uma pitada de desobediência, ou que talvez um deles tivesse contado uma piada vulgar durante seus encontros frequentes. Jó é profunda­ mente zeloso — espiritualmente sensível não só em relação à sua vida, mas no que se referia à coerência da vida de seus filhos. Homem de oração. Puro. Verdadeiro sacerdote. Fiel. Que homem!

Francis Andersen escreve palavras esclarecedoras em seu ótimo trabalho sobre Jó.

Não precisamos supor que eles passavam todo o tempo divertindo-se e não trabalhavam. Não há sugestão de em­ briaguez, licenciosidade ou preguiça. Jó não demonstra ansiedade neste plano, embora esteja consciente do perigo de escorregarem para a profanidade. Essas deliciosas reu­ niões familiares fazem parte da atmosfera de bem-estar que dá início à história. Elas são um sinal de boa fortuna, ou antes, da bênção de Deus (...)

O toque derradeiro desta cena alegre é o pai piedoso verifi­ cando duplamente que tudo vai bem.5

Repito: que homem!

PREPARANDO O PALCO PARA O DESASTRE 25

A CENA MUDA

É preciso fazer uma pausa no final do versículo 5. Se este fosse um romance, você viraria a página e iria para o próximo capítulo da histó­ ria. Se fosse um filme, seria um desaparecimento gradual da imagem ou do som. Você estaria sentado no escuro por alguns segundos, e então uma cena brilhante surgiria, mostrando que estava em outro cenário e em outra ocasião. Se fosse uma peça de teatro, a cortina desceria no final do versículo 5. A audiência teria alguns momentos para se espreguiçar e ficar de pé, depois se sentaria para a abertura das cortinas após o assistente ter mudado o cenário da terra para o céu. Na Bíblia, entretanto, não há divisões. Você vai simplesmente do versículo 5 para o 6. Os versículos 1 a 5 estão cheios de boas notícias, bênçãos maravilhosas, integridade nos negócios, pureza de coração, fidelidade de vida. O homem é espiritualmente maduro, diligente no lar e respeitado em sua profissão.

Enquanto ele dorme, outra cena se abre para nós, a qual é des­ conhecida de Jó. Coisas semelhantes também ocorrem em nossas vidas. Quando não percebemos, Deus executa um plano que nos surpreende e, ocasionalmente, nos choca. Ele permite que aconteçam coisas que não esperamos. Sem o conhecimento de Jó, algo ocorre no plano celestial. Somos transportados do planeta Terra para o terceiro céu, a fim de testemunhar sua ocorrência.

Reflita sobre a diferença entre as primeiras linhas de Jó 1:1 e Jó 1:6: “Havia um homem (...) Num dia”. Houve um homem que vivia nesta terra. Houve um dia no salão do trono de Deus. Somos levados do cenário familiar terreno para a cena desconhecida da presença de Deus no céu. Os únicos confortáveis ali seriam os serafins que en­ chiam a presença do Deus vivo com o movimento de suas asas. Eles são os assistentes perenes do Todo-Poderoso, chamados no versículo 6 de “filhos de Deus”.

Ao olhar à sua volta, o Senhor Deus vê seus servos angélicos que vieram para se apresentar diante dele. E por que não? Pres­ tam contas a ele. Cumprem suas ordens enquanto executam a sua vontade.

26 JÓ: UM IIOMI.M l)lí TOLERÂNCIA HERÓICA

Presente entre eles encontra-se um intruso. Alguém que não se acha entre os anjos selecionados. Ele é identificado no texto hebraico como “o Satanás". HAA-Sah Tahn. (Cada vez que o nome Satanás aparece nos dois primeiros capítulos de Jó, é HAA-Sah Tahn, signifi­ cando o Sah Tahn, “o Satanás”.)

O que isso significa? Sah Tahn é um verbo hebraico. As palavras hebraicas, na maioria das vezes, têm origem na forma verbal. Sah Tahn significa “ser adversário, resistir”. Portanto, o substantivo é no geral traduzido como “o Adversário”, “o Acusador”. Satanás acusa dia e noite o povo de Deus. O Acusador aparece de repente entre os outros anjos.

Faça uma pausa e lembre-se de que Satanás não é um diabinho de corpo vermelho, carregando um garfo, que senta em seus ombros e sussurra tolices repulsivas em sua orelha. Essa é uma caricatura medieval em que Satanás gostaria que você acreditasse. Ele é o arcanjo mais atraente, brilhante e poderoso que Deus já criou. Não perdeu o seu brilho, nem o seu poder. Nem certamente sua beleza fascinante. É também insidioso. O método de trabalho favorito de Satanás é nos bastidores. O fato de ser invisível não significa que ele não seja real. Como veremos mais adiante, ele tem personalidade e está envolvido numa tarefa incessante de destruir o povo de Deus e opor-se ao plano divino. E este insidioso Adversário que encontramos de pé no céu entre o grupo de servos angélicos fiéis.

UM PLANO INSIDIOSO SUGERIDO POR SATANÁS

A partir do versículo 7 até o versículo 12, temos um diálogo muito interessante. Você não vai encontrá-lo em nenhum outro livro da Bíblia. O Senhor Deus vê o intruso e fala com ele: “Donde vens?” (Jó 1:7). Por favor, não entenda mal. Por ser onisciente (ter conhe­ cimento de tudo), Deus sabe tudo. Sua pergunta poderia ter sido esta: “Digi-tne dr onde veio. O que está havendo?”

A resposta de Satanás é breve e parece atrevida: “De rodear a terra e passear por ela” (Jó 1:7). O Adversário tem acesso tanto a este planeta como aos céus. Ele e suas forças demoníacas andam por toda

PREPARANDO O PALCO PARA O DESASTRE 27

a Terra. Tem acesso fortuito onde quer que deseje ir. Os elementos terrenos que nos detêm não o afetam. Por ser sobrenatural, ele se move instantaneamente da Ásia para a América. Poderia deixar a Austrália e estar no Pólo Norte em uma fração de segundos. Quando Satanás diz “De rodear a terra”, ele quer dizer isso literalmente.

O Senhor então indaga: “Observaste o meu servo Jó?” (Jó 1:8). Que título magnífico Deus deu a Jó! “Meu servo.” Ele pode ter sido considerado o “maior de todos os [homens] do Oriente” (Jó 1:3), mas o fato maravilhoso sobre Jó é que era um servo de Deus. Embora muito conhecido em toda parte, não era uma celebridade aos olhos de Deus. Não havia orgulho no coração do homem. A avaliação de Deus é impressionante: “Porque ninguém há na terra semelhante a ele, homem íntegro e reto, temente a Deus e que se desvia do mal” (Jó 1:8).

Ao ouvir a palavra mal, a fonte do mal responde: “Porventura, Jó debalde teme a Deus?” (Jó 1:9). Em nossas palavras: “Olhe, Deus, admita o seu tratamento dele com luvas de pelica!” O Acusador con­ tinua: “Acaso não o cercaste com sebe, a ele, a sua casa e a tudo quanto tem?” (Jó 1:10).

Considere as categorias. “Você protegeu a família dele do perigo. Protegeu seus bens da destruição. Ele conseguiu tudo de todos os lados. O muro divino ao redor da vida desse homem é invejável. Você não só o protegeu, como abençoou o trabalho de suas mãos. Seus bens, sua fama, aumentaram na terra.” O Acusador está alegando favoritismo divino. Que audácia! “Você o cercou com uma sebe espessa. Abençoou-o como a nenhum outro. Quem não o adoraria nessas circunstâncias?”

Examinemos aqui a personalidade do Acusador. Sabemos que ele tem um intelecto porque conversa com o Senhor. Vemos que Sata­ nás tem emoções por mostrar antagonismo em relação a Jó. Possui também vontade porque pretende destruir Jó, na esperança de desa­ creditar Deus. A grande esperança de Satanás é arrasar Jó. “Estende, porém, a mão, e toca-lhe em tudo quanto tem, e verás se não blasfema contra ti na tua face” (Jó 1:11, o grifo é meu). “Faça com que ele

28 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

desça ao pó, como o resto dos humanos tem de viver, e verá do que ele é feito. Vai voltar-se contra você num instante!”

É um plano astucioso, mas também injusto. Jó não merece se­ quer a sugestão de maus tratos. Ele certamente andou com Deus em seus anos adultos. É agora o melhor dos melhores, “o maior de todos os do Oriente”. Além de tudo, Jó é um servo de Deus. Mas nada disso impressiona Satanás. Suspeitas malignas instigam sua conspi­ ração insidiosa: “Se quiser saber do que ele realmente é feito, retire todo esse tratamento privilegiado e essa proteçao total. Remova dele o verniz do conforto e verá que imediatamente se voltará contra você.” “E verás se não blasfema contra ti na tua face” (Jó 1:11), eis a predi­ ção de Satanás. “Em vez de tratá-lo como um filho mimado, por que não o trata como aos demais na terra? Deixe que saiba como é sofrer a morte de um filho ou a perda de todos os seus bens. Deixe que tudo isso o atinja fortemente e verá do que Jó é feito.” Seu ponto é claro: Jó adora a Deus por causa do proveito que tira disso e não porque o Senhor esteja realmente em primeiro lugar na sua vida.

Deus já ouvira o suficiente: “Disse o S en h o r a Satanás: Eis que tudo quanto ele tem está em teu poder” (Jó 1:12, o grifo é meu). Não continue lendo por um momento. Esse é um pensamento absoluta­ mente terrível. Leia outra vez as palavras do Senhor, só que mais devagar.

Veja o bilhete de permissão que ele entrega a Satanás: “Tudo o que ele tem está em teu poder.” E ele acrescenta uma advertência: “Somente contra ele não estendas a mão” (Jó 1:12). “Não toque na sua vida. Nao toque em seu corpo, em sua alma ou sua mente. Você pode remover seus bens e atacar sua família, mas deixe o homem em paz.”

Satanás saiu da presença do Senhor com um risinho sinistro. Lembre-se de que Jó nada sabia desse diálogo.

QUATRO PRINCÍPIOS QUE PERMANECEM VERDADEIROS ATÉ HOJE

Isso basta para uma sessão. Voltaremos ao plano de Satanás no próxi­ mo capítulo. Vamos fazer uma pausa aqui e pensar um pouco em

PREPARANDO O PALCO PARA O DESASTRE 29

como tudo isso se relaciona com o nosso mundo de hoje. Quatro princípios que parecem relevantes emergem.

Primeiro princípio: Encontramos um inimigo que não podemos ver, mas ele é real. Temos um inimigo sobrenatural e o encontramos regu­ larmente — ele ou um de seus emissários. Nunca duvide - tudo isso é verdade. Ele espera que sua estratégia enganadora confunda, enfra­ queça você, e finalmente o derrube. O desejo do Acusador é arruinar o seu testemunho da mesma forma que destrói a sua vida. Durante o processo, se isso significar a destruição de seus relacionamentos fami­ liares, ele o fará. Caso isso envolva tentá-lo a agir incorretamente nos negócios, como você não agiria antes, fará isso. O que quer que seja necessário para derrubar você, ele tentará. O fato de termos um ini­ migo invisível não significa que ele não seja real.

Segundo princípio: Suportamos provações imerecidas, mas que são permitidas. Você leu certo. A vida inclui provações que não merece­ mos, mas que devem, mesmo assim, ser suportadas. No início deste capítulo mencionei uma mulher, a qual não merecia trabalhar para uma empresa que contrariou justamente os princípios que ela julgava serem seguidos pela empresa. Ela não merecia perder sua aposenta­ doria nem sofrer de câncer. Afinal de contas, era uma mãe sozinha tentando educar três filhos com menos de quinze anos. Seu fardo na vida provavelmente não foi justo, mas houve permissão para tudo. O mesmo pode ser dito a seu respeito. Nunca poderemos explicar ou compreender completamente o mistério da vontade insondável de Deus. Não tente agarrar cada fio do seu plano profundo. Se resistir ao meu conselho neste ponto, ficará cada vez mais confuso, ressenti­ do e finalmente amargo. Satanás vai então vencer. Suporte a provação permitida por Deus. Nada toca a sua vida que não tenha passado primeiro pelas mãos de Deus. Ele tem pleno controle e tem o direito soberano de permitir provações que não merecemos por ser Quem é.

Terceiro princípio: Há um plano que não compreenderemos, mas que éo melhor. Embora cada segmento desse plano possa não ser justo ou agradável, ele coopera para o bem. A enfermidade que Jó teve de suportar mais tarde não foi boa em si ou de si mesma. I )e jeito algum!

30 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Mas colaborou para o bem. Nossa perspectiva é extremamente limi­ tada. Nós temos uma visão restrita do tempo. A visão de Deus, porém, é panorâmica. O vasto plano cósmico de Deus está em operação agora, e ele não sente a necessidade (nem tem obrigação) de explicá-lo a nós. Se tentasse, nossa reação seria como a do adolescente confuso ouvindo o professor de matemática: “O quê?” Você não entenderia, nem eu. Lembre-se, apenas, de que o Pai sabe o que é melhor para os seus filhos. Descanse nessa idéia.

Quarto princípio: Sofremos consequências que não esperávamos, mas que são necessárias. Não sei onde você se encontra hoje, mas estou disposto a apostar que a maioria dos leitores deste livro esteja passando por algo injusto. E bem provável que você simplesmente não mereça o que está acontecendo. As consequências podem até ter começado a aborrecê-lo. Você não esperava nada disso. Não pensou que chegaria a esse ponto, mas chegou. Confie em mim. O que aconteceu é uma parte necessária do seu crescimento espiritual. Sim, necessária. Co­ mecei finalmente a aceitar essa realidade depois de todos estes anos de minha vida.

Ao encerrar este capítulo, quero dirigir-me a você que entrou no território de Jó. Caso não tenha conseguido mais nada, isso pelo menos o preparou para dar maior atenção à mensagem entretecida neste livro. Você só teve um vislumbre de como as coisas começaram. A história não termina com Satanás saindo da presença do Senhor. Há muito mais na saga de Jó. Preciso agora repetir o que disse no início: quanto mais a história se desenrola, tanto mais você vai compreender que a vida não é só difícil, ela é injusta.

O silêncio da voz de Deus fará você pensar se ele está mesmo lá. A ausência da presença de Deus fará você imaginar se ele sequer se importa. Ele está lá. E ele se importa.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já aceitou que a vida é difícil, mas como o seu coração reage quando ela também se mostra profundamente injusta?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Qual sonho ou expectativa sua foi interrompido por um golpe que você não merecia, e onde estava Deus naquele momento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Antes de o "palco do desastre" se armar na vida de Jó, o que sustentava a sua integridade, e o que sustenta a sua?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Cambaleando e se Recuperando de Notícias Devastadoras$t$, 3,
$conteudo$A

lguns acontecimentos nos atingem com tamanha ferocidade que deixam estilhaços de projéteis mentais cravados em nossos cére­ bros. A menção das datas nos lembra não só a atrocidade como também onde estávamos na ocasião e como reagimos quando as notícias causaram enorme impacto:

• 7 de dezembro de 1941, Pearl Harbor, Oahu

• 22 de novembro de 1963, Dallas, Texas

• 11 de setembro de 2001, Nova York, Washington, D.C., e interior da Pensilvânia

Se você viveu tantos anos quanto eu, essas três datas são sinónimo de infâmia. Posso contar-lhe exatamente onde eu me achava, o que fazia e como me senti. A mais recente é, naturalmente, a mais viva.

Uma estratégia coordenada, planejada e realizada por terroristas resultou na morte de milhares de vidas inocentes ao serem executados

32 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

esses atos de destruição. As torres gémeas, que antes emprestavam elegância à linha do horizonte da cidade de Nova York, são agora evidenciadas pela sua ausência. Uma ala inteira do Pentágono desapareceu. E um local tranquilo, próximo a uma área arborizada no sudoeste da Pensilvânia, transformou-se para sempre. Na esteira desse terceiro evento horrendo, um nome emergiu. Muitos outros foram heróicos, mas a história deste indivíduo específico se destaca.

Seu nome é Todd Beamer, marido fiel e pai dedicado de dois filhos; sua mulher, Lisa, estava grávida do terceiro.

Os acontecimentos da vida de Todd naquela fatídica manhã são conhecidos de quase todos. Enquanto se encontrava no avião seques­ trado, ele telefonou para o Centro de Comunicações da GTE em Oakbrook, Illinois, e falou com uma das supervisoras, Lisa Jefferson. Nessa conversa houve uma mescla de calma, palavras ditas com pre­ caução, lágrimas e uma sugestão de pânico. Todd finalmente pediu que ela o acompanhasse na Oração do Senhor. Depois dessa oração, as últimas palavras de Todd foram firmes: “Companheiros, estão pron­ tos? Então vamos!” Foi o que fizeram. Eles desviaram o vôo 93, da United Airlines, impedindo que se transformasse num míssil que mataria mais pessoas do que os que estavam a bordo. Graças a Todd e aos outros passageiros, o avião foi impedido de provocar uma devas­ tação muito maior ao espatifar-se no solo em um campo da Pensilvânia.

Todd Beamer era apenas um passageiro do avião. Não tinha treinamento para lutar com terroristas. Jamais sonhou que iria ou poderia fazer tal coisa. Mas ele e os outros fizeram. Sem sequer pen­ sar nisso, Todd Beamer mostrou heroísmo!1 Quando ouvi as notícias, as palavras do poeta Henry Wadsworth Longfellow, do século XIX, me vieram à memória:

As alturas que grandes homens alcançaram e mantiveram

Não foram atingidas em um vôo súbito,

Mas eles, enquanto os companheiros dormiam,

Trabalhavam em rumo ascendente durante a noite.2 (N.T. — Tradução literal.)

CAMBALEANDO E SE RECUPERANDO DE NOTÍCIAS DEVASTADORAS 33

Não conheço ninguém que desejasse deliberadamente ser herói. Você talvez nunca tenha pensado nisso, mas a maneira como seremos lembrados por alguns que nos observaram através de certas provações terá sido, da perspectiva deles, um empreendimento heróico.

Volte comigo centenas de anos até uma data que a areia do tempo agora apagou. A um lugar que poucos saberiam localizar num mapa. A um cenário que parece quase idílico. A um homem que não sabia os extremos que seria chamado a suportar. Embora este homem fosse também um bom marido e um pai dedicado e fiel, e um negociante íntegro, ele viveria para ver tudo isso mudar numa série de eventos devastadores.

De modo interessante, Jó não viria a ser lembrado por ser saudáj vel, rico e sábio, mas pelo seu nível heróico de perseverança depois de / perder tudo.

Séculos mais tarde, quando outro personagem bíblico mencio­ nou Jó, ele escreveu: “Tendes ouvido da paciência de Jó” (Tg 5:11). Ao fazer uso do termo grego, hupomone, Tiago estava dizendo, na verdade: “Vocês ouviram falar do homem que ficou firme, suportando o fardo”. As perdas de Jó o golpearam como uma carga de tijolos de duas toneladas. O homem permaneceu firme apesar dos golpes após golpes que recebeu. Seu nome tornou-se um exemplo de perseverança heróica.

Quantos pacientes, ao enfrentarem uma cirurgia radical, sentiram-se consolados com a vida de Jó? Quantos pais com o coração partido, desolados ao enterrarem um filho ou uma filha, voltaram-se para Jó a fim de restabelecer a confiança? Quantos que faliram num negócio lembraram-se de Jó e encontraram forças para continuar?

As dolorosas perdas de Jó são intensificadas por terem ocorrido sem qualquer aviso. Isso já bastaria para fazer cambalear o indivíduo comum. É fácil ignorar a rapidez abrupta dos golpes que o atingiram porque sabíamos que eles viriam e por quê. Por termos sido informa­ dos deste estranho “acordo cósmico” entre o Sustentador da Vida e o Adversário, o fator choque diminui. Embora nós soubéssemos da natureza invulgar do trato feito, Jó não sabia. De fato, ele talvez nunca

34 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

tenha sido informado de todos os detalhes do plano. Ao responder com a força de caráter que cultivara durante os anos em que confiou no seu Deus e andou com ele, a perda de tudo não levou Jó a amal­ diçoar a Deus e voltar-se contra o Senhor. Deve ter sido, porém, terrivelmente confuso.

Penso que vale a pena considerar o ponto de vista de Philip Yancey sobre tudo isto.

Ajuda um pouco pensar no Livro de Jó como uma peça de suspense, uma história de investigação policial. Antes de a peça mesma começar, nós da plateia assistimos a um “trailer” do que está por vir, como se tivéssemos chegado mais cedo a uma entrevista à imprensa em que o diretor explica sua obra (capítulos 1 e 2). Ele conta o enredo e descreve as principais personagens, então nos adianta quem fez o que na peça, e por quê. Na verdade, ele revela todos os mistérios da peça com exceção de um: como o personagem principal reagirá? Jó irá confiar em Deus ou negá-lo?

Mais tarde, quando se erguem as cortinas, vemos somente os atores no palco. Limitados à peça, eles não têm qualquer conhecimento do que o diretor nos contou na “pré-estréia”. Sabemos as respostas aos enigmas do mistério, mas o ator principal, o detetive Jó, não sabe. Ele passa o tempo todo no palco tentando descobrir aquilo que já sabemos. Ele se coça com cacos de louça e pergunta: “Por que comigo? O que eu fiz de errado? O que Deus está tentando me dizer?”$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Qual foi a notícia devastadora que cravou estilhaços na sua memória, e como você reagiu nas primeiras horas depois dela?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante da pergunta angustiada "por que comigo?", o que ajuda você a permanecer firme mesmo sem ter todas as respostas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que Jó adorou a Deus sem conhecer os bastidores do seu sofrimento, você confiaria no Senhor mesmo sem entender o porquê?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Satanás vs. Jó - Segundo Round$t$, 4,
$conteudo$A

cortina sobe para o primeiro ato, cena dois. Já estivemos aqui antes.

Num dia em que os filhos de Deus vieram apresentar-se perante o S enh o r, veio também Satanás entre eles apre­ sentar-se perante o S enhor. Então, o S en h o r disse a Sata­ nás: Donde vens? Respondeu Satanás ao S en h o r e disse: De rodear a terra e passear por ela. Perguntou o S en h o r a Satanás: Observaste o meu servo Jó? Porque ninguém há na terra semelhante a ele, homem íntegro e reto, temente a Deus e que se desvia do mal. Ele conserva a sua integri­ dade, embora me incitasses contra ele, para o consumir sem causa. Então, Satanás respondeu ao Senhor: Pele por pele, e tudo quanto o homem tem dará pela sua vida. Es­ tende, porém, a mão, toca-lhe nos ossos e na carne e verás se não blasfema contra ti na tua face. Disse o S en h o r a Satanás: Eis que ele está em teu poder; mas poupa-lhe a vida. Então, saiu Satanás da presença do S enhor e feriu a

46 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jó de tumores malignos, desde a planta do pé até ao alto da cabeça. Jó, sentado em cinza, tomou um caco para com ele raspar-se. Então, sua mulher lhe disse: Ainda conservas a tua integridade? Amaldiçoa a Deus e morre. Mas ele lhe respondeu: Falas como qualquer doida; temos recebido o bem de Deus e não receberíamos também o mal? Em tudo isto não pecou Jó com os seus lábios.

Jó 2:1-10

Quando coisas más acontecem, elas no geral ocorrem com a pessoa errada.

Johnny Gunther era um garoto bonito de 16 anos quando a sombra do câncer cerebral caiu sobre a sua vida. Ele formou-se em Matemática e Química na Academia Deerfield, e suas notas eram sempre altas. Durante os 14 meses que se seguiram ao diagnóstico, Johnny foi submetido a duas cirurgias. Mesmo depois da segunda, passou nos exames dificílimos da Universidade Columbia. Duas semanas depois de ter sido aceito nessa universidade, o jovem Johnny Gunther morreu.

O caráter desse jovem corajoso foi revelado após a primeira intervenção. Os médicos explicaram a gravidade da condi­ ção do jovem aos pais dele, John e Frances Gunther. “O que devemos contar ao Johnny sobre a doença?”, perguntaram eles ao médico.

“Ele é tão inteligente e curioso sobre tudo que está aconte­ cendo”, replicou o cirurgião. “Johnny quer saber realmente tudo que se passa; penso então que devemos ser honestos com ele.”

Os Gunthers concordaram.

O médico foi ver Johnny sozinho em seu quarto e explicoulhe a seriedade do seu tumor cerebral. O rapazinho ouviu

SATANÁS VS. JÓ - SEGUNDO ROUND 47

atentamente a explicação e depois perguntou: “Doutor, como devo contar isso a meus pais?”1

Quando coisas más acontecem, geralmente ocorrem com as pessoas erradas. Quando isso sucede, esta pergunta sempre nos persegue: “Por quê?”

Por que uma coisa tão terrível quanto o tumor cerebral invadiu a vida jovem e promissora de Johnny Gunther?

Essa pergunta está sendo feita em cada hospital importante em meu país hoje. Além disso, em cada grande comunidade em cada cidade há uma ou duas casas em que essa mesma pergunta continua sendo feita sem receber resposta.

Em algum ponto nisto tudo há espaço para a história de Jó, pois, como já aprendemos, nenhum homem melhor viveu em sua época. Ele não era somente bom, como também piedoso. Não era apenas um marido fiel, mas um pai amoroso e dedicado. Era um bom empregador. Seu trabalho árduo e sua integridade o levaram a um estilo de vida próspero nos últimos anos de sua existência. Com grande extensão de terras, alimento em abundância, gado e camelos em número suficiente para financiar seus sonhos, parecia que todo o futuro de Jó estava garantido.

De repente, porém, sua vida despencou. Uma tragédia sem sen­ tido invadiu a vida de quem aparentemente não merecia isso. Ele e a mulher foram deixados para recolher os pedaços. Jó perdera quase todos os empregados; só restaram quatro. Perdera todos os meios de obter sustento. Perdera também seus dez filhos adultos. Para piorar as coisas, sofreria outras perdas. Ele não tinha idéia de que sofrimento adicional injusto e imerecido o aguardava. Deitou-se na véspera sem saber que nunca mais seria o mesmo em 24 horas.

O mesmo aconteceu com aqueles moradores da cidade de Nova York no dia 10 de setembro de 2001. Eles deixaram o trabalho tarde da noite, depois de um dia ocupado no World Trade Center, já pen­ sando no dia seguinte. Estavam fazendo planos e completando suas

48 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

listas de coisas a fazer no dia 11/9. Muitos voltaram aos escritórios bem cedo na manhã seguinte para começar o trabalho. Pouco antes das 8:00 horas eles não tinham idéia de que o vôo 11, da American Airlines, estava se dirigindo diretamente para o seu escritório na Tor­ re Norte. De repente o avião bateu. O choque foi tão surpreendente e inesperado que nem as pessoas da Torre Sul ficaram sabendo, e com certeza não tinham idéia de que um plano terrorista estava em ação para atingir aquela torre, a ser executado pelo vôo 175, da United, apenas 18 minutos depois. Os nova-iorquinos não podiam acreditar - ninguém podia acreditar! Era algo inconcebível. Por que eles? Por que aquilo? Por que agora? Os mesmos pensamentos de Jó, quando todos os seus bois, jumentos, camelos e servos, e finalmente seus dez filhos se foram. E você, qual seria sinceramente a sua reação?

Eugene Peterson nos dá a resposta de Jó na paráfrase de The Message.

Jó levantou-se, rasgou o seu manto, rapou a cabeça e depois caiu no chão e adorou:

Nu saí do ventre de minha mãe e nu voltarei ao ventre da terra.

Deus dá, Deus toma.

Bendito seja o nome de Deus.

Em tudo isto Jó não pecou; não culpou nenhuma vez a Deus.

Jó 1:20-22, MSG (Tradução livre)

Penso no conflito daquela sua primeira noite dolorosa, tentando dormir depois de sepultar seus dez filhos com as próprias mãos, deitado ao lado da mulher que suportara igualmente a perda, quando tudo lhe parecia envolto em uma espécie de névoa. Havia, porém, mais a sofrer. Muito mais. Ele não podia imaginar isso, como também não puderam os que se achavam no Pentágono ocupados em tratar dos detalhes da segurança da costa do Atlântico e da região de Nova York atacada pelos terroris­ tas. Nossos militares não tinham idéia de que seriam os próximos.

SATANÁS VS. JÓ - SEGUNDO ROUND 49

Um terceiro avião, em outra missão maligna, em breve mergulharia na lateral do prédio onde algumas pessoas já estavam trabalhando para lidar com a atrocidade que acabara de acontecer em Nova York.

Falei com alguns dos oficiais que se achavam no prédio naquele momento. Um admitiu, constrangido: “A maioria de nós nunca pen­ sou que o Pentágono seria o próximo alvo.” E possível que nunca saibamos ao certo se o terceiro avião estava procurando localizar a Casa Branca e por causa da folhagem em meados de setembro não conseguiu. Qualquer que tenha sido o plano, o piloto em seu projeto insensato e suicida viu aquele edifício de cinco lados e abriu nele um buraco de 60m de largura devido à dupla explosão — primeiro do avião em si, batendo no prédio, e depois o incêndio do combustível que espalhou o fogo pelos largos corredores.

Como aconteceu com Jó, esse episódio não foi absolutamente justo! Pelo menos, não foi justo segundo a nossa perspectiva. O homem era um modelo de integridade genuína. Ele primeiro bendissera e adorara o Pai. Satanás não podia suportar isso.

O Adversário perdera o primeiro round.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando "coisas más acontecem com as pessoas erradas", como você tem lidado com a pergunta "por quê?" que parece nunca receber resposta?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante da provocação da esposa para amaldiçoar a Deus, o que faz alguém escolher dizer "recebemos o bem; não receberíamos também o mal?"?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em meio a um segundo golpe que atinge você já caído, de onde vem a força para não pecar com os seus lábios?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Outra Audiência com o Adversário$t$, 5,
$conteudo$O segundo round começa no segundo capítulo. A segunda cena tem um início tão agourento quanto a primeira: “Num dia” (v. 1). Sata­ nás gosta de atacar-nos com uma dupla explosão. A primeira chega como uma completa surpresa; a segunda golpeia fundo. Como antes, Satanás tinha um plano ao se apresentar diante de Deus.

Então, o Senhor disse a Satanás: Donde vens? Respondeu Satanás ao Senhor e disse: De rodear a terra e passear por ela. Perguntou o Senhor a Satanás: Observaste o meu servo Jó? Porque ninguém há na terra semelhante a ele, homem íntegro e reto, temente a Deus e que se desvia do mal. Ele conserva a sua integridade, embora me incitasses contra ele, para o consumir sem causa.

Jó 2:2, 3

50 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Está vendo a palavra consumir? O termo hebraico significa “engolir”. A raiz do verbo intensifica o termo. Quando usado nesse sentido dá idéia de uma farpa. A idéia de raspar, ou até amordaçar, se quiser. “Você insistiu para que eu o raspasse sem motivo.” Satanás não quis deixar por menos e respondeu atrevidamente, como se di­ zendo: “De modo algum! Pele por pele. O homem dará tudo que tem para proteger sua vida. Mas ele ainda está rodeado pela sua cerca. Ainda recebe tratamento privilegiado. Não poderá sustentar-se sem os seus animais e prédios, mas ainda tem a sua saúde. Os filhos se foram, mas o casal pode ter outros. Permita que eu avance. Dê-me liberdade para quebrantá-lo ao máximo, tirando a sua saúde, e ele irá amaldiçoá-lo, em sua face.” Penso que o Adversário disse isto por pura irritação. Ele existe com uma atitude de ira assassina. A sua predição é repetida: “Blasfemará contra ti na tua face”.

Leia a resposta do Senhor e reflita: “Disse o S e n h o r a Satanás: Eis que ele está em teu poder; mas poupa-lhe a vida” (Jó 2:6). Você pode imaginar isso? Pode imaginar o seu nome ligado a tal acordo? “Está bem, Lúcifer, vá atrás dele, só não o mate.” Deus estabeleceu novamente limites. “Conserve a vida dele, mas pode usá-lo como alvo de suas zombarias.” Tão espantado quanto as pessoas do World Trade Center e do Pentágono, Jó em breve sofreria o choque de sua vida.

Ao acordar bocejando na manhã seguinte, Jó sentiu dores e per­ cebeu que estava com febre. Por quê?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Como consola o seu coração saber que o Adversário só pôde avançar até onde Deus, soberano, lhe permitiu chegar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando o sofrimento chega em "dupla explosão" e golpeia fundo, o que impede você de concluir que Deus o abandonou?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que existem limites que o mal não pode ultrapassar na sua vida, como isso muda a maneira de você atravessar a provação?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Segundo Round: Intensificação do Sofrimento$t$, 6,
$conteudo$“Então, saiu Satanás da presença do S e n h o r e feriu a Jó de tumores malignos, desde a planta do pé até ao alto da cabeça” (Jó 2:7). Jó sentiu uma fisgada embaixo do braço e depois um inchaço no pesco­ ço. Dentro de sua boca havia mais duas feridas. Pontinhos vermelhos apareceram na testa e até no couro cabeludo. Acima de tudo, seus pés estavam tão inchados que não podia calçar as sandálias. Antes do meio-dia a febre subiu bastante. A essa altura ele já perdera o apetite. Era como se estivesse se dissolvendo. Falou sobre isso com a mulher.

SATANÁS VS. JÓ - SEGUNDO ROUND 51

Ela olhou mais de perto e notou uma espécie de erupção de pele. Ele pediu que examinasse suas costas. Ela observou: “Há uma porção de inchaços em toda parte.” O relato bíblico diz: “tumores malignos”.

Os médicos ficaram curiosos durante anos a respeito desta doen­ ça específica. Em minha pesquisa encontrei vários comentários sobre a moléstia. Um dizia que era varíola. Outro, elefantíase. Outro ainda, eczema crónico, ou lepra. Alguém sugeriu psoríase; outro dermatose escamosa; outro queratose. Um identificou, em termos médicos, pênfigo foliáceo. Não é de surpreender que muitos sugerissem que era melanoma, uma forma agressiva de câncer de pele.

Satanás não perdera tempo. Ele “feriu a Jó”. Atacou-o enquanto estava caído. O que Jó pensara que eram seus músculos doloridos por ter tido de enterrar os dez filhos, ele veio a compreender que se trata­ va de algo muito mais sério, especialmente quando viu aumentar o número de úlceras da pele. Seu coração afundou ao descobrir que tinha uma doença a qual iria acrescentar mais sofrimento à sua desgraça.

Examinei cuidadosamente cada capítulo de Jó e tomei nota de todas as referências aos sintomas que acompanharam sua enfermida­ de. Este é um resumo do que ele sofreu:

Feridas inflamadas, ulcerosas Jó 2:7

Coceira contínua Jó 2:8

Mudanças degenerativas na pele do rosto, desfiguração Jó 2:12

Perda de apetite Jó 3:24

Medo e depressão Jó 3:25

Feridas purulentas que se abrem, coçam, racham e supuram Jó 7:5

Vermes formados nas feridas Jó 7:5

Dificuldade para respirar Jó 9:18

Escurecimento da pálpebra Jó 16:16

Mau hálito Jó 19:17

52 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Perda de peso Jó 19:20; 33:21

Dor excruciante, contínua Jó 30:27

Febre alta com arrepios e descoloração da pele, assim como ansiedade e diarréia Jó 30:30

Além de tudo isso, Jó suportou delírio, insónia e rejeição dos amigos (Jó 7:3; 29:2). Males que duraram meses. Em resumo, Jó tornou-se a personificação da miséria.

Devemos lembrar que isto resultou em sua rejeição, isolamento e transferência para o depósito de lixo, como diríamos hoje. Era o lugar onde queimavam detritos, entulho e excrementos humanos da cidade. Esse veio a tornar-se o lugar da sua residência.

Warren Wiersbe descreve esse cenário desolador:

O lixo da cidade era depositado e queimado ali. Viviam também nesse lugar os rejeitados da cidade, pedindo esmo­ las aos passantes. Na pilha de cinzas, os cães brigavam pela comida e os excrementos da cidade eram lançados e quei­ mados. O principal cidadão estava agora vivendo em pobre­ za abjeta e vergonha. Tudo que humanamente lhe restara eram a esposa e três amigos; até mesmo eles se voltaram contra a sua pessoa.2

Completa perplexidade, total isolamento, sofrimento insuportável, nenhuma esperança de mudança, sentado em ambiente sórdido, re­ movido de todos os confortos de sua casa. Em suma, Jó tornou-se um Ground Zero [termo utilizado nos EU A para se referir à área destruída em Nova York no 11 de setembro] em forma humana.

Chegou um dia em que tudo isso foi demais para a mulher de Jó. Ela não conseguiu mais suportar. No fim de suas forças, foi visitar o marido. Sentada ao lado dele, inclinou-se e perguntou: “Ainda con­ servas a tua integridade?” (Jó 2:9). Volte um pouco a uma cena

SATANÁS VS. JÓ - SEGUNDO ROUND 53

anterior, quando Deus disse a Satanás: “Observaste o meu servo Jó? ...Ele conserva a sua integridade” (2: 3). Sem saber, ela colocou o dedo na única qualidade na vida de Jó que Deus havia usado para responder a Satanás. A pergunta dela pôs em dúvida a necessidade dele de continuar mantendo sua integridade. A seguir, ela usa a es­ tratégia de Satanás, quando diz ao marido: “Amaldiçoa a Deus!” Sa­ tanás quase sorriu naquele momento, enquanto ele e seus seguidores se reuniram, olhando, aguardando, esperando. Com certeza insistiam: “Diga, Jó. Diga! Vamos - amaldiçoe o seu Deus!” Tudo dependia da resposta de Jó à sua esposa.

UM PEDIDO DE COMPREENSÃO

Quero confessar que durante longo tempo cm meu ministério tirei proveito da mulher de Jó, especialmente por não se achar presente para se defender. Penso que isso não passou de imaturidade da minha parte. Além do mais, eu não estava casado por um tempo suficiente para ter discernimento e não dizer coisas desse tipo. Não posso dei­ xar este instantâneo da mulher de Jó na história sem esclarecer o registro em sua defesa. Quero sugerir quatro razões para que respon­ desse desse modo:

Primeira, ela também perdera dez filhos. Até que você ou eu te­ nhamos perdido todos os nossos fdhos, é preciso ter cuidado para não criticar alguém que esteja passando por essa tristeza profunda. Quem sabe o que faríamos diante de uma perda como essa? Sugiro que foi no conflito debilitante da sua dor que ela pronunciou essas palavras.

Segunda, ela também sofrera a perda de sua riqueza e bens. Como toda mulher cujo marido alcançou um alto nível de segurança finan­ ceira poderia testemunhar, esse estilo de vida produz benefícios e prazeres que dão grande satisfação. Os muitos bens destruídos pertenciam também a ela; faziam parte deles o seu gado, a sua casa. Ela ficou repentinamente reduzida ao mesmo nível dele no plano económico.

Terceira, durante anos ela havia sido a esposa do “maior de todos os [homens] do Oriente” (Jó 1:3). Há honra nisso. Há também grandes

54 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

momentos de reconhecimento público e alegria íntima nessa posição. Ela não é mais a primeira-dama da comunidade. E agora a esposa patética de um homem alquebrado cujo mundo desabou, que está sentado sozinho, em pobreza abjeta, coberto de feridas.

Quarto, ela perdeu seu companheiro. Não tem mais o homem que ama para participar de conversas agradáveis. Não há mais momentos especiais de romance e namoro. A mulher não tem esperança de que as coisas venham a mudar. Precisamos dar a ela alguma folga.

Não é um pouco mais fácil compreender como ela pôde sugerir: “JÓ, querido, vamos parar por aqui. Não insista. Você não pode con­ tinuar vivendo assim, não posso suportar. Amaldiçoe a Deus e deixe que ele o leve para casa, para viver com ele.” Penso que foi assim. Ela chegou ao seu limite e estava disposta a permitir que ele partisse. Não estou justificando o raciocínio da mulher, mas tentando compreendê-lo.

Depois de dizer isso, quero oferecer alguns comentários práti­ cos “do outro lado” para vocês que são esposas. (Pensem neles como um pequeno conselho de Marte para Vênus, caso ajude.) Quero sugerir algo que as esposas deveriam considerar sempre fazer e nunca fazer.

Primeiro, o sempre. Sempre tomem cuidado com suas palavras quando seu marido estiver atravessando tempos terrivelmente dificeis. Quero confessar algo sobre nós homens. Quero principalmente que você lembre: o fato de passar por períodos difíceis prolongados enfra­ quece a maioria dos homens. Por alguma razão, as dificuldades parecem fortalecer as mulheres; admiramos vocês por isso. Nós, homens, porém, nos sentimos fracos quando períodos de aflição surgem e permane­ cem. Em nossa condição debilitada perdemos a objetividade e algumas vezes a estabilidade. Nosso discernimento também fica distorcido. Nossa determinação estaciona. Nós nos tornamos vulneráveis, e a maior parte dos homens não sabe como lidar consigo mesmo num estado mental vulnerável. Vocês, mulheres, sabem lidar com a vulnerabilidade; nós homens, não. E ficamos com medo, por mais difícil que seja admitir isto. Quando os homens passam a ter medo,

SATANÁS VS. JÓ - SEGUNDO ROUND 55

coisas estranhas acontecem em seu íntimo. Não compreendemos a nós mesmos. Entretemos pensamentos invulgares que nem sequer consideraríamos em outra situação. Em vista de tudo isto - ouçamme —, precisamos de sua perspectiva clara, de sua sabedoria e sua força espiritual. Acima de tudo, precisamos que orem por nós como nunca oraram antes. Precisamos de suas orações, de seu apoio emo­ cional. Precisamos que tomem a iniciativa e se coloquem na brecha.

Temos necessidade de suas palavras de confiança e encora­ jamento. Achamos até difícil dizer: “Preciso de você agora.” Minha esposa poderia contar-lhe que ela viveu comigo durante nossos pri­ meiros dez anos de casamento sem nunca pensar que eu precisava dela. Eu finalmente admiti isso e aprendi a dizê-lo. Nas horas soli­ tárias da grande provação de um homem, as palavras da mulher significam mais para ele do que as de qualquer outra pessoa. Essa é uma das razões dadas por Deus para que você e seu parceiro te­ nham sido chamados para estar juntos. Quando nós maridos nos perdemos no caminho, vocês mulheres nos ajudam a encontrá-lo outra vez.

Agora, o nunca. Nunca, sugiram para comprometermos a nossa in­ tegridade, mesmo que isso pudesse oferecer alívio temporário. Por favor, não façam isso. Podemos ser tão fracos a ponto de acreditar em vocês e agir de acordo com sua sugestão tentadora. Compreenda que, quando estamos enfraquecidos, nos tornamos frágeis por dentro. Somos facil­ mente seduzidos por palavras que oferecem alívio, porque a maioria dos homens considera o alívio a coisa mais importante quando os tempos são sombrios. É por isso que muitos homens que estejam passando por provações intensas têm um caso. Não estou absoluta­ mente justificando isso, só estou dizendo que é uma opção que alguns fazem quando estão na pior.

Deus disse a Satanás: “Ele conserva a sua integridade”. E a espo­ sa perguntou exatamente isto a ele: “Ainda conservas a tua integrida­ de?” Ele precisava que ela tivesse dito: “Jó, o que quer que faça, fique firme! Não comprometa a sua integridade. Vamos andar com Deus através de tudo isto, juntos.”

56 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

A RESPOSTA DE JÓ

A resposta de Jó foi magnífica. “Falas como qualquer doida” (Jó 2:10). Tiremos o chapéu para o velho patriarca! Em sua condição enfraquecida, sentado ali, sofrendo com todas aquelas feridas, sem saber se haveria qualquer mudança na sua situação, ele se manteve firme e até a reprovou. Disse, com efeito: “Preciso mudar o rumo desta conversa. Não vamos fazer isso.”

Jó foi além de uma simples censura; fez uma excelente pergunta: “Temos recebido o bem de Deus e não receberíamos também o mal?” (Jó 2:10). Seu discernimento era raro, não só naquela época, mas também hoje. Que teologia magnífica! Como é rara uma declaração como essa em nosso sistema secular!

Pelo contrário, ouvimos respostas como: “Que tipo de Deus é esse que o trata tão injustamente depois de você ter vivido com tanta dedicação? Por que você deveria continuar firme quando esse Deus supostamente amoroso trata você desse jeito?”

O conselho de Jó era diferente: “Devemos aceitar o bem de Deus e não aceitar a adversidade?” A sentença em hebraico enfatiza o bem e a adversidade (como na RA). É uma pergunta retórica, não sendo feita para ser respondida, mas feita com o propósito de levar o ouvin­ te a refletir. Jó está pensando: “Ele não tem esse direito? Ele não é o Oleiro e nós, o barro? Ele não é o Pastor e nós, as ovelhas? Ele não é o Mestre e nós, os servos? Não é assim que funciona?”

Robert Alden, em sua excelente obra sobre Jó, escreve de modo prático:

Esta é uma lição difícil de aprender para alguns cristãos, especialmente se eles sentem que lhes foram prometidas saúde e riqueza ou entenderam erroneamente que o ma­ ravilhoso plano de Deus para as suas vidas envolve só prazer e não problemas. Os crentes deste lado da cruz têm muito mais exemplos, tanto da Bíblia como da his­ tória da igreja, do povo de Deus que sofreu. Jó estava muito mais no escuro. Todavia, dessa grande escuridão

SATANÁS VS. JÓ - SEGUNDO ROUND 57

sua forte crença na soberania de Deus se projeta ainda mais brilhantemente.3

De alguma forma, ele já sabia que o barro não pergunta ao oleiro: “O que você está fazendo?” Diz ele então, com efeito: “Nada disso, que­ rida. Não vamos fazer isso. Servimos a um Deus que tem o direito de agir como quiser e não é obrigado a dar explicações ou pedir permis­ são. Pare e pense: devemos pensar que só recebemos coisas boas? E esse o tipo de Deus que servimos? Ele não é um servo celestial que espera pelo estalar de nossos dedos, é? Ele é o nosso Senhor e Deus! Precisamos lembrar que o Deus que servimos tem um plano além da nossa compreensão, apesar dos tempos difíceis como estes.”

Acho estupenda esta última frase: “Em tudo isto não pecou Jó com os seus lábios” (Jó 2:10). Vemos absoluta confiança aqui. E fé. “Querida, não podemos explicar nada disso, vamos então ficar à espera e ver Deus trabalhar. Nunca poderíamos imaginar o que aconteceu. Nossos corações estão partidos com essa perda. Perde­ mos tudo. Bem - não tudo. Ainda temos um ao outro. Nosso Deus tem um plano que está se desenrolando, embora não o possamos compreender neste momento.”

UMA CONCLUSÃO ADEQUADA

Comecei este capítulo referindo-me a um adolescente chamado Johnny Gunther; eu o encerro referindo-me a você. Quero oferecerlhe três princípios eternos encontrados na experiência de Jó até este ponto, juntamente com um pequeno conselho que pode ser útil a você. Se não for agora, pelo menos em breve.

Primeiro, uma vez que nossas vidas estão cheias de provações, pre­ cisamos nos lembrar de que virão sempre outras. Jó admite mais tarde: “Mas o homem nasce para o enfado, como as faíscas das brasas voam para cima” (Jó 5:7). Ele tem toda a razão. As provações são inevitáveis; portanto, não se surpreenda. Fique atento porque o Adversário está à solta. Tome cuidado onde estiver, lugar algum é

58 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

imune. Quem sabe o que vai acontecer em seguida? Pedro escreveu em 1 Pedro 4:12: “Amados, não estranheis o fogo ardente que surge no meio de vós, destinado a provar-vos, como se alguma coisa extra­ ordinária vos estivesse acontecendo.” Não pense que as provações são estranhas. Elas são a regra e não a exceção.

Segundo, uma vez que nosso mundo édecaído, precisamos compreen­ der que aqueles que nos amam podem nos dar conselhos errados. Durante toda a minha vida recebi, em várias ocasiões, conselhos errados por parte de pessoas que me amam. Eram sinceras, mas estavam erradas. Não tinham intenção de estar erradas, mas estavam. Este o meu con­ selho: Não se deixe enganar. Só porque ele é seu marido e avisa você sobre alguma coisa, isso não significa que o conselho seja certo e sábio. Só porque ele ou ela é seu parceiro num negócio e está aconse­ lhando você, isso não indica que seu conselho seja acertado. Compare o que ouve com os princípios da Palavra de Deus. Esta é o nosso padrão e nosso guia infalível. Com grande tato, Jó teve de dizer: “Você fala como uma mulher insensata, querida. Amo você, mas não posso fazer isso.”

Terceiro, uma vez que o nosso Deus é soberano, devemos nos preparar para receber bênçãos e adversidade. Por ser Deus, ele é imprevisível. Meu conselho? Não fique desiludido. Pelo fato de nosso Deus ser soberano, devemos nos preparar para as bênçãos e a adversidade. Inclua as duas últimas palavras.

Em minha pesquisa para este livro, encontrei os escritos do Dr. Frances I. Andersen, médico e arqueólogo, erudito bíblico e escritor australiano. Ao ler seus comentários sobre este segmento da história de Jó, suas palavras como que saltaram da página e ficaram à minha frente. Elas merecem atenção especial.

Jó não vê nada errado com o que lhe aconteceu (...) E igualmente certo para Deus conceder dons e os remover (primeiro round)-, é igualmente certo para Deus enviar o bem ou o mal (segundo round). Receber é um termo ativo, implicando colaboração com a Providência e não simples

SATANÁS VS. JÓ - SEGUNDO ROUND 59

submissão. Essa fé positiva é a pedra mágica que transforma tudo em ouro; pois, quando o mal e o bem são recebidos das mãos de Deus, toda experiência de vida se torna uma ocasião de bênção. O custo é, porém, alto. Fica mais fácil baixar a sua opinião de Deus do que levantar sua fé a tal altura.4

Alguns teólogos fizeram isto nos últimos anos. Sua teoria é chama­ da de Teísmo Aberto. Em resumo, esta é a soma e a substância desta teoria: porque coisas más acontecem a pessoas boas, então Deus, por ser bom, não sabia que elas iam acontecer, e, portanto, nunca teria permitido que ocorressem. Ele não causaria tal coisa. Desse modo, dependendo de como reagirmos, Deus determina o que fará em seguida.

Quero esclarecer aqui: isso é heresia. A onisciência não aprende. A onisciência não descobre. Você nunca vai ouvir estas palavras no salão do trono de Deus: “Puxa! Eu não sabia disso! Pode imaginar tal coisa, Gabriel? Veja!” Absolutamente não. O salmista deixou bem claro: “No céu está o nosso Deus e tudo faz como lhe agrada” (SI 115:3).

Nosso Deus não tem obrigação de se explicar. Não tem obriga­ ção de entrar num quarto de hospital e dizer: “Vou lhe mostrar agora cinco razões por que isso aconteceu com seu filho.” Compreenda, o nosso Deus é plenamente compassivo, mas o seu plano está além da nossa compreensão.

“Porque os meus pensamentos não são os vossos pensamen­ tos, nem os vossos caminhos, os meus caminhos, diz o S en h o r, porque, assim como os céus são mais altos do que a terra, assim são os meus caminhos mais altos do que os vossos caminhos, e os meus pensamentos, mais altos do que os vossos pensamentos” (Is 55:8, 9).

Dizemos então com Jó: “Ó Deus, confio em ti. Não sei por que estou passando por tudo isto. Se há algo que posso aprender, ótimo. Se há algo que outra pessoa possa aprender, excelente.

60 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Ajuda-me apenas através desta dificuldade. Abraça-me apertado. Aprofunda-me. Muda-me.”

Jó perguntou: “Temos recebido o bem de Deus e não recebería­ mos também o mal?” Porque ele sabia que Deus é Deus, algum dia ele irá esclarecer. Esta é uma das razões pelas quais creio que o céu vai ser um lugar prazeroso. Quando entrarmos na sua presença pela pri­ meira vez, ganharemos uma visão panorâmica e então (e só então) responderemos: “Ah! A razão foi essa! Entendo agora!”

“E mais fácil baixar a sua opinião de Deus do que elevar a sua fé a tal altura”, apontou um escritor perceptivo. Ele acrescenta em seguida: “Vamos observar o conflito enquanto a fé possuída por Jó é provada pela tentação de ver a causa do seu infortúnio em algo menor do que Deus.” 5 Deus está total, completa e absolutamente no con­ trole. Se ele fizer desaparecer todos os membros da sua família, está no controle. Se faz seu negócio falir, está no controle. Se a radiografia volta e o resultado não podia ser pior, está no controle. Peço que você aceite e se submeta a esse ensinamento. Como é magnífico encontrar os que confiam nele até o fim deste vale de sofrimento, dizendo: “Que o seu nome seja louvado. Não compreendo. Não sei explicar. Mesmo assim, que o seu nome seja louvado!” Isso é adoração no mais alto nível.

Possa Deus capacitar-nos a alçar a nossa fé a tais alturas em vez de baixar nossa visão dele.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando a dor física se soma à dor da alma, como você tem buscado a presença de Deus em meio ao desgaste do próprio corpo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Jó foi ferido da planta do pé ao alto da cabeça; que tipo de sofrimento prolongado tem testado a sua fé hoje?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significa permanecer fiel ao Senhor mesmo quando o sofrimento se intensifica em vez de aliviar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Conselho de Jó aos Maridos e Amigos$t$, 7,
$conteudo$xaminar a vida de Jó é quase como entrar num crisol. Pense um pouco na palavra crisol. No núcleo dela está o termo latino crux, que significa “cruz”, usado como um sinónimo de tortura. Ainda usamos a palavra nesse sentido, como quando nos referimos a “uma cruz que temos de carregar”. O termo excruciante tem uma seme­ lhança equivalente. No caso de Jó, seu crisol significaria seu poço de agonia. O dicionário da língua inglesa Webster define crisol como “um teste severo; um lugar ou situação em que forças concentradas interagem para causar mudança ou avanço”. Estude essa definição antes de continuar. Volte e leia outra vez, mais devagar.

E

O crisol de Jó foi provocado por dois ataques severos de Satanás, ambos permitidos por Deus. Primeiro round—e.le foi atacado na área de seus bens e de sua família. Seus meios de ganhar o sustento e manter um estilo de vida confortável foram subitamente removidos.

O segundo round aconteceu logo depois do primeiro, antes que o pai desolado pudesse recuperar o fôlego. Satanás estava decidido a ouvir Jó amaldiçoar a Deus; atacou-o então na última área restante -

62 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

sua saúde. Ele não só a tirou, cobrindo-o de tumores malignos da cabeça aos pés, os quais supuraram, racharam e escureceram sua pele, como também a terrível doença causou uma coceira enlouquecedora, febre alta e inchaço tão grande que Jó ficou quase irreconhecível. A sua desgraça é praticamente inacreditável.

Alexander Whyte, sacerdote escocês do século XIX, expressou tudo muito bem em poucas palavras: “Até avinda de Cristo, alma alguma se tornou um campo de batalha entre o céu e o inferno como a alma de Jó.”' O crisol de Jó foi um campo de batalha. Não nos esqueçamos, nós sabemos o que Jó não sabia. Sabemos por que aconteceu e como aconteceu. Ele não tinha esse conheci­ mento. Tudo que sabia é que um dia fora um modelo de saúde e força, um homem próspero e íntegro, com uma aljava cheia de filhos e relacionamentos agradáveis e sadios com seu círculo de amigos e empregados, vindo a perder tudo em uma questão de horas. Em vez de reagir em pânico e ira, o homem perseverou heroicamente. De fato, desde sua época, Jó não veio a ser conhe­ cido como um modelo de sofrimento, mas de perseverança.

Quero lembrar você do que foi escrito sobre ele em meados do século I: “Tendes ouvido da paciência de Jó” (Tg 5:11). Jó suportou o crisol; ele não lutou nem tentou fugir dele. As únicas coisas que lhe restaram depois de a poeira assentar foi uma esposa e um pequeno círculo de amigos de quem não recebeu apoio algum. Nenhum encorajamento, consolo, nem palavras de terna compaixão. Nenhum abraço afetuoso. Eles apenas acrescentaram peso ao seu já pesado fardo. Mesmo assim, Jó perseverou.

Um professor de História disse certa vez: “Se Colombo tivesse voltado, ninguém o culparia, mas também ninguém se lembraria dele.”2 A única razão pela qual nos lembramos de Jó com admiração é porque ele perseverou.

Ele não só suportou as aflições que descrevi, como também suportou as palavras de uma esposa sofrida e com pouca visão. Como veremos, suportou igualmente as acusações dos amigos que se arvoraram em juiz e júri. Se você passou pelo seu próprio crisol,

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 63

é bem provável que saiba o que significa suportar a hostilidade das pessoas em meio à sua dor. Como isso nos faz sofrer! Mas, voltando à definição, é então que o crisol causa mudança e desenvolvimento. O resultado de suportar a dor é que passamos de simples sofredores a conselheiros sábios e consoladores valiosos.

Eu estava andando pelos corredores do escritório de nossa igreja recentemente e passei pela sala de meu filho Chuck. Ele trabalha como engenheiro-chefe de audio na Stonebriar Community Church. Como já pode adivinhar, sua mesa estava lotada com especificações, catálogos, material técnico, CDs e vários equipamentos. Não pude deixar de ver um pedaço de papel que ele havia pregado na parede acima de sua mesa. Era uma citação que extraíra do livro de John Eldredge, Wild at Heart, onde se lia: “Não confio num homem que não sofreu...3

Olhando para aquela declaração, compreendi que os conselhos mais preciosos que recebi em minha vida não vieram de novatos, mas daqueles que levavam as cicatrizes do crisol. “Da mesma forma que os diamantes são feitos por meio de pressão e as pérolas formadas pela irritação, a grandeza é forjada pela adversidade.” 4 Os conselhos sóli­ dos são dados por veteranos da dor.

Uma vez que isso é verdade, está na hora de recebermos alguns conselhos de Jó. Mais tarde exam inarem os os conselhos e advertências que outros lhe deram, mas penso que é preciso con­ siderar primeiro qual seria o conselho dele para nós. Um homem que suporta tamanha angústia tem certamente coisas úteis a nos dizer. Nenhuma delas diretamente, é verdade, mas todas extraídas indiretamente, por inferência, dos últimos versículos do segundo capítulo de Jó.

Em meu capítulo anterior, sugeri alguns conselhos para as es­ posas. Permitam-me alguns momentos de repetição, apenas para avivar sua memória.

64 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

CONSELHOS ÀS ESPOSAS

Primeiro, tenha sempre cuidado com suas palavras quando seu marido estiver passando por uma crise. Este bom conselho não é só para as mulheres casadas; é também para as solteiras que convivem com homens e, talvez, trabalhem com eles. Os homens podem tornar-se vulneráveis e, de fato, ingénuos durante períodos difíceis. Seria lamentável se você pronunciasse irrefletidamente palavras que não fossem sábias. A mulher de Jó fez exatamente isso. O bom é que Jó não concordou com o conselho dela.

Segundo, nunca sugira que devemos comprometer a nossa integridade. Nunca, embora isso pudesse produzir alívio imediato ou gratificação temporária. A integridade já é uma virtude difícil de ser sustentada mesmo sem a tentação de comprometê-la. Me­ çam as suas palavras, senhoras. Estou dirigindo isto às mulheres porque suas palavras -acreditem - significam mais do que deixa­ mos transparecer. Na maioria das vezes, as palavras das mulheres são mais sábias do que lhes damos crédito, o que é de lamentar. Quando então falarem, nunca sugiram soluções que enfraqueçam a nossa integridade. Lembrem-se, senhoras, de que não há nada mais importante (a não ser um relacionamento com Cristo) do que a nossa integridade moral e ética.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Pensando no "crisol" de Jó como um lugar de teste severo que produz mudança, que transformação Deus tem operado em você através da dor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como marido, esposa ou amigo, de que forma você tem cuidado de alguém que está passando pelo próprio poço de agonia?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que a fidelidade de Jó no sofrimento ensina você sobre acompanhar quem ama sem tentar apressar a obra de Deus nele?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Conselhos aos Maridos$t$, 8,
$conteudo$Quero escrever agora algumas palavras práticas a vocês que são maridos. Graças ao exemplo de Jó, aqui estão quatro conselhos que faríamos bem em seguir.

Primeiro, ouça com atenção e sempre diga a verdade à sua esposa. Fico impressionado porque Jó ouviu as palavras da mulher. Refletiu sobre elas, considerou-as. Elas ficaram girando em sua mente. Ele não entendeu mal o que ela dissera, nem a ignorou. Ouviu-a e não a interrompeu. Isso coloca Jó numa categoria ímpar entre os maridos, para falar francamente.

Homens, descobri que a maioria de nós não é surda, mas temos dificuldade em escutar. Nossas mulheres geralmente têm a dizer as

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 65

coisas mais importantes que vamos ouvir naquele dia; mas, geral­ mente por alguma estranha razão, formamos o hábito de rejeitar mentalmente o conselho delas.

Dizemos a nós mesmos: “Já ouvi isso antes; sei o que ela vai falar.” Espere um pouco! Jó e sua esposa tiveram provavelmente algu­ mas discussões; o casamento é assim, não é? Em minha opinião eles tinham um casamento razoavelmente bom. Isso é o melhor que qual­ quer casal pode esperar. Nas crises do casamento, as mulheres têm o cerne da verdade que precisamos ouvir. Iremos porém perdê-lo se não tivermos cuidado. Se agirmos de maneira impaciente como de hábito, não prestaremos atenção. (Vai parecer que estamos escutan­ do, mas na verdade não estamos.)

Quero acrescentar aqui: quando respondemos, devemos sempre dizer a ela a verdade. Isto significa que, se o que ela disser for sensato e corresponder ao que você sabe que é verdadeiro - se for útil diga isso e agradeça à sua mulher. Se não for, diga isso também. Jó discor­ dou e expressou sua opinião. Sua resposta depois de ouvi-la foi: “Falas como qualquer doida.”

Um escritor analisou a cena:

Ela vê a morte como o único bem restante para Jó. Ele deveria orar a Deus (lit. “abençoar”) pedindo para morrer, ou mesmo amaldiçoar a Deus a fim de morrer, um meio indireto de cometer suicídio.

O que quer que houvesse por trás das palavras da esposa, Jó rejeita com fúria. Ele porém não a chama de má, sim­ plesmente de doida; isto é, diz que faltou-lhe discerni­ mento. Ela acha que Deus tratou mal a Jó e merece ser amaldiçoado. Jó não acha nada de errado com o que lhe aconteceu. Neste ponto, a provação de Jó entra numa nova fase, a mais difícil de todas. Em vez de ajudar, as palavras da mulher e dos amigos lhe causam mais sofrimento e o pressionam mais do que todas as outras coisas que ocorre­ ram com ele até este ponto.5

66 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jó percebeu na esposa uma dose de amargura, de decepção, e então disse com firmeza a ela: “Não vou aceitar seu conselho, nem pô-lo em prática. O que você sugeriu não é sábio. E um conselho errado, e me recuso a aceitá-lo.”

Nas quatro décadas em que venho trabalhando com casais, des­ cobri que uma das coisas mais difíceis para eles é dizer a verdade um para o outro. Admita o erro, em vez de rodeá-lo ou racionalizá-lo, diga apenas: “Eu estava errado”. Ou se ouvirmos nossa mulher dizer algo que sabemos não ser sábio ou percebermos alguma motivação questionável, nossa tendência é atenuar as coisas. Seria muito melhor responder: “Sabe, querida, compreendo que você quer o meu bem, mas tenho de dizer com toda sinceridade que não concordo com isso. Penso que é insensato de sua parte sugerir tal coisa.” No final das contas, seu casamento será mais saudável se você permitir que a ver­ dade prevaleça. Especialmente se a verdade for falada em amor. Ouça com atenção e sempre diga a verdade.

Segundo, ensine a ela o que você aprendeu sobre Deus. Jó fez exatamente isso. Note como agiu: fez uma pergunta. “Temos recebido o bem de Deus e não receberíamos também o mal?” Como mencionei no capítulo anterior, a declaração dele continha excelente teologia! Jó aprendera isto sobre o seu Senhor durante os anos em que andara com ele. Portanto, explica: “Você e eu temos de entender que o nosso Deus não é um Deus que só provê saúde e riqueza. Ele é o nosso Mestre soberano, Senhor de tudo que ocorre em nossos lares e nossas vidas, inclusive o que estou passando agora. Nossa perda e a minha condição não são surpresa para Deus. Esta é a vontade dele para nós; ele está fazendo a sua vontade em tudo isto. Por alguma razão não revelada, ele permitiu esses acontecimentos, e precisamos lembrar, embora não possamos explicar, que ele continua soberano em todas essas ocorrências.” Jó usou as circunstâncias deles para ensinar à es­ posa sobre Deus.

Ainda não encontrei uma mulher piedosa que me dissesse: “Não estou realmente interessada no que meu marido tem a dizer sobre coisas espirituais.” As mulheres piedosas são ensináveis. Elas dizem,

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 67

sem hesitação: “Prefiro ouvir a verdade de meu marido a ouvi-la de qualquer outra pessoa que conheço.” As circunstâncias difíceis, por mais penosas que sejam, oferecem grandes oportunidades para ins­ trução na justiça. Aflição, dificuldades e doença podem unir os casais - de fato, toda a família. Quando o Senhor nos ensina coisas a respeito de si mesmo durante o crisol, vamos ser fiéis e transmiti-las a nossos cônjuges, assim como a nossos filhos.

Considere a situação de Jó. Vemos um homem coberto de feridas, em tal angústia que mal pode dormir. Todavia, ele está comunicando esta verdade espiritual sobre a vontade do Pai que a esposa devia ouvir e aprender. Se ele pôde fazer isso, nós também podemos. Vamos tomar tempo para compartilhar com ela algumas coisas que estamos aprendendo no crisol. Façamos, porém, isso com gentileza e graça. Como Jó, que simplesmente perguntou: “Temos recebido o bem de Deus e não receberíamos também o mal?” Palavras amáveis, gracio­ sas, são sempre as preferidas.

Terceiro, dê exemplo de pureza verbal. “Em tudo isto não pecou Jó com os seus lábios.” Por termos vivido com nossas esposas durante anos e nos sentirmos extremamente à vontade perto delas, tendemos a não cuidar de nossas palavras. As esposas no geral suportam o peso das nossas piores palavras. Já que isto é verdade, vamos concordar hoje que evitaremos a impureza verbal. Jó não fez uma declaração-blasfema. Não amaldiçoou a Deus. Além disso, não amal­ diçoou a mulher. Como já disse antes, Jó não a chamou de “má”, mas de “doida”.

Tenha cuidado com o que diz à sua mulher, meu amigo. Ame-a, não a repreenda. Se tiver de discordar, faça isso com ternura. Lem­ bro-me de um pastor na porta da igreja, quando a esposa perguntou simplesmente: “Vamos almoçar no restaurante ou você quer comer em casa?” O homem voltou-se e a reprovou publicamente! Falou o que não deveria ter falado! De maneira surpreendente, ela não reagiu, mas senti pena dela. Enquanto vários de nós testemunhamos os comentários embaraçosos e inadequados feitos pelo conhecido pre­ gador, todos nos sentimos desconfortáveis. Aprendi muito naquele

68 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

dia. Jó pode ter sido uma figura pública, mas não ficou ostentando a sua posição. Não faz diferença quão importante ou conhecido você é, ou há quanto tempo está casado, ou quanto ganha, ou como a sua empresa ou a sua igreja são grandes; homem algum tem o direito de falar com aspereza à esposa. Ela é sua parceira - sua igual. Além do mais, ela sabe muito sobre você. Algum dia, ela talvez escreva a sua há muito esperada e não-autorizada biografia!

Quarto, aceite-a completamente; ame-a incondicionalmente. A mulher viceja num contexto de amor e aceitação. Ela é quem é. Deus a fez a mulher em que se tornou. Quero também lembrá-lo de que ela é a esposa que você escolheu. Deus a fez assim, e isso exige aceitação completa e amor incondicional da sua parte. Idealmente, essa combinação resulta num compromisso profundo. Vocês dois estão nesse relacionamento para sempre. Quaisquer que sejam as dificuldades, testes, ou provações, isso não vai separá-los. De fato, é possível até que os aproximem mais. É trágico, mas muitos casamentos são ligados por fios muito ténues e frágeis. A medida que surgem os testes — por parte dos sogros ou dos filhos, talvez uma dificuldade no nascimento que resulte em defeitos num filho, ou provações e testes nos negócios ou na área das finanças... seja o que for — deliberadamente junte forças e decida resistir. Diga-lhe quanto ela significa para você. Fale a ela sobre o seu valor na sua vida — quanto ela representa para você. Quando o crisol esquenta, muitos sujeitos procuram meios de escapar.

Acho que precisamos de uma pequena pausa aqui. Falei muito seriamente e agora quero divertir-me um pouco com você. Tenho um amigo íntimo que me enviou uma história engraçada sobre um casal que estava junto há muito tempo. A mulher acorda no meio da noite e descobre que o marido saiu da cama. Ela fica preocupada com ele e, colocando o roupão e os chinelos, desce as escadas para procurá-lo. O homem está sentado sozinho à mesa da cozinha com uma xícara de café quente. Ele está olhando para a parede e piscando através das lágrimas. Ela pergunta: “O que aconteceu, querido?” Ele balança a cabeça, mas não responde. Ela pergunta, então: “Por que você está

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 69

aqui a esta hora da noite? O que aconteceu?” Ele olha para a esposa por cima da xícara de café e depois diz: “Você se lembra de vinte anos atrás quando estávamos namorando e você tinha só dezesseis anos?” Ela responde: “Lembro, é claro que lembro.” Ele faz uma pausa. As palavras não saem com facilidade. “Você se lembra de quando estáva­ mos no carro nos beijando e seu pai ficou tão zangado que foi até nós, colocou um revólver no meu rosto e disse: ‘Qualquer garoto que bei­ je minha filha desse modo tem de casar com ela! Ou você se casa com ela, ou vou mandá-lo para a prisão pelos próximos vinte anos!’ Lembrase disso?” Ela responde: “Sim, eu lembro.” Ele enxuga outra lágrima e diz: “Acabei de lembrar que eu teria saído hoje da prisão. ” Isso que é um mau marido!6

Basta agora de frivolidade. Está na hora de voltar ao crisol.

OS TRÊS AMIGOS ORIGINAIS

Não demorou muito depois desta calamidade para que as notícias sobre Jó chegassem ao conhecimento da maioria de seus amigos. O homem tinha muitos amigos, não só aqueles que foram vê-lo naquele dia. Todos souberam que Jó tivera problemas, problemas trágicos. Só alguns, porém, decidiram viajar para estar com ele. Não sabemos quase nada sobre esses homens. Não sabemos ao certo onde mora­ vam originalmente. São simplesmente chamados de “os três amigos de Jó”.

“Ouvindo, pois, três amigos de Jó todo este mal que lhe sobre­ viera, chegaram, cada um do seu lugar” (Jó 2:11). A narrativa bíblica dá o nome deles: ElifaZ, Bildade e Zofar.

Só para informar você de antemão, bem depois no relato bíblico (capítulo 32) vamos encontrar um quarto amigo - mais moço do que esses três. Seu nome é Eliú. Quando Eliú entra na história, ele diz que é mais moço e admite ser tímido. Fica então nas sombras por algum tempo. Três ciclos de diálogos ocorrem entre Jó e esses três amigos originais, enquanto Eliú se mantém em silêncio. Os três primeiros não são nada quietos, enquanto descarregam uma porção de críticas, culpa, vergonha e acusações sobre seu amigo.

70 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Vamos ouvi-los em breve, mas não Eliú. Ele aguarda pacientemente que eles dêem sua opinião antes de falar.

Os três amigos mais velhos estavam mais próximos da idade de Jó. Eram provavelmente xeques ricos que tinham tempo e dinheiro para deixar suas casas e seus afazeres a fim de visitar Jó. E possível que tivessem encontrado Jó no mundo dos negócios. Talvez fizessem parte do empreendimento que fora de Jó em épocas melhores. Não sabe­ mos como fizeram amizade, isto não é contado. O ponto é que cada um surgiu de um lugar diferente para passar tempo no crisol com seu amigo.

A história se desenrola: “Combinaram ir juntamente condoer-se dele e consolá-lo” (Jó 2:11). Repito que você deve prestar sempre atenção nos verbos quando estiver lendo as Escrituras. Esses termos de ação unem o movimento da história. Tenha isso em mente. Será fácil de esquecer.

Antes de este livro terminar, uma porção de coisas pouco atraen­ tes e desagradáveis vai ser dita por esses amigos. Na verdade, quanto mais tempo ficavam, mais as coisas pioravam. O diálogo ficou mais argumentative, mais crítico e mais intenso.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você tem o hábito de ouvir de verdade as pessoas que ama, ou costuma rejeitar o conselho delas antes mesmo de terminarem de falar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$No meio das crises da família, que palavra de verdade Deus pode estar querendo lhe dizer pela boca de quem está ao seu lado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o exemplo de Jó, que ouviu a esposa sem desprezá-la, desafia a maneira como você se relaciona em casa durante o sofrimento?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Aviso aos Amigos$t$, 9,
$conteudo$Antes de entrar nessas considerações, esses homens deveriam ser elogiados por terem ido ver Jó. Enquanto todos os outros amigos e conhecidos de Jó apenas ouviram as notícias e ficaram onde estavam, esses pelo menos compareceram. Um ponto para eles! Sua presença e o motivo que os levou nos dão uma oportunidade especial para avaliar a verdadeira amizade. Nós consideramos há pouco o conselho de Jó aos maridos. Esta é uma boa ocasião para enfocar algumas caracterís­ ticas dos amigos verdadeiros.

Primeiro, os amigos se interessam o bastante para aparecer sem que peçamos. Ninguém enviou uma mensagem a Elifaz, Bildade e Zofar: “Por favor, venham e tragam um pouco de simpatia e consolo para Jó. Ele está morrendo neste crisol de angústia e sofrimento.” Isso não foi

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 71

necessário, porque os amigos sinceros aparecem quando alguém que amam está realmente sofrendo. Os amigos não precisam de um convite oficial. Eles comparecem espontaneamente.

Lembra-se da história de Lázaro no Novo Testamento quando ele ficou muito doente? Suas irmãs, Marta e Maria, avisaram Jesus sobre isso. “Aquele a quem amas está doente.” Foi tudo o que disseram. Não pediram que fosse vê-lo. E quando ele não apare­ ceu (o que é outra história), elas se ofenderam. Você não pede a um amigo. Se um amigo seu tem um infarto e você fica sabendo que ele está num hospital do outro lado da cidade, você não de­ mora muito para ir até lá. Você não espera por um convite. Como também ninguém é convidado para um funeral. Comparecemos para prestar nossa última homenagem. Vamos por nossa própria iniciativa, por um sentimento de respeito. Da mesma forma, aque­ les homens se interessavam e amavam Jó, por isso planejaram ficar ao lado dele.

Segundo, os amigos mostram simpatia e consolo. Simpatia inclui identificação com quem sofre. Os amigos fazem isso. Eles entram no crisol, com o propósito de participar da angústia e sentir pessoal­ mente a dor. Consolar é a tentativa de atenuar o sofrimento, a fim de aliviá-lo. Você pode ajudar fazendo coisas que a pessoa precisa: cui­ dando das crianças, preparando uma refeição, prestando ajuda onde é necessário porque deseja consolá-la.

John Hartley escreve com discernimento:

Ao saber da aflição de Jó, três amigos chegados (...) Elifaz, Bildade e Zofar, combinaram viajar para Uz a fim de consolar Jó. O termo para amigos tem vários significados, inclusive o de conselheiro pessoal (...) amigo íntimo (...) uma das partes numa disputa legal. Os amigos geralmente celebravam o seu relacionamento com uma aliança, prometendo cuidar um do outro em todo tipo de circunstância. O relacio­ namento entre Jó e seus três amigos dá evidências de ter sido baseado numa aliança (...) Tal relacionamento era ca­ racterizado por afeto fiel (...) Motivados pelo amor e por

72 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

seu compromisso, a intenção desses homens era consolar e confortar Jó. A palavra para consolar (...) significa literalmente “sacudir a cabeça ou balançar o corpo para trás e para dian­ te” como um sinal de tristeza compartilhada. Confortar (...) é esforçar-se para dar alívio à dor profunda causada por uma tragédia ou morte (...) Com as mais nobres intenções, esses três desejavam sinceramente ajudar Jó a suportar seu sofrimento.7

Não é interessante? Enquanto estava na escola, você talvez tivesse um pacto verbal com um pequeno grupo de amigos. Ficaram tão íntimos que disseram uns aos outros: “Não importa o que aconteça, onde quer que estejamos no futuro, queremos que cada um saiba que estamos prontos para nos ajudar mutuamente, especialmente nas ocasiões de necessidade.”

É bem provável que tenha sido assim com Jó e esses homens. Eles nunca fizeram um acordo escrito e assinaram na linha pontilha­ da, mas a palavra empenhada deles era válida. Os três tinham esse tipo de intimidade com Jó, e, portanto, foi natural para eles oferecer simpatia e conforto ao amigo.

Terceiro, os amigos expressam abertamente a profundidade dos seus sentimentos. Os amigos têm meios de fazer isso, certo? Não é raro ver um amigo ao lado de um leito de hospital, lutando com as lágrimas. Não é incomum que o amigo expresse sentimentos profundos. Os conhecidos casuais geralmente não fazem isso; os amigos genuínos deixam transparecer suas emoções.

Para falar a verdade, os homens ficaram inicialmente chocados quando viram Jó. Nem sequer o reconheceram! Eles devem ter ido primeiro à sua casa, onde já haviam estado antes. O lugar não parecia mais o mesmo. Tudo ao seu redor fora destruído. Nada se mexia. O silêncio era fantasmagórico; tudo que viram foram as lápides na encosta do morro. Alguém que encontraram disse: “Jó? Ele foi embora há algum tempo. Penso que está morando no depósito de lixo da cidade.” Outro choque.

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 73

Quando chegaram, mesmo depois de terem se aproximado, puderam perceber imediatamente a diferença. O amigo perdera os cabelos, seu manto estava rasgado, e ele se achava sentado ali, com o esterco queimando nas proximidades, um bando de cães selvagens não muito distante, lixo apodrecido em toda parte. Eles ficaram olhando incrédulos. Foi então que os seus sentimentos se manifesta­ ram. “Cada um, rasgando o seu manto, lançava pó ao ar sobre a cabeça [uma expressão antiga de tristeza]” (Jó 2:12). Isto supõe que eles estivessem perto do pó. A narrativa declara: “Sentaram-se com ele na terra” (v. 13). E isso que os amigos fazem. Eles não se impor­ tam em sujar-se ou ficar desarrumados.

Isto nos leva ao meu quarto princípio. Os amigos não se afastam diante de espetáculos desagradáveis. Pelo contrário, se aproximam ao máximo. Os amigos não se ofendem porque o quarto cheira mal. Os amigos não se afastam porque a pessoa que foram ver está re­ duzida a uma sombra de seu antigo eu, pesando metade do que costumava pesar.

Os amigos enxergam para além de tudo isso. Eles não vão embora porque a sua vida está destruída e você chegou ao fim das suas forças. Pelo contrário, isso os atrai. Aqueles homens elevaram literalmente as vozes e soluçaram enquanto sentavam no chão ao lado de Jó. Eles demonstraram a profundidade da sua angústia, ficando sete dias e sete noites sem dizer qualquer palavra.

Quinto, os amigos compreendem e, portanto, dizem muito pouco. Gosto da maneira como Warren Wiersbe escreve a esse respeito:

A melhor maneira de ajudar as pessoas que estão sofrendo é ficar ao lado delas dizendo pouco ou nada, e deixando que saibam que você se importa. Não tente explicar tudo; as explicações jamais curam um coração partido. Se os amigos o tivessem escutado, aceitado seus sentimentos e não discutido com ele, teriam servido de grande ajuda; mas preferiram ser promotores da acusação em lugar de testemunhas.8

74 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Os amigos de Jó ficaram porque tinham toda razão para per­ manecer junto dele. O tipo de angústia que aquele homem estava suportando poderia matá-lo a qualquer momento, era o que lhes pa­ recia. Permaneceram então ao seu lado em silêncio. O que aconteceu depois daqueles sete dias é que estragou tudo. Quanto mais ficavam junto dele, tanto mais as coisas pioravam.

No momento em que nos achamos em apuros de qualquer tipo — doentes no hospital, enlutados pela morte de um amigo, demiti­ dos do emprego ou rejeitados num relacionamento, deprimidos ou confusos —, as pessoas começam a nos dizer exatamente o que há de errado conosco e o que devemos fazer para melhorar. Os sofredores atraem conselheiros da mesma maneira que as mortes nas estradas atraem corvos. No princípio ficamos impressionados por se importa­ rem conosco e admirados com a facilidade de suas respostas. Sabem tanta coisa! Como conseguiram alcançar tamanha especialização nas questões da vida?

Nas mais das vezes essas pessoas usam a Palavra de Deus com frequência e inadequadamente. Mostram-se cheias de diagnósticos espirituais e prescrições. Tudo parece tão esperançoso. De repente, porém, começamos a refletir: “Por que será que, apesar de toda a sua aparente compaixão, nos sentimos pior depois de terem falado?”

O Livro de Jó não é só um testemunho da dignidade do sofri­ mento e da presença de Deus em nossa dor, mas é também nosso principal protesto bíblico contra a religião reduzida a explicações ou “respostas”. Muitas das respostas dos supostos amigos de Jó são tecni­ camente verdadeiras. Mas é a parte “técnica” que as prejudica. São respostas sem relacionamento pessoal, intelecto sem intimidade. As respostas são coladas na vida devastada de Jó como rótulos num frasco de espécimes. Jó se enraivece contra esta sabedoria secularizada que perdeu contato com as realidades vivas de Deus.9

O falecido (e posso acrescentar grande) Joe Bayly e sua espo­ sa, Mary Lou, perderam três de seus filhos. Perderam um deles após uma cirurgia quando tinha apenas dezoito dias. O segundo menino morreu de leucemia aos cinco anos. Perderam depois um

CONSELHO DE JÓ AOS MARIDOS E AMIGOS 75

terceiro filho num acidente de trenó, por causa de complicações devidas à sua hemofilia.

Joe escreve num livro magnífico, The View from a Hearse (A Vi­ são de um Carro Funerário), cujo título foi mais tarde mudado para The Last Thing We Talk About (A Ultima Coisa de Que Falamos):

Eu estava sentado ali, dilacerado pelo sofrimento. Alguém veio e falou comigo sobre os tratos de Deus, o motivo de tudo ter acontecido, a esperança além-túmulo. Falou muito tempo e disse coisas que eu sabia serem verdade.

Nada me comoveu, exceto meu desejo de que ele se fosse. E finalmente se despediu.

Um outro veio e sentou-se ao meu lado. Não pronunciou qualquer palavra. Não fez perguntas que exigissem determi­ nadas respostas. Apenas sentou-se comigo por uma hora ou mais, ouviu quando eu disse algo, respondeu brevemente, orou com simplicidade e partiu.

Fiquei comovido. Senti-me confortado. Detestei que se fosse.10

Os amigos agiram certo quando os que estão no crisol detestam que se vão. Devemos deixar Jó em sua miséria agora. Somos meros espec­ tadores. Se tivéssemos vivido em sua época, não haveria meios de dizer: “Sei como se sente.” Você não sabe. Eu não sei. Não podemos sequer imaginar. Mas nos importamos. Nossa presença e nossas lágrimas dizem muito mais do que nossas palavras.

As palavras soam ocas num crisol.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você é o tipo de amigo que aparece sem precisar de convite quando alguém que ama está atravessando o sofrimento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Os amigos de Jó começaram bem, apenas comparecendo; como você tem oferecido presença e silêncio antes de oferecer conselhos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que diferencia um amigo que consola de um que fere, e que tipo de amigo você tem sido para quem está em dor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Lamento Triste de um Homem Infeliz$t$, 10,
$conteudo$começo dos grandes homens ou mulheres que realizam gran­ des coisas é geralmente trágico. Quando fazemos um estudo em profundidade dessas vidas grandiosas, descobrimos, na maioria das vezes, que elas nasceram de ventres desafortunados.

O

Lembrei-me disso recentemente, quando Cynthia e eu fomos a um banquete patrocinado pelo Seminário Dallas. Para minha alegria inesperada, nosso excelente capelão, Bill Bryan, que faz parte da escola há muitos anos, nos contou sobre sua procedência. Não ficamos ape­ nas surpresos, mas também chocados. Quem quer que conheça Bill sabe que ele é um homem alegre, que gosta de se divertir. Além disso, é um exímio trompetista e gosta de cantar quando serve como “pastor” do campus. Sua personalidade é contagiosa. Ao ficar perto de Bill Bryan, você é encorajado pelo seu espírito alegre. Todos pensaríamos que a sua vida deveria ter sido fácil e divertida, relaxada e segura desde o início. O capelão Bill sempre chama nossa atenção para o lado brilhante das coisas. Sua taça parece estar sempre meio cheia, nunca meio vazia. Não foi, porém, assim que as coisas começaram para ele.

78 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Sua vida teve um início trágico. O seu pai sofreu de uma grave depressão durante muitos anos. A história de Bill se reporta à época em que a depressão do pai o levou através de um túnel emocional sombrio. Naqueles dias, qualquer tipo de problema emocional ou mental raramente saía do armário; quase ninguém sabia o que fazer com pessoas que sofriam desses males.

Bill contou que se lembrava de ter ido semana após semana com os pais a um prédio de consultórios médicos em Springfield, Missouri, onde tomavam o elevador para o sexto andar. Ele ficava sentado e esperava em companhia da mãe, enquanto o pai fazia sua consulta com o psiquiatra. Quando pequeno, Bill não entendia o que estava acontecendo. Só sabia que o pai não estava feliz — não tinha paz. Estava perturbado. Sua vida era desolada e vazia.

Em certa ocasião, Bill lembra que o pai saiu da sala e ficou com ele (que só tinha 4 anos na época), enquanto a mãe entrava no consultório do médico. Uma vez que a depressão do pai só piorava, estavam sendo feitos planos para interná-lo no que era então chamado de “asilo de loucos”. Infelizmente, era possível ouvir o que se falava através das paredes, e o pai ouviu a conversa sobre o seu caso. De fato, foi comentado que ele talvez nunca mais pudesse sair. “Lembro-me”, disse Bill, “que minha mãe saiu com os médicos (eram vários) e que meu pai me carregou no colo, deu-me um abraço apertado e disse: ‘Amo você, filho’. A seguir ele me pôs no chão, virou-se e saiu corren­ do, pulando da janela do sexto andar para a morte. Ouvi o barulho do vidro estilhaçado.” Um amigo da família encontrou o pequeno Bill andando sozinho pelo primeiro andar do prédio e cuidou dele até que o resto da família pudesse ser encontrado.

Essas foram as últimas lembranças que Bill teve do pai.

A partir de então, Bill foi principalmente cuidado pelos avós e uma tia, enquanto sua mãe tentava se recuperar da terrível tragé­ dia. Isto durou anos. Todos nós que conhecemos este alegre servo de Deus jamais teríamos esperado que um homem simpático e agra­ dável como o capelão Bill Bryan pudesse ter tido um começo tão triste e infeliz.1

O LAMENTO TRISTE DE UM HOMEM INFELIZ 79

Estou lendo agora um ótimo livro escrito por Benjamin e Roz Zander. Quando escreveu The Art of Possibility, Benjamin Zander era maestro da Filarmónica de Boston. Nesta obra intrigante, Zander conta a fascinante história por trás da agora famosa Nona Sinfonia de Mahler. Gustav Mahler viveu na última parte do século xix e início do xx. Mahler, de raízes boémias, tornou-se compositor, maestro e finalmente diretor da Opera Imperial de Viena durante dez anos — uma posição excelente e privilegiada, que exigia diversas habilidades. Não é de surpreender que esta sinfonia especial seja conhecida por conter quase tudo! Os que levam a música clássica a sério estudam a Nona de Mahler. Ela apresenta uma riqueza e profundidade de orquestração, harmonias, melodias e contrapontos que a tornam úni­ ca. Pensaríamos com certeza que o génio que escreveu tal orquestração teria tido uma vida mimada. Um treinamento assim deve ter sido maravilhoso.

Escreve Zander: “Porém, o fato é que a infância de Gustav Mahler foi marcada pela tragédia. Ele perdeu sete irmãos e irmãs enquanto crescia.” A seguir acrescenta: “O caixão tornou-se uma peça comum da mobília em sua casa.”

O pai de Mahler era um alcoólatra cruel e brutal. A mãe era uma inválida fraca e vulnerável que vivia à mercê dos golpes do marido. Mahler sobreviveu a esses anos funestos. Quando adulto, casou-se e teve uma filha adorável a quem amava profundamente e prodigalizava a ela toda a sua afeição. Ele perdeu a filha quando ela tinha quatro anos e nunca se recuperou do golpe. Além de tudo isso, por ser judeu, foi obrigado a demitir-se de seu cargo como diretor da Ópera de Viena. Pouco depois soube que seu coração estava fraco e não viveria muito tempo. De maneira notável, em meio a toda essa tristeza, sofrimento e desânimo, Gustav Mahler compôs a sua magnífica Nona Sinfonia.

Benjamin Zander termina assim a história: “Mahler não era triste o tempo todo. Amava muito a natureza e era um ótimo nadador (...) Tinha um riso contagiante e imenso amor pela vida, e tudo isto está também em sua música, assim como tristeza e ira por causa da sua

80 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

doença, da brutalidade do pai e da vulnerabilidade da mãe inválida. De fato, Mahler achava que devia colocar tudo da vida em suas sinfo­ nias.”2 Ele escreveu uma décima sinfonia que ficou inacabada. Em­ bora a vida de Mahler tenha terminado tristemente numa morte prematura, suas composições vivem para emocionar os corações dos amantes da música em todo o mundo.

É de admirar que o homem Jó tenha trazido conforto durante séculos para os esmagados pela dor? É de espantar que os que atraves­ sam períodos de depressão sombria e profunda se voltam finalmente para a história de Jó, o homem que dá novo significado à desventura? Quando você lê Jó, sente empatia imediata com a sua infelicidade, especialmente se já passou por situação semelhante. Ninguém, senão o coração dolorido, pode sentir tanta angústia.

Quero avisar você antecipadamente, no caso de não ter esperado por isso, que este não vai ser um capítulo agradável. Não é fácil de escre­ ver. Não conheço pessoa alguma que me tenha dito que seu capítulo favorito da Bíblia é Jó 3. Não conheço também qualquer indivíduo que tenha memorizado um versículo de Jó 3. Este é um daqueles capítulos na vida do homem que fazem você balançar a cabeça, suspirar e ir imediatamente para a próxima cena. E aqui que as cascas são tiradas das feridas, enquanto o pus escorre pela vida de Jó.

Se esta história fosse transformada em filme e você e sua família o alugassem para assistir esta noite, quando chegassem a esta parte da história iriam apertar o botão para acelerar a fita; não gostariam que seus filhos assistissem. Não é uma cena apenas não-editada; é crua e beira a heresia!

Parte da história é praticamente ofensiva. Você não gosta de pen­ sar que um homem tão bom quanto Jó nos dois primeiros capítulos é o mesmo que encontra no capítulo 3. Não quer acreditar. Por quê? Parcialmente porque temos esta idéia distorcida de que qualquer um que ande assim tão perto de Deus vive feliz para sempre. Afinal de contas, “Deus ama você e tem um plano maravilhoso para a sua vida”.

O LAMENTO TRISTE DE UM HOMEM INFELIZ 81

Certo? Se não soubesse melhor, você poderia ganhar asas depois de uma semana da sua conversão e começar a voar pela vida.

Precisamos compreender que o “plano maravilhoso de Deus” é realmente maravilhoso da perspectiva dele, e não da sua ou da minha. Para nós, “maravilhoso” significa confortável, saudável, todas as con­ tas pagas, nenhuma dívida, nenhuma doença, casamento feliz com dois filhos bem-comportados, um emprego satisfatório e bem pago, e a expectativa de nada além de bênçãos, sucesso e prosperidade para sempre. Isso é “maravilhoso” para nós, mas o plano maravilhoso de Deus não é assim. *—^

Jó nos leva de volta à realidade - à realidade de Deus. Você se lembra da pergunta que ele fez à esposa? “Temos recebido o bem de Deus e não receberíamos também o mal?” Você lembra tam­ bém da última frase? “Em tudo isto não pecou Jó com os seus lábios” (2:10).

O mesmo homem entra em breve numa estrutura de referência completamente nova. Esta a razão de Jó 3 nos tornar desconfortáveis. Não queremos que nosso herói pense ou fale desse jeito. Ele não parece mais um homem de Deus. Tem até a audácia de afirmar, no final: “Não tenho descanso, nem sossego, nçm repouso, e já me vem grande perturbação” (Jó 3:26). O que aconteceu? Temos um vislum­ bre de um lado sombrio da vida de Jó que é tão real quanto o das nossas vidas hoje, mas a diferença é que Jó escancara tudo. Ele, feliz­ mente, nos lembra que até o indivíduo piedoso pode ficar deprimido.

Um dos capítulos que prefiro em um de meus livros favoritos, Lectures to My Students, tem o título “As Crises de Fraqueza do Mi­ nistro”. O autor é Charles Haddon Spurgeon, um homem imensa­ mente talentoso e, ao mesmo tempo, penosamente verdadeiro. Nesse trecho, ele admite sofrer de fortes surtos de depressão. Spurgeon declara francamente que não é sempre vigoroso, sábio e preparado. De fato, afirma abertamente:

Antes de qualquer grande empreendimento, uma certa me­ dida da mesma depressão é bastante usual (...) Essa foi a

82 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

minha experiência quando me tornei pastor em Londres. Meu sucesso me espantou, e a idéia da carreira que parecia se abrir, em vez de me estimular, me atirou no abismo, nas profundezas do qual pronunciei meu miserere e não encontrei espaço para um gloria in excelsis. Quem era eu para guiar tão grande multidão? Voltaria à obscuridade de meu povoado, ou imigraria para a América do Norte e encontraria um ninho solitário no interior, onde seria suficiente para as coisas que fossem exigidas de mim (...) Esta depressão surge sem­ pre que o Senhor está preparando uma bênção maior para o meu ministério; a nuvem é escura antes de abrir-se e obs­ curece tudo antes de derramar seu dilúvio de misericórdia. A depressão tornou-se agora para mim como um profeta de vestes rudes.”3

Isso acontece também comigo. Talvez não seja uma crise tão profunda quanto as de alguns, mas já passei às vezes por túneis perturbadores de depressão. De modo interessante, exatamente quando outros talvez julgassem que eu estaria sufocando de orgu­ lho (justamente isto!), experimentei tais conflitos. Imaginei até se deveria continuar.

Nunca conheci, porém, o tipo de cova em que Jó caiu. Se ele estivesse no hospital hoje, um aviso de Visitas Proibidas teria sido colocado em sua porta.

Ele não pode, entretanto, correr e se esconder. Jó fica ali, pendu­ rado, para todos verem. Todos temos nossos momentos desespera­ dos. Períodos em que chegamos ao fim das nossas forças, quando as nuvens da destruição encobrem o sol da esperança. Nossa visão fica bloqueada e nossos sentimentos reais afloram. Mas, felizmente, não há ninguém para ouvir. No caso de Jó, os três amigos ficaram porém sentados e olhando, ouvindo cada palavra. Foi então que começaram a reunir seus pensamentos críticos, a fim de fazê-lo voltar ao caminho reto no momento em que tivessem uma brecha para falar; ou devo dizer pregar?

O LAMENTO TRISTE DE UM HOMEM INFELIZ 83

UMA ANÁLISE RÁPIDA E UM ESBOÇO

Permita que eu faça dois comentários técnicos nesta sessão do texto bíblico enquanto continuamos. Primeiro, neste ponto das Escrituras em hebraico, a poesia substitui a prosa. No prólogo, os capítulos 1 e 2 do Livro de Jó são escritos em prosa, como aparecem na sua Bíblia. Este estilo narrativo é comum. Um romance, por exemplo, é escrito em prosa. O mesmo se aplicaria a um artigo de revista ou a uma coluna de jornal. Mas, ao chegar ao terceiro capítulo de Jó no hebraico, você começa a ler poesia. Portanto, o estilo muda de narrativo para uma composição metrificada. Ele permanece assim até o sexto versículo do capítulo 42. A maior parte do livro bíblico contém poesia. Isto explica por que o Livro de Jó se encontra na categoria poética da Bíblia.

Você deve estar lembrado, de suas aulas de literatura, que a poesia contém geralmente muitas alegorias e imagens construídas com pa­ lavras, assim como a repetição de pensamentos similares. Isto ocorre quando o poeta revolve os pensamentos em sua mente e volta a eles de ângulos diferentes. Nenhum bom estudante de poesia tenta fazer com que todas os versos “andem de quatro”. Algumas coisas você deixa “ditas” e afirma, com um encolher de ombros: “E poesia”. Por causa do meu amor antigo pela poesia, memorizei versos de alguns de meus poemas favoritos. Quando os recito para mim mesmo, não sei realmente o sentido pleno do que o poeta queria dizer. Não tema admitir que, em certas ocasiões ao ler Jó, você está lendo poesia. Tome então a liberdade de dizer, quando encontra certas coisas que pare­ cem obscuras e difíceis de elucidar: “Não sei. Não tenho certeza do que ele tinha em mente.” (Você pode livrar-se do aperto, dizendo simplesmente: “E poesia”.)

Este é um segundo pensamento para lembrar: A explosão de Jó não é principalmente devida ao seu sofrimento físico. E mais emocio­ nal, incentivada pela sua perda de contato com Deus. Seu sofri­ mento, sua falência, suas feridas dolorosas não o forçam a dizer o que diz aqui em Jó 3. Sua dor desempenha evidentemente um papel nisso, mas essa não é a causa subjacente. Não é pela falta de dormir

84 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

à noite. Não se trata de vagueações noturnas devidas à sua inquieta­ ção. Jó se encontra no fundo de seu barril emocional por ter perdido seu melhor Amigo. Durante muitos anos, Deus parecia íntimo. En­ quanto o negócio cresceu, as caravanas de camelo se multiplicaram, grandes colheitas foram ceifadas e o lucro começou a entrar aos bor­ botões, abençoando a ele e sua família com enorme prosperidade, Jó e Deus permaneceram em comunicação. Andaram de mãos dadas, até aquele dia terrível em que tudo foi pelos ares. Como já vimos, ele perdeu tudo — todos os animais, sua casa, os dez filhos adultos e, finalmente, sua saúde. Isso foi medonho, mas não constituiu o moti­ vo para a sua depressão.

As trevas vieram quando os céus se tornaram de metal. Quando Deus não andou mais com ele na fresca da tarde. Quando Deus não falou mais com ele, nem o confortou com palavras como: “Meu filho, quero explicar o que está acontecendo. Satanás veio e me desafiou a fazer isto, afirmando que você iria amaldiçoar-me. Eu sabia que ele estava errado. Além disso, quero que saiba que estarei a seu lado o tempo todo.” Jó não tinha conhecimento de nada. Na verdade, não sabia o porquê, só o “o quê”. Ele está vivendo nas consequências daqueles acontecimentos horríveis. E, pior do que tudo, Deus está silencioso e parece ausente.

O homem chegou ao fim dos seus recursos. Você já esteve nessa dificuldade? Este é o dia em que você fecha a porta com estrondo. E o dia em que diz aos que lhe são íntimos: “Deixem-me em paz!” Esse é o dia na vida dele em que não consegue encontrar o seu Amigo!

Robert Alden escreve:

O terceiro capítulo de Jó deve ser um dos mais deprimentes da Bíblia. Embora alguns possam ficar tão deprimidos quan­ to Jó e usar esses versículos para desabafar seus sentimentos, poucos sermões são preparados com base neste capítulo, poucos dos seus versículos são reivindicados como promes­ sas, e bem poucos lembrados pelo calor dos seus sentimen­ tos. Este é o mais baixo de muitos pontos baixos no livro.4

O LAMENTO TRISTE DE UM HOMEM INFELIZ 85

PALAVRAS DE UM HOMEM ALQUEBRADO

• Jó lamenta seu nascimento (Jó 3:1-10).

• Jó deseja que tivesse morrido ao nascer (Jó 3:11-19).

• Jó quer agora morrer (Jó 3:20-26).

“Depois disso, passou Jó a falar e amaldiçoou o seu dia natalício” (Jó 3:1, itálicos do autor).

Em vista de ter lido pacientemente meus primeiros comentários, você não está tão chocado quanto o novato que tropeça subitamente nesta frase de abertura. Como é fácil pensar: “Ah! Está vendo? Sata­ nás disse que ele ia amaldiçoar a Deus e tinha razão.” Examine a questão com cuidado. Ele não está amaldiçoando a Deus, está amal­ diçoando o dia do seu nascimento. Há uma grande diferença entre as palavras “Por que nasci?” e “Não creio mais no Senhor, Deus”. Jó está dizendo: “Estou total e completamente só. Lamento ter um dia res­ pirado. Lamento ter sido concebido no ventre de minha mãe.”

Não vamos nos apressar. A primeira palavra nos obriga a uma pausa: “Depois disto”. Pare e faça um retrospecto. O homem está sentado no depósito de lixo da cidade, com a cabeça raspada, a mulher torcendo as mãos em agonia, os três amigos sentados e olhando em silêncio durante sete dias e sete noites, e nenhuma esperança do alto. Depois de tudo isso ele abriu a boca e disse: “Desejaria não ter nascido.” Não foi só isso que ele disse. Leia você:

Disse Jó: Pereça o dia em que nasci e a noite em que se disse: Foi concebido um homem! Converta-se aquele dia em tre­ vas; e Deus, lá de cima, não tenha cuidado dele, nem res­ plandeça sobre ele a luz. Reclamem-no as trevas e a sombra de morte; habitem sobre ele nuvens; espante-o tudo o que pode enegrecer o dia. Aquela noite, que dela se apoderem densas trevas; não se regozije ela entre os dias do ano, não entre na conta dos meses. Seja estéril aquela noite, e dela sejam banidos os sons de júbilo. Amaldiçoem-na aqueles

86 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

que sabem amaldiçoar o dia e sabem excitar o monstro marinho. Escureçam-se as estrelas do crepúsculo matuti­ no dessa noite; que ela espere a luz, e a luz não venha; que não veja as pálpebras dos olhos da alva, pois não fechou as portas do ventre de minha mãe, nem escondeu dos meus olhos o sofrimento.”

Jó 3:2-10, itálicos do autor

Encontramos nesse trecho alguns verbos chamados jussivos na sintaxe hebraica. Pense neles como “verbos que expressam desejo”. Eles re­ presentam o que Jó estava almejando - que isto possa acontecer, que aquilo possa acontecer, que isto possa ter lugar, que aquilo possa ter lugar, que essas coisas ocorram. Deixe que essas coisas ocorram. Ê poesia, lembra-se?

Versículo 3: “Pereça o dia.”

Versículo 4: “Converta-se aquele dia em trevas; e Deus, lá de cima, não tenha cuidado dele.”

Versículo 5: “Reclamem-no as trevas e a sombra de morte; habi­ tem sobre ele nuvens; espante-o tudo o que pode enegrecer o dia.”

Versículo 6: “Não se regozije ela entre os dias do ano; não entre na conta dos meses.” (Tire-o do calendário, esqueça a data do meu nascimento.)

Versículo 7: “Seja estéril aquela noite, e dela sejam banidos os sons de júbilo.”

Versículo 8: “Amaldiçoem-na aqueles que sabem amaldiçoar o dia.”

Versículo 9: “Escureçam-se as estrelas do crepúsculo matutino dessa noite.”

Jó está desejando que tudo isso tivesse acontecido.

Por que ele diria tais coisas? Ele está deprimido! “Não quero nada com esta coisa chamada vida.” É interessante notar que o suicí­ dio não entrou em sua mente. Nenhuma tentativa, nenhuma palavra

O LAMENTO TRISTE DE UM HOMEM INFELIZ 87

a esse respeito, uma vez que era algo absolutamente estranho à vida do indivíduo fiel.

Achei que seria interessante, enquanto trabalhamos neste lamento triste, ver o que ele diz no versículo 3. Jó não só lamenta o dia do seu nascimento, como a sua concepção. “Pereça o dia em que nasci.” E, em bom estilo poético, ele retrocede nove meses: “E a noite em que se disse: Foi concebido um homem!”

Em nossa época de abortos feitos com facilidade e frequência, não é notável que ele não tivesse chamado a concepção do feto de “tecido”? Ou de uma massa de protoplasma? Jó chama a multiplicação micros­ cópica de células vivas de “homem”, porque a vida começa na concep­ ção. No momento em que o espermatozóide entra no óvulo - vida! A concepção era aplaudida por aqueles da era patriarcal. “Um menino! Um menino! Vamos ter um menino! Que maravilhoso!” Não, não e não! “Não diga isso. Não comemore!”, declara Jó neste momento escu­ ro de sua vida. “Converta-se esse dia em trevas. Anule-o! Livre-se dele!”

Há outra parte deste testemunho vulnerável que me fascina. Quando chegamos ao âmago de sua sombria perspectiva, encontra­ mos estas palavras: “Amaldiçoem-na aqueles que sabem amaldiçoar o dia” (v. 8). Jó não tem muita prática de amaldiçoar, então oferece aos que estão familiarizados com essas palavras profanas para lançarem a maldição por ele. Acrescenta também que são aqueles que “sabem excitar o monstro marinho [leviatã]”.

O que é na verdade o leviatã? O dicionário Webster oferece esta definição: “um monstro marinho representado como um adversário”. A definição, entretanto, retrocede um tanto. Mais especificamente, leviatã era um monstro marinho de sete cabeças da mitologia do antigo Oriente Próximo. Na literatura ugarítica de Canaã e da Fenícia da antiguidade, os eclipses eram causados quando o leviatã saía do mar, engolindo o Sol ou a Lua e, portanto, provocando a escuridão na Terra. Quando o leviatã era despertado do seu sono, o mito o via como engolindo o Sol ou a Lua.

Você pergunta: “O quê?” E eu respondo: “Poesia”. Como men­ cionei antes neste capítulo, esse é um ótimo meio de lidar com coisas

88 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

desse tipo. É poesia. Esses pensamentos, porém, são mais do que poesia, eles representam uma mitologia. Se você viajar para a Turquia ou a Grécia hoje e um nativo dessa terra estiver agora servindo como guia turístico profissional, você vai ouvir muita coisa sobre mitologia. Posso acrescentar que não vai ouvir virtualmente nada sobre teologia. A mitologia é a base dos deuses desses países. Nos dias dos patriarcas da antiguidade, ela fazia parte da sua cultura e literatura.

Assim, Jó se apropria dessa idéia e diz, com efeito: “Enquanto falamos disso, deixe o leviatã engolir o Sol do dia, trazendo a es­ curidão.’’ Jó crê na mitologia? Não mais do que você ou eu acredi­ tamos no Papai Noel quando chega o Natal, embora possamos nos referir a algo que leve Papai Noel a fazer isto ou aquilo. Não se trata de crermos nele, mas apenas que podemos nos referir a ele ironicamente.

No Natal passado recebi um cartão de um bom amigo, um pouco mais moço do que eu. Ele disse: “Passamos por quatro estágios com o Papai Noel. Primeiro, acreditamos nele. Segundo, não acreditamos nele. Terceiro, somos ele. E quarto, nos parecemos com ele.” Brinca­ mos a respeito do Papai Noel e nos divertimos com todos esses mitos que cercam esse personagem fictício.

Jó, embora lamentando por não ter perecido na concepção e triste por ter vivido para ver o dia de seu nascimento, faz uma pergunta penetrante:

Por que não morri eu na madre? Por que não expirei ao sair dela? Por que houve regaço que me acolhesse? E por que peitos, para que eu mamasse?

Jó 3:11, 12

Compreendemos esta última parte. Ele está-se referindo evidente­ mente à sua mãe quando o amamentava. Mas, joelhos [regaço], isto é curioso. Alguns dizem que se refere à mãe, ao dar à luz o filho. O recém-nascido passa pelos joelhos, se você quiser assim. A frase, porém,

O LAMENTO TRISTE DE UM HOMEM INFELIZ 89

diz: “acolhesse”. Poderia ser uma referência à mãe colocando a criança nos joelhos enquanto começa a amamentá-la.

Com toda probabilidade, refere-se ao processo patriarcal de um pai pegando o filho logo depois do nascimento. A criança era coloca­ da nos joelhos do pai, e ele lhe daria ali a bênção familiar. Se você já viu na TV o documentário Raízes, vai lembrar-se da criança africana carregada pelo pai, enquanto este a levanta diante de Deus e a entre­ ga simbolicamente ao Senhor, de acordo com o costume antigo. Nos dias de Jó, a criança era entregue ao pai, e este abençoava o filho quando o colocavam sobre os seus joelhos.

Jó diz então: “Por que fui abençoado? Por que aqueles joelhos me receberam?” Em outras palavras: “Por que não fui simples­ mente um cadáver nas mãos deles?” A seguir, quando desenvolve a idéia de ter nascido morto, volta-se para a bênção de seu corpo sem vida ao descrever o céu:

Porque já agora repousaria tranquilo;

Dormiria, e, então, haveria para mim descanso.

Jó 3:13

Ou, como aborto oculto, eu não existiria, como crianças que nunca viram a luz. Ali, os maus cessam de perturbar, e, ali, repousam os cansados. Ali, os presos juntamente repou­ sam e não ouvem a voz do feitor. Ali, está tanto o pequeno como o grande e o servo livre de seu senhor. Por que se concede luz ao miserável e vida aos amargurados de ânimo, que esperam a morte, e ela não vem? Eles cavam em procura dela mais do que tesouros ocultos. Eles se regozijariam por um túmulo e exultariam se achassem a sepultura. Por que se concede luz ao homem, cujo caminho é oculto, e a quem Deus cercou de todos os lados? Por que em vez do meu pão me vêm gemidos, e os meus lamentos se derramam como água?

Jó 3:16-24

90 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Quando alguém servia a Jó uma simples refeição, ele gemia. O termo hebraico significa guinchar. Como se ele estivesse dizendo: “Aiiiiiii! Leve isso embora, não quero comer nada!” Além do terrível sofrimento do homem, ele está agora faminto; seus gritos se derra­ mam como água.

Jó concluiu o seu lamento dirigindo-se aos seus medos e pavor. “Aquilo que temo me sobrevêm, e o que receio me acontece.” Ele resume então a sua desgraça:

1. Não tenho descanso.

2. Não tenho sossego.

3. Não tenho repouso.

4. E já me vem grande perturbação.

Fim do discurso!

Os amigos perto de Jó não tiravam os olhos dele. Ao analisarem a sua atitude, de seu ponto de vista de boa saúde, alimentação farta, prosperidade contínua e uma família feliz, eles se ofendem com essas declarações grosseiras. Em breve o repreenderão por ter dito tais coisas. Estão se tornando cada vez mais convencidos: “Ele está recebendo o que merece!”

Você viu o filme O Homem Elefante? Que filme esplêndido! — um filme não para os protegidos e ingénuos, mas um filme adulto. O enredo fala de um homem atacado por uma doença que deformou seu corpo e o desfigurou. Sua cabeça aumenta de tamanho e uma pele grossa e insensível substitui a que fora antes macia ao tato, dando-lhe uma aparência grotesca. Em poucas palavras, ele acaba pare­ cendo uma atração circense, embora permaneça um indivíduo de bom caráter, normal e sensível. O público, porém, não se envergo­ nha de tratá-lo como uma aberração.

Você vai se lembrar da cena trágica em que ele foge da multidão, enquanto as cameras pipocam e as pessoas gritam e tentam agarrá-lo. Ele finalmente chega a uma estação ferroviária e desce correndo os degraus para livrar-se dos perseguidores. A caçada termina com o homem encurralado no banheiro público da estação. A turba entra

O LAMENTO TRISTE DE UM HOMEM INFELIZ 9 1

afoita e as câmeras relampejam enquanto o homem se esforça para falar com toda força: “Sou um ser humano.” Seria possível ouvir a queda de um alfinete no cinema depois dessas palavras. Posso ver Jó nesse cenário, gritando: “Ó Deus, onde estás?’ Ele chegou ao fim de seus recursos.

O escritor John Hartley aponta:

Essas são as palavras mais ásperas que Jó pronuncia contra si mesmo no livro inteiro. Elas nos surpreendem. Os amigos ficam também chocados. Eles temem que a sua fé em Deus tenha sido substituída pela desconfiança (...) Como alguém que se recusou a amaldiçoar a Deus poderia ser tão amargo em relação à sua própria vida? O contraste entre o Jó do prólogo e o do poema não poderia ser maior.5

Embora Jó esteja na iminência de amaldiçoar a Deus, ele não faz isso. Pelo contrário, ele atenua o veneno da sua an­ gústia desejando estar morto. Ele sobrevive à sua hora mais negra, uma vez que não amaldiçoa a Deus nem toma seu destino nas próprias mãos.5

Você já se sentiu assim? Percorremos um longo caminho na história da igreja nos últimos quarenta anos. Meu envolvimento no ministé­ rio se desenrolou durante este período de tempo de quatro décadas.

No passado (início da década de 1960), quando um cristão sofria de uma depressão que resultava neste tipo de pensamento e admissão franca, não se tocava no assunto publicamente. A pessoa engolia a sua tristeza. O primeiro livro que li sobre esse tema, referente à per­ turbação emocional e doença mental entre cristãos, foi considerado uma heresia pela maior parte de meus amigos evangélicos.

A opinião quase geral era então simplesmente esta: os cristãos não entravam em crise. Além disso, você certamente não permanecia deprimido! Sabe que termo era usado para descrever os que lutavam

92 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

com uma depressão profunda no começo e meados da década de I960? Nervoso. “Ele tem um problema nervoso.” Ou, simplesmente: “Ela está nervosa.” Se você tivesse, que Deus o ajude, de ser hospita­ lizado devido ao seu problema “nervoso”, não havia uma palavra cristã para isso. Repito, você não contaria absolutamente a ninguém. “Que vergonha não ter confiado no Senhor em meio à sua dificuldade e não ter descoberto que ele é fiel para ajudá-lo em sua depressão!”

Lembro-me de um professor do seminário que falou conosco sobre prestar ajuda às famílias nos funerais. Se você fizesse o funeral de alguém que cometesse suicídio e o morto fosse um cristão, nunca deveria mencionar o fato. Isso não soava correto então, e continua não soando hoje. O aconselhamento baseado na vergonha nunca parece certo, porque não é certo! Naquela época eu não sabia que Jó 3 estava no Livro. Se soubesse, teria dito: “E então, o que você me diz de Jó?”

PALAVRAS DE CONSOLO E ENCORAJAMENTO

Quero escrever para você que está lendo estas linhas e que talvez esteja no fundo do poço, lutando para encontrar o caminho de volta. E possível que as coisas tenham ficado tão pretas que você necessite de um psicólogo (ou psiquiatra) cristão para ajudá-lo a descobrir o seu caminho. A coisa mais inteligente que você pode fazer é localizar um deles e consultá-lo. De fato, faça o tratamento pelo tempo que for necessário. Verifique se o conselheiro conhece de fato o Senhor e é competente, capaz de dar-lhe a orientação que você necessita para atravessar sua crise. Gostaria de acrescentar: “Deus o abençoe a cada hora que passar procurando sair do poço em que caiu. Há esperança. Nosso Deus fiel vai estar com você durante todo o caminho.”

Não sei se eu teria sido suficientemente maduro antes em minha vida para fazer isto; mas hoje, quando penso em ouvir Jó tão amargu­ rado, com a cabeça nas mãos e provavelmente derramando lágrimas, não conseguiria refrear minha vontade de ir até ele, abraçá-lo e dizerlhe quanto o amo e respeito. Mesmo assim, tenho a certeza de que jamais poderia compreender quão terrível deve ter sido a sua miséria.

O LAMENTO TRISTE DE UM HOMEM INFELIZ 93

Quero escrever estas poucas palavras a quem quer que esteja en­ volvido no trabalho de psicologia e psiquiatria, e que conhece nosso Salvador, respeita a Palavra de Deus e confia nas suas verdades: “Não desista. Continue. Ajude o mais possível, durante o maior tempo possível. Muitos irmãos e irmãs sofredores da família de Deus preci­ sam do que você pode oferecer. Apreciamos você, e nossas orações o acompanham.”

TRÊS DECLARAÇÕES A PONDERAR

Depois disso tudo, há três declarações práticas que quero fazer para os que se identificam com os problemas de Jó.

Primeiro, há dias escuros demais para que o sofredor possa ver a luz. Jó estava nesta situação ao terminarmos este capítulo. Seus supostos amigos, infelizmente, não lhe dão qualquer alívio. Assim como Jó, você pode não ter visto a luz por longo tempo. Vou escrever mais para você em seguida.

Segundo, há experiências de tal forma extremas que os atingidos não conseguem sentir esperança. Quando uma pessoa cai tão baixo em vir­ tude do sofrimento, é como se toda esperança estivesse perdida. É por isso que Jó admite sua falta de descanso, sua ausência de paz e sua profunda inquietação.

Terceiro, há vales profundos demais para que os angustiados encontrem alívio. Nesse ponto, parece que não há mais razão para prosseguir.

Não sabemos mais onde procurar alívio. Nossa mente começa a pregar-nos peças, fazendo com que pensemos que nem sequer Deus se incomoda. Errado! Você se lembra da citação que Corrie Ten Boom costumava fazer? Procuro lembrar-me sempre dela: “Não há poço tão profundo que ele não seja mais profundo ainda.” 6 Eu sei, eu sei. Os que estão muito deprimidos não se lembram disso e não conseguem digerir essa idéia. Eles negariam tal afirmação, porque sentem que há uma grande distância entre a sua pessoa e Deus. Isso gera confusão — é amedrontador. Mas as boas novas são que Deus não só está lá, mas também que ele se importa.

94 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Durante os anos em que estudei no Seminário Teológico de Dallas, Cynthia e eu fizemos amizade com Dennis e Lucy Guernsey. Todos morávamos em apartamentos próximos ao campus (graças a Deus que eles já foram demolidos!), o que significava que éramos dois entre os apenas dez casais naquele pequeno complexo. Ficamos então conhe­ cendo todo mundo à nossa volta. Dennis e Lucy se tornaram uns de nossos melhores amigos e permaneceram assim durante anos. Gostá­ vamos muito deles.

D urante o período no Seminário, tiveram um filho que Dennis simplesmente amava de todo coração. O menino tornouse a razão para Dennis continuar vivendo. Ele e Lucy eram pais maravilhosos. Nessa mesma época também tivemos nosso primeiro filho, Curt.

Depois da formatura de Dennis, eles se mudaram para Los Angeles, onde Dennis fez doutorado em Psicologia na Universidade da Califórnia do Sul. Meu amigo queria passar a vida ajudando as pessoas que lutavam, como ele lutara enquanto crescia. Enquanto Dennis se achava em meio ao seu curso de doutorado, o filho deles caiu numa piscina no quintal de um vizinho e morreu. A perda da­ quela criança preciosa devastou Dennis.

Anos mais tarde, ele me contou como reagira à perda. “Entrei no carro, logo depois da morte dele, agarrei o volante e percorri quase todas as auto-estradas de Los Angeles. Durante aquelas horas gritei para Deus, expressando todo o meu sofrimento, ira e tristeza, assim como a confusão no mais fundo de minha alma.” Ele acres­ centou: “Eu disse coisas ao Senhor naquele carro que nunca tinha dito antes a quem quer que seja. Pus tudo para fora e não foi nada bonito. Escancarei as portas do meu coração para Deus.”

De madrugada, Dennis finalmente voltou para casa, com a camisa encharcada de suor. Suas mãos ainda estavam agarradas ao volante. Desligou o carro e encostou a cabeça na direção, soluçando alto. Disse depois: “Senti-me confortado com este pensamento: Deus pode lidar com isso! Ele pode lidar com tudo o que eu disse. Não é esplêndido? Deus pode lidar com isso!”

O LAMENTO TRISTE DE UM HOMEM INFELIZ 9 5

O Senhor deu aos Guernseys duas lindas meninas. Eles as cria­ ram muito bem. Mas, verdade seja dita, ninguém conseguiu jamais tomar o lugar daquele menininho que perderam. Dennis já morreu de câncer cerebral. Lucy continua vivendo em triunfo. Eu, porém, nunca me esquecerei das palavras que ele me disse: “Deus pode lidar com isso!”

Acho digno de nota não ter havido nenhuma explosão contra Jó no final do capítulo 3. Deus não disse: “Que vergonha, Jó!” Deus pôde lidar com as palavras de Jó. Ele compreendeu a razão dele de ter dito o que disse. Ele compreende você também. Infelizmente, as pa­ lavras de Jó foram gravadas para que os pregadores falem a respeito delas durante séculos. As suas e as minhas palavras, entretanto, irão permanecer um segredo dentro de nossos carros, num canto em nos­ so quarto, na arrebentação das ondas, ou talvez sob as árvores altas de um bosque. Deus pode lidar com tudo; desabafe, então. Diga a ele tudo que está em seu íntimo. Você não supera inteiramente o sofri­ mento até que o expresse por completo. Jó não reteve o seu. Eu o admiro mais agora do que quando comecei o livro.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já permitiu a si mesmo lamentar diante de Deus, ou sente que precisa esconder a tristeza para parecer espiritual?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Sabendo que muitas vidas grandiosas nasceram de começos trágicos, como Deus pode estar usando a sua dor para algo maior do que você enxerga?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando o desespero chega a fazer um homem amaldiçoar o próprio dia, o que ainda mantém você ancorado na esperança?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Respondendo aos Maus Conselhos$t$, 11,
$conteudo$em todo conselho é bom — nem mesmo quando quem o dá pensa que é o conselho certo. Algumas vezes ele é dado com toda sinceridade, mas continua falho. Isto me fez lembrar de uma história que me foi contada recentemente.

Um homem terminara de almoçar e estava em seu carro, diri­ gindo-se para o compromisso seguinte. Sua mente reportou-se à noite anterior. Ele começou a ficar perturbado com a briga séria que tivera com a mulher. Era um daqueles conflitos contínuos, nãosolucionados, e decidiu então que estava na hora de fazer as pazes. Ao sentir-se culpado por algumas das coisas que dissera, o homem pegou o celular e discou apressado para casa em meio a um conges­ tionamento de trânsito.

Quando a empregada atendeu ao chamado, ele disse: “Quero falar com minha mulher.” Ela respondeu: “Ela me falou que não queria ser interrompida neste momento.” Curioso, ele perguntou: “Não quer ser interrompida?” A empregada disse: “É verdade, ela está lá em cima com o namorado e avisou que não quer ser

98 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

perturbada.” Furioso, o marido perdeu a cabeça. “Você sabe onde guardo minha espingarda? Vá buscá-la, coloque duas balas e depois suba e mate os dois.”

Ela colocou o telefone na mesa, pegou a espingarda de dois canos e subiu as escadas. Ele ouviu os dois tiros e esperou. A moça desceu, pegou calmamente o telefone e disse: “Está feito. Eles estão mortos. O que você quer que eu faça com os corpos?” Ele falou: “Jogue-os na piscina e eu cuido do resto quando chegar.” Ela disse: “Não temos piscina.” Houve uma pausa e o homem perguntou: “E do 728-3604?”

Nem todo conselho é um bom conselho. Nem mesmo quando a pessoa que o dá pensa que é o conselho certo.

BOM CONSELHO...MAU CONSELHO

Cada pessoa que está lendo este capítulo já recebeu um mau conselho. Você prestou atenção enquanto ouvia. Seguiu o conselho recebido e depois sofreu as consequências. Por outro lado, todos nos beneficia­ mos dos bons conselhos de alguém. Estávamos inseguros e confusos, então procuramos alguém em quem confiávamos. Recebemos bons conselhos, nós os aplicamos e tiramos proveito dos benefícios.

Na Bíblia há um livro que oferece conselhos sábios. É chamado Provérbios, um livro com 31 capítulos, cheio de advertências sábias e úteis.

Veja, por exemplo, Provérbios 12:15: “O caminho do insensato aos seus próprios olhos parece reto, mas o sábio dá ouvidos aos con­ selhos.” Nós dois já tivemos essa experiência. Fomos insensatos, pen­ sando estar certos e nos deparamos então com um pai ou um professor, talvez um amigo, que colocou uma dose de bom senso em nossa cabeça, pelo que devemos dar graças. Como resultado, nos benefi­ ciamos do conselho sábio.

Veja outro exemplo: Provérbios 16:24: “Palavras agradáveis são como favo de mel: doces para a alma e medicina para o corpo.” Gosto disso! As palavras ditas no tempo certo, escreve Salomão em outro lugar, são “como maçãs de ouro em salvas de prata”.

RESPONDENDO AOS MAUS CONSELHOS 99

Como maçãs de ouro em salvas de prata, assim é a palavra dita a seu tempo. Como pendentes e jóias de ouro puro, assim é o sábio repreensor para o ouvido atento.

Provérbios 25:11, 12

Bom conselho. Reprovação sábia. Resposta obediente. E os benefícios são fartos. A situação ganha-ganha final.

Este livro antigo está repleto de declarações similares:

Ouve o conselho e recebe a instrução, para que sejas sábio nos teus dias por vir.

Provérbios 19:20

E outra:

Como o ferro com o ferro se afia, assim, o homem, ao seu amigo.

Provérbios 27:17

Todos conhecemos os benefícios de um bom amigo que nos ajuda com conselhos sábios; até a presença da pessoa “afia” a nossa vida. Salomão escreve um pensamento semelhante no mesmo capítulo.

Como na água o rosto corresponde ao rosto, assim, o coração do homem, ao homem.

Provérbios 27:19

Tenho certeza de que você já passou por ocasiões assim. Havia algo no poço do seu coração que você não conseguia trazer à superfície. Apareceu então alguém que o ama e tem habilidade para jogar um balde nesse seu poço profundo, puxá-lo, e depois esparramar o con­ teúdo para vocês dois verem claramente.

100 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Devo acrescentar que o conselho sábio nem sempre é fácil de ouvir.

Fiéis são as feridas dum amigo; mas os beijos dum inimigo são enganosos.

Provérbios 27:6, VR

Há, em hebraico, uma raiz de verbo interessante na primeira parte do versículo. Ela é chamada “raiz causativa”, permitindo-nos inter­ pretar a declaração: “Fiéis são as feridas dum amigo”. A ferida provocada pelo golpe verbal de alguém que o ama é um ferimento leal. Quando o amor é sincero, seu amigo o confronta com a verdade — vocês estão sozinhos, e então você ouve as coisas difíceis que precisam ser con­ frontadas. Essa ferida permanece e você passa a ser uma pessoa me­ lhor por causa disso. Tal ferimento é muito mais útil e confiável do que um abraço fingido, o “beijo” do lisonjeador que Salomão chama de “inimigo”. O bom conselho é algo bom, mesmo que machuque ouvi-lo.

Em seguida vêm os maus conselhos. Alguns deles seriam como estes:

• Por que você não vai em frente e se casa com ele? E certo que ele vai mudar depois do casamento.

• Já que sou um perito em finanças, isto parece garantido.

Penso que vale a pena fazer um investimento de US$10,000 em ações da Enron.

• Inteligente e capaz como você é, não se preocupe em termi­ nar a escola. Você tem idéia de quantos milionários existem hoje que não têm diploma do ensino médio?

• O tempo está bem fechado, mas já voei quando estava pior.

Vamos, entre. Podemos passar acima das nuvens sem grande dificuldade.

Maus conselhos.

RESPONDENDO AOS MAUS CONSELHOS 101

DE VOLTA A JÓ NAS PROFUNDEZAS

Deixamos Jó no que poderíamos chamar de “pessimismo sombrio”. Sua depressão era profunda. Ele desprezava o dia do seu nascimento. Odiava a idéia de ter sobrevivido ao nascimento. Acima de tudo, o silêncio de Deus o deixava desesperado. Quando não conseguiu mais aguentar, ele desabafou. Quando o deixamos, o pobre homem estava mais baixo do que a barriga de uma baleia.

Três amigos perto dele ficaram a olhá-lo sem dizer nada. Eles completaram sete dias e sete noites em silêncio, observando, ouvindo e formando sua opinião. A princípio, foi difícil para eles crer que aquele era realmente o seu amigo Jó. Parecia tão diferente! Tinha a cabeça raspada, o rosto inchado e o corpo coberto de tumores puru­ lentos. Se você olhar com atenção, poderá ver vermes pequeninos em alguns deles. É uma cena grotesca. Jó fica mudando de posição. Não se sente confortável sentado no chão, e pior ainda quando deitado. Suas noites são cheias de gemidos e inquietação. Devagar e com agonia ele tenta ficar de um jeito que lhe dê alguns minutos de alívio — mas não consegue. Quando o Sol se levanta, os raios quentes queimam sua pele enquanto ele fica ali sentado no depósito de lixo da cidade. Nem sua mulher pode consolá-lo. O homem está atormentado pelas suas aflições e tem o espírito quebrantado. Se alguém na Terra já precisou do conforto de um amigo, esse homem era Jó. Seus amigos compareceram, mas não o confortaram.

Já era bastante ruim vê-los sentados silenciosos, com os olhos fixos nele; mas, ao abrirem a boca, as coisas só pioraram. Não que pretendessem ser maus, apenas perderam de vista o seu propósito. Qual seria ele? Pare e pense. No começo haviam ido para consolá-lo (Jó 2:11). Das centenas de associados nos negócios e dúzias de amigos de Jó, só esses compareceram. De fato, eles foram pela razão certa.

Foram vê-lo como faríamos com um amigo que estivesse hospi­ talizado e gravemente enfermo. Você e eu não sabemos o que dizer e, portanto, no geral, ficamos de pé perto dele e falamos muito pouco. É verdade que em certas ocasiões falamos e dizemos a coisa errada. Saímos pensando: “Por que eu disse aquilo?” Seria preferível ter ficado

102 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

quieto. O silêncio total é muito melhor do que palavras inadequadas. Todos erramos ao dizer um pouco mais do que deveríamos.

Aqueles homens, entretanto, vão muito além. Eles misturam culpa com vergonha, condenação e juízo, amontoando noções legalistas; para acertar o alvo recorrem ao sarcasmo e às discussões. Mas e o consolo? E a simpatia? Ambos se perderam no calor dos argumentos verbais.

UM POUCO DE ESTRUTURA PARA COMEÇAR

Quero oferecer alguns esclarecimentos ao virarmos a página na vida de Jó e começarmos o diálogo entre ele e os amigos. Vale a pena mencionar quatro deles.

Primeiro, os dois capítulos iniciais do Livro de Jó e os 11 versículos finais do último capítulo, capítulo 42, são escritos em forma narrativa. Como expliquei antes, este estilo é conhecido como prosa. Essas duas seçÕes de prosa representam a história. Por serem factuais e diretas, são facilmente compreendidas. Não há grande mistério.

É claro que você pode estar curioso em relação a esses dois capítu­ los de abertura, mas não terá problemas em compreender as palavras e o fluxo da ação. No final do livro você vai ficar emocionado porque tudo acaba tão bem... exceto os filhos. Uma vez que não seria prova­ velmente uma bênção ter o dobro de filhos na idade de Jó (!), o Senhor é gracioso e permite que ele e a esposa tenham apenas dez filhos. Gostamos quando os sofredores acabam tendo vidas proveito­ sas, realizadas. Isto é tudo com respeito à seção de prosa.

Encontramos de entremeio vários capítulos de poesia. Como os Salmos e o livro a que nos referimos antes, Provérbios, Jó é principal­ mente poesia. Portanto, como já mencionei, deve ser lido como poesia. Isto significa que há frases repetidas junto com figuras de linguagem pitorescas. Algumas coisas, como você em breve descobrirá, estão além da nossa capacidade de compreender plenamente, o que é de se esperar. Mas é possível entender a maior parte do que lemos. De fato, quase todos os escritos são belíssimos, embora um tanto misteriosos

RESPONDENDO AOS MAUS CONSELHOS 103

e até um pouco místicos às vezes. A prosa de Jó é histórica enquanto a poesia é filosófica. Isto explica a dificuldade de compreensão em certos trechos. As declarações filosóficas podem ser complicadas.

Um de meus mestres costumava dizer que o filósofo é uma pessoa que fala sobre coisas que não compreende, mas faz com que pareça que a culpa é nossa. A filosofia exige concentração; mas, mesmo assim, algumas coisas não ficam gravadas. Vou fazer o possível para manter o seu interesse de um capítulo para o outro, mas você vai ter de se concentrar comigo. Um dos membros da igreja comentou, enquanto eu pregava sobre Jó: “Não há corridas de carro para manter os adoles­ centes torcendo na beirada dos assentos.”

Segundo, esta seção poética, que é a parte mais longa do livro (Jó 3:1—42:6), começa com uma discussão branda. Ela se transforma depois em debate intenso e termina numa disputa acalorada. O primeiro amigo de Jó, Elifaz, se aproxima dele com o chapéu na mão. A prin­ cípio mostra-se relutante e delicado. Mas, perto do fim, não há mais hesitação ou reserva. A essa altura, o indicador da mão dele está tocando o esterno de Jó, decidido a pô-lo em brios. A conversa amável se deteriora em discussão ácida.

Terceiro, os três amigos de Jó, Elifaz, Bildade e Zofar, “fazem rodízio” ao dialogar com ele. Suas palavras aparecem em ciclos — três ciclos, para ser exato.

No primeiro ciclo, Elifaz fala, e Jó responde. A seguir, Bildade é quem fala, e Jó responde. Finalmente, é a vez de Zofar. Ele faz seus comentários iniciais, e Jó responde. Nesse ponto termina o primeiro round.

Depois disso, Elifaz volta à cena para começar o segundo ciclo de diálogos. Ele é aparentemente o mais velho do grupo. Naqueles dias, a idade era honrada como prioritária. Assim sendo, como antes, Elifaz fala primeiro, em seguida Bildade e por último Zofar. Jó res­ ponde a cada um.

Quando chegamos ao terceiro ciclo, por alguma razão não reve­ lada, Zofar retira-se do diálogo. Ê possível que tenha se cansado de argumentar e decidido: “Vou sair agora. Isto não está nos levando a

104 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

nada.” Você deve então se lembrar de que, quando chegarmos a Jó 32, outro “amigo” entrará em cena, o mais jovem do grupo, chamado Eliú. O interessante é que Eliú faz um monólogo, mas Jó não lhe responde. É provável que a essa altura Jó esteja pensando: “Já ouvi tudo que posso suportar.” O homem está simplesmente exausto. Ele não vê propósito em dar mais respostas. Tenho a impressão de que preferiu encerrar a discussão.

Quarto, uma dica final. Devo mencionar que Elifaz apóia suas pa­ lavras na experiência. Ele diz: “Segundo eu tenho visto” ou “Bem vi eu”. Elifaz analisou a situação de Jó de acordo com sua experiência.

Bildade é diferente. Ele baseia suas palavras na tradição e diz a Jó: “Pergunta agora a gerações passadas” (Jó 8:8). Bildade insiste com Jó para voltar à crónica histórica e verificar o que aconteceu. Com efeito, ele fala: “A tradição nos ensina isto.”

Quando ouvimos Zofar (o mais hostil dos três), vamos descobrir que ele prescinde do tato e mostra a Jó os punhos fechados. As pala­ vras impacientes e iradas de Zofar se baseiam em suposições.

Quero acrescentar aqui que os três são legalistas. São críticos e condenatórios. Os três recorrem a conselhos baseados na vergonha. Algumas vezes você vai balançar a cabeça e dizer: “Como eles podem falar assim? Por que diriam isso a alguém que chamavam de ami­ go?” Vamos encarar os fatos - nossa tendência é a mesma. Ficamos tão concentrados em esclarecer as coisas que tomamos a dianteira e dizemos tudo que pensamos. Nesse ponto, não só cortamos as pre­ liminares e vamos direto ao assunto, como ferimos as pessoas com as nossas línguas. É um verdadeiro massacre verbal. À medida que o calor do debate aumenta, iremos testemunhar esse tipo de atitu­ de negativa.

PREPARANDO O PALCO PARA O DIÁLOGO

Você acaso se lembra de uma briga feia que tenha tido com sua mu­ lher? Pare e pense um pouco. É possível que tivesse durado algumas horas e ficado realmente acirrada. Você então acabou dormindo no

RESPONDENDO AOS MAUS CONSELHOS 105

sofá! Depois da segunda noite ali, você começa a se sentir solitário e decide que quer voltar e pôr as coisas em ordem. Você abre devagar a porta e entra. “Olá, querida, seu cabelo está bonito... Que vestido lindo!” Algo assim. Você está tentando começar um novo tipo de conversa. Foi desse modo que Elifaz começou. Ficara sentado ali per­ to sete dias e sete noites. Ouvira Jó despejar suas dificuldades e tormentos. Ele compreendeu, pelo menos no princípio, que as coi­ sas estavam terrivelmente delicadas. Relutante, decide quebrar o gelo e oferecer alguns conselhos.

Elifaz Prega

As palavras iniciais são hesitantes: “Se intentar alguém falar-te, enfadar-te-ás? Quem, todavia, poderá conter as palavras?” (Jó 4:2). Nós todos passamos por isso, talvez com um de nossos filhos. Há um longo período de silêncio e tentamos então ser sensíveis enquanto começamos a discussão. Esse é o tom das primeiras palavras de Elifaz: “Quem, todavia, poderá conter as palavras?” Ele está realmente insi­ nuando: “Parece que o silêncio não está resolvendo nada.”

Nossa filha Charissa enviou-me uma foto engraçada de dois leões adultos. Um era um macho grande com sua juba pesada ao redor do pescoço. O outro era uma leoa parecendo exausta, que evidentemente havia tido filhotes há pouco tempo; ela estava quase que se arrastando pelo chão. O Maioral vinha chegando para outra visitinha. Na foto a leoa está dando um enorme urro, com as presas enormes totalmente expostas. A pata dela, com as longas garras estendidas, quase toca a face dele. A leoa tem a boca bem aberta enquanto rosna, como se estivesse dizendo: “Nem pense nisso!” O leão, embaraçado, abaixa a cabeça e recua com as orelhas achatadas sobre o crânio. Charissa e eu rimos m uito daquela leoa mal­ humorada rugindo para o velho malandro que ficou de súbito relu­ tante demais para se aproximar.

Elifaz era assim. Ele está hesitante em quebrar o silêncio, então se insinua com um amável: “Eis que tens ensinado a muitos e tens fortalecido mãos fracas” (Jó 4:3). Aseguir, acrescenta: “As tuas palavras

106 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

têm sustentado aos que tropeçavam, e os joelhos vacilantes tens forti­ ficado” (Jó 4:4). Jó tinha de fato feito tudo isso.

“Mas...” Com esse “conectivo contrastante” de aparência ino­ cente, Elifaz avança - verbalmente pronto para atirar seu primeiro golpe. Faz isso com luvas de boxe, com toda gentileza, dizendo: “Mas agora, em chegando a tua vez, tu te enfadas” (Jó 4:5).

Depois dessas palavras, Elifaz deixa de consolar e se põe a pregar. “Você passou a vida dando conselhos a outras pessoas e ensinando a elas como ficar firmes e como sobreviver às tempestades que nos so­ brevêm. Agora, algo difícil aconteceu, e você está irritado!” É como se ele dissesse: “Enquanto está na posição de dar, você sabe dar bons conselhos, mas, agora que foi atingido, ficou fora de controle!” Veja como ele se encaminha para um clímax:

Mas agora, em chegando a tua vez, tu te enfadas; sendo tu atingido, te perturbas. Porventura, não é o teu temor de Deus aquilo em que confias, e a tua esperança, a retidao dos teus caminhos?

Jó 4:5, 6

“Não tenho razão, Jó? Não é que eu esteja duvidando da sua inte­ gridade, mas você ficou aborrecido com o que lhe aconteceu. Parece que você não é a pessoa que todos pensavam que fosse.” Com essas palavras Elifaz torce a faca na ferida:

Lembra-te: acaso, já pereceu algum inocente? E onde foram os retos destruídos? Segundo eu tenho visto, os que lavram a iniquidade e semeiam o mal, isso mesmo eles segam.

Jó 4:7, 8

“Preste atenção, Jó, você está apenas recebendo o que merece."

RESPONDENDO AOS MAUS CONSELHOS 107

Esta passagem fica bem clara na Bíblia Viva:

Será muito difícil para você escutar algumas palavras? Há algumas coisas que eu não posso deixar de lhe dizer. No passado, você ensinou pessoas que estavam sofrendo a con­ fiar em Deus. Você ajudou os fracos, caídos e desesperados a tentar mais uma vez, a começar de novo. No entanto, agora que chegou a sua vez de passar pelos mesmos sofrimentos, você se desespera e perde a vontade de viver! Onde está a sua confiança em Deus? Você que vivia uma vida tão santa e justa, onde foi parar sua esperança? Pense um pouco, ho­ mem! Por acaso Deus já destruiu um justo? Ou castigou sem motivo o inocente? Não! Na minha opinião, os pecado­ res rebeldes que plantam sementes de maldade por onde passam, esses é que colhem de volta, como castigo de Deus, a maldade que fizeram.

Jó 4:2-8

Isso machucou! Quando você analisa essas palavras, vê que há ver­ gonha nelas. “Jó, se você é inocente, por que está nessa dificuldade? Para ser sincero, observei que as pessoas que sofrem assim têm pecado em sua vida.” Se Elifaz visitou Jó para se solidarizar com ele e confortálo, este foi um meio estranho de fazê-lo. Ele não animou o amigo; pelo contrário, o deprimiu ainda mais. O conselho errado faz isso, e este com certeza se qualifica como um mau conselho. Em especial, porque nada do que está dizendo é verdadeiro.

Elifaz quer saber quem jamais sofreu sem merecer. O que dizer de cada mártir? Das vítimas de abuso e assassinato? Do Filho de Deus, o inocente “Cordeiro de Deus que tirou os pecados do mundo?” Aquele que não cometeu pecado, não conheceu pecado, não tinha pecado? Sem merecer, ele foi pregado numa cruz. E é ele quem diz: “Pai, perdoa-lhes, porque não sabem o que fazem”. A crucificação do Salvador é o exemplo clássico do sofrimento injusto.

Perdoe a interrupção, mas sinto-me obrigado a dizer: “Elifaz, você está completamente fora. Não me importo com a sua idade.

108 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Nao me importo com quantas experiências teve. Você não tem o direito de dizer isso a um homem de indiscutível integridade.” Pronto, já falei. E gostaria de repetir isso a cada pessoa que torce a verdade, ignora os fatos e abusa verbalmente dos que não têm culpa.

O problema é que ele não acabou. Elifaz continua falando sobre visões da noite e depois sobre como é verdade que os homens não são perfeitos diante de Deus. Ele persiste, dizendo a Jó que temos um Criador, que ele é o único perfeito, e que nós não somos. E claro que Jó já sabia disso tudo! Na verdade, nem tudo que Elifaz disse era incorreto. Ele acerta em cheio quando afirma a Jó: “Mas o homem nasce para o enfado, como as fagulhas das brasas voam para cima” (Jó 5:7). Jó certamente sabia também isso. Se o idoso amigo de Jó tivesse então parado! Ele porém continua, deixando escorrer um pouco mais de orgulho: “Quanto a mim, eu buscaria a Deus e a ele entregaria a minha causa” (Jó 5:8). Deixa implícito com isso: “Você não fez tal coisa, Jó!”

Quero agora fazer uma pergunta: como ele sabe o que Jó fez? Nem sempre buscamos a Deus em palavras. Durante períodos ultradifíceis buscamos a Deus em silêncio, no íntimo da nossa alma. Uma vez que Deus é Aquele “que faz coisas grandes e inescrutáveis” (Jó 5:9), buscá-lo em silêncio é perfeitamente apropriado.

Jó poderia ter respondido: “Sei disso!” Poderia ter dito mais: “Não estou sentado aqui apenas carnalmente! Estou lutando com o meu sofrimento e a minha dor; todavia, compreendo perfeitamente que Deus faz coisas grandes e maravilhosas. Estou coberto de tumo­ res, mas nada fiz para merecer isto! Você está despejando toda essa grande teologia sem conhecimento. Por favor, por favor!” Poderia ter dito isso e muito mais, mas Jó se conteve.

Elifaz não parou. Ele tem a audácia de dizer, no final do versículo 17: “Não desprezes, pois, a disciplina do Todo-Poderoso” (Jó 5:17). Não perca novamente a implicação: “Você está sofrendo porque é culpado, Jó! Está recebendo exatamente o que merece. Não está atento às censuras do Senhor. Na realidade, ficará bom tão logo se arrepen­ da de seus pecados.” Quanta simpatia e consolo!

RESPONDENDO AOS MAUS CONSELHOS 109

Ele conclui bruscamente:

Saberás também que se multiplicará a tua descendência, e a tua posteridade, como a erva da terra. Em robusta velhice entrarás para a sepultura, como se recolhe o feixe de trigo a seu tempo. Eis que isto já o havemos inquirido, e assim é; ouve-o e medita nisso para teu bem.

jC JÓ 5:25-27

“Esta é a resposta clara e simples, Jó. Faça isto e ficará bem. Fico feliz por ter ajudado. Isto é o que você precisava ouvir. Terminei. Nada a pagar.”

Em algum ponto desse mau sermão, a acusação superou a com­ paixão. Não pense que Jó não percebeu. A pessoa que sofre não se sente bem, mas isso não significa que haja falta de entendimento. As pessoas que sofrem não melhoram quando lhes damos uma mistura de Gêngis Khan e Mike Tyson em uma única explosão verbal. Além do mais, se você não tiver a mente clara de Deus e fatos indiscutíveis para prová-la, por favor, apenas ame seu amigo que sofre e fique quieto. Se houver discernimento a ser obtido, ele será alcançado mediante o consolo e a terna misericórdia, e não por meio de reprovação e acusação. Em certas ocasiões, como vimos antes em Provérbios, há momentos em que as censuras são necessárias. Mas enquanto coberto de tumores? Não.

Jó Responde

“Oh!”, diz Jó, no início da sua resposta. Leia atentamente sua pri­ meira declaração: “Oh! Se a minha queixa, de fato, se pesasse” (Jó 6:2). Significado? “Elifaz, olhe para mim. Considere a minha situa­ ção. Meus dez filhos morreram. Elifaz, ouça. Perdi tudo. Oh! gostaria que meu sofrimento fosse realmente pesado e colocado na balança junto com minha calamidade. Os dois somados pesariam mais do que a areia dos mares.” Não se apresse. Elifaz pode não ter ouvido

110 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jó, mas quero assegurar-me de que nós ouçamos. Faça uma pausa e tente imaginar a angústia do homem. “Por isso as minhas palavras foram precipitadas.” Jó está sendo vulnerável.

Quando chegam ao fim das suas forças, caindo num poço sem fundo de sofrimento, serão ditas palavras precipitadas que mais tar­ de as pessoas irão lamentar. Mas, enquanto isso está acontecendo, devemos dar-lhes um pouco de folga. Vamos supor que você tenha dois filhos crescidos que estão começando a abusar... Dê um pouco de folga a eles. Vão finalmente voltar aos eixos. Mais tarde, eles vão ter as respostas; mas compreenda que tiveram de ouvir seus ser­ mões durante vinte anos ou mais. Permita que reajam por enquanto como precisam. Deixe que digam o que precisam dizer sem tentar ser um Elifaz.

Ser um bom conselheiro exige um enorme senso de oportunidade, grande sabedoria, uma corda comprida e muita compreensão. Jó está suplicando por tudo isso enquanto pede a Elifaz que considere suas tremendas dificuldades. “Não acho que você diria essas coisas, Elifaz, se estivesse em meu lugar.”

Jó tornou também claro: “não tenho negado as palavras do San­ to” (Jó 6:10). Essa é uma grande declaração, sendo também um fato. “Quero que você saiba, Elifaz que em tudo isto — odiando o dia do meu nascimento e clamando contra o fato de ter vivido e não morrido ao nascer e também porque minha desgraça tornou-se insuportável, por favor, Elifaz, compreenda que nunca neguei as palavras do Santo.” A dúvida e a negação não estavam no coração de Jó. Confusão, isso sim. Ira? Claro. Vamos refletir novamente sobre isso. Dê a seus ami­ gos cristãos espaço para se sentirem confusos e expressarem ira em crises desse tipo. Jó não está na defensiva, tentando encobrir algum pecado secreto. Sua lógica se desdobra em várias perguntas:

Acaso, disse eu: dai-me um presente? Ou: oferecei-me um suborno da vossa fazenda? Ou: livrai-me do poder do opres­ sor? Ou: redimi-me das mãos dos tiranos?

Jó 6:22, 23

RESPONDENDO AOS MAUS CONSELHOS 111

Pedi algumas dessas coisas? Não!

Ensinai-me, e eu me calarei; dai-me a entender em que tenho errado.

Jó 6:24

Que proposta vulnerável, sincera! “Elifaz, não pedi nada especial. Não procurei nenhum aspecto que pudesse envolver você.” A seguir, ele pergunta: “O que o seu argumento prova?” Qual o seu ponto? “Você não está entendendo.”

Agora, pois, se sois servidos, olhai para mim e vede que não minto na vossa cara.

Jó 6:28

Eu amo essa linha. “Veja, Elifaz, não trafico com mentiras!” Jó sabia que as mentiras são absolutamente prejudiciais à recuperação. Ele então convida Elifaz a apontar qualquer mentira. “Diga em minha face, olhe para mim. Se não puder fazer isso então desista. Se há injustiça em minha linguagem, mostre” (v. 30).

No capítulo 6, Jó fala ao seu amigo, mas no 7 ele fala ao seu Deus. Entrega seu caso ao Senhor. Jó diz, com efeito: “Se eu pudesse levar meu caso ao Deus vivo... Ele tem as qualificações de um juiz ideal. Eu me apresentaria diante dele e explicaria a minha situação, dizendo: ‘Julgue retamente e aceitarei o que quer que diga’. Mas ele está tão silencioso! Não fala comigo estes dias.”

O silêncio de Deus é pior do que a sua voz por ser impossível saber o que ele diria. Jó, durante todo este capítulo 7, derrama a sua angústia, mas o silêncio de Deus persiste. O Senhor não dá resposta à sua alma sofrida. Ele conclui sua súplica, perguntando a Deus por que fizera dele o seu alvo: “Por que estou na sua mira?” Silêncio.

“Por que não perdoas a minha transgressão e não tiras a minha iniquidade?” (Jó 7:21).

112 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Se há transgressão, por que não a perdoou? Eu confessaria tudo.” Silêncio...

Humilhado pelas palavras de Elifaz e perseguido pelo silêncio de Deus, Jó fala como um homem atormentado, neste ponto e em outros. Ele sente-se fisicamente miserável. No plano emocional, ele não sabe mais o que fazer; no espiritual, está confuso. Não se esqueça de que, além de tudo que perdeu e do sofrimento pelo qual está passando, Jó foi agora acusado e envergonhado, censurado na frente de outros e criticado. E horrível. Não há outra palavra para isso. E simplesmente horrível.

POR FAVOR, ALGUMAS PALAVRAS SÁBIAS

Este é um bom ponto para fazer uma pausa e aprender algumas lições penosas de Elifaz; depois disso, algumas lições úteis de Jó.

LIÇÕES PENOSAS A SEREM APRENDIDAS DE ELIFAZ

Primeiro, as suposições reduzem a compreensão e o discernimento. Enganei-me frequentemente em m inha vida por causa de supo­ sições. Enquanto estou confessando isso, preciso acrescentar que as suposições também me desviaram várias vezes da verdade em meu aconselhamento. Quando sua opinião já está formada e você pensa que já sabe a causa desse fato, você não pode compreender realmente a verdade porque não está mais prestando atenção. Suas conclusões bloquearam seus ouvidos. Você está pronto para impor a sua opinião. Em vista de as suposições reduzirem o en­ tendimento, você perde a capacidade de discernir. Na maioria das vezes, como aconteceu com Elifaz, as palavras se tornam ás­ peras e críticas.

Segundo, a vergonha bloqueia a graça e impede o alívio. O conse­ lho baseado na vergonha coloca sobre nós um peso a mais de culpa em vez de oferecer uma nova esperança de recuperação. A vergonha atira você mais fundo nas garras afiadas da angústia. Assim sendo,

RESPONDENDO AOS MAUS CONSELHOS 113

espero que remova para sempre de seu vocabulário as palavras: “Que vergonha!” Elas não fazem bem algum.

Terceiro, o orgulho obscurece a misericórdia e a compaixão. Quando parece que você tem a resposta final e você sugere que é um modelo exemplar, na verdade você está detendo o fluxo de misericórdia. O orgulho e a compaixão não podem coexistir.

Li recentemente a respeito de um líder cristão que estava viajando com a mulher para Chicago, a fim de fazer uma palestra.

Enquanto dirigia, ele passou pela saída que deveria tomar e a esposa disse: “Você perdeu a saída certa, querido.”

Isso o aborreceu e o homem replicou: “Eu estou dirigindo o carro. Sei para onde vou. Eu saberia se tivesse perdido o lugar certo.”

Ela disse: “Seria melhor fazer o retorno.”

Ele respondeu: “Não há necessidade disso.”

Silêncio.

O homem continuou e as placas não mostraram mais a direção de Chicago. Indicavam Detroit e outras cidades que não eram tão próximas de Chicago.

Ela comentou: “Querido, não há mais placas de Chicago. Você está indo na direção errada.”

Ele cerrou os dentes e optou por esperar pela saída seguinte.

Quando chegaram a ela, não havia indicação de Chicago.

Sua esposa falou novamente: “Querido, deixe de ser ridículo e volte.”

Nesse ponto, ele decidiu provar que a mulher estava errada, sem levar em conta as consequências. Começou a pensar num meio de chegar a Chicago sem fazer o retorno.

Não havia meios.

De repente, o homem compreendeu que estava pecando. Con­ fessou seu pecado, desistiu e deu meia-volta.

Ela disse: “Você viu como foi fácil?”

114 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Ele sorriu: “Por que não fiz isso 30 quilómetros atrás?”

“Porque você é orgulhoso demais.”1

Isto se aplica tanto às mulheres quanto aos homens. Mas, com­ panheiros, nós podemos ser realmente teimosos! Estou certo de que há senhoras lendo isto e que aprenderam que nós homens estamos dispostos a nos desviar 160 quilómetros do caminho para provar que sabemos para onde estamos indo.

LIÇÕES ÚTEIS A SEREM APRENDIDAS NO LIVRO DE JÓ

Encontrei pelo menos duas lições para lembrar.

Primeira, há ocasiões em que as palavras das outras pessoas pioram os nossos problemas. Isso pode parecer elementar demais para ser mencio­ nado, então por que eu faria isso? Você já aprendeu? Continua ouvindo todo mundo? Caso positivo, não é de admirar que esteja confuso.

O conselho de algumas pessoas só complica as nossas dificulda­ des. Poucas armadilhas são tão desastrosas quanto acreditar em tudo que você ouve. Quero ser franco com você. Em quase toda decisão importante que fiz em minha vida cristã, onde procurei o conselho de muitas pessoas (todas elas bastante sinceras), alguém me aconselhou incorretamente. Não se tratava de pessoas más; apenas não tinham compreensão suficiente. Portanto, o conselho delas era distorcido. Uma vez que Elifaz não é o único a dar maus conselhos, devemos verificar se não estamos dando o mesmo peso ao conselho de todos. Escolha cuidadosamente os seus conselheiros. Mesmo assim, filtre o conselho através da oração e do bom senso.

Segunda, há ocasiões em que os caminhos de Deus só nos tornam mais confusos. Consegui dizer! Quis fazer isso durante todo este capí­ tulo e finalmente ganhei coragem. Minha conclusão? Não espere com­ preender tudo que acontece no momento em que ocorre.

Vou terminar com uma simples sugestão que pode fazê-lo sorrir. E algo que quero que pratique na frente do espelho. Chamo isso de “Encolher de Ombros”. Olhe no espelho, balance a cabeça e encolha

RESPONDENDO AOS MAUS CONSELHOS 115

os ombros, depois diga em voz alta: “Não sei.” Pratique essa pequena manobra várias vezes durante um mês.

Não me importa se você tem diploma de doutor. Apenas fique sozinho na frente do espelho, sem ninguém por perto, encolha os ombros e diga: “Não sei... Realmente, não sei.” Pode até acrescentar: “Não posso dizer-lhe como isso aconteceu. Não sei.” Repita várias vezes as palavras: “Não sei.”

A boa notícia é que Deus nunca encolhe os ombros. Ele nunca fala assim. Com grande percepção, ele diz: “Sei exatamente por que isto aconteceu. Sei o caminho que você tomou. Sei a razão. Sei quan­ to tempo vai estar nele e sei qual será o resultado final.” O encolher de ombros e a divindade são coisas incompatíveis.

Enquanto você está encolhendo os ombros, com humildade sin­ cera, afirmando: “Não sei”, Deus está dizendo: “Ótimo. Confie em mim no que se refere ao mistério. Confie em mim.” Deus nunca prometeu que nos informaria antecipadamente a respeito de tudo em seu plano. Só avisou que tem um plano; o qual, em última análi­ se, é para o nosso bem e para a sua glória. Ele sabe e nós não. E por isso que encolhemos os ombros e admitimos: “Não sei.” Portanto, se você e eu nos encontrarmos um dia e você me fizer uma pergunta profunda e difícil, não se surpreenda se eu encolher os ombros e disser: “Não sei.”

Sei porém isto: a morte do seu Filho não foi em vão. Sei também isto: Cristo morreu por você. E novamente: se você crer nele, o Senhor vai perdoar os seus pecados e você irá viver com ele para sempre. Terá o céu e todas as suas bênçãos. Sei disso. E uma jornada difícil até chegar lá: cheia de muita confusão, muitos conflitos, uma porção de encolher de ombros, seguida de um punhado de “Não sei”. Mas, quando os céus se abrirem e estivermos lá, não haverá mais encolher de ombros. “Agora eu sei.”

Jó chega finalmente ao ponto em que pode terminar a sua defesa, enquanto diz:

Mas ele sabe o meu caminho; se ele me provasse, sairia eu como o ouro. Os meus pés seguiram as suas pisadas;

116 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

guardei o seu caminho e não me desviei dele. Do manda­ mento de seus lábios nunca me apartei, escondi no meu íntimo as palavras da sua boca.

Jó 23:10-12

Quanta paz nessas palavras! “Ele sabe o meu caminho.”$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que conselhos sinceros, porém falhos, você já recebeu de pessoas que pensavam estar certas a respeito do seu sofrimento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como discernir, à luz de Deus, entre o conselho que cura e o que machuca quem está ferido?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante de palavras que feriram em vez de consolar, como você tem respondido sem perder a sua integridade diante do Senhor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Continuando o Duelo Verbal$t$, 12,
$conteudo$J

ó e seus supostos consoladores me fazem lembrar de uma lenda popular originária de uma floresta dos Territórios a Noroeste do Canadá. Ela descreve um pequeno grupo de porcos-espinhos que se juntaram para se aquecer durante os ventos frios do inverno. Em vista de suas cerdas serem tão agudas, quanto mais se aproximavam, mais picavam uns aos outros, o que os levava a se afastar dos compa­ nheiros. Não demorou, começaram a tremer à medida que aumenta­ vam os ventos gelados do ártico, o que os forçou a se reunir novamente. Esta estranha dança dos porcos-espinhos repetiu-se durante a noite inteira.

Um trocista comentou: “Eles precisavam uns dos outros, mas continuavam se alfinetando.”

Uma “dança” similar aconteceu na antiga terra de Uz, onde Jó e seus amigos duelaram verbalmente. O que havia começado pelo motivo certo se perdeu no arrastar do tempo e da tensão. Não demorou para que as palavras dos amigos se transformassem em sermões entremea­ dos de vergonha e sarcasmo. Os argumentos e insultos aniquilaram o

118 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

consolo e a compaixão. Jó precisava da companhia deles como ami­ gos compreensivos e compassivos, mas quanto mais se aproximavam tanto mais eriçados pareciam, despejando comentários cáusticos e acusações, o que fazia com que se separassem.

Um escritor descreve o festival de argumentos deles. Referindose a Jó, apontou o seguinte:

Ele está ferido pela aspereza deles, magoado com as suas censuras, exasperado com as reprovações e levado ao antago­ nismo pelos seus argumentos. Eles são os defensores professos da obrigação religiosa. Representam a causa de Deus, re­ forçando as reivindicações dele sobre Jó e justificando sua maneira de tratá-lo. Fazem isso com uma atitude que lhe causa repulsa, com suposições que a experiência não sanciona e que a sua própria consciência interior deturpa (...)

O conflito insolúvel suposto por eles (...) tende a colocar em sua mente uma imagem distorcida do caráter de Deus. Deus parece estar a torturá-lo por crimes que não cometeu, a persegui-lo como um inimigo implacável, e sem justiça ou razão estar empregando seu poder irresistível para esmagálo no pó. Este é o fantasma que seus amigos colocam cons­ tantemente diante dele, esta falsa noção de um Deus injus­ to e impiedoso para com ele; não lhe é possível justificar de outra maneira os sofrimentos intoleráveis pelos quais está passando. Jó vê-se então obrigado a lutar incessantemente contra este fantasma, aparentemente tão real, para que ele não o leve ao desespero absoluto e obrigue-o a abandonar a sua confiança em Deus, atirando-o assim completamente no laço do tentador (...)

Aqui se acham então os três amigos de Jó (...) ativamente ocupados em atirar suas flechas venenosas (...) E aqui está também o próprio Jó, exposto sem escudo ou broquel aos seus perigosos ataques.1

CONTINUANDO O DUELO VERBAL 119

Os amigos, pois, falavam e Jó respondia. Continuavam falando e ele respondendo. Ofereciam suas respostas rasas e soluções simplistas enquanto Jó lutava para sobreviver. Quanto mais argumentavam, tanto mais se afastavam da verdadeira ajuda a ele.

H.L. Mencken disse, melhor do que ninguém: “Há sempre uma solução fácil para todo problema humano: clara, plausível e errada.”2 Você deve estar se lembrando de que Elifaz foi quem deu o primeiro golpe. Seus raciocínios se apoiavam na experiência. “Aprendi, observei, vi.” Ele falou muito, disse pouco e não ofereceu consolo algum.

Depois da resposta vulnerável e sincera de Jó, Elifaz recuou. A seguir, no “time” dos filósofos, entra um homem chamado Bildade. Se você acha que Elifaz foi ofensivo, espere até encontrar Bildade. Pense num porco-espinho humano. Sua abordagem rude fica evidente já na primeira linha: “Até quando falarás tais coisas? E até quando as palavras da tua boca serão qual vento impetuoso?” (Jó 8:2). Nos termos de hoje: “Você, seu tagarela!” Você pode imaginar-se sentado ali, coberto de tumores por todo o corpo? Com a lembrança de dez filhos sepultados num morro próximo? Sua mulher sussurrando em seu ouvido: “Você precisa amaldiçoar a Deus e deixar que ele o tire da terra”. Elifaz dando conselhos inúteis. E agora surge um segundo amigo, um pouco mais moço que Elifaz, com este comentário insultante: “Você é um saco cheio de vento, Jó.” Ao ouvir a resposta de Jó a Elifaz, Bildade decidiu endireitá-lo.

Bildade iniciou três linhas de argumentação. O esboço do “ser­ mão” de Bildade teria esta forma:

• Primeiro, O Caráter de Deus — Jó 8:3-7

(“Levante os Olhos, Jó!”)

• Segundo, A Sabedoria do Passado — Jó 8:8-10

(“Olhe para Trás, Jó!”)

• Terceiro, A Evidência da Natureza — Jó 8:11-19

(“Olhe à Sua Volta, Jó!”)

• Últimos Comentários — Jó 8:20-22

120 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Vamos seguir esse esboço enquanto acompanhamos a mensagem de Bildade — que foi mais do que uma preleção sobre Teologia.

“LEVANTE OS OLHOS, JÓ!”

O golpe inicial de Bildade levou a novos comentários necessitados de tato:

Perverteria Deus o direito ou perverteria o Todo-Poderoso a justiça?

Jó 8:3

Se isso já não for suficientemente brutal, veja esta linha:

Se teus filhos pecaram contra ele, também ele os lançou no poder da sua transgressão.

Jó 8:4

Isso significa exatamente o que você está pensando. Tive de ler a pas­ sagem duas ou três vezes para acreditar que alguém pudesse dizer isso a um pai que está sofrendo. Lemos na Bíblia Viva: “Se os seus filhos sofreram tudo isso, foi porque desobedeceram a Deus e sofre­ ram as consequências de seu pecado.” Jó não está só com o coração partido pela perda dos filhos, como também é obrigado a ouvir esse homem que tem a audácia de afirmar que a morte deles foi devida ao castigo de Deus pelas suas transgressões.

Vou ser penosamente franco: fico surpreso ao ver que Jó não deu um soco no nariz de Bildade! Por ser um homem de paciência heróica, Jó se refreou. (É bom que este livro tenha o título Jó e não Chuck... Vou explicar a você, está bem? Se esse versículo fosse Chuck 8:4, você não leria o que acabou de ler). O silêncio de Jó é notável. Os golpes caem sobre ele a toda hora, mas ele aceita que o homem continue atirando. Para tornar as coisas piores, Bildade fala em nome de Deus. Seu sermão pseudo-piedoso continua...

CONTINUANDO O DUELO VERBAL 121

Mas, se tu buscares a Deus e ao Todo-Poderoso pedires mi­ sericórdia, se fores puro e reto, ele, sem demora, despertará em teu favor e restaurará a justiça da tua morada.

Jó 8:5, 6

A implicação é óbvia. “Uma vez que você também é pecador, Jó, Deus não está disposto a restaurar a sua saúde e dar-lhe alívio. Você está recebendo o que merece, homem. Está passando por isso tudo por causa do castigo divino.”

Bildade aparentemente pensava que Jó precisava fazer um curso de Teologia. Ele não precisava. A Teologia de Jó era sólida e pura. Além disso, ele já modelara a humildade, confessando qualquer transgressão que pudesse ter causado a sua condição. O problema não era esse.

“OLHE PARA TRÁS, JÓ!”

Uma vez que Bildade não chegou a parte alguma com sua saraivada de palavras, ele voltou ao passado: “Jó, levante os olhos e considere o caráter de Deus. Isso aconteceu com seus filhos por causa do pecado em suas vidas. Aconteceu também com você porque pecou. Deus, que é santo, justo e puro, só podia fazer o que ele fez.”

Enquanto Jó ficava sentado e silencioso, exposto a essa análise injusta, Bildade disse: “Sugiro que você olhe para trás, Jó.”

Pois, eu te peço, pergunta agora a gerações passadas e atenta para a experiência de seus pais; porque nós somos de ontem e nada sabemos; porquanto nossos dias sobre a terra são como a sombra. Porventura, não te ensinarão os pais, não haverão de falar-te e do próprio entendimento não proferirão estas palavras?

Jó 8:8-10

Na sua condição de tradicionalista, Bildade insiste para que Jó volte no tempo e aprenda com os antigos. Ele está salientando dois pontos:

122 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

primeiro, porque não sabemos nada em comparação, e segundo, por­ que nossas vidas são tão breves (“como a sombra”), precisamos da sabedoria das eras passadas. Tudo que disse pode ser teoricamente verdade, mas será isso que Jó precisava ouvir naquele momento? Suas palavras ajudaram Jó?

A falta de tato de Bildade realmente me irrita. Sei que ele tinha várias coisas a dizer, mas o mínimo que podia fazer era usar de cuida­ do ao falar. Bildade me faz lembrar de um médico meu conhecido que, depois de aplicar um teste de esteira a um indivíduo (que é bastante corpulento), estudou os resultados após o término do exa­ me. O paciente estava suando e ofegante; quando desceu da esteira, o médico olhou para ele e disse: “Os resultados não estão maus para um sujeito gordo como você.” Algumas pessoas são realmente obtu­ sas, não são? Bildade se qualifica como uma delas. Ele pode ter sido um bom teólogo e historiador, mas seu consolo era vil.

“OLHE À SUA VOLTA, JÓ!”

Com a idéia de causa e efeito em mente, Bildade voltou-se para o assunto da natureza.

Pode o papiro crescer sem lodo? Ou viça o junco sem água? Estando ainda na sua verdura e ainda não colhi­ dos, todavia, antes de qualquer outra erva se secam. São assim as veredas de todos quantos se esquecem de Deus; e a esperança do ímpio perecerá. A sua firmeza será frus­ trada, e a sua confiança é teia de aranha. Encostar-se-á à sua casa, e ela não se manterá, agarrar-se-á a ela, e ela não ficará em pé. Ele é viçoso perante o sol, e os seus renovos irrompem no seu jardim; as suas raízes se entrelaçam num montão de pedras e penetram até às muralhas. Mas, se Deus o arranca do seu lugar, então, este o negará, dizen­ do: Nunca te vi. Eis em que deu a sua vida! E do pó brotarão outros.

Jó 8:11-19

CONTINUANDO O DUELO VERBAL 123

Ele começou, insistindo com Jó para levantar os olhos e conside­ rar o caráter de Deus. A seguir, voltou ao passado e fez com que Jó examinasse os ensinamentos daqueles que haviam vivido antes dele. Agora, Bildade olha em volta e apresenta filosoficamente os seus argumentos de forma poética. Está pensando que, assim como a causa e o efeito são verdadeiros na sua vida, o mesmo acontece no mundo da natureza. Vejamos se é possível combinar isto.

“Pode o papiro crescer sem lodo?” A implicação é que eviden­ temente não pode. Em seguida, de forma poética e elegante, ele repete palavras similares. “O u viça o junco sem água?” O ponto é este: se essas plantas não receberem água, irão murchar e morrer. E a implicação é esta: “Jó, você está murchando e morrendo porque é um hipócrita. Segue-se então que a sua esperança está perecendo porque você não tem o coração puro nem uma relação reta com um Deus santo.”

Está vendo como ele coloca a questão?

São assim as veredas de todos quantos se esquecem de Deus.

O que ele sugere aqui? “Jó, você se esqueceu de Deus!”

E a esperança do ímpio perecerá.

Agora ele está sugerindo que Jó é ímpio. A seguir, menciona a teia da aranha:

A sua firmeza será frustrada, e a sua confiança é teia de aranha.

Você pode apoiar-se numa teia de aranha e ela irá sustentá-lo? Claro que não. Não importa que você confie nela, a teia é frágil e vai se partir. “Jó, a sua confiança é assim. Você vai quebrar em breve e cair.”

124 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Depois de dizer isso, Bildade se volta para as plantas num jardim. Por mais viçosa que seja a planta, por mais fortes as suas raízes, ela morre ao ser arrancada.

Ampliando esta analogia, ele raciocina:

Mas, se Deus o arranca do seu lugar, então, este o negará, dizendo: Nunca te vi.

A implicação é que foi isso que aconteceu com Jó. “Deus arrancou você. Algo danificou suas raízes e o levou a esta condição semelhante à morte em que você se encontra.” O homem está afirmando exatamente o que ele pensa: “Você cometeu pecado, e Deus o arrancou por causa disso.”

Enquanto Bildade estava envolto em todos esses pensamentos filosóficos, Jó deve ter ficado ali, tentando digeri-los e pensando: “O que vou ganhar com isso?” Para falar a verdade... nada. Toda essa tagarelice é pura perda de tempo. Que tagarela!

A CONCLUSÃO DE BILDADE Eis que Deus não rejeita ao íntegro, nem toma pela mão os malfeitores. Ele te encherá a boca de riso e os teus lábios, de júbilo. Teus aborrecedores se vestirão de ignomínia, e a ten­ da dos perversos não subsistirá.

Jó 8:20-22 (itálico meu)

Depois de outra suposição insultante sobre a falta de integridade de Jó, o homem se desvia para uma série de comentários vazios sobre a vida futura, onde Jó conheceria novamente a alegria. A conclusão é clara: Bildade não entendeu nada de nada. Ele não tinha idéia do que Jó precisava.

No que se refere a não compreender o sentido, ouça esta história: um homem perguntou à esposa: “Se você pudesse ter qualquer coisa

CONTINUANDO O DUELO VERBAL 125

neste mundo durante um dia, o que desejaria?” Ela respondeu com um sorriso: “Eu gostaria de ter seis novamente.” Na manhã do dia seguinte, a manhã de seu aniversário, ele acordou-a e eles foram até uma confeitaria próxima para comer waffles e creme batido com um copo grande de leite. A seguir, foram para o parque temático local. Que dia! Ele a fez andar em todos os brinquedos do parque. Todos! Cinco horas mais tarde, ela saiu cambaleando do parque com o ma­ rido... Sua cabeça girava, seu estômago ainda estava revirado. O McDonald s foi a próxima parada. Ele pediu dois Big Macs com batatas fritas e um copo grande de milk-shake de chocolate. Foram depois ver um filme animado interessante — o último sucesso de Hollywood. Comeram pipoca e tomaram Pepsi, terminando assim um dia cheio de aventuras fabulosas para uma garota de seis anos. Exausta, ela entrou aos tropeções em casa naquela noite com o marido e caiu direto na cama. Foi então que ele se inclinou e sussurrou bai­ xinho em seu ouvido: “Você gostaria de ter seis anos outra vez?” Um olho se abriu e ela disse: “Na verdade, eu estava falando do tama­ nho do meu vestido”.3 (Nos Estados Unidos, 6 é o tamanho da média das mulheres.)

Bildade cometeu esse mesmo erro com Jó. Ele fala como se o homem precisasse de sermões etéreos, exemplos teóricos do passado e analogias filosóficas a partir de exemplos do mundo da natureza - plantas morrendo sem água, teias de aranha e raízes ao redor de pe­ dras, enquanto o criticava. Jó deve ter ficado pensando o tempo todo: “Será que você pode ajudar na cura das feridas que tenho em todo o meu corpo? Ou por que não diz apenas que está aqui porque gosta de mim e está orando para que eu sobreviva?” Não preciso pôr, porém, palavras na boca de Jó. Ele pode falar por si mesmo.

JÓ RESPONDE A BILDADE

Jó fala primeiro com Bildade em Jó 9 e depois fala com Deus em Jó 10.

“Eu sei disso muito bem, não é novidade. Eu sei que é im­ possível para o homem ser considerado inocente perante Deus. Se Deus quisesse pedir contas ao homem, seria possível

126 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

responder sequer uma das mil perguntas que Ele fizesse? Deus é muito sábio e poderoso; ninguém é capaz de deso­ bedecer a Ele e ser feliz nesta vida.

Na sua ira, Ele é capaz de mover e destruir montanhas tão depressa que nem se pode ver. Ele pode sacudir os alicerces da terra e tirar este mundo de seu lugar. Se Ele mandar, o sol não nasce e as estrelas não brilham. Sozinho, Ele formou os céus! Ele anda sobre as grandes ondas do oceano. Ele criou as grandes estrelas e os grupos de estrelas como a Ursa Maior, o Órion e o Sete-Estrelo, além dos astros que bri­ lham nos céus do Sul.

Ele realiza grandes milagres, tantos que é impossível contar e ver! Ele está sempre perto de mim mas não o consigo ver; vai sempre adiante em meu caminho mas não o posso ver. Quando Ele decide tirar a vida de alguém, quem é capaz de impedir, quem pode dizer ‘Não!’?

Deus não deixa de cumprir o castigo que sua ira exige. Ele esmaga os príncipes de nações poderosas, como o Egito.”

Jó 9:1-13, A Bíblia Viva

Jó mostra saber claramente quem Deus é. O que desejava era uma audiência com ele. “Veja! E ele que faz tudo isso. Ele é magnífico em seu poder e eu o temo. Fico diante dele reverente e maravilhado! Tudo o que quero é poder aproximar-me dele e resolver este assunto, e você não me ajudou a fazer isso, Bildade.”

Depois dessas palavras, seguem-se quatro perguntas. Tenha em mente que Jó pensa em comparecer diante de Deus num ce­ nário legal. Ele gostaria de entrar num tribunal divino e ficar diante do Juiz, o Senhor Deus. Queria participar na sua condição atual, coberto de tumores, falido e quebrantado, e discutir o seu caso. Não por ser rebelde, mas simplesmente para estar na mesma sala, face a face, onde pudessem discutir sobre tudo. Ele faria então quatro perguntas.

CONTINUANDO O DUELO VERBAL 127

Primeira: Se eu pudesse ficar diante de Deus, o que diria?

Como, então, lhe poderei eu responder ou escolher as minhas palavras, para argumentar com ele? A ele, ainda que eu fosse justo, não lhe responderia; antes, ao meu Juiz pediria misericórdia. Ainda que o chamasse, e ele me res­ pondesse, nem por isso creria eu que desse ouvidos à minha voz. Porque me esmaga com uma tempestade e multiplica as minhas chagas sem causa. Não me permite respirar; antes, me farta de amarguras. Se se trata da força do poderoso, ele dirá: Eis-me aqui; se, de justiça: Quem me citará?

Jó 9:14-19

Caso seja uma questão de poder, ele vence. Portanto, se tivesse de ficar diante dele, o que eu diria?

Isso leva à segunda pergunta: Se eu pudesse declarar minha ino­ cência, que benefício isso traria?

Ainda que eu seja justo, a minha boca me condenará; embora seja eu íntegro, ele me terá por culpado. Eu sou íntegro, não levo em conta a minha alma, não faço caso da minha vida. Para mim tudo é o mesmo; por isso, digo: tanto destrói ele o íntegro como o perverso. Se qualquer flagelo mata subitamente, então, se rirá do desespero do inocente. A terra está entregue nas mãos dos perversos; e Deus ainda cobre o rosto dos juizes dela; se não é ele o causador disso, quem é, logo?

Jó 9:20-24

Lembre-se de que se trata de poesia hebraica. Algumas partes exigem reflexão. Seria interessante revolvê-las em nossa mente por mais uma hora, enquanto tentamos sondar as profundezas das palavras de Jó. O que ele diz pode parecer obscuro, mas o seu ponto é claro: “Se pudesse declarar minha inocência, que proveito haveria nisso?”

128 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Agora, a terceira pergunta: Se tentasse ser positivo e alegre, como isso me ajudaria?

Os meus dias foram mais velozes do que um corredor; fugi­ ram e não viram a felicidade. Passaram como barcos de jun­ co; como a águia que se lança sobre a presa. Se eu disser: eu me esquecerei da minha queixa, deixarei o meu ar triste e ficarei contente; ainda assim todas as minhas dores me apa­ voram, porque bem sei que me não terás por inocente. Serei condenado; por que, pois, trabalho eu em vão? Ainda que me lave com água de neve e purifique as mãos com cáustico, mesmo assim me submergirás no lodo, e as minhas próprias vestes me abominarão.

Jó 9:25-31

Ao fim desses pensamentos, Jó chega a uma importante encruzilhada com sua quarta pergunta: Haverá um mediador que apresente as minhas necessidades diante de Deus?

Porque ele não é homem, como eu, a quem eu responda, vindo juntamente a juízo. Não há entre nós árbitro que ponha a mão sobre nós ambos. Tire ele a sua vara de cima de mim, e não me amedronte o seu terror; então, falarei sem o temer; do contrário, não estaria em mim.

Jó 9:32-35

Jó deseja um árbitro que sirva de intermediário entre ele e esse Deus poderoso e santo. Almeja alguém que apresente o seu caso. Jó gosta­ ria de expô-lo no tribunal de Deus, mas não tem um mediador. Ele está dizendo, com efeito: “Queria muito apresentar-me perante o Juiz santo, o meu Deus, mas não posso. Ele não é homem para vir até mim, e eu nao possuo o que é necessário para ir a ele. Preciso de um intermediário. Há um árbitro disponível?”

CONTINUANDO O DUELO VERBAL 129

Há anos, quando eu trabalhava como maquinista para pagar a escola, houve uma ameaça de greve em nossa firma. O sindicato ficou de um lado com os operários, e a gerência, do outro. Havia uma lista enorme de reclamações. De modo curioso, um árbitro foi chamado para interferir. Ele não tinha nada a ganhar no parecer do sindicato. Nada a ganhar aos olhos da gerência. Era neutro, contratado para ouvir os dois lados. O objetivo era que algum tipo de entendimento pudesse ser alcançado, já que o árbitro poderia, depois de ouvir as duas partes, negociar um acordo e evitar a greve. De fato, como teve sucesso, a greve não ocorreu.

É isso que Jó deseja. Mas ele não tem um árbitro. Não se qua­ lifica para ficar diante de Deus por não ser uma divindade; e Deus não é um homem para colocar-se diante de Jó - ele enfrenta então um dilema.

Que bom se Jó tivesse vivido séculos mais tarde! “Há um Me­ diador”, escreve Paulo a seu jovem amigo Timóteo, referindo-se àquele que nos representa diante de Deus Pai. Não é nenhum outro senão Jesus Cristo, o Senhor.

Isto é bom e aceitável diante de Deus, nosso Salvador, o qual deseja que todos os homens sejam salvos e cheguem ao pleno conhecimento da verdade. Porquanto há um só Deus e um só Mediador entre Deus e os homens, Cristo Jesus, homem, o qual a si mesmo se deu em resgate por todos: testemunho que se deve prestar em tempos oportunos.

1 Timóteo 2:3-6

Paulo escreve sobre nosso mediador, nosso árbitro: “Há um só Me­ diador entre Deus e os homens”, e ele é especificamente identificado como “Cristo Jesus, homem”. Quando se trata da vida eterna, não há muitos mediadores. Só um: Cristo Jesus. Não tema ser assim especí­ fico. Jesus não temeu. Durante o seu ministério terreno, Jesus falou de si mesmo como o “caminho, e a verdade, e a vida; ninguém vem ao Pai senão por mim” (Jo 14:6).

130 JÚ: UM HOMEM DE TOLERÂNCIA HERÓICA

As pessoas têm dificuldades com as particularidades hoje em dia. Alguns dizem que não devemos ser tão limitados ou exatos com respeito à religião. Eu penso: “Você quer que as pessoas sejam especí­ ficas quanto ao vôo de avião que vão fazer?” Você já telefonou para a agência de passagens e a encarregada disse: “Olhe, é o vôo 413, ou poderia ser o 1096, ou talvez o 309.” Você responderia: “Quero saber especificamente o número do vôo, qual é?” A agente replica: “Ele decola do aeroporto DFW, ou quem sabe do Love Field, e o vôo sai próximo das 12:15, ou quem sabe 13:10, ou poderia ainda sair às 12:30.” Como isso seria ridículo! Não é surpreendente? Para algo tão simples quanto um vôo de avião queremos números, horas e portões de embarque exatos. Você não está disposto a andar pelo aeroporto inteiro, dizendo: “Deixe-me ver. Não me preocupo com decolagens. Vou tomar qualquer avião. Basta que o piloto seja sincero e a aeronave pareça em ordem. Os meus sentimentos é que valem quando entro nele.” Que piada!

Quando se trata da Pessoa de Cristo, ele é o único mediador entre Deus e a humanidade. Ele é o único Salvador! Nós nos desco­ brimos respondendo: “Veja, Jó, há um mediador. Você apenas não o encontrou; mas um dia, Jó, o mundo vai ouvir falar dele.”

O falecido G. Campbell Morgan escreveu:

O clamor de Jó nasceu de uma dupla percepção predomi­ nante no momento: primeira, a espantosa grandeza e majestade de Deus; e, segunda, a sua relativa insignificân­ cia. Esta não era a indagação de um homem que houvesse repudiado Deus em sua vida e no universo e estivesse viven­ do simplesmente na esfera terrena. Ao contrário, era o grito de um homem que conhecia a Deus e estava esmagado pela sensação da sua grandeza...

Ele lutava com o sentimento da sua comparativa pequenez. Sentia que não podia aproximar-se desse Deus, por ser ab­ solutamente insignificante (...)

Era como se Jó tivesse dito: não há árbitro, não há media­ dor, não há ninguém que possa ficar entre nós, interpretar

CONTINUANDO O DUELO VERBAL 131

um para o outro: eu para Deus e Deus para mim. Não há ninguém para colocar sua mão sobre nós (...)

Jó estava então clamando aqui por alguém que pudesse colocar-se entre ele e Deus, criando assim uma possibili­ dade de encontro, de contato.

Deixamos agora o grito elementar de Jó e o Antigo Testa­ mento, para considerar a palavra apostólica referente a Jesus. “Há um só mediador entre Deus e os homens.” Esse é o evange­ lho em poucas palavras. E fundamentalmente o cristianismo.4

JÓ RESPONDE A DEUS

Depois de responder a Bildade, Jó se volta para o próprio Deus. Ele escreve com um suspiro fundo:

A minha alma tem tédio à minha vida; darei livre curso à minha queixa, falarei com amargura da minha alma. Direi a Deus: Não me condenes; faze-me saber por que contendes comigo.

Jó 10:1, 2

Jó continua lutando. Elifaz o deixou. Ele não recebeu consolo nem discernimento de Bildade. Não tem mediador para apresentar o seu caso; portanto, é muito sincero. Na verdade, está repetindo pergun­ tas que fizera antes. Tem todo direito de fazê-las. Está confuso. Ainda não entendeu. Portanto, como é compreensível, ele pergunta:

Por que, pois, me tiraste da madre? Ah! Se eu morresse antes que olhos nenhuns me vissem! Teria eu sido como se nunca existira e já do ventre teria sido levado à sepultura. Não são poucos os meus dias? Cessa, pois, e deixa-me, para que por um pouco eu tome alento.

Jó 10:18-20

132 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Por que ele não me tirou do útero e me levou logo para o túmulo?” Oh! Jó, você está de volta onde começou. De fato, ao terminar sua resposta, ele retorna à depressão. Escreve sobre sua “amar­ gura”, “sombra profunda” e “escuridão”. Por respeito ao conflito particular de Jó, sugiro que terminemos aqui. Isto acaba tristemente, mas é o que acontece com Jó quando Bildade franze a testa e vai embora. Deus, porém, continua em silêncio.

DUAS LIÇÕES QUE PERDURAM

O fim é lamentável, mas contém lições a serem lembradas.

Primeiro, quando a miséria abate o nosso espírito, palavras filosóficas não nos ajudam. Tudo o que os supostos consoladores de Jó tinham a oferecer eram palavras ocas na forma de elucubrações filosóficas e conceitos teóricos. Isso não lhe serviu de alívio, não diminuiu a sua infelicidade. Palavras filosóficas não resolvem quando pronunciadas diante dos que estão sofrendo.

Segundo, quando um mediador não pode ser encontrado, buscas fúteis não nos dão esperança. Estamos hoje cercados de pessoas que desejam continuar felizes, que aspiram a vencer os problemas que as afligem. Muitas almejam um mediador, alguém que possa representar sua causa e apresentar o seu caso. Você pode ser essa pessoa. Se for esse o caso, você pode saber o que Jó não sabia. O mediador que ele deseja­ va não está apenas vivo, ele está disponível e pronto para ouvir a sua história. Ao contrário dos amigos de Jó, ele não é um filósofo. E o Redentor. Seu nome é Jesus. Quem quer que se aproxime dele para obter consolo irá encontrá-lo. A misericórdia dele supera a sua miséria.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Como a "dança dos porcos-espinhos" descreve relações em que precisamos uns dos outros mas continuamos nos ferindo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando uma conversa que começou pelo motivo certo se perde em sarcasmo e acusação, o que você pode fazer para não alimentar o duelo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma você tem buscado ser companhia compassiva, e não mais um a despejar comentários cáusticos sobre quem sofre?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Quando a Censura e a Resistência Colidem$t$, 13,
$conteudo$om o passar do tempo, os conflitos tendem a ficar mais compli­ cados em vez de mais simples. Eles são como as baratas, não se consegue ignorá-las. Se não lidar com o problema — com isso quero dizer matar cada uma que enxergar -, elas tomam conta. Quem nun­ ca morou em uma casa que tinha baratas não vai conseguir entender a dimensão do problema.

Quando me mudei para o Texas, um amigo falou o seguinte ao ver que eu usava botas de caubói: “Você sabe por que usamos essas botas aqui no Texas? Respondi: “Pensei que sabia, mas acho que vou aprender uma nova razão neste momento.” Disse ele: “Isso mesmo, é para que você possa matar baratas com facilidade.” Co­ mentário engraçado.

Quando estávamos no Seminário Teológico Dallas, como já mencionei, Cynthia e eu morávamos nos velhos apartamentos do campus. Ocupávamos o apartamento 9 (parece até o número de uma cela de prisão, não é?). Vou ser sincero: havia baratas lá. Eu disse a Cynthia, certa noite: “Não temos uma única barata em nossa

134 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

casa.” Ela me olhou como se eu estivesse absolutamente maluco. Continuei: “Todas se casaram, não são mais únicas e têm grandes famílias.” Os problemas são assim. Quando pioram, quase sem exceção, levam a conflitos. No geral, quando você tenta resolvê-los, eles só aumentam.

Tenho certeza de que nenhum leitor deste livro alguma vez deixou de tentar fazer as pazes com outra pessoa, mas não conse­ guiu. E fácil esquecer qual deve ser o nosso comportamento.

Quando alguém pede falência, perde tudo e todos, depois fica doente, e seus amigos aparecem para encorajá-lo, a conduta é real­ mente muito simples: expressar solidariedade e demonstrar com­ paixão genuína. Foi exatamente isso que os amigos de Jó decidiram fazer. Excelente atitude.

Depois de passados alguns dias, porém, eles se esqueceram das boas intenções. De maneira surpreendente, não se consegue encon­ trar uma única frase de solidariedade ou um ato destinado a dar consolo. Em toda a seção central de Jó - capítulos 4 a 31 - não há nada senão ira e acusações, muitas críticas e humilhação. Suas pala­ vras contêm insultos, comentários sarcásticos, apontar de dedos, pregação de sermões e condenação.

Como era de esperar, Jó se aborrece, como logo veremos, e decla­ ra: “Seria melhor que vocês tivessem ficado calados.” Ele tem razão. O que nossas mães nos ensinaram? Se não puder dizer alguma coisa agradável, não diga nada. Se não puder oferecer solidariedade e con­ solo, não ofereça nada. Faça com que a sua presença fale por você.

AGORA É A VEZ DE ZOFAR

O terceiro amigo de Jó é um legalista clássico. Seu tom e suas palavras estão carregados de legalismo contundente.

• “Você é culpado, Jó” (Jó 11:1-4).

• “Você é ignorante, Jó” (Jó 11:5-12).

• “Você é pecador, Jó” (Jó 11:13-20).

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 135

Verifique o primeiro comentário de Zofar. É impiedoso.

Porventura, não se dará resposta a esse palavrório? Acaso, tem razão o tagarela?

Jó 11:2

Que tal isso para começar uma conversa? Ele ouvira a palavra tagarela antes e decide usá-la outra vez. Está dizendo, com efeito: “Já ouvimos o bastante de você, Jó. Quanto mais coisas terá de dizer para convencer-nos de que é um falador? O fato é que a sua vida não é reta.”

Será o caso de as tuas parolas fazerem calar os homens? E zombarás tu sem que ninguém te envergonhe? Pois dizes: A minha doutrina é pura, e sou limpo aos teus olhos.

Jó 11:3, 4

Vamos parar aqui, em meio ao comentário mordaz de Zofar. Jó nunca dissera isso. Já era difícil demais ser tratado com grosseria e falta de tato, mas ser citado erroneamente é algo terrível para aceitar sem rebelar-se.

Um pouco mais cedo, Jó estava suficientemente vulnerável para dizer:

Ensinai-me, e eu me calarei; dai-me a entender em que tenho errado.

Jó 6:24

Ele então acrescentou...

Agora, pois, se sois servidos, olhai para mim e vede que não minto na vossa cara.

Jó 6:28

136 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Que tipo de franqueza é essa? Zofar estava sendo sincero. Esses críticos, entretanto, são dados à generalização, culpando os outros. Golpeiam Jó sem piedade. Depois de ter deturpado as palavras de Jó, Zofar afirma que ele é culpado. Além disso, agora sugere: “Você é ignorante!”

Você se lembra de quando Jó foi identificado como “o maior de todos os do Oriente”? O relato bíblico diz também que ele temia a Deus e se desviava do mal. De acordo com isso, eu diria que não era culpado nem ignorava a Deus.

É preciso compreender, entretanto, que ao fazerem suas decla­ rações, os legalistas não trabalham com fatos; tudo que precisam é falar grosso e ter a oportunidade de humilhar você (são bons nas duas coisas), na esperança de que você ficará intimidado com a pre­ sença deles.

Ouça Zofar:

Oh! Falasse Deus, e abrisse os seus lábios contra ti [ele está chamando o juízo dos céus], e te revelasse os segredos da sabedoria, da verdadeira sabedoria, que é multiforme! Sabe, portanto, que Deus permite seja esquecida parte da tua iniquidade.

Jó 11:5, 6 (o trecho entre colchetes é meu)

Ele provavelmente está falando sobre o lado que podemos ver e o que não podemos (a sabedoria tem dois lados). Discorre sobre a sabedoria invisível de Deus: “Sabe, portanto, que Deus permite seja esquecida parte da tua iniquidade” (Jó 11:6).

Zofar está fazendo uma preleção sobre Teologia — como se Jó precisasse de outra preleção.

Quero advertir você que outros Zofar estão à solta. Se ainda não encontrou um, basta esperar. Ele vai aparecer, com capacidade zero para ligar os pontos do teste. Não tem sequer habilidade para colorir conforme números indicados. Embora os Zofar não entendam as

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 137 coisas, eles têm uma mensagem séria para você. Essa mensagem é um comentário cáustico, porque você não está fazendo o que eles acredi­ tam que deveria fazer. Ou, pelo contrário, está fazendo o que acham que não deveria fazer.

Neste caso, uma vez que Zofar vê Jó ignorando a Deus, ele decide que necessita ensiná-lo sobre Deus. Fala então sobre o comprimento, extensão, profundidade, largura e altura de Deus, lembrando a Jó que este Deus não pode ser restringido. A seguir, como se isso não bastasse, ele acrescenta a implicação insultuosa:

Porque ele conhece os homens vãos e, sem esforço, vê a iniquidade.

Jó 11:11

Antes de aplicar o último golpe:

Mas o homem estúpido se tornará sábio, quando a cria de um asno montês nascer homem.

Jó 11:12

Vamos fazer uma pequena pausa aqui. A palavra estúpido vem de um termo hebraico que significa “ser oco, vazio”. Quando usada para referir-se a um indivíduo, está citando alguém de cabeça vazia, como no nosso coloquialismo cabeça-de-vento. Por implicação, ele está cha­ mando Jó de “homem de cabeça vazia”, sugerindo que não há mais possibilidade de uma pessoa assim tornar-se sábia, do que há de um asno gerar um ser humano.

Nos minutos seguintes, tente imaginar você no lugar dele, sen­ tado no depósito de lixo. Você perdeu tudo, inclusive a saúde. Não consegue dormir; não pode comer; está com febre, e tudo que é dito é desmoralizante e condescendente. Você está no ringue com seus críticos para realizar o terceiro round, deste primeiro ciclo de diálo­ gos, e as coisas estão piorando a cada minuto. Você está sendo chamado

138 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

agora de estúpido cabeça-de-vento por esse palhaço que sequer con­ segue ligar os pontos.

Warren Wiersbe escreve com grande discernimento:

Como é triste quando as pessoas que deveriam ministrar acabam criando desgraça (...)

Como é trágico que esses três amigos tenham se concen­ trado nas palavras de Jó em vez de nos sentimentos por trás delas.

Um provérbio chinês diz: “Embora conversando face a face, seus corações estão a mil quilómetros um do outro.” Como isso se aplica ao monte de cinzas! Afinal de contas, informa­ ção não é o mesmo que comunicação. Sidney J. Harris nos lembra: “Informar é transmitir, comunicar é chegar lá!”1

Você já trabalhou para uma pessoa assim? Talvez seja casado com uma. É uma existência terrível. Vocês podem conversar e viver juntos dia a dia, mas seus corações estão a mil quilómetros de distância. Nada realmente “chega lá”. Como isso se aplica ao monte de cinzas! Harris tem razão. Dar informação não deve ser confundido com comu­ nicação em profundidade.

Meu desejo ao escrever essas coisas é levá-lo a ficar do lado da pessoa que não tem um amigo em quem se apoiar. Jó é uma exceção — mesmo sem apoio ele persiste. Foi por isso que escolhi a palavra heróica para descrever a sua tolerância.

Ele recebe logo em seguida outra estocada de Zofar:

Se dispuseres o coração e estenderes as mãos para Deus; se lançares para longe a iniquidade da tua mão e não permitires habitar na tua tenda a injustiça, então, levantarás o rosto sem mácula, estarás seguro e não temerás.

Jó 11:13-15

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 139

O homem é agora acusado de ter um “defeito moral”. Além des­ sa denúncia incorreta, ele é condenado por falta de estabilidade e fé. De maneira notável, Jó permitiu que Zofar terminasse com estilo, sem interrompê-lo:

Pois te esquecerás dos teus sofrimentos e deles só terás lembrança como de águas que passaram. A tua vida será mais clara que o meio-dia; ainda que lhe haja trevas, serão como a manhã. Sentir-te-ás seguro, porque haverá esperança; olharás em derredor e dormirás tranquilo. Deitar-te-ás, e ninguém te espantará; e muitos procurarão obter o teu favor. Mas os olhos dos perversos desfalecerão, o seu refúgio pere­ cerá; sua esperança será o render do espírito.

Jó 11:16-20

Zofar conclui como se essas palavras fossem um resumo da situa­ ção. Mas, não, ele está voltando! Por sorte não vai ser por muito tempo. A arrogância de um homem tão legalista e crítico quanto Zofar é chocante.

Antes de vermos a resposta de Jó, quero salientar que Zofar comete um erro comum entre os legalistas. Embora reconheça corretamente a infinitude e grandeza de Deus e insista para que Jó compreenda tais verdades e entenda as suas implicações, ele exorta Jó a corrigir-se. Supõe com arrogância que sabe algo que Jó não está disposto a admitir. Este estaria guardando em segredo os seus peca­ dos, e Zofar estaria decidido a expô-los.

Nós cristãos podemos ser juizes severos, supondo que sabemos a razão de outros estarem passando por dificuldades. Além do mais, podemos pintar com cores sombrias as pessoas a quem criticamos por parecer que estão implicadas nos erros de outros. Devemos ficar com os fatos, não cedendo às suspeitas nem nos precipitando a falsas conclusões. É injusto considerar alguém como culpado por causa das falhas de outras pessoas ao seu redor.

140 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Um executivo da Arthur Andersen parou para conversar comigo após um culto para compartilhar o que estava aprendendo no estudo que desenvolvíamos sobre a vida de Jó. Feliz, comentou que estava sendo proveitoso. Ele destacou que sua corporação nada tinha a temer, pois operava de acordo com as leis, mas a campanha difamatória empreendi­ da pela mídia, no final de 2001, repercutida em todo o mundo, fez as pessoas desconfiarem da integridade dos funcionários desta corporação.

Quando explodiu o escândalo de Jim e Tammy Bakker na década de 1980, nosso ministério pelo rádio Insight for Living* teve uma queda de audiência durante um longo período de tempo. Embora eu nunca tivesse encontrado nenhum dos dois, nem concordasse ou tivesse participado desse estilo de trabalho religioso, muitos supuse­ ram culpa por associação. Que injustiça... É até ofensivo sugerir que, por causa de um exemplo extremo, todos sejam igualmente atingi­ dos. Qual a mensagem abrangente nisto? Tenha cuidado para não julgar com base em generalizações. Zofar teria sido mais prudente se primeiro examinasse os fatos antes de criticar um homem fiel como Jó. Teria sido muito melhor se ele discordasse dos dois colegas severos e defendesse a integridade de Jó. Os legalistas, infelizmente, quase nunca abandonam as suas fileiras.

JÓ RESPONDE A ZOFAR

Eu admiro sinceramente a coragem de Jó. Alegro-me por ele não desmoronar e dizer: “Talvez você tenha razão, Zofar. Você fala como aqueles outros dois homens, e não vou então discordar e discutir com você sobre isto.” Absolutamente, nao! A forte censura de Zofar encontra uma resistência ainda maior por parte de Jó. Este, a propó­ sito, é o único meio de lidar com um legalista. Eles são também como as baratas! Se deixá-los em paz e permitir que façam o que quiserem, eles proliferam. Atraem outros. Antes que se perceba, os legalistas dominam. Forçar a sua entrada na liderança é sua aborda­ gem favorita. Se não puderem intimidar, pegam a sua bola e seu taco e vão para outra freguesia (graças a Deus!). Vão embora.

* Transmitido no Brasil pela Rádio Transmundial com o nome “Razão para Viver”.

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 141

Houve uma época em minha vida na qual permiti que os legalistas me controlassem mais do que deviam. Estou tirando des­ forra do tempo perdido agora. A idade tem os seus benefícios. Aprendi do modo mais difícil que você precisa rebater tiro por tiro quando os legalistas estão determinados a tomar posse do territó­ rio. Jó não aceitava isso! Ele deu um basta a Zofar, como Paulo resistiu aos judaizantes legalistas, “aos quais nem ainda por uma hora nos submetemos”, afirma ele (G1 2:5).

Quando Jó resolve finalmente falar, ele diz, com efeito: “Muito bem. Isso é suficiente.” Ele os enfrentou. Admiro Jó por não ficar ali sentado mais tempo, só aparando os golpes lançados contra ele.

Quando Curt, nosso filho mais velho, estava no colegial, ele tocava flauta na banda da escola. No arranjo especial deles, os flautistas ficavam sentados na frente dos trombones. Naquela época, Curt estava no segundo ano, e havia um tocador de trombone atrás dele que não só estava numa série mais adiantada como era muito maior do que o nosso Curt. Era também um valentão. Você talvez não saiba que o trombone tem um “dispositivo para conter saliva” na extremidade do deslizador. É claro que os trombonistas amáveis tomam cuidado quando abrem essa válvula e sopram a saliva para fora do deslizador. A cortesia não era, porém, um dos pontos fortes na lista de virtudes daquele garoto grosseiro da escola secundária. Ele sentia uma satisfa­ ção cruel em abrir a válvula e soprar sua saliva sobre os ombros de Curt. Isso aconteceu durante alguns dias, até que nosso filho achou que já passava da conta. Ele voltou-se e disse ao valentão: “Não faça mais isso. Deixe de soprar sua saliva em mim.” O garoto em questão só estava esperando outra oportunidade e não demorou para repetir a proeza. Curt disse a ele: “Sabe, você vai desejar não ter feito isso se fizer mais uma vez.” Não se passaram dez minutos antes que o sujeito mandasse outra carga. Na mesma hora, Curt deu uma cotovelada contra o trombone dele - whomp - o que fez com que o bocal entras­ se com toda força em seus lábios, amolecendo dois dentes da frente. Na mesma hora, os lábios do valentão começaram a escorrer sangue queixo abaixo, enquanto Curt voltou a tocar sua flauta em silêncio.

142 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

O menino não pôde tocar trombone durante semanas e, surpreen­ dentemente, aquela foi a última vez que ele soprou cuspe em Curt. Quando Curt me contou isso, fiquei tão orgulhoso dele que aumen­ tei sua mesada.

A reação de Jó é como um cotovelo batendo no trombone de Zofar. E a sua maneira de dizer: “Não aguento mais você!”

A essa altura, Jó aprendera a ser sarcástico com os amigos. Ele começa com uma declaração exagerada: “Na verdade, vós sois o povo.” A propósito, a frase está no plural. “Na verdade, vocês são o povo, e com vocês morrerá a sabedoria. Que lástima! Todos vocês especialis­ tas vão morrer e não haverá mais sabedoria no planeta!” Essa não é uma fala extraordinária? “Vocês são realmente incríveis.”

Jó continua:

Na verdade, vós sois o povo, e convosco morrerá a sabedoria. Também eu tenho entendimento como vós; eu não vos sou inferior; quem não sabe coisas como essas?

Jó 12:2, 3

Gosto disso! Ele está dizendo como meu filho: “Você não vai conti­ nuar soprando seu cuspe em mim. Quem não sabe as coisas que vocês me disseram sobre o Deus vivo? Senhores, eu não nasci on­ tem. Aos seus olhos sou irrisão” (v. 4). Ele deu nome aos bois. Eles não tinham a ousadia de dizer o que pensavam a seu respeito e Jó sabia disso.

Eu sou irrisão para os meus amigos; eu, que invocava a Deus, e ele me respondia; o justo e o reto servem de irrisão.

Jó 12:4

Haveria uma ofensa maior na vida do que ser considerado pelos olhos de outra pessoa como uma “piada”? Provavelmente, não. Ainda mais uma vez que Jó fora realmente aquele que falara com o Deus Vivo,

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 143 aquele que compreendera quem ele é e quais os seus propósitos. To­ davia, era visto como alvo de riso aos olhos dos três.

A GRANDEZA DE DEUS

Jó demonstra o seu conhecimento dirigindo-se a Deus. Ele pede que seus amigos arrogantes visitem os animais do campo, os pássa­ ros do ar, os peixes do mar, e aprendam alguma coisa com essa viagem de pesquisa.

Qual entre todos estes não sabe que a mão do S enhor fez isto? Na sua mão está a alma de todo ser vivente e o espírito de todo o género humano.

Jó 12:9, 10

“Vem de Deus, Zofar. Tudo vem de Deus, Bildade e Elifaz. Ouçam-me! É Deus quem faz tudo. Não é possível explicar, mas os animais do campo reconhecem isto. Embutidos neles estão todos esses instintos dados por Deus. Se pudessem falar, eles poderiam contar-lhes a sua história.”

Jó passa então a apresentar a sua lista dos atos poderosos de Deus. Tome tempo para acompanhar seus pensamentos:

Com Deus está a sabedoria e a força; ele tem conselho e entendimento. O que ele deitar abaixo não se reedificará; lança na prisão, e ninguém a pode abrir. Se retém as águas, elas secam; se as larga, devastam a terra. Com ele está a força e a sabedoria; seu é o que erra e o que faz errar. Aos con­ selheiros, leva-os despojados do seu cargo e aos juizes faz desvairar. Dissolve a autoridade dos reis, e uma corda lhes cinge os lombos. Aos sacerdotes, leva-os despojados do seu cargo e aos poderosos transtorna. Aos eloquentes ele tira a palavra e tira o entendimento aos anciãos. Lança desprezo sobre os príncipes e afrouxa o cinto dos fortes. Das trevas manifesta coisas profundas e traz à luz a densa escuridade.

144 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Multiplica as nações e as faz perecer; dispersa-as e de novo as congrega. Tira o entendimento aos príncipes do povo da terra e os faz vaguear pelos desertos sem caminho. Nas tre­ vas andam às apalpadelas, sem terem luz, e os faz cambalear como ébrios. Eis que tudo isso viram os meus olhos, e os meus ouvidos o ouviram e entenderam.

Jó 12:13-13:1

Jó declara: “Tudo é sobre Deus! E o Deus inescrutável, Todo-Poderoso que tem controle sobre todas as coisas. Vocês pensam que não sei disso?” Que maneira criativa de dizer tal coisa! “O Deus que eu sirvo se agrada em desfazer as atividades humanas e desmantelar os seus empreendimentos. Durante esse processo, executa seus feitos mila­ grosos. Só ele tem o pleno controle.”

Jó está tornando claro que só Deus é aquele diante de quem ele se curva e, agindo assim, deixa implícito: “Não tenho certeza de que vocês já se encontraram com ele. Não me perturbem. Embora não possa responder por que estou sofrendo, posso dizer-lhes que de algum modo, de alguma forma, o Deus dos céus, o Deus silen­ cioso, aquele que parece ausente da minha perspectiva, ainda está no controle.”

E pensar que eles consideraram Jó um cabeça-de-vento estúpido!

A INTEGRIDADE DE JÓ

Jó repete então seu comentário anterior:

Como vós o sabeis, também eu o sei; não vos sou inferior.

Jó 13:2

Depois disso, ele aplica outro golpe verbal:

Mas falarei ao Todo-Poderoso e quero defender-me perante Deus. Vós, porém, besuntais a verdade com mentiras e vós

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 145 todos sois médicos que não valem nada. Tomara vos calásseis de todo, que isso seria a vossa sabedoria!

Jó 13:3-5

Em Provérbios 17:27, 28 encontramos apoio para o conselho firme de Jó:

Quem retém as palavras possui o conhecimento, e o sereno de espírito é homem de inteligência. Até o estulto, quando se cala, é tido por sábio, e o que cerra os lábios, por sábio.

Provérbios 17:27, 28

Este é um conselho útil que devemos lembrar. Se você abrir a boca, todos saberão que é um tolo. Se ficar calado, pensarão que é sábio. Era exatamente isso que Jó queria dizer. O silêncio deles poderia ter sido muito mais encorajador e reconfortante do que as suas palavras.

Por terem falhado em usar de comedimento verbal, Jó diz a eles o que são: “Médicos que não valem nada”. Olhe a acusação formal que se segue: “Ser-vos-ia bom se ele vos esquadrinhasse?” Grande pergunta. Ficamos imaginando se Zofar sequer a ouviu.

Tomara vos calásseis de todo, que isso seria a vossa sabedo­ ria! Ouvi agora a minha defesa e atentai para os argumentos dos meus lábios. Porventura, falareis perversidade em favor de Deus e a seu favor falareis mentiras? Sereis parciais por ele? Contendereis a favor de Deus? Ser-vos-ia bom, se ele vos esquadrinhasse? Ou zombareis dele, como se zomba de um homem qualquer? Acerbamente vos repreenderá, se em oculto fordes parciais. Porventura, não vos amedrontará a sua dignidade, e não cairá sobre vós o seu terror? As vossas máximas são como provérbios de cinza, os vossos baluartes, baluartes de barro.

Jó 13:5-12

146 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

DECLARAÇÃO DE FÉ FEITA POR JÓ

Leia a paráfrase desta seção da resposta de Jó escrita por Eugene Peterson em The Message (13:13-17):

Fiquem calados enquanto falo, depois aceitarei tudo que me estiver destinado.

Por que devo me arriscar assim e tomar minha vida em minhas mãos?

Porque, mesmo que ele me matasse, eu continuaria esperando, defenderia a minha inocência até o fim.

Espere um momento, isto vai colaborar para o bem — a minha salvação!

Se me sentisse culpado, vocês acham que estaria fazendo isto - me expondo diante de Deus?

Será melhor que fiquem atentos ao que estou dizendo, ouçam cuidadosamente com toda a atenção.

Agora que apresentei a minha defesa, estou certo de que serei absolvido.

Pode alguém provar as acusações contra mim?

Disse o que tinha a dizer e entrego a minha causa.

Jó 13:13-19, MSG (Tradução livre)

Depois dessas palavras, ele encerra temporariamente seus comentá­ rios aos amigos e se volta para o Deus que ama. Aquele com quem almeja uma audiência.

Jó conclui sua resposta, abrindo o coração diante de Deus. Não oculta nada enquanto declara seu sofrimento e confusão mental.

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 147

Concede-me somente duas coisas; então, me não esconde­ rei do teu rosto: alivia a tua mão de sobre mim, e não me espante o teu terror. Interpela-me, e te responderei ou dei­ xa-me falar e tu me responderás. Quantas culpas e pecados tenho eu? Notifica-me a minha transgressão e o meu pecado. Por que escondes o rosto e me tens por teu inimigo? Queres aterrorizar uma folha arrebatada pelo vento? E perseguirás a palha seca? Pois decretas contra mim coisas amargas e me atribuis as culpas da minha mocidade. Também pões os meus pés no tronco, observas todos os meus caminhos e traças limites à planta dos meus pés, apesar de eu ser como uma coisa podre que se consome e como a roupa que é comida da traça. O homem, nascido de mulher, vive breve tempo, cheio de inquietação.

Jó 13:20-14:1

A Bíblia Viva interpreta a última linha: “Como é curta a vida do homem, cheia de medo e sofrimento!” Eu consideraria este um comentário exato sobre a vida.

Jó usa então três figuras de palavras para descrever-se: “uma flor, uma sombra e um jornaleiro [empregado]”. Todos os seres humanos são frágeis como a flor, fugazes como a sombra e cheios de problemas como um empregado. Isto constitui uma vulnerabilidade total, desprotegida. Jó não acredita mais em sua melhora e se precipita então para a vida do além.

Porque há esperança para a árvore, pois, mesmo cortada, ainda se renovará, e não cessarão os seus rebentos. Se enve­ lhecer na terra a sua raiz, e no chão morrer o seu tronco, ao cheiro das águas brotará e dará ramos como a planta nova.

Jó 14:7-9

Quando você limpa um campo, o lenhador experiente irá aconse­ lhá-lo a remover os tocos. Não os deixe no solo. Se deixar um toco,

148 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

ele logo brota quando a chuva cai. A árvore vai voltar; até o arbusto crestado volta a ficar verde. As plantas, as árvores são assim. Mas e o homem?

A depressão de Jó transparece outra vez. Ele diz aquilo em que acredita, baseado no que sabe.

O homem, porém, morre e fica prostrado; expira o homem e onde está? Como as águas do lago se evaporam, e o rio se esgota e seca, assim o homem se deita e não se levanta; en­ quanto existirem os céus, não acordará, nem será despertado do seu sono. Que me encobrisses na sepultura e me ocultas­ ses até que a tua ira se fosse, e me pusesses um prazo e depois te lembrasses de mim! M orrendo o homem, porventura tornará a viver?

Jó 14:10-14

Este é um livro antigo, escrito durante a era patriarcal, quando o progresso da revelação mal começara a seguir o seu curso. Jó sabe muito pouco sobre a doutrina da ressurreição. Compreenda que as palavras de Jó não têm o propósito de sugerir tudo que há para saber sobre a ressurreição, de modo algum. Temos uma Bíblia inteira repleta de novas verdades. O progresso da revelação oferece noções cada vez maiores sobre qualquer assunto, de modo que hoje podemos descre­ ver muito bem o que acontece na morte, como além dela. Graças a novas revelações, sabemos agora muito mais sobre os destinos finais no céu e no inferno. Mas e naquela época? Havia mais perguntas do que respostas. Jó pergunta, portanto, sinceramente:

Morrendo o homem, porventura tornará a viver? Todos os dias da minha luta esperaria, até que eu fosse substituído.

Jó 14:14

O capítulo termina numa espécie de choramingo deprimido. A Bíblia The Message interpreta desta maneira:

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 149

Da mesma forma, as montanhas se desfazem e as rochas se desgastam, as pedras são alisadas e o solo sofre erosão, enquanto tu impiedosamente destróis nossas esperanças.

Não podemos competir contigo.

Como sempre, é tua a última palavra.

Não gostamos disso e nossos rostos mostram o que sentimos; mas tu nos mandas para o outro lado de qualquer jeito.

Se nossos filhos prosperarem, não ficamos sabendo; se fracassarem, é-nos poupado o sofrimento.

Corpo e alma, tudo se resume nisso para nós —

Uma vida de dores, uma vida de pesares.

Jó 14:18-22, MSG (Tradução livre)

Chegamos repentinamente ao fim da resposta de Jó. Sabemos que, quando morremos, continuamos a viver. O próprio Jesus ensinou: “Eu sou a ressurreição e a vida. Quem crer em mim, ainda que morra, viverá; e todo o que vive e crê em mim, não morrerá, eternamente” (Jo 11:25, 26).

De fato, todos viveremos eternamente, mas nossos destinos são diferentes. Alguns passarão a eternidade com Deus no céu, outros passarão a eternidade sem Deus no inferno. Eles representam as duas alternativas e são objeto de reflexão. É verdade, Jó, quando morrer­ mos viveremos novamente. De fato, continuaremos vivendo. Mas, até este ponto, Jó tem só perguntas.

TRÊS PERGUNTAS QUE VOCÊ DEVE RESPONDER

Vamos ficar com as perguntas enquanto encerramos este capítulo. Três delas nos vêm à mente - três perguntas que instigo você a considerar.

150 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Pense sobre elas. Cada uma merece a sua atenção. Uma tem a ver com profundidade; outra, com descoberta; e a terceira, com destino.

Primeira: Você está buscando conhecer as profundezas de Deus, ou fica apenas na superfície?

Porventura, desvendarás os arcanos de Deus ou penetrarás até à perfeição do Todo-Poderoso? Como as alturas dos céus é a sua sabedoria; que poderás fazer? Mais profunda é ela do que o abismo; que poderás saber?

Jó 11:7, 8

Vou repetir a pergunta: Você está buscando conhecer as profundezas de Deus, ou fica apenas na superfície? Só você sabe a resposta. Nossa cultura atual é tão ocupada que nos tornamos especialistas em fingimento. Pode parecer que estamos nos aprofundando quando na verdade apenas evitamos discutir o assunto. Você deve então respon­ der por si mesmo. Está procurando conhecer as profundezas de Deus? Ou percebe que está apenas comparecendo a uma porção de encon­ tros religiosos, lendo alguns livros religiosos, e aprendendo toda a linguagem aparentemente religiosa?

Em um dos últimos livros de Larry Crabb, com o título Chega de Regras, ele escreve o seguinte:

No sentido da cultura, o cristianismo de nossos dias rede­ finiu a maturidade espiritual. Os reformadores sabiam que fomos salvos para dar glória a Deus. Nós, modernos, vive­ mos para ser abençoados. Os amadurecidos dentre nós são agora considerados bem-sucedidos, felizes, pessoas compe­ tentes, estão em evidência e se dão bem (...) Somos mais atraídos por sermões, livros e conferências que revelam os segredos da satisfação (...) do que pela direção espiritual que nos leva através da aflição à presença do Pai (...)

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM 151

Parecemos mais interessados em ter uma existência confortável do que em permitir que Deus nos transforme espiritualmente mediante as dificuldades da vida.2

Isso nos atinge frontalmente, não é? Não fuja das dificuldades. Não procure um amigo que o ajude a sair delas rapidamente. Permaneça nelas. O Senhor Deus o fará atravessá-las. Como resultado, você deixa de escorregar. Esta pergunta é para você responder: você está buscando as profundezas de Deus, ou está apenas tocando a superfície?

A seguir, por favor, releia Jó 13:9:

Ser-vos-ia bom, se ele vos esquadrinhasse? Ou zombareis dele, como se zomba de um homem qualquer?

Agora a pergunta: Estará tudo em ordem quando Deus examinar a sua vida, ou será uma descoberta decepcionante? Repito, não posso falar por você porque não tenho idéia. Mas uma coisa sei: “Porque importa que todos nós compareçamos perante o tribunal de Cristo, para que cada um receba segundo o bem ou o mal que tiver feito por meio do corpo” (2 Co 5:10). Vai ser uma descoberta decepcionante, ou estará tudo em ordem com você? Este é um pensamento esquadrinhador, e foi por isso que insisti em que prestasse séria atenção nessas perguntas.

Vamos então à terceira questão. Leia Jó 14:14 outra vez:

Morrendo o homem, porventura tornará a viver? Todos os dias da minha luta esperaria, até que eu fosse substituído.

Veja no que quero que pense: Quando você morrer, onde viverá de novo? Será junto do Senhor ou longe da sua presença para sempre? As escolhas são aquelas que já descrevi antes neste capítulo: céu ou infer­ no. Será uma bênção eterna, cheia de alegria, de alívio e também das recompensas que aguardam o povo de Deus? Ou será o julgamento

152 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

eterno, afastado de Deus e de tudo que você aprecia? Só você pode determinar para onde vai. C. S. Lewis escreveu:

Não há doutrina que eu mais desejaria remover do cristia­ nismo do que a doutrina do inferno, se isso fosse possível para mim. Ela tem, no entanto, completo apoio das Escri­ turas e especialmente das palavras do Senhor; foi sempre seguida pela cristandade e tem o apoio da razão.3

C. S. Lewis não era um intelectual facilmente influenciável. Suas palavras merecem séria consideração. Comecei este capítulo descre­ vendo como os problemas têm um modo especial de se multiplicar. A boa notícia é que isto só se aplica a esta vida - “Quão frágeis... Quão breves os nossos anos... Quão cheios de problemas”. Uma vez que estejamos na presença do Senhor, porém, tudo isso muda.

Por outro lado, se você decidir ignorar a oportunidade de asse­ gurar esta esperança, os resultados alternativos serão praticamente inconcebíveis. Se refletirmos bem, esse tipo de futuro tornaria as pro­ vações de Jó simplesmente triviais. Quem quer um destino desses?

Não vá para lá!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que conflito não resolvido na sua vida tem crescido em vez de diminuir, como as baratas que não se consegue ignorar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando a censura dos outros colide com a sua resistência interior, como você guarda o coração para não endurecer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante de acusações injustas, o que ajuda você a continuar firme sem cair na amargura?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Palavras Maldosas para um Sofredor$t$, 14,
$conteudo$S e você for como eu, há manhãs em que se levanta com uma can­ ção vibrando em sua mente, e ela volta a toda hora, o dia inteiro. Isso me aconteceu na última quinta-feira. Continuou à tarde e na sexta pela manhã. Enquanto me achava sentado em meu escritório, a música de uma velha canção sacra cantada pelos negros do sul dos Estados Unidos ficou soando em minha cabeça:

Céu, Céu

Todos falam sobre o Céu e não vão para lá

Céu, Céu

Vou gritar em todo o Céu de Deus.1

Quanto mais essas palavras passavam pela minha mente, tanto mais estranhas pareciam. Enquanto me lembrava dos rostos sorridentes de antigos membros do coral, cantando sobre não ir para o céu, ficava pensando por que eles sorriam. Isso me fez recordar a maneira como

154 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

falamos sobre a graça. Todo mundo falando sobre graça, mas não indo lá também). Não é interessante? Aonde quer que vamos, ouvimos falar da graça, mas a maioria das pessoas não reconheceria a graça, mesmo que a encontrasse face a face. Quase ninguém está preparado para aceitá-la, mesmo quando lhe é apresentada.

Há não muito tempo, um aluno de uma faculdade do Missouri escreveu isto num e-mail\

Saí cedo do trabalho para estudar um pouco sem ser interrom­ pido antes do exame final de minha classe. Quando entrei na sala, todos estavam terminando seu estudo de última hora. O professor entrou e disse que faria uma recapitulação conosco pouco antes da prova. Fizemos a revisão, a maior parte constante da apostila, mas havia algumas coisas que eu nunca ouvira. Quando perguntado sobre isso, ele disse que estavam no livro e que éramos responsáveis por tudo nele contido. Não podíamos realmente discutir a respeito.

Chegou finalmente a hora da prova.

“Deixem a folha com a face para baixo na carteira até que todos tenham recebido a sua e eu avise para começarem”, instruiu o professor.

Quando virámos a folha, todas as respostas estavam preen­ chidas! A parte de baixo da última página dizia o seguinte:

“Este é o fim da Prova Final. Todas as respostas no seu teste estão certas. Você vai receber um “A” na última prova. A razão para ter passado no exame é porque o criador do teste o fez por você. Todo o trabalho de preparação para este teste não o ajudou a ganhar um A’. Você acabou de experimen­ tar...graça. ”

Ele percorreu então a classe e perguntou a cada aluno: “Qual é a sua nota? Você merece a nota que está recebendo? Até que ponto seus estudos finais para este exame ajudaram você a tirar essa nota?”

PALAVRAS MALDOSAS PARA UM SOFREDOR 155

Eu não costumo chorar com facilidade, mas tive de lutar com as lágrimas ao responder àquelas perguntas e pensar em como o Criador fizera o teste por mim.

A discussão mais tarde foi esta: “Tentei o semestre inteiro ensinar a vocês que são um recipiente da graça. Tentei comu­ nicar a vocês que devem demonstrar este dom no trabalho com jovens. Não os forcem; eles não são o inimigo. Aju­ dem-nos, pois irão continuar o seu ministério se ele estiver cheio de graça!”

Ao comentar que alguns haviam provavelmente estudado durante horas, enquanto outros apenas alguns minutos, mas que todos receberam a mesma nota, ele lembrou uma histó­ ria contada por Jesus em Mateus 20. O dono de uma vinha contratou pessoas para trabalhar em seu campo e concor­ dou em pagar-lhes certa quantia. Várias vezes durante o dia ele contratou rriais empregados. Quando chegou a hora do pagamento, todos receberam a mesma importância em di­ nheiro. Quando os que haviam sido contratados cedo pela manhã começaram a reclamar, o dono respondeu: “Você se zanga porque eu sou bondoso?” (Mt 20:15, A Bíblia Viva).

O professor disse que nunca havia feito aquele tipo de final antes e que provavelmente jamais o repetiria; mas, por cau­ sa do conteúdo de muitas de nossas discussões em classe, ele achava que devíamos experimentar graça.2

Depois de ler sobre esse caso verídico, pensei: “Por que não tive um professor assim por ocasião de todos os meus exames finais?”

Parece que todos estão falando sobre graça estes dias, mas não entendem bem o que isso significa.

Gostamos de recebê-la de Deus, mas não esperamos que seja oferecida por pessoas decaídas como nós. E mesmo quando isso acon­ tece, ficamos chocados. Que pena!

156 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Dentre todas as coisas que Jó teve de suportar, o teste final foi Sofrer as palavras maldosas, carentes de graça, de seus supostos amigos.

Acabamos de completar neste ponto o primeiro ciclo de insultos feitos por Elifaz, Bildade e Zofar. Como vimos, Jó respondeu a cada homem, sem dúvida esperando que cessassem todas as suas acusações impiedosas. Não conseguiu nada.

UMA DECLARAÇÃO CRUEL SEGUE-SE A OUTRA

No segundo ciclo, que começa no capítulo 15 do Livro de Jó, Elifaz %a as luvas e começa a dar golpes com as mãos nuas, achando que ^stá na hora de uma luta séria. Por mais difícil que seja imaginar, não há sequer um sinal de graça. Trata-se agora de “mesma música, quar­ to verso... poderia ser melhor... mas vai ficar pior”. Muito pior.

(/ma Ladainha de Reprovações

Elifaz atira mais golpes verbais no primeiro round deste segundo ci­ clo. São apenas palavras despojadas de graça para um homem que sofre. No caso de estar se perguntando que tipo de palavras são essas, elas começam com orgulho.

Porventura, dará o sábio em resposta ciência de vento? E encher-se-á a si mesmo de vento oriental.

Jó 15:2

As palavras “si mesmo”szo realmente “barriga” em hebraico. Deveria um homem sábio (Elifaz, naturalmente) encher a barriga com uma Porção de vento? O orgulho de Elifaz é seguido por um insulto. Ainda r<Terindo-se à sua pessoa, ele diz,

Arguindo com palavras que de nada servem e com razões de que nada aproveita? Tornas vão o temor de Deus e diminuis a devoção a ele devida.

Jó 15:3, 4

PALAVRAS MALDOSAS PARA UM SOFREDOR 157

Depois vem a culpa:

Pois a tua iniquidade ensina à tua boca, e tu escolheste a língua dos astutos.

Jó 15:5

(Você, seu enganador.)

A tua própria boca te condena, e não eu; os teus lábios testificam contra ti.

Jó 15:6

Portanto, há também condenação.

Nos versículos seguintes encontramos exagero e sarcasmo, onde uma pergunta humilhante segue-se a outra.

Es tu, porventura, o primeiro homem que nasceu? Ou foste formado antes dos outeiros? Ou ouviste o secreto conselho de Deus e a ti só limitaste a sabedoria? Que sabes tu, que nós não saibamos? Que entendes, que não haja em nós?

Jó 15:7-9

Você pode imaginar o rancor consumado necessário para ficar diante de um homem tremulo, destroçado pela dor, e descarregar uma crí­ tica assim violenta sobre ele? Trata-se de abuso verbal em seu mais baixo nível, intensificado pelo orgulho no coração desse homem que está desferindo tão impiedosamente tais golpes.

O interrogatório sarcástico continua:

Porventura, fazes pouco caso das consolações de Deus e das suaves palavras que te dirigimos nós? Por que te arrebata o teu coração? Por que flamejam os teus olhos, para voltares

158 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

contra Deus o teu furor e deixares sair tais palavras da tua boca? Que é o homem, para que seja puro? E o que nasce de mulher, para ser justo? Eis que Deus náo confia nem nos seus santos; nem os céus são puros aos seus olhos, quanto menos o homem, que é abominável e corrupto, que bebe a iniquidade como a água!

Jó 15:11-16

Ele despedaça Jó com seus dentes afiados, sem interromper-se para dar ao homem que sofre uma oportunidade de resposta.

Lembranças dos Erros

Depois de repreendê-lo, ao terminar seu discurso, Elifaz lembra o destino dos perversos. Ele diz, com efeito: “Jó, você se retorce de dor porque é perverso. Essa a razão do seu sofrimento. Está recebendo apenas o que merece.”

O sonido dos horrores está nos seus ouvidos; na prosperida­ de lhe sobrevêm o assolador. Não crê que tornará das trevas, e sim que o espera a espada.

Jó 15:21, 22

“Meus amigos e eu não estamos, porém, surpresos pelo fato de você estar passando por tanto terror, perda e tormento.”

Por pão anda vagueando, dizendo: Onde está? Bem sabe que o dia das trevas lhe está preparado, à mão. Assombramno a angústia e a tribulação; prevalecem contra ele, como o rei preparado para a peleja.

Jó 15:23, 24

“Não é de admirar que você esteja experimentando essa aflição e angústia profundas.”

PALAVRAS MALDOSAS PARA UM SOFREDOR 159

Porque estendeu a mão contra Deus e desafiou o TodoPoderoso.

Jó 15:25

“É isso, Jó! E a sua insolência!” Elifaz recua e olha fixamente para ele, repetindo: “Você está recebendo exatamente o que merece!”

O estilo de comunicação de Elifaz não é tão extraordinário para os que não possuem graça. E possível que não seja sempre assim brutal, mas você já não notou este tom quando rodeado por pessoas sem esse predicado? Quando você está por baixo, elas lhe dão um chute. Quan­ do está se afogando, empurram você para dentro d’água. Quando está confuso, complicam a sua vida. E quando está quase no fim, elas o dão por perdido. A não ser isso, são ótimas pessoas.

É fácil se esquecer do sofrimento que Jó estava tentando suportar - a perda inconcebível de seus filhos adultos. A libertação das garras do sofrimento causado por uma morte súbita sempre cobra um pre­ ço enorme.

A Dra. Lucy Mabry-Foster, nossa amiga de muito tempo, morreu de repente na primavera de 2002. As tragédias não eram estranhas para Lucy e sua família. O primeiro marido dela, Dr. Trevor Mabry, morrera num desastre de avião quando voltava de um retiro da Focus on the Family em Montana. Trevor era um esplêndido cirurgião, es­ pecializado em laringologia, tendo feito seus estudos na Clínica Mayo e passado mais tarde a exercer a profissão na área de Dallas. Quatro excelentes homens de Deus morreram na queda daquele avião.

O filho mais velho dos Mabry, Dan, estava em lua-de-mel na época. Ao saber que o avião não regressara como programado, Dan imediatamente voltou para casa e se juntou ao grupo de busca, esperando encontrar sobreviventes. Os membros da família, porém, tiveram finalmente de aceitar a trágica realidade de que seu marido e pai perecera no acidente fatal.

A cidade de Dallas cobriu-se de luto ao saber das várias mortes pelas manchetes dos jornais. Todos nós que conhecíamos e

160 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

amávamos aqueles homens fomos envolvidos pela incredulidade, tristeza e sofrimento.

Lucy decidiu que não se deixaria abater. A comunidade cristã e sua família a cercaram de amor e apoio. Todos os filhos ficaram junto da mãe enquanto sofriam com ela sua grande perda. Durante os dez anos que se seguiram, Lucy terminou sua educação, obteve seu doutorado e tornou-se a primeira professora do Seminário Teo­ lógico de Dallas. Sua determinação através de anos de sofrimento foi de fato maravilhosa.

O Senhor finalmente fez com que um cristão especial se apro­ ximasse dela, C. L. Foster, do sul do Texas. No decorrer de vários meses, C. L. e Lucy se apaixonaram. Cynthia e eu comparecemos ao casamento deles. Todos ficamos gratos ao ver como Deus fora generoso. Essa união foi uma alegria para todos.

Cinco anos mais tarde, numa manhã de domingo, Lucy deu seu último suspiro nos braços do marido a quem tanto amava. Eles se achavam numa ambulância, correndo para o hospital na esperança de salvar a vida dela. Ela foi sepultada na quinta-feira seguinte. O falecimento repentino de nossa amiga foi quase surpreendente demais para acreditar.

Tive o privilégio de conversar por mais de duas horas com a família que já passara pela morte trágica do pai e agora aqueles mesmos três tinham de lidar com a morte súbita da mãe. C. L., que perdera a primeira esposa num acidente de carro, ficou sentado silenciosamente ao lado deles. Era possível ver as rodas da vida girando enquanto as lágrimas caíam de seus olhos. O sofrimento misturado com o choque os deixou aturdidos.

C. L. Foster e aqueles filhos adultos não precisavam de qualquer censura ou condenação. Não precisavam ser acusados, nem que lhes fizessem perguntas insultuosas, humilhantes. Eles precisavam de con­ solo e simpatia sincera. Em uma palavra, precisavam de graça.3

Não posso deixar de lembrar-me disso quando vejo Jó, enquanto ele fica ali sentado, envolvido em seu sofrimento, tentando ao máxi­ mo crer em seus ouvidos: aquele homem que fora antes um amigo,

PALAVRAS MALDOSAS PARA UM SOFREDOR 161

dizendo agora palavras tão carentes de graça. Só me resta um pensa­ mento: “Senhor, se estiver ensinando alguma coisa para nós mediante a paciência de Jó, peço que ensine o valor da graça. Ensine como demonstrar graça. Mostre-nos outra vez que a graça é sempre apro­ priada. Sempre necessária. Não só para um aluno no Missouri fazendo uma prova final. Não só para uma família sofredora em Dallas. Todos precisamos dela! A pessoa ao seu lado na igreja no próximo domingo, a mulher empurrando o carrinho no supermercado, alguém colocando gasolina no posto, o homem atrás de você na fila do cinema, esperando para comprar sua entrada, o aluno à sua frente na escola. Você não tem idéia do que essa pessoa está enfrentando. Se soubesse, é provável que fosse levado a m ostrar graça ou dizer algumas palavras encorajadoras mais depressa ainda. Lembre-se disto, por favor: A graça é sempre apropriada, sempre necessária!

A RESPOSTA FIRME DE JÓ

Estou começando a admirar silenciosamente Jó. Por exemplo, agora. Ele ouviu e respondeu. Disse, na verdade: “Quer lutar com as mãos nuas? Eu aceito. Minhas mãos podem estar cobertas de feridas, mas farei como você e vou tirar as luvas.”

Encontrei quatro respostas de Jó que são tanto admiráveis como realistas. Eu não as considero chocantes, embora você talvez seja des­ sa opinião.

Ele Está Desgostoso

Em primeiro lugar, Jó está desgostoso com Elifaz e tem razão! Ele decide não ficar sentado e levar outro soco na cara desse homem desrespeitoso e cheio de orgulho. O auto-respeito de Jó se alteia. “Todos vós sois consoladores molestos” (Jó 16:2). O que dizer dessa fala inicial para exprimir desgosto? Boa descrição: consoladores molestos. Que oximoro! Vocè talvez não conheça esse termo. O dicioná­ rio define oximoro como “uma combinação de palavras contraditórias”, como por exemplo obscura claridade, música silenciosa. Vejamos outra: submissão adolescente. Consoladores molestos! “Vocês acham que

162 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

isto é consolo? Que grupo triste de consoladores são vocês, Elifaz, Bildade e Zofar!”

Alguém descreve a cena deste modo:

Jó reclama que ele já ouviu muitas coisas desse tipo à medida que os consoladores falam. No entanto, em suas dificulda­ des presentes essas atitudes piedosas servem apenas para aumentar sua tristeza. Ele acusa então os amigos de serem consoladores molestos (...) Consoladores molestos é um oximoro pungente; isto é, quanto mais palavras de consolo dizem, tanto mais dor infligem. O diálogo marca a diferença entre a perspectiva de Jó e a de Elifaz. Enquanto Elifaz acredita que os discursos dos amigos são consolações do próprio Deus (15:11), Jó os considera arautos do infortúnio. Enquanto Elifaz conclui seu discurso com o aforismo, “Concebem a malícia (...)dão à luz a iniquidade” (15:35a), Jó retruca que a teologia deles é que concebe a malícia e produz miséria nele.

Com uma pergunta retórica mordaz, Jó acusa Elifaz de pro­ nunciar palavras de vento (...) isto é, um discurso eloquente despido de conteúdo. Ele está se opondo diretamente à crítica de Elifaz de que seu conhecimento não passa de ciência de vento (15:2) e a réplica de Bildade de que suas palavras são um vento impetuoso (8:2). A seguir, Jó pergunta a Elifaz o que o instiga tanto para ele responder como faz. Jó não consegue entender por que Elifaz está tão aborrecido com ele.4

Nenhum pagamento extra por este lembrete. As pessoas que não possuem graça e são insultuosas não conseguem enxergar as coisas se você não for igualmente firme em sua resposta. Algumas vezes então, como Jó, você tem de aplicar um golpe verbal na cabeça delas. A fim de ter certeza de que está sendo entendido, há ocasiões em que você deve combater o fogo com fogo. Tem de ser também áspero; caso contrário, irão pisar em você e agredi-lo violentamente.

PALAVRAS MALDOSAS PARA UM SOFREDOR 163

Isso explica porque Jó os chama de “consoladores molestos”. Ele não sorri e finge piedade — responde sinceramente. Sua integridade se revela em sua honestidade.

Falar a verdade prevalece sobre a verborragia confusa, vaga, apa­ rentemente bondosa, que no geral caracteriza uma porção de clichés religiosos. É por isso que insisto tanto para que todos aprendamos a falar a verdade, idealmente em amor. Permita-me acrescentar aqui: se eu tiver de fazer uma escolha do tipo ou/ou, vou falar a verdade. E melhor com amor, isso é claro, mas a verdade é absolutamente essen­ cial. “A verdade machuca” é um ditado familiar. Repito, porém: há ocasiões em que seus golpes simples, sem enfeites, são necessários. Algumas vezes nós é que temos necessidade de ouvi-los. Um bom exemplo é quando você perde o emprego — e você foi a causa. Se houver verdade na comunicação, a pessoa que estiver despedindo você nesse momento estará dizendo coisas que você jamais esquecerá. Ele ou ela estará, cortando todo o verniz do fingimento e lidando com a razão específica de você ter perdido o emprego. Esteja certo de que estará ouvindo a verdade, por mais difícil que seja aceitá-la. Ela o ajudará, se você aceitá-la e fizer as mudanças necessárias.

Neste caso, Jó está dizendo a Elifaz: “Suas declarações são incorretas. Você me julgou mal, e seu raciocínio é falso. Além do mais, as palavras que empregou são duras, e, portanto, estou lhe dizendo que você é um consolador molesto.”

Ele Está Angustiado

Jó não está só desgostoso com Elifaz, como também aflito com a ausência aparente de Deus e com seu silêncio muito óbvio. Isto pode parecer chocante para quem ler estas palavras, mas acontece, espe­ cialmente entre os que estão sofrendo. Tenha isso em mente enquanto lê as palavras angustiadas de Jó:

Na verdade, as minhas forças estão exaustas; tu, ó Deus, destruíste a minha família toda. Testemunha disto é que já me tornaste encarquilhado, a minha magreza já se levanta contra mim e me acusa cara a cara. Na sua ira me despeda­ çou e tem animosidade contra mim; contra mim rangeu os dentes e, como meu adversário, aguça os olhos. Homens abrem contra mim a boca, com desprezo me esbofeteiam, e contra mim todos se ajuntam. Deus me entrega ao ímpio e nas mãos dos perversos me faz cair. Em paz eu vivia, porém ele me quebrantou; pegou-me pelo pescoço e me despeda­ çou; pôs-me por seu alvo. Cercam-me as suas flechas, atravessa-me os rins, e não me poupa, e o meu fel derrama na terra. Fere-me com ferimento sobre ferimento, arremete con­ tra mim como um guerreiro. Cosi sobre a minha pele o cilício e revolvi o meu orgulho no pó. O meu rosto está todo afogueado de chorar, e sobre as minhas pálpebras está a sombra da morte, embora não haja violência nas minhas mãos, e seja pura a minha oração. Ó terra, não cubras o meu sangue, e não haja lugar em que se oculte o meu cla­ mor! Já agora sabei que a minha testemunha está no céu, e, nas alturas, quem advoga a minha causa. Os meus amigos zombam de mim, mas os meus olhos se desfazem em lágri­ mas diante de Deus, para que ele mantenha o direito do homem contra o próprio Deus e o do filho do homem contra o seu próximo. Porque dentro de poucos anos eu seguirei o caminho de onde não tornarei. O meu espírito se vai consu­ mindo, os meus dias se vão apagando, e só tenho perante mim a sepultura.

Jó 16:7-17:1

Palavras fortes, profundamente emocionais de um homem angustiado.

Se você considera Jó digno de crítica, é porque nunca passou por esses lances. Não há conselheiro que tenha trabalhado muito tempo nessa área que não encontre alguém angustiado com a maneira como Deus o tratou. Suas palavras sao fortes, cheias de aflição, por não compreender como um Deus amoroso, gracioso, pode permitir que eventos tão devastadores aconteçam a alguém que lhe pertence.

PALAVRAS MALDOSAS PARA UM SOFREDOR 165

Lembre-se: Jó continua sem saber do trato entre Satanás e Deus. Somos apresentados a ele muito cuidadosa e claramente antes de o trato ocorrer. Mas Jó não tinha essa informação. Ele ainda não sabe por que um dia, completamente do nada, as coisas aconteceram, provocando tornados e incêndios, destruição e várias mortes, e finalmente doença. Deus não lhe dá qualquer palavra de explica­ ção. Lembre-se: em toda a sua vida adulta Jó andou com Deus. Ele foi obediente e submisso — e agora isto! Não é de admirar que esteja aflito.

Vou confessar a você: já passei por esse tipo de confusão, mas certamente não como o de Jó. Durante essas crises, afirmei em mo­ mentos irrefletidos: “Deus, o que o Senhor está pretendendo? Não fiz nada de errado, nem pelo motivo errado. Não entrei nisto para agradar a mim mesmo ou impressionar alguém. Estou tentando andar em obediência. Mas nada deu certo! O que está havendo, Senhor?”

E como voltar para casa do trabalho, depois de um dia terrível no escritório. No trânsito pára-choque com pára-choque, o sujeito de trás bate em você. Você bate no da frente, e acontece de se tratar de um Porsche novo. Os donos de carros Porsche não gostam quando você bate na traseira deles. É feito um Boletim de Ocorrência. O dono do Porsche fica tao zangado que ameaça processá-lo, e quando você chega finalmente em casa, o leite acabou. Seu cachorro está com fome e andou roendo o armário. Seus filhos estão brigando. A corres­ pondência traz uma porção de contas por pagar, e você não tem dinheiro. Sua mulher avisa que recebeu o resultado da biópsia. O médico quer que vocês dois vão vê-lo pela manhã. Essa foi a gota d’água. Você pensa: “O que será isto, Deus? Onde o Senhor está?”

Nada de resposta... O dia seguinte é pior do que o de hoje. A semana que entra intensifica as coisas. Além disso tudo, você está prestes a perder o emprego. E o sujeito do Porsche processa realmente você. E... E... E... E...

Em momentos descuidados, quando as luzes estão apagadas, as portas fechadas, seu pastor não está por perto para ouvir e ninguém

166 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

vai dedurar você, então você se entrega e começa a imaginar. É es­ quisito se você não fizer isso. Não me diga que é espiritual demais para pensar assim. Da mesma forma que Jó, seu espírito está que­ brantado, seus dias deixam você exausto e confuso. E como se a sua sepultura estivesse cavada e esperando seu corpo. O resultado? Jó está outra vez deprimido. E como alguém poderia surpreender-se com isso?

O que levou Jó, especificamente, a esse ponto de depressão? Creio que estas palavras latinas, Deus absconditus, expressam melhor a idéia. Aprendi essas palavras esta semana. Deus é o termo latino para Deus [o mesmo que em português]. Absconditus é o nosso absconder. O dicionário diz que significa “ocultar, partir em segredo, esconder-se”. Deus dividiu secretamente a cena. E isso, exatamente!

“Ele partiu. Não consigo entendê-lo. Quando oro, não obtenho respostas. Quando me dedico ainda mais a fazer a vontade dele por todas as razões certas, continuo na mesma. Quando oro, nada acon­ tece. Deus se abscondeu com as bênçãos.”

C. S. Lewis descreve perfeitamente a frustração em A G rief Observed:

Enquanto isso, onde está Deus? Este é um dos sintomas mais inquietantes. Quando você está feliz, tão feliz que não sente que precisa dele (...) você será — ou é essa a sen­ sação — recebido de braços abertos. Mas aproxime-se dele quando a sua necessidade é desesperada, quando toda ou­ tra ajuda é vã, e o que você encontra? Uma porta fechada na sua cara e o som de ferrolhos e mais ferrolhos do lado de dentro. Depois disso, silêncio. Você pode na verdade ir embora. Quanto mais fica esperando, tanto mais enfático o silêncio.5

Deus absconditus. Isto expressa o problema sem quaisquer enfeites literários. Jó chegou ao fundo. Desgostoso, aflito, deprimido, ele está pronto para morrer. Portanto...

PALAVRAS MALDOSAS PARA UM SOFREDOR 167

Está Desanimado

Poderíamos chamar as seguintes palavras de Réquiem de Jó.

Os meus dias passaram, e se malograram os meus propósi­ tos, as aspirações do meu coração. Convertem-me a noite em dia, e a luz, dizem, está perto das trevas. Mas, se eu aguardo já a sepultura por minha casa; se nas trevas estendo a minha cama; se ao sepulcro eu clamo: tu és meu pai; e aos vermes: vós sois minha mãe e minha irmã, onde está, pois, a minha esperança? Sim, a minha esperança, quem a poderá ver? Ela descerá até às portas da morte, quando juntamente no pó teremos descanso.

Jó 17:11-16

Desgostoso

Desamparado

Deprimido

Desanimado

O homem chegou realmente ao fundo do poço. A morte parece ser o seu último recurso, o único alívio. Nesse momento, a sepultura pare­ ce realmente convidativa.

Sabe o que ele está pensando?

Todos falam sobre o Céu e não vão para lá

Céu, Céu

Vou gritar em todo o Céu de Deus.6

Você sabe o que ele não está percebendo? Está perdendo o que só a graça pode lhe dar: esperança. Ele não recebe graça de pessoa alguma à sua volta, ficando então sem esperança. Ninguém para animá-lo. Está totalmente confuso. Não consegue encontrar o caminho.

168 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Phillip Yancey, em seu livro notável, Decepcionado com Deus, conta esta história verídica:

Certa vez, um amigo meu foi nadar ao crepúsculo num gran­ de lago. Enquanto estava nadando tranquilamente a uns noventa metros da margem, uma inesperada neblina noturna inundou o lago. De repente, não enxergava nada: nenhum horizonte, nenhuma baliza, nenhum objeto, nenhuma luz à margem. Como o nevoeiro dispersava toda a luz, nem mes­ mo conseguia identificar o lado onde o sol se punha.

Durante trinta minutos, debateu-se na água, tomado de pânico. Começava a nadar numa direção, ficava inseguro, e virava noventa graus à direita. Ou à esquerda — não fazia qualquer diferença o lado para o qual ele virava. Podia sentir o coração batendo descontroladamente. Parava e flutuava, tentando conservar as energias, e se esforçava em respirar mais devagar. Então, às cegas começava de novo. Finalmente ouviu uma voz fraca chamando da margem. Posicionou o corpo na direção dos sons e os seguiu até chegar em segurança.

Algo parecido com aquela sensação de total perdição deve ter se instalado em Jó enquanto estava sentado nas cinzas e procurava entender o que acontecera. Ele também tinha perdido todas as balizas, todos os pontos de referência. Para onde devia se voltar? Deus, aquele que podia orientá-lo em meio à neblina, permanecia calado.

O objetivo básico da aposta era manter Jó na escuridão.

Se Deus tivesse dito uma inspirativa palavra de estímulo — “Faça isso para mim, Jó, como um cavaleiro da fé, como um mártir” -, então Jó teria uma nobre razão para sofrer, e o teria feito alegremente. Mas Satanás questionara se a fé de Jó poderia sobreviver sem qualquer ajuda ou explicação ex­ terior. No momento em que Deus aceitou essas condições, a neblina invadiu onde Jó estava.

PALAVRAS MALDOSAS PARA UM SOFREDOR 169

No final, Deus, é claro, “ganhou” a aposta. Embora Jó tives­ se disparado uma saraivada de queixas amargas, e embora tivesse se desesperado da vida e ansiado pela morte, ainda assim desafiadoramente recusou-se a abandonar a Deus. “Ainda que ele me mate, nele esperarei” (ARC). Jó creu quan­ do não havia qualquer razão para crer. Creu no meio da neblina.

Você poderá ler a história de Jó, enfronhar-se para entender a aposta, então dar um profundo suspiro de alívio: “Arre! Deus resolveu aquele problema. Depois de demonstrar seu argumento de modo tão decisivo, certamente ele retornará a seu estilo preferido de comunicar-se claramente com seus seguidores.” Você poderá pensar assim — isto é, a menos que leia o restante da Bíblia. Hesito em dizer isto porque é uma dura verdade, uma verdade que não quero admitir, mas Jó se situa apenas como o exemplo mais extremo do que parece ser uma lei universal da fé. O tipo de fé que Deus valoriza parece se desenvolver melhor quando todas as coisas ficam confusas, quando Deus permanece calado, quando a nebli­ na invade.7

É PRECISO: MUITA GRAÇA

Você sabe por que eu amo a Bíblia? Por ser tão real. Há muita nebli­ na encobrindo a vida de Jó, como acontece com as nossas. Nesta terra ninguém “vive feliz para sempre”. Essa linha faz parte de um enorme conto de fadas. Você está vivendo num mundo irreal se espera que as coisas venham a ficar “felizes para sempre”. É por isso que necessitamos de graça. O casamento não fica mais fácil, fica mais difícil. Precisamos, então, de graça para mantê-lo. O trabalho não fica mais fácil, fica mais complicado. Precisamos, portanto, de graça para permanecer nele. Criar filhos não fica mais fácil. Vocês que têm filhos de um, dois e três anos - pensam que o seu fardo é pesado. Espere até que tenham quatorze, ou dezoito anos. Então você precisará mesmo de graça!

170 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Tudo fica mais difícil. Você achou que estava gordo quando se casou. Olhe-se no espelho esta noite. E por isso que eu digo às noivas e aos noivos: “Aproveitem as fotos do casamento; vocês nunca vão ficar mais magros. E difícil encarar isso, mas é verdade. E daí? Precisa­ mos de graça à medida que engordamos! Precisamos de graça para continuar! Graça e mais graça — a graça de Deus. É preciso graça para nos relacionarmos. E preciso graça para dirigir. Graça para nos man­ ter positivos. Graça para manter a unidade da igreja. Graça para ser bons vizinhos. Precisamos realmente de graça quando envelhecemos. Não devemos nos esquecer nunca do que o tratamento dispensado a Jó ensina; quando as pessoas perdem a esperança, não as critique, não afunde a cabeça delas dentro d’água. Ministre graça! M uita graça!

Vou ser penosamente honesto aqui. Se eu tivesse autoridade, teria libertado Jó cinco minutos depois de ele ter perdido tudo. Teria feito todos os seus filhos voltarem à vida no dia seguinte. Teria re­ criado imediatamente tudo o que ele perdeu e lidaria severamente com aqueles consoladores molestos! Cortaria os lábios de Elifaz depois de três frases. E se isso não fizesse com que ele se calasse, cortaria o pescoço dele. Quero dizer: quem precisa desse cabeça-dura? Sabe, porém, de uma coisa? Você nunca amadureceria com o meu tra­ tamento. Só aproveitaria o conforto. Todos iríamos a piqueniques, depois andaríamos de motocicleta e nos divertiríamos a valer. Esse é o meu estilo. O que explica por que Cynthia me diz: “Querido, se todo mundo lidasse com as coisas do jeito que você quer, tudo o que levaríamos à festa seriam balões. Ninguém se lembraria de levar a comida.” Ela tem razão, como sempre.

A névoa então escondeu tudo. Quando o caos se instala, a graça se afasta. Bem-vindo à raça humana, Jó.

Comecei este capítulo com uma velha canção e vou finalizá-lo com outra ainda mais antiga.

Através de muitos perigos, trabalhos e laços, Consegui chegar; A graça me trouxe a salvo até aqui,

E a graça me levará para casa.8

PALAVRAS MALDOSAS PARA UM SOFREDOR 171

É isso aí! Mesmo na neblina, a graça nos guiará para casa. Nosso querido, abatido amigo, Jó, pensa que vai perder o céu. Está tão infeliz que nem sequer pensa para além da sepultura. Nós compreen­ demos. Sabemos que há um amanhã, e pela graça de Deus há um lar no além. Jó não pode vê-lo agora. A névoa é densa demais. Tudo ficou encoberto. Se você prestar atenção, pode ouvi-lo cantarolar essa me­ lodia. Ele não consegue tirá-la da cabeça:

Todos falam sobre o Céu e não vão para lá

Céu, Céu...$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já recebeu palavras maldosas justamente no momento em que mais precisava de graça e consolo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Assim como muitos falam da graça mas não a reconhecem, de que maneira você tem oferecido (ou negado) graça a quem está sofrendo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o coração ferido pode responder à crueldade verbal sem devolver o mesmo veneno que recebeu?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Garantia de Esperança para o Agredido e Insultado$t$, 15,
$conteudo$obre o que você conversou na hora do café na manha de 11 de setembro de 2001? Não se lembra, não é? Há um pequeno grupo de pessoas que jamais se esquecerão do tema da conversa naquela manhã.

S

Elas tinham se reunido no Pentágono, em Washington, D.C., com o Secretário de Defesa, Donald Rumsfeld. Ouviram enquanto ele falava do que parecia à maioria presente pouco mais do que uma preo­ cupação teórica. Algumas pessoas poderiam ter chegado a ponto de afirmar que não passava de uma predição estudada. Ele disse algo assim: “Em alguma ocasião dos próximos meses haverá um evento no mundo que lembrará as pessoas de como é importante que a nossa nação tenha um Departamento de Defesa forte e sólido.”1 Rumsfeld e aqueles que se sentaram à mesa do café, às 8 horas daquela manhã, não tinham idéia de que o Vôo 77 estava a caminho do aeroporto internacional de Dulles para se despedaçar contra o Pentágono. E quase certo que ne­ nhum deles compreendeu como as palavras do Secretário de Defesa haviam sido proféticas no momento em que foram ditas.

174 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jeffrey Krames, autor do livro The Rumsfeld Way, descreve a reaçao imediata de Rumsfeid quando, apenas minutos depois que aque­ las palavras haviam saído de seus lábios, o avião bateu no outro lado do Pentágono, tirando a vida de 180 de seus colegas, amigos e outros oficiais de alta patente do Exército.

Krames escreve: “Rumsfeld saiu correndo instintivamente da sala, perguntou se alguém sabia o que acontecera, depois correu na dire­ ção da fumaça. Cercado pelo caos, escombros e membros do resgate, ele ajudou a colocar alguns dos feridos em macas.”2

A revista The Economist, publicada logo depois daquele aconte­ cimento horrendo, informou: “Ele (Rumsfeld) havia feito o que os soldados têm de fazer: ficar firme quando o mundo explode ao seu redor. Esse homem guiou pelo exemplo.”3

Durante aquela emergência e nas horas que se seguiram, aquele que alguns chamaram de “Secretário da Defesa fora da realidade” transformou-se em um corajoso “secretário de guerra” com um man­ dato vital que ele não esqueceu até hoje. O mesmo homem que falara teoricamente sobre a possibilidade de “um evento”, encontrou-se envolvido nele naquela mesma manhã, menos de uma hora depois.

Isso me faz pensar em Jó. Você está lembrado de como a história dele começou? “Certo dia.” Essas palavras parecem tão inócuas. Como a manhã do 11 de setembro... apenas outra manhã clara e ensolarada. O cheiro do outono pairava no ar. As crianças estavam indo para a escola. As mães e os pais se ocupavam com seus afazeres. Onibus e metrôs circulavam lotados de passageiros à medida que a ciranda do comércio se iniciava.

E Jó? Posso imaginá-lo de pé na janela da cozinha, enquanto a mulher termina o café. Ele diz: “Sabe, querida, vamos parar um pouco e dar graças. Nossos campos estão verdes e produtivos. As caravanas de camelos carregadas e prontas para partir. Olhe ali: outro grupo entrando pelo portão. Veja a casa de nossos filhos...” Ela vai até ele e olha pela janela, sorrindo em seguida e rodeando a cintura do marido com os braços. Ele continua: “Sabe, meu amor, somos maravilhosa­ mente abençoados, mas precisamos lembrar que talvez as coisas nem

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 175 sempre sejam assim. Quem sabe? Sem que percebamos, tudo isto pode mudar.”

Enquanto Satanás está-se encontrando com Deus, a anos-luz de distância, oferecendo um plano sinistro, Jó e sua doce esposa ter­ minam a conversa com uma oração de agradecimento e um beijo enquanto se sentam para tomar o café e falar sobre o lar e a família, as bênçãos de Deus e o futuro. Em questão de minutos tudo vai mudar para esse casal. Tudo! Como aconteceu com o Secretário Rumsfeld naquela fatídica manhã de setembro. Jó estaria em breve correndo na direção da fumaça, cercado pelo caos e os escombros. Ele encontraria seus prédios espalhados como gravetos atirados no ar. Um empregado após outro viria também correndo e gritando as horrendas notícias, seguidas de outras piores, até a última: “Os dez filhos pereceram!” Em apenas alguns minutos eles perdem tudo. Bens e pessoas, gado e camelos, a capacidade de ganhar seu sustento e todos os filhos, tudo. Antes que a fumaça desapareça, um novo dia literalmente começa. “Num dia...” Outro amanhecer familiar.

Satanás volta para uma segunda sessão com o Deus eterno, dizendo com um risinho provocante: “Jó está protegido por ti. Não é de admirar que ainda tenha fé. Mas, se permitires que o sofrimento toque o seu corpo, ele irá te amaldiçoar.” Satanás fora forçado a teste­ munhar que “Jó não pecou, nem atribuiu a Deus falta alguma” (Jó 1:22). Mas ele não está disposto a desistir. “Quem não serviria a Deus com boa saúde?”

Em tudo isto, porém, ficamos sabendo, “não pecou Jó com os seus lábios” (Jó 2:10). Fico imaginando se ele pensou, depois de a mulher ter sugerido que amaldiçoasse a Deus e morresse, e disse algo assim: “Lembra-se, querida, de quando estávamos de pé na janela da cozinha e mencionei casualmente que as coisas podiam mudar...?”

O Secretário de Defesa Rumsfeld deve ter repetido mentalmente seu discurso daquela manhã, à mesa do café, centenas de vezes durante as semanas que se seguiram: Lembram-se de quando eu disse: “Em algum momento, nos próximos meses...”

176 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jó, séculos antes, guiou pelo exemplo. Como resultado, ele se tornou um modelo de notável paciência. Temos até hoje o ditado “a paciência de Jó”. Quem sabe quantas pessoas foram fortalecidas pelo seu exemplo? Quando Cynthia e eu ficamos atónitos por causa de eventos chocantes que nos atingem repentinamente, procuramos lem­ brar um ao outro que é necessária a paciência de Jó para suportar, para continuar apesar da dor.

No caso de Jó, como se o sofrimento, a dor e a perda da saúde não fossem suficientes, chegaram então esses supostos amigos. O relato bíblico nos conta: “Ouvindo, pois, três amigos de Jó todo este mal que lhe sobreviera (...) combinaram ir juntamente condoer-se dele e consolá-lo” (Jó 2:11). Como já notamos, esse foi o objetivo original. Eles se comunicaram, uma vez que cada um vivia num lugar diferen­ te, e combinaram visitar Jó com o mesmo propósito. Iriam vê-lo, abraçariam o amigo que sofria, agradeceriam pela sua vida e o conso­ lariam em seu sofrimento, na esperança de encorajá-lo.

Como já vimos, porém, alguma coisa se perdeu no processo. O propósito deles desvaneceu. Ficaram sentados durante uma semana, olhando para ele. “Nenhum lhe dizia palavra alguma, pois viam que a dor era muito grande” (Jó 2:13). O silêncio deles não o perturbou. Isso não constituía problema. O problema surgiu quando começaram a falar! A partir desse ponto, uma dor maior do que qualquer outra conhecida por Jó emergiu e permaneceu interminavelmente com ele.

Você e eu conhecemos pessoas que perderam sua casa, não importa qual tenha sido a razão. Conhecemos também pessoas que fracassaram nos negócios. Chegamos até a conhecer pessoas que não enterraram só um, mas vários filhos. Conheço um casal que enterrou quatro de seus filhos num único dia. Mas duvido que conheçamos alguém que tenha sido atacado e abusado verbalmente após todos esses aconteci­ mentos por pessoas que tenham chegado depois e o tenham criticado, culpado e condenado. Isso foi exatamente o que aqueles homens fize­ ram. De fato, eles se revezaram!

Satanás deve ter dançado de alegria. Ele não planejara ter um grupo de parceiros cínicos. Essa fora uma recompensa extra! Sem

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 177 saber, aqueles homens se tornaram porta-vozes de Satanás. O Ad­ versário deve ter pensado: “Isto vai funcionar. Jó vai desmoronar frente a este abuso, e Deus vai ouvir o homem amaldiçoá-lo em sua face. Ninguém pode suportar um ataque deste tipo.” O pri­ meiro ciclo completo de assalto seguiu o seu curso do capítulo 3 ao capítulo 14 de Jó, enquanto Elifaz, seguido por Bildade e de­ pois por Zofar, agem um de cada vez, destilando sua raiva sobre a alma sofredora. O segundo assalto começa imediatamente depois (cap. 15). Elifaz, provavelmente o mais velho, despeja suas injú­ rias e fica então de lado, enquanto Bildade se apresenta para o seu próximo turno.

O SEGUNDO ASSALTO DE BILDADE

Este seria um bom momento para fazer uma pausa e comparar. Retroceda e considere a primeira vez em que Bildade falou. “Até quando falarás tais coisas? E até quando as palavras da tua boca serão qual vento impetuoso?” (Jó 8:2). Veja como ele inicia a frase ao dirigir-se novamente a Jó. Mesma música, segundo verso. Bildade está ficando evidentemente agitado.

Até quando andarás à caça de palavras? Considera bem, e, então, falaremos. Por que somos reputados por animais, e aos teus olhos passamos por curtos de inteligência? Oh! Tu, que te despedaças na tua ira, será a terra abandonada por tua causa? Remover-se-ão as rochas do seu lugar?

Jó 18:2-4

Deus vai reter o fôlego enquanto você endireita a sua vida? Essa pare­ ce ser a implicação desses comentários cáusticos. Eu chamaria isso de início injurioso.

George Bernard Shaw comparou certa vez a conversa trivial a um fonógrafo com apenas meia-dúzia de álbuns. Você em breve se cansa de ouvi-los vez após vez.

178 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Até quando, Jó, até quando?” Bildade vê tudo isso como um grupo cansativo de palavras monótonas. Ao que tudo indica, o homem não está mais interessado no sofrimento de Jó. Ele só quer que Jó se cale e admita que é pecador. Ponto final.

Bildade pensa deste modo: Deus é justo. Deus não só castiga os perversos, como também abençoa os justos. Se você se arrepender, Deus irá abençoá-lo e aliviá-lo da sua aflição. Caso não se arrependa, ele continuará julgando a sua pessoa, e seu sofrimento continuará. “Arrependa-se!” Este é o obstáculo: Jó não tem necessidade de se arrepender porque não fez nada errado. Mas, como alguns indiví­ duos de nossos dias, a teologia de Bildade não tem espaço para o mistério. Tudo é preto ou branco. Se você obedecer, será abençoado. Os que cumprem a vontade de Deus gozam de grande prosperidade e boa saúde. Mas, se você sofrer, está. fora da vontade de Deus. Ele quer que todos estejam bem. Que teoria defeituosa! Uma vez que Deus é soberano eTodo-Poderoso, se ele quisesse que todos estivessem bem, é o que aconteceria. Afinal de contas, ele é Deus... Mas as coisas não são assim.

Ele controla o espetáculo. Ele permite deliberadamente a doen­ ça. Por razões misteriosas, além da nossa compreensão, ele permite o sofrimento. Há também outras ocasiões por motivos não claramente revelados em que ele nos testa. O ponto é este: Deus está no contro­ le, e não nós. (Estou parecendo Iogy Berra.) Se orarmos pela cura de um indivíduo e a cura não ocorrer, não devemos concluir que ele (ou ela) seja culpado. Porque, na verdade, Deus não quer que todos estejam bem. Leia esta frase novamente.

Paulo orou em três ocasiões diferentes para que o seu espinho na carne fosse removido, e o Senhor respondeu: “Não, não, não!” Paulo não só deixou de orar pelo alívio, como também aceitou o “não” firme de Deus como definitivo. A seguir, ele respondeu com um discurso de aceitação que não pode ser aperfeiçoado:

Então, ele me disse: A minha graça te basta, porque o poder se aperfeiçoa na fraqueza. De boa vontade, pois, mais me

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 179 gloriarei nas fraquezas, para que sobre mim repouse o poder de Cristo. Pelo que sinto prazer nas fraquezas, nas injúrias, nas necessidades, nas perseguições, nas angústias, por amor de Cristo. Porque, quando sou fraco, então, é que sou forte.

2 Coríntios 12:9, 10

Que resposta madura, magnífica! Paulo estava disposto a aceitar o mistério de Deus de deixá-lo com a aflição depois de orar urgente­ mente por alívio três vezes!

Bildade, porém, não tem espaço para o mistério. O que estava em sua mente? Algo assim: “Está claro para nós que há pecado secre­ to em algum lugar na sua vida. Se pressionarmos a questão o sufi­ ciente, você irá finalmente admitir isso.” Penso que o único pecado com o qual Jó lutava agora era este: “Como poderei silenciar esses sujeitos?” (Nenhuma cobrança extra por isso. Francamente, esse é um pensamento que eu teria se ficasse ali sentado no depósito de lixo da cidade, coberto de feridas e tendo de suportar a condenação deles baseada na vergonha.)

A Morte Está Próxima

Um olhar mais de perto revela que Bildade faz Jó lembrar-se da morte a toda hora. Isso se aplica a um conselheiro que se preza? Ele remove todos os empecilhos ao sublinhar a presença do “rei dos terrores” (Jó 18:14). Isto é poesia, lembre-se. Ele faz uso de linguagem poética, de alegorias e de palavras figuradas na sua apre­ sentação. Bildade retrata a morte de Jó em quatro diferentes figuras de linguagem:

Primeira, uma luz que se apaga:

Na verdade, a luz do perverso se apagará, e para seu fogo não resplandecerá a faísca; a luz se escurecerá nas suas tendas, e a sua lâmpada sobre ele se apagará.

Jó 18:5, 6

180 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Segunda, uma pessoa presa, a caminho da morte. Há aqui uma implicação de que Jó tem um plano que não quer admitir. Ele não o confessa. Note a figura para este prisioneiro:

Os seus passos fortes se estreitarão, e a sua própria trama o derribará. Porque por seus próprios pés é lançado na rede e andará na boca de forje. A armadilha o apanhará pelo cal­ canhar, e o laço o prenderá. A corda está-lhe escondida na terra, e a armadilha, na vereda.

Jó 18:7-10

Terceira, Jó é descrito como um fugitivo que está sendo perseguido. É aqui que Bildade introduz o “rei dos terrores”.

Os assombros o espantarão de todos os lados e o perseguirão a cada passo. A calamidade virá faminta sobre ele, e a misé­ ria estará alerta ao seu lado, a qual lhe devorará os membros do corpo; serão devorados pelo primogénito da morte. O perverso será arrancado da sua tenda, onde está confiado, e será levado ao rei dos terrores. Nenhum dos seus morará na sua tenda, espalhar-se-á enxofre sobre a sua habitação.

Jó 18:11-15 (itálico meu)

Voltemos a essa vívida declaração: “Espalhar-se-á enxofre sobre a sua habitação.” “Você acredita nisso?” Diz Bildade: “Fogo e enxofre, é o que está para vir, Jó. Você está a caminho do inferno!”

Quarta, ele retrata Jó como uma árvore arrancada.

Por baixo secarão as suas raízes, e murcharão por cima os seus ramos. A sua memória desaparecerá da terra, e pelas praças não terá nome. Da luz o lançarão nas trevas e o afugentarão do mundo. Não terá filho nem posteridade entre o seu povo, nem sobrevivente algum ficará nas suas moradas.

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 181

Do seu dia se espantarão os do Ocidente, e os do Oriente serão tomados de horror.

Jó 18:16-20

Ele termina com um supremo insulto: “Você nem sequer conhece a Deus!” Atira com ambos os canos à queima-roupa.

Ali está Jó sentado, com o corpo inteiro coçando, a febre subin­ do; tem a cabeça raspada, está sujo e suado, suportando o mais alto nível de dor. Em pé, à sua frente, encontra-se esse homem com a audácia de desprezá-lo e concluir que ele nem sequer conhece a Deus.

Por quê? Por que o Senhor nosso Deus incluiu esta cena em sua Palavra? Sob o risco de repetir-me demais, porque o espírito de Bildade ainda vive. Há ocasiões em que ele emerge na forma de um parceiro conjugal rude, crítico, que não pode oferecer uma palavra de encorajamento ou afirmação em circunstância alguma. Outras vezes, surge na forma de um chefe que só sabe criticar. E, permita que acrescente, outras vezes ainda, é manifestado por um pregador que usa o púlpito como um martelo para espancar e abusar das ovelhas. Vi isso na atitude de uma enfermeira áspera e impaciente que se alegra quando você vai embora para que possa limpar o quarto do hospital e receber outro paciente. Pode estar certo: o espírito de Bildade ainda vive.

Dois Grandes Erros

Ao analisar a abordagem de Bildade, dois erros visíveis sobem à superfície. Primeiro, ele está falando com a pessoa errada. E, segundo, está falando pelo motivo errado. Bildade diz coisas sobre a morte, sobre ser perseguido pelo “rei dos terrores” e ser impelido para um estado mental deplorável - tudo isso se aplica a alguém que não conhece o Senhor. Enquanto estiver pensando a respeito de um incrédulo, Bildade tem razão. “Há caminho que ao homem parece direito, mas ao cabo dá em caminhos de morte” (Pv 14:12). Você e eu conhecemos pessoas que não conhecem o Senhor e tentamos então

182 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

toda forma amável de apresentá-lo a elas, explicando a esperança que ele oferece, a segurança da vida do além, e prometendo perdão. Há ocasiões em que introduzimos na conversa a idéia de que a morte é certa, está chegando. Elas olham para nós como se dissessem: “Não, vamos fazer isso por nossa própria conta”. O que Bildade descreve é exatamente o que você consegue quando tenta fazer as coisas por si mesmo. É isto que a pessoa que não conhece a Deus tem de enfrentar. Mas, neste caso, não cabe a Bildade dizer isto a um irmão na fé. E claro que Jó conhecia o Senhor. Bildade estava se dirigindo à audiência errada. Como vimos, ele falou também pelo motivo errado.

A RESPOSTA FIRME DE JÓ

Faça uma pausa aqui e leia as primeiras palavras da resposta de Jó, devagar e pensativamente. Veja como ele usa as palavras de Bildade para começar sua resposta: “Até quando?”

Então, respondeu Jó: Até quando afligireis a minha alma e me quebrantareis com palavras? Já dez vezes me vituperastes e não vos envergonhais de injuriar-me.

Jó 19:1-3

Sublinhei em minha Bíblia esses quatro verbos apaixonados: afligireis, quebrantareis, vituperastes, injuriar-me. Quantos golpes brutais Jó so­ freu! Que calor ardente saiu da fornalha da boca de Bildade! Quão devastador!

Permita que eu interfira aqui antes de sondarmos mais fundo a resposta de Jó e esclareça que a reprovação é algo bom quando comunicada corretamente. Todos precisamos ser responsáveis. Não há dúvidas a respeito. Alguns não gostam e não querem responsabilidades. Portanto, qualquer tipo de censura é rejeitada.

Alguns pastores e evangelistas, até mesmo alguns missionários, gostam de ficar livres da reprovação e citam o versículo (fora de con­ texto): “Não toqueis nos meus ungidos” (1 Cr 16:22). Eles pensam:

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 183

“Sou um homem de Deus que proclama as verdades dele; portanto, você não tem o direito de me corrigir. Estou acima de tudo isso. Sou eu que devo corrigi-lo.” O fato é que todos precisamos de correção. Tais “feridas são leais”, diz Salomão. “Leais são as feridas feitas pelo que ama” (Pv 27:6), está lembrado? Se a censura é feita pela pessoa certa, da maneira certa, e pelo motivo certo, será prudente aceitá-la e agradecer por ela. É realmente fiel.

Essa é a razão pela qual crescer no tipo certo de lar pode ser tão proveitoso. As boas mães e os pais fiéis reprovam. Algumas das me­ lhores e mais úteis censuras que já recebemos foram feitas por mães fiéis e pais que nos corrigiram ao perceber nossa necessidade de correção. Eles ocasionalmente batiam em nós. Não permitiam que fôs­ semos atrevidos, enganosos ou cruéis em nosso comportamento. A língua do sábio pode trazer muitos benefícios aos que estão dispostos e têm humildade suficiente para aceitar o que ouvem. Por outro lado, a língua pode ser mortal. Ela pode atormentar, esmagar, insultar e causar dano a outros. Quando Davi escreveu o Salmo 57, ele estava fugindo de Saul. De fato, viveu como fugitivo durante cerca de doze anos. E nesse contexto que ele registra algumas expressões descritivas sobre o poder destrutivo da língua:

Acha-se a minha alma entre leões, ávidos de devorar os filhos dos homens; lanças e flechas são os seus dentes, espada afiada, a sua língua.

Salmos 57:4

Davi descreve fanáticos que cospem fogo, cujas palavras são como golpes de espadas que penetram brutalmente, vez após vez. Está des­ crevendo o falar abusivo - atingir as pessoas com a nossa língua. Davi havia sido alvo disso.

Leia agora o Salmo 64:

Ouve, ó Deus, a minha voz nas minhas perplexidades; preserva-me a vida do terror do inimigo. Esconde-me da

184 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

conspiração dos malfeitores e do tumulto dos que prati­ cam a iniquidade, os quais afiam a língua como espada e apontam, quais flechas, palavras amargas, para, às ocultas, atingirem o íntegro; contra ele disparam repentinamente e não temem.

Salmos 64:1-4

A língua é uma arma potente! Isto é especialmente verdade quando somos atacados em segredo, nos bastidores. Coisas são ditas contra nós, e não sabemos nem compreendemos o impacto que estão tendo nas pessoas que antes confiavam em nós. Esses golpes de espada continuam. O papel contrastante que a língua pode desempenhar é estabelecido eloquentemente em Provérbios 12:18.

Alguém há cuja tagarelice é como pontas de espada, mas a língua dos sábios é medicina.

Provérbios 15:4 oferece um pensamento similar:

A língua serena é árvore de vida, mas a perversa quebranta o espírito.

Bildade condenou Jó por considerá-lo um homem pecador. Concluiu, portanto, erroneamente, que seus problemas eram consequências apropriadas de seus erros. Jó sabia que confessara todos os seus peca­ dos e considerou seu sofrimento como um mistério. Quando você acrescenta mistério ao silêncio de Deus e a um sentimento de distância da presença divina, a vida se torna praticamente intolerável. Isso explica a perda periódica de controle por parte de Jó. Aqueles homens, porém, se recusaram a dar-lhe qualquer folga.

Guardo comigo, há anos, um poema interessante intitulado The Builder. Encontramos perguntas profundas nos versos finais:

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 185

Um grupo de homens numa cidade movimentada,

Com um golpe forte e um grito vigoroso,

Eles batiam com gosto,

E uma parede lateral foi derrubada.

Perguntei ao Capataz:

“Esses homens são habilitados? Do tipo que contrataria, se tivesse de construir?”

Ele olhou para mim e riu: “Claro que não! Só preciso de mão-de-obra não-especializada.

Eles podem destruir, em um ou dois dias,

O que levou anos para os construtores levantarem.”

Perguntei a mim mesmo, enquanto me afastava:

Qual desses papéis tentei desempenhar?

Serei um construtor com trena e esquadro,

Medindo e construindo com habilidade e cuidado?

Ou serei um demolidor que anda pela cidade,

Contente com o seu trabalho de derrubar tudo? 4

Anónimo

Os amigos de Jó se qualificavam como demolidores. Quanto mais tempo passavam com ele, tanto mais Jó compreendia que não representa­ vam a verdade. Eles continuavam a condená-lo.

Alguns que estão lendo este livro não estão mais casados por terem sofrido abuso por parte de um cônjuge. Você foi verbalmen­ te atacado; nunca soube o que era ser afirmado e encorajado. Não recebendo nada além de críticas e nunca um abraço compreensivo, você não pôde continuar e sobreviver. Lamentavelmente, alguns de vocês são abusivos em seu casamento. O surpreendente é que não percebam isso. E bem possível que esteja pensando: “Oh! nunca pus a mão em...” Não se trata disso. Estou falando de abuso verbal:

186 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

comentários maldosos, insultos, palavras que ferem e dilaceram como golpes de espada, sarcasmo e observações maliciosas.

Para ser justo, não acho que Bildade tenha ficado sentado na beira da cama naquela manha, pensando: “Vejamos, como posso insultar Jó hoje?” O abuso verbal é cometido na maioria das vezes por aqueles que quase nao enxergam seus próprios de­ feitos. Como acontecia com Bildade, as coisas iam piorando à medida que falavam.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Mesmo agredido e insultado, Jó declarou "eu sei que o meu Redentor vive"; que esperança sustenta você quando tudo parece perdido?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você se sente atingido por palavras e circunstâncias que não controla, onde busca a garantia de que Deus ainda o vê?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significa, na sua dor presente, confiar que existe um Redentor que falará por você no final de tudo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Silêncio e a Distância de Deus$t$, 16,
$conteudo$Jó chama esse abuso de tortura, pressão, insulto e erro. Isso nao era, entretanto, tudo que o perturbava. Havia também a distância que sentia de Deus.

Eis que clamo: violência! Mas não sou ouvido; grito: socorro! Porém não há justiça.

Jó 19:7

Os céus eram como bronze fosco. Deus estava mudo. Com respeito a esse silêncio enlouquecedor, Jó diz:

O meu caminho ele fechou, e não posso passar; e nas minhas veredas pôs trevas.

Jó 19:8

Nosso coração se inclina para o homem, enquanto ele continua descrevendo a sua angústia:

Da minha honra me despojou e tirou-me da cabeça a coroa. Arruinou-me de todos os lados, e eu me vou; e arrancou-me a esperança, como a uma árvore.

Jó 19:9, 10

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 187

Ausência e Resistência de Outros

Não só Deus está silencioso, como também outros que antes eram íntimos de Jó estão agora distanciados dele. Quando ouve falar dos amigos, sua própria condição os afasta.

Pôs longe de mim a meus irmãos, e os que me conhecem, como estranhos, se apartaram de mim. Os meus parentes me desampararam, e os meus conhecidos se esqueceram de mim. Os que se abrigam na minha casa e as minhas servas me têm por estranho, e vim a ser estrangeiro aos seus olhos. Chamo o meu criado, e ele não me responde; tenho de suplicar-lhe, eu mesmo. O meu hálito é intolerável à minha mulher, e pelo mau cheiro sou repugnante aos filhos de minha mãe. Até as crianças me desprezam, e, querendo eu levantar-me, zombam de mim. Todos os meus amigos íntimos me abominam, e até os que eu amava se tornaram contra mim.

Jó 19:13-19

“Vocês, Bildade, Zofar e Elifaz, vocês se voltaram contra mim!” Como a existência dele era trágica, digna de pena! No que diz respeito à companhia terrena, ele não tinha ninguém. Talvez curvado e entre lágrimas, Jó soluça:

Compadecei-vos de mim, amigos meus, compadecei-vos de mim, porque a mão de Deus me atingiu. Por que me perseguis como Deus me persegue e não cessais de devorar a minha carne?

Jó 19:21, 22

O único desejo dele era que pudesse haver algum meio de preservar suas palavras, a fim de que outras gerações pudessem lê-las e aprender com elas.

188 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Quem me dera fossem agora escritas as minhas palavras! Quem me dera fossem gravadas em livro! Que, com pena de ferro e com chumbo, para sempre fossem esculpidas na rocha!

Jó 19:23, 24

A Aspiração de Jó

Jó desejava que suas palavras dolorosas fossem gravadas em granito para que as pessoas de todas as eras pudessem entender todas as coisas que ele estava suportando. Ele pensou que suas palavras se­ riam esquecidas.

Quando li isso pela primeira vez, lembrei-me de nosso décimosexto presidente, Abraham Lincoln, em 19 de novembro de 1863. Ele se achava em Gettysburg, vendo à sua volta as horrendas conse­ quências daquela batalha sangrenta, cercado de corpos inchados ainda caídos sob o sol em todo o campo. Ficou ali com este pequeno dis­ curso escrito por sua própria mão. É certo que acreditava que suas palavras seriam em breve esquecidas.

O mundo quase não vai notar, nem lembrar por muito tempo, o que escrevemos aqui, mas não poderá jamais esquecer o que eles fizeram neste lugar.5

Compreendendo como suas palavras ficaram permanentemente gravadas na memória de todos, cada vez que leio o discurso dele, penso: “Sr. Presidente, nossa nação jamais esquecerá o que V. Exa. disse nessa frase!” A maioria de nós é incapaz de se lembrar de tudo o que aqueles soldados fizeram, mas nunca nos esquece­ remos das palavras imortais pronunciadas por Lincoln naquele campo.

Jó não tinha idéia de que suas palavras iriam sobreviver a ele. Todavia — pense nisso —, Deus decidiu incluí-las em sua Palavra eterna! Junto com escrituras como Génesis 1, Salmos 23, Romanos 8,

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 189

1 Coríntios 13 e Apocalipse 22, ainda hoje nos lembramos de Jó 19:25-27!

Porque eu sei que o meu Redentor vive e por fim se levanta­ rá sobre a terra. Depois, revestido este meu corpo da minha pele, em minha carne verei a Deus. Vê-lo-ei por mim mesmo, os meus olhos o verão, e não outros; de saudade me desfalece o coração dentro de mim.

Jó 19:25-27

Graças ao Magnum Opus de Haendel, todo Natal ouvimos repetida­ mente essa mensagem. Em sua terrível angústia, Jó nem sequer acre­ ditava que o seu Senhor honraria o seu nome, preservando as suas palavras para que o mundo inteiro as ouvisse e cantasse\

A Sua Esperança

Preciso fazer uma pausa neste ponto e escrever a você cujo Deus é distante e silencioso. É também possível que (como Jó), seus amigos tenham começado a se voltar contra a sua pessoa. Há, porém, um futuro mais brilhante do que os seus mais extraordinários sonhos! Da mesma forma que Jó irá um dia experimentar, a justiça vai vencer, Deus eliminará o mal e o certo eclipsará o errado.

No final, Deus vence. E nós também.

Jó será vingado, lembrado e respeitado. Todos os Zofares, Bildades e Elifazes serão julgados, silenciados e esquecidos.

Temei, pois, a espada, porque tais acusações merecem o seu furor, para saberdes que há um juízo.

Jó 19:29

Em meio a toda a sua miséria, Jó não perdera de vista quem estava certo e quem estava errado. Ele lembrou aos três homens: “O juízo e o castigo não estão vindo em minha direção, mas na de vocês.”

190 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

LIÇÕES APRENDIDAS EM UM CONTEXTO DE SOFRIMENTO

Duas lições duradouras persistem enquanto completo este décimo capítulo. A primeira é sobre esperança, e a segunda, sobre segurança.

Primeiro, não há nada como a esperança na verdade para clarear a perspectiva e manter você firme. Suportar uma viagem penosa pode ser algo muito mais fácil se você abraçar a verdade como sua com­ panheira de jornada. Ela não só lhe dará esperança, como irá iluminar a sua perspectiva. A verdade nos lembra de que Deus está vivo e é justo e bom. Repito: o erro será finalmente julgado. O dia de hoje pode parecer escuro e terrivelmente longo, mas haverá um amanhã luminoso.

Segundo, não há nada como a falta de segurança para atormentá-lo e fazer com que tenha medo. Quero ser franco com você: se estiver sem o Senhor Jesus Cristo em sua vida, seus passos são marcados pela incerteza. Tarde da noite, quando as luzes se apagam e sua cabeça está mergulhada no travesseiro, pensamentos de seu destino final irão perturbá-lo. Poucos pensamentos são mais amedrontadores do que não saber para onde se vai quando morrer. Se morrer sem Cristo, terá de enfrentar um juízo terrível. “E, assim como aos homens está orde­ nado morrerem uma só vez, vindo, depois disto, o juízo” (Hb 9:27). Para ter paz interior você precisa saber com certeza para onde vai.

Minha mulher e eu assumimos o compromisso de dar o nosso dinheiro enquanto estamos vivos. Gosto do velho ditado: “Doe seu dinheiro enquanto está vivo, pois então saberá para onde ele vai”. Com isso em mente, verifique se está acreditando no que é certo enquanto vive, então saberá para onde está indo. Dá medo não saber para onde vamos.

O evangelista Billy Graham foi convidado há vários anos para falar no Hotel Waldorf Astoria (velho-mas-ainda-elegante), na cida­ de de Nova York. Tenho um amigo que compareceu e ouviu sua preleção. O Dr. Graham teve alguma dificuldade em chegar até lá - de fato, atrasou-se um pouco. Quando se levantou para falar, ele contou uma história sobre o mundialmente famoso físico, Dr. Albert

GARANTIA DE ESPERANÇA PARA O AGREDIDO E INSULTADO 191

Einstein, que estava tomando um trem para uma cidade grande anos atrás. O condutor apareceu para recolher as passagens. Quan­ do chegou ao Grande Pensador, esperou que ele lhe desse o bilhete. O velho senhor começou a procurar em todos os bolsos, mas não conseguiu encontrá-lo. A essa altura, o condutor percebeu quem ele era e disse: “Oh! Dr. Einstein, não se preocupe. Sei quem o senhor é... e confio no senhor. Não precisa me mostrar o seu bilhete”, e continuou sua ronda.

Alguns minutos mais tarde, ao voltar com a bolsa cheia de bilhetes, o condutor viu Einstein agachado, procurando embaixo dos assentos pela passagem perdida. Ele curvou-se e sussurrou: “Por fa­ vor, levante-se. Não há problema. Confiamos no senhor. Não precisa me mostrar o seu bilhete.” Nesse momento, Einstein levantou os olhos e respondeu: “Jovem, não se trata de confiança, mas de direção. Estou procurando a passagem porque não sei para onde estou indo.”6

Você sabe mesmo para onde vai? O seu destino eterno está garantido? De modo surpreendente, Bildade falou com o homem errado pelo motivo errado. Ele tinha uma mensagem sólida, mas era para outra pessoa. Poderia ser para você? Em caso positivo, há razão para preocupar-se.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já viveu uma temporada em que os céus pareciam de bronze e Deus parecia mudo diante do seu clamor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando até as pessoas próximas se afastam e o Senhor parece distante, o que mantém viva a sua confiança nele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como Jó atravessou o silêncio de Deus sem abandonar a fé, e o que isso ensina você a fazer no seu próprio deserto?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Respondendo com Sabedoria às Falsas Acusações$t$, 17,
$conteudo$inimigo mais traiçoeiro na igreja é a língua. A língua humana tem feito mais estragos e causado mais sofrimentos do que qual­ quer outra fonte de perturbação. O que dizemos corta mais fundo do que qualquer faca ou espada. A Bíblia apresenta ocasionalmente a língua como uma espada que penetra na vida das pessoas, causando mágoa profunda e duradoura. Não ficamos então surpresos ao ler sobre a mentira na lista dos Dez Mandamentos. “Não dirás falso testemunho contra o teu próximo” (Êx 20:16).

O

Quando Salomão escreveu os Provérbios, ele incluiu as sete coi­ sas que o Senhor odeia. Entre elas, “Testemunha falsa que profere mentiras” (Pv 6:19). Mesmo assim, os mentirosos ainda continuam à solta. Se você suportou a violência da língua mentirosa de alguém, mais especificamente, se foi acusado de maneira falsa, não precisa então que eu descreva a verdadeira dor. Você não só passou por isso, como também descobriu como é problemático defender-se. Você tenta, mas as pessoas são difíceis de convencer uma vez que tenham ouvido mentiras categóricas. O veneno de uma língua venenosa já

194 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

cobrou seus dividendos. É trágico, mas as igrejas podem ser um campo fértil para os lábios soltos e línguas mentirosas. É preciso coragem para enfrentar os mentirosos.

Quando ministrei com Ravi Zacharias em uma conferência bíblica há anos, ele contou-me uma história espantosa que jamais esquecerei. Um jovem pastor foi trabalhar numa igreja que passara por uma devastadora divisão. Como resultado, a pequena igreja ficara muito reduzida, apenas sobrevivendo. Quando o corajoso jovem chegou, ele estava decidido a abrir a Bíblia e pregar a verdade da Palavra de Deus semana após semana. Tinha a coragem de falar franca e abertamente, o que Deus aprova.

Não é de admirar que a igreja se reerguesse e começasse a crescer. Antes de muito tempo a congregação estava lotada. Isto resultou em vários cultos no domingo, e ficou claro que necessitavam construir um lugar maior para a adoração. Só havia um problema: o novo cen­ tro de adoração custaria um milhão de dólares. Embora não tivessem esse dinheiro, ninguém poderia negar a realidade — eles precisavam do prédio.

Nessa igreja crescente havia dois irmãos que viviam carnalmente. Não passavam de homens de mau caráter, embora bastante ricos, ricos perversos com vidas notoriamente amorais. Um deles teve mor­ te súbita. O irmão sobrevivente procurou o pastor, dizendo: “Tenho uma coisa para você”, e entregou-lhe um envelope. “É um cheque de um milhão de dólares. Quero que faça uso dele para pagar o novo santuário. Tudo que peço em troca é que, ao pregar no funeral de meu irmão, você diga a todos os presentes que ele era um santo. Isso é tudo que desejo.”

O pastor pensou por um momento e disse: “Está bem. Concor­ do.” Ele pegou o cheque, depositou-o na mesma tarde e começou a preparar a mensagem fúnebre. O serviço foi realizado alguns dias mais tarde e a igreja estava repleta. O caixão foi colocado na frente do púlpito e o pastor levantou-se para pregar. As pessoas ficaram senta­ das em silêncio, imaginando o que ele poderia dizer, uma vez que sabiam o tipo de vida que o homem levara. Ficaram espantadas com

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 195 as palavras iniciais do pastor. “Este homem era um perverso. Infiel à sua família. Tinha uma vida hipócrita e imoral. Era desonesto nos negócios. Um mentiroso em quem não se podia confiar. Foi uma das causas principais dos problemas e conflitos desta igreja e, depois que passei a ser pastor aqui, um verdadeiro fardo para muitos de vocês. Mas, comparado ao irmão, ele era um santo.”* Existem muitas maneiras de falar a verdade. Aquele jovem prega­ dor, entretanto, recusou-se a ser subornado. Pastores com essa coragem são raros.

PERSONAGENS BÍBLICOS ACUSADOS FALSAMENTE

Você pode ficar surpreso ao descobrir a frequência com que falsas acusações foram feitas contra pessoas inocentes nas Escrituras. Vamos lembrar de alguns exemplos — todos de vítimas de palavras injustas, prejudiciais.

O primeiro a ser mencionado é um homem chamado José, que aprendeu um novo idioma, familiarizou-se com uma cultura completamente diversa e abriu caminho para um posto de grande responsabilidade como gerente dos bens de Potifar. José era um modelo de integridade, mas no auge de sua carreira foi acusado falsamente de estupro pela mulher de Potifar. Ele terminou na cadeia. Que injustiça!

Moisés foi fiel, mesmo aos 80 anos, em obedecer à voz do Senhor e aceitar a tarefa, dada por Deus na sarça ardente, para que voltasse ao Egito e livrasse o seu povo do cativeiro. Depois do Êxodo, enquanto ainda peregrinava pelo deserto, o povo que livrara voltou-se contra ele e o acusou falsamente de tê-lo levado ao deserto para que todos morressem. Nada estava mais longe da verdade.

Davi, depois de matar o gigante e mostrar uma vida de coragem e integridade, foi falsamente acusado de tentar derrubar o rei Saul pelo próprio monarca ciumento e inseguro. Davi tornou-se um fugi­ tivo durante doze ou mais anos, acusado falsamente de algo comple­ tamente inverídico. Quão imerecido!

196 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Neemias reconstruiu o muro ao redor da antiga Jerusalém, tendo motivado o povo a realizar essa difícil tarefa. Pouco antes de o projeto ser completado, vários de seus inimigos espalharam o boato de que Neemias tinha uma intenção escusa. “Ele está construindo o muro para que possa vir a se tornar o novo rei. Neemias está fazendo isso em proveito próprio”, foi a mentira deles. Como é injusto que alguém tão piedoso e diligente quanto Neemias seja assim acusado!

Pedro e João foram acusados de pregar um falso Cristo, uma denúncia claramente falsa. Os dois foram injustamente açoitados por isso.

Paulo foi acusado de fingir a sua conversão. Os apóstolos nem sequer o aceitaram em seu círculo, por suspeitarem que não havia nascido de novo. Mais tarde, foi acusado de causar conflitos entre os judeus. Até que ponto as histórias podem ser exageradas? O mesmo homem foi acusado mais tarde pelo governador Festo de ser louco por causa de suas “muitas letras” (At 26:24). Até que ponto isso era injusto?

Quem poderia esquecer-se também de Jesus, “homem de dores e que sabe o que é padecer” (Is 53:3)? Grande parte de seu sofrimen­ to e tristeza resultou de falsas acusações. Desde os primeiros meses de seu ministério público ele foi acusado de ter tido um nascimento ilegítimo. Durante o seu incrível ministério foi acusado de ser beberrao, por ter sentado e comido com pecadores. Os fariseus também o acusaram de ser possuído por demónios e de ser um instrumento de Satanás, enquanto curava o povo. Por último, ele foi para a cruz devi­ do a falsas incriminações de blasfémia e tirania. Quanta injustiça!

Não ficamos surpresos com a inclusão destas palavras quando Jesus pronunciou seu imortal Sermão do Monte:

Bem-aventurados sois quando, por minha causa, vos injuri­ arem, e vos perseguirem, e, mentindo, disserem todo mal contra vós. Regozijai-vos e exultai, porque é grande o vosso galardão nos céus; pois assim perseguiram aos profetas que viveram antes de vós.

Mateus 5:11, 12

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 197

Se você estiver sendo acusado falsamente hoje, sugiro que leia outra vez essas palavras, desta vez um pouco mais deliberadamente. Não perca a promessa: seu galardão celestial será grande. A sua infe­ licidade pode ser enorme hoje. Talvez tenha descoberto que não é capaz de se defender. Persuadir alguém com idéias preconcebidas é quase impossível.

ENTRA ZOFAR... ACUSANDO PELA SEGUNDA VEZ

Então, respondeu Zofar, o naamatita: Visto que os meus pensamentos me impõem resposta, eu me apresso. Eu ouvi a repreensão, que me envergonha, mas o meu espírito me obriga a responder segundo o meu entendimento.

Jó 20:1-3

Zofar tem “pensamentos inquietos”. A seguir, ele admite “agitação interior”. Sente-se também “envergonhado”. Quero ser honesto com você: não acho nada de inquietante, perturbador ou insultuoso nas palavras de Jó. Ele simplesmente expôs suas diferenças de opinião com Zofar. Os que querem endireitar os outros e controlá-los ficam no geral inquietos, agitados e se sentem insultados por não con­ cordarem. Não querem ouvir; querem falar. Não querem aprender; querem ensinar; preferivelmente, querem fazer uma preleção. E cer­ tamente não aceitam que alguém discorde deles!

O tom ácido de Zofar não abrandou enquanto esperava sua vez de falar novamente. Ele tem três mensagens para Jó. Não nos surpreende que tenha exagerado em cada uma delas. Primeiro, quer que Jó compreenda que os perversos não vivem muito tempo (Jó 20:4-11). Segundo, os prazeres dos perversos são transitórios (Jó 20:12-19). Finalmente, ele afirma que o juízo de Deus cai severa­ mente sobre os perversos (Jó 20:20-29). Há um grande problema com essas mensagens — estão erradas quando você as interpreta do modo pretendido por Zofar.

198 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Zofar faz sua preleção à maneira de um novato, colorindo-a com a ajuda de números — os números dele. Para esse homem, tudo é cristalino e muito simples. Tudo pode ser reduzido a axiomas simplistas, o que explica a razão de Zofar ficar tão firme em seus comentários sobre a brevidade da vida, o prazer temporário da per­ versidade, e o juízo de Deus. Jó irá logo apontar o erro da análise de Zofar; mas, primeiro, vamos nos certificar se entendemos os pensa­ mentos dele.

Porventura, não sabes tu que desde todos os tempos, desde que o homem foi posto sobre a terra, o júbilo dos perversos é breve, e a alegria dos ímpios, momentânea?

Jó 20:4, 5

Zofar considera Jó um pecador; portanto, acredita ser sua responsa­ bilidade dizer a ele que não vai durar muito neste mundo.

Ainda que a sua presunção remonte aos céus, e a sua cabe­ ça atinja as nuvens, como o seu próprio esterco, apodrece­ rá para sempre; e os que o conheceram dirão: Onde está? Voará como um sonho e não será achado, será afugentado como uma visão da noite. Os olhos que o viram jamais o verão, e o seu lugar não o verá outra vez. Os seus filhos procurarão aplacar aos pobres, e as suas mãos lhes restau­ rarão os seus bens. Ainda que os seus ossos estejam cheios do vigor da sua juventude, esse vigor se deitará com ele no pó.

Jó 20:6-11

Em toda esta verbosidade, Zofar está sugerindo que a vida de Jó é convoluta, torcida, estranha e esquisita; e então, de repente, puf!, ele se vai. As pessoas não vão encontrá-lo, porque os perversos não ficam por aí; Deus os remove.

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 199

Quando Zofar se refere aos seus ossos cheios de vigor, deitandose com ele no pó, está dizendo que isso é resultado do juízo de Deus. Afirma, com efeito: “Por ter vivido como viveu, por ter ocultado seus pecados secretos de nós, enquanto todos o julgávamos justo, o juízo virá em breve.” O que faltava de tato a Zofar, ele o compensava em crueldade! Você pode imaginar Jó suportando tal agressão? Tentando lidar com sua miséria e sofrimento, ele ouve agora: “Você vai morrer antes do que pensa.”

Isso não é tudo. Zofar continua sua diatribe. Ao ler as palavras dele, coloque-se no lugar de Jó.

Ainda que o mal lhe seja doce na boca, e ele o esconda debai­ xo da língua, e o saboreie, e o não deixe; antes, o retenha no seu paladar, contudo, a sua comida se transformará nas suas entranhas; fel de áspides será no seu interior. Engoliu rique­ zas, mas vomitá-las-á; do seu ventre Deus as lançará. Veneno de áspides sorveu; língua de víbora o matará. Não se deliciará com a vista dos ribeiros e dos rios transbordantes de mel e de leite. Devolverá o fruto do seu trabalho e não o engolirá; do lucro de sua barganha não tirará prazer nenhum.Oprimiu e desamparou os pobres, roubou casas que não edificou.

Jó 20:12-19

Esses golpes finais devem ter doído. Além de suas palavras insultuosas e reprovadoras, Zofar acusa Jó de tirar proveito indevido de outros por causa da sua riqueza. Ele insinua que Jó usou seus bens para explorar e oprimir os pobres, arrancando-os de suas casas e apro­ priando-se de suas propriedades. Tudo isto para dizer: “Os seus prazeres terminaram, Jó. Você está perdido. Sua perversidade final­ mente o derrubou.” E de admirar que o Senhor trate tão severamente a “falsa testemunha que profere mentiras”?

Zofar, infelizmente, ainda não acabou. Suas últimas palavras podem ser melhor entendidas na paráfrase de Eugene Peterson em The Message.

200 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Essas pessoas que negam a Deus nunca se satisfazem com o que têm ou com quem são; sua cobiça as impele sem cessar.

Saqueiam tudo, mas não conseguem ficar com nada.

No momento em que pensam possuir tudo, o desastre ataca; é-lhes servido um prato cheio de miséria.

Depois de encher a barriga com isso,

Deus faz com que provem a sua ira, sendo obrigados a mastigá-la durante algum tempo.

Enquanto correm para salvar a vida de um desastre, logo se deparam com outro.

São atirados de um problema para o seguinte, açoitados até quase perderem a vida.

Ficam presos numa casa de horrores, e vêem os seus despojos desaparecerem num abismo sombrio.

Suas vidas representam uma perda total — nenhum centavo em seu nome, nada mesmo.

Deus irá remover-lhes as roupas encharcadas de pecado e pendurar a roupa suja à vista de todos.

A vida se apaga completamente para eles, nada sobrevive à ira divina.

Eis aí! Esse é o plano de Deus para os perversos — o que lhes resta aguardar.

Jó 20:20-29, MSG (Tradução Livre)

Uma das fontes que tenho usado em meu estudo de Jó faz este comentário perspicaz: “Esta é a última vez que ouvimos falar de Zofar, e não vamos sentir sua falta”.2 Na vida, tragicamente, algumas pessoas são tão perniciosas e desmoralizantes que a melhor coisa que fazem é sumir do mapa e nunca mais voltar, pois tornaram todos à sua volta tão infelizes. Quando desaparecem, você pensa: “Já vão tarde!”

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 201

É assim que nos sentimos com relação aos Zofares em nossas vidas. Jó pode ter vivido há séculos, mas alguns de seus encontros contêm detalhes que soam verdadeiros. Este tipo de situação ainda continua.

APLICAÇÃO DA ABORDAGEM DE ZOFAR

Vamos avançar um pouco e enfrentar o problema. Alguns de vocês que estão lendo estas palavras têm línguas extremamente aguçadas. Dizem coisas que ferem, mas envolvem suas palavras em frases que parecem piedosas e até eloquentes. Elas podem até parecer superreligiosas às vezes, mas são doloridas e danosas. Insinuam muito mais do que é na verdade dito. Neste ponto, justamente, é que o autocontrole desempenha um papel vital. Como é importante pensar antes de falar, e depois, mesmo revendo nossas palavras com cuidado, medir o seu tom, seu possível impacto, sua veracidade. Zofar não fez nada disso. Com abandono temerário pronunciou palavras rudes e ferinas. Apesar de Jó ser um homem de Deus experiente e amadure­ cido, elas devem ter machucado ao explodirem em sua mente. As falsas acusações ferem até os fortes.

Formar hábitos de autocontrole é uma disciplina essencial. Ao receber uma informação sobre outra pessoa, é melhor perguntar a fonte: “Como você soube disso? Quem lhe contou? Essa informação é confiável?” Essas perguntas geralmente silenciam as pessoas que tendem a espalhar informação danosa e exagerada. Elas ajudam a chegar ao âmago dos boatos. Você deve saber, entretanto, que esse tipo de conversa franca tem um preço.

Li recentemente uma história verídica sobre um ministro...

cuja congregação constantemente se recusava a aceitar sua mensagem. Ele queria guiar o rebanho de Deus para as verdes pastagens e para junto das águas tranquilas, mas as ovelhas não queriam ser guiadas. O coral, com suas práticas ímpias, foi a gota d’água.

A situação tornou-se tão insustentável que ele convidou o coral a pedir demissão. Eles não só se demitiram, como

202 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

também convenceram a congregação a desistir de tomar parte nos cânticos no domingo seguinte. O resultado foi que o ministro teve de cantar sozinho, enquanto o coral e a con­ gregação se divertiam com o desconforto do pastor. Este estado de coisas continuou por algum tempo, e o ministro ficou abatido e perplexo com os acontecimentos.

Ele estava no fim de suas forças quando Deus lhe falou. Certo dia, sentado num parque, ele viu um pedaço rasgado de jornal no chão à sua frente, contendo uma mensagem que se adequava exatamente à sua necessidade. Era esta:

Homem algum é inteiramente aceito até que tenha sido antes completamente rejeitado.

Ele não precisava de mais nada. Fora completamente rejei­ tado por causa de Cristo, e o seu reconhecimento desse fato foi o começo de um ministério bastante frutífero. Embora inteiramente rejeitado pelo homem, ele fora completamen­ te aceito por Deus.3

Durante toda a preleção de Zofar, Jó estivera ouvindo o que minha mãe costumava chamar de “uma porção de palavrório”. Apenas ta­ garelice — o homem estava falando coisas desconexas. O que dizia contra Jó não era verdade, embora Zofar falasse de maneira poética e eloquente. Jó suportou pacientemente, mas recusou-se a permitir que essas palavras passassem em branco.

Já ouvi dizer que quando acusações falsas forem feitas contra a sua pessoa, se você ficar sentado quieto e não retrucar, Deus irá defendê-lo. Há ocasiões em que isso se aplica. Nem sempre, porém. Lembro-me muitas vezes de um dito da Revolução Americana: “Confie em Deus, mas mantenha a sua pólvora seca.”4 Sábio conse­ lho! Se a sua reputação estiver sendo arruinada por mentiras, se a sua empresa estiver falindo por causa de acusações falsas, se a sua igreja estiver sendo destruída e desmoralizada devido a informa­ ções erradas de lábios mentirosos, é necessário às vezes levantar-se

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 203 e endireitar as coisas. A verdade tem um método especial de silenciar as mentiras.

A RESPOSTA FIRME DE JÓ A ZOFAR

Fiquei impressionado ao ver que Jó se recusou a suportar estoicamente o castigo. Ele não encolhe os ombros e sussurra: “Oh! Está bem, não tem importância.” Aquela não era hora de mostrar passividade. As palavras de Zofar tinham sido insultuosas, exageradas e impróprias. Suas mentiras precisavam ser confrontadas e suas acusações, negadas. De fato, as primeiras linhas de Jó revelam forte determinação.

Respondeu, porém, Jó: Ouvi atentamente as minhas razões, e já isso me será a vossa consolação. Tolerai-me, e eu falarei; e, havendo eu falado, podereis zombar.

Jó 21:1-3

Ele começa dizendo a Zofar para “ouvir suas palavras (pelo menos daquela vez)”. E um imperativo, como se disséssemos: “Preste atenção!”

Segundo, ele diz a Zofar: “Tolerai-me”. Esse foi outro imperativo necessário, porque as pessoas que fazem acusações falsas não são no geral bons ouvintes. Não são conhecidas por colherem pacientemente informações verdadeiras. Por saber disso, Jó diz, com efeito: “Quero que faça duas coisas: Quero que ouça e que seja paciente enquanto apresenta a sua opinião.” Ele acrescenta: “Depois de me ouvir, você pode zombar.” Um contragolpe oportuno, que uma de minhas refe­ rências mencionou como sendo um “imperativo sarcástico” no hebraico. Não é interessante? “Depois de me ouvir, poderá então zombar; mas, pelo menos, permita que eu seja arguido no tribunal. Depois de ouvir e analisar pacientemente o seu caminho em meio a tudo isto, sinta-se então livre para zombar.” É possível que os acusa­ dores estivessem reagindo às respostas de Jó com assobios e gestos. Ele quer que isso acabe. Insiste então para que ouçam.

204 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Olhai para mim e pasmai; e ponde a mão sobre a boca.

Jó 21:5

Esta é a terceira ordem de Jó: Primeira, ouçam-me! Segunda, mos­ trem tolerância para comigo! Terceira, olhem para mim! Como eles podem fazer as três coisas ao mesmo tempo? “Ponde a mão sobre a boca.” A essa altura os três críticos deveriam estar discursando para o ar. Não estão mais olhando para ele. Jó diz então: “Olhem para mim”, como se dizendo: “Digam o que têm a dizer, mas falem de frente para mim”.

Os falsos acusadores também não nos fitam. Eles nos rodeiam. Ficam às nossas costas. Procuram pessoas fracas e ingénuas, dispostas a ouvir mentiras, e as contaminam com seus germes verbais. Jó ob­ têm assim a atenção dos acusadores com essas ordens rápidas.

Se você tomar tempo para analisar a resposta de Jó, verá que ele segue o esboço de Zofar, cobrindo os três pontos dele e colocando-os em forma de pergunta:

1. Quem diz que os perversos sempre morrem jovens?

(Jó 21:7-16)

2. Qual a prova de que os ímpios sempre sofrem calamidades?

(Jó 21:17-22)

3. Como você pode dizer que a morte é sempre mais severa com os perversos? (Jó 21:23-26)

Vamos examiná-los nessa ordem.

Primeiro, quem diz que os perversos sempre morremjovens? Jó começa a sua defesa fazendo a Zofar uma excelente pergunta ampliada. “Como é, pois, que vivem os perversos, envelhecem e ainda se tor­ nam mais poderosos?” (Jó 21:7).

Seus filhos se estabelecem na sua presença; e os seus descen­ dentes, ante seus olhos. As suas casas têm paz, sem temor, e a vara de Deus não os fustiga. O seu touro gera e não falha,

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 205 suas novilhas têm a cria e não abortam. Deixam correr suas crianças, como a um rebanho, e seus filhos saltam de ale­ gria; cantam com tamboril e harpa e alegram-se ao som da flauta. Passam eles os seus dias em prosperidade.

Jó 21:8-13

A análise realista não parece muito sombria. Entretanto, não há dúvidas: eles não conhecem realmente a Deus.

E são estes os que disseram a Deus: Retira-te de nós! Não desejamos conhecer os teus caminhos. Que é o Todo-Poderoso, para que nós o sirvamos? E que nos aproveitará que lhe façamos orações?

Jó 21:14, 15

A verdade é, Zofar: “longe de mim o conselho dos perversos” (Jó 21:16). Em outras palavras:. “Não sou perverso. Estou doente. Ninguém (inclusive você) sabe a razão da m inha enfermidade; mas, mesmo assim, estou doente. E um grande mistério. Saiba, porém, isto: não me enquadro definitivamente na categoria dos perversos.

Segundo, onde está a prova de que os ímpios sempre sofrem calami­ dade? O fato de eles não terem o Senhor Deus em suas vidas não significa que todos nessa condição morram cedo. Além do mais, eles nem sempre sofrem desastres. Siga a lógica de Jó aqui. Leia com cuidado as suas palavras.

Quantas vezes sucede que se apaga a lâmpada dos perver­ sos? Quantas vezes lhes sobrevêm a destruição? Quantas vezes Deus na sua ira lhes reparte dores? Quantas vezes são como a palha diante do vento e como a pragana arrebatada pelo remoinho? Deus, dizeis vós, guarda a iniquidade do perver­ so para seus filhos. Mas é a ele que deveria Deus dar o pago,

206 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

para que o sinta. Seus próprios olhos devem ver a sua ruína, e ele, beber do furor do Todo-Poderoso. Porque depois de morto, cortado já o número dos seus meses, que interessa a ele a sua casa? Acaso, alguém ensinará ciência a Deus, a ele que julga os que estão nos céus?

Jó 21:17-22

Jó está dizendo, com efeito: “O seu argumento não pega, Zofar. Há vários exemplos opostos ao que você está sugerindo.”

Quero agora mostrar-lhe um versículo que você talvez nunca considerou antes. Eu o aprendi há anos e me lembro dele quando trato de assuntos como este. Nós o encontramos entre as antigas palavras de sabedoria de Salomão:

Visto como se não executa logo a sentença sobre a má obra, o coração dos filhos dos homens está inteiramente disposto a praticar o mal.

Eclesiastes 8:11

Você está seguindo o pensamento dele? O significado é este: uma vez que a pessoa não é imediatamente julgada nem é subitamente vítima de uma calamidade quando erra, ela continua praticando o mal. O indivíduo acha que pode continuar repetindo o seu erro muitas ve­ zes, uma vez que não é castigado por ele. A falta de consequências rápidas leva o malfeitor a continuar errando. Você rouba dez dólares e nada acontece. Pensa então seriamente em roubar mais dez. Depois de roubar vinte e não ser apanhado e punido, você fica tentado a tornar-se um ladrão profissional, continuando nessa prática. Jó tinha essa idéia em mente ao dizer a Zofar que a calamidade não segue sempre o incrédulo de perto.

Devemos tirar da cabeça imagens estereotipadas de pessoas perdidas. Um grande número de cristãos pensa que em vista de o indivíduo ser incrédulo, ele é tolo. Isso não é verdade! Muitos perdidos

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 207 são brilhantes! De fato, alguns são mais inteligentes do que muitos de nós jamais sonharemos ser. Além disso, muitos dos perdidos vivem melhor do que nós e não são instantaneamente julgados ou removi­ dos da terra antes dos quarenta. Muitos vivem bem e têm vida longa, embora afastados do Todo-Poderoso. É fácil deixar que essa realidade nos confunda.

Há pouco tempo li sobre um pastor e um diácono que fizeram planos para visitar os perdidos em sua vizinhança. Um incrédulo notório, bastante conhecido na comunidade, visitara a igreja deles no domingo anterior. Ele assinara o cartão de visitante, incluindo o seu endereço. Os dois decidiram então ir vê-lo e falar sobre as BoasNovas. Foram juntos no mesmo carro e, quando chegaram naquele bairro residencial de luxo, subiram a rampa de entrada da sua ampla e bonita casa. O gramado era espesso e bem tratado, e o jardim era elegante. Crianças brincavam de amarelinha na entrada. Eles pude­ ram ver para além da garagem, onde havia um lindo tanque com uma fonte jorrando água. Por trás dos arcos de tijolo encontravam-se três carros de luxo, todos novos e impecáveis. Oculta na quarta gara­ gem estava uma Ferrari clássica, vermelho-brilhante. Ao estaciona­ rem na frente da residência, os dois homens puderam ver o dono da casa pela janela de seu escritório. Ele estava sentado em uma poltrona de couro macio, rindo e divertindo-se com os amigos, mastigando um punhado de pipocas e segurando um copo alto de bebida gelada na outra mão. Nesse momento, o jovem diácono virou-se para o pas­ tor e disse: “Agora, diga de novo, que tipo de boas notícias nós temos para este sujeito?”5

Nunca se esqueça: nossas boas notícias são para a vida futura. Crer nessas Boas-Novas não significa que você vai ficar repentina­ mente rico, nem que, se não crer nelas, estará condenado à pobreza ou à prisão. Nossa teologia precisa ser claramente compreendida e comunicada independentemente de estilos de vida económicos, ou preferências pessoais, ou preconceitos estreitos — como se os ricos nunca pudessem ser piedosos ou os pobres nunca pudessem ser perversos. Foi esse o erro de Zofar: “Olhe para si mesmo, Jó. Veja as condições em que está. Doente e despojado como ficou, evidentemente

208 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

há pecado em sua vida. Você não nos contou por que só os perversos sofrem assim.” Jó está pondo os pingos nos is: “Não, isso não é verda­ de. Não é raro que os perversos vivam na prosperidade, ou que aqueles que conhecem a Deus sofram.” Mas, lembre-se disto: na morte, todas as distinções desaparecem.

Terceiro, como você pode dizer que a morte é sempre severa com os perversos?

Um morre em pleno vigor, despreocupado e tranquilo, com seus baldes cheios de leite e fresca a medula dos seus ossos. Outro, ao contrário, morre na amargura do seu coração, não havendo provado do bem. Juntamente jazem no pó, onde os vermes os cobrem.

Jó 21:23-26

“Zofar, você errou no meu caso. Não pertenço a essa categoria.” Veja agora a resposta final de Jó ao conselho erróneo de Zofar:

Como, pois, me consolais em vão? Das vossas respostas só resta falsidade.

Jó 21:34

E preciso admirar a honestidade de Jó. Como o pastor que recusou ser subornado pelo irmão rico sobrevivente, Jó fala com franqueza. Esse tipo de discurso verdadeiro deve ser praticado em público. A falsidade não tem qualquer valor na remissão e deve ser confrontada diretamente. A palavra falsidade, no hebraico, significa: “traição ou fraude”. Em outras palavras: “Zofar, suas respostas permanecem cheias de traição. Não são confiáveis. Não sou como você falsa­ mente me acusa. Você precisa ouvir a verdade, uma vez que não a está dizendo nem a está ouvindo.” Não posso deixar de pensar se esta censura firme explica a saída súbita de Zofar de qualquer outro diálogo.

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 209

QUATRO RESPOSTAS AOS FALSOS ACUSADORES

Comecei este capítulo falando sobre o poder da língua. A medida que chegamos ao último dos três acusadores neste segundo ciclo, vimos repetidamente como as falsas acusações podem ser devastado­ ras. É bem provável que muitos de vocês que estão lendo estas linhas estejam sendo alvo das mentiras acusadoras de alguém. Essa pode ser uma cruz pesada para carregar. Passei por isso e falo então de acordo com minhas experiências pessoais penosas. Uma vez que este é um assunto constante para muitos de nós, deve ser útil traçar algumas diretrizes a serem seguidas com base na maneira como Jó lidou com seus acusadores. Encontro no exemplo de Jó pelo menos quatro reações que valem a pena mencionar. Cada uma é seguida de uma sugestão firme de duas palavras.

Primeira, ouça o que estã sendo dito, considerando o caráter do crítico. FIQUE CALMO! Você será tentado a pular na arena, reagindo pre­ cipitadamente na carne, dizendo coisas que mais tarde lamentará. Faça o possível para ouvir o que está sendo dito. Enquanto isso, tenha em mente o caráter da pessoa que é a fonte da acusação. Aceite tudo calmamente. Jó fez isso, o que o preparou para a sua nova resposta.

Segunda, responda com fatos verdadeiros e informação exata, conhecendo a natureza de seu acusador. FALE A VERDADE! Fique sempre do lado da exatidão. A outra pessoa pode ser um ex-marido, ou ex-mulher. Ele ou ela pode ser seu chefe anterior ou atual, um empregado, um vizinho, um pastor, ou um amigo. Não importa quem seja o indivíduo. Se você está sendo acusado, deve concentrar-se apenas nos fatos verídicos. Não reaja ou pense em meios de revidar. Se ceder a essas tentações, vai igualar-se ao acusador. Deus honra a integridade. Talvez não imediatamente, mas no final você será justificado. Lem­ bre-se da oração de Davi: “Faze-me justiça, S en h o r, pois tenho andado na minha integridade e confio no S en h o r, sem vacilar” (SI 26:1). A verdade vai prevalecer entre as pessoas que andam nela e tomam suas decisões nela baseadas.

Foi dito a Abraham Lincoln que ele precisava demitir o diretor geral dos correios. Todo tipo de acusações estava sendo feito contra o

210 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

homem. Lincoln pesou os boatos e a evidência, e a 18 de julho de 1864 escreveu ao Secretário Stanton uma carta avisando que não faria isso porque a informação era baseada em rumores e não em fatos concretos. Nessa carta ele concluiu corretamente: “A verdade é no geral a melhor defesa contra a calúnia”.6 Sábia resposta.

Permaneça na verdade. Não exagere a verdade, não a negue e não hesite em pronunciá-la.

Terceira, use exemplos que representem realidade e equilíbrio, con­ fiando a sua defesa ao Senhor. APÓIE-SE NELE! Pare e pense. Jó fez exatamente isso. Embora falando a verdade, ele deixou a defesa de seu caráter nas mãos do Senhor. Foi firme e deliberado, mantendo porém o autocontrole. Repito que compreendo o que é ser injusta­ mente difamado. Fui acusado de coisas, e esses boatos me fizeram perder o sono, embrulharam meu estômago e me levaram a perder o apetite. Decidi não dar qualquer atenção a eles. Descobri, entretanto, que não conseguia tirá-los da cabeça. Só quando decidi deixar as coi­ sas nas mãos do Senhor e descansar no seu soberano controle é que encontrei paz de espírito. Sem exceção (por favor, ouça isto!), sem exceção, só quando recuei deliberadamente e me apoiei com força em Deus é que minha mente começou a relaxar, minhas emoções se acal­ maram e minha paz interior voltou. Digo outra vez: a verdade vencerá. E Deus será glorificado.

Quarta, recuse-se a deixar que as acusações desanimem eperturbem você, lembre-se de que são absurdos e mentiras. FIQUE FIRME! Lem­ brar daquele conselho da Revolução, “Confiar em Deus e conservar a sua pólvora seca”, é essencial para manter o seu equilíbrio. Você pode estar confiando no Senhor para obter segurança, mas ainda tranca a casa todas as noites e liga o alarme. Quando entra no carro, você fecha as portas, não é? Fecha também as janelas, não é? Se não fizer isso, estará brincando com fogo. Confiar em Deus não significa pre­ sunção ingénua. A sabedoria deve ser aplicada a uma vida de fé. Para atravessar tempos difíceis é necessária uma mentalidade do tipo fique firme. Isso pode parecer complexo, mas é real. O realismo é uma mensagem poderosa.

RESPONDENDO COM SABEDORIA ÀS FALSAS ACUSAÇÕES 211

Recordo-me da história verídica de um médico que morava no Paraguai. Anos atrás, ele resistiu ao regime militar inescrupuloso daquele país, expondo especialmente os abusos cometidos contra os direitos humanos. As autoridades legais eram corruptas. Como resultado dessa exposição, elas se vingaram do médico sin­ cero prendendo seu filho adolescente e torturando-o até a morte. Os moradores da cidade ficaram indignados. Queriam transfor­ mar o enterro do garoto em uma enorme manifestação de protesto. O médico escolheu um meio melhor para protestar. Durante o funeral, o pai mostrou o corpo do filho como o encontrara na cela da prisão - nu, marcado pelos choques elétricos, queimaduras de cigarro, açoites e facadas. Todos passaram em fila pelo corpo, que não estava em um caixão limpo e macio, mas num colchão man­ chado de sangue da prisão onde o médico achara o filho. Esse provou ser o protesto mais forte imaginável, colocando a injustiça em grotesca exibição.7

Foi isso que Deus fez com Cristo na crucifixão. Ele não o embru­ lhou em um lençol branco e limpo, dizendo ao mundo: “Não, não! É difícil demais para vocês olharem isto.” Jesus não foi crucificado num porão escuro, privado, para que ninguém visse. A cruz foi colocada num monte, num lugar de humilhação pública, e seu corpo ficou ali pendurado. Exposto. No final, flácido, cinzento, morto. O método, representando uma mensagem ousada, era impactante, e aquela cruz continuará causando impacto em todos que irão fitá-la e viver. Olhe para ela outra vez. Deixe sua mente retratá-la. Carregar os pecados do mundo exigia uma cena sombria, agonizante.

Quero escrever estas palavras de encerramento para você que está passando por um período de falsa acusação. Que o Senhor o fortaleça. Que ele o segure com força durante essa crise. Que ele lhe dê sabedoria e graça para reagir. Que ele se torne real e pessoal para você, dando-lhe até cânticos durante a noite e repouso calmo com a certeza de que ele está defendendo a sua integridade. Quero também acrescentar: que ele engrosse a sua pele para que você não esmoreça enquanto aguarda a justificação.

212 JÓ: UM HOMEM DE TOLERÂNCIA HJERÓICA

Quero falar a você que está espalhando boatos, mentiras e calúnias contra outra pessoa. Não há nada m ais traiçoeiro do que isso. Nada. Se você afirma ser seguidor de C risto, tal coisa não deve continuar. Você machuca o corpo, torna a igreja enferma, arruina o testemunho de Cristo. Não há nada que o m undo perdido goste mais de ouvir e ver do que a família de Deus em conflito.

Para todos nós quero acrescentar um comentário final. Antes de mostrarmos nossa reprovação a Zofar, Bildade e Elifaz, devemos fazer uma sondagem de alma. Sigamos o exemplo do salmista e oremos: “Sonda-me, ó Deus, e conhece o m eu coração, prova-me e conhece os meus pensamentos; vê se há em m im algum caminho mau e guiame pelo caminho eterno” (SI 139:23, 24).

Termine a sondagem de alma antes de iniciar o próximo capítulo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já sentiu a dor profunda de ser acusado falsamente e a dificuldade de se defender diante de quem já acreditou na mentira?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Sabendo que até a igreja pode ser terreno fértil para línguas mentirosas, como você tem guardado a sua própria língua?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante de falsas acusações, como responder com sabedoria e mansidão em vez de revidar com a mesma arma?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Como Enfrentar as Críticas com Classe$t$, 18,
$conteudo$rnest Hemingway reduziu sua definição de coragem a três pala­ vras: “Graça sob pressão”.1 Essas palavras descrevem apropriada­ mente os indivíduos corajosos que, através dos séculos, continuaram avançando apesar dos golpes impiedosos da oposição e das críticas. Cada um deles poderia posar para um quadro intitulado Graça sob Pressão. Houve um dia em que o diabo se aproximou de Martinho Lutero e tentou acusá-lo de seus muitos pecados. Ele apresentou ao Reformador uma longa lista e começou a ler desde o primeiro item. Quando Satanás terminou, Lutero disse: “Pense um pouco mais, você deve ter esquecido alguns.” O diabo fez isso e acrescentou novos pecados à lista. O intercâmbio continuou até que o diabo não tinha mais nada a acrescentar. Então Lutero disse, simplesmente: “Ótimo. Agora escreva em tinta vermelha, sobre essa lista: ‘O sangue de Jesus Cristo, seu Filho, me purifica de todo pecado’.” E o diabo teve de retirar-se envergonhado.2

E

O décimo-sexto presidente dos Estados Unidos foi outro modelo magnífico de como lidar com os ataques pessoais ao seu caráter.

214 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

As críticas públicas contra ele aumentaram durante os últimos sete anos da sua vida. Um de seus biógrafos escreveu:

Abraham Lincoln foi caluniado, difamado e odiado talvez mais intensamente do que qualquer homem que já tenha ocupado o posto mais alto da nação (...)

A imprensa da época o chamou publicamente de quase todo nome imaginável, inclusive de babuíno grotesco, advogado rural de terceira classe que antes partia trilhos e agora divide a União, trocista vulgar, ditador, macaco, palhaço e outros. O Illinois State Register o rotulou de ‘o político mais astucioso e desonesto que já desgraçou um posto na América (...) As críticas severas e injustas não diminuíram depois que Lincoln fez o juramento formal para a presidência, nem eram apenas lançadas pelos sim­ patizantes dos sulistas. Elas partiam da própria União, do Congresso, de algumas facções do Partido Republicano, e inicialmente de seu próprio gabinete. Como presidente, Lincoln aprendeu que, por mais que fizesse, sempre have­ ria pessoas insatisfeitas (...) A medida que seus inimigos aumentaram, cresceram também as críticas contra ele. Lincoln, porém, mostrou sempre paciência, boa vontade e determinação, virtudes essas raras na maioria dos homens.3

Lincoln tinha quatro maneiras de responder a todas essas críticas. Primeira: com muita frequência, ele simplesmente as ignorava, cha­ mando-as de “mesquinhas”. Segunda: só respondia quando era im­ portante e faria diferença. Terceira: Lincoln formou o hábito de sentar-se e escrever longas cartas em defesa da sua integridade e reputação, desabafando sua ira e emoções. Depois as rasgava sem enviá-las. Quarta: ele sempre considerava o lado mais agradável da vida e mantinha um bom senso de humor. Graça sob pressão.

Um de meus personagens históricos favoritos é o pitoresco e bri­ lhante líder, Sir Winston Churchill. Ele não só lidava elegantemente

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 215 com as críticas, como também as solicitava. O biógrafo, Steven Hayward, confirma isto:

Ele era chamado de teimoso, embora deva ser reconhecido que a teimosia é irmã gêmea da determinação e, portanto, deve ser proporcional a ela. De fato, uma parte importante do método e do sucesso de Churchill era seu julgamento independente e sua autocrítica. “Todas as noites”, comen­ tou ele para um de seus ajudantes durante a guerra, “faço uma espécie de Corte Marcial contra mim mesmo, para ver se fiz algo eficaz durante o dia. Não apenas alguma coisa superficial, qualquer um pode fazer isso, mas algo realmente proveitoso”.

Apesar da tendência de Churchill de dominar as reuniões com a sua fluência verbal, ele sempre encorajou uma dis­ cussão completa das questões e nunca castigou ou demitiu alguém por discordar aberta ou vigorosamente dele. “Sem­ pre era dada oportunidade para uma discussão completa”, escreveu um de seus assistentes dos tempos da guerra. Lord Bridges escreveu, depois da guerra: “Não me lembro de ne­ nhum ministro, oficial ou funcionário civil que tivesse sido removido do cargo por ter-se oposto a Churchill e dito a ele que sua política ou propostas estavam erradas.” Além disso, Churchill jamais passou por cima dos chefes de equipe, mesmo quando discordava ativamente das decisões deles.4

Um dos exemplos mais eloquentes de todos os tempos seria o do rei Davi, quando seu filho Absalão liderou um motim que derrubou o pai. Davi foi forçado a abdicar do trono depois que Absalão con­ quistou o coração do povo, mediante mentiras e adulações. Não querendo causar mal ao próprio filho, Davi simplesmente partiu sem lutar, escapando com seus homens para salvar sua vida. En­ quanto viajava por uma região distante, um inimigo desafiador cha­ mado Simei apareceu de repente num morro, gritando maldições contra o rei destronado.

216 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Na Bíblia, 2 Samuel 16 registra o acontecimento, onde lemos: “Saiu e ia amaldiçoando” (v. 5). A seguir, lemos: “Atirava pedras contra Davi e contra todos os seus servos” (v. 6). Enquanto atirava pedras, Simei gritava: “Fora daqui, fora, homem de sangue, homem de Belial” (v. 7). Exemplo clássico de chutar um homem quando ele está caído. Esse o tipo de homem que Simei era, um verdadeiro perdedor.

A pergunta pertinente é: Como Davi respondeu a esse insano que atirava pedras e gritava comentários mordazes e maldições? Antes de ouvirmos a resposta de Davi, quero mencionar a resposta de Abisai (um dos guarda-costas de Davi): “Posso ir lá e cortar a cabeça dele?” (Gosto dessa fala! Se eu fosse Davi teria concordado, e Simei nem saberia que sua garganta fora cortada, tão rápido isso teria sido feito.) Mas Davi respondeu graciosamente:

Eis que meu próprio filho procura tirar-me a vida, quanto mais ainda este benjamita? Deixai-o; que amaldiçoe, pois o S enhor lhe ordenou. Talvez o S en h o r olhará para a mi­ nha aflição e o S en h o r me pagará com bem a sua maldição deste dia.

2 Samuel 16:11, 12

De novo, graça sob pressão.

Um de meus amigos de longa data, o também escritor David Roper, capturou a essência dessa graça e seus benefícios duradouros:

Nosso Senhor foi pregado na cruz; você pode contar com ser pregado no muro. E útil ver cada problema desse modo - como sendo crucificado com Cristo (...) Deus permite tais infortúnios porque fazem parte do processo que nos torna aquilo que ele quer que sejamos. A dor nos adoça, nos suaviza. Não temos mais medo de perder; aprendemos a desistir daquilo què desejamos. Não somos mais tão facilmente pro­ vocados à ira por causa de censuras ou danos. Aprendemos a

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 217 absorver o abuso sem revidar, a aceitar a reprovação sem nos colocar na defensiva, a responder à ira com uma resposta branda. Isso nos torna calmos e fortes.5

DE VOLTA A JÓ... AINDA PERSISTINDO

Não há melhor exemplo de graça sob pressão do que o do homem que estamos examinando. Jó sofreu a perda de todos os seus bens, a morte dolorosa de seus filhos e, finalmente, a perda da saúde e da felicidade. Além de tudo isso, recebe a visita carrancuda de seus amigos decididos a extrair dele uma confissão de culpa, uma vez que ninguém sofreria tanto se fosse inocente — ou era o que eles pensavam.

Dos capítulos 3 ao 37 continua o ataque impiedoso, monótono. Dois ciclos completos terminaram, e Elifaz está de volta para o terceiro round. Você pensaria que a esta altura ele daria uma folga a Jó; de modo algum. Na verdade, suas críticas se intensificam.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O que seria, para você, demonstrar "graça sob pressão" diante das críticas que recebe?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Assim como Lutero respondeu ao acusador apontando para o sangue de Cristo, como o evangelho silencia as acusações lançadas contra você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como enfrentar ataques ao seu caráter sem se deixar consumir pela mágoa nem pela necessidade de se justificar a todo custo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Terceiro Round com Elifaz... Ainda Criticando$t$, 19,
$conteudo$De acordo com o registro bíblico, Elifaz faz três comentários críticos. Ele não tem tato nem delicadeza.

• Você está sofrendo porque pecou (Jó 22:1-11).

• Você é hipócrita porque escondeu os seus pecados

(Jó 22:12-20).

• Você precisa arrepender-se porque seus pecados são evidentes para nós (Jó 22:21-30).

Seria de imaginar que os críticos de Jó recuassem a essa altura, mas eles se recusam a desistir. Com uma nova carga de munição verbal, Elifaz volta ao ataque. Ele está decidido a pressionar Jó até que ele ceda.

“Você é um pecador!” Elifaz acusa Jó com sarcasmo:

218 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Ou te repreende pelo teu temor de Deus ou entra contra ti em juízo? Porventura, não é grande a tua malícia, e sem termo, as tuas iniqiiidades?

Jó 22:4, 5

Por que ele diria isso? Lembre-se do seu raciocínio. Ninguém sofre assim a não ser que seja culpado. Ninguém perde tudo, inclusive os bens, a família e a saúde sem ser pecador! Elifaz observa corretamente: Jó perdeu tudo. Sua conclusão, porém, é incorreta: não foi por ser pecador. Jó demonstra graça sob pressão, não pronunciando qual­ quer palavra.

Elifaz insiste:

Porque sem causa tomaste penhores a teu irmão e aos seminus despojaste das suas roupas.

Jó 22:6

A sua imaginação era viva. Jó nunca fez isso, mas está sendo acusado como se tivesse feito. Trata-se de outra suposição errada.

Não deste água a beber ao cansado e ao faminto retiveste o pão.

Jó 22:7

Jó também não fez nenhuma dessas coisas, mas continuou calado e permitiu que fossem ditas.

As viúvas despediste de mãos vazias, e os braços dos órfãos foram quebrados.

Jó 22:9

Errado outra vez. Ele nunca fez isso. Jó, porém, contém os lábios.

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 219

Por isso, estás cercado de laços, e repentino pavor te con­ turba ou trevas, em que nada vês; e águas transbordantes te cobrem.

Jó 22:10, 11

Lembre-se de que isto é poesia. “Jó, você recebeu a plena reação do Deus vivo, que não pode suportar o pecado, do tipo que você vem ocultando. Por ser pecador, você está passando por todas essas cala­ midades traiçoeiras.”

Vamos voltar aos fatos originais? O caráter de Jó era tão puro, antes de todos esses problemas começarem, que Satanás o escolheu como aquele que desejava humilhar e expor como sendo hipócrita. O Senhor permitiu isso, sabendo que a sólida integridade e a maturida­ de estável de Jó poderiam resistir. A vida de perseverança indiscutível de Jó é que o caracterizava — justamente o oposto do que a acusação que lhe estava sendo feita afirmava. O crítico Elifaz não conhecia os fatos. Como poderia conhecê-los? Não esteve em cena antes da série de infortúnios. Apareceu depois de a doença se instalar. Elifaz não sabia do que estava falando. Está fatiando e cortando Jó em cubinhos com base em suas suposições imaginárias.

Os críticos habituais nunca investigam cuidadosamente os fatos. Para piorar as coisas, eles têm uma imaginação melodramá­ tica. Só precisam de um único detalhe para avançar e construir um castelo de areia cheio de mentiras. Alguns até acham que são “chamados” para fazer você se retorcer enquanto eles juntam um bloco de informações deturpadas que não se podem provar. Mas quanto dano elas causam! Embora fosse difícil ficar sentado e acei­ tar tudo, especialmente por saber que outros estavam ouvindo e alguns acreditando, Jó mostra muita dignidade ao refrear-se e nada responder.

“Jó, você é um hipócrita!” O crítico esquenta a atmosfera enquanto passa para o ataque seguinte. Ele vê Jó agora como hipócrita, culpado de esconder seus pecados, e o convida a fazer um retrospecto.

220 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Porventura, não está Deus nas alturas do céu? Olha para as estrelas mais altas. Que altura! E dizes: Que sabe Deus? Acaso, poderá ele julgar através de densa escuridão? Gros­ sas nuvens o encobrem, de modo que não pode ver; ele passeia pela abóbada do céu. Queres seguir a rota antiga, que os homens iníquos pisaram? Estes foram arrebatados antes do tempo; o seu fundamento, uma torrente o arrasta. Diziam a Deus: Retira-te de nós. E: Que pode fazer-nos o Todo-Poderoso?

Jó 22:12-17

Em nossas palavras, Elifaz está reprovando Jó. Já é difícil ouvir que você é pecador, mas ser acusado de hipocrisia é um golpe ainda mais baixo. Demonstrar graça sob pressão numa hora assim é especialmente desafiador para alguém como Jó, que era a antíte­ se do hipócrita.

Gosto da maneira como Warren Wiersbe define a hipocrisia:

O hipócrita não é alguém que falha em alcançar os alvos espirituais que deseja, porque todos nós falhamos de um modo ou de outro. O hipócrita é a pessoa que nem sequer tenta alcançar quaisquer objetivos, mas faz com que pensem que tentou. Sua confissão e sua prática não condizem.6

O pregador puritano do passado, Stephen Charnock, disse franca­ mente: “E triste ser cristão num jantar, pagão num supermercado e demónio em nossos armários.” 7 Não há dúvida a respeito, a hipocri­ sia é uma terrível realidade. Jesus a abominava. Em seu ministério terreno, ele expôs com mais veemência a hipocrisia do que qualquer outro vício. Uma das principais razões para ter feito o seu Sermão do Monte foi a desavergonhada hipocrisia dos fariseus.

Nosso Deus despreza a hipocrisia. É mais uma razão para enfatizar que Jó, “o servo de Deus”, não era culpado dela. Ele não está ocultando

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 221 nada. Podemos ter certeza de que, a esta altura, Jó havia confessado tudo. Você já ficou tão machucado que repassou mentalmente a história da sua vida, revendo todos os cantos escuros? Podemos estar certos de que isso aconteceu com Jó. De fato, ele admitiu mais de uma vez que levou sua vida perante o Senhor. Eis um homem esplêndido, que Elifaz está tratando como lixo!

“Jó, você precisa arrepender-se!” Elifaz vai mais além. Ele de­ cide pregar um sermão evangelizador para Jó; quem sabe talvez o homem possa ser salvo. Dá então início a uma excelente pregação evangelizadora. O problema é que Jó já faz parte da família de Deus.

Elifaz mesmo assim continua;

Reconcilia-te, pois, com ele e tem paz, e assim te sobrevirá o bem. Aceita, peço-te, a instrução que profere e põe as suas palavras no teu coração. Se te converteres ao Todo-Poderoso, serás restabelecido; se afastares a injustiça da tua tenda e deitares ao pó o teu ouro e o ouro de Ofir entre pedras dos ribeiros, então, o Todo-Poderoso será o teu ouro e a tua pra­ ta escolhida. Deleitar-te-ás, pois, no Todo-Poderoso e le­ vantarás o rosto para Deus. Orarás a ele, e ele te ouvirá; e pagarás os teus votos. Se projetas alguma coisa, ela te sairá bem, e a luz brilhará em teus caminhos. Se estes descem, então, dirás: Para cima! E Deus salvará o humilde.

Jó 22:21-29

Ele não se detém, continua sem parar com esta mensagem de salvação, enquanto Jó fica pacientemente sentado e ouvindo.

Com a máxima classe, Jó não interrompe nenhuma vez o discurso prolongado de Elifaz. Ele nem sequer tenta esclarecer as coisas ou levantar a mão para fazer uma pergunta. De fato, quando Jó responde, não se preocupa em se defender. Fala com o Senhor e sobre o Senhor, mas ignora todas as críticas e insinuações. Mais uma vez, Jó dá exemplo de graça sob pressão.

222 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

JÓ RESPONDE... DEMONSTRANDO CLASSE

Ao chegarmos aos capítulos 23 e 24 de Jó, observamos três respostas calmas, vulneráveis, dadas por ele. Tome tempo para ler esses dois capítulos inteiros — são magníficos! O primeiro tema de Jó parece ser o seguinte: Não consigo localizar a presença de Deus; mas, confio em ti, Senhor. Vejo isto claramente nos doze primeiros versículos do capítulo 23, onde nosso herói admite, francamente:

Ah! Se eu soubesse onde o poderia achar! Então, me chegaria ao seu tribunal.

Jó 23:3

Jó parece ter um julgamento em mente. “Gostaria de saber em que cadeira do tribunal ele senta. Gostaria de saber onde encontrálo. Algum lugar - qualquer lugar - nesta terra em que pudesse achegar-me a ele.”

Jó continua:

Exporia ante ele a minha causa, encheria a minha boca de argumentos. Saberia as palavras que ele me respon­ desse e entenderia o que me dissesse. Acaso, segundo a grandeza de seu poder, contenderia comigo? Não; antes, me atenderia. ,

Jó 23:4-6

Oculta nessas palavras ardentes encontra-se uma das grandes coisas sobre o nosso Deus. Quando nos aproximamos dele como somos, nunca o ouvimos gritar: “Que vergonha!” Deus ouve nossas súplicas, nossos sentimentos de necessidade e responde rapidamente: “Perdôo você. Amo você. Compreendo você. Estou aqui; louvo você por enfrentar a verdade.”

Você notou como Jó se refere à resposta do Senhor?

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 223

Acaso, segundo a grandeza de seu poder, contenderia comigo? Não; antes, me atenderia. Ali, o homem reto pleitearia com ele, e eu me livraria para sempre do meu juiz.

Jó 23:6, 7

Todo cristão encontra aqui uma verdade valiosa que podemos aprender do nosso Deus. Quando as pessoas fazem aberta e vulneravelmente a sua confissão, há uma resposta apropriada de duas palavras: “Perdôo você”. Elas não precisam ser humilhadas ou envergonhadas por te­ rem falhado. Precisam da certeza do perdão. Jó pergunta: “Contenderia [Deus] comigo?” Depois responde: “Ele não contenderia comigo, apesar de ser muito mais poderoso. Antes, me daria atenção. Eu po­ deria argumentar com ele e seria salvo para sempre do meu Juiz.” Não é maravilhoso?

Jó, porém, se esforça, admitindo finalmente a sua frustração: não consegue encontrar Deus.

Eis que, se me adianto, ali não está; se torno para trás, não o percebo. Se opera à esquerda, não o vejo; esconde-se à direita, e não o diviso.

Jó 23:8, 9

Isso já aconteceu com você? Claro, com todos nós! Há dias em que buscamos em vão alguma evidência visível do Deus vivo. Fico ima­ ginando se não seria ótimo acordar no meio de um céu de lua cheia esta noite, espiar pela janela do meu quarto e ver o seguinte escrito no céu: “Caro Chuck, ouço você. Estou aqui. Estou no controle. Com amor, Deus.” Eu me alegraria demais se isso acon­ tecesse! Gostaria de entrar em meu carro, depois de um dia pesado na igreja, ligar o rádio e ouvir Deus interromper a programação, dizendo: “Antes de ouvir esta emissora, Chuck, quero falar um pouco com você.” Vamos falar a verdade: todos nós gostaríamos de ouvir uma voz audível ou ler uma mensagem visível de Deus.

224 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Mas não é assim que funciona. Nosso andar com ele é um andar de fé.

Jamais esquecerei a notícia da tragédia que caiu sobre a família de uma criança. A mãe morreu de repente, bem cedo na vida dela. O pai e a filha ficaram apenas com a lembrança daquela esposa e mãe maravilhosa. O sofrimento e a tristeza deles foram profundos. Na noite seguinte ao funeral, o pai pôs a filha na cama e comoveu-se ao vê-la lutando com as lágrimas. Decidiu então colocar um colchão ao lado da cama dela, e logo adormeceram. No meio da noite, ele a ouviu chorar. Chamou-a pelo nome. Através das lágrimas, a filha disse: “Papai, é tão difícil. Sinto tanta falta dela.” Combatendo suas próprias lágrimas, ele tomou-lhe a mão, e a menina disse: “Oh! assim está muito melhor”, colocando sua mão no ombro e no peito dele. Desejando consolá-la, o pai falou: “Você sabe, querida, temos o Senhor para nos apoiar.” A filha respondeu: “Eu sei disso, pai, mas esta noite preciso de alguém de carne e osso.”8

Se você mora sozinho, deve sentir às vezes isso. No caso de ter sido abandonado por causa de uma separação, quando antes tinha um companheiro a seu lado e agora é só você, deve certamente acordar à noite e pensar: “Gostaria de ver Deus aqui, neste momento. Gostaria de poder estender a mão e tocá-lo, ou pelo menos ouvir suas palavras. Como isso seria consolador!

Jó é um homem importante e piedoso. É um santo amadurecido, sem qualquer dúvida! Mesmo assim, elé anseia pela presença de Deus. “Oh! se eu pudesse saber onde ele está. Mas não posso vê-lo, contemplá-lo, ou discerni-lo!”

Depois disso, Jó faz uma pausa e reflete. A sua perspectiva muda de desapontamento para certeza. Nas palavras que se seguem, lemos alguns dos versículos mais importantes em toda a Bíblia. Estou me referindo a Jó 23:10-12. Há muitos anos gravei esses três versículos em minha mente. Devo tê-los repetido centenas de vezes a outros e também a mim mesmo durante os dias maus em que lutei em meio a tribulações. Para ser sincero, penso que citei esses versículos mais do que qualquer outra passagem das Escrituras. Eu os destaquei em

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 225 minha Bíblia com tinta preta. Sugiro que você faça o mesmo. É pura graça sob pressão! Essas palavras lhe darão uma diretriz. Leia devagar e com cuidado:

Eis que, se me adianto, ali não está; se torno para trás, não o percebo. Se opera à esquerda, não o vejo; esconde-se à direi­ ta, e não o diviso. Mas ele sabe o meu caminho; se ele me provasse, sairia eu como o ouro. Os meus pés seguiram as suas pisadas; guardei o seu caminho e não me desviei dele. Do mandamento de seus lábios nunca me apartei, escondi no meu íntimo as palavras da sua boca.

Jó 23:8-12

Embora incapaz de localizar a presença de Deus, Jó declara sua confiança nele. “Elifaz, Bildade e Zofar, vocês podem dizer o que quiserem contra mim, Deus sabe o caminho em que eu ando. Ele sabe a verdade. E o meu Justificador. Ele e eu nos falamos. Confio nele. Creio nele. Além disso, depois que a provação ter­ minar e ele tiver cumprido o seu propósito em mim, eu sairei como o ouro’.”

Podemos contar com isso, meu amigo. Quando a provação terminar, ela terá enriquecido você. O ouro substituirá o metal inferior. Peço que deixe essas palavras ficarem gravadas em sua cabeça, de modo tão profundo que se transformem num filtro divino para tudo que acontecer em sua vida a partir deste dia. Deus sabe o caminho em que você está andando.

Uma das ideias heréticas que flutuam ao nosso redor nestes dias é a “abertura de Deus”. “Teísmo Aberto” é o nome teórico, como mencionei na página 59. O conceito é que Deus ainda está apren­ dendo enquanto observa como reagimos às situações. Em outras pa­ lavras, onisciência não é realmente onisciência. Deus está envolvido em uma espécie de conhecimento progressivo. Bobagem! O Deus de nossas vidas tem pleno conhecimento e controla por completo o ca­ minho em que andamos. A sua necessidade e a minha é “guardar o

226 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

seu caminho e não nos desviarmos dele (...) nunca nos apartarmos do mandamento de seus lábios”.

Pare e pense. A que se refere o “mandamento de seus lábios”? À sua Palavra. É como se Deus estivesse falando através de seus lábios quando abrimos o seu Livro. A sua Palavra nos ensina, instrui, acon­ selha, consola, reprova e dirige nossos passos.

Mas ele sabe o meu caminho; se ele me provasse, sairia eu como o ouro.

Jó 23:10

Jó está seguindo a Palavra de Deus - ela é mais importante do que pão e água. Jó afirma que valorizava mais as palavras de Deus do que tudo que o mantinha vivo. Isto explica a perseverança do homem e também nos ajuda a compreender como ele continuou a demonstrar graça sob pressão.

Você também pode fazer isso!

Jó faz agora uma segunda declaração, que revela ainda mais a sua vulnerabilidade: “Sou incapaz de entender o plano de Deus, mas confio nele.” Lembra-se da primeira declaração? “Sou incapaz de localizar a presença de Deus, mas confio nele.” Quando coloca­ mos as duas juntas mantemos o equilíbrio, e em cada situação ainda confiamos nele. Jó admite que o plano de Deus está-se desenrolando; todavia, ele não consegue compreendê-lo. De fato, ele se refere a Deus como “único”.

Mas, se ele resolveu alguma coisa, quem o pode dissuadir? O que ele deseja, isso fará.

Jó 23:13

Essa é uma declaração muito importante. “O que ele deseja, isso fará.” Deus não pede a nossa permissão. Ele não nos conta o seu plano antecipadamente. Não nos dá uma pré-estréia das próximas

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 227 atrações e depois acrescenta: “Você concorda comigo?” Ele também não explica por que as coisas são tão difíceis. Não nos dá a conhecer como tudo termina. Não nos conta quanto tempo um determinado episódio vai durar. E daí? Você e eu confiamos nele. Confiamos nele. Servimos a ele. Mantemos nossos pés nos seus caminhos. Damos valor à sua Palavra, e o que Deus deseja é isso que fará. Continuamos nos apoiando nele, embora não compreendamos o que pretende fazer. (Não se preocupe em telefonar-me, eu também não posso explicar!)

A fim de tornar as coisas ainda mais interessantes, continue len­ do: “Pois ele cumprirá o que está ordenado a meu respeito e muitas coisas como estas ainda tem consigo” (Jó 23:14). Há uma singulari­ dade aqui. Ninguém mais era Jó, e Jó tinha o que era designado para ele, o que se tornou a sua vida, seu modo de viver, seu destino. Assim como Deus está realizando o que foi destinado a você (não fique esperançoso demais), “muitas coisas como estas ainda tem consigo”. Ele tem muitas coisas esperando por você, uma vez que consiga passar por esta. Não é admirável?

Por isso, me perturbo perante ele; e, quando o considero, temo-o.

Jó 23:15

Isso é vulnerabilidade. Vá em frente e admita - “aterrorizado”. Jó finalmente faz essa admissão. Não é errada. Penso que o Senhor gosta de ouvir-nos dizer, ocasionalmente: “Senhor, eu o temo!”

Ouvi a respeito de um dos grandes pregadores do passado que ficou tão aflito com a demora de Deus que foi para o escritório, fe­ chou a porta e disse em voz alta: “Deus, por favor, apresse-se. O Senhor está demorando tanto!” Jó diz em voz alta: “O Senhor me assusta. Aterroriza-me!” Se você disser isso a ele, Deus irá compreen­ der muito bem.

São João da Cruz, escreveu: “Deus discerne as imperfeições em nós.” (Vou repetir isso; é algo profundo.) Deus discerne as imper­ feições em nós, e por causa do seu amor insiste para crescermos.

228 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Seu amor não se contenta em deixar-nos nas nossas fraquezas, e por esta razão:

Ele nos leva para a noite escura.

Nos afasta de todos os prazeres, dando-nos tempos árduos e trevas interiores. Ao fazer isso, ele pode remover todos esses vícios e criar virtudes em nós. Através da noite escura o orgulho se transforma em humildade, a cobiça em simplici­ dade, a ira é substituída pelo contentamento, a lascívia se torna paz, a gula em moderação, a inveja em alegria e a preguiça em força.

Alma alguma irá crescer na vida espiritual a não ser que Deus trabalhe passivamente nela por meio da Noite Escura.9

A resposta final de Jó é registrada no capítulo 24 de seu diário divinamente inspirado. Uma vez que foi incapaz de localizar a pre­ sença de Deus, ele recuou e admitiu: “Confio nele.” Incapaz de explicar o plano de Deus, declarou outra vez: “Confio nele.” (Pascal escreveu, no passado: “O silêncio eterno desses espaços infinitos me amedronta.”)10

A terceira declaração de Jó, entretecida neste capítulo, é igual­ mente profunda: “Sou incapaz de justificar a permissão de Deus, mas confio nele.” O que ele está querendo dizer? Começa no campo (vv.1-11), onde mostra várias situações permitidas por Deus. Vai depois para a cidade (vv.12-17) e faz o mesmo. No final (vv. 18-24), lança maldições sobre os perversos e deixa as coisas como estão.

Por exemplo:

Há os que removem os limites, roubam os rebanhos e os apascentam.

Jó 24:2

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 229

Deus não interfere para os deter.

Levam do órfão o jumento, da viúva, tomam-lhe o boi.

Jó 24:3

Deus igualmente não os detém, mas permite que o façam.

Desviam do caminho aos necessitados, e os pobres da terra todos têm de esconder-se.

Jó 24:4

Não se trata só de poesia de boa qualidade, mas de algo verdadeiro.

Como asnos monteses no deserto, saem estes para o seu mister, à procura de presa no campo aberto, como pão para eles e seus filhos. No campo segam o pasto do perverso e lhe rabiscam a vinha. Passam a noite nus por falta de roupa e não têm cobertas contra o frio.

Jó 24:5-7

Deus não impede nada disso.

Pelas chuvas das montanhas são molhados e, não tendo refúgio, abraçam-se com as rochas.

Jó 24:8

Deus não entra em cena para impedir isso. Ele permite a dificuldade.

Orfãozinhos são arrancados ao peito, e dos pobres se toma penhor.

Jó 24:9

230 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

As situações continuam até o versículo 11. Jó está dizendo que essas coisas ocorrem pela vontade permissiva de Deus. Por que ele permite isso? Não podemos explicar, só sabemos que ele o faz.

Jó aponta agora muitos dos erros na cidade.

Desde as cidades gemem os homens, e a alma dos feridos clama; e, contudo, Deus não tem isso por anormal. Os per­ versos são inimigos da luz, não conhecem os seus caminhos, nem permanecem nas suas veredas.

Jó 24:12, 13

E Deus permite que aconteçam.

De madrugada se levanta o homicida, mata ao pobre e ao necessitado, e de noite se toma ladrão.

Jó 24:14

E Deus não toma providências.

Aguardam o crepúsculo os olhos do adúltero; este diz con­ sigo: Ninguém me reconhecerá; e cobre o rosto. Nas trevas minam as casas, de dia se conservam encerrados, nada que­ rem com a luz. Pois a manhã para todos eles é como sombra de morte; mas os terrores da noite lhes são familiares.

Jó 24:15-17

Poderíamos ir até o fim desta lista. Há erros, falhas e injustiças. Houve roubos e pecados sexuais, assim como males ocultos feitos na escuridão, e onde está Deus? Ele permite isso. Por quê? “Não sei”, diz Jó. “Penso que o importante aqui é que essas coisas são permitidas com propó­ sitos desconhecidos para nós, exatamente como aconteceu comigo. Deus permitiu tudo!” Os que cometem erros conseguem se livrar.

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 231

Nada acontece aos que se aproveitam dos outros. O sofrimento inexplicável está nessa mesma categoria.

Você e eu poderíamos mencionar eventos em nossa vida que o Senhor poderia ter detido, mas não o fez. Isto não se refere só ao Holocausto judeu, nem simplesmente aos erros da Era das Cruzadas, nem aos padres da igreja católica romana que molestaram crianças. Todo tipo de coisas que possamos imaginar estão contidas aqui, e Deus poderia ter impedido cada uma, mas não o fez. E um mistério! Este é o ponto. “Não posso justificar as permissões de Deus, mas confio nele.” Esse é um grande passo, especialmente se uma das cri­ anças molestadas é seu filho; ou se uma das crianças sequestradas é seu filho; ou se o teste de confiança visa especificamente uma prova­ ção que você e sua família têm de suportar. Jó termina então sua resposta lançando maldições sobre todos os perversos.

Enquanto Jó espera pela resposta de Deus, sua mente voltase para os problemas incompreensíveis do mundo que permitem que os perversos, inclinados a atos brutais e egoístas de violência, oprimam os fracos e impotentes. Seus próprios sofrimentos o tomaram mais sensível ao sofrimento humano em geral. Ele anseia por que Deus conserte os erros na terra. Embora lamente os males sociais, ele permanece tão confiante em que Deus irá eventualmente fazer justiça que pronuncia uma série de maldições sobre os perversos. A preocupação de Jó com a justiça o leva a desafiar a teologia de sua época; mas, ao mesmo tempo, por causa de sua fé profunda em Deus, sua lamentação o faz dirigir-se ao Senhor para obter uma resposta. Ele está ansioso para que Deus amaldiçoe os perversos, tornan­ do-os responsáveis pelos seus atos malignos.11

Jó está dizendo, na verdade: “Vocês acham que sou perverso? Posso entretanto afirmar que, se pudesse entender-me com Deus, ele amaldiçoaria cada indivíduo que age mal. Eu me oporia a tudo que mencionei aqui.” E o versículo 25 é bastante afirmativo, não é? “Se não é assim, quem me desmentirá e anulará as minhas razões?”

232 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Pode alguém levantar-se e dizer: “Isto é absurdo”? Ninguém poderia fazer isso, nem mesmo Elifaz. A resposta ardorosa de Jó deixa seus críticos silenciosos.

LIÇÕES QUE PERDURAM... ATÉ HOJE

A principal mensagem que Jó nos deixa é bastante evidente a esta altura: embora Deus seja evasivo e misterioso, estranho e silencioso, invisível e aparentemente passivo, Ele édigno de confiança. De acordo com isso, quero sugerir estas três lições que perduram.

Primeira, resista à tentação de explicar tudo; Deus sabe.

Segunda, concentre-se nos benefícios futuros e não no sofrimento presente; Deus dirige.

Terceira, aceite a soberania do Todo-Poderoso; Deus controla.

Recuse-se a crer que a vida depende do destino cego ou do puro acaso.

Tudo que acontece, inclusive as coisas que você não pode expli­ car ou justificar, está sendo tecido como uma enorme e bela tapeçaria. Deste lado terreno ela parece borrada e cheia de nós, estranha e distorcida. Da perspectiva do céu, porém, seu desenho é incrível. Melhor que tudo, é feita para a maior glória do Senhor. Neste momento, tudo parece tão confuso, mas um dia os detalhes irão juntarse, e então compreenderemos.

No início deste capítulo mencionei o livro de David Roper, Elijah, a Man Like Us. Volto ao livro para apresentar uma história contada por ele que ilustra perfeitamente o meu ponto.

Carolyn e eu estávamos recentemente na primeira etapa de um vôo de Frankfurt, Alemanha, para a nossa casa em Boise, Idaho. Nossa primeira parada foi em Boston.

A semana fora exaustiva. Eu adormeci no momento em que sentei em minha poltrona, mas fui logo despertado por um distúrbio no corredor.

COMO ENFRENTAR AS CRÍTICAS COM CLASSE 233

A aeromoça e um passageiro que estava sentado à esquerda de Carolyn discutiam sobre o assento que lhe fora designa­ do. De alguma forma, o homem ficara separado da noiva, que se achava várias fileiras atrás de nós.

O homem foi ficando cada vez mais exasperado e contestador até que um passageiro, sentado ao lado da noiva dele, ofe­ receu-se para trocar de lugar. A troca foi feita, e o novo com­ panheiro de Carolyn sentou-se, tirou um bloco de papel e começou a trabalhar em um projeto.

Infelizmente, havia um garotinho francês tagarela à sua es­ querda - uma criança encantadora - que queria conversar. O homem, que parecia ser a alma da paciência, desistiu do projeto depois de alguns minutos e começou a dialogar ami­ gavelmente com o menino. Carolyn foi logo incluída na conversa.

Ouvi o homem dizer que era de Los Gatos, Califórnia, uma cidade próxima de Los Altos, onde Carolyn e eu moramos dezoito anos. Ele estava voando de Frankfurt para Boston, indo em seguida para San Francisco. Ouvi Carolyn comentar que tínhamos muitos amigos na região da Baía e depois disso adormeci.

Quando acordei, mais ou menos uma hora mais tarde, des­ cobri Carolyn partilhando sua fé com seu amigo recente, escrevendo em seu bloco de papel, traçando diagramas e animando sua história. Ele ouvia atentamente e fazia per­ guntas. Fiquei ali sentado em silêncio, orando por ela e pelo homem.

A certa altura, ele disse: “Você tem a mesma crença que minha mulher.”

‘“Verdade?”, respondeu Carolyn. “E como ela passou a ser uma seguidora de Cristo?”

“Por meio da Bible Study Fellowship”, ele respondeu.

234 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Como ela ficou sabendo da Bible Study Fellowship?”, per­ guntou Carolyn.

“Uma amiga dela, Nel King, convidou-a para participar.”

“Que interessante! Nel King é uma de minhas melhores amigas!”

Então caiu a ficha: alguns meses antes de nos mudarmos para Boise, Nel pedira a Carolyn que orasse por uma amiga, que acabara de se tornar cristã por meio da Bible Study Fellowship, e pelo seu marido, que ainda não era crente — o indivíduo agora sentado à esquerda de Carolyn - ali “pelo poder que os homens enganados chamam de acaso.12

É isso aí - uma parte do plano perfeito de Deus se desenrolando. Você não pode explicá-lo. Não conseguiria juntar todas as suas peças, mesmo que tentasse. Não consegue compreender, e haverá ocasiões em que não vai gostar dele. Mas, como estamos aprendendo com Jó, Deus não vai pedir a sua permissão. E daí? Confiamos nele. Vou escrever mais uma vez: os que agem desse modo descobrem, sem tentarem fazer com que aconteça, que começaram a demonstrar graça sob pressão. Aceitar menos que isso leva a uma existência deplorável.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você já enfrentou alguém que, como Elifaz, se recusou a desistir e insistiu em acusá-lo de pecados que você não cometeu?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que a falsa lógica de que "todo sofrimento é castigo por pecado" fere tanto quem está inocente em sua dor?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante de acusações repetidas e sem fundamento, o que ajuda você a permanecer em silêncio e a confiar o seu caso a Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Futilidade de Desenroscar o Inescrutável$t$, 20,
$conteudo$O

estudo de Jó é essencialmente o estudo do próprio Deus. Pense sobre isso.

• Foi Deus que se encontrou primeiro com Satanás e fechou o acordo referente a Jó.

• Foi Deus quem permitiu ao Adversário que atacasse Jó.

• Foi Deus quem estabeleceu as demarcações, colocando limites em cada ataque.

• Foi Deus quem permitiu que tudo acontecesse, do começo ao fim.

• Foi Deus (como veremos no capítulo 17) quem quebrou o silêncio e falou com Jó.

E foi Deus quem finalmente endireitou as coisas, repreendendo os “consoladores molestos” e recompensando o seu servo fiel.

Durante toda a história, é Deus quem prende a nossa atenção e nos surpreende; ou melhor, ele nos confunde.

Nós, os que fomos criados na igreja, aprendemos desde crian­ ças que Deus é bom, amoroso, clemente, compassivo, justo, santo,

236 Jó: UM HOMEM DE TOLERÂNCIA HERÓICA

cheio de misericórdia e graça. Ele “se compadece das nossas fraquezas” (Hb 4:15), “sabe o de que tendes necessidade, antes que lho peçais” (Mt 6:8) e “farta de bens a tua velhice” (SI 103:5). Você se lembra da oração à hora das refeições? “Deus é grande, Deus é bom, agradeça­ mos a ele por este alimento. Amém.”

A seguir, observamos Jó. Vemos também Deus recuando nas som­ bras e permitindo que Satanás aflija seu servo piedoso, enquanto ele fica em silêncio, mantém distância e se recusa a responder quando Jó suplica uma explicação. Quero ser franco, tudo isso parece certamente cruel. Caso não seja cruel, pelo menos está em absoluto contraste com o Deus que conhecemos quando crianças na escola dominical.

Resta-nos então uma dentre duas conclusões. Não tivemos uma compreensão completa e correta do nosso Deus, ou não com­ preendemos realmente a história de Jó. Sugiro que seja a primeira. A descrição que nos foi feita na escola dominical estava incompleta.

Paulo escreveu uma declaração breve, mas profunda, sobre o Senhor nosso Deus em Romanos 11:33. Peço que você faça uma pausa e deixe que as palavras penetrem. Leia devagar, preferivelmente em voz alta, e leia mais de uma vez antes de prosseguir.

Ó profundidade da riqueza, tanto da sabedoria como do conhecimento de Deus! Quão insondáveis são os seus juízos, e quão inescrutáveis, os seus caminhos!

Tome tempo para refletir em duas palavras nessa segunda frase: “insondáveis” e “inescrutáveis”. Permita que elas penetrem profunda­ mente em seu cérebro.

Já no primeiro século, quando Paulo escreveu essa carta, ele informou aos leitores de Roma (estamos também incluídos) que Deus é insondável e inescrutável. Não me entenda mal. Isso não significa que ele deixa de ser bom, e também não significa que não é mais bondoso e clemente. Deus é tudo isso e muito mais. E também incompreensível. É profundo. Seus caminhos estão além da nossa

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 237 compreensão, parecendo misteriosos e inexplicáveis para nós. Quan­ to mais pensamos nisto, tanto mais percebemos que há muita coisa sobre Deus que nunca nos foi ensinada. Em meio ao nosso estudo de Jó, somos forçados a nos aprofundar muito mais na questão do Seu caráter e descobrir novas dimensões. Em uma só palavra, Deus é inescrutável.

Uma das primeiras vezes em que essa palavra chamou minha atenção ocorreu quando eu estava me formando no seminário na pri­ mavera de 1963. O presidente do Seminário Dallas na época era o Dr. John E Walvoord, hoje falecido, um homem sempre admirado pela sua mente teológica esclarecida. Ele disse aos formandos que esperava que todos nós continuássemos a nos lembrar de que o nosso Deus é inescrutável. A seguir citou Romanos 11:33. Olhando em volta da audiência na capela do campus, acrescentou com um sorriso: “Haverá ocasiões em que vocês tentarão desenroscar o inescrutável. Não poderão fazê-lo!”1 Como sempre, o Dr. Walvoord tinha razão. Porém, desejamos tanto fazer isso. Tudo em nós anseia por explicar tudo sobre Deus e interpretar todos os seus caminhos, chegando a uma compreensão completa de todas as atividades dele.

Deus, afinal, fez de nós seres inteligentes. Além disso, ele nos instruiu a conhecê-lo. Por desejar isso, continuamos a perseguir essa compreensão divina, mas quanto mais cavamos, tanto mais insondá­ vel ele se torna. Isso não deveria nos surpreender; ficamos entretanto frustrados por não saber. Preferimos coisas sondáveis, ou, se quiser, passíveis de investigação, escrutáveis. Queremos ser capazes de expli­ car e analisar corretamente o que quer que seja, a fim de entendermos a história inteira. Isso não é, porém, possível quando se trata do Deus vivo e soberano.

E especialmente importante compreendermos que ele não é como nós, nem os seus métodos são os nossos. Absolutamente, nao. O profeta Isaías nos lembra de Deus:

Porque os meus pensamentos não são os vossos pensamen­ tos, nem os vossos caminhos, os meus caminhos, diz o

238 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

SENHOR, porque, assim como os céus são mais altos do que a terra, assim são os meus caminhos mais altos do que os vossos caminhos, e os meus pensamentos, mais altos do que os vossos pensamentos.

Isaías 55:8, 9

Nós somos finitos; ele é infinito. Nossos caminhos são limitados; os dele, ilimitados. Somos pequenos; ele é vasto. Uma viagem imaginá­ ria pelo espaço sideral ajuda a compreender a enormidade de Deus.

Se fosse possível viajar à velocidade da luz, poderíamos che­ gar à Lua em 1 1/3 segundo. Mas, continuando à mesma velocidade, você sabe quanto tempo seria necessário para alcançar a estrela mais próxima? Quatro anos.

O Planetário Hayden, da cidade de Nova York, possui uma réplica em miniatura de nosso sistema solar, mostrando as velocidades e tamanhos dos nossos planetas. O interessante é que os três planetas distantes não são sequer incluídos. Não havia espaço para Urano, Netuno e Plutão. Urano ficaria no corredor externo do planetário. Netuno ficaria próximo da Oitava Avenida. E Plutão? A mais três longas avenidas de distância, na Quinta Avenida. A propósito, as estrelas não foram incluídas por razões óbvias. Você pode imaginar (na mesma escala) onde a estrela mais próxima estaria situada? Cleveland, Ohio. Vastas! E, lembre-se, esta seria apenas a nossa galáxia local.

Um cientista sugeriu certa vez uma analogia interessante. Para entender a cena, imagine um pavimento de vidro per­ feitamente liso, no qual a menor mancha possa ser vista. Encolha então o nosso Sol de 1.392km de diâmetro para apenas 60 cm (...) e coloque uma bola no pavimento para representar o Sol.

Recue 82 passos (cerca de 60 cm por passo) e, para repre­ sentar proporcionalmente o primeiro planeta, Mercúrio,

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 239 coloque uma pequena semente de mostarda. Recue mais 60 passos e para Vênus coloque um cartucho para arma normal. Marque mais 78 passos (...) coloque uma ervilha verde representando a Terra. Recue 108 passos desse pon­ to e, para indicar Marte, coloque uma cabeça de alfinete. Salpique ao redor um pouco de poeira fina para os asteróides e depois dê mais 788 passos e coloque uma laranja no vidro para representar Júpiter. Depois de mais 934 pas­ sos, ponha uma bola de golfe para indicar Saturno. Agora as coisas começam a ficar realmente complicadas. Marque mais 2.086 passos e para apontar Urano (...) uma bolinha de gude. Outros 2.322 passos e você chega a Netuno. Uma cereja deve representar Netuno. Isto já cobriu 4 km, e ainda não discutimos Plutão.

Temos uma superfície lisa de vidro, de 8 km de diâmetro, todavia apenas uma pequena fração do céu, excluindo Plutão. Adivinhe agora até onde deveríamos ir, na mesma escala, antes que você pudesse colocar outra bola de 60 cm para representar a estrela mais próxima. Teríamos de viajar 10.752km para chegarmos a essa estrela. Quilómetros e não centímetros! Essa seria também apenas a primeira estre­ la entre milhões delas; em uma única galáxia, entre centenas e talvez milhares. Tudo isso em movimento perpétuo (...) perfeitamente sincronizado (...) o cronómetro mais exato conhecido pelo homem.2

No Salmo 139, Davi faz um comentário apropriado: “Tal conheci­ mento é maravilhoso demais para mim: é sobremodo elevado, não o posso atingir” (v. 6). Se Davi vivesse hoje, ele escreveria: “Isto é as­ sombroso, minha cabeça vai explodir.” A vastidão da inescrutabilidade de Deus faz isso conosco — e deve fazê-lo.

A. W. Tozer escreve sobre a inescrutabilidade de Deus:

Quando usamos nosso próprio critério, imediatamente tenta­ mos reduzir Deus a termos simplistas. Queremos colocá-lo

240 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

onde poderemos usá-lo, ou pelo menos onde ele está quando dele precisamos. Queremos um Deus que possamos até cer­ to ponto controlar. Precisamos do sentimento de segurança que vem de saber como é Deus, e naturalmente o nosso conceito de como ele é será um composto de todos os qua­ dros religiosos que vimos, todas as melhores pessoas que conhecemos pessoalmente ou por ouvir dizer, e todas as idéias sublimes que já concebemos.

Se tudo isso parece estranho aos ouvidos modernos, é por­ que durante meio século temos tomado a Deus como certo. A glória do Senhor não tem sido revelada a esta geração de homens. O Deus do cristianismo contemporâneo é apenas um pouquinho superior aos deuses da mitologia greco-romana, se não lhes for na verdade inferior, por ser fraco e incapaz, enquanto eles menos tinham poder(...)

Que Deus possa ser conhecido da alma humana numa terna experiência pessoal, e, mesmo assim, permanecer infinita­ mente distante do olhar curioso da razão, tal fato constitui um paradoxo.3

DE VOLTA A JÓ EM TODO O SEU SOFRIMENTO

O estudo de Jó, se não servir para mais nada, pelo menos revela que não compreendemos plenamente os caminhos de Deus. Não pode­ mos explicar o inexplicável. Não podemos sondar o insondável. Não devemos então tentar desenroscar o inescrutável.

Se os homens que se consideravam amigos de Jó tivessem apenas reconhecido isso... Teria sido muito mais confortável para Jó, sentado em tal desgraça, ansiando por um braço ao redor do seu ombro e por alguém suficientemente sincero para dizer: “Estamos aqui, mas não compreendemos a razão desses acontecimentos mais do que você. Deus sabe que a nossa intenção é ficar ao seu lado através de tudo isso. Deus está fazendo algo profundo e misterioso que se acha tão além de nós que não conseguimos igualmente compreender.”

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 241

Permita que me adiante mais um pouco. Deus não tem um “pla­ no maravilhoso” para a vida de todos. Não aqui na terra, com certeza. Para algumas vidas, o seu plano é uma doença crónica. Para outras (como a de Jó), seu plano é uma vida de sofrimento. Para outras ainda, desgosto e abatimento, cegueira ou paralisia, ou complicações congénitas. Em relação a muitos, o plano dele é um Não para seus pedidos de cura. Não apreciamos isso. Alguns não irão aceitar. De fato, eles chegam a dizer: “Se você acredita nisso é porque não tem fé!” Pelo contrário, se você crê nisso, crê na Bíblia!

O Deus da Bíblia inclui a vida das pessoas que não são curadas, que não superam rapidamente os seus problemas, que não vencem facilmente acidentes ou enfermidades. A Palavra de Deus retrata seus heróis com verrugas e tudo. Eles sofrem. Caem. Falham e, ocasional­ mente, pela graça do Senhor, têm bom êxito.

AS DIVAGAÇÕES INSENSATAS DE BILDADE

Uma vez que Bildade não tinha idéia da inescrutabilidade de Deus, não devemos ficar surpresos ao ouvir mais divagações filosóficas quando voltamos para a sua terceira série de ataques contra Jó. Ele começa ensaiando algumas generalidades sobre Deus. O que diz é verdade; mas, como quase sempre acontece, elas não confortam ou consolam Jó.

Então, respondeu Bildade, o suíta: A Deus pertence o do­ mínio e o poder; ele faz reinar a paz nas alturas celestes. Acaso, têm número os seus exércitos? E sobre quem não se levanta a sua luz? Como, pois, seria justo o homem perante Deus, e como seria puro aquele que nasce de mulher? Eis que até a lua não tem brilho, e as estrelas não são puras aos olhos dele. Quanto menos o homem, que é gusano, e o filho do homem, que é verme!

Jó 25:1-6

Quatro observações parecem dignas de nota:

242 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Primeira, esta é a terceira e última apresentação de Bildade. (Eu acrescentaria: “Graças a Deus!”)

Segunda, este é o capítulo mais curto de todo o Livro de Jó, contendo apenas seis versículos.

Terceira, é, sem dúvida, breve porque não resta muito a ser dito. Além do mais, a esta altura suspeito que Bildade não considerava Jó capaz de ser ensinado; portanto, por que desperdiçar seus “discerni­ mentos brilhantes” com o homem?

Quarta, por lhe faltarem argumentos, Bildade não gasta mais tempo tentando provar que Jó está errado, ele simplesmente faz uma preleção. Este é o último tiro de Bildade. Ele fala primeiro do poder e da grandeza de Deus, e depois da justiça divina e da pecaminosidade do homem. Está dizendo com isso a Jó que Deus é todo luz e ele todo trevas, sendo essa a razão do seu sofrimento. Suas duas analogias conclusivas: “gusano” e “verme”, completam praticamente suas alusões.

Meu coração várias vezes se inclina sinceramente para Jó. Esta c uma dessas ocasiões. Alguém já chamou você de gusano ou ver­ me? É possível que alguém tenha feito isso numa crise de ira incontrolável, por trás de portas fechadas. E bem provável que ti­ vesse havido mais tarde um pedido de desculpas, ou deveria ter havido. Mas, neste caso, penso que Bildade pensava realmente es­ sas coisas. Está tão exasperado que Jó não tem mais uso para ele. “Saia de minha vida!”, parecem ser suas últimas palavras, seu último comentário mordaz.

Há várias lições a serem aprendidas desta história. Uma de­ las é esta: sempre que tiver oportunidade de estar com alguém em grande necessidade — mesmo que o sofrimento dele seja re­ sultante de seus próprios erros ou falhas, desprezá-lo é algo que nunca ajuda. A tragédia é que aqueles homens tinham inclina­ ção para tal. E as coisas apenas pioraram. Podemos então sur­ preender-nos pelo fato de Jó revidar com uma série de ataques verbais sarcásticos?

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 243

A FORTE REAÇÁO DE JÓ Como sabes ajudar ao que não tem força e prestar socorro ao braço que não tem vigor!

Jó 26:2

A frase em hebraico parece estar dizendo: “Como você pôde salvar com seu braço — aquele que não tem força!” A tradução para a nossa língua não faz muito sentido. Creio que Jó está usando o sarcasmo para chamar a atenção de Bildade. Ele continua empre­ gando o mesmo estilo:

Como sabes aconselhar ao que não tem sabedoria e revelar plenitude de verdadeiro conhecimento! Com a ajuda de quem proferes tais palavras? E de quem é o espírito que fala em ti?

Jó 26:3, 4

“Oh! Bildade! Você possui realmente um fragmento da verdade!” A paráfrase de Eugene Peterson é útil para nós:

Você com certeza foi de grande ajuda para um homem indefeso!

Veio resgatá-lo na hora exata!

Que bom conselho deu a um indivíduo confuso!

Que discernimentos surpreendentes ofereceu!

Onde foi buscar tudo isso?

Como se tornou tão inspirado? Jó 26:2-4, MSG (tradução livre)

A propósito, os pronomes hebraicos nos versículos 2, 3 e 4 estão todos no singular, sendo portanto dirigidos somente a Bildade.

244 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Quando chegamos a Jó 27, o plural é retomado. Mas, por enquanto, essas palavras são enviadas como golpes de lança.

O que faltou a Jó em tato aqui, ele compensou com total since­ ridade. Na verdade, aquela não era ocasião para tato. Bildade tinha sido brutal. E duvidoso que sequer tivesse escutado, no caso de Jó ter sido suave e diplomático. Jó fica mais firme!

Os ferimentos fazem isso a você. Qualquer enfermeira lhe dirá, especialmente as que trabalham junto a pacientes sofrendo muito, que o tato desaparece à medida que a dor aumenta. Há algo sobre a continuação da angústia que finalmente leva a alma a uma realidade crua, intensa.

Há muitos anos li esta declaração: “A dor finca a bandeira da realidade na fortaleza de um coração rebelde.”4 Mesmo entre os que foram obstinados e rebeldes, quando a dor golpeia e persiste, o indi­ víduo se vê frente a frente com a realidade. Isso aconteceu com Jó. Ele tirou as luvas, fitou Bildade nos olhos e falou com franqueza. O homem precisava desse tipo de resposta.

Há uma pequena oração que sugiro que você repita toda manhã.

Senhor, ajuda-me a não tornar mais pesado o fardo de nin­ guém. Ajuda-me a levar encorajamento aos outros. Onde for possível, capacita-me a confortar. Quando eu não souber fazer isso, ajuda-me a admiti-lo. Quando sentir tristeza e simpatia por alguém, ajuda-me a declará-lo. Ajuda-me a aliviar o peso dos que estão sofrendo em vez de acrescentar ao seu fardo.

Quando outros estão passando por uma experiência agonizante, pre­ cisam de nós para dar-lhes apoio e força. Bildade nunca aprendeu esse princípio; nunca fez essa oração. Que pena!

Ocorre agora uma intrigante mudança de papéis. Em vez de Bildade ensinar Jó, este se torna o professor. E quase como se decidis­ se: “Uma vez que você não tem respostas, deixe que eu fale sobre o

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 245

Deus infinito, incompreensível, que não revelou todos os porquês e motivos das suas atividades.”

A partir do versículo 5 até o 13 do capítulo 16, Jó pôs Bildade à prova. Ele comunica o que chamaríamos de explicação cosmológica fascinante. Jó começa surpreendentemente com os espíritos dos mor­ tos e depois vai até o ponto mais alto do universo. De maneira sim­ ples e direta, Jó declara: “Deus está no controle de tudo. Ele sabe tudo. Compreende tudo, está no meio de tudo e se responsabiliza por tudo. Nada surpreende ao Deus vivo.” Testemunhe isso por si mesmo enquanto lê a apresentação de Jó:

A alma dos mortos treme debaixo das águas com seus ha­ bitantes. O além está desnudo perante ele, e não há coberta para o abismo.

Jó 26:5, 6

Este é um mosaico resplandecente da superioridade do Senhor sobre tudo. Ele é absolutamente soberano, até mesmo sobre os “espíritos dos mortos, debaixo das águas, no esconderijo do além e do abismo”. E continua...

Ele estende o norte sobre o vazio e faz pairar a terra sobre o nada.

Jó 26:7

Não é admirável? Esta é uma peça antiga de literatura poética cheia de verdade esplêndida. Jó nao foi contam inado pela teoria evolucionista dos eruditos do século XXI. Ele crê pela fé que, quando Deus criou o planeta Terra, o Senhor o estendeu sobre o espaço vazio e o pendurou no “nada”.

Deus planejou e criou tudo. “No princípio, criou Deus os céus e a terra”. Como o primeiro versículo de Génesis é profundamente simples! Deus disse “Haja” e o mundo foi criado, tendo-o ele pendu­ rado sobre o vazio. Que magnificência!

246 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jó está ensinando Bildade. Se Bildade está ou não escutando, quem pode saber? O ponto alto é que Jó tem um relacionamento com Deus do qual Bildade nunca ouvira falar. Por causa desse rela­ cionamento, Jó pode confiar em Deus em tudo que precisar. Encon­ tramos grande conforto quando nos apoiamos em Deus pela simples fé. Confiamos. Permanecemos fortes. Principalmente, oramos para poder atravessar as dificuldades que a vida lança sobre nós. No ano passado, um professor me enviou uma resposta bastante interessante escrita por um candidato a uma posição na escola. O professor em potencial entregou a carta à administração da entidade, esperando ter descrito o dilema enfrentado pelo professor na cultura de hoje:

Vamos ver se entendi bem. Vocês querem que eu entre na­ quela sala cheia de alunos e preencha cada momento da vida deles de modo a sentirem vontade de aprender. E não só isso, devo incutir um sentimento de orgulho pela sua afiliação étnica, modifique o comportamento destrutivo deles, observe-os quanto a sinais de abuso e mensagens nas camisetas. Devo participar da guerra contra as drogas e doenças sexualmente transmissíveis, verificar suas mochilas para ver se contêm armas e elevar a auto-estima deles. Devo ensinar-lhes patriotismo, cidadania, apreço pelo esporte e honestidade; como e onde registrar-se para votar, como equi­ librar suas finanças e como candidatar-se para um emprego. Devo examinar ocasionalmente a cabeça deles para ver se há piolhos, manter um ambiente seguro, reconhecer sinais de provável comportamento anti-social, oferecer conselhos, es­ crever cartas de recomendação para emprego de alunos com bolsas de estudo, incentivar o respeito pela diversidade cul­ tural e sempre dar às mulheres em minha classe 50% da minha atenção.

Sou obrigado pelo meu contrato a trabalhar em meu pró­ prio tempo nas férias e à noite, às minhas próprias custas, para obter certificados de progresso na carreira e um diplo­ ma de mestrado; e, depois da escola, devo comparecer a

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 247 reuniões de comités e do corpo docente, participando tam­ bém no treinamento para o aperfeiçoamento da equipe, a fim de manter minha posição no emprego.

Devo ser um exemplo de virtude, a ponto de minha presença levar os alunos a serem obedientes e respeitarem a autoridade. Devo prometer lealdade aos valores familiares, uma volta aos fundamentos e à minha administração atual. Devo incorporar tecnologia ao aprendizado e monitorar todos os sites da internet, ao mesmo tempo que mantenho um rela­ cionamento pessoal com cada aluno. Devo decidir quem pode ser potencialmente perigoso e/ou propenso a cometer crimes na escola, ou quem está sendo provavelmente abusa­ do, e posso ser preso por não mencionar essas suspeitas.

Devo certificar-me de que todos os alunos passem nas provas estaduais e federais obrigatórias e em todas as matérias, quer freqúentem ou não a escola de maneira regular ou comple­ tem quaisquer trabalhos determinados. Além disso, devo providenciar para que todos os alunos com deficiências obtenham educação gratuita e equivalente, sem levar em conta sua deficiência mental ou física.

Devo comunicar-me frequentemente com os pais de cada aluno por carta, telefone, relatório e boletim de notas. Devo fazer tudo isso com um pedaço de giz, um computador, alguns livros, um quadro de boletim, um plano de aula de mais ou menos 45 minutos e um grande sorriso; tudo isso com um salário inicial que qualifica minha família a usar vales de alimentação em vários estados.

Isso é tudo? E vocês querem que eu faça tudo isto e esperam que eu NÃO ORE?5

Essas parecem palavras que Jó diria a seus “supostos” amigos. “Vocês querem que eu faça tudo isso sem qualquer encorajamento da sua parte para voltar-me e confiar no Deus vivo?”

248 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Uma vez que você reconhece a atividade inescrutável dele, deixe-me explicá-la para você! Bildade, considere a incompreensibilidade incrível da sua natureza. Pondere sobre o poder inescrutável da sua pessoa, controlando aqueles que foram para além das garras da morte. Pense seriamente na sua inescrutável criação desta terra — e seu traba­ lho pessoal ininterrupto.”

Ele estende o norte sobre o vazio e faz pairar a terra sobre o nada. Prende as águas em densas nuvens, e as nuvens não se rasgam debaixo delas. Encobre a face do seu trono e sobre ele estende a sua nuvem. Traçou um círculo à superfície das águas, até aos confins da luz e das trevas. As colunas do céu tremem e se espantam da sua ameaça. Com a sua força fende o mar e com o seu entendimento abate o adversário. Pelo seu sopro aclara os céus, a sua mão fere o dragão veloz.

Jó 26:7-13

É como se Jó estivesse dizendo: “Bildade, o nosso Deus controla tudo isso. Tudo está sujeito a ele!” A seguir, ele alcança o clímax com esta declaração final:

Eis que isto são apenas as orlas dos seus caminhos! Que leve sussurro temos ouvido dele! Mas o trovão do seu poder, quem o entenderá?

Jó 26:14

Não é um pensamento impressionante? “Bildade, por mais magní­ ficas que sejam todas essas coisas, o que mencionei representa apenas as orlas dos caminhos dele.” Essa palavra é estupenda! As orlas, a fímbria, a beirada externa dos seus caminhos; apenas um sussurro leve de sua poderosa voz, os tons suaves da sua onipotência. “Bildade — ouça-me!” Quem pode compreender plenamente? E pensar que este Deus-Criador atravessa todos os milhares de galáxias dos “céus”

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 249 e dá sua atenção a este pequeno planeta verde chamado Terra, alcan­ çando pessoas como nós, sabendo até o número de fios de cabelo em nossas cabeças. Davi tinha razão: “Tal conhecimento é maravilhoso demais para mim: é sobremodo elevado, não o posso atingir” (SI 139:6).

Que é o homem, que dele te lembres? E o filho do homem, que o visites?

Salmos 8:4

Uma perspectiva assim é necessária quando as feridas de meu corpo estão supurando e a febre não desce. Jó termina onde Bildade deveria ter começado. “Quem pode entender?”

De fato, quão insondáveis são os seus juízos, e quão ines­ crutáveis, os seus caminhos! Tenha cuidado neste ponto. Isto não significa que ele está fora de contato, fora de controle e que não tem um plano. Quer dizer somente que ele não é obrigado a explicar a si mesmo. Em vista de não revelar tudo, ficamos com três palavras muito honestas, que são úteis quando saídas dos lábios de pessoas orgulhosas.

Quais são essas três palavras? “Eu não sei.”

Em uma análise final, Deus sabe, e ele faz bem todas as coisas. Ele está no controle. Eu sou o barro, ele é o Oleiro. Eu sou o discípulo, ele é o Senhor. Isto significa que devo me submeter. Devo humilharme debaixo da sua poderosa mão. Devo estar disposto a ajustar minha vida às suas escolhas para mim; ouvir, aprender, adaptar-me à sua liderança, aonde quer que ela me leve, quer me sinta confortável, feliz ou saudável. Isto é obediência. Jó, a esta altura, está começando a perceber isso, e quando chega ao fim da sua breve explicação, per­ gunta sabiamente: “Quem pode compreender?”

Voltemos à minha declaração inicial: o estudo de Jó é essencial­ mente o estudo de Deus.

250 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Sem dúvida alguma, a noção mais poderosa que a mente pode conceber é a idéia de Deus, e a palavra mais significa­ tiva em qualquer língua é aquela usada para Deus...

Um conceito correto a respeito de Deus é básico, não apenas para a teologia sistemática, mas também para a vida cristã na prática. No que se refere à adoração, esse conceito tem o mesmo significado que têm, para o templo, os alicerces...

Creio que o atual conceito cristão sobre Deus está tão deca­ dente que se encontra profundamente abaixo da dignidade dos Deus Altíssimo, constituindo para os crentes professos uma verdadeira calamidade moral....

Acautelemo-nos para não aceitarmos no nosso orgulho a idéia de que a idolatria consiste apenas no ajoelhar-se perante objetos visíveis de adoração; e que os povos civilizados estão portanto livres disso. A essência da idolatria está nas idéias indignas que temos a respeito de Deus. Começa na mente e poderá ocorrer mesmo quando não seja praticado nenhum ato manifesto de adoração a uma imagem. “Tendo conheci­ mento de Deus”, diz o apóstolo Paulo, “não o glorificaram como Deus, nem lhe deram graças, antes se tornaram nulos em seus próprios raciocínios, obscurecendo-se-lhes o cora­ ção insensato.”(...)

As noções erradas sobre Deus logo corrompem a religião na qual se introduzem. Isto fica claramente demonstrado na longa carreira de Israel, e a história da Igreja o confirma... O primeiro passo da Igreja em direção à decadência é quando ela compromete sua elevada opinião de Deus....

A mais pesada responsabilidade da Igreja em nossos dias está em purificar e elevar o seu conceito de Deus, para que, mais uma vez, este se torne digno dele — e da Igreja. Em todos os seus esforços, em todas as suas orações, isto deve ter a primazia. Prestaremos o mais alto benefício à próxima geração de crentes se legarmos a ela, sem qualquer nuança,

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL 251 ou depreciação, o nobre conceito de Deus recebido de nos­ sos pais hebreus e cristãos das gerações passadas. Isto terá para eles maior valor do que qualquer coisa que a arte ou a ciência possam inventar.*5

Acostume-se a pensar teologicamente. Faça disto seu principal pro­ pósito. Procure alinhar seus pensamentos ao de Deus, reconhecendo sua sublime magnificência. Busque não temer ao ter de reconhecer: “Eu não sei”.

Por pensar corretamente a respeito de Deus, Jó foi capaz de resistir, mesmo quando não sabia as razões do sofrimento.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Sabendo que estudar Jó é estudar o próprio Deus, o que você tem aprendido sobre o caráter do Senhor em meio à confusão do sofrimento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando Deus recua nas sombras, mantém distância e não explica, como você reage à futilidade de querer desenroscar o inescrutável?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significa adorar um Deus cujos caminhos você não consegue entender, mas em cuja bondade ainda escolhe descansar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 21;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Novo Compromisso com as Coisas Importantes$t$, 21,
$conteudo$sofrimento nos ajuda a esclarecer as nossas prioridades e nos V / concentrar nos objetivos certos. Quanto maior a dor, tanto mais clara a visão. Quanto mais sofremos, tanto melhor determinamos o que realmente importa. Durante o processo, substituímos o conhe­ cimento pela sabedoria.

Cada vez que meu país volta a outro aniversário do 11 de setem­ bro, fazemos uma pausa e refletimos sobre tudo que aconteceu. A estratégia sincronizada, premeditada, de múltiplos assassinatos nos deixou estarrecidos; as manchetes e fotos que encheram os jornais e revistas durante semanas; os milhares de famílias que choraram a perda de entes queridos. Cada ano lemos o testemunho de pessoas reais que foram destruídas por essa série de atrocidades. Geralmente elas incluem palavras que mencionam algumas das lições aprendidas e que resultaram em compromissos renovados com as prioridades.

Um soldado nova-iorquino sobrevivente disse; “Como resultado dessas atrocidades, jamais considerarei novamente a nossa liberdade como garantida.” Uma viúva de meia-idade, cujo marido foi morto

254 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

no World Trade Center, falou: “Eu agora abraço apertado meus filhos todos os dias. Digo a eles que os amo, todas as manhãs e todas as noites antes de nos deitarmos.” Um corretor de 48 anos que perdeu vários colaboradores no dia 11 de setembro admitiu: “Decidi não me dedicar tanto ao meu negócio e à minha carreira; minha família e meus amigos se tornaram agora mais importantes para mim.” O sofrimento ajuda a eliminar a névoa que o sucesso e a prosperidade criam.

O pastor John Piper escreveu um livro a outros pastores. Apre­ ciei muito o título: Brothers, We Are Not Professionals (irmãos, não somos profissionais). No parágrafo de abertura, ele fala sobre o valor do sofrimento.

O sofrimento maciço chega às vezes tão perto de casa que por um breve espaço de tempo a névoa da segurança insensata desvanece e podemos ver o precipício íngreme da eternidade a um passo de distância. Cambaleamos en­ tão, e por um momento tudo no universo parece diferente. Essas são boas ocasiões para o realismo pastoral. Oh! como nossas vidas e nosso ministério parecem vazios nesses mo­ mentos! A última coisa que lamentamos então é sermos menos profissionais.1

Penso que o mesmo se aplica ao mundo dos negócios. Não me lem­ bro de ter ouvido um profissional antes bem-sucedido, agora mor­ rendo de câncer deitado numa cama, dizer: “Gostaria de ter passado mais tempo no escritório.”

Se Jó pudesse falar hoje, ele confirmaria tudo isto, insistindo para que fizéssemos uma pausa e uma reavaliação. Depois que seus filhos morreram naquela forte ventania e seu negócio acabou como resultado da série catastrófica de eventos, sua saúde decaiu, cobrindo seu corpo de tumores, e sua febre chegou a níveis perigosos, nunca ouvimos Jó lamentando a perda de uma transação. Ele nunca men­ ciona ansiar por contratos lucrativos que ampliariam suas atividades comerciais com a caravana de camelos. Você não pensa nessas coisas

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 255 quando está agarrado à vida por um fio. O sofrimento nos ajuda a esclarecer as nossas prioridades.

Já vivi o suficiente para estar convencido de que o sofrimento não é um inimigo. Parece estranho dizer isso, mas a verdade é que ele é um amigo. Até que reconheçamos essa verdade, não iremos colher os seus benefícios. Jó está vivendo no cadinho. A desgraça que o en­ volveu forçou-o a enfocar as coisas que realmente importam.

E interessante notar que ele não fala sobre o assunto até que os amigos se calam. Uma semana depois de sua chegada, eles co­ meçaram a fazer acusações. Apontaram o dedo para ele. Fizeram preleções, insultaram e condenaram Jó. Quando finalmente se calaram, tudo começou a tomar forma na mente de Jó, até que ele, num breve interlúdio de tempo, começou a ver as coisas com clareza.

Compreendi finalmente que um dos benefícios dos períodos de sofrimento é que meu foco passa a ser vertical. Charles Spurgeon, o grande pregador de Londres durante muitos anos, foi objeto de con­ trovérsia. A mídia da época gostava de desafiá-lo. Eles tiravam pro­ veito de um alvo grande como ele. Spurgeon geralmente conseguia manter-se firme, mas houve uma ocasião em que começou a perder a esportiva. Todos temos um limite.

Sua esposa notou que uma depressão o ameaçava. Ela ficou preo­ cupada, com medo que perdesse o ânimo e as oportunidades que se abriam para ele enquanto atravessava esse período difícil. Isso a levou a agir de modo incomum. Abriu a Bíblia no Sermão do Monte onde Jesus disse:

Bem-aventurados sois quando, por minha causa, vos inju­ riarem, e vos perseguirem, e, mentindo, disserem todo mal contra vós. Regozijai-vos e exultai, porque é grande o vosso galardão nos céus; pois assim perseguiram aos profetas que viveram antes de vós.

Mateus 5:11, 12

256 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Ela escreveu a mão essas palavras num pedaço grande de papel e prendeu-o no teto acima da cama deles. Quando o pregador virou-se na manhã seguinte, acordou, piscou os olhos, e enquanto ficava ali deitado leu as palavras. Leu-as de novo, em voz alta. Concentrou-se verticalmente no que Deus estava dizendo, e isso renovou seu ínti­ mo. Ele continuou seu ministério com nova paixão. Como foi maravilhosa e criativa a idéia da Sra. Spurgeon!

Quando estamos deitados de costas, o único lugar que podemos olhar é para cima. Funcionou. Spurgeon deixou de ficar lambendo as suas feridas e, como Jó, olhou para além de todas as críticas e começou a preocupar-se outra vez com pensamentos de Deus.2

O FOCO VERTICAL DE JÓ

Quando chegamos ao capítulo 27 de Jó, sua perspectiva vertical surge rapidamente. Em sete declarações ele se refere ao nome do seu Deus não menos do que onze vezes. (O grifo é meu.)

Tão certo como vive Deus, que me tirou o direito, e o TodoPoderoso, que amargurou a minha alma...

Jó 27:2

Enquanto em mim estiver a minha vida, e o sopro de Deus nos meus narizes...

Jó 27:3

Porque qual será a esperança do ímpio, quando lhe for cortada a vida, quando Deus lhe arrancar a alma?

Jó 27:8

Acaso, ouvirá Deus o seu clamor, em lhe sobrevindo a tribulação?

Jó 27:9

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 257

Deleitar-se-á o perverso no Todo-Poderoso e invocará a Deus em todo o tempo?

Ensinar-vos-ei o que encerra a mão de Deus e não vos ocul­ tarei o que está com o Todo-Poderoso.

Jó 27:11

Eis qual será da parte de Deus a porção do perverso e a herança que os opressores receberão do Todo-Poderoso:

Jó 27:13

O único ser mais importante para Jó é o seu Deus. E o Todo-Poderoso. E o Senhor.

AS PRINCIPAIS PRIORIDADES DE JÓ

Isto nos dá a primeira das cinco prioridades que valem a pena lem­ brar. As prioridades de Jó neste ponto da sua vida começam pelo seu relacionamento com o Senhor.

Pensar os pensamentos de Deus é nosso maior objetivo. Já me referi a isto num capítulo anterior. Dei-lhe o nome de pensar teológica ou biblicamente. Esta é uma das razoes pelas quais sou um forte adepto da disciplina da memorização das Escrituras. Você não pode pensar os pensamentos de Deus mais agudamente do que quando cita as próprias palavras de Deus nas situações da vida.

O que vem às nossas mentes quando pensamos sobre Deus é a coisa mais importante a nosso respeito. O que vem então à sua mente quando você pensa sobre Deus? Lembro-me de ter pensado em Deus quando era criança como um homem muito velho, com uma longa barba branca, bochechas protuberantes, soprando raja­ das de vento do norte. Eu tinha visto o rosto dele na escola em mapas antigos do mundo.

O que vem à sua mente quando pensa em Deus? Você o vê como aquele que lhe dá fôlego e mantém seu coração batendo? Como aque­ le que chamará todos para serem julgados um dia? Você o vê como

258 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

aquele que protege seus filhos e seu negócio? Você reconhece que o poder dele é maior do que qualquer outro que poderia testemunhar nesta terra? Ou, diga sinceramente, ele é um pouco remoto, um tanto fora de contato com a sociedade altamente tecnológica de hoje? A sua visão de Deus faz toda a diferença na maneira como você vê a vida.

Pense na situação de Jó; ele está agora falido, sem filhos, sem amigos e doente. Coberto de tumores, tem febre alta e dores cons­ tantes. Acima de tudo isso, é mal-interpretado, e o acusam de pecados secretos, sendo agora rejeitado por aqueles que antes o respeitavam. Como é possível para ele continuar? Só há uma resposta: é a sua visão de Deus que o faz perseverar e não o que os outros estão dizendo. De acordo com isso, ele refaz seu compromisso com as coisas que impor­ tam. No jorro de pensamentos humanistas que flui de Elifaz, Bildade e Zofar, e que Jó sustou mentalmente, ele está agora enfocado por inteiro nas coisas de Deus.

De fato, ele diz que, por estar assim tão concentrado, nao irá falsificar o registro; não falará enganosamente; não lhes dirá o que não for verdade. E continua...

Enquanto em mim estiver a minha vida, e o sopro de Deus nos meus narizes, nunca os meus lábios falarão injustiça, nem a minha língua pronunciará engano. Longe de mim que eu vos dê razão! Até que eu expire, nunca afastarei de mim a minha integridade.

Jó 27:3-5

Isto nos introduz à segunda prioridade de Jó: Andar com integridade é a única maneira de viver. Ele se recusa a esquivar-se. Não vai fingir. Não irá mentir ou enganá-los. Só falará a verdade.

Como essa atitude é afirmativa! Como é magnífico ficar perto dessas almas raras que conseguiram ganhar o controle de suas lín­ guas! Jó se qualificou. Durante a sua aflição aprendeu a dominar suas palavras. Nunca mais voltaria a ser controlado pelo músculo mais forte de seu corpo.

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 259

Um médico me disse para não hesitar em chamar a língua de músculo mais forte do corpo. Isso é “anatòmicamente verdadeiro”, declarou ele. “A estrutura muscular da língua certamente a qualifica como um dos músculos mais fortes, caso não seja o mais forte, do corpo humano.”

O ponto é inegável. Você tem um músculo poderoso em sua boca. Ao compreender o potencial do seu impacto, Jó diz, com efeito: “Meus lábios serão lábios de integridade, recuso-me a usá-los como instrumentos de engano.”

De acordo com isso, ele confirma sua desaprovação das conclu­ sões de seus críticos: “Longe de mim que eu vos dê razão!” (v. 5). Em vista de crer que vocês estão errados, chamar o erro de acerto não seria usar corretamente minha língua, mas faltar com a integridade. “A minha justiça me apegarei e não a largarei; não me reprova a minha consciência por qualquer dia da minha vida” (v. 6). Que estilo notá­ vel de viver!

Chegamos à terceira prioridade ao alcançar a seção central das palavras de Jó. Ele muda de assunto e dirige sua atenção aos perver­ sos, a quem chama de “tiranos”.

Eis qual será da parte de Deus a porção do perverso e a herança que os opressores receberão do Todo-Poderoso: Se os seus filhos se multiplicarem, será para a espada, e a sua prole não se fartará de pão. Os que ficarem dela, a peste os enterrará, e as suas viúvas não chorarão. Se o perverso amon­ toar prata como pó e acumular vestes como barro, ele os acumulará, mas o justo é que os vestirá, e o inocente repar­ tirá a prata.

Jó 27:13-17

Este último comentário não é esplêndido? O perverso pode ter mais roupas em seu armário, mas acabará deixando-as para nós. Você está lembrado da frase materialista colocada ao redor de algumas pla­ cas de licenciamento? “Quem morre com mais brinquedos vence”.

260 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

A verdade é: quem morre com mais brinquedos os deixa para os justos, e estes irão tirar proveito deles! Jó veio a compreender esta terceira prioridade: O mal irá ocorrer, mas não triunfará no final. Isto dá lugar a um senso de justiça.

A fim de esclarecer a compreensão de Jó, permita que eu cite a última seçao do capítulo 27 em The Message:

Mesmo que ganhem muito dinheiro e resplandeçam na última moda,

Os bons é que usarão finalmente as roupas e os honestos, que dividirão o dinheiro.

Eles constroem casas luxuosas, que não sobreviverão a um único inverno.

Vão para a cama ricos e acordam pobres.

Terrores recaem sobre eles como inundações — um tornado os leva no meio da noite.

Um ciclone os arrebata - lá se vão eles!

Nem um traço subsiste, nem mesmo uma pegada.

Catástrofes os perseguem incansavelmente; correm de um lado para outro, mas não há onde se ocultar —

Esmurrados pelo vento, soprados para o reino que chegou com a tempestade.

Jó 27:16-23, MSG (Tradução livre)

Procuro lembrar-me frequentemente do provérbio que diz:

Não te fatigues para seres rico; não apliques nisso a tua inte­ ligência. Porventura, fitarás os olhos naquilo que não é nada? Pois, certamente, a riqueza fará para si asas, como a águia que voa pelos céus.

Provérbios 23:4, 5

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 261

Lá se vão essas grandes riquezas! Quantas vezes vimos ou ouvimos falar de indivíduos cheios de dinheiro. Para muitas dessas pessoas, no entanto, não são precisos muitos anos para que ele se acabe. Essas riquezas se assemelham a uma águia - criam asas.

Fique certo, porém: Deus mantém registros exatos. Ele sabe o que faz. Sabe também quem é justo e quem é perverso.

E fácil confundir-se se você assiste às notícias diárias na TV durante muito tempo. Tenha cuidado com o que assiste e com o que lê. Se a fonte não for confiável, a informação será deturpada. Devemos ser gratos porque existem ainda alguns em nossos dias que pensam com retidão e não temem dizer isso. Suas palavras nos lembram de que pecado é pecado, que os atos maus serão julgados, que embora possa parecer que os perversos estão ganhando, eles perderão no final!

No primeiro aniversário do 11 de setembro recebi um e-mail que se enquadra na categoria de informação confiável:

É difícil acreditar que já se passou um ano desde os ataques perversos ao nosso país, perpetrados por radicais islâmicos em Nova York, Washington, D.C., e na Pensilvânia. A pala­ vra “tragédia” está sendo repetida incessantemente hoje, mas é o termo errado para descrever os eventos daquele dia. Não se tratou de um “infortúnio” ou um “golpe do destino”. Foi um ato deliberado de guerra que atingiu propositalmente os americanos com o fim de matá-los. Para os politicamente corretos, veio a ser a consumação de um crime odioso.

Os 19 sequestradores do 11 de setembro e as centenas de outros que ajudaram a realizar o plano não foram produtos de injustiça ou pobreza. Seus atos não podem ser desculpa­ dos por qualquer falha na política externa americana. Eles são produto de uma visão radical do Islã que acredita que a sua fé deve ser propagada pela espada e que a América e Israel, cristãos e judeus, devem ser destruídos.

Esta visão islâmica radical explica a alegria expressa por algumas mães palestinas quando informadas de que seus

262 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

filhos adolescentes colocaram cintos de explosivos no peito, carregados com vidro e pregos, e morreram matando judeus nas ceias de Páscoa ou em cafés lotados. E essa visão que motivou os seqiiestradores de Daniel Pearl, atormentado frente às câmeras, forçado a dizer: “Sou judeu”, e decapitado.

Essa mesma visão levou o governo islâmico do Sudão a matar milhares de cristãos africanos num genocídio que grande parte do mundo, inclusive vários líderes religiosos nos Esta­ dos Unidos, decidiu ignorar. Por essa razão muitas igrejas cristãs do Paquistão foram invadidas por assassinos portado­ res de granadas de mão e aldeias cristãs na Indonésia e na Nigéria foram atacadas por amotinados islâmicos.

Esse é também o motivo pelo qual os jatos estão voando armados sobre W ashington, D.C. e Nova York, e os contêineres que entram em nosso país estão sendo verifica­ dos em busca de bombas nucleares “sujas” ou agentes bioló­ gicos. Os seguidores do islamismo radical querem matar mais de nós; querem ver a América destruída. Não sentem compaixão. Não é possível raciocinar com eles. Estão plane­ jando mesmo agora, nas sombras da escuridão, atacar-nos de novo. Esta é a realidade do mundo em que vivemos hoje e o que devemos enfocar se quisermos vencer esta guerra. E é preciso vencê-la!

A América é imperfeita. Todas as nações são imperfeitas neste mundo caído. Mas a América tem sido e continua a ser um raio de esperança para as pessoas que anseiam pela liberdade em todo o mundo. Nossos impulsos são decentes e bons. Nosso exército não marchou através dos anos para conquistar — marchou para quebrar as algemas do nazismo e do comu­ nismo - para libertar outros povos. Ensinamos aos nossos inimigos derrotados a essência da democracia, reconstruímos seus países e os acolhemos na família das nações livres.

Estamos sendo novamente testados. Que Deus possa darnos coragem moral e firmeza de caráter para defender a nossa nação e a civilização contra os bárbaros que estão à porta.3

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 263

O poeta e ensaísta norte-americano do século XIX, James Russell Lowell, disse bem:

A verdade sempre na guilhotina,

O erro sempre no trono —

Todavia, essa guilhotina faz o futuro oscilar

E, por trás do desconhecido indistinto,

Deus se encontra em meio às sombras,

Vigiando os que são seus.4 (Tradução livre)

Permaneça na guilhotina. Continue pensando retamente. Recuse-se a tolerar o erro! Como Jó, persista estabelecendo as suas prioridades de acordo com a Palavra de Deus. Passe menos tempo nos jornais e mais nas Escrituras. Deixe que Deus dite os seus compromissos e o ajude a interpretar os eventos de nossos tempos. Torne-se biblica­ mente correto em vez de politicamente correto.

O sofrimento capacitou Jó a discernir verdades profundas. De fato, ao chegarmos à sua quarta e quinta prioridades (Jó 28), descobrimos que ele avançou da esfera do simples conhecimento (informação inte­ lectual) para o tema da sabedoria (percepção espiritual).

Jó chega a três conclusões com relação à sabedoria. Sua primeira conclusão surge na forma de uma pergunta feita no final de uma seção repleta de poesia belíssima. Tudo isto leva Jó em direção à sua quarta prioridade.

Na verdade, a prata tem suas minas, e o ouro, que se refina, o seu lugar. O ferro tira-se da terra, e da pedra se funde o cobre. Os homens põem termo à escuridão e até aos últimos confins procuram as pedras ocultas nas trevas e na densa escuridade. Abrem entrada para minas longe da habitação dos homens, esquecidos dos transeuntes; e, assim, longe deles, dependurados, oscilam de um lado para outro.

Jó 28:1-4

264 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

À medida que continua, ele descreve a busca humana pelos me­ tais preciosos e outros elementos de valor.

Nas suas pedras se encontra safira, e há pó que contém ouro.... Abre canais nas pedras, e os seus olhos vêem tudo o que há de mais precioso. Tapa os veios de água, e nem uma gota sai deles, e traz à luz o que estava escondido.

jó 28:6, 10, 11

A seguir vem a pergunta crucial:

Mas onde se achará a sabedoria? E onde está o lugar do entendimento? O homem não conhece o valor dela, nem se acha ela na terra dos viventes. O abismo diz: Ela não está em mim; e o mar diz: Não está comigo. Não se dá por ela ouro fino, nem se pesa prata em câmbio dela.

Jó 28:12-15

Considere o que ele está dizendo: “Cave a terra e descobrirá pedras e metais preciosos, mas não encontrará a sabedoria. Sonde os espaços exteriores, e os mistérios serão desvendados, mas não encontrará a sabedoria. Estude os prodígios da natureza, examine tudo que esta terra guarda para você, e as descobertas irão surpreendê-lo, mas não encontrará a sabedoria!”

Isto confirma que, por mais útil que possa ser uma educação, leitura constante ou viagens por toda parte, ou até ser ensinado pelas mentes mais afiadas, nada disso resultará automaticamente em sabedoria. Ela não se encontra nos manuais, descobertas, in­ venções, ou na mente de alguns gurus. E aqui que encontramos a quarta prioridade de Jó: Buscar a sabedoria mediante o esforço humano éperda de tempo.

Permita-me oferecer uma definição simples de sabedoria. Sabe­ doria é olhar para a vida segundo a perspectiva de Deus.

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 265

Quando usamos de sabedoria, estamos vendo a vida como Deus a vê. E por isso que é tão importante pensar os pensamentos de Deus. Você olha para as dificuldades e provações como Deus as olha. Con­ sidera a vida familiar e a criação de filhos como Deus as considera. Interpreta os acontecimentos correntes como Deus os interpretaria. Concentra-se na visão mais ampla. Vê a verdade, embora à sua volta tudo não passe de enganos e mentiras.

Vamos avançar mais um pouco e definir outro termo bíblico: entendimento. Qual o seu significado? Entender é responder aos pro­ blemas e desafios da vida como Deus deseja que façamos. Não em pânico ou confusão; não sendo privados das coisas que apreciamos e não por comprometer a nossa integridade. Em vez disso, quando temos entendimento, respondemos aos desafios da vida como Deus quer que respondamos. Confiamos nele. Cremos nele. Nós nos recusamos a ter medo. Não agimos de acordo com os impulsos hu­ manos ou com a cultura politicamente correta de hoje.

E terrivelmente importante que nos firmemos na sabedoria, res­ pondendo com entendimento. Nenhuma dessas coisas pode ser obtida por esforço próprio ou como resultado de nossa busca. Deus oferece ambas graciosamente. O versículo 20 faz duas perguntas importantes:

Donde, pois, vem a sabedoria, e onde está o lugar do entendimento?

Jó 28:20

Não diz: “onde podemos obter conselho?” Não diz: “de onde vem a opinião?” Eu poderia citar várias fontes, mas a maioria delas não vale a pena escutar. De onde vem então esta sabedoria? Onde podemos encontrar o verdadeiro entendimento?

Deus lhe entende o caminho, e ele é quem sabe o seu lugar. Porque ele perscruta até as extremidades da terra, vê tudo o que há debaixo dos céus. Quando regulou o peso do vento e fixou a medida das águas; quando determinou leis para a

266 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

chuva e caminho para o relâmpago dos trovões, então, viu ele a sabedoria e a manifestou; estabeleceu-a e também a esquadrinhou. E disse ao homem: Eis que o temor do Senhor é a sabedoria, e o apartar-se do mal é o entendimento.

Jó 28::23-28

Você pode obter quatro diplomas de doutorado e nunca alcançar sabedoria ou entendimento. Com certeza não é o estudo superior que vai fazê-lo temer o Senhor. Mesmo as melhores universidades não oferecem um curso sobre o temor do Senhor. A fonte? Deus e só Deus. Por “temor do Senhor” estou me referindo a um grande respeito por Deus, acompanhado de ódio pessoal pelo pecado. Podemos entender agora por que Salomão escreveu: “O temor do S e n h o r é o princípio da sabedoria, e o conhecimento do Santo é prudência [en­ tendimento]” (Pv 9:10).

Isto nos leva à quinta prioridade de Jó: Cultivar um temor sadio e santo do Senhor nos confere sabedoria e entendimento.

ACEITE O SOFRIMENTO E APRENDA COM ELE; NÃO RESISTA A ELE

Um homem de nossa congregação sujeitou-se recentemente a uma cirurgia no cérebro. O tumor na seçao frontal de seu crânio estava empurrando o cérebro para trás e destruindo lentamente sua memó­ ria. A cada semana o crescimento do tumor se tornava mais pronun­ ciado e debilitante para ele. A cirurgia era a sua única opção. Eu o visitei no hospital, logo depois de ter sido operado com sucesso. Uma cicatriz em seu couro cabeludo se estendia desde a orelha esquerda até o alto da cabeça e descia até a orelha direita. Grampos de aço inoxidável fechavam a incisão. Ele estava deitado na cama, sorrindo, quando entrei. Não demorou muito para que eu compreendesse que minha visita tinha uma razão diferente da que eu planejara. Durante a visita testemunhei uma nova dose de sabedoria. Não foi ele que a recebeu de mim, mas eu dele. O homem falou do Senhor a partir do

NOVO COMPROMISSO COM AS COISAS IMPORTANTES 267 momento em que começamos a conversar até que saí. Ele mencionou discernimentos que o Senhor lhe dera. Falou sobre as lições que começara a aprender. Falou da enorme sensação de paz que passara a sentir. Em resumo, se já houve alguém completamente centrado no Senhor, era aquele indivíduo. Suas palavras fluíam em tom amável. Nossa conversa se desenrolava calmamente enquanto ele respondia. Estava dizendo, com efeito: “Não tenha pena de mim. Esta cirurgia tornou-se a minha oportunidade de confiar no Senhor de todo o coração, fazer com que ele me mostrasse algumas coisas que de outra forma não teria notado. Ele estava se rejubilando literalmente, assim como sua esposa. A sabedoria e o entendimento haviam eclipsado completamente a dor e o pânico.5

Aprecio demais a maneira como certo homem exalta o valor a longo prazo do sofrimento:

Em nossa compaixão, não gostamos de ver pessoas sofre­ rem. Nossos instintos se concentram então em evitar e aliviar o sofrimento. Não há dúvida de que esse é um im­ pulso positivo. Mas, se realmente quisermos alcançar outros que estão sofrendo, devemos ter cuidado para não ser como os amigos de Jó, não devemos “ajudar” presumindo que podemos consertar ou “melhorar” as coisas (...)

Em vez de insistir em evitar o sofrimento - no que não teremos muito êxito, na verdade —, talvez devamos começar a entrar no sofrimento, participando na medida do pos­ sível - penetrando no mistério e procurando Deus à nossa volta. Em outras palavras, devemos deixar de sentir pena das pessoas que sofrem e, em vez disso, olhar para elas, aprender delas, e — se permitirem — juntar-nos a elas em protesto e oração. A piedade pode ser míope e condes­ cendente; o sofrimento compartilhado pode ser dignificante e transformador de vida. Quando observamos o sofrimento, as orações e a adoração de Jó, vemos que ele já preparou um caminho de coragem e integridade a ser seguido por nós.6

268 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Quão verdadeiro! Meu amigo no hospital não precisava de pie­ dade, precisava de respeito, e obteve isso de mim naquele dia! Ele tem uma vantagem com relação à sabedoria superior a muitos de nós. Quando fala, ele o faz com um novo discernimento sobre a vida. Continua respondendo alegremente aos desafios cotidianos. Essas coisas lhe foram dadas por Deus mediante a experiência do sofrimen­ to. O principal benefício foi a reorganização das suas prioridades. É interessante pensar que fomos ensinados durante toda a nossa vida a lutar com o sofrimento, resistir a ele e, quando possível, escapar dele.

Jó nos ensina uma lição muito mais valiosa. Quanto maior o sofrimento, tanto melhor determinamos o que verdadeiramente im­ porta, e isto nos faz voltar ao começo. O sofrimento nos ajuda a discernir as nossas prioridades e a nos concentrar nos objetivos certos.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Que prioridades o sofrimento já tornou mais nítidas no seu coração, como acontece com quem passa por grandes perdas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a dor torna a visão mais clara, que compromissos você precisa renovar hoje com o que realmente importa?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma você quer abraçar mais perto as pessoas amadas e a Deus, antes que outra perda lhe ensine isso pela força?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 22;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Testemunho Fervoroso de um Inocente$t$, 22,
$conteudo$ossa geração está se tornando rapidamente desgastada. Uma palavra melhor talvez seja desconfiada. No passado, um líder era escolhido por causa do seu caráter, e os seus seguidores o respeita­ vam por causa da sua integridade. Confiávamos totalmente naqueles que nos guiavam.

Lembro-me de meu pai dizer quando eu era criança: “Podemos confiar nele. Ele nos deu a sua palavra.” Meus pais mandaram fazer alguns trabalhos de carpintaria em nossa pequena casa de Houston durante a minha infância. Lembro-me de eles terem conversado a respeito na mesa do jantar, e minha mãe perguntou sobre o contrato. Meu pai sorriu e respondeu: “Fizemos um acordo de cavalheiros. Não há necessidade de um contrato escrito.” Essas palavras represen­ tam hoje uma ingenuidade ridícula.

Em nossa chegada ao século XXI, viajamos tragicamente anos-luz além da simples, mas sincera, afirmação: “Sua palavra é sua garantia.”

Mesmo correndo o risco de ser amplo e simplista demais nesta análise, penso que grande parte da erosão da confiança do público

270 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

pode retroceder às três casas: a Suprema Corte, a Casa Branca e a Casa de Deus.

Houve uma época em que a lei era obedecida no tribunal. A maioria dos advogados era honesta (damos graças, porque alguns ainda são), e a maior parte dos juizes tinha bom senso, além de um forte compromisso com a justiça. Os casos apresentados eram dignos de serem julgados, e os réus, dignos de serem defendidos, uma vez que eram muitas vezes inocentes das acusações. Havia exceções, como é natural, mas a integridade dominava.

Meu coração deixou de bater por um instante na semana passada, quando ouvi um advogado de defesa fazer um comentário sobre um caso específico de molestamento de criança. Ele acabara de perder a causa porque o homem fora considerado culpado conforme a acusa­ ção. Durante a entrevista depois dessa decisão, o advogado de defesa admitiu ao repórter: “Eu sabia todo o tempo que ele era culpado. Meu cliente me confessara que era culpado; mas, afinal de contas, tratava-se de um caso interessante.” Durante todo o julgamento, a defesa apresentada por ele não passou de fingimento.

E claro que há problemas na justiça. Mas e na Casa Branca? Você se lembra de ter confiado no presidente quando era uma criança inocente? Lembre-se de quando você, como eu, pôs as mãos sobre o coração e prometeu lealdade à bandeira dos Estados Unidos da América? Lembro-me de ter feito esse juramento, descalço, quando estava na terceira série, todas as manhãs antes da aula durante a Segunda Guerra Mundial. Eu estava realmente descal­ ço! (Se pudesse, teria andado descalço até a oitava série, mas eles nos fizeram usar sapatos a partir da quarta.) Eu estava então ali, de pé, olhando para a foto do presidente, colocada ao lado da bandeira, pensando: “Que grande homem!” Naqueles dias, qual­ quer engano no Salão Oval era inimaginável. Quanta coisa mudou! Houve a Guerra do Vietnã, os intermináveis conflitos raciais e sociais, o Caso Watergate, os escândalos no Congresso, o fiasco de Clinton com Mônica Lewisnky. Integridade na Casa Branca? Nem sempre... Mas na casa de Deus...

O TESTEMUNHO FERVOROSO DE UM INOCENTE 271

Uma coisa é o Caso Watergate — mas Pérolagate? Há não muitos anos, houve um escândalo de um televangelista que manchou a obra de Deus. Todos nós no ministério fomos atingidos por ele, embora poucos estivessem envolvidos. Houve uma ocasião em que, quando um ministro se mudava para a vizinhança, as pessoas ficavam felizes em tê-lo por perto. Isso não acontece mais. Não é raro que alguns desconfiem de um pastor. É realmente lamentável. Conclusão: va­ mos chamar isso de colapso da integridade.

Conta-se uma história sobre um homem fabulosamente rico que, em seu leito de morte, chamou seus três mais leais amigos: seu médico, seu sacerdote e seu advogado. Quando os três estavam reunidos, ele declarou: “Sei que dizem que ninguém pode levar seu dinheiro con­ sigo, mas vou tentar.” Distribuiu então três envelopes idênticos e muito grossos, contendo cada um dois milhões de dólares em dinheiro. “Quero que vocês vão ao meu enterro”, disse ele, “e, quando descerem o caixão, atirem os envelopes sobre ele”. (A sua natureza suspeitosa está fazendo você sorrir?)

Cada amigo promete ao homem que irá atendê-lo. Na hora certa o rico morre. Os três amigos vão ao funeral, e no cemitério cada um joga o envelope na sepultura.

Ao voltarem para seus respectivos carros, o médico, relutante, diz aos outros dois: “Meus amigos, tenho uma confissão a fazer. Na noite passada, sentado em meu consultório com o pacote nas mãos, comecei a pensar na nova ala para as crianças doentes que nosso hos­ pital está tentando construir. Pensei: ‘Estes dois milhões de dólares poderiam favorecer muitos em vez de acabar cobertos de terra.’ Eu sabia que nosso querido amigo, se estivesse lúcido, daria preferência a este uso caridoso do dinheiro, e então entreguei-o ao hospital para a nova ala. Preciso confessar, o envelope que joguei no túmulo estava recheado de jornais velhos.”

O advogado se volta furioso para ele. “Esse dinheiro”, ele diz, “foi dado em confiança. Você era um curador. Ao fazer com o dinheiro o que lhe pareceu melhor, violou um dever sagrado, legal, e pode ter cometido, além disso, um delito grave.”

272 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

O advogado estava ainda enraivecido quando o sacerdote o interrompe e diz: “Não tão depressa, meu filho.” Ele passa então a contar sua história.

“Eu também tenho uma confissão a fazer. Estava sentado em minha residência na paróquia a noite passada, pensando sobre os esforços da igreja para levantar o dinheiro suficiente para manter a cozinha e o abrigo para os sem-teto que mantemos. Lutei também com o pedido de nosso velho amigo e decidi finalmente que era me­ lhor usar o dinheiro para uma boa causa do que enterrá-lo no chão.” Ele cita em seguida a parábola dos talentos, admitindo que também enchera o envelope com pedaços de jornal e dera o dinheiro para a sopa e o abrigo dos sem-teto.

A essa altura o advogado está quase explodindo. Ele reprova asperamente os dois homens. Como membro do tribunal, diz ele, poderia perfeitamente denunciar essa quebra de confiança. E, a des­ peito da lei, acrescenta: “Há uma amizade a ser considerada. Vocês dois desobedeceram ao último desejo de nosso mais íntimo amigo. Deveriam ter feito o que fiz”, terminou ele. “A fim de estar absoluta­ mente certo de cumprir o pedido de nosso amigo com o mais meti­ culoso cuidado, coloquei o dinheiro no cofre de meu escritório, e ele continua lá, protegido de qualquer dano. A seguir, escrevi um cheque de dois milhões de dólares e coloquei-o no envelope... e foi isso que joguei no túmulo.”

Li no ano passado o livro Eyewitness to Power, escrito por David Gergen. Ele era frequentemente visto ao lado de pessoas como o presi­ dente Nixon e, mais tarde, os presidentes Ford e Reagan; e, mais recentemente, o presidente Clinton. Era consultor e conselheiro deles; cada um considerava Gergen seu amigo. Ele não escreveu um livro superficial, mas um volume franco sobre as coisas que testemunhou. O autor menciona várias vezes a palavra integridade. Quando resume as sete características que marcam um presidente, não fiquei surpreso ao ver listado em primeiro lugar: a liderança começa por dentro. O autor cita o falecido senador Alan Simpson: “Se você tiver integridade, nada mais importa. Se não tiver integridade, nada mais importa.”

O TESTEMUNHO FERVOROSO DE UM INOCENTE 273

Isto explica por que todos nós respeitamos tanto Jó. Ele era um homem íntegro antes que sua vida fosse destroçada, permaneceu íntegro durante o período de sofrimento a que foi submetido, e continuou íntegro depois de tudo que aconteceu. Apesar de todas as dificuldades e perdas, sem levar em conta os insultos, as falsas acusa­ ções e os comentários mordazes, ele nunca comprometeu a sua inte­ gridade. Admiramos o sofrimento e mais ainda a atitude de suportar uma dor tão intensa. Todavia, o fato de ele representar um modelo de integridade em tudo nos faz admirá-lo ainda mais. Nada sobre Jó nos impressiona tanto. Ele declara firmemente:

Até que eu expire, nunca afastarei de mim a minha in­ tegridade. À minha justiça me apegarei e não a largarei; não me reprova a minha consciência por qualquer dia da minha vida.

Jó 27:5, 6

O problema de Jó naqueles. dias era, porém, como o de qualquer líder hoje: sua audiência desconfiava dele. Havia suspeitas por todo lado. Suas palavras eram apenas palavras para aquelas pessoas. Na opinião deles, ninguém poderia estar passando pelo tipo de tormento pelo qual ele passava física, emocional e domesticamente; ninguém perderia negócio, casa, família e saúde sem ser culpado de alguma coisa. Algo muito secreto e muito mau. Eles nunca acreditaram em outra coisa. De fato, intensificaram as acusações com o passar do tempo. Finalmente decidiram calar-se (e eu daria graças por isso). Jó ficou ali sentado, quieto, com as palavras deles ecoando em seus ou­ vidos. Por não ter advogado de defesa, vê-se obrigado a defender sua própria causa.

Durante um breve interlúdio (capítulos 27 a 32 do livro que leva o seu nome), Jó teve tempo para considerar o que eles disseram enquanto refletia sobre a sua vida. O benefício de tal interlúdio é que Jó registrou seus pensamentos em seu diário; assim ficaram preserva­ dos na Bíblia. Quando chegamos ao capítulo 29, encontramos Jó

274 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

recapitulando com certo prazer nostálgico as bênçãos de Deus. Que dias gloriosos foram aqueles! Se você for do tipo que gosta de esboços, inclusive títulos para as principais seções, sugiro os seguintes:

• Jó reflete sobre a sua glória passada (cap. 29).

• Jó recapitula sua miséria presente (cap. 30).

• Jó confirma sua integridade pessoal (cap. 31).

REFLEXÕES SOBRE A SUA GLÓRIA PASSADA

Prosseguiu Jó no seu discurso e disse: Ah! Quem me dera ser como fui nos meses passados, como nos dias em que Deus me guardava!

Jó 29:1, 2

Parece até que ele está escrevendo essas coisas com um suspiro: “Oh! como eu gostaria de voltar àqueles dias, quando ele e eu andávamos e conversávamos juntos!” Adão deve ter tido sentimentos como esses depois da Queda. “Como era bom quando andávamos no frescor da tarde e não havia nada entre o meu Deus e eu!” Jó continua a se lembrar de...

Quando fazia resplandecer a sua lâmpada sobre a minha cabeça, quando eu, guiado por sua luz, caminhava pelas trevas.

Jó 29:3

Lindas palavras. Jó está-se deleitando com a lembrança de dias passados. Não se trata de um pai coruja ou de um avô cheio de ter­ nura, mas de um homem adulto se lembrando de quando seus dez filhos estavam em sua companhia; quando podiam visitar uns aos outros, participar juntos de refeições e se alegrarem nos dias de comemorações especiais com todos ao redor da mesa. “Lembro-me

O TESTEMUNHO FERVOROSO DE UM INOCENTE 275 de quando...”, diz Jó. Como tudo era bom! Aprecio demais as suas descrições:

Quando eu lavava os pés em leite, e da rocha me corriam ribeiros de azeite.

Jó 29:6

Ele escreve como um poeta, usando figuras de palavras cheias de vida. O mundo dele era tão sereno; a vida, tão agradável; a alegria, um dom sempre presente.

Todos temos dias a serem lembrados por causa de momentos como esses. Talvez nos dias de sua inocência. Quem sabe antes que as dificuldades da vida tivessem surgido para atormentá-lo. Quando você olha para trás, é possível que se lembre dessas horas simples e tranquilas que passou com o Senhor, quando seus passos pareciam ser ordenados por ele, quando cada madrugada trazia raios de espe­ rança nova e fresca — só você, ele e a sua Palavra.

Quando eu saía para a porta da cidade, e na praça me era dado sentar-me, os moços me viam e se retiravam; os idosos se levantavam e se punham em pé; os príncipes reprimiam as suas palavras e punham a mão sobre a boca; a voz dos nobres emudecia, e a sua língua se apegava ao paladar.

Jó 29:7-10

Que pitoresco! Quando as pessoas estão na presença de alguém grandemente admirado, elas no geral colocam a mão na boca e ficam só olhando. Os jovens antes reagiam assim quando se aproximavam do respeitável Jó.

Lembro-me de ter feito isso, durante meus anos de treinamento para o ministério, quando era aluno do Seminário Dallas. Eu não só estava estudando com professores invejáveis (uma oportunidade

276 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

privilegiada que sempre valorizei), como também, em certas ocasiões, a escola convidava um respeitado estadista cristão como preletor ou para ensinar um livro da Bíblia em nosso campus. Lembro-me da primeira vez que conheci o Dr. Richard Seume, pastor em Richmond, Virgínia, e membro da diretoria do seminário. Posso ainda recordarme da sua chegada ao campus-, sua presença foi uma bênção para o corpo estudantil. Havia outros como o Dr. Seume que também con­ siderávamos. Eu gostava até de simplesmente sentar-me perto deles, observando-os atentamente — isso me comovia. Os jovens faziam o mesmo com Jó.

Jó chegava à praça da cidade, não com ares orgulhosos, mas cum­ prindo seus deveres, suas responsabilidades de líder. Os mais moços se reuniam para ouvir suas palavras sábias. Ali estava um homem a quem era possível confiar riquezas. Cidadão abastado, mas que nun­ ca se comportava como se fosse superior a quem quer que fosse. Como é impressionante ficar perto de uma pessoa assim - verdadeiramente humilde, todavia rico, um homem de grande compaixão e também de grande generosidade. Sua vida era como o correr do azeite sobre rochas, fluindo para a vida de outros. Até mesmo príncipes paravam e ficavam olhando.

Por que tamanho respeito?

Ouvindo-me algum ouvido, esse me chamava feliz; vendo-me algum olho, dava testemunho de mim; porque eu livrava os pobres que clamavam e também o órfão que não tinha quem o socorresse. A bênção do que estava a perecer vinha sobre mim, e eu fazia rejubilar-se o coração da viúva. Eu me cobria de justiça, e esta me servia de veste; como manto e turbante era a minha equidade. Eu me fazia de olhos para o cego e de pés para o coxo. Dos necessitados era pai e até as causas dos desconhecidos eu examinava. Eu quebrava os queixos do iníquo e dos seus dentes lhe fazia eu cair a vítima.

Jó 29:11-17

O TESTEMUNHO FERVOROSO DE UM INOCENTE 277

Ele protegia os indefesos e os abusados por outros. Não se esque­ cia dos necessitados. Além disso, quebrava o queixo dos iníquos. Defendia a causa dos maltratados.

Quando o mundo esportivo perdeu um atleta importante, há não muito tempo, os jornais deram a notícia. O time de futebol profissional Baltimore Colts tinha um lançador chamado Johnny Unitas, que foi um dos grandes lançadores de minha juventude. Lem­ bro-me de que, quando jovem, começando a me interessar pelo futebol profissional, eu ficava observando o homem então chamado de “general de campo”, um título dado no passado aos lançadores. “Johnny U” era realmente um general de campo.

Era também um excêntrico. Li na revista Sports Illustrated que tanto os técnicos como os jogadores tinham respeito por ele. Em certa ocasião, ele sorriu e disse ao técnico: “Fique sentado e aprecie, não preciso de qualquer ajuda neste jogo.” Aquele era um lançador dos bons. A resposta do técnico? “Para ser sincero, nós acabamos com eles e eu fiquei fora do caminho.”

De vez em quando surgem em cena nesta terra pessoas que pren­ dem nossa atenção. Elas parecem dominar a vida, e gostamos de ficar nas suas proximidades. Jó era alguém assim.

Eu lhes escolhia o caminho, assentava-me como chefe e habitava como rei entre as suas tropas, como quem conso­ la os que pranteiam.

Jó 29:25

Este versículo abrange cada aspecto do seu papel na comunidade. Ele participou de tudo - desde liderar o conselho em tempos de paz, até guiar o povo através das crises, cuidando sempre dos desafortuna­ dos. Jó era uma inspiração para a comunidade inteira.

RECAPITULANDO SUA DESGRAÇA PRESENTE

“Mas agora.” Aquilo foi antes, isto é agora. Tudo mudou. Jó talvez pisque entre lágrimas enquanto arregaça a manga do roupão e expõe

278 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

os tumores inchados, que coçam. Seus lábios estão rachados e san­ grando. Sua língua, ressecada. Seu corpo, esquelético. As linhas de sua face se alongaram, se aprofundaram. Perdeu o cabelo, e o couro cabeludo ficou empolado.

Mas agora se riem de mim os de menos idade do que eu, e cujos pais eu teria desdenhado de pôr ao lado dos cães do meu rebanho... Mas agora sou a sua canção de motejo e lhes sirvo de provérbio. Abominam-me, fogem para longe de mim e não se abstêm de me cuspir no rosto.

Jó 30:1, 9, 10

Este é o mesmo homem junto ao qual outros se sentavam silenciosamente, cheios de respeito. Isso não mais acontece. Agora, “não significo nada para eles. Sou um refugo enfermiço. Um objeto de vergonha”. Ele per­ deu o seu lugar de honra, e sua riqueza não passa de uma lembrança.

Sobrevieram-me pavores, como pelo vento é varrida a minha honra; como nuvem passou a minha felicidade.

Jó 30:15

Jó já não recebe grandes bênçãos de Deus. Sinta o gemido de dor em suas palavras.

A noite me verruma os ossos e os desloca, e não descansa o mal que me rói. Pela grande violência do meu mal está desfigu­ rada a minha veste, mal que me cinge como a gola da minha túnica. Deus, tu me lançaste na lama, e me tornei semelhan­ te ao pó e à cinza. Clamo a ti, e não me respondes; estou em pé, mas apenas olhas para mim. Tu foste cruel comigo; com a força da tua mão tu me combates. Levantas-me sobre o vento e me fazes cavalgá-lo; dissolves-me no estrondo da tempestade.

Jó 30:17-22

O TESTEMUNHO FERVOROSO DE UM INOCENTE 279

Uma noite angustiosa após outra. “A benevolência que antes es­ tendi aos necessitados não é retribuída. Nada me é concedido.” Como deve ter sido difícil para ele!

Aguardava eu o bem, e eis que me veio o mal; esperava a luz, veio-me a escuridão. O meu íntimo se agita sem cessar; e dias de aflição me sobrevêm. Ando de luto, sem a luz do sol; levanto-me na congregação e clamo por socorro. Sou irmão dos chacais e companheiro de avestruzes.

Jó 30:26-29

O escritor e estudioso Roy Zuck capta a essência da lamentação de Jó:

Jó concluiu a queixosa descrição do seu atual remorso, de­ clarando que a sua alegria se transformara em tristeza (30:31). Sua harpa e sua flauta, instrumentos para expres­ sar júbilo (cf. 21:12), só tocavam agora nênias fúnebres, acompanhando o choro dos enlutados. Os cinco últimos versículos se alternam entre sofrimento emocional (30:27, 29, 31) e dor física (30:28, 30). Os moleques zombam, cospem e atacam; Deus permanece silencioso; os amigos não mostravam simpatia; e Jó geme de dor. Essa a condi­ ção de Jó - o antigo plutocrata.2

Em vez de respeito, rejeição. Em lugar de força e alegria, o seu mun­ do era de doença, humilhação e tristeza enquanto Jó escreve essas palavras com a mão trémula:

Enegrecida se me cai a pele, e os meus ossos queimam em febre. Por isso, a minha harpa se me tornou em prantos de luto, e a minha flauta, em voz dos que choram.

Jó 30:30, 31

280 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Sua harpa, feita para celebrar enquanto as pessoas dançam nas ruas, e a flauta, com seus tons animados e belos, agora tocam apenas em tom menor. Isso me traz à lembrança o lamento solitário das gaitas de fole ouvido nas ruas e vielas de Nova York. Nessas mesmas ruas houvera danças celebrando as nossas vitórias depois das guerras mundiais. Nessas mesmas ruas se fizeram ouvir os passos alegres dos financeiramente independentes que trabalhavam no setor das finan­ ças, não só da nossa nação, como do mundo todo. Mas, agora, depois do 11 de setembro, o lamento das gaitas de fole enche o dia, à medida que os funerais passam um após outro.

Essa cena de tristeza me traz à mente o Salmo 137. Cada salmo tem o seu lugar de origem único. Esta canção antiga nasceu em um período de infortúnio. Os judeus representados nela estão de luto por terem sido enviados para o cativeiro. Os exércitos babilónicos invasores destruíram a cidade de Jerusalém. Sião está em ruínas, e os judeus cativos marcham vagarosamente para a Babilónia. O salmista compôs este salmo como uma canção fúnebre.

As margens dos rios da Babilónia, nós nos assentávamos e chorávamos, lembrando-nos de Sião. Nos salgueiros que lá havia, pendurávamos as nossas harpas, pois aqueles que nos levaram cativos nos pediam canções, e os nossos opressores, que fôssemos alegres, dizendo: Entoai-nos algum dos cânticos de Sião.

Salmos 137:1-3

Ouça o sarcasmo: “Cantem um daqueles grandes salmos de que tanto gostam. Cantem para nós agora. Queremos ouvi-lo!” Nesse momento trágico, o salmista pergunta:

Como, porém, haveríamos de entoar o canto do Senhor em terra estranha?

Salmos 137:4

O TESTEMUNHO FERVOROSO DE UM INOCENTE 281

Era como se você e eu fôssemos levados cativos nesta última semana e, marchando para o lugar onde vamos ficar presos, um de nossos cap­ tores dissesse: “Cantem para nós um desses hinos da igreja, talvez, Certeza Abençoada, Jesus éMeu!? Vamos ouvir esse. Ou então O Sangue do Salvador Será Proveitoso Para Mim? Cantem aquele escrito pelo grande Charles Wesley. Ou quem sabe o hino vitorioso de batalha de Martinho Lutero, Castelo Forte Eo Nosso Deus." Nós colocaríamos os instrumentos no chão. Não é possível cantar o hino do Senhor numa terra estranha.

Isto me lembra um fenómeno interessante ligado a grande sofrimen­ to. Raras vezes ouço música em quartos de hospital onde os que agonizam estão deitados, olhando para a parede. Ouço orações, mas não cânticos.

Esse é o ponto de Jó aqui. “Minha harpa que antes tocava esses grandes hinos que nossa família gostava de cantar e minha flauta, que acompanhava o canto deles, estão caladas.” Os amigos, porém, não se comovem. Tudo em que conseguem pensar é na culpa dele. “Você foi a causa desta tragédia.”

CONFIRMANDO A SUA INTEGRIDADE PESSOAL

Jó continua escrevendo, listando um exemplo após outro, e diz: “A culpa nao é minha. Refleti sobre a glória passada. Recapitulei minha desgraça presente, mas quero dizer-lhes: tenho toda razão para insis­ tir na minha presente integridade. Ela continua intacta.” E ele lista vários exemplos.

“Não houve lascívia secreta, nem pecados sexuais ilícitos em minha vida” (Jó 31:1-12). “Também não houve abuso de poder, não tirei proveito de alguém necessitado ou indefeso” (31:13-23). “Não houve transigência em relação à integridade diante de Deus ou do homem” (31:24-40). Veja os exemplos.

Nao houve cobiça lasciva de minha parte.

Fiz aliança com meus olhos; como, pois, os fixaria eu numa donzela? Que porção, pois, teria eu do Deus lá de cima e que herança, do Todo-Poderoso desde as alturas?

Jó 31:1, 2

282 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Não houve mentiras.

Se andei com falsidade, e se o meu pé se apressou para o engano (pese-me Deus em balanças fiéis e conhecerá a minha integridade).

Jó 31:5, 6

Nao foi cometido adultério.

Se o meu coração se deixou seduzir por causa de mulher, se andei à espreita à porta do meu próximo, então, moa minha mulher para outro, e outros se encurvem sobre ela. Pois se­ ria isso um crime hediondo, delito à punição de juizes.

Jó 31:9-11

Não houve opressão.

Se desprezei o direito do meu servo ou da minha serva, quando eles contendiam comigo, então, que faria eu quan­ do Deus se levantasse? E, inquirindo ele a causa, que lhe responderia eu? Aquele que me formou no ventre materno não os fez também a eles? Ou não é o mesmo que nos formou na madre?

Jó 31:13-15

Não houve falta de compaixão.

Se retive o que os pobres desejavam ou fiz desfalecer os olhos da viúva; ou, se sozinho comi o meu bocado, e o órfão dele não participou (Porque desde a minha mocida­ de cresceu comigo como se eu lhe fora o pai, e desde o ventre da minha mãe fui o guia da viúva.); se a alguém vi perecer por falta de roupa e ao necessitado, por não ter

O TESTEMUNHO FERVOROSO DE UM INOCENTE 283 coberta; se os seus lombos não me abençoaram, se ele não se aquentava com a lã dos meus cordeiros; se eu le­ vantei a mão contra o órfão, por me ver apoiado pelos juizes da porta.

Jó 31:16-21

Não existiu também materialismo.

Se no ouro pus a minha esperança ou disse ao ouro fino: em ti confio; se me alegrei por serem grandes os meus bens e por ter a minha mão alcançado muito... também isto seria delito à punição de juizes; pois assim negaria eu ao Deus lá de cima.

Jó 31:24, 25, 28

Jó alcança, finalmente, um clímax em sua própria defesa.

Tomara eu tivesse quem me ouvisse! Eis aqui a minha defesa assinada! Que o Todo-Poderoso me responda! Que o meu adversário escreva a sua acusação! Por certo que a levaria sobre o meu ombro, atá-la-ia sobre mim como coroa; mos­ trar-lhe-ia o número dos meus passos; como príncipe me chegaria a ele.

Jó 31:35-37

Ele anseia por que alguém lhe dê atenção. Sem defesa legal, é obrigado a defender a si mesmo neste tribunal imaginário. Os que fazem parte do júri estão todos de testa franzida. Jó diz então: “Vocês podem pensar que nada disto é verdade, mas eu me apóio nessas declarações. Se houver alguma evidência que possam usar contra mim, declarem isso e deixem que Deus seja o juiz.” Não há nenhu­ ma. Portanto, é como se ele dissesse neste ponto: “A defesa termina aqui a sua apresentação.”

284 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

TRÊS TEMAS...TRÊS VERDADES

Você foi muito paciente em permanecer comigo através deste capítulo um tanto tedioso, e agradeço por isso. Embora nao tenha sido muito interessante, espero que pelo menos tenha sido edificante. Vimos três temas emergirem da pena de Jó na antiguidade; em cada um enxergo uma verdade que vale a pena ser lembrada hoje.

Esta é a primeira: refletir sobre as bênçãos passadas nos dá razões para alegrar-nos. Quero recomendar a vocês, que são pais ainda criando filhos, que os ensinem a fazer isto mediante prática constante. A hora do jantar é uma ótima oportunidade para refletir. Um momento ideal para fazer um retrospecto do dia e contar as suas bênçãos, como fez Davi no Salmo 103. Veja a lista que ele compilou:

Bendize, ó minha alma, ao S en h o r, e tudo o que há em mim bendiga ao seu santo nome. Bendize, ó minha alma, ao S e n h o r, e não te esqueças de nem um só de seus benefícios. Ele é quem perdoa todas as tuas iniqiiidades; quem sara todas as tuas enfermidades; quem da cova redime a tua vida e te coroa de graça e misericórdia; quem farta de bens a tua velhice, de sorte que a tua mocidade se renova como a da águia. O S en h o r faz justiça e julga a todos os oprimidos. Manifestou os seus caminhos a Moisés e os seus feitos aos filhos de Israel. O S enhor é misericordioso e com­ passivo; longânimo e assaz benigno. Não repreende perpe­ tuamente, nem conserva para sempre a sua ira. Não nos trata segundo os nossos pecados, nem nos retribui consoante as nossas iniqiiidades. Pois quanto o céu se alteia acima da terra, assim é grande a sua misericórdia para com os que o temem. Quanto dista o Oriente do Ocidente, assim afasta de nós as nossas transgressões.

Salmos 103:1-12

Davi nos dá um bom exemplo a ser seguido. Faça uma pausa sufi­ ciente para refletir. Resista à tentação de citar coisas que não deram

O TESTEMUNHO FERVOROSO DE UM INOCENTE 285 certo. Recuse-se a enfocar conflitos que não foram resolvidos. Vá para as bênçãos e estacione nelas. Jó fez isso, lembra-se? Esse tipo de reflexão levanta o nosso espírito. Recordar apenas as coisas boas do passado impede que sejamos negativos.

Agora, em segundo lugar: relembrar as tribulações presentes nos força a engolir o nosso orgulho. Se há algo que devemos engolir, é cada grama do nosso orgulho. O orgulho combina com uma cultura cor­ rompida. O cinismo e a sofisticação se alimentam dele. O orgulho nos leva a desprezar os outros porque temos uma opinião elevada da nossa própria importância. Sugiro que reflitamos sobre as tribulações presentes que estamos atravessando e permitamos que elas nos colo­ quem em nosso lugar. Ser “nivelado” tem os seus benefícios.

Você talvez se encaixe neste ponto. Como resultado, tudo mu­ dou para você. Conhecia antes um deleite que não encontra mais. Permita que isso o humilhe. Coloque o seu orgulho no banco de trás. Enfrente o fato de que você, como Paulo que recebeu um espinho na carne, sofreu este problema para que não se impressionasse demais com sua própria importância. .

De fato, Paulo afirma duas vezes que recebeu um espinho na carne “para impedir que me exaltasse”. Pouco depois, ele repete as mesmas palavras: “para que não me ensoberbecesse” (2 Co 12:7). Que melhor uso das provações do que permitir que elas nos humilhem?

Agora, finalmente, a terceira: confirmar nosso compromisso com a integridade fortalece-nos, dando-nos confiança e coragem. É isto que mais aprecio em Jó: mesmo quando desanimado e desapontado, ele não se mostra derrotado. De fato, tem confiança e coragem para dizer diante do seu Deus: “Se isto for verdade, se aquilo for verdade, se encontrar em mim qualquer dessas coisas, pode matar-me.” Por saber, bem no fundo do coração, que a sua integridade continuava intacta, ele pôde dizer essas palavras com fervorosa certeza.

Você e eu sorrimos antes com a história do médico, do sacerdote e do advogado. Reveja comigo aquela cena. Compreendo que isto é hipotético, mas seja honesto. Você teria jogado o envelope com dois milhões de dólares no túmulo? Não é surpreendente como somos

286 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

criativos quando aparece uma oportunidade de colocar dois milhões de dólares no bolso? Dizemos a nós mesmos: “Oh! ele desejaria isso.” Ou: “Se ele estivesse lúcido, seria isto que...” A integridade diz que você deve cumprir a sua palavra. Você faz aquilo que promete. Se deixar de cumpri-la, a sua integridade reconhece a falha, e você a retifica. Sem ela, passamos a transigir. Com ela, continuamos confiáveis. A integridade nos ajuda a ficar firmes.

Cynthia e eu voltamos há pouco de uma viagem transformadora de vida aos lugares tornados famosos por um pequeno grupo de homens de coração firme e pensamentos retos. Nós os conhecemos hoje como os Reformadores. Esses indivíduos foram os líderes da Grande Reforma que varreu a Europa Central no século XVI. Seus nomes são sinónimos lendários de coragem, convicção e determina­ ção inflexível.

Jon Huss, da antiga Tcheco-Eslováquia, Martinho Lutero e Philip Melanchthon, da Alemanha, Ulrich Zwínglio e João Calvino, da Suíça, e John Knox, da Escócia (para citar apenas alguns), não eram super­ homens em estatura ou força. Não eram também absolutamente perfeitos. Foram, entretanto, homens íntegros, o que incluía quali­ dades de caráter que os mantiveram fiéis. Isso resultou também em se mostrarem intrépidos em face da oposição que não era só verbal, mas também uma ameaça às suas vidas. Para tomar de empréstimo a agora famosa frase de Lutero, cada um deles disse, com efeito: “Eisme aqui, não posso fazer qualquer outra coisa”, enquanto se recusa­ vam a fraquejar ou retratar-se. Da mesma forma que Jó, eles foram mal-interpretados, caluniados, acusados falsamente e abertamente insultados por seus críticos. Esses homens representavam as vozes solitárias da verdade enquanto se mantinham firmes em suas convicções.

Durante a nossa viagem, fiquei muitas vezes junto a uma está­ tua de bronze, ou subi ao púlpito onde um deles havia pregado, imaginando se, talvez, eles foram fortalecidos pelo exemplo de Jó nas Escrituras para conseguirem se manter sozinhos. Muito antes de eles terem vivido, Jó testemunhou: “Longe de mim que eu vos dê razão! Até que eu expire, nunca afastarei de mim a minha integridade.

O TESTEMUNHO FERVOROSO DE UM INOCENTE 287

À minha justiça me apegarei e nao a largarei; não me reprova a minha consciência por qualquer dia da minha vida” (Jó 27:5, 6).

Eu também perguntei a mim mesmo: “Eu teria coragem para fazer o que eles fizeram?”

E você?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Numa geração desconfiada, o seu testemunho de integridade ainda fala mais alto do que as acusações lançadas contra você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Mesmo inocente, Jó manteve um testemunho fervoroso diante de Deus; o que sustenta a sua consciência limpa em meio à provação?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como viver de modo que a sua palavra seja a sua garantia, mesmo quando o sofrimento poderia justificar o desânimo e o abandono da fé?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 23;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Outro Monólogo Demorado$t$, 23,
$conteudo$a igreja em que sirvo como pastor sénior, decidi pregar o Livro de Jó inteiro. Iniciei uma série expositiva de sermões no primeiro domingo de março de 2002. Só em meados de novembro transmiti a última mensagem desse livro. Como mencionei em minha introdu­ ção, a congregação da Community Church de Stonebriar foi muito paciente enquanto a série se prolongava mês a mês! Como você pode imaginar, houve momentos engraçados durante aqueles meses em que os membros da igreja brincaram comigo sobre o comprimento da série e o tema infindável de todo o sofrimento e dificuldades que Jó suportou.

N

Um pai enviou-me uma carta, incluindo um comentário feito pela filha. Ela perguntara: “Papai, eu tinha cinco ou seis anos quando o pastor Chuck começou a pregar sobre Jó?” Quando viajo, conto às pessoas que essa foi a única série que já preguei em que, quando disse “esta vai ser a minha última mensagem sobre Jó”, a congrega­ ção me aplaudiu de pé. O aplauso animado foi mais de alívio do que de gratidão!

290 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

À luz de tudo isso, você pode imaginar a reação deles quando chegou o domingo — já havíamos estado há meses com Jó e havia ainda meses à nossa frente antes de terminarmos - e eles leram o título do meu sermão, “Outro Monólogo Demorado”. Recebi al­ guns comentários clássicos sobre isso! Temos monitores de TV nos largos corredores da igreja, do lado de fora do nosso centro de adora­ ção. Eles apresentam o calendário de eventos para a semana seguinte, assim como anúncios especiais para informar a todos o que virá em seguida. Mostram também o título do meu sermão de uma semana para a outra. Quando este título foi mostrado, os recepcionistas me contaram sobre vários comentários que afirmam ter ouvido (ênfase em “afirmam”). Depois de ler o título, “Outro Monólogo Demorado”, ouvi que um homem encolheu os ombros e disse para a esposa: “O que será que há de novo para saber?” Houve também o adolescente que passou pelo monitor, franziu a testa e disse: “Oh! não...não outra vez!” Eu disse à nossa congregação que o pastor sente-se às vezes como o incompreendido da igreja! E quando as críticas começaram a ficar pesadas, cheguei a citar as palavras de Paulo a Timóteo em voz alta (com ironia): “Ora, todos quantos querem viver piedosamente (...) serão perseguidos” (2 Tm 3:12).

Admito que uma série sobre Jó é longa e pode começar a ser cansativa. O pregador aprende no correr dos anos que a pessoa só pode absorver uma certa quantidade de conhecimento de cada vez. Os pregadores jovens e inexperientes não sabem disso, portanto ten­ dem a dizer muita coisa durante muito tempo, e o rebanho fica entediado e inquieto. Sermões demorados podem ser terrivelmente cansativos.

Quando era presidente, Ronald Reagan, o grande comunicador, gostava de contar a história de um jovem camponês que acabara de terminar a escola, mas que nunca pregara um sermão. Quando chegou àquela igreja rural, ele entrou nela e, para sua surpresa, só havia um ran cheiro presente. A igreja se encontrava vazia, exceto por aquele homem sentado num banco duro, quase no fundo do salão. O jovem pregador foi ao encontro dele, apertou-lhe a mão e disse: “O que você acha que devo fazer?” O velho rancheiro respondeu:

OUTRO MONÓLOGO DEMORADO 291

“Não sei muito bem, filho, sou apenas um vaqueiro. Mas, se eu fosse para o campo e visse apenas um animal, eu o alimentaria? Isso era tudo que o pregador precisava. Ele subiu ao púlpito e pregou um sermão infindável. Uma hora depois, ao terminar a maratona, perguntou então ao vaqueiro: “O que achou?”

“Na verdade não sei, filho. Mas posso dizer-lhe isto. Se eu fosse até o campo e descobrisse que tinha um só animal, eu não lhe daria toda a ração de uma só vez. ”

Admito que faço sermões longos demais em certas ocasiões, mas o que me encoraja é que estou em boa companhia. Você se lembra de uma experiência que o apóstolo Paulo teve com um homem chamado Êutico? Na única vez em que ele é mencionado nas Escrituras, acon­ teceu algo embaraçoso. A cena é registrada em Atos 20.

No primeiro dia da semana, estando nós reunidos com o fim de partir o pão, Paulo, que devia seguir viagem no dia imediato, exortava-os e prolongou o discurso até à meia-noite.

Atos 20:7

(Escrevi estas palavras à margem de minha Bíblia ao lado desse versículo: “Deus o abençoe!”).

A história continua...

Havia muitas lâmpadas no cenáculo onde estávamos reunidos. Um jovem, chamado Êutico, que estava sentado numa ja­ nela, adormecendo profundamente...

Atos 20:8, 9

Não é uma descrição interessante? O homem estava caindo lenta­ mente num sono profundo. Já vi isso acontecer tantas vezes em meu ministério! (Quando percebemos que a cabeça deles começa a inclinarse sobre o peito, é que pensamos então em terminar!)

292 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

...durante o prolongado discurso de Paulo, vencido pelo sono, caiu do terceiro andar abaixo e foi levantado morto.

Atos 20:9

Aprecio demais esta história!

Descendo, porém, Paulo inclinou-se sobre ele e, abraçandoo, disse: Não vos perturbeis, que a vida nele está. Subindo de novo, partiu o pão, e comeu, e ainda lhes falou larga­ mente até ao romper da alva. E, assim, partiu.

Atos 20:10, 11

Aquele estimado companheiro não conseguiu se manter acordado. Apoderou-se dele um sono profundo, e ele caiu da janela, de uma altura de três andares, morrendo por causa da queda. O apóstolo o ressuscita milagrosamente.

A advertência familiar de Charles Spurgeon é digna de ser repe­ tida: “Lembrem-se de que, se adormecermos durante o sermão e mor­ rermos hoje, não há apóstolos para nos ressuscitar.” Depois de ter escrito tudo isto sobre pregar sermões muito longos, você vai ficar aliviado ao saber que o título deste capítulo não tem nada a ver comi­ go pessoalmente. Tem tudo a ver com um homem chamado Eliú - o quarto “amigo” de Jó, que sai das sombras e fala demais, dizendo muito pouco.

Elifaz, Bildade e Zofar discursaram sem parar, incluindo comen­ tários cáusticos e conclusões insultuosas. Por sorte, como vimos, aca­ baram desistindo. Não há dúvida de que ficaram por perto, olhando para Jó com ares severos. Deixaram, entretanto, de fazer uso dos lábios. Se você não conhece a história, pensaria que todos os sermões haviam terminado. Mas não foi assim. Há mais um — bem longo!\LX\í\ esperou a sua vez. Quando começa a falar, ele não pára até ter dito o que corresponde a seis capítulos da Bíblia (Jó 32-37). O comprimento desses capítulos no texto bíblico é maior do que doze outros livros do

OUTRO MONÓLOGO DEMORADO 293

Antigo Testamento e dezessete dos 27 livros ou cartas do Novo Testa­ mento. Suponho que podemos dizer que Eliú deu a Jó todo o ali­ mento de uma só vez.

OBSERVANDO A ABORDAGEM DE ELIÚ

Em lugar de envolver-nos em detalhes desnecessários, vamos começar passando apenas os olhos pelas palavras de Eliú enquanto observa­ mos sua abordagem.

E possível que seja útil apresentar aqui alguns comentários gerais. Eliú faz quatro discursos. Dois deles abrangem dois capí­ tulos bíblicos que cobrem sua mensagem inicial (capítulos 32 e 33). Seu segundo discurso está registrado em Jó 34. Seu terceiro discurso se encontra no capítulo 35. A seguir, seu quarto e último discurso pode ser lido nos capítulos 36 e 37. Como muitos ser­ mões que ouvimos, Eliú é mais convincente no início e no fim do que no meio de sua mensagem. Nesta seção ele se torna um tanto monótono e aborrecido. Para ser justo, Eliú comunica dois pon­ tos excelentes.

Primeiro, Deus disciplina o indivíduo, a fim de desviá-lo do erro e colocá-lo em seu caminho. Esse princípio é eterno e verdadeiro. Deus nunca desperdiça os testes. Quando age, para seu propósito é fazer o desobediente voltar e ele.

Segundo, Deus governa com justiça; ele éjusto. Outro fato confiável. O tema principal de tudo que Eliú tem a dizer pode ser declarado em três palavras: Deus é soberano. Ele não é só bom todo o tempo, Ele está no controle todo o tempo. “Mesmo quando eu adoeço?” Sim, mesmo quando você adoece. “Mesmo quando não posso compreen­ der a razão?” Sim, mesmo quando não sabe explicar as razões. “Como está acontecendo agora?”, você pergunta. Com certeza que sim. Deus nunca fica chocado ou surpreso. Nossas vidas nunca estão, portanto, fora do controle dele. Mais ainda, Deus não se sente obrigado a ex­ plicar a si mesmo. A verdade é que, mesmo que fizesse isso, a maioria de nós continuaria sem compreender, porque os caminhos dele e o seu plano são profundos. Na esperança de gravar isto em sua memória,

294 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

vou repetir: Deus é soberano, e ele não explica a si mesmo, nem deveria sentir-se obrigado a isso.

Jó e os três conselheiros não respondem a Eliú em tempo algum. Esses seis capítulos bíblicos não são interrompidos. Não há resposta. Não há diálogo. Trata-se de um monólogo desde o começo até o fim — um longo monólogo, na verdade.

De modo interessante, Eliú (ao contrário dos outros) admite logo que está zangado. De fato, o relato bíblico declara nada menos que quatro vezes que o homem está fervendo de raiva.

Cessaram aqueles três homens de responder a Jó no tocante ao se ter ele por justo aos seus próprios olhos. Então, se acendeu a ira de Eliú (...) acendeu-se a sua ira contra Jó, porque este pretendia ser mais justo do que Deus. Também a sua ira se acendeu contra os três amigos, porque, mesmo não achando eles o que responder, condenavam a Jó. Eliú, porém, esperara para falar a Jó, pois eram de mais idade do que ele. Vendo Eliú que já não havia resposta na boca daqueles três homens, a sua ira se acendeu.”

Jó 32:1-5

Você se lembra de quando disse algo numa explosão de ira? Lembrase de algumas outras vezes em que “ferveu de raiva”? Durante esses períodos não só dizemos coisas que gostaríamos de não ter dito, como também dissemos muito mais do que queríamos dizer. E também possível que tenhamos dito algumas coisas que devessem mesmo ser ditas. Nessas ocasiões ficamos temporariamente fora de controle. Tenha isso em mente ao ler as palavras de Eliú.

Disse Eliú, filho de Baraquel, o buzita: Eu sou de menos idade, e vós sois idosos; arreceei-me e temi de vos declarar a minha opinião. Dizia eu: Falem os dias, e a multidão dos anos ensine a sabedoria. Na verdade, há um espírito no ho­ mem, e o sopro do Todo-Poderoso o faz sábio. Os de mais

OUTRO MONÓLOGO DEMORADO 295

idade não é que são os sábios, nem os velhos, os que enten­ dem o que é reto.

Jó 32:6-9

Com o passar dos anos aprendemos que é necessário respeitar os mais velhos. As palavras de Eliú representam os seus sentimentos de inti­ midação. Ele reluta em falar. Diz até que “se arreceava” de externar seus pensamentos a eles. Faz, porém, uma observação acurada, tendo ouvido aqueles homens grisalhos que falaram antes. Eliú declara que os que são avançados em anos “podem não ser sábios”. Tem razão. O passar dos anos não é uma garantia de que a sabedoria foi absorvida. A pessoa pode ser velha e tola. Se acharmos que Eliú é um tanto misterioso, isso se deve ao fato de ele ser criterioso num momento e insípido em outro. O homem pode mostrar-se às vezes perspicaz e, logo depois, obtuso.

Penso que o termo adotado para ele pelo escritor David Atkinson é bem aplicado: enigma.

Eliú é praticamente um enigma. Ele vocifera como um jo­ vem irado, cheio de si, oferecendo-se para esclarecer a situa­ ção a Jó e aos amigos, zangado com a confusão em que se meteram. De um lado é quase uma cena cômica, pois ele consegue passar bastante tempo sem dizer muita coisa. Re­ pete em grande parte o que os outros amigos já haviam dito, enquanto supõe dizer coisas novas. Afirma declarar mais do que os três amigos haviam expressado, e isto é certamente verdade no início e no final de seus discursos. Os discursos do meio são, porém, frios e decepcionantes — uma queda no moralismo que parece pesada demais para Jó.

E provável que nesses discursos Eliú esteja se posicionando como uma espécie de árbitro entre Jó e Deus. Quem sabe ele se julga num tribunal, tentando apresentar um caso o mais friamente possível. Está tentando estabelecer os argumentos pró e contra, da perspectiva de um observador imparcial (...)

296 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Eliú é arrogante, comete erros, mas em meio às suas bazófias há algumas pedras preciosas. Nessas gemas é que en­ contramos parte da preparação necessária a Jó - e também a nós leitores - para ficar pronto para ouvir o Senhor.1

A admissão de Eliú diz tudo: “Porque tenho muito que falar” (Jó 32:18). Ele está também cheio de si. Por ser mais jovem, é irrefletido. Por estar zangado, fala demais.

ANALISANDO OS ERROS DE ELIÚ

O homem cometeu pelo menos quatro erros desde que começou.

Primeiro, levou muito tempo para iniciar o discurso. Você sabe como é dizer a alguém que conhecemos muito bem, como um membro da família: “Vamos, não fique dando voltas.” Ou: “O que está tentando exatamente dizer?” Queremos uma conclusão. Dá vontade de pres­ sionar assim Eliú: “Do que se trata? Diga logo.” Quando ele final­ mente fala, você pensa: “Sinto tê-lo apressado.”

Segundo, ele dá a impressão de ser pomposo. Nãoépreciso ler muitas palavras de Eliú antes de perceber o orgulho escorrendo entre as linhas. Ele deixa pouco espaço para respostas. Declara a sua opinião com arrogância. Considera-se a autoridade final. Não fala simplesmente, mas prega. Quero fazer uma sugestão. Quando se trata de falar com uma única pessoa ou com poucas, deixe a pregação para os outros. Em conversas com seus filhos ou com sua esposa, não pregue. Isso também se aplica ao seu chefe ou a alguém que trabalha para você. A pregação não é apropriada em pequenos grupos. Eliú esqueceu-se disso.

Terceiro, ele diz o que Jó já sabia. Não apresenta nada de novo a Jó. E por isso que este não responde. Oferece informação conhecida.

Quarto, ele nunca reconhece que não tem certeza das coisas. Há algo refrescante em alguém que está falando e admite de bom grado: “Na verdade não sei tudo quanto deveria saber sobre este assunto, mas...” E maravilhoso ficar perto de alguém com grande conhecimento, mas que admite: “Não sou a palavra final.”

OUTRO MONÓLOGO DEMORADO 297

Um de meus mentores é um homem que significou muito para mim durante meus anos de estudante (e significa ainda muito até hoje). O Dr. Bruce Waltke é um dos maiores estudiosos das Escrituras Hebraicas que já conheci. Tive o privilégio de estudar com ele durante três dos quatro anos em que estive no seminário. Que experiência esplêndida! Lembro-me ainda de ter feito um curso preparatório em hebraico certo verão, antes de começarmos oficialmente as aulas naquele outono. Ele ficava sentado num banco alto na frente da classe enquanto ensinava. O Dr. Waltke abraçava sua Kittel Hebrew Bible com os dois braços enquanto lia e ocasionalmente se balançava de um lado para outro. Notei que algumas vezes ele chorava enquanto lia. (Eu chorei por outras razões enquanto tentava lê-la.) Esse homem é realmente uma mistura maravilhosa: erudito brilhante e coração terno. Ele não só conhecia o texto, ele compreendia as notas de rodapé, conhecia o mecanismo da textura, assim como os argumen­ tos para a interpretação. Todavia, nunca pareceu considerar-se como “a” última palavra.

Há mais de trinta anos, quando eu pastoreava uma igreja perto do seminário, estava fazendo um estudo em profundidade do Livro de Provérbios sobre a família — enfatizando especialmente a criação de filhos. Em meu trabalho no idioma original, encontrei uma inter­ pretação que era de certa forma uma abordagem independente do assunto. (Imagine!)

A medida que me tornei cada vez mais convencido da minha posição, decidi apresentar minha interpretação singular ao Dr. Waltke. Telefonei para ele, marquei uma entrevista e alguns dias depois sentei-me a seu lado em seu minúsculo escritório. Ele me recebeu ama­ velmente:

“Chuck, como vai?”

“Ótimo, Dr. Waltke.”

“Sente-se, o que veio me dizer?”

“Bem, eu estou fazendo um trabalho sobre a primeira parte de Provérbios 22.”

Ele sorriu.

298 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Oh! um de meus favoritos.”

Folheou então sua velha Bíblia até achar essa seção, enquanto eu explicava minha posição depois de ter feito todo o meu trabalho no texto.

“Só preciso saber se tenho razão neste ponto.”

Ele ouviu sem interromper enquanto passei cerca de vinte minutos explicando o que descobrira e como planejava aplicar isso à congregação.

Quando levantei os olhos, ele apoiava o queixo nas mãos e olhava diretamente para mim. Jamais esquecerei suas palavras gentis: “Chuck, não há papas na igreja de Cristo. Não sou a palavra final sobre isto. A sua conclusão me parece boa. Se foi isso que você decidiu e o Senhor lhe mostrou essa interpretação depois de uma pesquisa cuidadosa, é isso que deve pregar.” Posso dizer-lhe que quase saí dançando do seu escritório. Suas palavras não eram só um alívio, como também faziam lembrar que a autoridade final da verdade não reside no ser humano. Jamais esquecerei seu comentário: “Não há papas na igreja de Cristo.”

Não importa qual seja a sua autoridade, por quanto tempo você tenha estudado na área, quantos diplomas avançados tenha recebido, você não tem a palavra final. Ainda é um aprendiz. Descobri que os eruditos que me ensinaram mais eram os mais receptivos ao ensino. Todos estamos numa curva de aprendizado. Aprendi algumas coisas de cada pastor que orientei. Espero que eles também tenham apren­ dido alguma coisa útil comigo.

Desde o dia em que ele apareceu, podemos afirmar que Eliú não é um aprendiz. Ele se posiciona com seu longo dedo indicador, empurrando-o contra o peito de Jó. A fim de piorar as coisas, é bem provável que nunca tivesse surgido um tumor em seu corpo — o de Jó está coberto deles. Quero entrar nessa cena e dizer: “Não há papas, Eliú. Aprenda com esse homem.”

ANALISANDO OS DISCURSOS DE ELIÚ

Uma vez que o homem fala tanto, não tentarei examinar cada detalhe dos seus discursos. Em vez disso, vamos nos concentrar em algumas coisas dignas de menção.

OUTRO MONÓLOGO DEMORADO 299

Seu primeiro discurso. Se eu tivesse de resumir em poucas palavras seu primeiro discurso, diria: “Deus não está mudo, mas a sua men­ sagem não é a que você esperava.” Isto é enfatizado em grande parte de Jó 33.

Ele começa confrontando Jó.

Por que contendes com ele, afirmando que não te dá contas de nenhum dos seus atos? Pelo contrário, Deus fala de um modo, sim, de dois modos, mas o homem não atenta para isso.

Jó 33:13, 14

Na poesia hebraica de qualidade, ele diz: “De um modo, sim, de dois modos”. Algumas vezes dirá: “Seis, sim, sete”. Está então afir­ mando: “Veja duas maneiras pelas quais Deus fala com você”.

Primeira: “Em sonho ou em visão de noite” (Jó 33:15). Deus fala com você, Jó, por meios sobrenaturais.

Segunda: O homem “também no seu leito é castigado com dores” (Jó 33:19). Deus fala igualmente quando estamos doentes. Quando nos deitamos, sofrendo dores angustiosas, o Senhor se comunica conosco. Deus fala por meio do próprio sofrimento. Como mencio­ nado antes, as pessoas que sofreram muito têm uma profundidade de conhecimento e compreensão que falta a outros de nós. Por quê? Por terem aprendido coisas profundas no leito de aflição.

Como Jó poderia então receber a mensagem de Deus? Eliú sugere:

Se com ele houver um anjo intercessor, um dos milhares, para declarar ao homem o que lhe convém, então, Deus terá misericórdia dele e dirá ao anjo: Redime-o, para que não desça à cova; achei resgate.

Jó 33:23-26

Permita que eu faça aqui uma pausa e dê a você algum tempo para considerar isso. Medite no que acabou de ler.

300 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Esta pode ser a opinião de Eliú, devemos admitir isso, mas tratase de uma escritura inspirada. Ela tem origem no Espírito de Deus e foi preservada para nós no registro bíblico. Sua referência a este anjo específico é realmente fascinante. Será possível que naqueles dias em que Deus se comunicava mediante sonhos e visões, quando falava diretamente às pessoas de maneira sobrenatural, havia um “anjo intercessor”? Parece que sim.

John Hartley escreve sobre este anjo em sua obra completa sobre Jó:

Eliú ensina que há um intercessor celestial que defende a causa do sofredor. Este auxiliar é um anjo que funciona como mediador (...) que ajudará quem quer que Deus esteja afli­ gindo por razões disciplinares.

Ele ensina a essa pessoa o que é certo (...) para ela, isto é, o caminho certo a tomar, o caminho que a fará sair do sofri­ mento e voltar a Deus (...)

A identidade deste anjo mediador é incerta (...) Eliú está também contrariando a posição de Elifaz no sentido de não haver um santo a quem Jó possa pedir ajuda. Eliú diz que há um anjo especial que trabalha pela redenção dos afli­ gidos. A frase “um dos milhares” é tida por alguns como significando um anjo comum, mas, pela maneira como é usada em 9:3, será melhor compreendida como tendo força grandemente restritiva. Portanto, este anjo mediador é uma criatura celestial muito especial (...) No ensinamento de Eliú, este anjo especial ajuda na restauração daqueles que se desviaram do caminho reto. Isto significa que Deus não abandona imediatamente nenhum de seus servos que erra. O inverso é verdade; ele trabalha zelosamente para a sua plena restauração ao serviço fiel.2

Antes de prosseguirmos, é necessária uma palavra de cautela. Deus fala raramente hoje por meio de sonhos e visões. Agora que as Escrituras

OUTRO MONÓLOGO DEMORADO 301

estão completas, não há praticamente necessidade disso. Eu creio certamente na presença de anjos, chamados em outro local de “espí­ ritos ministradores” de Deus. Eles cumprem as ordens de Deus; eles nos vigiam e protegem. Algumas vezes, até levam mensagens de Deus. Quase sempre são invisíveis. Dificilmente os ouvimos, vemos, ou tocamos, embora possam manifestar-se em forma humana, e fizeram isso segundo outras Escrituras.

Na época de Jó, antes de a Bíblia ter sido completada, Deus frequentemente revelava a sua mensagem por meio de sonhos e vi­ sões. Ao falar com seus servos que estivessem sofrendo, o seu “anjo intercessor” talvez esclarecesse essa mensagem e ajudasse o sofredor a entendê-la. Eliú está dizendo, com efeito: “Jó, Deus está falando com você nisto. Você está ouvindo o que ele tem a dizer? Deus pode ser invisível e parecer indiferente, mas ele está trabalhando.” Jó não responde.

Seu segundo discurso. Este se acha em Jó 34. Eliú começa dirigin­ do-se a todos - a Jó e também a seus três “amigos” (Jó 34:1-15). Fala depois especificamente a Jó (34:16-33).

Em vista de mencionar pouca coisa que já não tenha sido dita, vamos resumir ao máximo. Jó ainda não responde, e Eliú o ataca, irado. O The Message deixa entrever a ira contida no discurso.

Por que você não confessa simplesmente a Deus?

Diga: “Pequei, mas não pecarei mais.

Ensina-me a ver o que ainda não vejo.

Qualquer que seja o mal que tenha feito, não o repetirei.”

Só porque você se recusa a viver nos termos de Deus, pensa que deve começar a viver nos seus?

É você quem escolhe. Não posso decidir por você.

Conte-me a sua decisão.

Todos os que pensam retamente dizem - e os sábios que me escutaram concordam —

302 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Jó é ignorante.

Ele fala asneiras.”

Jó, você precisa ser colocado contra a parede e prestar contas por ter respondido rudemente a Deus como fez.

Você aumentou o seu primeiro pecado, rebelando-se contra a disciplina de Deus.

Sacudindo desafiadoramente o dedo para Deus, somando acusações contra o Todo-Poderoso.

Jó 34:31-37, MSG (Tradução livre)

Essas palavras iradas e inexatas não merecem a atenção de Jó, nem exigem resposta. Ele continua então mudo.

Seu terceiro discurso (Jó 35). Eliú apresenta aqui um caso contra os que têm motivos impuros (Jó!) e enfatiza que essa é a razão para o silêncio de Deus. Como antes, ele conclui com palavras ásperas, dirigidas, é claro, contra Jó - que continua sofrendo! Vamos ler nova­ mente do The Message:

As pessoas são arrogantes e indiferentes a Deus —

Naturalmente até que entrem em problemas, e Deus fica então indiferente a elas.

Não há nada por trás dessas orações exceto o medo;

O Altíssimo não lhes dá importância.

Por que ele notaria então você, só porque você diz que se cansou de esperar para ser ouvido,

Ou que se cansou de esperar para que ele fique bem irado e faça algo para resolver os problemas do mundo?

“Jó, você fala pura asneira — absurdos sem parar!”

Jó 35:12-16, MSG (Tradução livre)

OUTRO MONÓLOGO DEMORADO 303

Quarto e último discurso de Eliú. Uma mudança surpreendente ocorre no término do discurso final de Eliú. Ele volta ao assunto e comunica uma verdade confiável. De fato, faz mais sentido e fala com maior exatidão aqui do que qualquer um dos outros que falaram antes. Eliú cobre quatro pontos importantes:

1. Deus vigia e protege os justos.

2. Se os justos cometem uma transgressão, ele os faz saber que agiram errado.

3. Se aceitarem a vara da disciplina, ele os restaura.

4. Se persistirem no erro, irão sofrer certamente as consequências.

Excelente teologia! Por que o homem perdeu tempo e esforço dando voltas em tantas direções desnecessárias antes de chegar a este destino? Mas damos graças, porque ele afinal entendeu a questão direito.

Depois desse esplêndido resumo, Eliú levanta os olhos e dá plena atenção ao Senhor Deus. Parece que ele quer ajudar Jó a encontrar novamente o foco — como muitas vezes fazemos ao nos reunir para adorar em conjunto. Estas seis palavras poderiam ser escritas sobre Jó 36 e 37: tudo se refere ao nosso Deus!

O discurso final oferece uma magnífica transição para o mo­ mento em que Deus quebra finalmente o silêncio e se revela a Jó (capítulo 38). As palavras de Eliú permitem que Jó tenha uma boa compreensão do Deus vivo. Ele começa admitindo que treme quan­ do pensa no Senhor:

Sobre isto treme também o meu coração e salta do seu lugar. Dai ouvidos ao trovão de Deus, estrondo que sai da sua boca; ele o solta por debaixo de todos os céus, e o seu relâmpago, até aos confins da terra. Depois deste, ruge a sua voz, troveja com o estrondo da sua majestade, e já ele não retém o relâmpago quando lhe ouvem a voz. Com a sua voz troveja Deus maravilhosamente; faz grandes coi­ sas, que nós não compreendemos.

Jó 37:1-5

304 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Deus é proeminente e preeminente. É majestoso em seu poder, magnífico em sua pessoa e prodigioso em seus propósitos. Como é agradável recuar nas sombras da nossa insignificância e dar completa atenção à grandeza do nosso Deus! Tudo se refere a ele!

Como isto é diferente da menininha andando ao lado da mãe sob uma chuva torrencial e grande trovoada. Cada vez que um relâm­ pago cruzava os céus, a mãe notava que a menina se virava e sorria. Isso aconteceu várias vezes. A mãe finalmente perguntou: “Filha, o que está acontecendo? Por que você se vira e sorri depois do relâmpa­ go?” “Olhe, mãe, já que Deus está tirando o meu retrato, não quero deixar de sorrir para ele.”3

Damos um grande passo em direção à maturidade quando com­ preendemos finalmente que não se trata de nós e da nossa insigni­ ficância, mas de Deus e da sua magnificência. Sua santidade. Sua grandeza. Sua glória.

O S enhor tem o seu caminho na tormenta e na tempesta­ de, e as nuvens são o pó dos seus pés. (...) O S en h o r é bom, é fortaleza no dia da angústia e conhece os que nele se refugiam.

Naum 1:3, 7

Deus é transcendente. Ele é magnificente. É poderoso. Só ele é temível! O Senhor está à nossa volta, acima de nós e dentro de nós. Sem ele não há justiça. Não há santidade. Não há promessa de perdão, nem fonte de verdade absoluta, não há razão para perseve­ rar, não há esperança além da sepultura. Eliú faz Jó atentar neste Deus tremendo quando diz: i

Inclina, Jó, os ouvidos a isto, pára e considera as maravilhas de Deus. Porventura, sabes tu como Deus as opera e como faz resplandecer o relâmpago da sua nuvem? Tens tu notícia do equilíbrio das nuvens e das maravilhas daquele que é perfeito em conhecimento? Que faz aquecer as tuas vestes,

OUTRO MONÓLOGO DEMORADO 305

quando há calma sobre a terra por causa do vento sul? (...) Do norte vem o áureo esplendor, pois Deus está cercado de tremenda majestade. Ao Todo-Poderoso, não o podemos alcançar; ele é grande em poder, porém não perverte o juízo e a plenitude da justiça. Por isso, os homens o temem; ele não olha para os que se julgam sábios.

Jó 37:14-17, 22-24

Nada se compara a ele. Nunca devemos nos esquecer disto! Vamos adorá-lo e curvar-nos diante dele, exaltar o seu nome em palavras, em silêncio e por meio de cânticos. Como naquele grande hino:

Deus Sábio, Invisível, Perfeito, Imortal

Deus sábio, invisível, perfeito, imortal, poder intangível da luz celestial, glorioso e bendito, do tempo Senhor, a ti, Deus excelso, cantamos louvor.

Tranquilo tu brilhas qual luz secular; de plena justiça é teu governar. Da tua justiça provém o favor; das nuvens divinas, as chuvas do amor.

A todos concedes o dom de viver e tudo permeias supremo em poder. Qual flores nós somos, de breve esplendor; eterno, imutável, só tu és, Senhor.

Es Pai glorioso, és luz a brilhar; teus anjos não podem teu rosto mirar, mas nós entoamos aqui teu louvor e as frontes curvamos, humildes, Senhor.

Letra: Walter Chalmers Smith, 1867 Versão em português: João Wilson Faustini, 1969 Extraído do Hinário para o Culto Cristão — Edição de Letras

306 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Como veremos no capítulo seguinte, quando Deus finalmente fala, ele responde a Jó em meio a um redemoinho. De repente, ali está ele! Não seria maravilhoso estarmos também lá? Puxa! Relâmpa­ gos, trovões, ventos fortes soprando nuvens escuras pelo céu, e Deus surge do nada na cena. Jó deve ter perdido o fôlego quando o Senhor “do meio de um redemoinho respondeu” (Jó 38:1).

Há muito tempo (eu não tinha mais de dez anos), numa manhã tranquila e silenciosa, bem antes de amanhecer, eu estava pescando com meu pai. Nosso pequeno barco se achava em um braço da Baía de Matagorda. Nossas linhas estavam na água e ambos nos man­ tínhamos calados. Meu pai se acomodara na popa, e eu, perto da proa. Era uma daquelas manhãs em que você poderia jogar uma moeda na superfície da água e depois contar as ondulações. O silêncio nos rodeava como um túmulo — quase sinistro.

De repente, das profundezas da baía, próximo ao casco, surgiu um enorme camurupim vigoroso, saltando para fora da água. Ele faz uma reviravolta no ar e depois mergulhou, com um ruído enorme, de volta à baía. Eu devo ter pulado de susto alguns centímetros, tremendo de medo. Meu pai nem sequer se voltou. Ainda vigiando a linha, ele disse baixinho: “Falei para você que os grandões estavam lá embaixo.”

Essa é a mensagem de Eliú. Ele está aqui, Jó! Nosso Deus tremen­ do - glorioso, lá em cima. “Veja, Jó, ele está aqui. Nem sempre fica mudo. Quando fala, não há voz como a dele.” A visão de Jó em relação a Deus pode ter-se ampliado, graças aos comentários finais do amigo.

Robert Dick Wilson foi professor de Antigo Testamento em hebraico, de 1900 a 1929, no conhecido Seminário Teológico de Princeton, naqueles dias do passado em que a sua teologia era solida­ mente evangélica. B. B. Warfield, J. Gresham Machen e outros exce­ lentes teólogos serviam na mesma faculdade. Quando Machen saiu mais tarde e fundou o Seminário Westminster, Robert Dick Wilson o acompanhou. Eles formaram juntos a nova escola.

Donald Grey Barnhouse frequentou o Seminário Princeton de 1915 a 1917. Tempos depois, Barnhouse foi para a Décima Igreja

OUTRO MONÓLOGO DEMORADO 307

Presbiteriana em Filadélfia, onde serviu como pastor sénior durante 33 anos.

Mas, antes disso, doze anos após diplomar-se em Princeton, Barnhouse recebeu um convite para voltar ao seminário e pregar na Capela Miller. Um tanto intimidado e com certa trepidação, Barnhouse aceitou o convite. O dia finalmente chegou. Pouco antes de levantar-se para pregar, ele notou que Robert Dick Wilson entrara e fora sentar-se bem na frente, perto do púlpito da capela.

Até mesmo para um pregador tão bom quanto Barnhouse, pode ser intimidante ver seu velho professor sentado perto dele. Barnhouse contou, mais tarde, depois de terminar a mensagem, que o Dr. Wilson foi até ele, apertou-lhe a mão e disse: “Se você voltar, não virei ouvir a sua pregação — só ouço meus garotos uma única vez. E só venho para ver se eles são grandes ou pequenos adoradores.” Sem saber ao certo o que o Dr. Wilson queria dizer com isso, Barnhouse pediu uma explicação.

“Oh! é muito simples. Alguns homens têm apenas um Deus pequeno e estão sempre em dificuldades com ele. Ele não pode fazer milagres. Não pode cuidar dos detalhes da vida. Não interfere a favor do seu povo. Têm um Deus pequeno e eu os chamo de “pequenos adoradores”. Há também os que têm um Deus grande e poderoso. Ele fala e as coisas acontecem. Ordena e tudo se firma. Sabe como mostrar o seu poder em benefício dos que o temem.”

Barnhouse, ansioso para saber em que categoria se classificava, deu um suspiro de alívio ao ouvir a declaração final do professor.

“Você, Donald, tem um grande Deus (...) e ele vai abençoar o seu ministério.” Fez então uma pausa, olhou diretamente nos olhos do jovem pregador, sorriu e disse antes de se afastar: “Deus te aben­ çoe, Donald, Deus te abençoe.”4

De que tamanho é o seu Deus? Grande o bastante para interferir? Para você poder confiar nele? Um Deus tremendo e digno de todo o respeito? Grande o suficiente para anular todas as suas preocupações e substituí-las por paz?

308 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Quando o seu Deus é pequeno demais, seus problemas se ampliam e você recua com medo e insegurança. Quando o seu Deus é grande, seus problemas empalidecem na insignificância, e você sente reverência e respeito ao adorar o Rei.

Quem você é — um pequeno ou um grande adorador?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando o sofrimento parece um "monólogo demorado" que não termina, como você tem mantido a paciência e a fé ao longo da espera?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que palavras você ainda precisa derramar diante de Deus, mesmo que pareçam demoradas e repetitivas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como atravessar uma temporada longa de dor sem perder a esperança de que Deus terá a última palavra?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 24;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Uma Reprovação Severa do Todo-Poderoso$t$, 24,
$conteudo$eus se comunica conosco, de maneiras inusitadas. Quando o faz, diz no geral coisas que absolutamente não esperamos. Se você é como eu, aprendeu que a mensagem de Deus chega em ambien­ tes calmos e pacíficos. Seu tom será amável e baixo, como o sussurro que o menino Samuel ouviu em seu leito no templo, e o profeta Elias ouviu na entrada da caverna de Horebe. Aprendemos também que a sua mensagem será previsível. Mas isso não é verdade. Há ocasiões em que ele chama nossa atenção num contexto caótico. Depois de um esbarrão com a morte, compreendemos que ele nos protegeu do perigo. Essas mensagens nos causam um arrepio na espinha.

D

Ann Chapman, empregada da loja Michael de Artes e Ofícios, teve um encontro assim. Às 5:20 da tarde, numa quarta-feira, o pri­ meiro tiro dentre vários que acabaram matando cinco pessoas em sua cidade, abriu um buraco do tamanho de uma moeda na vitrine, esti­ lhaçou uma luminária, furou dois cartazes e atingiu uma estante de metal com fileiras de livros de bolso. De modo surpreendente, o tiro deteve-se um pouco antes de acertar Ann, próximo de um livro

310 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

chamado Inspiration for the Heart [Inspiração para o Coração], perto do A Oração de Jabez, de Bruce Wilkinson. A orelha da capa desse livro diz o seguinte: “A simples oração diária saída do coração pode inspirar você a buscar o favor, o poder e a proteção constantes de Deus.” A mensagem de Deus naquela tarde para Ann Chapman foi tudo menos calma, em voz baixa e pacífica. No caso dela, veio junto com a trajetória fatal de uma bala desfechada pelo rifle poderoso de um franco-atirador.

Deus nem sempre entra na ponta dos pés em nosso mundo, tornando sua presença conhecida de maneira gentil. O profeta Naum nos conta que às vezes isso acontece “na tormenta e na tempestade” (Na 1:3). Q uando ele deu a Lei a Moisés no monte Sinai, aquela montanha rochosa estava cercada de nuvens espessas, pesadas, cheia dos estrondos de trovões e relâmpagos (Êx 19:16-19). Elias teste­ munhou cenas semelhantes, assim como Ezequiel, quando o Senhor tornou conhecida a sua presença.

O poder e a majestade de Deus são evidenciados dramatica­ mente n a s forças da natureza. “Redemoinho” e “tormenta” são geralmente expressões do seu juízo (...) Apesar de toda a sua grandiosidade, entretanto, essas forças poderosas ficam a p e q u e n a d a s na presença do Senhor, a quem os mais altos céus não podem conter; a tempestade não é mais do que um distúrbio enquanto ele passa, e as nuvens escuras são apenas poeira levantada pelos seus pés.1

Martinho Lutero, enquanto procurava formar-se em Direito na sua juventude etfi Erfurt, na Alemanha, foi apanhado em uma tempesta­ de com trovões e relâmpagos que o amedrontou e humilhou a ponto de acreditar que Deus estava dizendo que não devia continuar seus estudos de advocacia. Convenceu-se de que essa era a maneira de Deus dizer que ele devia entrar no monastério e servi-lo pelo resto da vida. Lutero declarou mais tarde que sentiu a presença divina naque­ la tempestade assustadora. Contra os desejos do pai, ele desistiu de

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 311 estudar Direito e tornou-se monge. Lutero acreditava firmemente que Deus falara ao seu coração em meio à horrenda tormenta. Os teólogos referem-se a esse tipo de manifestação visível da divindade como teofania.

Podemos ser muito insensíveis ou estar excessivamente preo­ cupados para ouvir o sussurro de Deus, mas as mensagens dele que mexem com a alma nunca são esquecidas. Muitos de nós poderiam testemunhar que nossas vidas começaram a transformar-se por causa de alguma censura vinda mediante uma teofania bastante significativa. Para alguns, trata-se literalmente de uma experiência de “redemoinho”.

Foi assim com Jó. Ao quebrar o silêncio, Deus surgiu “do meio de um redemoinho” (Jó 38:1). Todos nós que esperamos e sofremos tanto tempo com Jó para ouvir a voz de Deus, dizemos agora com um suspiro: “Finalmente!”

A PRIMEIRA MENSAGEM DO SENHOR

Uma vez quebrado o silêncio, Deus faz dois “discursos”. Sua primeira mensagem está registrada em jó 38:1-40:5. A segunda começa em Jó 40:6. Acho interessante e surpreendente o que Deus não faz. Ele não dá quaisquer respostas às perguntas de Jó. Ele não se desculpa por ter ficado tanto tempo mudo. Não oferece qualquer informação sobre o trato entre ele e Satanás, quando tudo começou. Além do mais, Deus não reconhece que Jó passou por grandes dificuldades. Quando finalmente fala, começa com uma reprovação.

A essa altura, Jó se mostra um tanto independente e arrogante. Você também pode ter essa atitude quando defende a si próprio por muito tempo. Quando teve de suportar os ataques de outros, você tende a ficar um tanto convencido.

Deus vai comunicar várias coisas, mas a primeira é fazer com que o coração de Jó esteja reto diante dele. Deus sempre sabe como fazer isso. Se você tomar tempo para contá-las, verá que Deus faz 77 per­ guntas nesses dois discursos. Sua primeira linha é a primeira pergunta que Jó deve considerar.

312 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Quem é este que escurece os meus desígnios com palavras sem conhecimento?

Jó 38:2

A Bíblia Viva interpreta isso deste modo: “Quem é você para negar a sabedoria dos meus planos com a sua completa ignorância?” Isso não pretende ser cruel, apenas deter Jó. Ele precisa de um curso de reciclagem sobre quem está no controle. Precisa compreender que os caminhos e feitos de Deus estão além da sua capacidade de compre­ ensão. Não esqueça de que não há uma porção de gente ali; só Jó e Deus. Portanto, a pergunta “quem” tem uma resposta simples!

Cinge, pois, os lombos como homem, pois eu te perguntarei, e tu me farás saber.

Jó 38:3

O pronome singular esclarece que Deus não está falando aos amigos, mas direta e unicamente a Jó.

O primeiro grupo de perguntas gira em volta da interrogação: “Você pode explicar ou controlar a minha criação?” É como se o Senhor estivesse dizendo: “Apenas responda à pergunta, Jó.” Isto termina com uma confissão de humildade feita por Jó no terceiro, quarto e quinto versículos de Jó 40.

Deus não terminou.

O segundo grupo de perguntas indaga: “Você pode mudar ou dominar a minha criação?” Esse grupo termina com uma confissão de arrependimento por parte de Jó. Vamos examiná-lo no próximo capítulo. Por enquanto, vamos pensar sobre a primeira lista de per­ guntas de Deus que Jó responde com absoluta humildade. Deus começa o seu interrogatório com a criação.

Onde estavas tu, quando eu lançava os fundamentos da terra?

Jó 38:4a

UMA REPROVAÇÃO -SEVERA DO TODO-PODEROSO 313

É claro que ele não se achava presente. Não havia ninguém.

Dize-mo, se tens entendimento.

Jó 38:4b

Ele também não sabe responder a essa pergunta. Ninguém sabe. Depois de obter a atenção de Jó, Deus continua.

Quem lhe pôs as medidas, se é que o sabes? Ou quem es­ tendeu sobre ela o cordel? Sobre que estão fundadas as suas bases ou quem lhe assentou a pedra angular.

Jó 38:5, 6

Como tudo isso foi fixado no espaço? Nenhuma explicação — só uma possibilidade: Deus.

Quando as estrelas da alva, juntas, alegremente cantavam, e rejubilavam todos os filhos de Deus?

Jó 38:7

Esta deve ser uma referência às primeiras estrelas. As estrelas da alva “cantavam juntas”. É possível que, ao serem criadas, as estrelas na verdade cantassem. Ou, quem sabe, trata-se de poesia e não deve ser interpretada literalmente. Deus pode também estar dizendo a Jó que todos os espaços exteriores estavam em harmonia entre si. Por não termos estado lá, não sabemos. Existe também a possibilidade de que ele tivesse os anjos em mente. Talvez fossem eles as “estrelas” que cantavam na criação. Essas criaturas angélicas testemunhavam tudo isso boquiabertas, observando as obras da criação de Deus, talvez com um ar incrédulo no rosto.

Deus passa então rapidamente para o tema do mar.

314 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Ou quem encerrou o mar com portas, quando irrompeu da madre; quando eu lhe pus as nuvens por vestidura e a escu­ ridão por fraldas? Quando eu lhe tracei limites, e lhe pus ferrolhos e portas, e disse: até aqui virás e não mais adiante, e aqui se quebrará o orgulho das tuas ondas?

Jó 38:8-11

“Você saberia fazer isso, Jó? Estava lá quando aconteceu?” A essa altura, é certo que Jó começou a entender o fio da meada.

Acaso, desde que começaram os teus dias, deste ordem à madrugada ou fizeste a alva saber o seu lugar?

Jó 38:12

Com essas palavras, tornando Jó reverente, Deus fala em seguida do Sol - o grande luzeiro do dia.

Acaso, entraste nos mananciais do mar ou percorreste o mais profundo do abismo? Porventura, te foram reveladas as por­ tas da morte ou viste essas portas da região tenebrosa? Tens idéia nítida da largura da terra? Dize-mo, se o sabes. Onde está o caminho para a morada da luz? E, quanto às trevas, onde é o seu lugar?

Jó 38:16-19

Muitas perguntas, não é? Você sabe o que acontece quando lhe fazem perguntas desse tipo? Você se cala. Já está sentado quieto, sabendo que tudo aquilo ultrapassa a sua compreensão. Jó diz no final que coloca a mão na boca, para não ser tentado a responder. Você tam­ bém está totalmente por fora.

É como participar de uma aula onde o assunto tratado é pratica­ mente novo para você, e o professor está fazendo perguntas a alguns alunos. Você se esconde por trás da cabeça do colega da frente,

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 315 esperando que ele não o veja. Você não sabe as respostas e percebe que os outros sabem que você não sabe, o que o faz ficar duplamente silencioso.

As indagações continuam - forçando Jó a compreender quantas coisas estão além da sua compreensão. Deus se volta em seguida para as vastas dimensões da sua obra criativa. Leia lentamente e tente ima­ ginar a preleção de Deus:

Acaso, entraste nos mananciais do mar ou percorreste o mais profundo do abismo? Porventura, te foram reveladas as por­ tas da morte ou viste essas portas da região tenebrosa? Tens idéia nítida da largura da terra? Dize-mo, se o sabes. Onde está o caminho para a morada da luz? E, quanto às trevas, onde é o seu lugar, para que as conduzas aos seus limites e discirnas as veredas para a sua casa?

Jó 38:16-20

Descobri em minha pesquisa que o ponto mais profundo de todos os oceanos foi estabelecido como sendo 10.848 m. Pode haver lu­ gares mais fundos, mas essa foi a maior profundidade determinada até hoje.

E a vastidão do espaço sideral? Você deve estar lembrado que uma de nossas sondas espaciais levou 12 anos para percorrer 7,040 bilhões de quilómetros, passando finalmente a 4.800 quilómetros da massa espessa de nuvens de Netuno. Isto representa uma viagem espacial apenas em nossa galáxia imediata. Fui informado de que há mais centenas de milhares delas, talvez milhões. E quem sabe se a nossa não é a menor de todas as que estão no espaço? Isso é algo espantoso!

Estou tentando imaginar Jó. A essa altura ele está pasmo. Penso até que todos aqueles tumores inflamados não parecem mais tão im­ portantes. E todas aquelas respostas dogmáticas que dera a Elifaz, Bildade e Zofar também não parecem ter mais tanto significado.

316 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Enquanto fala do espaço, o Senhor faz cada vez mais perguntas ao seu servo.

Ou poderás tu atar as cadeias do Sete-estrelo ou soltar os laços do Orion? Ou fazer aparecer os signos do Zodíaco ou guiar a Ursa com seus filhos? Sabes tu as ordenanças dos céus, podes estabelecer a sua influência sobre a terra?

Jó 38:31-33

Isso acontece conosco quando visitamos um desses telescópios gi­ gantescos onde podemos apreciar o céu, vendo setores além da­ queles com os quais estamos familiarizados. Damos um passo para trás, piscamos, sacudimos a cabeça, pomos as mãos nos bolsos e silenciamos. Não nos virámos e começamos a dar instruções à pes­ soa que opera o telescópio. A enormidade de tudo aquilo faz com que nos sintamos incrivelmente insignificantes; somos partículas microscópicas quando comparados à vastidão telescópica do espaço exterior. Ele é especialmente enorme porque Aquele que poderia responder a cada pergunta está falando com Jó. Ele não só o criou, como também pôs tudo em movimento e mantém tudo funcio­ nando com a exatidão de um relógio.

Como se isso não bastasse, Deus introduz o reino animal. Ele especifica criaturas de quatro patas e aladas. Vamos percorrer essas descrições como se estivéssemos visitando o zoológico local. Tente imaginar Jó enquanto ele ouve cada pergunta!

Caçarás, porventura, a presa para a leoa? Ou saciarás a fome dos leõezinhos, quando se agacham nos covis e estão à espreita nas covas? Quem prepara aos corvos o seu alimento, quando os seus pintainhos gritam a Deus e andam vagueando, por não terem que comer? Sabes tu o tempo em que as cabras monteses têm os filhos ou cuidaste das corças quando dão suas crias? Podes contar os meses que cumprem? Ou sabes o tempo do seu parto?

Jó 38:39-39:2

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 317

Quem despediu livre o jumento selvagem, e quem soltou as prisões ao asno veloz, ao qual dei o ermo por casa e a terra salgada por moradas?

Jó 39:5, 6

Acaso, quer o boi selvagem servir-te? Ou passará ele a noite junto da tua manjedoura? Porventura, podes prendê-lo ao sulco com cordas? Ou gradará ele os vales após ti?

Jó 39:9, 10

O avestruz bate alegre as asas; acaso, porém, tem asas e pe­ nas de bondade? Ele deixa os seus ovos na terra, e os aquen­ ta no pó, e se esquece de que algum pé os pode esmagar ou de que podem pisá-los os animais do campo.

Jó 39:13-15

Ou dás tu força ao cavalo ou revestirás o seu pescoço de crinas? Acaso, o fazes pular como ao gafanhoto? Terrível é o fogoso respirar das suas ventas. Escarva no vale, folga na sua força e sai ao encontro dos armados. Ri-se do temor e não se espanta; e não torna atrás por causa da espada.

Jó 39:19-22

Ou é pela tua inteligência que voa o falcão, estendendo as asas para o Sul? Ou é pelo teu mandado que se remonta a águia e faz alto o seu ninho? Habita no penhasco onde faz a sua morada, sobre o cimo do penhasco, em lugar seguro. Dali, descobre a presa; seus olhos a avistam de longe. Seus filhos chupam sangue; onde há mortos, ela aí está.

Jó 39:26-30

Por quê? Posso ouvir você fazendo esta pergunta. (Essa foi a minha primeira reação ao ouvir tais coisas.) “Por quê?”, perguntei a mim mesmo. “O que uma visita ao espaço exterior ou uma viagem ao zoológico tem a ver com a idéia de consolar Jó, apesar daquelas feri­ das em toda a sua pele?” Tudo o que Deus precisava fazer era um

318 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

gesto e remover todas na mesma hora. Elas teriam desaparecido de uma vez e para sempre. Mas ele não fez isso.

O escritor David Atkinson nos ajuda a compreender a questão:

Precisamos perguntar por que Deus gasta tanto tempo fa­ lando dos céus, das estrelas e dos animais. Com certeza, existe um tópico mais apropriado de conversa para alguém que durante semanas havia sofrido de uma sensação espan­ tosa de isolamento?

É claro que só quando um indivíduo deprimido tem a se­ gurança e a certeza da presença de outra pessoa é que a conversa pode acontecer. Agora que Jó sabe que não está só, é apropriado que Deus fale — talvez para desviá-lo da sua desgraça, com certeza para dar-lhe novas perspectivas sobre a sua situação (...)

É como se o Senhor Deus estivesse dando um passeio pela sua criação — um passeio pelo Jardim, talvez, depois que a tempestade se acalma - e está convidando Jó para acompanhá-lo: “Está vendo isto? Reconhece aquilo?”

Quero surpreendê-lo, diz Deus, com a complexidade de tudo! Desde que os fundamentos da terra foram lançados (38:4), quando as estrelas da alva cantavam juntas e todos os filhos de Deus gritavam alegremente nos céus (38:7), essa celebração jubilosa do Criador tem sido cantada. Considere o mar, limitado em seu poder caótico (38:8-11), os céus, o abismo, a luz e as trevas (38:12-21)(...)

Pense também nos animais! Você pode caçar a presa para a leoa (38:39)? Quem cuida dos corvos (38:41)? O que dizer do milagre do nascimento — das cabras montesas (39:1); dos jumentos selvagens (39:5); dos bois selvagens (39:9)?

Venha comigo, Jó; veja essas coisas, maravilhe-se com elas; aprecie todas. Você não pode controlá-las, mas elas estão sob o meu controle, diz Deus (...)

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 319

“Você jamais será o que deveria ser, até que saia de si mesmo e ande entre elas.” Talvez seja por isso que Deus leva Jó nessa visita - para mostrar a sua majestade em suas obras: para tirar Jó de si mesmo, distraí-lo da sua miséria, ampliar os seus horizontes, fazendo-o contemplar a majestade cria­ tiva e doadora de vida de Deus, e especialmente para capacitá-lo a ver a si mesmo em um novo cenário.

Jó, é aqui que seu coração vai encontrar descanso: ao desco­ brir seu lugar no panorama dos propósitos de Deus para o seu mundo. Você consegue levantar os olhos do monte de cinzas e ver a glória de Deus em sua criação?2

Ao que parece, o Senhor está ajudando Jó a ir além do seu mundo imediato de sofrimento - seus conselheiros sempre presentes com suas críticas e acusações incessantes. Ao agir assim, ele está preparan­ do o coração de Jó para uma compreensão completamente nova dos seus caminhos, para uma disposição de perdoar aqueles homens por suas palavras rudes, e para a capacidade de recuperar-se e continuar sem amargura ou outras cicatrizes ocultas.

O monte de cinzas pode ser um lugar apropriado para sentar-se quando estamos de luto, mas não para permane­ cer, se quisermos nos sentir melhor. Algumas vezes somos mais úteis às pessoas aflitas - ajudando-as a se aproxima­ rem de Deus, saindo das profundezas da depressão —, não quando ensinamos doutrina, pregamos nossos melhores sermões, ou mostramos os erros dos seus caminhos, mas caminhando com elas pelo jardim, levando-as a ver uma cachoeira ou um pôr-do-sol, ajudando-as a recuperar algo que apreciem no mundo. Tais passos nem sempre são pra­ ticáveis, é claro. Mas na medida em que podemos ajudar as pessoas deprimidas a verem a si mesmas sob um novo ângulo, a recuperar um lugar de segurança e a sensação de pertencer ao rico panorama da criação de Deus, estaremos ajudando esses indivíduos.3

320 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

A RESPOSTA HUMILDE DE JÓ

Não há dúvida de que Jó entendeu a mensagem:

Então, Jó respondeu ao S enhor e disse: Sou indigno; que te responderia eu? Ponho a mão na minha boca. Uma vez falei e não replicarei, aliás, duas vezes, porém não prosseguirei.

Jó 40:3-5

Se você tomar tempo para analisar essas palavras, verá que Jó dá três respostas. A primeira é de humildade. A segunda é de alívio. E a terceira é uma resposta de entrega. Isso era tudo que Deus desejava ouvir. Que mudança importante também para Jó! Sem compreen­ der, ele havia se tornado um apologista independente, determinado, autoconfiante, defendendo a si mesmo. Sem admitir isso, começara a parecer que tinha os braços ao redor da providência de Deus.

Sua primeira resposta está no versículo 4: “Sou indigno”. Muitos dos que aprenderam os pontos altos da Psicologia irão rejeitar esta resposta. Dirão que devemos ser encorajados a compreender a nossa importância, o nosso valor para Deus, e que ocuparemos um lugar significativo neste mundo. Eles aconselhariam: “Não pense ou diga: ‘Sou insignificante’”. Antes de sermos tentados a agir assim, tome nota de que Deus não reprova Jó por dizer que é insignificante ou indigno.

O termo hebraico para insignificante significa “peso leve”, em contraste com o termo traduzido “pesado”.

“Insignificante” se traduz por “peso leve” em oposição a “pe­ sado/digno/respeitável”. Com uma pergunta retórica, Jó replicou que não podia responder a qualquer das indagações. Num gesto de submissão e entrega, ele cobriu a boca (...)

Jó falou mais que Elifaz, Bildade e Zofar; mas na presença de Deus emudeceu, isto é, ficou mudo e confuso.4

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 321

Nós diríamos: “Sou um peso leve”. É verdade. Esse é um termo apropriado para Jó usar depois de lhe terem perguntado tantas coisas que não sabia responder e de ver tantas que não compreendia. Num rasgo de humildade, o homem admite: “Sou insignificante”.

Sua segunda declaração é: “O que posso replicar?” Vejo isso como uma expressão de alívio. Deus não queria respostas. Ele sabia as respostas. Ele conhece todas elas. Queria, porém, que Jó reconheces­ se: “Não sei nenhuma das respostas. E se não sei sobre essas coisas, objetivas como são, como poderia compreender plenamente os mistérios profundos que cercam o meu mundo?” Ao admitir isso, o alívio substituiu a resistência perturbadora.

Meu ponto aqui - e isto é terrivelmente importante - é o seguinte: quando somos quebrantados e chegamos ao fim das nossas forças, isso não tem como propósito obter mais respostas para dar a outros. A intenção é ajudar-nos a reconhecer que o Senhor é Deus e seus planos e razões são mais profundos, mais elevados e mais amplos do que podemos compreender. Portanto, ficamos aliviados por não termos necessidade de dar respostas ou defendê-las.

A terceira resposta de Jó é uma declaração de entrega. “Ponho a mão na minha boca”, conclui o versículo 4. Não ouso dizer mais nada. Já disse o suficiente — demais na verdade.

PASSANDO DOS DIAS DE JÓ PARA OS NOSSOS

A resposta de Jó me faz pensar no que isto significa para o nosso mundo do século XXI. Que mensagens necessárias ela oferece para os nossos tempos? Descubro pelo menos três nas entrelinhas da resposta de Jó.

Primeira: Se os caminhos de Deus são mais altos que os meus, então, o que quer que ele permita, eu me curvo diante dele em submissão. O resultado desta atitude é a verdadeira humildade. A submissão à von­ tade do Pai é a marca da genuína humildade. Todos nós poderíamos usar uma boa dose dela. Como é raro encontrar um espírito humilde hoje, especialmente entre os competentes, os muito inteligentes, os bem-sucedidos!

322 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Esta é a segunda: Se Deus tem pleno controle, então sigo em obediência, qualquer que seja a maneira como dirija os meus passos. Que alívio isto traz! Finalmente, posso relaxar, uma vez que não estou no controle.

Falei recentemente numa conferência de pastores no Instituto Bíblico Moody, em Chicago. A lembrança mais viva dessa conferên­ cia foi uma grande placa colocada sobre a plataforma, para todos os participantes lerem sempre que nos reuníamos. Em letras grandes e nítidas, estava escrito:

O auditório se achava lotado de pastores — mil e quinhentos ao todo! E cada um de nós está geralmente no controle (pelo menos é o que pensamos). Entretanto, o fato de comparecer àquela conferência e de ser lembrado de relaxar — não estamos no controle — foi um alívio reconfortante para todos os presentes.

Esta foi a placa que Deus colocou na frente de Jó. “Você não está no controle de nada, Jó; a responsabilidade é minha. Você é meu servo - eu sou seu Senhor. Sei o que estou fazendo.” Uma vez que Deus sabe o que está fazendo, como quer que ele dirija os meus passos, eu simplesmente sigo. Que alívio reconfortante isso traz!

Vamos agora à terceira: Se Deus tem as respostas que me faltam, então, sempre que ele falar, ouço em silêncio. No processo de escutar, aprendo. Aprender exige que nos aquietemos, esperando paciente­ mente que Deus aja, ficando prontos para ouvir enquanto ele nos instrui em seus caminhos. Você e eu não somos humildes, submissos e calmos por natureza. Preferimos muito mais controlar as coisas e dar ordens. Com certeza não gostamos de esperar. Queremos o que queremos e quando queremos.

Timmy, de quatro anos, estava preso em sua cadeira no banco de trás com o irmão e a irmã mais velhos, enquanto a família fazia uma longa viagem. A mais ou menos cada dois quilómetros, ele perguntava:

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 323

“Estamos chegando, papai? Quase estamos lá? Mamãe, está perto?” Exasperada, a mãe se voltou e disse aTimmy: “Não, filho! Não estamos quase chegando. Vai demorar bastante para chegarmos!” Algum tempo se passou em silêncio. Mas Timmy não conseguia mais ficar quieto. Ele mudou então a pergunta: “Mamãe, quando chegarmos lá, eu vou ter ainda quatro anos?”

“Senhor, apresse-se! Vamos logo!” Preferimos correr em vez de esperar. Receber perdão do que permissão. Resistir em vez de obede­ cer. Falar em vez de escutar. Controlar em vez de nos submeter.

Em vista de essas coisas serem verdadeiras, precisamos lembrar desta oração puritana:

Quando queres guiar-me, controlo a mim mesmo,

Quando queres ser soberano, governo a mim mesmo.

Quando queres cuidar de mim, sou auto-suficiente,

Quando deveria depender da tua provisão, abasteço a mim mesmo,

Quando deveria submeter-me à tua providência, sigo a minha vontade,

Quando deveria estudar, amar, honrar, confiar em ti, sirvo a mim mesmo;

Negligencio e corrijo tuas leis conforme as minhas conve­ niências,

Em lugar da tua quero a aprovação do homem, e sou por natureza um idólatra.

Senhor, meu principal objetivo é voltar meu coração novamente para ti.

Convence-me de que não posso ser meu próprio deus, ou fazer feliz a mim mesmo, nem meu próprio Cristo para restaurar a minha alegria, nem meu próprio Espírito para ensinar, guiar, controlar a mim mesmo.

324 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Ajuda-me a ver que a graça faz isto mediante a aflição providencial, pois quando o meu deus é o meu crédito, tu me humilhas; quando as riquezas são o meu ídolo, tu as dispersas; quando o prazer é o meu tudo, tu o transfor­ mas em amargura.

Remove o meu olhar cobiçoso, ouvido curioso, apetite voraz, coração lascivo;

Mostra-me que nenhuma dessas coisas pode curar uma consciência ferida, ou suportar uma estrutura arruinada, ou apoiar um espírito que se afasta.

Leva-me então à cruz e deixa-me nela.5

Não posso concluir este capítulo sem acrescentar certas verdades cruciais. Vai ser preciso esforço consciente da nossa parte para mudar. Você pode ter se tornado de difícil convivência. Se isto for verdade, os que estão mais próximos não sabem mais como lhe mostrar a realida­ de. Minha esperança é que a leitura deste capítulo fará você perceber o que precisa ser mudado. E necessário também que o avise: se levar as mudanças a sério e vier a pô-las em prática, isso irá certamente surpreender as pessoas que têm tentado ganhar sua atenção.

Em seu excelente volume, True North, o pastor Gary Inrig cita Tom Anderson, cuja história descreve a razão da minha advertência.

Fiz uma promessa a mim mesmo a caminho do chalé da praia. Durante duas semanas eu tentaria ser um marido e pai amoroso, incondicionalmente. A idéia surgiu quando ouvi um comentarista no rádio do carro. Ele estava citando uma passagem bíblica sobre os maridos serem atenciosos com as esposas. A seguir, ele continuou: “O amor é um ato da vontade. A pessoa pode decidir amar.” Tive de admitir para mim mesmo que tinha sido um marido egoísta — que nosso amor havia empalidecido por causa da minha insensi­ bilidade. De maneiras triviais: chegando a repreender Evelyn por sua lentidão; insistindo no canal de TV que eu queria

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO 325 assistir; jogando fora os jornais da véspera antes que ela tivesse tido tempo de lê-los. Bem, por duas semanas tudo isso fica­ ria diferente.

E mudou mesmo. A partir do momento em que beijei Evelyn na porta e disse: “Essa malha amarela nova está linda em você”.

“Oh! Tom, você notou!”, respondeu ela, surpresa e satisfei­ ta. Talvez até um pouco chocada.

Depois da viagem demorada, eu queria sentar-me e ler. Evelyn sugeriu um passeio pela praia. Comecei a recusar, mas depois pensei: “Evelyn ficou aqui sozinha com as crianças a semana inteira e agora quer ficar a sós comigo”. Andamos pela praia enquanto nossos filhos soltavam pipas.

E assim foi. Duas semanas sem telefonar para a firma de investimentos de que sou diretor; uma visita ao museu de conchas, embora eu geralmente odeie museus; segurando a língua enquanto Evelyn demorava em se vestir e nos fez chegar atrasados para um jantar. As férias inteiras foram um período descontraído e feliz. Fiz uma nova promessa de con­ tinuar lembrando de escolher o amor.

Só houve uma coisa errada com a minha experiência. Na última noite no chalé, quando nos preparávamos para deitar, Evelyn olhou para mim com uma expressão triste.

“O que foi?”, perguntei.

“Tom”, ela respondeu, com a voz cheia de aflição, “você sabe alguma coisa que eu não sei?”

“O que está querendo dizer?”

“Aquele exame que fiz há várias semanas... nosso médico... ele falou alguma coisa a você a meu respeito? Tom, você tem sido tão bom para mim... eu estou morrendo?”

Levei um minuto para digerir tudo isso. Depois explodi numa risada.

326 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

“Não, querida”, eu disse, envolvendo-a em meus braços, “você não está morrendo; eu é que estou começando a viver!”6

Essa é a minha esperança para você, como resultado de buscar essas novas dimensões através dos olhos de Jó. O fato é que a sua atitude é uma escolha que você faz a cada dia. Se for necessário um passeio pelo zoológico ou lá fora entre as estrelas, faça isso. O que quer que o convença de como você é realmente um “peso pena” e até que ponto o seu mundo ainda gira à sua volta. Deus está fazendo de tudo para chamar sua atenção. Não está na hora de ouvir e mudar? Tudo come­ ça com algumas escolhas significativas.

Que seja hoje o ponto de partida. Quem sabe você vai descobrir que está apenas começando a viver.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando Deus finalmente fala, e não como esperávamos, você está disposto a ouvir uma reprovação que reposiciona o seu coração?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante da grandeza do Todo-Poderoso revelada nas suas perguntas a Jó, como você tem encarado a pequenez do seu próprio entendimento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que muda na sua dor quando você reconhece que Deus não lhe deve explicações, mas se revela como digno de confiança?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 25;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pleno Arrependimento pelos Motivos Certos$t$, 25,
$conteudo$difícil cultivar um coração humilde numa cultura litigiosa. Em I j outras palavras, raramente se encontra um espírito arrependido numa sociedade competitiva. Quase ninguém diz: “Estou errado. Sinto muito; por favor, me perdoe.” Pelo contrário, com que frequên­ cia ouvimos: “Vou processar você! Vou levá-lo ao tribunal!”

Dou a seguir um exemplo clássico de como o nosso mundo pensa. Não se trata apenas de uma história real, como também de uma história ganhadora do primeiro prémio da Competição dos Advogados Criminalistas no ano de 2002.

Um advogado de Charlotte, Carolina do Norte, comprou uma caixa de charutos muito raros e de alto preço, colo­ cando-a depois no seguro contra incêndio, entre outras coisas. Depois de um mês, tendo fumado todos os charutos e sem haver pagado sequer a primeira parcela da apólice, o advogado abriu um processo contra a seguradora.

Em sua acusação, ele afirmou que os charutos foram perdi­ dos “em uma série de pequenos incêndios”. A seguradora

328 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

recusou-se a pagar, citando a razão óbvia: o fato de o homem haver consumido os charutos da maneira normal era óbvio.

O advogado abriu processo e ganhou a causa!

Ao dar a sentença, o juiz concordou com a seguradora que a reivindicação era frívola. O juiz afirmou, mesmo assim, que o advogado possuía uma apólice da empresa, na qual ela garantira que os charutos podiam ser cobertos por seguro e também declarara que eles seriam segurados contra incêndio, sem definir o que era considerado como incêndio inaceitável, e foi obrigada a pagar o seguro.

Em lugar de se sujeitar a um processo demorado e caro, a seguradora aceitou a sentença e pagou US$ 15.000 ao advogado pela perda dos charutos raros desaparecidos nos “incêndios”.

Agora a melhor parte... Depois de o advogado receber o cheque, a seguradora conseguiu que ele fosse preso mediante 24 acusações de “incêndio culposo”! Por meio de sua pró­ pria reivindicação e de seu próprio testemunho do processo anterior, que foram usados contra ele, o advogado foi conde­ nado por queimar intencionalmente a propriedade segurada e sentenciado a 24 meses de cadeia e pagamento de uma multa de US$ 24.000.1

Tente ensinar a seus filhos a importância de andar humildemente com Deus mediante histórias como esta, divulgada pela mídia. É de admirar que as palavras “eu me arrependo” sejam raramente ouvidas nestes dias?

Esta talvez seja a razão de eu ter-me espantado quando avancei um pouco na história de Jó e li a sua confissão: “Por isso, me abomino e me arrependo no pó e na cinza” (Jó 42:6). A interpretação de Eugene Peterson oferece as expressões verbais que Jó tinha provavelmente em mente: “Sinto muito. Perdoe-me. Nunca mais farei isso, prometo! Nunca mais me apoiarei em boatos, ou migalhas de ouvir dizer.”

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 329

Se você verificar o contexto em que Jó fez essa declaração de arre­ pendimento a Deus, vai descobrir que nada ainda mudou para ele. Continua falido; sem família; coberto de tumores; e aqueles três, ou melhor, quatro críticos farisaicos permanecem de testa franzida nas proximidades, ainda convencidos de que ele está recebendo o que merece. Isso dá maior autenticidade à atitude de arrependimento de Jó. Teria sido muito mais fácil prostrar-se em completa submissão a Deus, se ele estivesse curado e aliviado, e se os quatro críticos tives­ sem sido colocados em seu devido lugar. Mas, sem nada disso, Jó se curva diante do Senhor e suspira: “... me abomino (...) me arrependo”. Não há dúvidas: isso representa pleno arrependimento por todos os motivos certos.

John Hartley aponta a essência da resposta humilde de Jó:

Jó se rebaixa e se retrata, confessando não ser melhor do que o pó e as cinzas sobre as quais está sentado. Jó chegou a uma real avaliação da sua pessoa diante do Deus santo (...) Jó renuncia a todo falso orgulho e admite que Deus foi justo ao permitir que ele, o xeiqúe mais nobre, fosse tão aviltado a ponto de ter de sentar-se fora da cidade num monte de cinzas. O termo retratar (niham) significa mudar de um curso planejado de ação e seguir outro rumo. Implica na decisão firme de mudar de direçao, mas não em uma atitude de remorso. Trata-se de ação afirmativa baseada na convic­ ção. Ao retratar-se, Jó entrega a Deus seu último vestígio de orgulho, ou seja, ele retira sua declaração de inocência. A partir daquele momento, ele irá determinar sua valorização de si próprio com base na sua relação com Javé e não em seu comportamento moral ou em sua inocência.2

Estamos apreciando Jó na personificação de um coração humilde e contrito. Ao falar disso, considere as palavras de Davi depois do sofrimento que passou por causa de seu adultério com Bate-Seba. Na tristeza que se seguiu ao arrependimento, Davi escreveu uma canção, admitindo o erro de seus atos, que foi inserida na Bíblia.

330 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Nós a conhecemos hoje como o Salmo 51. Ele contem os senti­ mentos de Davi relativos ao seu arrependimento.

Veja o início:

Compadece-te de mim, ó Deus, segundo a tua benignida­ de; e, segundo a multidão das tuas misericórdias, apaga as minhas transgressões. Lava-me completamente da minha iniquidade e purifica-me do meu pecado. Pois eu conheço as minhas transgressões, e o meu pecado está sempre diante de mim. Pequei contra ti, contra ti somente, e fiz o que é mal perante os teus olhos, de maneira que serás tido por justo no teu falar e puro no teu julgar.

Salmos 51:1-4

Davi não esconde as suas transgressões, não culpa outra pessoa. De seu coração arrependido flui apenas uma franca confissão. Ele pede ao Senhor:

Cria em mim, ó Deus, um coração puro e renova dentro de mim um espírito inabalável.

Salmos 51:10

Ele não espera que as pessoas ao seu redor o compreendam ou tenham compaixão dele. Aceita a plena responsabilidade de seus atos. Está acertando tudo com Deus, que é onde começa o arrependimento. As palavras de Davi oferecem alguns pensamentos úteis sobre o verdadeiro arrependimento:

Sacrifícios agradáveis a Deus são o espírito quebranta­ do; coração compungido e contrito, não o desprezarás, ó Deus.

Salmos 51:17

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 331

Observe com atenção. O arrependimento oferece então dois sacrifícios que agradam a Deus: um espírito quebrantado e um coração contrito. Reflita sobre essas palavras. Ao fazer isso, encontrei cinco características de um coração quebrantado e de um coração contrito.

Primeira, o coração contrito não guarda rancor. O coração contrito nunca diz: “Se não fosse pelo que ela...” Ou: “Se ele não tivesse feito...” Ou: “Por ter sido criado como fui...” Não. O espírito quebrantado não culpa ninguém.

Segunda, o coração contrito não faz exigências. Ele não obriga nin­ guém a nada. As reações de outros não nos interessam quando estamos verdadeiramente arrependidos.

Terceira, o coração contrito não tem expectativas. Não espero bom tratamento. Não espero que as pessoas compreendam ou que me perdoem. Isso pode acontecer com o tempo, mas não é algo que o coração contrito espera.

Quarta, o espírito quebrantado não oferece condições. Nada de “e se...”, “talvez...”, “mas...”, nem quaisquer negociações.

Quinta, o espírito quebrantado e o coração contrito não esperam favores. Não espero que você faça algo gracioso para mim como resul­ tado. Estou por minha própria conta diante de Deus. Ao arrepender-me, estou reconhecendo o erro de meus atos, minhas atitudes, minhas palavras, sem esperar qualquer aplauso ou sinal de com­ preensão por parte de outros.

Quando essas coisas se transformam em pleno arrependimento, não sobra espaço para a amargura.

O QUE LEVOU A TAL ARREPENDIMENTO?

Vamos rever agora o registro bíblico e verificar se podemos descobrir o que levou Jó a tamanho arrependimento de espírito. Descobrire­ mos que Deus conquistou toda a atenção de Jó. Era como se ele tivesse colocado suas duas mãos poderosas sobre os ombros de Jó e o fitasse nos olhos. Isto é seguido por dois exemplos inesquecíveis que comunicam uma mensagem que será lembrada para sempre por Jó.

332 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

As Mãos de Deus nos Ombros de Jó

Antes de examinar a base bíblica para a minha figura de palavras, quero mencionar algo que todos passamos como pais. O que estou prestes a escrever pode não ser “politicamente correto”, mas é a verdade. Os pais sabem que é verdade. Há ocasiões em que nada funciona melhor com nossos filhos pequenos do que colocar as mãos sobre os seus ombros e falar firmemente enquanto os olhamos nos olhos. Exas­ perados com as palavras, atitudes, ou más ações deles, pomos as mãos em seus ombros e falamos devagar e firmemente. Durante esses momentos nós os admoestamos a “endireitar-se”, ou a “ter cuidado com o que falam”, ou a “corrigir sua atitude negativa”! É surpreen­ dente como isso funciona!

De maneira similar, estou sugerindo aqui que o Senhor coloca as mãos nos ombros de Jó e lhe fala com firmeza. O que ele está dizendo ao seu servo? Algo assim: “Jó, ouça: Eu sou Deus. Você é meu servo. Eu sou a sua autoridade. Estou no controle. Sou o Oleiro, você é o barro, lembra-se? Estou moldando e dando forma a você — você vai ser moldado. E importante que compreenda, Jó, que você não está no mesmo nível que eu. Você é meu servo - não é Deus.” Deus está esclarecendo o seu servo!

Leia estas palavras do The Message e veja se você não concorda com elas:

Tenho mais algumas perguntas para você, e quero respostas certas.

Você pretende dizer o que estou fazendo de errado?

Está me chamando de pecador para que possa ser santo?

Tem um braço igual ao meu?

Pode trovejar com a voz como eu?

Vamos, mostre as suas habilidades!

Vamos ver do que é feito, o que pode fazer.

Derrame a sua indignação.

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 333

Mire os arrogantes e faça com que se ajoelhem.

Detenha os perversos - esmague-os!

Cave um sepulcro e atire-os nele — corpos sem rosto num túmulo anónimo.

Sairei alegremente do caminho e lhe entregarei o controle - você pode certamente salvar-se sem qualquer ajuda minha!

Jó 40:7-14, MSG (Tradução livre)

E evidente que Jó não pode fazer nada disso. Comparado ao Senhor Deus, ele jamais poderia “mostrar suas habilidades”; não teria sucesso em “esmagar” os perversos.

Vamos voltar por um momento à intervenção de Deus, concor­ da? Colocando tudo isto no cenário familiar de hoje, é como se Deus dissesse: “Quero esclarecer muito bem algo para você, filho. Como pai, sou eu que sustento este lar. Se você está no controle e ganha o sustento, então precisa ir aonde eu vou e trabalhar onde eu trabalho. Terá de enfrentar as pressões que enfrento e depois tomar as decisões que tomo. Você cuidará da hipoteca. Será o chefe desta família. Fará os planos e verificará se estão sendo cumpridos. Pergunto então: É capaz de fazer isso?”

O filho evidentemente terá de dizer: “Não, pai, não posso.”

“Tem razão, filho, você não é o pai. Isso significa que prestará contas a mim. Quero assegurar-lhe agora que vou amá-lo para sempre, mas você não governará esta casa. Esse papel é meu. Com­ preende isso?”

Jó está começando a compreender. As crianças às vezes precisam de exemplos para ajudar a transmissão da mensagem. Deus dá então a ele duas ilustrações inesquecíveis.

Deus Menciona Dois Animais Poderosos

Algo me faz pensar que Jó gostava realmente do mundo animal, sendo talvez um estudioso dedicado da natureza. Por saber disso, o Senhor

334 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

escolheu dois animais. Primeiro, o beemote (ARC), depois, o leviatã (ARC). Por que teria ele escolhido esses animais? Pare e pense. Esses dois animais estão no alto da cadeia alimentar. Nenhum deles é inti­ midado. Podem cuidar de si mesmos na floresta. Quase todos os outros animais os temem e, caso não o façam, pagam um enorme preço, geralmente com a vida.

O beemote representa o hipopótamo. Aprendi que esta enorme criatura é muito mais perigosa e mortal do que a maioria de nós imagina. Leviatã é um termo antigo para o crocodilo. Vamos examinálo em breve. Antes, porém, de considerar qualquer um deles, deve­ mos compreender que essas duas criaturas, embora intimidem a você e a mim, foram feitas por Deus. Por ser isso verdade, elas são sempre subservientes ao seu Criador. Possuem a natureza e os instintos que ele lhes concedeu. Fazem as coisas que ele as criou para fazer. Qual a mensagem implícita em tudo isto? “Se você não é capaz de lidar com essas criaturas, evidentemente não está no meu nível. E se tiver medo delas, então não se qualifica certamente como seu Criador.”

Vamos considerar primeiro o hipopótamo em mais detalhes:

Contempla agora o hipopótamo, que eu criei contigo, que come a erva como o boi.

Jó 40:15

Note a abertura: “Vocês dois são criaturas, mas muito diferentes. Ele anda sobre quatro patas; você caminha ereto sobre duas pernas. Ele come erva e vegetação como um boi; essa não é a sua dieta.” A seguir, ele menciona a força desse enorme animal.

Sua força está nos seus lombos, e o seu poder, nos músculos do seu ventre. Endurece a sua cauda como cedro; os tendões das suas coxas estão entretecidos. Os seus ossos são como tu­ bos de bronze, o seu arcabouço, como barras de ferro.

Jó 40:16-18

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 335

Esta última e brilhante declaração significa provavelmente que ele é o chefe ou o mais poderoso entre os animais. Outros animais, quando o vêem, se afastam. Deus o colocou no nível mais alto de autoridade no reino animal.

Ele é obra-prima dos feitos de Deus; quem o fez o proveu de espada. Em verdade, os montes lhe produzem pasto, onde todos os animais do campo folgam. Deita-se debaixo dos lotos, no esconderijo dos canaviais e da lama. Os lotos o cobrem com sua sombra; os salgueiros do ribeiro o cercam. Se um rio transborda, ele não se apressa; fica tranquilo ainda que o Jordão se levante até à sua boca. Acaso, pode alguém apanhá-lo quando ele está olhando? Ou lhe meter um laço pelo nariz?

Jó 40:19-24

Na antiguidade, para capturar ou matar uma dessas gigantescas cria­ turas, você tinha de furar ou tapar-lhe o nariz para que ele fosse obrigado a abrir a boca a fim de respirar.'No momento em que abria a boca, o caçador lançava uma espada artesanal em sua garganta, matando-o. Como isso era raro! Jó está ouvindo. Ele absorve a idéia: “Até uma única espécie de vida animal é suficiente para fazer você recuar, Jó. Você não é páreo para algo com tamanha força. Se eu, o Senhor, sou bastante poderoso para criar e dominar uma criatura tão forte e tre­ menda, mereço então a sua confiança, a sua submissão e a sua adoração.”

Enquanto Jó está começando a digerir tudo isso, o Senhor passa rapidamente para o leviatã.

Podes tu, com anzol, apanhar o crocodilo ou lhe travar a língua com uma corda?

Jó 41:1

Os que gostam de pescar geralmente escolhem o tamanho do an­ zol, dependendo do tamanho da boca do peixe que esperam fisgar.

336 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Anzol maior, peixe maior. Anzol menor, evidentemente, boca menor ou peixe menor.

De acordo com isso: “Você pode fisgar um leviatã (ou crocodilo) com um anzol para peixe?” Esta criatura é perigosa. Veja todos os “pode” e os “fará” que se seguem:

Podes meter-lhe no nariz uma vara de junco? Ou furar-lhe as bochechas com um gancho? Acaso, te fará muitas súpli­ cas? Ou te falará palavras brandas?

Jó 41:2, 3

Essas são literalmente figuras de linguagem absurdas. Esse animal falará coisas suaves e ternas? Algum crocodilo já levantou a cabeça e sussurrou palavrinhas macias e comentários amorosos? Há certa dose de humor aqui. Deus continua, exagerando as figuras:

Fará ele acordo contigo? Ou tomá-lo-ás por servo para sem­ pre? Brincarás com ele, como se fora um passarinho? Ou têlo-ás preso à correia para as tuas meninas?

Jó 41:4, 5

Que tal este pensamento cómico: colocar uma correia ao redor do pes­ coço dele, para suas filhas brincarem como se fosse um bichinho de estimação e levar para a escola com elas? Imagine um crocodilo-mascote de três metros de comprimento. A idéia nos faz rir. E absurda. Deus continua por algum tempo até que chega ao clímax do exemplo e diz:

Após si, deixa um sulco luminoso; o abismo parece ter-se encanecido.

Jó 41:32

O ponto que o Senhor quer destacar é claro: “Só eu controlo este animal no pântano, Jó!” Compreendo agora que, ao me referir ao

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 337 crocodilo como uma fera a ser temida, estou me opondo ao que você vê na televisão. Falo daquele australiano excêntrico — aquele com um cérebro minúsculo que nada com esses bichos e pensa que são as criaturas mais maravilhosas imagináveis. Você já deve ter visto os pro­ gramas dele — fico arrepiado! Tarde da noite ele sai em seu pequeno barco e pula no pântano, dizendo com um grande sorriso: “Vivi toda a minha vida para este momento.” E eu penso: “Você pode estar vivendo a sua última hora, seu maluco!”

Ele então escorrega para a água turva, nada até encontrar um bichão de três metros e diz algo assim: “Oh! veja essas garras. São lindas!” Quando eu olho para as garras, penso: “Elas vão te estraçalhar, seu ingénuo! Saia dessa água!”

O homem tem medo de comida mexicana. Ele nunca vai chegar à velhice!

Sabe o que torna as coisas piores? O sujeito casou-se com uma mulher que também gosta de nadar com essas feras! Ela as encontra, as agarra e as abraça. (Flá algo doentio em torno de toda essa história.) Aposto também que nenhum desses australia­ nos já leu Jó 41!

Deus torna claro que o crocodilo não serve como bicho de esti­ mação. Ele vive nos pântanos e é feroz. Tem sede de sangue. E brutal. E um assassino, mas também completamente submisso ao seu Criador.

O crocodilo não pode operar fora de parâmetros específicos, os limites que Deus estabeleceu para os répteis. Ele faz exatamente o que foi criado para fazer. Ele nada porque Deus fez dele um nadador excelente. Alimenta-se de carne porque Deus lhe deu esse tipo de apetite. Foi Deus quem fez tudo e é dono de tudo.

Em seu lembrete anterior, Deus põe tudo isto em perspectiva:

Quem primeiro me deu a mim, para que eu haja de retri­ buir-lhe? Pois o que está debaixo de todos os céus é meu.

Jó 41:11

338 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Há outra declaração direta: “Jó, você é meu. Você não passa de barro em minhas mãos. Estou fazendo uma grande obra, e você deve confiar em mim no mistério disto tudo.”

COM O JÓ RESPONDEU?

Jó escuta atentamente toda a estranha mensagem. Quando Deus chega ao fim do seu segundo discurso, ele sublinha o ponto principal:

Ele olha com desprezo tudo o que é alto; é rei sobre todos os animais orgulhosos.

Jó 41:34

Não sei se ele fez isso, mas Jó poderia muito bem ter levantado as mãos no ar e dito irrefletidamente: “Já ouvi o bastante. Entendi. Entendi, Senhor!”

Lembre-se de que Jó havia dito antes: “Ah! Se eu soubesse onde o poderia achar!... Exporia ante ele a minha causa” (Jó 23:3, 4). A implicação parece ter sido: “Mereço ser ouvido. Pela maneira como vivi e por causa de tudo que passei, o mínimo que ele pode fazer é apresentar-se diante de mim.” Pare com isso, Jó! Nós não damos o roteiro a Deus. Não é nossa prerrogativa ditar os parâmetros do plano de Deus ou os detalhes da sua resposta. Isso não cabe a nós, uma vez que tudo sob o céu é dele. Jó vê tudo isso agora e se arrepende.

Sua resposta submissa é magnífica!

Bem sei que tudo podes, e nenhum dos teus planos pode ser frustrado.

Jó 42:2

“Não importa se você estiver criando e fazendo crescer o hipopó­ tamo, ou dando ao crocodilo sua vontade forte e natureza feroz,

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 339 ou qualquer criatura da floresta e da selva, no ar ou sob a superfície dos mares, ou mesmo quer seja um homem ou uma mulher, nenhum dos teus propósitos pode ser frustrado.”

Isto me traz à lembrança as palavras do rei Nabucodonosor, depois de seus anos de insanidade, quando voltou finalmente ao bom senso.

Todos os moradores da terra são por ele reputados em nada; e, segundo a sua vontade, ele opera com o exército do céu e os moradores da terra; não há quem lhe possa deter a mão, nem lhe dizer: Que fazes?

Daniel 4:35

Essa é a verdadeira submissão. “Ó Deus, posso ser um rei nesta terra, mas reconheço agora a tua autoridade soberana. Nem sequer respiro sem que me dês fôlego. Não posso mover-me sem que dês aos meus músculos, ossos e nervos essa habilidade. Todo o céu e a terra são teus. Es o dono de tudo, e nada que é teu pode ser frustrado.” Jó tem essa atitude.

Em suprema humildade, ele continua:

Quem é aquele, como disseste, que sem conhecimento encobre o conselho? Na verdade, falei do que não enten­ dia; coisas maravilhosas demais para mim, coisas que eu não conhecia.

Jó 42:3

“Meu entendimento só vai até este ponto, e paro então aqui. Minha existência é tua, ó Deus. Cabe a ti desvendar o mistério, caminhar pelos meandros dos labirintos, lidar com o inescrutável, conhecer as razões por trás dos eventos inexplicáveis da minha vida.” Em com­ pleta rendição, ele recua e se inclina.

340 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Esta é a maneira de Jó reconhecer sua incapacidade de com­ preender o motivo, sem mais discussão, sem qualquer amargura. Não há qualquer pretensão de perguntar: “Como ousas fazer isto comigo?” O que vemos em Jó? Um espírito quebrantado e contrito.

Eu te conhecia só de ouvir, mas agora os meus olhos te vêem. Por isso, me abomino e me arrependo no pó e na cinza.

Jó 42:5, 6

Se houve alguma vez um traço de orgulho ou revolta em seu coração, isso acabou para sempre.

Cynthia e eu ficamos certa vez amigos de uma maravilhosa famí­ lia cristã — pai, mãe e três filhos. O filho mais velho tinha talento intelectual e musical. Além de ser um excelente aluno, era também um esplêndido violinista.

No começo da escola secundária, o pai teve dificuldades com o espírito de submissão do menino. Você sabe como faz com os filhos talentosos, abre espaço para eles, talvez dê um pouco de folga de­ mais. Um traço de orgulho acompanhava o espírito independente do rapazinho.

Depois de formar-se na escola secundária, o jovem escolheu uma escola de prestígio na Costa Oeste dos Estados Unidos — muito cara, mas uma excelente universidade, famosa pelo seu ensino. O pai médico pagou pelos estudos, e o menino começou o seu pri­ meiro ano bem longe de casa. Não demorou muito para que ele começasse a fazer amizade com uma turma da pesada. Não aban­ donou a música, tocava violino na orquestra da escola e ia bem academicamente. Mas, durante aquele período, tornou-se ainda mais mal-humorado e rebelde.

Depois de completar o primeiro ano, voltou para casa, levando com ele seu espírito independente e orgulhoso. Em breve, no decor­ rer das férias, a mãe, o pai e os dois irmãos mais novos perceberam que tinham sob o seu teto um verdadeiro valentão. Os conflitos se

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 341 intensificaram. Sua atitude arrogante, obstinada e egoísta destruiu a harmonia da família. Certa tarde o pai sentiu que já passava da conta.

Ele chamou o filho ao seu escritório, fechou a porta, apontou para a maior cadeira de couro e disse firmemente: “Sente-se.” A seguir, disse palavras que o jovem jamais esqueceria.

“Tudo que você tem é meu. Comprei cada peça de roupa que você usa e tudo que está em seu armário. Seu carro na garagem é meu; paguei por ele. O dinheiro em seu bolso saiu da minha conta. Quero que esvazie seus bolsos e sua carteira sobre a minha mesa. Deixe tudo que é meu nesta casa e quero que vá embora. Deixe as roupas, a chave do carro e, por falar nisso, também o seu violino. Fui eu que comprei esse instrumento. Deixe tudo que tem usado e que agora estou reivindicando. Pode ficar com as roupas em seu corpo e os sapatos nos pés, mas só isso. A porta está ali. Pode sair.

Quando você mudar a sua atitude e voltar para casa como um membro da família com espírito de colaboração e submisso, saiba que vamos aceitá-lo e dar-lhe as boas-vindas como parte de nossa família, mas não antes disso! Amo você e sempre amarei, mas você não é o menino que criamos, e não vou suportar isso nem mais um m inuto.”

O pai contou-me mais tarde que o garoto ficou de pé, colocou todo o dinheiro sobre a mesa, andou até a porta e deixou tudo sem dizer uma única palavra. Andou orgulhosamente até a calçada, virou à esquerda e caminhou três quarteirões rua abaixo. O pai então acres­ centou: “Ele recebeu um curso de ciências humanas entre a porta da frente da nossa casa e a esquina a três quarteirões.”

O filho contou depois que ficou ali imóvel, com as mãos nos bolsos vazios, pensando em tudo enquanto a noite caía. Refletiu sobre o que teria de enfrentar, a vida na rua que lhe era desconhecida, e todas as coisas que estava deixando, coisas que necessitava e desejava. Lembrou-se da repreensão severa do pai e também da sua promessa de aceitá-lo de volta com uma atitude de arrependimento. Quando estava quase escuro, ele virou-se e voltou para casa com a cabeça baixa, batendo na porta da frente. O pai abriu a porta, com a mãe junto

342 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

dele e os dois outros meninos por trás dela. Vieram então as palavras: “Eu errei. Sinto muito. Compreendo que preciso de vocês e quero que todos saibam que estou arrependido. Amo vocês.” Eles então o abraçaram. (É provável que antes os irmãos tenham pensado: “Quem vai ficar com o quarto dele?” Você sabe como os irmãos são.) Se me lembro bem da história, naquela mesma noite houve um grande jan­ tar e uma grande alegria da família inteira. O arrependimento dele mudou tudo.

Você sabe o que Jó finalmente compreendeu? Deus é a essência de tudo, e não eu. Jó entendeu! E o que isso significa?

• O propósito de Deus está-se desenrolando, e não posso impedi-lo.

• O plano de Deus é incrível, e não vou compreendê-lo.

• A reprovação de Deus é confiável, e não ouso ignorá-la.

• O caminho de Deus é o melhor, e não devo resistir a ele.

Você já aprendeu essas coisas? Entendeu que tudo gira em tor­ no de Deus: seu negócio, sua família? Ele é dono de tudo que você afirma possuir. Cada privilégio de que goza é concedido pela sua graça. Você não merece nada disso. Jó entendeu. A pergunta é: e você? Muitos tragicamente não compreendem até que tenham de enfrentar momentos impossíveis. Deus tem meios de corrigir os que são seus.

Uma vida submissa pode ser muito satisfatória. E maravilhoso contemplá-la: um indivíduo destemido, entregue e humilde com um “espírito quebrantado e contrito” - que não guarda ressentimen­ tos, não faz exigências, não tem expectativas, não oferece condições, não espera favores, plenamente arrependido diante do Senhor Deus. E o esplêndido resultado? O Senhor começa a usar-nos de maneiras surpreendentes. Por quê? Porque o mundo raramente encontra essa combinação única!

Jó vê finalmente a Deus pelo que ele realmente é e se arrepende por inteiro. O resultado é uma bênção após outra, como veremos em breve. De fato, bênçãos duplas ocorrem em sua vida. Uma vez

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS 343 que Deus colocou suas mãos poderosas nos ombros do homem, Jó finalmente entendeu.

Alguém está tentando chamar sua atenção estes dias? Você decidiu que não vai ficar sentado e aceitar isso? Andou quase três quarteirões? Antes de dar mais um passo, pare e pense.

Aprenda uma lição de um jovem antes rebelde. Faça meia-volta. Volte para casa.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Numa cultura que prefere processar a pedir perdão, o que torna tão raro e tão belo o arrependimento sincero de Jó?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Jó se arrependeu não por culpa imaginária, mas por ter conhecido melhor a Deus; que encontro com o Senhor tem quebrantado o seu orgulho?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significa, na sua caminhada, arrepender-se pelos motivos certos, levado pela revelação de Deus e não pela pressão dos homens?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 26;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Finalmente... Chega a Justiça$t$, 26,
$conteudo$A

justiça contem algo profundamente satisfatório. Ficamos ale­ gres quando o certo é recompensado e o errado é punido. O velho axioma, “Justiça é a verdade em açao”, explica nosso respeito por ela; o que é justo finalmente ocorre.

Ninguém é melhor no que diz respeito à justiça do que o Deus Vivo, que não só é onisciente, como completamente imparcial e justo. Quando a sua justiça finalmente chega, vale a pena ter espe­ rado por ela. Essa espera pode parecer interminavelmente longa. Mas não duvide: não importa quão longa ou curta seja a espera — o Senhor é justo. Embora nem todas as contas de Deus sejam acertadas no final de cada mês, elas serão acertadas. A justiça é um ingrediente essencial do seu caráter; ele não só não irá ignorá-la como também não pode fazê-lo.

Volte comigo nos próximos minutos para uma era da antiguidade em que a indiferença religiosa era comum. Nesses dias da história judaica, havia reis e profetas na terra. Do lado externo era possível ver riqueza material e poderio militar, mas no interno grassavam a idolatria,

346 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

a corrupção política e os males sociais. Mesmo assim, os rituais reli­ giosos continuavam, embora Deus os desprezasse. O Senhor expôs o seu desgosto pelos lábios de seu profeta, Amós, que declarou ousadamente:

Aborreço, desprezo as vossas festas e com as vossas assembléias solenes não tenho nenhum prazer. E, ainda que me ofereçais holocaustos e vossas ofertas de manjares, não me agradarei deles, nem atentarei para as ofertas pacíficas de vossos animais cevados. Afasta de mim o estrépito dos teus cânticos, porque não ouvirei as melodias das tuas liras. Antes, corra o juízo como as águas; e a justiça, como ribeiro perene.

Amós 5:21-24

O Senhor ficara farto das reuniões religiosas insinceras, das muitas convenções e conferências, das ofertas hipócritas, e até dos cânticos ruidosos. Ele não estava disposto a suportar aquele fingimento por muito mais tempo; seu pavio ficara terrivelmente curto. Não perca as seis palavras poderosas perto do final do seu anúncio: “Corra a justiça como ribeiro perene”. E foi o que aconteceu.

E isso que torna o clímax da vida de Jó tão positivo. Este ho­ mem, que jamais merecera o sofrimento que suportou, é tratado com justiça. Os que perturbaram tanto a sua vida também não foram esquecidos. O Deus da Justiça finalmente surge, trazendo grandes recompensas e restauração para o justo e forte disciplina para os injustos.

UM RÁPIDO RETROSPECTO

Jó entendeu finalmente. Compreendeu por fim que o plano de Deus é profundo, que seu raciocínio é certo e que seus caminhos são mais altos do que ele poderia algum dia entender. Depois disso, Jó aba­ na a bandeira branca da rendição e diz com toda sinceridade: “Eu me retrato e me arrependo. Disse coisas que não deveria ter dito, falei de coisas que não sabia, tornei-me farisaico em causa própria.

FINALMENTE... CHEGA A JUSTIÇA 347

Senhor, eu te peço, sabe que o meu coração é teu. Eu me humilho perante ti. Coloco-me à tua disposição. Teu propósito é certo; teu plano é incrível; tuas censuras são confiáveis; teu caminho é o melhor.”

Quando o Senhor ouviu os profundos sentimentos do coração contrito de Jó, quando testemunhou a humildade do seu espírito quebrantado e a franqueza e receptividade da alma de Jó, a misericór­ dia fez-se presente e a justiça correu. Há até “justiça poética” quando o Senhor decide usar Jó no processo de levar aqueles outros homens à justiça. Veremos em breve como ele faz isso. Mas, agora, este é um bom lugar para inserir um insight que vale a pena ser lembrado.

Você vai ficar surpreso ao ver como o Senhor usa você na vida de outros uma vez que ajuste a sua vida aos caminhos dele. Será muitas coisas para essas pessoas: uma censura, um refúgio, um porto de esperança, uma razão para continuar, uma fonte de força, uma influên­ cia calmante e muito mais. É maravilhoso compreender (para sua surpresa) como ele escolhe usá-lo para ajudar na restauração daqueles que se afastaram. Isto muitas vezes inclui os que magoaram você ao se extraviarem.

JUSTIÇA EM RELAÇÃO AOS AMIGOS DE JÓ

Uma vez ouvida a confissão de arrependimento de seu servo, o Senhor volta sua atenção para os três amigos. Antes de iniciar este episódio, precisamos entender por que Eliú foi omitido. É bem possível que Eliú, o último dos amigos, estivesse mais certo do que errado. Ele acertara mais o alvo do que os três primeiros, embora a sua perspec­ tiva necessitasse de alguns pequenos ajustes e seu orgulho precisasse descer alguns pontos. Por não ser tão culpado quanto Elifaz, Bildade e Zofar, ele ficou em uma categoria diferente. É possível que o Senhor se ocupasse dele mais tarde, preferindo não incluir esse confronto no registro sagrado.

Não estou dizendo que, como resultado do seu arrependimento, você ficará livre de novas dificuldades. Não sugiro também que os problemas irão deixá-lo imediatamente e você nunca mais saberá o

348 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

que é ficar deprimido ou desanimado. Você é apenas humano. Estou afirmando que o seu estilo de vida hoje não vai ser como começará a viver quando se fixar na verdade de que a vida está centrada em Deus. Jó percebeu isso.

Os outros homens não perceberam. Eles estão na sombra, ainda de testa franzida e braços cruzados, imaginando por que um raio divino não atingiu Jó, por que o Senhor não está confirmando as palavras deles e os recompensando pelo que fizeram. Que surpresa vão ter!

Tendo o S enhor falado estas palavras a Jó, o S en h o r disse também a Elifaz, o temanita: A minha ira se acendeu contra ti e contra os teus dois amigos; porque não dissestes de mim o que era reto, como o meu servo Jó.

Jó 42:7

Eu sei que você gostaria de avançar e ver esses homens castigados, mas espere. Volte e leia novamente as primeiras palavras de Deus.

Gosto do que o Senhor disse aos três: “Minha ira se acendeu contra vocês. Vocês me fizeram ficar zangado. Falaram coisas erra­ das. Agiram erradamente. Devem prestar contas de seus atos!” Sabe por que aprecio que isso faça parte da narrativa? Porque fui criado num ambiente religioso muito severo, onde todos eram ensinados que os cristãos nunca devem irar-se. “Se você fica irado, é pecador. Além disso, precisa confessar que ficou com raiva.” As Escrituras nunca ensinam que devemos reprimir qualquer expressão de ira, mas apenas não permanecer irados (Ef 4:26, 27). Se o Senhor pode dizer que sua ira “acendeu-se” contra aqueles homens que fizeram e disseram coisas erradas, com certeza há lugar para a ira justificada em nós.

Você deve estar lembrado de que o Senhor Jesus expulsou com veemência os cambistas que profanavam o templo. Ele torceu tiras de couro, transformando-as em um chicote(!) e os expulsou como se expulsam bois teimosos. Não posso imaginá-lo sorrindo e dizendo

FINALMENTE... CHEGA A JUSTIÇA 349

amavelmente: “Agora, cavalheiros, estou um pouco constrangido com o que vejo aqui. Quando tiverem tempo, por favor, limpem tudo e saiam em silêncio.” (Você não gostaria de ver uma foto do que real­ mente aconteceu? As mangas de seu manto foram enroladas, e ele brandiu o chicote com justa indignação! Aqueles fariseus não sabiam se deveriam cuspir ou abrir seus filactérios quando o viram correr em sua direção.) Tratava-se de ira no melhor sentido da palavra. Alguma coisa está errada, se você não se zanga com coisas como essas!

Compreenda, porém, por favor, que as palavras do Senhor contra os três amigos não representam um acesso de fúria. Não se trata de uma reação exagerada em meio a um ataque de cólera. Não, isto levou algum tempo, lembre-se. Ele viu tudo, ouviu cada palavra impiedosa. Está aguardando o momento certo. Finalmente, tendo usado todos os recursos, diz: “Minha ira está acesa.”

A razão dessa cólera é dada no final do versículo 7 (palavras idên­ ticas são repetidas no fim do versículo 8). Leia com cuidado: “Porque vós não dissestes de mim o que era reto, como o meu servo Jó.”

Por que estavam errados? Este é o motivo: em seu esforço para defender a justiça de Deus, eles ignoraram a misericórdia dele e limi­ taram a sua soberania. Foram longe demais. Insistiram em que o sofrimento humano é sempre resultado da pecaminosidade, e isso restringiu a Deus. Além do mais, faltou misericórdia em suas pala­ vras. Como já afirmamos várias vezes, o pecado nem sempre é a razão do sofrimento das pessoas. E ocasionalmente uma razão, mas não a única. Foi nesse ponto que falharam.

Você se lembra da opinião deles? (Como poderia esquecer?) Afir­ maram que Jó tinha algum pecado secreto. Declararam que Jó havia cometido erros e escondido as suas transgressões. Consideravam Jó hipócrita. Se ele concordasse com tudo isso e lidasse com o assunto, ficaria então curado. Análise errada, caminho errado com atitudes erradas. Resultado: eles não representaram a Deus como deveriam. “Não dissestes de mim o que era reto, como o meu servo Jó.”

Isto, a propósito, diz muito para aqueles de nós que são comu­ nicadores, aconselhando, ensinando e pregando a Palavra de Deus.

350 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Deus se importa muito em ser apresentado de maneira exata, justa e apropriada. Com misericórdia. Pela razão certa. Em amor.

O Senhor não se limita a confrontar os erros cometidos por eles, mas também faz algo a respeito. Ele não diz, irado: “Agora saiam!” Ou: “Vão para o seu quarto! Tudo acabou para vocês!” Isso não seria misericordioso, nem lhes daria oportunidade para serem restaurados — e a restauração é sempre o alvo depois do arrependimento. A mise­ ricórdia vem nos calcanhares da justiça. Conforme a oração do profeta Habacuque: “Na tua ira, lembra-te da misericórdia” (Hab 3:2).

Agora, eis que chega a misericórdia. É como se Deus dissesse: “Vocês cometeram erros, não fizeram como o meu servo Jó. Agora, portanto, vejam o que devem fazer para endireitar as coisas.” O plano para a restauração deles é anunciado.

Tomai, pois, sete novilhos e sete carneiros, e ide ao meu servo Jó, e oferecei holocaustos por vós. O meu servo Jó orará por vós; porque dele aceitarei a intercessão, para que eu não vos trate segundo a vossa loucura; porque vós não dissestes de mim o que era reto, como o meu servo Jó.

Jó 42:8

O plano de restauração que inclui oferecer sete novilhos e sete car­ neiros em holocausto parece demasiadamente estranho para os dias de hoje. Entretanto, não era nada incomum nos tempos do Antigo Testamento, nos quais quem cria em Deus dirigia-se ao Senhor em busca de perdão. Sacrificar animais era parte do processo, para quem deseja alcançar o perdão e o livramento para seu pecado. Às vezes o sangue dos animais era derramdo no altar. Em outras ocasiões a carcaça do animal era colocada no altar (como neste caso), e o fogo a consumia. A medida que a fumaça subia, chegaria a Deus como “um perfumado aroma adocicado”. Tudo isso soa muito estranho para nós porque não vivemos naquela época. Nunca vimos algo pa­ recido. Mas naqueles dias esta era a maneira de acalmar a ira de Deus. Ofertas em holocausto acompanhadas por orações resultavam no

FINALMENTE... CHEGA A JUSTIÇA 3 51

perdão divino. Por favor, repare, Jó iria orar por eles. Estando seu coração reto diante de Deus (e o deles não, ainda). Deus aceitaria a oração de Jó em nome deles.

APROFUNDANDO UM POUCO MAIS

Quem foi ofendido, Jó, recebe a oferta dos ofensores, os três amigos. Na verdade, o supremamente ofendido foi o Senhor Deus, a quem interpretaram tão mal.

O meu servo Jó orará por vós.

Acho ótimo que o ofendido ore agora pelos ofensores. O Senhor afir­ ma claramente: “Porque dele aceitarei a intercessão”. O hebraico diz: “Levantarei a sua face, para que eu não vos trate segundo a vossa loucura”. Significando: “Para que eu não lhes dê o que merecem.”

Você perdeu algo? Se tomar tempo para ler o relato bíblico, verá que Deus dá a Jó o mesmo título quatro vezes: “Meu servo” (Jó 42:7, 8). Um título honroso. Ele o recebera antes de começar o sofrimento (Jó 1:8) e continua a recebê-lo. A perseverança heróica de Jó resultou em manter o mesmo título na avaliação de Deus. Isso sim é justiça em ação. Jó deve ter ficado profundamente grato ao ouvir essas pa­ lavras ditas nos ouvidos daqueles que haviam passado tantos dias fazendo o possível para depreciá-lo: “O meu servo Jó disse de mim o que era reto”.

A cena seguinte deve ter sido igualmente gratificante. Ali estão aqueles homens que antes quiseram agir como juizes de Jó e agora vão buscar os animais requeridos e se curvam diante do Senhor com suas ofertas, esperando que Jó ore a seu favor. Não é uma cena gran­ diosa? Esperamos tanto para vê-la! E como foi saudável para aqueles três acertarem as coisas, não só perante Deus, mas com Jó! É bom para nós confessarmos nossos erros àqueles a quem ofendemos. Quan­ do pedimos perdão, estamos dizendo que agimos mal mediante nossos atos.

352 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Jó obedece ao Senhor logo que os homens fazem a sua parte.

“Então, foram Elifaz, o temanita, e Bildade, o suíta, e Zofar, o naamatita, e fizeram como o S en h o r lhes ordenara; e o S en h o r acei­ tou a oração de Jó” (Jó 42:9). Eles agiram com rapidez. Não houve discussão, conflito ou relutância. Além disso, fizeram exatamente como o Senhor ordenara. Jó também obedeceu. Orou graciosamente por cada um deles. Não houve amargura da sua parte. Ele não disse: “Está bem, ajoelhem-se. Vocês me fizeram sofrer demais. Quero ver suas caras quando forem humilhados. Ajoelhem-se ali - prostremse!” Nada disso. Lembra-se? O coração contrito não exige nada de outros.

Que cena comovente! Você sabe o que está acontecendo? Os pecados estão sendo perdoados. A culpa, removida. Sentimentos cruéis, esquecidos. Ressentimentos, apagados. E isso que acontece quando a justiça e a misericórdia se fundem.

Isto descreve de maneira esplêndida o que ocorreu na Cruz. Essa é a razão de a morte de Cristo ter sido chamada de eficaz. Ela é efetiva, porque a justiça de Deus contra o pecado foi satisfeita de uma vez por todas na morte do Cordeiro. Como resultado, a misericórdia de Deus é liberada no perdão dos que confiam no Cordeiro. E somos então libertados. Finalmente livres!

Frederick Faber disse o seguinte nesse sentido:

U m a bondade em sua justiça

Q ue é mais do que liberdade.'

Na geração seguinte, William Newell escreveu uma canção que can­ tamos em nossos anos de crescimento como cristãos. Ela diz a mesma coisa com palavras diferentes.

Passei anos envolto em vaidade e orgulho,

N ão m e im portando que m eu Senhor estivesse crucificado,

FINALMENTE... CHEGA A JUSTIÇA 353

Sem saber que foi por mim que morreu No Calvário.

Pela Palavra de Deus entendi afinal meu pecado — Tremi então diante da lei que desprezara, Até que minh’alma culpada se voltasse suplicante Para o Calvário.

Oh! o amor que definiu o plano da salvação! Oh! a graça que o trouxe até o homem! Oh! o enorme abismo que Deus transpôs No Calvário

Houve grande misericórdia e graça, Perdão multiplicado para mim, Ali minh’alma sobrecarregada encontrou a liberdade — No Calvário.2

A justiça final correu livremente na Cruz. Quando veio, trouxe ondas poderosas de misericórdia, libertando-nos para sempre da culpa do nosso pecado. Que maravilha!

Para Jó, as coisas vão ficar ainda melhores.

JUSTIÇA EM RELAÇÃO À VIDA DE JÓ

A recompensa plena de Jó terá de aguardar até o próximo capítulo, mas vamos dar uma espiada no versículo abaixo:

Mudou o S e n h o r a sorte de Jó, quando este orava pelos seus amigos; e o S e n h o r deu-lhe o dobro de tudo o que antes possuíra.

Jó 42:10

Nosso fiel Senhor não é mesmo assim? Esta é uma prova tangível de que ele é supremo na justiça. Depois de todos aqueles dias quentes,

354 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

penosos; daquelas noites longas e inquietas; das preleções acusadoras que teve de suportar; das horas de sofrimento e confusão, miséria e espera; da perda de tudo e da lembrança dolorosa do enterro de todos os seus amados filhos, a justiça finalmente acontece. Jó, quebrantado pelo seu arrependimento, contrito de coração, tendo sua face levantada a favor de seus amigos, testemunha a restauração deles por causa da misericórdia de Deus. Nesse momento seus olhos se encontram com os do Senhor, e ele ouve algo assim: “Olá, Jó. Venha até aqui. Está na hora da sua recompensa: tudo vai ser duplamente bom.”

De repente,

• Os tumores somem, sem deixar cicatrizes.

• A febre se vai quando uma brisa suave o refresca.

• Os amigos sorriem e aplaudem.

• Ele pode voltar para casa, e a propriedade que constrói tem o dobro do tamanho da outra!

• Certa manhã, algum tempo depois, na mesa do café, sua esposa inclina-se sobre o ombro dele e sussurra com um sorriso: “Estou grávida!”

Um dos sinais ocultos das alegrias de Jó precisa ser mencionado. Jó não orou por si mesmo, nem pela restauração da sua fortuna. Ele orou por aqueles homens que lhe haviam feito mal. Ele os perdoou! O fato de receber tudo de volta em dobro não foi como se tivesse ganhado na loteria divina em que apostou. Ele não tinha planos. Não sabia como a história iria terminar. Lembre-se: um coração contrito não tem expectativas. Tudo o que sabe é que o Senhor disse: “Ore por esses amigos. Vou levantar a sua face quando fizer isso. Os três chegam humildemente e oferecem os seus sacrifícios.” Jó obede­ ce e ora. O Senhor se agrada tanto da obediência tranquila de Jó, que diz: “Venha agora aqui, Jó, e contarei o que tenho guardado para você: vou aumentar tudo que é seu em dobro!”

Sabe o que mais é maravilhoso? O silêncio de Satanás. O Adversá­ rio permanece silencioso na derrota. Satanás acabou de testemunhar o que Deus lhe dissera no princípio: “Considere o meu servo Jó.

FINALMENTE... CHEGA A JUSTIÇA 355

Ele é íntegro. Embora não tenha permissão para matá-lo, pode tocar nele - está em seu poder, somente poupe a sua vida, mas saiba que ele jamais me amaldiçoará.” Essa predição provou ser verdadeira. Por­ tanto, aconteceram o silêncio de Satanás e as recompensas de Jó.

O QUE ISTO DIZ PARA NÓS HOJE?

Encontro pelo menos duas verdades duradouras para nós, enquanto reflito sobre essas cenas finais da história de Jó.

Primeira, vale a pena pedir perdão. Se alguma coisa surgiu entre você e seu Pai celestial, por que esperar de longe? Vá até ele. Fale francamente. O Senhor gosta de escutar as confissões sinceras de seus filhos. Ele se agrada ao ouvir nossa humilde admissão de que falha­ mos. Diga tudo a ele. Como vimos, ele jamais vai rejeitá-lo. Vale a pena pedir perdão.

Segunda, vale a pena esperar pela justiça. Como eu disse no início do capítulo, Deus é um Deus de justiça. Ele irá fielmente executála — caso não seja agora, mais tarde. Se não for mais tarde, será na eternidade. Deus vai acertar as'contas. Sua imparcialidade faz parte da sua veracidade. Deus, que permitiu pacientemente que esta experiência extraordinária com Jó seguisse o seu curso, agora a com­ pletou. Seu servo foi recompensado. Os amigos foram obrigados a ajoelhar-se. Melhor ainda, Satanás foi silenciado, e foi provado o seu erro (novamente!). E o Senhor continua no trono, no controle, e plenamente glorificado.

Não tenho meios de saber qual é a sua situação neste momento. Não sei o que está enfrentando ou quem lhe fez mal. Não sei tam­ bém até que ponto a vida foi difícil para você. Mas sei isto: a vida não foi fácil. Seus testes não foram talvez tão severos quanto os de Jó, embora eu saiba que foram sem dúvida difíceis, talvez os piores que já tenha suportado em sua existência. Quem sabe está preso. Come­ teram uma injustiça com você, e as coisas nunca se acertaram. A justiça não foi feita.

Há uma razão para a demora. Talvez seja para dar tempo para que você examine a sua vida. E se houver algum erro que precise

356 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

confessar, uma ofensa que causou, mas nunca tentou reconciliar? Per­ mita que o aconselhe a deixar de lado o seu orgulho, volte a esse assunto inacabado e cuide das coisas agora. Você vai ficar admirado com o alívio que vai sentir ao levantar essa âncora para que possa mover-se na direção certa.

E bem possível que a sua disposição para perdoar e prosseguir seja tudo que é necessário para fazer com que o Senhor deixe a sua justiça correr. O que está então esperando?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Mesmo quando a espera pela justiça parece interminável, o que sustenta a sua confiança de que o Senhor é justo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Sabendo que nem todas as contas de Deus são acertadas no fim do mês, mas todas serão acertadas, como isso conforta você na injustiça presente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma a chegada da justiça na história de Jó renova a sua esperança de que Deus não ignorará a sua dor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 27;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$E Jó Viveu Feliz para Sempre... Será?$t$, 27,
$conteudo$esde a nossa infância somos fascinados por histórias. Quando éramos bem pequenos, nossas histórias transbordavam de ima­ ginação, o que fazia delas, para nós, um mundo maior do que a vida. Os principais personagens eram no geral animais que falavam e riam, suspiravam e choravam. A maioria deles vivia numa terra de fantasia que captava e prendia a nossa atenção, enchendo-nos de entusiasmo e assombro.

D

Aquelas histórias começavam sempre iguais: “Era uma vez...” E entrávamos em terras de reis e rainhas, príncipes e nobres, bem e mal, assim como amor, romance e casamento. Como eram mara­ vilhosas essas histórias! Depois de todos os altos e baixos, o erro é derrotado. A bondade prevalece com a volta da paz, e as mesmas seis palavras anunciam o final que nós crianças gostávamos de ler: “E eles viveram felizes para sempre.”

Isso aconteceu com Cinderela, com a Bela Adormecida e o Príncipe Encantado. Até mesmo a Bela e a Fera viveram felizes para sempre. A medida que crescemos, nosso cinismo misturado com a realidade nos

358 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

faz franzir a testa e perguntar: “Como poderia ser isso, uma vez que todos permaneceram num mundo imperfeito? Felizes para sempre? Caia na real!”

A lembrança dessas histórias me faz pensar numa garotinha de quatro anos que entrou na cozinha entusiasmada com a história que ouvira na creche. Era sobre uma jovem muito linda, uma princesa, que adormeceu de repente. Chegou então um belo príncipe que a beijou — acordando-a!

“Você sabe o que aconteceu depois?”, perguntou a pré-escolar esperta.

“Sei sim — eles viveram felizes para sempre, respondeu a mãe.

“Não, nada disso — eles se casaramf’

Em sua inocência infantil, a menininha fez a distinção certa en­ tre o conto de fadas e a realidade. Não é fácil para a maioria de nós fazer isso. Continuamos pensando que vai acontecer. Continuamos esquecendo.

Quando construímos uma casa, pensamos que vai ser nossa “casa dos sonhos”, mas não é. Logo depois de mudarmos, algumas das tomadas não funcionam, a porta da garagem está emperrada, o teto tem goteiras, a madeira do piso de cima começa a ranger e, invaria­ velmente, um dos banheiros entope.

Arranjamos um novo emprego — pensamos que vai ser a expe­ riência mais satisfatória da nossa carreira. Nós nos esquecemos de que temos de nos levar conosco quando começamos. Muitas das pessoas no novo emprego são bem parecidas com outras que deixamos para trás. O chefe não é perfeito, e o plano de saúde não é assim tão bom.

O que dizer de um carro novo? Tem um cheiro delicioso. O acabamento da pintura é magnífico e funciona maravilhosamente — até a manhã da segunda-feira seguinte, quando não dá partida. Ou até que o sujeito estacionado perto de você no supermercado abra muito a porta e bata no pára-choque do seu novo carro vermelho.

Mais um exemplo. Um filho! Lembra-se de ter pensado como seria ótimo começar sua família, ter aquele pedacinho adorável de

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 359 amor arrulhando para você no quartinho recém-decorado? A criança chega finalmente - depois de 37 horas de trabalho de parto. Ela se recusa a mamar no peito, tem cólicas tão fortes que não dorme direi­ to à noite durante dezoito meses e... e... e... em treze anos ela acorda adolescente. Não vamos pensar nisso.

Em momentos assim, você gostaria de mandar queimar todos os livros que incluem uma história onde alguém viveu feliz para sempre! Portanto, adeus, terra da fantasia! Nosso mundo não é perfeito. Nem mesmo aqueles grandes personagens que aparecem nas páginas da Bíblia viveram felizes para sempre.

Você está pronto para a próxima declaração? Nem mesmo Jó!

Antes de sermos tentados a colocá-lo num colchão macio, cerca­ do de uma pilha de travesseiros fofos de cetim, num cenário ideal de grande beleza e paz perfeita, temos de lembrar-nos de que Jó não foi subitamente para o céu. Ele continua firmemente fixado no planeta Terra pelo resto de seus dias, que foram muitos. Mas ele não foi maravilhosamente recompensado? Sim, foi. Não recebeu de Deus o dobro do que tinha antes das calamidades? De fato. E sua família - ele não teve mais dez filhos? Está vendo o que quero dizer?

HÁ OURO NESSAS PROVAS DIFÍCEIS

Antes de retornarmos ao último capítulo do diário de Jó, vamos repetir rapidamente sua terceira resposta a Elifaz. Estou me referindo àque­ las palavras que insisti que você decorasse na seção central de Jó 23. Penso que verá essas palavras com novos olhos agora que sabe como a história levou Jó à plena recuperação. Quando, porém, seu corpo ainda estava coberto de feridas, seus amigos ainda o criticavam, ele continuava falido e sentado no depósito de lixo na periferia da cida­ de, Jó teve a temeridade de dizer: “Mas ele sabe o meu caminho; se ele me provasse, sairia eu como o ouro” (Jó 23:10).

Leia isso novamente. Jó faz três declarações baseadas na fé em meio ao seu sofrimento. As três são sobre o seu Deus.

Primeira: Sei que Deus conhece a minha situação. “Ele sabe o meu caminho.”

360 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Segunda: Creio que é Deus que está me provando. “Se ele me provasse”.

Terceira: Creio que, depois de terminarem as provações, ele me abençoará de maneira singular. De fato, serei um homem melhor. Bênçãos douradas serão concedidas depois desta aflição. Um comen­ tário bastante notável e realista, se você me perguntar. Ele não nega as provações, mas há esperança além delas. Deus sabe. Deus vai re­ compensar. É isso que encontramos no último capítulo da vida de Jó.

Não seria ótimo se pudéssemos estar no lugar de Jó no final do livro, sem ter passado pelo que ele passou? Como seria bom obter a sua sabedoria sem todo o sofrimento! Impossível! Mantenha-se rea­ lista e compreenda que isso não pode acontecer. É preciso fogo para refinar o ouro.

Antes de passar para o capítulo 42, quero falar sobre a idéia de atravessar o fogo. Assim como somos diferentes em nossa aparência e em nossos antecedentes, em nossos níveis de maturidade e em nossa idade cronológica, experimentamos também testes diferentes. De acordo com o que você sabe, um de seus vizinhos está atravessando um dos períodos mais difíceis da sua vida. Como já consideramos várias vezes neste livro, é possível que você também esteja sofrendo do mesmo jeito. O fogo devasta. Este mundo vil não é amigo da graça, o que significa que você pode estar sendo queimado no fogo mais forte. Pode estar enfrentando o teste mais difícil que experimentou até agora.

Espero que estas duas palavras não pareçam vazias ou fingidas quando as escrevo: Tenha esperança. Tenha esperança de que isso não esteja acontecendo sem que Deus saiba. O Senhor Deus sabe o seu caminho, e ele tem um propósito. Depois da prova ardente você também sairá como ouro. Você está sendo refinado pelo teste. Ele foi permitido, e você está sendo moldado de novo no processo — purifi­ cado e humilhado. Dias melhores virão. Caso não venham logo, e se não for mais tarde, nesta terra, eles virão quando você estiver diante do Senhor e receber dele “ouro, prata e pedras preciosas”. Tudo então vai valer a pena. Muitas das recompensas de Jó foram recebidas en­ quanto ele estava vivo no planeta Terra. As suas talvez o aguardem na

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 361

Glória. De qualquer forma, Deus sabe. Deus não se esquece. Deus recompensará.

AS QUATRO GRANDES RECOMPENSAS DE JÓ

Depois da longa e árdua espera, Jó tornou-se o recipiente pessoal de quatro bênçãos douradas concedidas pela mão de Deus. Enquanto as indico, minha oração é que você possa ter esperança no ponto em que se encontra hoje. Suas recompensas serão sem dúvida diferentes, por­ que não existem provações idênticas. Estas, porém, são as dele.

A primeira das quatro bênçãos é: Os bens de Jó foram duplicados.

O Senhor restaurou a prosperidade de Jó quando ele orou pelos amigos. A última parte do versículo explica o que isto significa: “E o

Senhor deu-lhe o dobro de tudo o que antes possuíra” (Jó 42:10).

Há ocasiões em que não é sábio nem apropriado aceitar um versículo literalmente, mas esta é uma das vezes em que devemos fazer isso. Preste atenção no versículo 10: tudo dobrado; sua terra, assim como os seus bens nessa terra. Uma casa maior pôde ser construída, em vez daquela com a metade do tamanho em que viviam antes. Ficamos também sabendo da multiplicação entre os animais com o passar do tempo: “Assim, abençoou o Senhor o último estado de Jó mais do que o primeiro” (Jó 42:12).

Se voltar para Jó 1:3, você lerá o que Jó possuía originalmente. Ele tinha 7.000 ovelhas e acaba com 14.000 Qó 42:12). Seus reba­ nhos então crescem enquanto ele os alimenta e cria. O número deles aumenta até o dobro do tamanho. Há fartura de alimento. Há tam­ bém muito pasto, e as ovelhas chegam a 14.000.

Está lembrado das caravanas que Jó possuía? Esse empreendi­ mento duplica. Ele não tem mais 3.000 camelos, mas 6.000. Que espetáculo deve ter sido! Os camelos eram os caminhões de frete da cultura de Jó — carregavam as mercadorias das caravanas. Esse seg­ mento do seu negócio dobra. Ele tem agora 1.000 juntas de bois para trabalhar nos campos.

Jó deve ter visto, de cada janela de sua casa, plantas exuberantes, verdes e coloridas, assim como todas as suas plantações em crescimento.

362 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Possuía até 1.000 jumentas. O homem tem então o dobro do que tinha antes. Não instantaneamente, mas com o correr dos anos, suas posses aumentaram. Na verdade, Jó tinha mais do que o suficiente. Muito mais. Ele era rico antes, mas agora sua prosperidade é enorme!

Há ocasiões em que o Senhor escolhe abençoar certos indivíduos com muito mais do que o suficiente. O que devemos aprender é aceitar isso. Se a inveja for o seu pecado constante, peço que se afaste de um dos piores hábitos entre os cristãos! Vou ser completamente sincero com você, vejo isso com frequência. A grande tentação é lem­ brar ao Senhor como você tem sido fiel ao ver um vizinho ou amigo cujo negócio cresce enquanto o seu estaciona. Por que não se alegrar com os que se alegram? Por favor, deixe de tentar ser mais esperto do que o Senhor em tais assuntos.

É injusto e incorreto supor que a maioria dos indivíduos ricos não obtiveram suas riquezas ou não as receberam da mão de Deus. Alguns dos santos mais queridos são eminentemente ricos. E daí? Repito — deixe as coisas como estão. Se você for um deles, dificilmente precisará ser lembrado de que não foi você quem criou essa riqueza. Ela veio por causa da graça de Deus. Faça uso adequado dela. Dê com generosidade. Ande humildemente. Se, porém, ele decidiu não abençoar você como aben­ çoou outra pessoa, respeite e aprecie a sua escolha, em vez de ressentir-se dela. Vamos aplaudir Jó por ser um recipiente do favor próspero de Deus. Ele “saiu como ouro”, tendo sido provado e mostrado ser fiel.

Há uma segunda recompensa que encontramos no versículo 11: Seus parentes e amigos vieram. Alguns de vocês têm um senso torcido de humor (um pouco como o meu, sinto dizer) e pensam como eu. Posso imaginar um desenho onde Jó levanta os olhos e vê todos os seus amigos e parentes aparecendo para visitá-lo, e ele explode: “Onde vocês estavam antes de saber que eu ganhei na loteria?” Alguém disse certa vez: “Há duas maneiras de saber quantos amigos você tem: ganhe na loteria ou dirija uma picape.”

Então, vieram a ele todos os seus irmãos, e todas as suas irmãs, e todos quantos dantes o conheceram, e comeram

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 363 com ele em sua casa, e se condoeram dele, e o consolaram de todo o mal que o S e n h o r lhe havia enviado; cada um lhe deu dinheiro e um anel de ouro.

Jó 42:11

Não se tratava, porém, de loteria. Deus simplesmente decidiu der­ ramar enormes bênçãos financeiras sobre Jó. Certo dia, Jó olhou e viu-se rodeado por todos os seus irmãos e todas as suas irmãs. O interessante é que não tenham sido mencionados até agora. Não estavam presentes semanas antes, quando os dias de Jó eram es­ curos e difíceis. Na verdade, não sabemos isso ao certo. No caso de estarem lá, não abriram a boca e nem seus nomes nem suas palavras foram registrados.

Agora, no entanto, todos se apresentaram: todos os seus irmãos e irmãs, todos os que o conheciam antes. Sabe quem eu incluiria? Por terem sido perdoados, não vamos esquecer de Elifaz, Bildade, Zofar e Eliú. Por que não? Eles não estão na lista negra, estão? Se tivermos lido a primeira parte de Jó 42 corretamente, eles foram perdoados depois da oração de Jó a seu favor. Isto significa que estão restaura­ dos. Por que nao incluí-los então como parte da grande reunião?

Note o que todas essas pessoas fizeram quando se reuniram. Foram até ele e comeram em sua casa. Também o consolaram e confortaram por todas as adversidades que o Senhor lhe enviara. Como deve ter sido alegre essa reunião da família e dos amigos! Que grande festa devem ter gozado juntos! Quantas histórias foram contadas. Quanto riso encheu os aposentos. Jó não ria há meses; ele deve ter então compensado o tempo perdido. O sofrimento do homem desapare­ ceu finalmente para sempre. O que parecia uma sentença de morte terminou. O lar é um lar mais uma vez! Gosto de saber que eles se condoeram e o consolaram. E possível que ele ainda tivesse algumas cicatrizes dos tumores. É provável que pedissem para vê-las. Ele pode ter-lhes contado sobre a noite em que perdeu toda a esperança. Tal­ vez tivesse de fazer uma pausa e enxugar algumas lágrimas. Essas são as coisas que tornam uma reunião significativa e memorável.

364 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Cada um deu dinheiro e um anel de ouro a Jó. Não é interessante? Quem sabe foi logo no começo, quando ele não havia ainda começado a reconstruir o seu negócio. Talvez quisessem ajudá-lo a levantar-se outra vez. Lembre-se de que ele perdera tudo. E possível que tivesse sido necessário vender todos os anéis que possuía antes para sobrevi­ ver. Eles queriam que Jó tivesse também alguma coisa boa; ou se tratavam de presentes para a festa de inauguração da nova casa que acabara de construir, e as pessoas estavam felizes por ele. Aprecio demais o fato de todos se reunirem e cada um por vez consolar esse homem que havia suportado tanto sofrimento e solidão.

Num mundo apressado como o de hoje, é fácil perder nossas raízes. É fácil começar a viver só para nós mesmos. Mas os parentes de Jó não eram assim! Podem ter-se afastado, mas voltaram a entrar em contato com ele. Tinham muito que conversar. Sabem quem tinha também muito que conversar? Jó e a esposa. Em muitos lares atingi­ dos por uma aflição física, ocorre uma separação. A distância cresce enquanto o amor esfria. Alguns casamentos não perduram. A mulher vai numa direção e o marido em outra.

Você tem de cumprimentar Jó e sua mulher. Eles resistiram jun­ tos. Ela é um tanto depreciada por muitos de meus amigos pregadores, sinto dizer. Penso, entretanto, que havia grandes qualidades nessa senhora. Vamos examinar os fatos: ela fica com ele até o fim. Ela observou o marido definhar, confuso como estava, tornando-se uma sombra do que fora antes. Deve ter sido terrivelmente difícil, mas ela permaneceu ao lado dele. Não o abandonou. Você sabe o que isto diz para nós casados? E claro que sabe.

Você tem um filho que não consegue acompanhar os colegas na escola? Talvez tenha havido dano cerebral ao nascer e exista um pro­ blema de retardamento, ou seu filho tenha uma doença prolongada que o prejudica. Fiquem juntos. Não desistam. A mulher de Jó per­ maneceu ao lado dele. Eles tinham muito que conversar ao deitar-se à noite, depois de apagadas todas as lâmpadas. Eles devem ter sentido profunda satisfação ao pensar que conseguiram permanecer juntos durante todo aquele período de angústia.

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 365

Isto me leva à terceira recompensa dele: Todos os filhos de Jó são substituídos. “Também teve outros sete filhos e três filhas” (Jó 42:13). Tente imaginar isto. Alguns momentos hilários deveriam ter ocorrido. Os dois estavam envelhecendo, não é? Certo dia, inesperadamente, a mulher diz a Jó: “Você não vai acreditar, mas acho que estou grávi­ da.” A resposta dele: “O quê?” Vamos dizer que ambos têm 70 anos. Ali está Jó, rindo com a mulher porque ela vai ter um filho. Ela sobe ao sótão, pega alguns vestidos de gestante, tira as bolas de naftalina e diz: “Acho que ainda entro neles.” Não uma vez, nem duas. Estamos falando de outras dez gestações. Durante os próximos 25 anos ou mais eles estão novamente criando filhos. Isso mantém alguém jovem, não é mesmo?

Mais dez filhos. Jó e a mulher recebem força e capacidade para reproduzir sem levar em conta a sua idade (não nos é dito quantos anos tinham exatamente) e educar outra casa cheia de filhos. Quan­ do você pára para pensar a respeito, eles passaram a gozar as bênçãos da paternidade e maternidade com a sabedoria dos avós. Você não pode superar essa combinação!

Quantas vezes dizemos: “Como gostaria de ter sabido então o que sei agora; teria sido um pai muito melhor.” Jó e sua esposa ti­ veram a oportunidade de satisfazer o desejo de todo pai. Eles não cometem os erros que cometeram da primeira vez e certamente não erram mais tanto.

Chamou o nome da primeira Jemima, o da outra, Quezia, e o da terceira, Quéren-Hapuque. Em toda aquela terra não se acharam mulheres tão formosas como as filhas de Jó; e seu pai lhes deu herança entre seus irmãos.

Jó 42:14, 15

Tiveram sete filhos e três filhas. Lemos alguma coisa sobre as filhas aqui, mas nada sobre os filhos. Sabemos os nomes delas: Jemima, Quezia e Quéren-Hapuque. Verifiquei o significado desses nomes e não parece haver grande importância neles.

366 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

É-nos dito, porém, algo significativo sobre as filhas. Devem ter sido jovens muito belas. “Em toda aquela terra não se acharam mulheres tão formosas como as filhas de Jó.” Você sabe parte da razão? Elas foram criadas da maneira certa. Seu caráter fora cuidadosamente culti­ vado. A beleza de uma vida de fé havia sido instilada em cada filha. Que tesouro! Elas receberam sabedoria e discernimento, conhecimen­ to e compreensão de pais sábios, em idade já madura. Lemos também que “Seu pai lhes deu herança entre seus irmãos” (Jó 42:15). Era pouco comum uma filha receber uma herança nos tempos antigos!

Lembre-se, porém, de que isto foi antes da Lei de Moisés.

Sob a lei a herança só ia para a filha quando não havia filhos (Nm 27:8). Por viverem antes da Lei de Moisés, essas três filhas receberam uma herança junto com os irmãos. Não havia então favoritismo, os meninos e as meninas eram igualmente criados e amados.

Agora é mencionada a quarta recompensa. Esta tem a ver com os anos futuros de Jó: A bênção de uma vida longa e satisfatória.

Depois disto, viveu Jó cento e quarenta anos; e viu a seus filhos e aos filhos de seus filhos, até à quarta geração. Então, morreu Jó, velho e farto de dias.

Jó 42:16, 17

Vamos supor novamente que Jó tem cerca de 70 anos na ocasião em que recebe sua cura e novas forças. Ele já viveu uma vida inteira. Lemos agora que vive 140 anos depois das provações. Jó entra numa segunda fase completa de vida; ao todo viveria 210 anos. Como isso deve tê-lo agradado! Entre os seus muitos deleites, “viu a seus filhos e aos filhos de seus filhos, até a quarta geração”.

Conto quatro, talvez cinco gerações: Jó, filhos, netos, bisnetos, e talvez até tetranetos, dependendo de onde as gerações começaram. Que meio mais lindo de resumir seus últimos anos: “Então, morreu Jó, velho e farto de dias”. A Bíblia Viva interpreta assim: “E morreu, velho e feliz, depois de uma vida longa e abençoada”.

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 367

ENCORAJAMENTO PARA OS MAIS VELHOS

Não se fala muito em nossa era sobre os que estão envelhecendo. Eles no geral representam um grupo esquecido de pessoas, embora haja mais agora nesta categoria específica do que já houve antes na histó­ ria da humanidade. Vamos nos demorar então aqui, não só para nos divertir um pouco com o assunto, mas para extrair algumas lições animadoras dele. Este é um homem que viu muito da vida.

Foi dito sobre Abraão:

Expirou Abraão; morreu em ditosa velhice, avançado em anos; e foi reunido ao seu povo.

Génesis 25:8

A referência é provavelmente a juntar-se ao seu povo após a morte. Foi dito de Davi: “Morreu em ditosa velhice, cheio de dias, riquezas e glória; e Salomão, seu filho, reinou em seu lugar” (1 Cr 29:28).

Jó não morreu como um velho rabugento e ranzinza que nin­ guém aturava. Este homem vê seus filhos, seus netos, seus bisnetos. Revive as alegrias de sua vida renovada enquanto permanece envolvido com eles, ensinando muitas das coisas que aprendeu.

A fórmula patriarcal “em ditosa velhice” expressa uma vida completa e realizada. Que maneira invejável de chegar ao fim! Ele não “viveu feliz para sempre”, uma vez que isso é impossível. Gozou, porém, muitos prazeres! Este velho mundo é cheio de corrupção. Não podemos erradicar ou fugir de uma natureza amaldiçoada pelo pecado. Temos de lidar com uma natureza hostil nos outros (e em nós!), que é menos do que desejável. Mesmo assim, pode haver satisfação. Pode haver realização na velhice. Além do mais, pode haver propósito contínuo e profundo contentamento nos últimos anos.

Quando terminei de pregar uma mensagem sobre este trecho das Escrituras em 2002, uma senhora mais velha veio até mim e falou entre lágrimas: “Não consigo me lembrar de um sermão que

368 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

tenha me tocado tanto.” E acrescentou: “Algumas vezes parece que as pessoas de nossa idade são praticamente esquecidas.”

Esse pensamento me leva a dar alguns conselhos encorajadores a você que tem pais e membros mais velhos da família ainda vivos: lembre-se deles. Cuide deles. Mantenha um diálogo por e-mail. Con­ tinue a cultivar esse relacionamento.

A idade não é bondosa com o corpo humano ou com o cultivo de relacionamentos. Vamos aprender, dos últimos anos de Jó, o valor do envolvimento entre gerações. Admitimos que ninguém pode tornar um indivíduo realizado e satisfeito, mas podemos certamente ajudar para que a sua viagem seja um pouco mais agradável.

E agora — um conselho para você que está se sentindo esquecido e desprezado. Há um provérbio judeu que diz: “Para o ignorante, a velhice é como o inverno; para o instruído, é como uma colheita”. À medida que a idade avança, você descobre que, pelo fato de ter-se mantido alerta e vivo, continuará a considerar a vida com novos olhos. Anime-se! Mantenha-se envolvido na vida! Não sucumba a sentimentos de autopiedade! “No momento em que se sentir velho demais para fazer uma coisa, saia e faça. No momento em que sentir vontade de criticar, diga algo bondoso de maneira bondosa. No momento em que se sentir negligenciado, envie um bilhete alegre para um amigo.”1

Quando os anos começam a se acumular, nos descobrimos di­ zendo: “Não se preocupe. Está tudo bem. Não fique aflito por causa disso!” Eu digo isso ocasionalmente a um de nossos filhos agora adul­ tos, que esteja confuso com um de seus filhos que parece meio fora de si às vezes. Digo: “Não é nada. Apenas uma fase. (Está acontecendo por cerca de quatro anos, mas é uma fase.) Não se perturbe tanto. Não é nada.” Um de meus papéis, compreendo agora, é encorajar nossos filhos e netos.

Henry Thoreau escreveu certa vez: “Ninguém é tão velho quanto aqueles que sobreviveram ao entusiasmo.” Não é agradável estar com pessoas mais velhas que ainda nos contagiam com o seu entusiasmo? Não é ótimo ver que elas têm objetivos, sonhos e atividades que as

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 369 mantêm vivas desde o momento em que acordam até a hora de dormir? Pessoas assim são contagiantes.

O general Douglas MacArthur escreveu esta esplêndida decla­ ração em seu 75° aniversário:

No centro de cada coração há uma câmara registradora; en­ quanto ela receber mensagens de beleza, esperança, ânimo e coragem, você é jovem. Quando os fios despencam e o seu coração fica coberto pela neve do pessimismo e pelo gelo do cinismo, então e só então você envelheceu.2

Meu relacionamento próximo e contínuo com o Seminário Teológico Dallas é perfeitamente satisfatório. Não estou me referindo a estar perto de estudantes jovens. Você não tem idéia, a não ser que estives­ se onde estou, e com a mesma frequência, do prazer que sinto por estar com alguns dos mesmos homens que foram meus mentores. Foram eles que tomaram tempo para ensinar-me quando eu era mais jovem. Que grande grupo de homens de idade! Eles continuam an­ dando com Deus. É maravilhoso ver indivíduos de 75, 80, alguns com 90 anos, ainda amando Jesus. Ainda escrevendo grandes obras. Ainda lendo. Ainda me desafiando a continuar firme. (Gosto muito quando me chamam de filho.) Há uns dois anos, eu estava conver­ sando com o Dr. Walvoord, e ele me disse: “Jovem, quando eu tinha a sua idade...” Eu sorri e pensei: “Que grande elogio!”

Alguém disse: “Lembre-se de que as pessoas idosas valem muito mais do que as jovens. Elas têm prata no cabelo, ouro nos dentes, pedras nos rins, chumbo nos pés e gás natural nas entranhas.”3 Vale­ mos realmente muito!

SUGESTÕES PARA MANTER-SE JOVEM

Eu gostaria de oferecer várias sugestões sobre como se manter jovem. Elas são originais. Não aprendi de ninguém. Eu praticamente as des­ cobri enquanto a vida se desenrolava nos dez ou quinze anos que se

370 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

passaram. Não me importa qual a sua idade. Você estará nesse está­ gio um dia e, quando estiver, vai precisar fazer uma recapitulação dessas dicas. Quer permanecer jovem? Lembre-se de cinco coisas.

Número um: Sua mente não é velha, continue a desenvolvê-la. Assista menos televisão e leia mais. Passe tempo com pessoas que conversem sobre eventos e idéias, em lugar de ficar sentado num grupo falando mal das pessoas e de como esta jovem geração está decadente. Ninguém gosta de ficar perto de uma pessoa mal­ humorada que só vê as nuvens e só fala do mau tempo.

Um comediante comentou que seu pai estava tão pronto para morrer que não comprava sequer bananas verdes. Esse é um péssimo modo de viver. Desafie o processo do envelhecimento, compre um cacho de bananas verdes. Enquanto isso, saia e plante algumas mudas de carvalho.

Número dois: Seu humor não acabou, continue a apreciá-lo. Gosto de estar perto de pessoas idosas que ainda vêem o lado iluminado da vida. Elas observam coisas engraçadas acontecendo. Sabem con­ tar uma boa história. Gostam de rir. Você fica fabuloso quando ri. E o riso o torna anos mais moço. Ajuda a remover algumas das rugas em seu rosto. Por falar nisso, olhe-se num espelho. Talvez lhe faça bem cultivar um melhor senso de humor. Fred Allen costumava dizer que, se você não rir alto o suficiente, o riso vai descer e aumentar seus quadris.

Número três: Sua força não se acabou; continue a usá-la. Não se permita ficar fora de forma. Mantenha-se ativo. Coma bem. Cuide do seu peso. Procure não ficar isolado e imóvel. E, por falar nisso, deixe de pensar em cada dor e aflição. Deixe de falar sobre como está ficando fraco e como outros terão de fazer as coisas por você. Conti­ nue fazendo você mesmo.

Um médico, amigo de muitos anos, cometeu o erro de dizer a uma mulher de 84 anos que acabara de correr oito quilómetros naquela manhã: “Ouça, você não deve se afobar. Não precisa correr oito quilómetros.” Ela fora vê-lo para o seu exame anual. Uma se­ mana e meia mais tarde, depois do seu exercício regular, ela morreu.

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 371

Ele me disse no enterro da mulher: “Nunca mais vou dizer a um paciente para não se afobar.”

Anime-se! Use as escadas. Nem sempre tome o elevador. Exercite-se. Mantenha-se ágil. Aceite alguns riscos. Aceite os desafios que a oportunidade lhe atira. Diga sim o maior número de vezes possível. Você será cada vez mais procurado. Sua força não se foi, a não ser que você a mande embora.

Esta é a quarta: Suas oportunidades não desapareceram, continue a persegui-las. Há pessoas ao seu redor que poderiam fazer uso de uma palavra encorajadora, um bilhete afirmativo, um telefonema, dizen­ do: “Amo você, creio em você e estou orando por você.” As oportuni­ dades para ajudar os outros não desapareceram. Não fique com tanto medo que suas cortinas permaneçam fechadas e as três fechaduras em suas portas também. Se não estiver disposto a arriscar, você começará a ter medo de que alguém esteja querendo tirar vantagem da sua pessoa. Que existência medonha! Sem remover qualquer das necessi­ dades essenciais de segurança, não viva suspeitoso dos outros, pen­ sando só nos perigos. Se fizer issç, jamais deixará a sua vizinhança. As oportunidades não desapareceram; continue a buscá-las com vigor.

A quinta é evidente: O seu Deus não está morto, continue a servi-lo e a buscá-lo. O Deus vivo é eterno. O Senhor Jesus Cristo é eterno e sempre relevante. Continue a passar tempo a sós com o seu Senhor. E importante!

Jó sobreviveu a tudo e continuou vivendo — mais 140 anos! Não ouvi falar nada de ele ter sido posto de lado. Dez filhos farão isso para você. Vai continuar na ativa!

Gosto desta oração, que repeti muitas vezes:

Senhor, tu sabes melhor do que eu mesmo que estou enve­ lhecendo e ficarei velho um dia.

Não me deixes falar demais e livra-me especialmente do hábito fatal de pensar que devo dizer algo sobre cada assunto em cada ocasião.

372 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Livra-me da obsessão de tentar resolver os problemas de todo mundo.

Impeça-me de descrever cada pequeno detalhe — dá-me asas para chegar ao ponto.

Peço-te graça suficiente para ouvir as histórias dos sofrimen­ tos de outros. Que o meu amor pelas pessoas aumente a minha paciência com o passar dos anos.

Não ouso pedir-te que minha memória melhore, mas que cresça a minha humildade e diminua minha arrogância quando minhas lembranças pareçam estar em conflito com as dos outros.

Ensina-me a lição gloriosa de que posso estar ocasional­ mente enganado.

Mantenha-me razoavelmente doce. Não quero ser um santo - alguns deles são de tão difícil convivência - mas uma velha azeda (ou velho) é uma das obras requintadas do diabo.

Faze-me atencioso, mas não caprichoso; útil, mas não dominador.

Com minha vasta bagagem de sabedoria, parece triste não fazer uso dela; mas tu sabes, Senhor, preciso de alguns ami­ gos no final.

Dá-me a capacidade de ver coisas boas em lugares inespe­ rados e talentos em pessoas inesperadas. E concede-me, Senhor, a graça de dizer isso a elas.4

Você viveu o suficiente para saber que não há ninguém mais confiável do que o Senhor Deus. Continue cultivando um relacionamento significativo com ele. Busque-o diligente e frequentemente. M an­ tenha-se ativo no serviço dele. Esta é uma das melhores razões para permanecer envolvido em sua igreja local. Há muitas áreas de serviço

E JÓ VIVEU FELIZ PARA SEMPRE... SERÁ? 373 para os que estão disponíveis, cujas atitudes são positivas e cujas mentes conservam-se ativas e alertas.

Desejo a você uma vida plena, como a de Jó. Não que ela seja marcada por viver feliz para sempre (uma impossibilidade), mas sim verdadeiramente satisfatória, realizada, desafiada, útil, piedosa, equi­ librada e alegre.

Repito: alegre e, não se esqueça, razoavelmente doce.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A restauração de Jó foi real, mas as cicatrizes permaneceram; como você lida com bênçãos que chegam sem apagar as perdas vividas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante de um mundo imperfeito, o que significa para você um "final feliz" que não nega a dor, mas a redime?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como confiar que Deus pode restaurar a sua vida sem que isso dependa de tudo voltar a ser exatamente como era antes?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 28;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Que Jó Nos Ensina a Nosso Próprio Respeito$t$, 28,
$conteudo$s crianças têm o hábito de dizer coisas que geralmente nos fazem sorrir. Elas não querem ser engraçadas, mas quase sempre são. Isto no geral acontece quando estão respondendo a perguntas — perguntas sérias. Ao darem a sua opinião, é impossível não achá-la engraçada.

A

Veja, por exemplo, o tema do amor e do casamento:

• Como você decide com quem vai se casar? Kristen, 10 anos: “Ninguém decide realmente antes de crescer com quem vai se casar. Deus decide tudo antes, e você mais tarde descobre com quem está amarrado.”

• Como um estranho pode saber se duas pessoas são casadas? Derrick, 8 anos: “Você pode ter de adivinhar, dependen­ do se estão ou não gritando com as mesmas crianças.”

• O que você acha que sua mãe e seu pai têm em comum? Lori, 8 anos: “Os dois não querem mais filhos.”

376 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

• Quando é certo beijar alguém? Pam, 7 anos: “Quando são ricos.” Curt, 7 anos: “A lei diz que você precisa ter 18 anos, por isso eu não iria querer me envolver com isso.”

• É melhor ser solteiro ou casado? Anita, 9 anos: “E melhor ser solteiro para as meninas, mas não para os meninos. Os meninos precisam de alguém para cuidar deles.”

• Como você faria um casamento dar certo? Ricky, 10 anos: “Dizendo à esposa que ela está bonita, mesmo que pareça um canhão.”1

Alguns dos bilhetes que me foram entregues (ou enviados por e-mait) sobre os meus sermões a respeito de Jó foram hilários\ Uma criança perguntou ao pai se o nome do pastor deles era agora Jó. Um garoto de 10 anos começou a me dar desenhos feitos por ele representando as cenas que eu descrevi em um sermão após o outro. (Você devia ver alguns daqueles tumores!) Quando cheguei quase ao final do livro, ele parou de desenhar. Não fez mais nenhum outro desenho, mas recebi um bilhetinho de duas frases, dizendo: “Será que você pode achar outro assunto? Não tenho mais idéias.” Tenho de amar tama­ nha honestidade.

Esta é uma boa hora para cumprimentar você por ter ficado comigo até agora. Que Deus o abençoe! A esta altura você sabe certa­ mente duas coisas: primeira, não se trata de uma diversão frívola, uma história fácil para mantê-lo interessado; segunda, há uma razão para não existirem muitos livros escritos a respeito de Jó.

A história talvez não seja muito estimulante e não é, com certeza, uma trama simples de desvendar, mas o que falta a Jó em popularidade ele compensa em realismo. Os compridos corredores de uma enfer­ maria de doentes de leucemia num hospital podem não ser estimu­ lantes, mas cada quarto contém pessoas fazendo as mesmas perguntas e lutando com as mesmas dúvidas de Jó. A história pode não ser excitante nem interessante, mas é concreta e real. Ao máximo!

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 377

O que acontece em lugares como esses, e em livros como este, é que você percebe que está dando menos atenção ao que é temporal e externo e se prende cada vez mais ao que é eterno, ao que está acon­ tecendo bem lá no fundo.

A sondagem da alma substitui a superficialidade. Você começa a fazer perguntas difíceis de responder. Chegamos a esse ponto neste livro. O que Jó nos ensina a nosso próprio respeito? Em meu último capítulo, vamos considerar o que Jó nos ensina sobre o nosso Deus.

Meu principal objetivo neste capítulo pode surpreender você. Ele não tem a intenção de informar ou reprovar — você já teve o suficiente nesse sentido nos vinte capítulos anteriores, e eu não pre­ ciso certamente repetir os detalhes da história. Fiz isso tantas vezes que você está provavelmente começando a se sentir como um pianis­ ta ensaiando escalas familiares ao som monótono de um metrónomo. Meu alvo é intensificar o seu entusiasmo pela vida - tirar você da mentalidade status quo e levá-lo a uma renovação do seu impulso de realmente viver. A palavra é paixão.

Benjamin Zander, professor do Conservatório Musical da Nova Inglaterra, ilustra o que espero realizar:

Um jovem pianista tocava um prelúdio de Chopin em mi­ nha classe principal. Embora tivéssemos chegado quase a ponto de alcançar um conceito abrangente da peça, a performance dele permanecia presa à terra. Ele a compreen­ dia intelectualmente, poderia tê-la explicado para outra pessoa, mas era incapaz de transmitir a energia emocional que é a verdadeira linguagem da música. Notei então algo que mostrou ser a chave. Seu corpo estava firmemente ereto. Eu lhe disse: “O problema é a sua postura!” Encorajei-o a permitir que todo o seu corpo se inclinasse para o lado, insistindo que seguisse a música com o próprio corpo; então, repentinamente, a melodia fluiu magnífica. Vários especta­ dores prenderam o fôlego, ao serem atingidos pela plena pujança da execução dele. O presidente de uma firma de Ohio que estava presente escreveu-me: “Fiquei tão comovido

378 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

que fui para casa e transformei toda a postura da minha empresa.”

Nunca descobri o que ele queria dizer com isso, mas tenho minhas próprias idéias (...)

Conheci Jacqueline DuPre na década de 1950, quando eu tinha vinte anos e ela quinze. Ela era uma estudante inglesa desajeitada que desabrochou para tornar-se a maior violon­ celista de sua geração. Tocamos juntos o Quinteto de Schubert para violoncelo, e me lembro de ela ter tocado com grande impacto, intensidade e paixão. Conta a história que, quando tinha seis anos, ela ingressou na sua primeira competição de violoncelo e era vista correndo pelo corredor com o instru­ mento levantado acima da cabeça, ostentando no rosto um enorme sorriso de entusiasmo. Um curador, notando o que lhe pareceu alívio na face da menina, comentou: “Vejo que você teve a sua oportunidade de tocar hoje!” E a Jackie res­ pondeu alegremente: “Não, não, vou tocar agora!”

Mesmo aos seis anos, Jackie era um canal para que a mú­ sica fluísse.2

Para falar francamente, minha esperança é ajudar você a tornar-se um músico de boa postura no teclado da vida, não se satisfazendo em passar outro ano tocando notas e acordes monótonos e previsíveis, mas atirando-se por inteiro na sinfonia!

SETE LIÇÕES QUE VALEM A PENA LEMBRAR

Havia um homem na terra de Uz, cujo nome era Jó; homem íntegro e reto, temente a Deus e que se desviava do mal.

Jó 1:1

Logo descobrimos que Jó e a mulher tinham sete filhos e três filhas. Suas posses eram grandes, com milhares de ovelhas e camelos, além

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 379 de mil bois e jumentos. De fato, dizia-se dele: “Este homem era o maior de todos os do Oriente” (Jó 1:3). Ninguém era mais conheci­ do e provavelmente ninguém era mais rico do que ele. Jó tinha tudo.

Sem que ele soubesse, houve um diálogo no mundo invisível do alto. Quando o Senhor e Satanás tiveram seu estranho encontro, o assunto mudou rapidamente para esse indivíduo notável na terra. O Senhor chamou a atenção de Satanás para a sua vida exemplar, e Satanás respondeu com sarcasmo sinistro.

“É claro! Quem não o serviria depois de ter sido agraciado com tanta prosperidade e proteção? Tira tudo isso dele e vê o que acontece; o homem vai virar-se contra ti imediatamente.”

Deus concorda em deixar que o Adversário ataque Jó.

Nos termos de hoje, o Senhor apostou com ele que isso nunca aconteceria. Philip Yancey refere-se a esse acordo como “aposta divina”. Satanás providencia uma remoção súbita e agressiva de todos os bens do homem, deixando-o falido. Em questão de minutos, tudo que lhe pertencia desaparecera.

Isto nos dá a primeira de sete lições que valem a pena lembrar: Nunca sabemos antecipadamente os planos que Deus tem para nós. Jó não teve um conhecimento ou aviso prévio. Aquela manhã começou como todas as outras. A noite havia provavelmente passado como qualquer outra. Não houve uma grande manifestação de anjos - nem mesmo uma batida na janela ou um bilhete na mesa da cozinha.

Em uma calamidade após outra, todos os prédios de sua pro­ priedade ruíram, e nada além de madeira e corpos juncavam a cena. Tudo ocorreu tão depressa que a mente de Jó girava incrédula em turbilhão. Tudo o atingiu de uma vez... Seu mundo transformou-se instantaneamente.

Você e eu devemos aprender com isto! Nunca sabemos o que o dia vai nos trazer, de bom ou de mau. O plano de nosso Pai celestial se desenrola em separado de nossa percepção. Andamos pela fé e não pelo que vemos, com confiança e não pelo toque; nos apoiando con­ fiantes e não fugindo. Ninguém sabe antecipadamente o que o plano

380 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

do Pai inclui. É melhor assim. Pode ser uma bênção maravilhosa, ou um teste que nos faz cair de joelhos. Ele sabe antes de nós, mas não é obrigado a nos advertir a respeito ou a nos lembrar do que nos aguar­ da no horizonte. Podemos estar certos de uma coisa: nosso Deus sabe o que é melhor.

Leia devagar e medite nas seguintes Escrituras:

Eu sei, ó S e n h o r, que não cabe ao homem determinar o seu caminho, nem ao que caminha o dirigir os seus passos. Castiga-me, ó S e n h o r mas em justa medida, não na tua ira, para que não me reduzas a nada.

Jeremias 10:23, 24

Eu é que sei que pensamentos tenho a vosso respeito, diz o

S e n h o r; pensamentos de paz e não de mal, para vos dar o fim que desejais. Então, me invocareis, passareis a orar a mim, e eu vos ouvirei. Buscar-me-eis e me achareis quando me buscardes de todo o vosso coração.

Jeremias 29:11-13

lhe dirige os passos.

Provérbios 16:9

Os passos do homem são dirigidos pelo S e n h o r; como, pois, poderá o homem entender o seu caminho?

Provérbios 20:24

Porque os meus pensamentos não são os vossos pensamen­ tos, nem os vossos caminhos, os meus caminhos, diz o

S e n h o r, porque, assim como os céus são mais altos do que a terra, assim são os meus caminhos mais altos do que os vossos caminhos, e os meus pensamentos, mais altos do que os vossos pensamentos.

Isaías 55:8, 9

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 381

Não andeis ansiosos de coisa alguma; em tudo, porém, se­ jam conhecidas, diante de Deus, as vossas petições, pela oração e pela súplica, com ações de graças. E a paz de Deus, que excede todo o entendimento, guardará o vosso coração e a vossa mente em Cristo Jesus.

Filipenses 4:6, 7

Meus irmãos, tende por motivo de toda alegria o passardes por várias provações, sabendo que a provação da vossa fé, uma vez confirmada, produz perseverança. Ora, a perse­ verança deve ter ação completa, para que sejais perfeitos e íntegros, em nada deficientes.

Tiago 1:2-4

Humilhai-vos, portanto, sob a poderosa mão de Deus, para que ele, em tempo oportuno, vos exalte, lançando sobre ele toda a vossa ansiedade, porque ele tem cuidado de vós.

1 Pedro 5:6, 7

Você fez o que eu pedi? Leu cada passagem devagar e refletindo sobre ela?

O plano final que o Senhor tem para nós não é uma série calami­ tosa de eventos - fatalista, sofrida, mortal - destinada a enfraquecer e destruir a nossa fé. Pelo contrário, é um plano para “nosso bem (...) para dar-nos um futuro e uma esperança”, escreve o profeta Jeremias. Isso não significa, porém, que a vida será fácil ou confortável. Em vista de ele ser o Deus do inesperado, será surpreendente! Será diferente do que você ou eu iríamos jamais considerar ou planejar, ou mesmo preferir. Portanto, para aumentar sua paixão pela vida, tenho um conselho bem simples a dar: fique pronto para tudo - e quero mes­ mo dizer tudo.

Um de meus amigos da igreja contou-me que um de seus velhos amigos, que tinha um emprego bem pago, foi avisado pela Guarda Nacional que fora convocado, sem nenhum aviso prévio. Isto signifi­ cava uma mudança imediata de estilo de vida. Ele teve de deixar sua excelente ocupação, a fim de servir na guarda. Ele e a esposa (e vários

382 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

filhos) foram obrigados a vender sua linda casa. A mulher precisou adaptar-se a um mundo completamente diverso, sem a companhia e o apoio constantes do marido. Quem sabe onde teriam de viver, que escolas as crianças iriam frequentar, ou quão seguro ele estaria durante o seu período de serviço militar? Foi como um raio caído inesperada­ mente do céu.

Não temos garantia de que a vida vai continuar para nós como no ano passado. O que você goza hoje, como resultado de seu bom emprego e boa saúde, talvez não permaneça nesta mesma época no próximo ano ou daqui a seis meses. Não pretendo amedrontá-lo com isto, mas ajudá-lo a preparar-se para um modo de pensar inteira­ mente novo. Nossos dias estão nas mãos de Deus. Você já meditou neste pensamento, quero dizer, creu realmente nele?

A resposta de Jó, como você deverá se lembrar, é absolutamente notável.

Jó 1:20-22

Eis uma segunda lição que vale a pena lembrar: Uma perspectiva verti­ cal impedirá nosso pânico horizontal. Não entenda mal a resposta de Jó à devastação. Ele não se refugiou num estado mental negativo. Enfrentou a música — por mais sombria e triste que fosse. Ficou tão dominado pela dor da sua perda que rasgou o seu manto. Estava quebrantado, triste e sofrendo com a morte dos filhos. Foi por isso que raspou a cabeça e se sentou mais tarde sobre cinzas. De fato, essas reações nos asseguram que ele recusou escapar emocionalmente mediante a negação. Não perca, porém, a sua reação final. Jó pros­ trou-se de joelhos e adorou.

Sua perspectiva vertical é clara e corajosa. Nada que aconteça no plano horizontal fará esse homem entrar em pânico. E como se Jó

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 383 estivesse dizendo: “Eu tive. Eu gozei. Fui abençoado. Estou agora sem esses benefícios. Eles não fazem mais parte do meu mundo. Estou alquebrado com a perda da minha família. Mas o mesmo Deus que deu tudo isto pela sua graça é o Deus que, em sua vontade soberana, decidiu tirar tudo. Dou-lhe glória e louvor. Que o seu nome seja para sempre exaltado!”

Muito antes neste livro citei as palavras profundas de Francis Andersen. O tempo costuma apagar pensamentos importantes que deveriam ser retidos. Uma vez que um dos segredos da memória é a recapitulação, permita-me repetir várias linhas que merecem ser relidas.

Jó não vê nada errado com o que lhe aconteceu. Neste pon­ to, Jó entra em uma nova fase, a mais difícil de todas (...) Ele nunca amaldiçoa a Deus, mas todos os seus relaciona­ mentos humanos se desfazem. Sua atitude é a mesma de antes (1:21). É igualmente certo para Deus conceder dons e os remover; (...) é igualmente certo para Deus enviar o bem ou o mal. (...) Essa fé positiva é a pedra mágica que transforma tudo em ouro; pois, quando o mal e o bem são recebidos das mãos de Deus, toda experiência de vida se tor­ na uma ocasião de bênção. O custo é, porém, alto. Fica mais fácil baixar a sua opinião de Deus do que levantar sua fé a tal altura.3

Quando a vida transcorre confortável e satisfatoriamente, com boa saúde e uma família feliz... que bom! Como a nossa visão de Deus se alarga!

Ficamos entusiasmados com todos esses magníficos versículos das Escrituras. As mensagens do pastor prendem nossa atenção, e cantamos fervorosamente os hinos de celebração. Mas quando as di­ ficuldades chegam ou nossa saúde decai, nossas canções silenciam rapidamente, mostramos cinismo em nossa atitude e nossa fé azeda. Somos em breve tentados a baixar nossa visão de Deus. O homem tem razão. E fácil duvidar de Deus quando os tempos difíceis substi­ tuem os bons. Uma perspectiva vertical forte atiça a chama da paixão.

384 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

As coisas só pioraram. Jó não peca nem culpa a Deus, o que frustra Satanás, mas não surpreende o Senhor. Ele sabia que Jó conti­ nuaria íntegro.

No começo do novo dia Satanás aparece novamente. O Senhor pergunta: “Observaste o meu servo Jó?” Deve ter sido um momento crucial quando o Senhor pôde apontar para Jó, que não demonstrara qualquer falta de fé, nenhuma dúvida na sua confiança, e Satanás teve de aceitar os fatos. Recusando-se, porém, a admitir a derrota, o Acusador sorri de novo cinicamente:

Então, Satanás respondeu ao SENHOR: Pele por pele, e tudo quanto o homem tem dará pela sua vida. Estende, porém, a mão, toca-lhe nos ossos e na carne e verás se não blasfema contra ti na tua face. Disse o S e n h o r a Satanás: Eis que ele está em teu poder; mas poupa-lhe a vida.

Jó 2:4-6

Você já sabe muito bem o que aconteceu. No momento em que acen­ deu a luz verde:

Então, saiu Satanás da presença do S e n h o r e feriu a Jó de tumores malignos, desde a planta do pé até ao alto da cabeça.

Jó 2:7

Jó é literalmente arrasado. Seu sofrimento não pode ser descrito. Sua febre sobe. Não consegue comer, nem dormir, e não há sinal de alívio. Sua miséria é extrema. Vê-lo sofrer é mais do que sua mulher pode suportar. Ao vê-lo sentado no monte de cinzas, ela não consegue mais se calar e fala o inconcebível.

Ainda conservas a tua integridade? Amaldiçoa a Deus e morre.

Jó 2:9

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 385

Ela o amava, não duvide disso. A doença não fez com que o amasse menos. Sua compaixão supera o seu bom senso e, nesse mo­ mento irrefletido, ela verbaliza um pensamento estranho.

“Se você amaldiçoar a Deus, ele o levará para casa. Você e eu sabemos que este ato irá terminar rapidamente o seu sofrimento.” (Você pode imaginar a expectativa ansiosa de Satanás neste momen­ to?) Jó pode estar sofrendo, mas tem suficiente presença de espírito para perceber uma heresia quando a ouve.

Mas ele lhe respondeu: Falas como qualquer doida; temos recebido o bem de Deus e não receberíamos também o mal?

Jó 2:10

Essa declaração nos oferece uma terceira lição: discernimento. O discernimento é necessário para detectar o conselho errado de pessoas bem-intencionadas. Essas palavras sussurradas em seu ou­ vido vieram de sua esposa! Ela o amou por meio de dez partos. Ela o amou por meio da criação de todos os dez filhos. Ela o amou nos tempos de dificuldades e nos tempos de fartura, quando en­ fim poderiam desfrutar de tranquilidade. Esta mulher o amou quando ele não era alguém e continuou a amá-lo quando se tornou conhecido em todas as casas de sua região. Jó conheceu seu amor durante todos estes anos, mas isso não o impediu de perceber que seu conselho estava errado. “Mesmo falado por alguém que me ama e quer o melhor para mim, eu ouso não prestar atenção ao seu conselho”.

Seu conselho demonstra quão distante ela estava da percepção de Jó. Ela está questionando exatamente o que Deus mais admirava em Jó, e o está encorajando a fazer aquilo que Satanás previra. Pense sobre isto. Deus havia dito a Satanás: “Ele conserva a sua integrida­ de”. E ela está sugerindo. “Jó, ainda conservas a tua integridade?”

Satanás havia dito: “e verás se não blasfema contra ti na tua face”. E ela disse a Jó: “Amaldiçoa a Deus....”.

386 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Satanás torcia: “Sim, aceite o conselho de sua esposa”. E seus demónios não cansavam de atormentá-lo para enfraquecê-lo a ponto de ceder. Contudo, Jó resistiu. Ele discerne prontamente e rejeita o conselho.

Jó sabia que não poderia, de boa fé, seguir o conselho de sua esposa, mesmo que parecesse sensato. Sua resposta revela sua disci­ plina interior. Sua resposta foi ousada e contundente:

Ele disse a ela: “Você fala como uma doida. Usufruímos dias muito bons que Deus nos deu — por que não usufruir os dias ruins?”

Jó 2:10 (MSG — Tradução livre)

Que teologia magnífica! “Deus não é o nosso Deus apenas quando tudo vai bem. Nossa fé nele não fica limitada aos dias em que nos abençoa. Não afirmamos que ele é nosso Senhor só quando obtemos o que desejamos. Ele é nosso Deus mesmo quando a adversidade nos atinge. Ele é Senhor dos dias bons e dos maus. Ele não nos deixou no dia em que comecei a sofrer!” Jó estava certo. Isso sim é que é paixão!

Considere uma quarta lição: Quando as coisas vão de mal a pior, a teologia correta nos ajuda a permanecer fortes e estáveis. É um sinal de maturidade o fato de que Jó, depois de sofrer tal série de eventos cataclísmicos, estivesse pensando tão clara e corretamente sem qual­ quer hesitação, sem qualquer incerteza. O homem não aceitou a sugestão da esposa nem por um momento. “Você fala como doida”, foi sua reação imediata. “Já sabe evidentemente agora que estes lábios não podem amaldiçoar a Deus. A morte pertence a ele e não a mim. Quando estiver pronto para levar-me, ele o fará.” Como Jó podia fazer isso? Ele estava seguro em seu conhecimento de Deus. Em crises desse tipo, a teologia sólida é de valor incalculável.

Isto me faz lembrar de uma anedota de Charles Schultz que li há anos. Você se recorda da tirinha Snoopy? Linus, com seu cobertor, olha pela janela panorâmica na sala de sua casa. Ao seu lado se encontra

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 387

Lucy, que, como sempre, está no controle. Os dois observam a chuva que cai torrencialmente. Mal conseguem ver as árvores lá fora. Linus suspira: “Nossa, veja que chuvarada. Se continuar assim, vai inundar toda esta área, talvez o mundo inteiro.” Lucy responde sem hesitar: “Isso nunca vai acontecer. Em Génesis 9, versículos 7 a 17, lemos que Deus nunca mais vai inundar a terra. E ele colocou um arco-íris no céu para provar que sua promessa é verdadeira.” Linus olha para ela, sacode a cabeça e diz: “Você tirou um peso enorme de cima de mim.” Ela replica na mesma hora: “A teologia certa faz isso.”

E possível que a resposta do marido tivesse tirado um enorme peso da mente da esposa de Jó. Como é notável quando alguém que está sofrendo pode ensinar quem tem saúde. A teologia certa oferece um fundamento como nenhum outro. Vale a pena um lembrete aqui: tenha cuidado para nunca substituir a boa teologia bíblica por psico­ logia popular sem sentido. Faça um esforço para não enfraquecer a sua base teológica, trocando-a por um falatório de duplo sentido. Quando menos esperar, isso vai prejudicar você.

Recebi em meu aniversário um cartão de felicitações do meu tipo favorito. Havia nele um sujeito preso pelo colarinho num galho de árvore. Seus pés e pernas balançavam a cerca de 60 cm do solo. Ele parece vacilante e indefeso, tem uma máquina fotográfica pendurada frouxamente em seu pescoço. Dois enormes ursos estão ali do lado discutindo o destino do homem. Um diz para o outro: “O nome dele é Bradshaw. Ele disse que compreende que vim de uma caverna de um pai solteiro e tive modelos inadequados. Ele sente que meu com­ portamento disfuncional está arraigado na vergonha e co-dependência, e insiste em que eu deixe que meu ursinho interior seja curado.” Fez uma pequena pausa para refletir e então conclui: “Resolvi que devemos comê-lo.”

Fique com a teologia certa. Fuja da psicologia pop com o seu vocabulário confuso. Parece razoável no momento, mas, quando você precisa de algo substancioso, ela não vai estabilizá-lo ou fortalecê-lo. Uma vida de entusiasmo apaixonado deve estar firmada na rocha da verdade teológica.

388 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Os amigos de Jó finalmente aparecem. Nessa hora as coisas mu­ dam de rumo. Você não perceberia isso imediatamente. A princípio, eles parecem homens razoáveis e atenciosos.

Ouvindo, pois, três amigos de Jó todo este mal que lhe sobreviera, chegaram, cada um do seu lugar: Elifaz, o temanita, Bildade, o suíta, e Zofar, o naamatita; e combina­ ram ir juntamente condoer-se dele e consolá-lo. Levantando eles de longe os olhos e não o reconhecendo, ergueram a voz e choraram; e cada um, rasgando o seu manto, lançava pó ao ar sobre a cabeça. Sentaram-se com ele na terra, sete dias e sete noites; e nenhum lhe dizia palavra alguma, pois viam que a dor era muito grande.

Jó 2:11-13

Isto nos leva a uma quinta lição que vale a pena lembrar: Os amigos atenciosos e sensíveis sabem quando nos procurar, como reagir e o que dizer. Gostaria tanto que Elifaz, Bildade e Zofar tivessem ficado sim­ plesmente silenciosos, permanecido por perto para consolar Jó e sua esposa, levado uma tigela de sopa ou caldo e um copo de água fresca quando necessário. Eles se mostraram qualificados nos dois primei­ ros itens, não é verdade? Souberam a hora adequada para visitar Jó. No momento em que ficaram a par de suas circunstâncias adversas, deixaram tudo e foram vê-lo. Pelo menos inicialmente (durante sete dias), eles agiram como deviam. Ficaram simplesmente sentados ao lado de Jó. Sem dúvida sofreram com ele, oraram pelo homem e sua esposa, e esperavam oferecer simpatia e conforto.

Quem já ficou hospitalizado conhece a alegria de olhar para a porta do quarto e ver o rosto de um casal ou três amigos. Que conso­ lo saber que eles se importaram o suficiente para ir nos ver. Bem no fundo, ficamos satisfeitos por não dizerem muita coisa. Não estão “pregando” para nós ou tentando explicar o motivo do nosso sofri­ mento. Só ficam conosco. O amor os trouxe, mostram compaixão, e a amabilidade nos atrai para eles.

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 389

Porém, as coisas começaram a mudar quando aqueles homens quebraram o silêncio. Eles acharam que deviam abrir os olhos de Jó e expor os motivos para as suas aflições. É possível que tivessem boas intenções quando chegaram, mas o “bom conselho” deles logo se deteriorou. Fizeram censuras. Duvidaram dos motivos de Jó. Fica­ ram sondando cada vez mais fundo, em busca de pecados secretos, ocultos. O dano que causaram foi enorme.

Todos nós que desejamos viver com paixão precisamos passar algum tempo avaliando a nossa compaixão. Você e eu iremos algumas vezes encontrar-nos no papel de um amigo atencioso e, esperamos, sensível. Quem quer que esteja sofrendo precisa de um amigo - um amigo fora da família. Não são necessários muitos, só alguns amigos fiéis. São eles que levam conforto e um espírito sensível aos que so­ frem. Tais pessoas são raras, e sua presença afirmativa não tem preço. Precisamos de amigos que nos amem realmente e, ocasionalmente, de amigos que nos confrontem com sabedoria.

Lembro-me de Davi. Não muito tempo depois de ter sido un­ gido como futuro rei de Israel, o jovem matador de gigantes se viu caçado e perseguido pelo rei Saul, que passara a ter uma inveja doentia dele. O filho de Saul, Jônatas, ouve os comentários impró­ prios do pai a respeito de Davi. Ele sabe que eles são inexatos, preconceituosos e extremos. Sente que no coração do pai fermen­ tam sentimentos realmente maldosos. Da noite para o dia, Jônatas passa a defender a causa de Davi e se torna o amigo mais íntimo deste. Ele o procura sempre que Davi é obrigado a se esconder. Não deixa que sofra sozinho. Dá atenção a ele. Oferece proteção e com­ preensão, assim como palavras de esperança e encorajamento. Esse foi o papel preenchido por Jônatas. “Jônatas o amava com todo o amor da sua alma” (1 Sm 20:17).

Com o passar do tempo, tanto Saul como Jônatas têm mortes vio­ lentas e trágicas. Davi se torna rei; e, muitos anos depois, mergulha numa armadilha de carnalidade, adultério, assassinato e hipocrisia despudorada. Não é de surpreender que isto tenha cobrado um preço terrível de sua liderança. Outro amigo fiel surge, porém, das sombras,

390 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Natã, homem igualmente sensível e atencioso. O papel de Nata é dife­ rente do de Jônatas. Ele é usado pelo Senhor para confrontar o amigo e ajudá-lo a restaurar a sua integridade. Natã prende a atenção de Davi e faz com que o seu coração se volte para Deus em arrependimento since­ ro. Todos precisam de um Jônatas. Todos precisam de um Natã. Qual­ quer que seja o nosso papel, é importante permanecermos atenciosos e sensíveis. Saber quando chegar, como reagir e o que dizer ao falar.

Esmagado pela sua situação, Jó finalmente explode. Não conse­ gue mais se reprimir. Abre a boca em crises de frustração. Amaldiçoa o dia em que nasceu. Retrocede nove meses e despreza o momento em que foi concebido. Tudo é despejado num excesso de palavras.

Pereça o dia em que nasci e a noite em que se disse: Foi conce­ bido um homem! Converta-se aquele dia em trevas; e Deus, lá de cima, não tenha cuidado dele, nem resplandeça sobre ele a luz. Reclamem-no as trevas e a sombra de morte; habitem sobre ele nuvens; espante-o tudo o que pode enegrecer o dia.

Jó 3:3-5

A seguir, amaldiçoa o fato de não ter morrido ao nascer.

Por que não morri eu na madre? Por que não expirei ao sair dela? Por que houve regaço que me acolhesse? E por que peitos, para que eu mamasse? Porque já agora repousaria tranquilo; dormiria, e, então, haveria para mim descanso.

Jó 3:11-13

Com isso, ele despeja o resto de sua frustração:

Aquilo que temo me sobrevêm, e o que receio me acontece. Não tenho descanso, nem sossego, nem repouso, e já me vem grande perturbação.

Jó 3:25, 26

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 391

Essas são exclamações de um homem que chegou ao limite de suas forças: perdeu tudo. Sua saúde se foi, resultando em dores indescritíveis, e o sofrimento não termina. Os filhos continuam mortos. Não há dinheiro suficiente para prover o que falta. O ambiente em que se encontra é atroz. Sua mulher está também ali, embora desilu­ dida, sugerindo que desista de tudo. Agora bastai Até um homem íntegro tem o seu limite. Jó deve ter terminado sua explosão verbal com a cabeça nas mãos, soluçando em tom audível.

Nesse ponto os amigos se transformaram em verdadeiros abutres e começaram a alimentar-se freneticamente. Reações tão impróprias nos fornecem uma sexta lição: É fácil ocupar a posição de lançadores, como no futebol americano, na manhã de segunda-feira quando enfren­ tamos a raiva de outra pessoa. Admito que não é fácil ouvir as coisas ditas por Jó. Não estando em seu lugar, sem sentir a sua dor, sem conhecer seus pensamentos ou medos — a resposta mais natural imaginável é reagir:

“Eu nunca diria isso — e ele não devia dizerf’

“Eu nunca faria o que ele fez — e ele não devia fazer?’

“Eu sempre diria e faria isso - e ele devia fazer!”

Tudo isso leva ao seguinte conselho: “Jó, não diga isso. Vai arre­ pender-se mais tarde!” O fato, entretanto, é que é ele quem está sofrendo. E ele quem está no calor da batalha. Ele está lá, e não eles. Eles apenas pensavam que sabiam o que iriam dizer ou fazer.

Os lançadores da manhã de segunda-feira pensam: “Eu nunca reagiria desse modo. Eu nunca diria essas palavras a Deus.” Vem a seguir o argumento decisivo: “Eu responderia desta maneira: como ela pode afirmar ser cristã e agir desse jeito? Se fosse o Senhor, eu a disciplinaria por causa disso.”

Os lançadores da segunda-feira são notórios por saber tudo e apontar cada erro! (Nós nem sequer esperamos pela manhã de segun­ da-feira.) “Não dê esse passe, seu tolo! Vão interceptá-lo se você fizer o arremesso — não! (Interceptação) Não! Quando você vai acordar?', assim gritamos para o jogo na televisão. E a maioria de nós nunca foi

392 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

lançador. Nunca certamente tivemos homens com morte nos olhos e os dentes à mostra, correndo a toda velocidade em nossa direção — sorrindo. Nós dizemos: “Não atire isso, seu bobo! Não atire! Se eu estivesse lá, não teria atirado.”

Pare com tanta asneira. Vamos concordar em permitir ao nosso amigo Jó espaço para desabafar sem ter de ouvir a nossa preleção. Vai ajudar se lembrarmos de coisas que não deveríamos ter dito. Nós também dissemos coisas erradas ou impróprias. Nós também respon­ demos inadequadamente no calor da situação. Nós também falamos demais. Atiramos interceptações verbais. Nessas ocasiões, não preci­ samos de ninguém para apontar nosso erro, pois logo percebemos o que fizemos. Podemos até ter pensado naquela hora: “Vou arrepender-me disto”. Mas, mesmo assim, fomos em frente.

Você vai precisar desta lição. Vai precisar deste princípio, espe­ cialmente se for um líder espiritual, se ensinar um curso bíblico para adultos, se for conselheiro de uma igreja, ou um pastor da equipe. O mundo está repleto de sentenças dogmáticas do tipo “Eu avisei” ou “Você não devia "ou “Não faça isso”. Fique quieto. Ore em silêncio. Tente ao máximo imaginar o sofrimento do outro.

Elifaz pula sobre Jó com ambos os pés. Os punhos se levantam — primeiro round, segundo round, terceiro round, atacando Jó. A seguir é Bildade quem bate nele, depois Zofar. Nenhum desses indivíduos jamais passou pelos problemas enfrentados por Jó. Eles, portanto, despejam todos os seus “bons conselhos”. As amizades não suportam a tensão de um excesso de “bons conselhos” por muito tempo.

Não precisamos ser realmente lembrados de que Jó viu o erro da sua atitude no final. O que ele faz então? Reconhece abertamente o fato: “(eu) me abomino e me arrependo” (Jó 42:6). Que grande homem! Ele sofreu tanta coisa durante tanto tempo. Semanas? Talvez meses? Tempo demais! Afinal, depois de provar ser um homem de perseverança heróica, o Senhor chama Jó de seu “servo” (quatro vezes). A seguir, repreende os amigos que prejudi­ caram tanto a situação.

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO 393

Tendo o S enhor falado estas palavras a Jó, o S enhor disse também a Elifaz, o temanita: A minha ira se acendeu contra ti e contra os teus dois amigos; porque não dissestes de mim o que era reto, como o meu servo Jó.

Jó 42:7

Como já vimos antes, o Senhor recompensou fartamente seu servo por ter mantido a sua integridade, assim como seu espírito submisso. Mas, principalmente, Deus honrou Jó por causa da sua paciência fiel, que oferece nossa sétima e última lição digna de nota: Cultivar a perseverança obediente é um sinal supremo da maturidade. Uma das metas principais dos cristãos íntegros, sadios, é a esperança de chegar à maturidade antes que a morte os leve. Posso dizer, sem hesitação, que um de meus alvos prioritários na vida é crescer à medida que envelheço. Um epitáfio meritório numa lápide seria: “Aqui jaz um homem que continuou crescendo enquanto envelhecia.” Crescer e envelhecer devem andar de mãos dadas. Nunca duvide disto: o ama­ durecimento é um processo lento, árduo. Jó conseguiu realizá-lo; alcançou esse alvo. Não é de admirar que lemos que ele morreu velho e farto de dias. Ele viveu o resto de seus anos (mais 140) cheio de entusiasmo e paixão. Que maneira invejável de terminar a vida!

Quando as dificuldades chegam, temos duas opções. Podemos vê-las como uma intrusão, um ultraje, ou como uma oportunidade para responder em obediência específica à vontade de Deus. Esta é a virtude austera que Tiago chama de “perseverança”.

A perseverança não é uma resignação de dentes cerrados, nem uma aquiescência passiva. É “uma longa obediência sempre na mes­ ma direção”. E permanecer no caminho da obediência apesar das contra-indicações. É uma determinação firme de perseguir a santida­ de quando as suas condições não são favoráveis. E uma escolha de fazer o que Deus nos pediu em meio ao nosso sofrimento, o que quer que seja e por quanto tempo seja. Ele nos pede isso. Oswald Chambers escreveu: “Escolher o sofrimento é algo sem sentido; escolher a vonta­ de de Deus em meio ao nosso sofrimento faz todo o sentido do mundo. ”4

394 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

O CAMINHO A SEGUIR

Onde você está hoje? Para onde a sua viagem vai levá-lo? Mais impor­ tante ainda, que opção escolheu? Você está considerando a sua prova­ ção como um ultraje ou uma oportunidade? Tente não se esquecer da lista das sete lições ensinadas por Jó a nosso próprio respeito. Você mantém um diário? Caso mantenha, tenho uma sugestão prática. Releia este capítulo e transfira as sete lições para uma página do seu diário. Reflita sobre a sua situação atual e aplique as que forem apro­ priadas. Volte a essa página quase todos os meses. Fará uma diferença enorme. À medida que envelhecer, você vai continuar crescendo. Em vez de simplesmente ler sobre a vida de Jó, você vai começar a viver essa vida.

Isto faz todo o sentido do mundo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O que a jornada de Jó revelou a você sobre os seus próprios limites, fragilidades e a real condição do seu coração?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante do sofrimento, que ilusões a seu próprio respeito Deus tem desfeito, levando você a uma humildade mais honesta?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o que Jó aprendeu sobre si mesmo ajuda você a se ver com mais verdade diante de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 29;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Que Jó Nos Ensina Sobre o Nosso Deus$t$, 29,
$conteudo$comunicação clara é essencial. As pessoas certas elevem comuni­ car as coisas certas aos receptores certos. Quando esses três ele­ mentos não estão alinhados, o tiro sai pela culatra.

Um casal de Mineápolis resolveu aproveitar um fim de semana prolongado na Flórida ensolarada para descongelar de um inverno particularmente gélido. Em vista de ambos trabalharem muito em suas profissões, não conseguiram combinar seus horários de viagem. Decidiram então que o marido voaria para a Flórida na quinta-feira e ela no dia seguinte. Depois de chegar como planejado, ele foi para um hotel. Uma vez no quarto, abriu seu computador do tipo laptop para enviar um rápido e-mail para a mulher em Mineápolis. Todavia, deixou acidentalmente de colocar uma letra no endereço eletrônico dela e enviou a mensagem sem perceber o erro.

Em Houston, uma viúva acabara de voltar do enterro do ma­ rido. Ele tinha sido ministro do evangelho durante vários anos quando foi subitamente “chamado para casa”, depois de um ata­ que cardíaco.

396 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Solitária, esperando encontrar consolo nas mensagens de condo­ lências de alguns parentes e amigos, a viúva sentou-se para verificar seus e-mails. Depois de ler a primeira mensagem, ela caiu desmaiada no chão. O filho correu para o quarto, encontrou a mãe inconsciente e olhou então para a tela do computador, onde se lia:

Para: Minha amada esposa

De: Seu marido que partiu

Assunto: Cheguei!

Acabei de chegar e já me registrei. Tudo correu em ordem depois da minha partida. Verifiquei também que tudo foi preparado para a sua chegada amanhã. Fico então aguar­ dando você.

Espero que sua viagem seja tão tranquila quanto a minha.

P.S. Aqui está quente demais!1

A comunicação falha pode levar a sérios mal-entendidos. Isso tam­ bém se aplica à verdade bíblica. Quando informação correta chega aos ouvidos de alguém incapaz de compreendê-la, a confusão se instala — especialmente se o receptor não entende o contexto em que as Escrituras foram escritas.

Cynthia e eu temos um casal de amigos excelentes que, há mui­ tos anos, estavam passando os feriados natalinos com o fdho. Logo depois dos feriados, o pai decidiu que os três iriam ler a Bíblia inteira no ano seguinte. Fariam isso em família e, portanto, a cada manhã os três iriam sentar-se juntos e continuar sua viagem pelas Escrituras.

Como é natural, eles começaram pelo livro de Génesis. Não demorou para lerem que Adão e sua mulher estavam nus e não se envergonhavam. O garoto franziu a testa, abaixou os olhos e ouviu em silêncio. Um pouco depois, Adão teve relações com a esposa, e a Bíblia diz que ela deu à luz um fdho. Não muitos parágrafos além, o fdho mais velho assassinou o mais moço. No quinto capítulo, Adão teve novamente relações com a mulher, e ela concebeu outro fdho

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 397 chamado Sete. O filho deles passa agora o tempo constantemente sentado com a cabeça baixa. Em seguida, chegaram à história de Noé e do Dilúvio que provocou a destruição do mundo. Mas a história de Noé, como você deve se lembrar, termina de maneira vergonhosa quando ele se embriaga e se despe em sua tenda. Seu filho entra e vê a nudez do pai. Noé morre num contexto escurecido pelo pecado, vergonha e fracasso.

Alguns dias mais tarde, eles estavam lendo o capítulo 19 de Génesis sobre Sodoma e Gomorra. Foi a gota d’água! O filho ex­ clamou: “Pare! Papai, eu deveria estar ouvindo tudo isso?”

Você e eu sabemos que não havia nada de errado com o que estava sendo lido, mas, aos ouvidos de uma criança, ela não podia senão perguntar-se: “O que significam todas essas coisas estranhas na Bíblia?”

Os cristãos recém-convertidos podem ter a mesma reação. A ver­ dade das Escrituras pode tornar-se confusa para eles, especialmente quando Deus está envolvido em eventos extraordinários. Você pode imaginar um cristão recém-convertido, que não conhece muito sobre o nosso Pai celestial, perguntando: “Por que um Deus bom permiti­ ria que seu povo escolhido, os judeus, vivesse mais de 400 anos como escravos no Egito? Por que um Deus bondoso faria isso? Por que um Deus amoroso ordenaria a destruição de todos os cananeus quando Josué e seus companheiros hebreus invadiram a terra, a começar de Jericó? Por que cada um deles tinha de ser morto? E como um Deus santo poderia chamar Davi de ‘homem segundo o meu coração’, mesmo que ele viesse a ser mais tarde culpado de adultério e assassi­ nato e, de fato, fosse polígamo? E mais estranheza: como um Deus compassivo, amoroso, poderia permitir que um homem reto e fiel como Jó sofresse como sofreu?”

Os mal-entendidos fazem muitas pessoas desconfiarem de Deus. Se ele é tão cheio de compaixão e justiça, se quer que o busquemos quando estamos em dificuldades, por que aprovaria algo tão cruel quanto os males que Satanás fez cair sobre Jó? São perguntas difíceis.

398 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Talvez devamos deixar que Jó fale por si mesmo. O que ele pensa? Uma vez que foi ele que suportou tudo, é sensato aprender o que Jó nos ensinaria sobre Deus.

Em vez de transformar este capítulo num tratado teológico longo e complicado com base nas muitas seções do Livro de Jó, penso que seria útil limitarmos nossos pensamentos ao último capítulo. Como fiz no capítulo anterior, tenho sete lições específicas que penso que Jó nos ensinaria sobre o nosso Deus, se estivesse vivo hoje. Ficamos gra­ tos porque as suas palavras inspiradas foram preservadas para todos lerem. Mediante a pena de Jó, podemos compreender ainda melhor o nosso Deus.

SETE LIÇÕES SOBRE O NOSSO DEUS

Jó ficou em silêncio durante toda a extensa mensagem de Deus. Ela começa no capítulo 38 e não termina até o fim do capítulo 41. É muito interessante, mas Deus nunca responde às perguntas de Jó. Nao chega nem perto dessas questões. Em vez disso, você deve estar lembrado que ele acompanha Jó ao redor do universo e para dentro do mar, apresentando-o a vários animais do campo e várias aves do ar. Embora Deus não responda às perguntas de Jó, antes do final do livro o homem com os tumores está se curvando em submissão diante dele. Aquele que permitiu, na verdade, aprovou pessoalmente o que aconteceu a seu servo Jó, não oferece respostas às perguntas específicas do homem. Todavia, repito, Jó se submete humildemente. Ele certa­ mente aprendeu algumas coisas sobre Deus que precisamos saber. Embora nós, como Jó, não vamos ter todas as nossas perguntas respondidas (ou mesmo a maioria), mesmo assim há muito a apren­ der do servo de Deus. Vou esforçar-me ao máximo para fazer uma comunicação clara. Tudo o que peço é que você concentre toda a sua atenção neste último trecho da viagem.

Bem sei que tudo podes, e nenhum dos teus planos pode ser frustrado.

Jó 42:2

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 399

A primeira lição que Jó nos ensina: Não há nada que Deus não possa fazer. Ao ouvir e compreender o poder ilimitado do seu Deus infinito, Jó declara a sua realização nos termos mais simples: “Bem sei que tudo podes”. Em outras palavras, Deus é “onipotente”. A primeira parte desta palavra interessante, oni, significa “tudo”. E, como é claro, potente significa “poderoso” ou “eficaz”. Deus é TodoPoderoso. Isto confirma que ele não tem limitações, não precisa de aprovação, que nenhum obstáculo impede de forma alguma as suas atividades. Seus atos seguem o seu curso sem resistência. As obras de nosso Pai celestial são sempre e completamente efetivas.

Em termos teológicos:

Deus, o Senhor Onipotente, pode fazer qualquer coisa di­ fícil com a mesma facilidade com que realiza as coisas mais simples, porque tem em suas mãos todo o poder do universo. Todos os seus atos são feitos sem esforço. Ele não desgasta a sua energia nem precisa recuperar forças, nem buscar fora de si mesmo uma renocação de poder. Todo o poder está plenamente contido dentro do seu próprio ser infinito.2

Apesar de as palavras serem um tanto técnicas, considero úteis esses comentários ampliados. O ponto é claro: o poder de Deus é infinito e independente, auto-energizado e nunca exaurido. Ele cria do nada sem qualquer diminuição de energia. Sustenta a vida sem precisar de ajuda. Dá e tira a vida. Ressuscita dentre os mortos aqueles que deseja ressuscitar sem qualquer resistência. Refreia a criatura mais poderosa já criada (Satanás) sem conflito ou restrição. Nada se opõe a Deus. Nada impede a obra de Deus. Nada altera o plano divino. Só ele merece ser descrito como “terrível”.

Nós depreciamos essa palavra pelo uso excessivo. Ela foi aplicada a tudo que achamos intrigante. Os sistemas de som são agora terrí­ veis, assim como os video games. Quando no passado foi construído o primeiro carro Datsun Z, a propaganda dizia que era um automóvel

400 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

terrível. Lembro-me de ter ido ao showroom e olhado para ele. Quanto mais eu olhava tanto menos terrível me parecia. Tinha quatro rodas como todos os outros carros. Tinha duas portas, um volante, um painel - tudo era padrão. Era pequeno! De fato, me­ nor do que todos os outros carros em que eu conseguira entrar. Seu m otor não era terrível, embora a propaganda continuasse afir­ mando que era.

Nada disso. Só o nosso Deus onipotente é terrível.

Quatro vezes nas Escrituras (Jr 32:17; Jr 32:27; Lc 1:37; Lc 18:27), lemos que nada é impossível para Deus. Isso então define o termo terrível.

Encontramos uma segunda verdade que vale a pena ser lembrada quando lemos o final da primeira frase de Jó.

Nenhum dos teus planos pode ser frustrado.

Jó 42:2

Qual é esta lição? É impossível frustrar os propósitos de Deus. Nas palavras de Jó encontramos a palavra frustrar. As prioridades de Deus jamais são frustradas. O termo hebreu deriva do verbo que significa “cor­ tar”. “Nenhum dos teus planos pode ser cortado.” O propósito de Deus não pode ser bloqueado, restringido ou detido. As intenções de Deus não podem ser alteradas ou interrompidas. O que ele decide irá ocorrer sem demora, sem impedimento e sem falta. Tudo o que acontece nesta terra se enquadra exatamente no que Deus determi­ nou. Exatamente. Nada do que ocorre é uma reação de última hora, tapa-buraco; portanto, ele nunca é surpreendido.

O que quer que aconteça se desenrola precisamente como plane­ jou em sua onisciência. Com ele, as coisas que acontecem na Terra nunca ficam fora de controle.

Quero lembrar você das palavras de um rei da antiguidade que se recuperou da loucura e compreendeu que o Deus vivo estava cumprindo o seu propósito na vida dele.

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 401

Todos os moradores da terra são por ele reputados em nada; e, segundo a sua vontade, ele opera com o exército do céu e os moradores da terra; não há quem lhe possa deter a mão, nem lhe dizer: Que fazes?

Daniel 4:35

“Não há quem lhe possa deter a mão” é outra maneira de dizer: “Nenhum dos planos de Deus pode ser frustrado.” Ninguém pode cancelar a agenda de Deus. Ninguém pode restringi-lo ou impedir que seu plano siga o curso predeterminado. Não tenha receio desta grande doutrina! Se você é como eu, vai aprender a encontrar confor­ to nela.

Jó não se recuperou de um período de insanidade, mas suportou um longo episódio de perda e humilhação, sofrimento e dor física e emocional. Foi rebaixado ao nível de um sem-teto, tendo sido antes o maior dos homens do Oriente. Jó está do outro lado de tudo isso e só agora começa a compreender (atente nisto) que mesmo sem ter qual­ quer de suas perguntas respondida, está à mercê deste grande Deus, cujo propósito não pode ser frustrado. Ele continua sendo Aquele que faz tudo bem. A submissão de Jó resultou desse discernimento. Embora suas perguntas não tivessem sido explicadas, ele sabe que pode confiar no seu Deus.

Isto nos leva a uma terceira lição digna de nota: Os planos de Deus estão além da nossa compreensão e são muito profundos para ser explicados.

Quem é aquele, como disseste, que sem conhecimento enco­ bre o conselho? Na verdade, falei do que não entendia; coisas maravilhosas demais para mim, coisas que eu não conhecia.

Jó 42:3

Em outras palavras: “Tagarelei sobre coisas muito superiores ao meu entendimento; disse trivialidades a respeito de coisas que estão fora da minha compreensão” (MSG — Tradução Livre).

402 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

É preciso humildade para dizer isso.

Se você me pedisse para dizer qual a essência da mensagem do Livro de Jó, eu responderia que lesse Jó 42:3. Neste ponto da histó­ ria, Jó começa a compreender que os planos de Deus estão além da nossa compreensão e são profundos demais para serem explicados.

Não hesite em admitir que há ocasiões em que nos sentimos realmente desapontados com Deus. Quero dizer: afinal de contas, fizemos o que é certo, por todas as razões certas, mas veja no que resultou! Como ele pôde ter permitido tal coisa? Em vista de Deus ter-se revelado bom e justo, compassivo e amoroso, aguardamos que responda de maneira condizente com o seu caráter (como o entendemos). Mas ele nao “corresponde”.

Philip Yancey trata disto com franqueza e sinceridade:

Posso pensar em algumas coisas úteis que Deus podia ter dito: “Jó, lamento mesmo, lamento profundamente o que aconteceu. Você suportou muitas tribulações injustas por minha causa, e estou orgulhoso de você. Você não imagina o que isso significa para mim e até mesmo para o universo.” Uns poucos elogios, uma dose de compaixão ou, no míni­ mo, uma rápida explicação do que ocorreu “nos bastidores” do mundo invisível - qualquer destas coisas teria dado al­ gum consolo a Jó.

Deus nao diz nada parecido. Sua “resposta”, na realidade, consiste mais de perguntas do que de respostas. Deixando de lado trinta e cinco capítulos de debates sobre o proble­ ma da dor, ele se lança a um magnífico passeio verbal pelo mundo da natureza. Parece que ele guia Jó através de uma galeria particular de suas obras prediletas, demorando-se com orgulho junto a dioramas de cabras montesas, jumen­ tos selvagens, avestruzes e águias, falando como se estivesse atónito pelas suas próprias criações. A beleza da poesia e o final de Jó rivalizam com o que há de melhor na literatura mundial. Entretanto, mesmo enquanto me maravilho diante

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 403 da ofuscante descrição que Deus faz do mundo natural, uma sensação de perplexidade se infiltra. Essas palavras são rele­ vantes? E, dentre todos os instantes, por que Deus escolheu justo esse para ministrar a Jó um curso de aperfeiçoamento sobre a vida selvagem?

No livro Wishfull Thinking (“Pensando Desejosamente”), Frederick Buechner resume bem a fala de Deus. “Deus não explica; explode. Pergunta a Jó quem ele pensa que é. Ele diz que tentar explicar o tipo de coisas que Jó quer saber seria como tentar explicar Einstein a um insignificante ma­ risco... Deus não revela seu magnífico projeto. Ele revela a si próprio.” A mensagem por detrás da estupenda poesia resume-se a isto: “Até que você saiba um pouco mais sobre dirigir o universo físico, Jó, não me diga como dirigir o uni­ verso moral.”

“Deus, por que estás me tratando de modo tão injusto?”, Jó choramingou o livro inteiro. “Põe-te no meu lugar.”

“NÃO!!!”, Deus troveja em resposta. “Ponha-se você em meu lugar! Até que você possa dar lições sobre como fazer o Sol se levantar a cada dia, ou espalhar os relâmpagos, ou como projetar um hipopótamo, não julgue como eu dirijo o mundo. Apenas cale-se e ouça.”

O impacto da fala de Deus em Jó é quase tão surpreendente quanto a própria fala. Embora Deus nunca responda a uma sequer pergunta acerca da miséria de Jó, a rajada da tempes­ tade o desmonta. Ele se arrepende no pó e na cinza, e todos os vestígios de decepção com Deus se desfazem.3

Deus, provavelmente, não explica a si mesmo porque conhecer e com­ preender o seu caminho talvez não nos ajude muito. Pare e pense: o fato de sabermos o porquê será realmente útil? O sofrimento passa se soubermos as suas causas? Nosso mundo está cheio de catástrofes devastadoras: balas atiradas a esmo por pistoleiros ocultos, aviões se

404 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

chocando com prédios altos, envenenamento deliberado de pes­ soas idosas nas casas de repouso, estupradores e assassinos em sé­ rie, mães que matam todos os filhos, secas e fomes, mulheres que atropelam os maridos com seus carros, sacerdotes que molestam meninos inocentes, pregadores fraudulentos e fingidos, gerentes que tiram proveito injusto de seus empregados. A lista não tem fim. Como Deus pode permitir tais coisas? Ajudaria mesmo saber o porquê? Num mundo caído, cheio de indivíduos depravados que podem pôr em prática seus piores pensamentos, isso mudaria o que está errado?

Vou avançar um pouco mais. Deus talvez não explique a si mesmo por que somos incapazes de compreender as suas respostas. Uma vez que ele vive de modo completamente diverso do nosso e se encontra numa esfera muito além da nossa compreensão (a nossa sendo tangível e limitada pelo espaço e tempo, dentro das fronteiras rígidas de todas as leis físicas), como poderíamos possivelmente compreender? Nenhuma das nossas limitações se aplica a ele. O que então nos capacitaria a entender o seu plano?

O que nos incomoda é que ele não age como nós pensamos que deveria agir. Não faz o que nossos pais terrenos fariam em circunstâncias similares. Enquanto falamos no assunto, onde ele estava quando seu Filho foi crucificado? Para surpresa de muitos (a maioria?), ele estava lá todo o tempo, executando seu plano divino para a nossa salvação. Enquanto o processo transcorria, os próprios discípulos de Jesus não compreenderam - foram as pes­ soas mais desiludidas do planeta. Você se lembra do que eles esta­ vam pensando? Imaginavam como tinham podido acreditar num embuste. De sua perspectiva de mexilhão, a morte do seu Mestre não fazia sentido.

Sabe o que Jó finalmente percebeu? Ele vê Deus, e isso basta. Não vê as respostas. Está num lugar em que não precisa de respostas. Teve um vislumbre do Todo-Poderoso, e isso foi suficiente.

Há uma quarta lição digna de ser lembrada. Só mediante as ins­ truções de Deus podemos humilhar-nos e descansar na sua vontade.

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 405

Escuta-me, pois, havias dito, e eu falarei; eu te perguntarei, e tu me ensinarás. Eu te conhecia só de ouvir, mas agora os meus olhos te vêem. Por isso, me abomino e me arrependo no pó e na cinza.

Jó 42:4-6

Tome nota especial das palavras de Jó. Ele não responde: “Tenho algo que quero discutir aqui.” Pelo contrário, diz: “Me abomino e me arrependo”. Não há força divina. Não há ameaça ou censura de Deus. “Jó, se você não ficar de joelhos e pedir misericórdia a mim, vou acabar com você!

Não. Em submissão mansa e resignada, Jó entrega o seu caso à vontade de Deus. Ele diz: “Tu me instruirás e, como resultado da tua instrução, irei submeter-me e aceitá-la.” Sabe do que gosto na atitude de Jó? (Leia isto cuidadosamente.) Há uma ausência de reivindicações sobre os “meus direitos”. Não há sequer uma alusão a prerrogativas pessoais. Não há expectativa ou exigência; nem sequer um pedido para Deus compreendê-lo ou defendê-lo diante de seus amigos inclinados às discussões. Além disso, não há autopiedade, nem um espírito taciturno, deprimido. Ele está absolutamente tranquilo. Em seu íntimo, ele se encontra, finalmente, em paz.

Você talvez diga: “Se Deus tivesse me abençoado como aben­ çoou Jó, eu também diria isso.” Espere. Ele ainda não recebeu alívio ou recompensa. O homem continua coberto de tumores. Ainda não tem uma família. Continua sem-teto e falido. Sem que nada tivesse mudado externamente, Jó diz, baixinho: “Senhor, eu sou teu.”

Pedi a você que lesse o conselho de Pedro no capítulo anterior e peço que repita agora:

Humilhai-vos, portanto, sob a poderosa mão de Deus, para que ele, em tempo oportuno, vos exalte, lançando

406 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

sobre ele toda a vossa ansiedade, porque ele tem cuidado de vós.

1 Pedro 5:6, 7

Preste atenção na idéia de tempo oportuno. Não se humilhe depois de ele tê-lo exaltado, mas humilhe-se agora. Não espere. Recue, deixe de discutir e descanse nele. E notável como Deus irá tranquilizar o seu espírito e transportá-lo para uma esfera de contentamento que nunca conheceu antes, mesmo que a maioria das respostas esteja fal­ tando. Os filósofos deste mundo exigem respostas. O crente aprendeu agora, por meio desta experiência cataclísmica, a confiar sem exigir nada. E as preocupações desaparecem, uma após outra.

Você se lembra do meu comentário anterior sobre o verdadeiro arrependimento: um coração contrito não faz exigências e não tem expectativas? Foi assim com Jó — neste ponto, bem agora. E uma visão belíssima. Quero acrescentar que essa não é uma prerrogativa de Jó, você também pode reivindicá-la.

Estamos preparados para uma quinta lição: Quando chega o dia do acerto de contas, Deus é sempre justo. Você se lembra de outro comentário anterior? Nem todas as contas de Deus são acertadas no fim do mês. Chegamos ao lugar que estávamos esperando. Vamos chamá-lo de mesa do “Ajuste de Contas” de Deus. Com paciência e generosidade, Deus tem observado tudo, tomando nota de quem está dizendo o quê. Nenhuma palavra despreocupada foge à atenção dele, pois sabe tanto o que foi dito por quem, quanto também o porquê. Sabe quem falou e quem não falou a verdade. Ele lida com os transgressores em sua mesa de “Ajuste de Contas”. Abençoa os que andaram em sua companhia. Perdoa os que levam ofertas e se humilham diante dele. Deus restaura. Deus recom­ pensa. Deus honra Jó que orou pelos seus amigos com sincerida­ de. Deus notou tudo. Sugiro que você sublinhe Hebreus 6:10 em sua Bíblia: “Porque Deus não é injusto para ficar esquecido do vosso trabalho e do amor que evidenciastes para com o seu nome, pois servistes e ainda servis aos santos” (Hb 6:10 ). Eugene Peterson,

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 407 em The Message, interpreta essas primeiras palavras: “Deus nao deixa passar nada”.

Alguns que estão lendo minhas palavras foram terrivelmente abusados. Foram vítimas do pior tipo de maus tratos. Alguém em quem confiavam se aproveitou de vocês. Foram abandonados pelo cônjuge. Tratados injustamente. Alguém os explorou. Perderam uma fortuna por meio de um esquema fraudulento. Cada um de nós poderia contar histórias de abuso e negligência, declaração falsa e tratamento injusto. Essas coisas nunca serão corrigidas. Volte-se então para esta grande verdade: Deus não esquece. Ele só não ajusta o seu plano à nossa agenda. Sua mesa de “Ajuste de Contas” não funciona das nove às cinco horas: Ele não cuida do nosso caso quando queremos que o faça. Minha vontade era que Deus calasse Elifaz no momento em que ele atirou o seu primeiro insulto contra Jó. Ele esperou, no entanto, através de todos os discursos sarcásticos; ficou silencioso durante todos os insultos. Finalmente, diz: “Elifaz, Bildade e Zofar, vocês estavam errados. ”

Jó esperou todo esse tempo para ser justificado. Lembra-se de como isso aconteceu? Sem fanfarras:

Tendo o S enhor falado estas palavras a Jó, o S enhor disse também a Elifaz, o temanita: A minha ira se acendeu contra ti e contra os teus dois amigos; porque não dissestes de mim o que era reto, como o meu servo Jó.

Jó 42:7

Deus ouviu! Sim, ele ouviu! Não disse nada no momento, mas escutou tudo. Não é injusto para esquecer uma única palavra ociosa. Posso assegurar-lhe também que ele não passou por cima de qualquer ato errado cometido contra você. Seu plano é perfeito e está-se desenro­ lando. Quando sua agenda diz: “Agora”, a justiça correrá e sua mesa de “Ajuste de Contas” vai agir rapidamente.

O arranjo de Deus para as coisas não é um plano frustrado. Deus não está sentado na beirada do céu, roendo as unhas, imaginando o

408 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

que fará sobre o nosso mundo. Ele sabe exatamente o que vai fazer e quando vai fazer. Jó vê isso claramente — agora. Ele compreende afinal que Deus nao perde nada de vista.

A sexta lição é maravilhosamente encorajadora: Ninguém se com­ para a Deus quando se trata de bênçãos.

Então, foram Elifaz, o temanita, e Bildade, o suíta, e Zofar, o naamatita, e fizeram como o S en h o r lhes ordenara; e o S enhor aceitou a oração de Jó. Mudou o S enhor a sorte de Jó, quando este orava pelos seus amigos; e o S enhor deu-lhe o dobro de tudo o que antes possuíra. Então, vieram a ele todos os seus irmãos, e todas as suas irmãs, e todos quantos dantes o conheceram, e comeram com ele em sua casa, e se condoeram dele, e o consolaram de todo o mal que o S enhor lhe havia enviado; cada um lhe deu dinheiro e um anel de ouro. Assim, abençoou o S en h o r o último estado de Jó mais do que o primeiro; porque veio a ter catorze mil ovelhas, seis mil camelos, mil juntas de bois e mil jumentas. Também teve outros sete filhos e três filhas.

Em toda aquela terra não se acharam mulheres tão formo­ sas como as filhas de Jó; e seu pai lhes deu herança entre seus irmãos.

Jó 42:9-13, 15

Você leu a passagem depressa demais? O fim do versículo 9? Marque. “O S en h o r aceitou.” E depois: “O S e n h o r mudou . Fim do versículo 10: “O S en h o r deu-lhe o dobro”. Início do versículo 12: “O S e n h o r abençoou”. Essas são palavras de graça, declarações de favor divino. Permita que elas causem um impacto completo:

Aceitou. Mudou. Deu-lhe o dobro.

Abençoou.

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 409

Em vista da decadência de nossa sociedade cética, você e eu estamos sendo programados para passar por alto pelas palavras de graça e bênção e nos apressar em direção às palavras negativas. Elas nos desanimam. Mortes no emprego. Mofo em sua casa. Desastres naturais. Famílias separadas. Pragas nas árvores. Incêndio nas flores­ tas. Alta porcentagem de divórcios. Desastres económicos. Atos de terrorismo. Gente sem teto. Ministros corruptos. Corações partidos. Maus tratos de crianças. Violência contra as mulheres. Drogas. Pais vadios. Mortes prematuras. Construtores fraudulentos. Aumento do desemprego. Escândalos entre executivos e atletas famosos. E assim por diante. É isso que enche os noticiários da noite.

Nunca ouvimos: “Amanhã à noite vamos apresentar apenas boas notícias.” Em vez disso: “Fique ligado: se você acha que essa notícia foi má, em breve faremos uma exposição completa.”

Quero dizer, mesmo que o homem do tempo anuncie “parcial­ mente nublado”, ele nunca diz: “Amanhã o dia será praticamente ensolarado.” Há sempre uma possibilidade de 20% de chuva. Ele nunca afirma: “Mas, provavelmente, não vai chover.”

Além disso, suas previsões estão quase sempre erradas. Chega de tudo isso!

Quem Deus abençoa? Jó! Esta lição que aprendemos de Jó é uma ótima notícia! Você não deve ter se esquecido de que Jó amal­ diçoou o dia em que nasceu, não é? Ou que se ressentiu do fato de não ter morrido quando o puseram nos braços da mãe para ser amamentado? Foi ele também que disse: “Não estou à vontade. Não estou tranquilo.” Em outras palavras: “Me ressinto do que aconteceu.” Esse é o mesmo Jó que foi maravilhosamente abençoa­ do no final do livro. Por quê? Graça, graça, graça, graça, graça!

Nós não obtemos graça - absolutamente, não. Você trabalha duro, obtém uma promoção. Trabalha ainda mais, obtém uma pro­ moção maior. Excede-se no trabalho, passa a gerir a empresa. Pode então tirar proveito das pessoas que trabalham, trabalham duro e se matam de trabalhar. E assim que um mundo perdido pensa. A graça chega e diz: “Você está doente hoje? Vou abençoá-lo poderosamente.

410 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Não está muito bem? Vou abençoá-lo grandemente. Você errou? Está arrependido? Vou abençoar você.” Isso porque a graça não es­ pera pelo resultado do trabalho.

Uma de minhas maiores mensagens é sobre a graça. Você pode pensar que tenho uma vida fabulosa porque prego a respeito da graça.

Antes que se acomode nesse pensamento, quero compartilhar com você uma página de minha vida muito normal. Fui ao super­ mercado outro dia. Uma das coisas em minha lista era uma dúzia de ovos. Meu alvo era colocá-los no carrinho, pagar por eles e colocá-los na geladeira antes de o Dr. Ken Cooper me apanhar comprando os ovos. Coloquei então rapidamente as sacolas no carrinho, transferi-as para o carro e fiz um esforço sobre-humano para levar as seis sacolas de uma vez para dentro de casa.

Tratava-se da velha economia de movimentos — uma só viagem para um homem de verdade. Por que fazer três viagens com sucesso, quando uma viagem praticamente impossível dará no mesmo? (Fui informado de que isto é uma coisa tipicamente masculina: cérebro direito-cérebro esquerdo.)

A esta altura você provavelmente já entendeu. Em algum ponto do processo de segurar seis sacolas, tive de descobrir como colocar a chave na fechadura da nossa porta, abrir rapidamente a porta e desligar o alarme, tudo isso simultaneamente, enquanto fazia malabarismos com as seis sacolas. Posso agora afirmar que não há meios de isso dar certo! A lei de Murphy nos diz que alguma coisa tem de ceder. E se alguma coisa tem de ceder, que sacola você acha que seria? Certo! A que continha a dúzia de ovos. Senti pena de mim mesmo enquanto limpava a massa pegajosa no chão, mas finalmente levantei-me e con­ segui andar sem escorregar.

Cheguei até a geladeira para guardar o remanescente lamentá­ vel dos doze ovos originais e, supondo que a bandeja de ovos estava vazia, não fui tão cuidadoso quanto deveria ser quando ainda há ovos no recipiente. Mais uma vez, OMELETE DE TRÊS OVOS POR TO D O O CHÃO! Contei a Cynthia que aquele era um novo método de limpar o chão. Deixei que secasse para ver se era possível

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 411 raspar. Por ser um marido cumpridor de seus deveres como sou, não podia mentir. Além disso, minha mulher não ia mesmo acreditar. Portanto, decidi fazer o que era certo e limpar a sujeira.

Mas que falta de sorte! Havia ainda um ovo na bandeja. Eu havia salvo esse único ovo. Aproximei-me então hesitante e cuidadosamen­ te do precioso ovo remanescente. E ELE QUEBROU EM MINHA MÃO E ESCORREU ATÉ O COTOVELO!

EU O PERDI! PERDI DE UMA VEZ!

Minha esposa ouviu a agitação, entrou na cozinha e perguntou: “O que aconteceu? Posso ajudar?” Que hora inconveniente! Todavia, respondi em uma voz moderadamente irritada: “NÃO! TU DO SOB CONTROLE!”

Limpei então a desordem; e sabe de uma coisa? Eu não merecia viver até o dia seguinte. Mas acordei no outro dia maravilhosamente abençoado. Por quê?

Graça, graça, maravilhosa graça. O Livro de Jó ensina sobre gra­ ça. Quando Deus abençoa Jó, ele não abençoa um homem perfeito, mas imperfeito. Se fosse perfeito, não estaria se arrependendo. Se tivesse dito a coisa certa, nao estaria se retratando. Quando vamos entender? Por causa da sua graça, Deus nos abençoa maravilhosa­ mente. Ele faz isso melhor do que ninguém!

Jó não conseguia acreditar. Os tumores haviam desaparecido. Logo em seguida ouve uma batida na porta; são dois sujeitos que precisam de emprego. Eles conhecem outros três que também estão desempre­ gados. Em breve tem bastante dinheiro em mãos e emprega esses ho­ mens. Levanta os olhos e vê os camelos voltando. Os empregados estão construindo seus prédios e uma nova casa está sendo reconstruída. A esposa lhe diz certa manhã: “Estamos começando de novo!” Ela faz isso dez vezes. (Pare, Senhor, pare. Isso basta.) Você sabe o resto.

Depois disto, viveu Jó cento e quarenta anos; e viu a seus filhos e aos filhos de seus filhos, até à quarta geração. Então, morreu Jó, velho e farto de dias.

Jó 42:16, 17

412 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Deixe a música começar! Os últimos anos de Jó são imensamente satisfatórios, o que nos leva à sétima lição. Aqui vamos nós: Só Deus pode preencher nossos últimos anos com música divina que nos permite viver acima de nossas circunstâncias. O favor imerecido de Deus nos liberta. Ele nos capacita a viver plenamente para ele.

Jó entende finalmente a verdade, e esta o liberta. Ele fica livre da prisão dos seus receios; livre da diminuta célula do pensamento limitado e das atitudes negativas; livre dos ressentimentos; livre da necessidade de saber a razão. Ele está livre, finalmente livre! Graças ao Deus Altíssimo, livre para viver outros 140 anos envolvido pela música do Mestre. Filhos, netos, bisnetos, todos ao seu redor. É algo tão maravilhoso que ele mal se lembra de todos aqueles tumores que o maltrataram há tantos anos. Como é diferente o caminho a seguir! É o tipo de música que só Deus pode enviar.

Algumas pessoas da sua idade estavam lutando contra a demência. Outras batalhando com a perda crescente de memória. Alguns de seus pares sentiam-se fisicamente incapazes de manter-se, sentindose abandonados na prateleira quando eram antes envolvidos pela vida. Mas não Jó. Ele terminou bem, sua vida foi farta de dias, sentia entusiasmo pela idéia do amanhã, preocupação com a música divina que o libertara.

Você se lembra de um filme premiado, Um Sonho de Liberdade? É um grande filme, porque faz você pensar. Ele também leva você para além das celas da prisão daqueles homens. Tim Robbins desem­ penha o papel de um homem de espírito livre chamado Andy. Ele está em companhia de outros prisioneiros, todos lutando contra a brutalidade para continuarem apegados à sua humanidade. Andy passa os dias esculpindo peças de jogo de xadrez em pedra. Ele pede ao Estado livros para a biblioteca da prisão, a fim de ajudar os demais reclusos a obterem seus diplomas da escola secundária. Essas são ape­ nas duas das maneiras como Andy se agarra à sua condição humana.

Outra idéia criativa custou-lhe duas semanas na solitária, como você deve estar lembrado. Ele consegue acessar o sistema de som da prisão e toca um disco de música de ópera para todos ouvirem pela

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS 413 primeira vez. Enquanto a música clássica flui através das celas, banheiros e pátio da prisão, os prisioneiros estacam e ficam prati­ camente paralisados.

O ator Morgan Freeman, amigo de Andy e narrador da história, diz o seguinte sobre esse momento.

Não tenho até hoje idéia do que aquelas duas senhoras ita­ lianas estavam cantando. A verdade é que nem quero saber. Algumas coisas são melhores quando não ditas. Gostaria de pensar que cantavam sobre algo tão lindo que não pode ser expresso em palavras e que faz seu coração doer. Posso afirmar que aquelas vozes subiam cada vez mais alto e alcançavam mais longe do que qualquer pessoa naquele grande lugar ousava sonhar. Era como se um belíssimo pássaro entrasse na prisão de Alexandre e fizesse as paredes se dissolverem. E pelo mais breve dos momentos, cada homem em Shawshank sentiu-se livre.4

E isso que a música de Deus faz para nós quando terminamos bem a nossa vida. Da mesma forma que Jó, estamos finalmente livres.

Nossa jornada com Jó terminou, mas a nossa amizade continuará para sempre. Jó morre velho e farto de dias. Ele passou a conhecer realmente o Deus vivo, não apesar do seu sofrimento, mas por causa dele. O sofrimento o fez cair de joelhos onde finalmente rendeu-se diante de Deus. Em absoluta confiança, descansou nele.

Convido você para confiar nele agora na prisão das suas circuns­ tâncias. Deixe Deus ser Deus. Lembre-se fiel e regularmente de que você não está no controle. Limitado, pecador, incapaz de libertar-se, convido você para a Cruz. E ali que seus fardos são removidos e onde a música do Senhor começa. Vá para ele hoje. Deixe que a música principie. E uma canção de amor que convida você para entrar.

Obrigado, Pai, por tua presença fiel.

Obrigado por teus caminhos misteriosos.

414 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Entregamos a ti as lições que começamos a aprender.

Obrigado pelo amigo que conhecemos nas páginas deste livro... pelas coisas que nos ensinou.

Acima de tudo, obrigado pela perseverança heróica que ele modelou.

Obrigado pela tua graça, que nos levanta acima e além dos muros da prisão e nos dá uma canção para cantar — uma canção que nos liberta dos sofrimentos e de nós mesmos.

No nome inigualável de Cristo, nosso Senhor.

Amém.

sofrimento não só provoca impacto na pessoa, como toca todos que estão na família dela. Dependendo da extensão do problema, essa família não volta a ser a mesma.

O

George MacDonald escreve eloquentemente sobre isto:

Algumas vezes um raio despenca do céu azul; e algumas vezes na vida de uma família harmoniosa, sem aviso de uma tempestade em formação, algo terrível acontece. A partir desse momento tudo parece mudado. Essa família não é mais exatamente o que era antes. Deveria ser melhor, mas está talvez danificada.

O resultado depende da família em si e da sua reação à tempestade invasora. Sua espiritualidade fica para sempre alterada depois disso. Mas, para a família que crê em Deus, essas catástrofes assustadoras só chegam quando podem ser transformadas para o bem na vida dessa família e na vida de outros tocados por ela.1

416 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

Durante vinte e dois capítulos vimos não só um homem cuja vida foi atingida por um “raio”, como também uma família — a famí­ lia de Jó. Vimos os danos que essas “catástrofes espantosas” causaram a ele e aos outros membros da família. Sua história nos comoveu profundamente, e, portanto, somos gratos por ela ter sido preservada nas Escrituras para nosso benefício e para o proveito de outros nas gerações vindouras. O sofrimento que ele passou — que eles passaram — tornou-se uma tábua de esperança sobre a qual podemos ficar de pé, preparando-nos para enfrentar alguma “tempestade invasora” que possa estar se formando e que deve ainda cair.

Em minhas palavras de encerramento, quero tratar do tema muito real do impacto causado a uma família pelos “raios” caídos de um céu claro. Sem entrar em detalhes específicos, posso afirmar a verdade das palavras de MacDonald. Na década passada, minha família e eu fomos atingidos várias vezes por provações que correspondem a essa descrição. Elas nos magoaram e feriram, pro­ duzindo mudanças que nunca teríamos esperado. Sem desejar ser melodramático, gostaria de acrescentar que às vezes imaginamos seriamente se iríamos sobreviver à invasão de nova tempestade... e então ela se abatia sobre nós, açoitando-nos, fazendo-nos camba­ lear debaixo da rajada forte e repentina.

Isso talvez explique por que fui atraído tão magneticamente pela história de Jó. Identifiquei-me de imediato com a rapidez e devastação dos ataques, embora não os tenha certamente sofrido no mesmo nível que ele. Mesmo assim, os nossos golpes foram profun­ dos e frequentes. Eles nos forçaram a fazer exatamente as coisas que insisti que você fizesse enquanto lia esses capítulos.

E possível que se lembre de várias delas: manter a integridade aconteça o que acontecer; aceitar o desafio de mudar; manter uma perspectiva vertical clara; pensar teologicamente; recusar-se a ques­ tionar o propósito soberano de Deus; submeter-se à vontade dele; não esperar compreender seus caminhos misteriosos; contar com a justiça de Deus na hora oportuna; humilhar-se sob a mão poderosa do Senhor; ter a certeza de que ele tudo vê; descansar satisfeito no

CONCLUSÃO 417

seu plano; lembrar-se de que num dia ainda futuro ele irá recompensálo fartamente.

Essas não são simples diretrizes teóricas obtidas da vida de Jó; são princípios fundamentais que mantiveram os Swindolls de pé durante anos! Somos apenas humanos — não temos habilidades sobrenaturais em nós mesmos. Como todos os demais nesta terra, somos imperfeitos, limitados em nossa compreensão e deficientes em nossas próprias forças. Desse modo, ao escrever este livro, minha família e eu ganhamos uma nova esperança para prosseguir.

Da mesma forma que você, não temos meios de saber o que o amanhã nos trará, mas, se houver qualquer semelhança com o passa­ do, mais tormentas virão. Elas nos farão cair novamente de joelhos, forçando-nos a confiar nele, embora não possamos entender a razão para ter permitido tal coisa. Assim como Jó, cremos nele de todo coração, queremos andar em obediência diante dele, e nosso maior desejo é dar maior glória ao seu nome.

Isto os membros da família Swindoll sabem — e temos de agra­ decer a Jó por nos ensinar:

Mas ele sabe o nosso caminho;

Quando nos provar, sairemos nós como o ouro.

Nossos pés seguiram as suas pisadas;

Guardamos o seu caminho e não nos desviamos dele.

Do mandamento de seus lábios nunca nos apartamos;

Preservamos como um tesouro as palavras da sua boca

Mais do que o alimento que nos é necessário.

Nossas vidas estão nas suas mãos. Se o nosso futuro incluir novas “catástrofes terríveis”, iremos suportá-las com paciência heróica. Se a reaçao de nossa família influenciar para o bem a vida de outros, inclusive a sua, essa será a recompensa suficiente.

N otas

INTRODUÇÃO

1. G ib b o n , P. H. /l Call to Heroism. Nova York: Atlantic Monthly Press, 2001, p. 184. Usado com permissão.

CAPÍTULO UM:

PREPARANDO O PALCO PARA O DESASTRE

1. C a r ly l e , T. “Heroes and Hero Worship, Lecture II, 8 de maio de 1840, The Hero as Prophet. Mahomet: Islam”, Domínio público.

2. P e t e r s o n , E. H. “Introduction to Job”, em The Message. Colorado Springs: NavPress, 2002, p. 839. Usado com permissão.

4. M c G e e, J. V. Job. Nashville: Thomas Nelson Publishers, 1991, p. 14.

420 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

5. A n d e r s e n , F. I .Job: Tyndale O T Commentary Series. Londres: InterVarsity Press, 1976, p. 80. Usado com permissão da InterVarsity Press, P.O. Box 1400, Downers Grove, IL 60515. www.ivpress.com.

CAPÍTULO DOIS

CAMBALEANDO E SE RECUPERANDO DE NOTÍCIAS DEVASTADORAS

1. B e a m e r, L. Let’s Roll. Wheaton, IL: Tyndale House Publishers, 2002. Usado com permissão.

3 . Y a n c e y , P. Decepcionado com Deus. São Paulo, SP: Mundo Cristão, 2004, pp. 171, 172, I I a ed. Usado com permissão da The Zondervan Corporation.

4. D oré, G. Job Hearing o f His Ruin (woodcut circa 1860). Domínio público.

5 . W h y te , A. Old Testament Characters, Vol. 1. Londres: Oliphants, Ltd., 1952, p. 379. Domínio público.

6. História de Ray Stedman como contada ao Dr. Charles R. Swindoll.

7. A n d e r s e n , F. I .Job: Tyndale O T Commentary Series. Londres: InterVarsity Press, 1976, p. 89. Usado com permissão da InterVarsity Press, P.O. Box 1400, Downers Grove, IL 60515. www.ivpress.com.

CAPÍTULO TRÊS

SATANÁS VS. JÓ... SEGUNDO ROUND

1. S te d m a n , R. C. “The Johnny Gunther Story”, como conta­ da em Adventuring Through the Bible. Grand Rapids: Discovery House Publishers, 1997, p. 245. Usado com permissão de Discovery House Publishers, Box 3566, Grand Rapids, MI 49501. Todos os direitos reservados.

NOTAS 421

2. W ie r s b e , W. Be Patient. Colorado Springs: Chariot Victor Publishing, 1991, p. 19.

3. A l d e n , R. The New American Commentary. Nashville: Broadman & Holman Publishers, 1993, pp. 67, 68. Usado com permissão.

4. A n d e r s e n , F. I .Job: Tyndale OT Commentary Series. Londres: InterVarsity Press, 1976, pp. 93, 94. Usado com permissão da InterVarsity Press, P.O. Box 1400, Downers Grove, IL 60515. www.ivpress.com.

5. Ibidem, p. 94. Usado com permissão.

CAPITULO QUATRO

CONSELHO DE JÓ AOS MARIDOS E AMIGOS

1. W h y te , A. Old Testament Characters. Grand Rapids: Kregel Publications, 1990, p. 379. Domínio publico.

2. Fonte desconhecida.

3. ELDREDGE, J. Wild at Heart. Nashville: Thomas Nelson Publishers, 2001, p. 137. Reimpresso com permissão de Thomas Nelson, Inc. Todos os direitos reservados.

4. G ib b o n , P. H. A Call to Heroism. Nova York: Grove/Atlantic: Atlantic Monthly Press, 2002, p. 182.

5 . A n d e r s e n , F. I. Job: Tyndale O T Commentary Series. Londres: InterVarsity Press 1976, p. 93. Usado com permissão da InterVarsity Press, P.O. Box 1400, Downers Grove, IL 60515. www. ivp ress. co m.

6. “20 Years is All It Takes”, em um e-mail para Chuck Swindoll, 2002, www.crazydoodle.com/jokes/20years.html.

7 . H a r t l e y , J. E. The Book of Job (NICOT). Grand Rapids: William B. Eerdmans Publishing Company, 1988, p. 85. Usado com permissão.

422 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

9. P e t e r s o n , E. H. “Introduction to Job”, em The Message. Colorado Springs: NavPress, 2002, p. 840. Usado com permissão.

10. B ay ly , J. The Last Thing We Talk About. Colorado Springs: David C. Cook Publishing, 1973, pp. 55, 56.

CAPÍTULO CINCO

O LAMENTO TRISTE DE UM HOM EM INFELIZ

1. História do Capelão Bill Bryan como contada a Chuck Swindoll no banquete do Seminário Teológico Dallas. Usado com permissão.

2. Z a n d e r , R. & Z a n d e r , B. The A rt o f Possibility. Boston: Harvard Business School Press, 2000, pp. 44, 45. Permissão para reproduzir garantida pela Harvard Business School Publishing.

3. S p u r g e o n , C. H. “ The Minister’s Fainting Fits” de Preleções aos meus alunos. Grand Rapids, MI: Zondervan Publishing House, 9a impressão, 1970, pp. 155, 156. Domínio Público

4. A l d e n , R. The New American Commentary. Broadman & Holman Publishers, 1993, p. 71. Usado com permissão.

5 . H a r t l e y , J . E. The Book o f Job (NICOT). Grand Rapids, MI: William B. Eerdmans Publishing Company, 1988, p. 101. Usado com permissão.

6. Dennis Guernsey story. Usado com permissão.

CAPÍTULO SEIS

RESPONDENDO AOS MAUS CONSELHOS

1. L i t t l e t o n , M . R. “Where Job’s Comforters Went Wrong” de When God Seems Far Away. Wheaton, IL : Harold Shaw, 1987, pp. 79-88. Usado com permissão de Harold Shaw Publishers em Sitting With Job, publicado por Roy B. Zuck. Grand Rapids, M I : Baker Book House, s.d., p. 2 5 6

NOTAS 423

CAPÍTULO SETE

CONTINUANDO O DUELO VERBAL

1 . G r e e n , W . H . Conflict andTriumph: The Argument ofthe Book o f Job Unfolded. Carlisle, PA: Banner of Truth Trust, 1999, pp. 54, 55. Usado com permissão, Banner ofTruth: Carlisle, PA 17013.

2 . M e n c k e n , H. L. The Divine Afflatus. Nova York, NY: New York Evening Mail, 1917, p. 155.

3. “Oh To Be Six Again” (iRealms Internet 2003). www.irealms.com.za. Usado com permissão.

4. M o r g a n , G. C. The Answer o f Jesus to Job. Westwood, NJ: Fleming H. Revell Company, 1964, pp. 24-27. Usado com permissão.

CAPÍTULO OITO

QUANDO A CENSURA E A RESISTÊNCIA COLIDEM

1. W ie rs b e , W . Be Patient. Colorado Springs, CO: Cook Commu­ nication, 1991, p. 46.

2. C rabb Jr., L. J. Chega de Regras. São Paulo: M undo Cristão, 2003, pp. 205, 206.

3. L ew is, C. S. A Grief Observed. Nova York, NY: Harper & Row, Publishers, 1961, pp. 17, 18. C. S. Lewis Pte. Ltd. 1961. Usado com permissão.

CAPÍTULO NOVE

PALAVRAS MALDOSAS PARA UM SOFREDOR

1. “Going to Shout All Over God’s Heaven”, Negro spiritual. Domínio público.

2. B a n d e r m a n , D. “GrAce” (Hannibal, M O: Christianity Today.com, 2002) www.gospel.com.net/peggiesplace/tnt 222.htm. Usado com permissão.

424 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

3. História de Lucy Mabery Foster, conforme relatada por Chuck Swindoll. Usado com permissão.

4. H a r t l e y , J. E. The Book o f Job (NICOT). Grand Rapids, MI: William B. Eerdman Publishing Company, 1988, p. 257. Usado com permissão.

5. L e w is, C. S. A G rief Observed. Nova York, NY: Harper & Row, Publishers, 1961, p. 9. C. S. Lewis Pte Ltd. Usado com permissão.

6. “Going to Shout All Over God’s Heaven”, Negro spiritual. Domínio público.

7 . Y a n c e y , P. Decepcionado com Deus. São Paulo: M undo Cristão, 2004, pp. 203, 204.

8. “Amazing Grace”, John Newton. Domínio público.

CAPITULO DEZ

GARANTIA DE ESPERANÇA PARA O AGREDIDO

E INSULTADO

1. K ra m e s , J. A. The Rumsfeld Way: Leaderships Wisdom o f a Battle Hardened Maverick. Nova York, NY: McGraw-Hill, 2002, p. 123

2. Ibid., p. 123

3. The Economist, 25 St. James’s Street, London SWiAiHG, Reino Unido.

4. “The Builder”, Autor desconhecido.

6. “The Ticket” (O Bilhete), uma história sobre Albert Einstein, contada pelo Dr. Billy Graham num discurso feito em Charlote, Carolina do Norte, e reimpressa como parte do discurso do Dr. Graham no The Leadership Journal, primavera de 2003. Fonte da história original desconhecida.

NOTAS 425

CAPITULO ONZE

RESPONDENDO COM SABEDORIAÀS FALSAS ACUSAÇÕES

1. “The Saint” http://www.jokecenter.com/jokes/Religion/ 6755.htm.l4k. Anónimo.

2 . Sanders, J. O. Spiritual Leadership. Chicago: Moody Publishers, 1994, p. 111. Usado com permissão.

3. Coronel Blacker, Oliver's Advice, 1834, citado por John Bartlett, Familiar Quotations, 10a ed., 1919. Domínio público.

4. Fonte desconhecida. Domínio público.

5. História “What Good News Do We Have for This Guy”. Fonte desconhecida.

6. Abraham Lincoln, numa carta ao Secretário Stanton, datada de 18 de julho de 1864, na qual ele se recusou a demitir Montgomery Blair, Diretor Geral dos Correios, como citado por John Bartlett, em Familiar Quotations, 10a ed., 1919. Domínio público.

7. História baseada nas experiências do Dr. Joel Filartiga e seu filho Joelito no Paraguai, em 1976. http://www.pbs.org/wnet/ justice/law_background_filartiga.html.

CAPITULO DOZE

COM O ENFRENTARAS CRITICAS COM CLASSE

1. Hemingway, E. Definição de “coragem” numa entrevista com Dorothy Parker, New Yorker (30/11/1929). Em The Columbia World o f Quotations (Nova York: 1996).

2. Martinho Lutero. Domínio público.

3. P h illips, D. T. Lincoln on Leadership: Executive Strategies for Tough Times. Nova York: Warner Books, 1992, pp. 66, 67.

4. H ayw ard, S. F. Churchill on Leadership: Executive Success in the Face o f Adversity. Rocklin: Forum, Prima Publishing, 1997, pp. 121, 122. Usado com permissão de Prima Publishing, uma divisão da Random House, Inc.

426 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

5 . R o p e r , D. Elijah, A Man Like Us. Grand Rapids: Discovery House Publishers, 1998, pp. 126, 127. Usado com permis­ são da Discovery House Publishers, Box 3566, Grand Rapids, Michigan 49501. Todos os direitos reservados.

6. W iersb e, W Be Patient. Colorado Springs: Cook Communications, 1991, p. 91.

8. História “Someone With Skin On”. Fonte desconhecida.

9. R o p e r, D. Elijah, A Man Like Us. Grand Rapids: Discovery House Publishers, 1998, pp. 88, 89, citando São João da Cruz. Usado com permissão da Discovery House Publishers, Box 3566, Grand Rapids, Michigan 49501. Todos os direi­ tos reservados.

10. Pascal, B. Domínio público.

11. H a r t l e y , J. E. The Book o f Job (NICOT). Grand Rapids: William B. Eerdmans Publishing Company, 1988, p. 354. Usado com permissão.

12. R o p e r , D. Elijah, A M an Like Us. Grand Rapids: Dis­ covery House Publishers, 1998, pp. 116, 117. Usado com permissão da Discovery House Publishers, Box 3566, Grand Rapids, M ichigan 49501. Todos os direitos reservados.

CAPÍTULO TREZE

A FUTILIDADE DE DESENROSCAR O INESCRUTÁVEL

1. S w in d o ll, C. The FinishingTouch: Becoming God’s Masterpiece. Nashville: Word Publishing, 1994, pp. 276, 277. Usado com permissão.

2. Fonte desconhecida.

3 . T o z e r , A. W. Mais Perto de Deus: Os atributos de Deus e seus significados na vida cristã. São Paulo: Mundo Cristão, 2000, 5a ed., pp. 15, 17.

NOTAS 427

4. Teacher in the 21st Century, http://www.pipforschools.com./ teacher 21st century.html. Fonte desconhecida.

5. Fonte desconhecida.

6. T o zer, A. W Mais Perto de Deus: Os atributos de Deus e seus significados na vida crista. São Paulo: Mundo Cristão, 2000, 5a ed., pp. 8-11.

CAPÍTULO QUATORZE

NOVO COMPROMISSO COMAS COISAS IMPORTANTES

1. P iper, J. Brothers We Are Not Professionals. Nashville: Broadman & Holman Publishers, 2002, p. ix. Usado com permissão.

2. Spurgeon, C. H. Fonte desconhecida. Domínio publico.

3. B auer, G . L. “End of Day” (11/09/2002). Usado com permissão.

4. L ow ell, J. R. “The Present Crisis”, de John Barlett, Familiar Quotations, 15a ed., 6a Impressão. Boston: Little, Brown, and Company, 1937), p. 567. Domínio público.

5. Testemunho pessoal de Homer Stewart. Usado com permissão.

6. P ete rso n , E. H. “Introduction to Job”, em The Message. Colorado Springs: NavPress, 2002, pp. 841, 842. Usado com permissão.

CAPÍTULO QUINZE

O TESTEMUNHO FERVOROSO DE UM INOCENTE

1. G ergen, D. Eyewitness to Power. Nova York, NY: Touchstone, 2000. Citação do Senador Alan Simpson. Domínio público.

2. Zuck, R. B. Job. Chicago: Moody Publishers, 1978, p. 133. Usado com permissão.

3 . W esley, C. “And Can It Be?” Domínio público.

428 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

CAPÍTULO DEZESSEIS

OUTRO M ONÓLOGO DEMORADO

1. A t k i n s o n , D. The Message o f Job: Suffering and Grace - “The Bible Speaks Today Series”. Downers Grove: InterVarsity Press, 1991, p. 122. Usado com permissão da InterVarsity Press, P.O. Box 1400, Downers Grove, IL 60515. www.ivpress.com.

2 . H a r t l e y , J . E. The Book o f Job (NICOT). Grand Rapids: William B. Eerdmans Publishing Company, 1988, pp. 446, 447. Usado com permissão.

3. História “Since God Is Taking My Picture”. Fonte desconhecida.

4. B a r n h o u s e , D. G. Let Me Illustrate: More Than 400 Stones, Anecdotes, and Illustrations. Grand Rapids: Fleming H. Revell, 1994, pp. 132, 133.

CAPÍTULO DEZESSETE

UMA REPROVAÇÃO SEVERA DO TODO-PODEROSO

1. G a e b e le in , F. E. (editor). “Job”, The Expositor’s Bible Commentary, Volume 7. Grand Rapids: The Zondervan Corporation, 1985, p. 462.

2. A tk i n s o n , D. The Message o f Job: Suffering and Grace — a The Bible Speaks Today Series”. Downers Grove: InterVarsity Press, 1991, pp. 145-147. Usado com permissão da Inter­ Varsity Press, P.O. Box 1400, Downers Grove, IL 60515. www.ivpress.com.

3. Ibidem, p. 147. Usado com permissão.

4. A l d e n , R. “Job”. The New American Commentary. Nashville: Broadman & Holman Publishers, 1993, p. 71. Usado com permissão.

NOTAS 429

of Truth Trust, 1975, p. 91. Usado com permissão de Banner ofTruth, Carlisle, PA 17013.

6. In rig , G. True North. Grand Rapids: Discovery House Publishers, 2002, pp. 142, 143. Usado com permissão da Discovery House Publishers, Box 3566, Grand Rapids, MI 49501. Todos os direitos reservados.

CAPÍTULO DEZOITO

PLENO ARREPENDIMENTO PELOS MOTIVOS CERTOS

1. Best Lawyer Story. Alteredbeast Forums. Autor desconhecido, http://www. alteredbeast. org / vb/showthread. php ? t= 508

2. H a rtle y , J. E. The Book o f Job (NICOT). Grand Rapids: William B. Eerdmans Publishing Company, 1988, p. 537. Usado com permissão.

CAPÍTULO DEZENOVE

FINALMENTE:. .CHEGA A JUSTIÇA

1. Faber, F. W. “There’s a Wideness in God’s Mercy”, 1854. Domínio público.

2. N ew ell, W. R. “At Calvary” 1895. Domínio público.

CAPÍTULO VINTE

E JÓ VIVEU FELIZ PARA SEMPRE... SERA?

1. W heeler, O. Citado por Glen Wheeler, em 1010 Illustrations, Poems and Quotes. Cincinnati: Standard Publishing, 1967, p. 14.

2. M a c A rth u r, D., em seu 75° aniversário, citado por Glen Wheeler, 1010 Illustrations, Poems and Quotes. Cincinnati: Standard Publishing, 1967, p. 15.

3. S w indoll, C. R. Tale o f the Tardy Oxcart. Nashville: Word Publishing, 1998, p. 28.

4. “17th Century Nun’s Prayer.” Fonte desconhecida.

430 JÓ: UM HOMEM DE TOLERÂNCIA HERÓICA

CAPÍTULO VINTE E UM

O QUE JÓ NOS ENSINA A NOSSO PRÓPRIO RESPEITO

1. “How Do You Decide Who to Marry?” www.ozjokes.com. Autor desconhecido.

2. Z a n d e r , R. & Z a n d e r , B. The A rt o f Possibility. Boston: Harvard Business School Publishing Corporation, 2000, pp. 118, 119. Reimpresso com permissão da Harvard Business School Press. Todos os direitos reservados.

3. A n d e r s e n , F. l.Job: Tyndale O T Commentary Series. Londres: InterVarsity Press, 1976, pp. 93, 94. Usado com permissão da InterVarsity Press, P.O. Box 1400, Downers Grove, IL 60515. www.ivpress.com.

4. R o p e r, D. Growing Slowly Wise: Building a Faith That Works. Grand Rapids: Discovery House Publishers, 2000, pp. 26, 27. Usado com permissão de Discovery House Publishers, Box 3566, Grand Rapids, MI 49501. Todos os direitos reservados.

CAPÍTULO VINTE E DOIS

O QUE JÓ NOS ENSINA SOBRE O NOSSO DEUS

1. “Couple from Minnesota.” Autor desconhecido.

2. T o z e r , A . W. Mais Perto de Deus: Os atributos de Deus e seus significados na vida crista. São Paulo: Mundo Cristão, 2000, pp. 82, 83.

3. Y a n c e y , P. Decepcionado com Deus. São Paulo: Mundo Cristão, pp. 202, 203, 11a ed.

4 . G ir e , K. The Reflective Life: Becoming More Spiritually Sensitive to the Everyday Moments o f Life. Colorado Springs: Chariot Victor Publishing, 1998.

CONCLUSÃO

1. M a c D o n a l d , G. The Curate’s Awakening. Bloomington: Bethany House Publishers, 1985, p. 60.

PARABÉNS!

Você acaba de ler mais um livro publicado por uma editora que faz diferença no mercado editorial. Caso tenha algum comentário ou sugestão, escreva, citando o livro que leu, para:

W\

EDITORA M UNDO CRISTÃO Caixa Postal 21.257, CEP: 04602-970 São Paulo - SP

Caso queira conhecer outros livros da Editora Mundo Cristão, visite nosso site na Internet através do seguinte endereço:

www.mundocristao.com.br

(. ..continuação)

Para Chuck, Swindoll, um estudo cuidadoso do Livro de Jó revela ao leitor o perfil de um personagem cujas experiências e reaçôes às mais duras provas o credenciam ao título de autêntico herói da fé. Um homem firme e corajoso, se­ guro e confiante em seu relaciona­ mento com Deus. “Porque nin­ guém há na terra semelhante a ele, homem íntegro e reto” (Jó 1:8).

C h a r l e s R . S w i n d o l l é pastor da Stonebriar Community Church e chanceler do Seminário Teológico de Dallas. Seu programa Insight for Living é transmitido por centenas de emissoras de rádio. Ele escreveu mais de trinta bestsellers, como Lide­ rança em Tempos de Crise, O Misté­ rio da Vontade de Deus, Perseveran­ ça e a série “Heróis da Fé”, que inclui Paulo - Um Homem, de Coragem e Graça; Davi. - Um Homem Segundo o Coração de Deus; e Moisés - Um Homem Dedicado e Generoso, entre outros títulos.

Capa: Douglas Lucas

Bastou esta palavra para que o diabo se sentisse novamente desafiado a se rebelar contra a soberania e o conhecimento de Deus. Ansioso por lutar mais um round de sua batalha inútil e vã, Satanás propôs ao Criador submeter a fidelidade de Jó à prova, tirandolhe a família, os bens e até a saúde.

Foi assim que um homem de coração reto e justo viu-se diante da mais arrasadora experiência de perdas e danos registrada no Antigo Testamento. Não bastassem suas catástrofes pessoais, ainda se viu achacado por aqueles que considerava seus amigos.

No entanto, dessas mesmas provações emergiu um novo Jó - uma pessoa renovada, levantada do pó com uma fé ainda mais vigorosa, e que a história tratou de tornar um exemplo para todas as gerações seguintes até o dia de hoje.

Jó - Um Homem de Tolerância Heróica é o novo título da série “Heróis da fé”, na qual Chuck Swindoll dedica-se a traçar o perfil dos personagens bíblicos que se notabilizaram pela atitude de confiança irrestrita e incondicional em Deus, mesmo quando submetidos aos mais duros testes de fidelidade espiritual.

ISBN 85-7325-382-7$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Depois de toda a jornada de Jó, que verdade sobre o caráter de Deus ficou mais firme no seu coração?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como conhecer a soberania, a justiça e a bondade de Deus muda a maneira de você atravessar os seus próprios sofrimentos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se a história de Jó aponta para um Deus digno de confiança mesmo no silêncio, você está disposto a confiar nele com aquilo que ainda não entende?$p$, 'reflexao', null);
  end if;

end $migration$;
