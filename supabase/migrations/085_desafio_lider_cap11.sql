-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 11 — Terminando bem a carreira (aula ordem = 11)
--
-- Localiza o curso já criado pela migration 058 (slug
-- 'o-desafio-de-todo-lider') e insere a aula no ordem do
-- capítulo, com as perguntas do Desafio Prático como reflexões.
--
-- Cabeçalhos de seção em CAIXA ALTA para renderizarem como
-- títulos (ver ehTitulo() em components/AulaConteudo.tsx).
-- Notas de rodapé bibliográficas e frase de destaque
-- decorativa omitidas, como nos demais capítulos.
--
-- Idempotente: pode ser reaplicada sem duplicar aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos
  where slug = 'o-desafio-de-todo-lider';

  if v_curso_id is null then
    raise exception 'Curso o-desafio-de-todo-lider não encontrado. Aplique a migration 058 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 11 — Terminando bem a carreira
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 11;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 11 — Terminando bem a carreira',
      11,
$conteudo$Existe uma verdade comum a todos os seres humanos: todos, mais cedo ou mais tarde, haveremos de concluir a nossa jornada. Como nos preparamos para cruzar a linha final da vida é o que faz o diferencial entre os que a completam bem e todos as outras pessoas. Terminar bem a carreira significa manter a excelência em cada decisão e ação, deixando um legado de liderança eficiente e resultados duradouros.

Salomão nos deixou um bom princípio nesta área. Ele disse: "O fim das coisas é melhor que seu início" (Ec 7.8). É uma conclusão bem-sucedida que confere alegria e um sentido de propósito cumprido na vida da pessoa.

Paulo desejava terminar bem. Ele deixou muito claro, em sua conversa com os presbíteros da igreja de Éfeso (At 20.24), que não mediria esforços para completar bem a carreira da sua vida. A pergunta que temos de fazer é a seguinte: Ele alcançou o seu objetivo? Quando estava prestes a morrer, ele confessou a Timóteo, seu filho na fé, que havia combatido o bom combate e completado a carreira (2Tm 4.7).

Como haveremos de completar a nossa jornada com excelência é a questão-chave que precisamos responder, porque isso determinará o tipo de legado que deixaremos para a próxima geração. Legado não se resume a dinheiro ou bens, ele também inclui características, hábitos e atitudes que são sociais, físicos, mentais, emocionais e espirituais. Em essência, "tudo que possuímos hoje, seja bom ou ruim, é o nosso legado. Isto é o que passaremos para os outros que virão depois de nós". O líder deixa o legado de seu exemplo de vida e também o legado daquilo que alcançou em sua vida e ministério.

Porém, nem todos os líderes conseguem terminar sua carreira como deveriam ou gostariam.

CONCLUSÃO PRECOCE

Alguns líderes são precocemente removidos de suas posições devido a martírios, assassinatos, denúncias proféticas, mortes em combate, sanções em função de problemas de integridade, problemas familiares, política, entre outros fatores. Alguns destes cortes podem ser traçados diretamente a Deus, enquanto outros são atos resultantes de situações pecaminosas.

A Bíblia menciona muitos casos assim, como Absalão, Abimeleque, Sansão, João Batista e Tiago. Alguns foram bons líderes, outros, maus. Alguns foram removidos de sua posição em razão da pecaminosidade em que viviam; outros, por circunstâncias diversas da vida. Nem todas essas conclusões antecipadas foram marcadas por experiências negativas; alguns desses nomes terminaram a vida maravilhosamente.

CONCLUSÃO MEDÍOCRE

Este é o tipo de conclusão no qual a última fase do ministério do líder se torna um fracasso.

A pessoa vai bem por determinado período de seu ministério, o que pode ser observado pelo seu relacionamento pessoal com Deus e com os outros, bem como pela sua produção ministerial. Mas, de repente, essa pessoa apaga-se, terminando mal a sua carreira. A corrida é concluída, porém, sem o brilho que era esperado. Veja, por exemplo, o que aconteceu com Saul, Eli e Salomão. O primeiro havia sido escolhido e ungido por Deus para liderar Israel. Depois de um início promissor, a soberba, a inveja e o abuso de poder o corromperam, o que terminou o seu reinado em um profundo estado de mediocridade.

Eli ia muito bem em seu ministério até que permitiu que os seus filhos perversos fizessem Israel prostituir-se. A conclusão do seu ministério foi medíocre, com mortes, grandes tristezas e desapontamentos.

Mas Salomão talvez seja o exemplo mais dramático de todos. Ele iniciou o seu ministério cheio de possibilidades e sabedoria. Deus estava com ele. Contudo, o mais sábio de todos os reis deu lugar à vaidade, lascívia e cobiça. Ele terminou a sua vida com a Bíblia dizendo que as suas muitas mulheres incrédulas fizeram com que o seu coração se pervertesse e caísse em idolatria. Tal fato gerou a manifestação da ira de Deus sobre ele (1Rs 11).

Normalmente, o que acontece nesse tipo de conclusão medíocre é que o líder, em um determinado momento de sua vida, começa ser reprovado nos testes da integridade, da obediência e da Palavra. Sua influência positiva anula-se, os problemas se multiplicam, e ele entra nesta espiral descendente, frustrando o potencial que tinha de ser abençoador a outros.

CONCLUSÃO RAZOÁVEL

A conclusão razoável refere-se àqueles líderes que chegam ao final da vida tendo um bom desempenho, mas que não foram capazes de desenvolver o seu potencial em toda a sua plenitude. Seus ministérios tornaram-se limitados devido a decisões equivocadas e a pecados cometidos. Eles não completaram o que Deus tinha preparado para que realizassem. Sua vida e ministério foram cercados por ramificações negativas, mesmo que eles possam ter pessoalmente caminhado com Deus.

Talvez o exemplo bíblico mais conhecido nesta área seja o do rei Davi. Ele foi um líder que poderia ter terminado excepcionalmente bem. No entanto, houve tanto conflito no final de sua vida que ele, mesmo sendo chamado um homem segundo o coração de Deus, não foi capaz de executar a visão que lhe foi dada, da construção do templo, por exemplo. Ele tinha tudo para terminar bem, mas sua conclusão foi apenas razoável.

O QUE NOS LEVA A TERMINAR MAL A CARREIRA?

Até aqui vimos que, infelizmente, muitos não conseguem chegar bem ao final de sua vida e ministério por vários motivos. Quais são eles?

USO E ABUSO DAS FINANÇAS

Líderes, particularmente aqueles que ocupam funções poderosas, tomam decisões importantes sobre finanças. A falta de integridade nesta área certamente conduzirá a um controle impróprio do uso do dinheiro, que tem sido, segundo alguns pesquisadores, uma das maiores causas de fracasso na vida de líderes cristãos.

Este fracasso pode ocorrer tanto no aspecto da má administração financeira pessoal, que é uma cilada em que a pessoa gasta mais do que pode, quanto no aspecto da falta de integridade, quando a pessoa planeja mal sua vida financeira, finalmente caindo ao tentar fazer coisas desonestas para resolver seus problemas. Mesmo que ninguém a veja, Deus a vê. Isso provoca uma estagnação no ministério e uma cessação da unção divina sobre a pessoa. O líder não consegue terminar bem, pois quem expande o seu ministério é Deus e não os homens. O caso de Gideão, em Juízes 8.27, quando ele se prostituiu nesta área das finanças, retrata bem este tipo de barreira.

O problema se acentua ainda mais quando sai da esfera da gerência dos recursos pessoais de um líder para a gerência dos recursos do grupo que ele lidera. Como Howard Dayton afirma: "A fidelidade em relação às posses de outras pessoas determina, de certa forma, o quanto a pessoa é confiável".

Deus usa o dinheiro para refinar nosso caráter. Nas palavras de Richard Halverson, "Jesus Cristo falou mais sobre dinheiro do que sobre qualquer outra coisa, porque o dinheiro é de suma importância quando se trata da verdadeira natureza de uma pessoa. Através do dinheiro, faz-se uma avaliação precisa de nosso verdadeiro caráter. Através das Escrituras, encontramos uma íntima correlação entre o desenvolvimento do caráter de uma pessoa e a forma como ela lida com o dinheiro".

ABUSO DE PODER

Líderes operam na base do poder legítimo (o de sua posição), do poder coercivo (o de punição), do poder recompensador, do poder especialista (o do conhecimento profundo de uma área), entre outros. Essas categorias de poder gozam de legitimidade. O perigo reside na tentação da manipulação dele para fins pessoais. Tal abuso desvirtua o seu propósito e macula o caráter do líder, danificando o seu legado.

Poder e autoridade são os dois lados de uma mesma moeda. Poder é a capacidade de fazer ou impedir que algo seja feito. Já a autoridade é a plataforma delegada para o exercício do poder. Uma pessoa lidera porque houve delegação de poder da parte de quem está acima e abaixo dela. Portanto, a autoridade é sempre condicional, podendo ser retirada a qualquer hora. A aceitação de uma pessoa como líder é sempre uma ação delegativa da parte dos outros. Tal perspectiva sobre poder e autoridade, propriamente aplicada, mantém um equilíbrio necessário neste assunto em particular, permitindo que o líder cristão lidere servindo e sirva liderando.

O poder, em si mesmo, é necessário ao ministério para que as coisas aconteçam. No entanto, o seu abuso, especialmente quando ele se manifesta em vantagens e privilégios, poderá levar o líder a enfrentar a realidade do fracasso e da derrota. Deus, na história bíblica, sempre derrubou os líderes que abusaram do poder e tentaram tirar vantagem do povo que ele estava liderando.

Um dos exemplos que podemos considerar é o do rei Uzias, que foi rejeitado por Deus por tentar usufruir de um privilégio que não lhe era devido, o privilégio sacerdotal (2Cr 26.16-23). O texto bíblico não poderia ser mais claro: "Mas, havendo-se já fortificado, exaltou-se o seu coração para a sua própria ruína, e cometeu transgressões contra o Senhor, seu Deus, porque entrou no templo do Senhor para queimar incenso no altar de incenso" (v. 16). Uzias estava abusando do seu poder de rei. Portanto, Deus usou oitenta sacerdotes – homens da maior firmeza – sob o comando de Azarias, para confrontá-lo. Os sacerdotes expulsaram o rei do santuário, embora ele ainda tivesse tentado resistir, e assim Uzias terminou sua vida como um leproso, sozinho e sem prestígio.

ORGULHO

O orgulho pode levar o líder a cair, conduzindo-o facilmente a decisões equivocadas e a um comportamento pecaminoso.

Talvez o maior exemplo bíblico deste princípio seja o do rei Davi ao decidir recensear o povo (1Cr 21), mesmo contrariando a palavra sábia do Senhor dita por Joabe. O texto deixa muito claro que Satanás o estava incitando, trabalhando em seu orgulho (v. 1). Deus alertou o rei, mas ele se mostrou impenitente. O recenseamento foi feito, satisfazendo o seu desejo orgulhoso, mas Davi sofreu as consequências por não ter passado nos testes da obediência e integridade.

PROBLEMAS SEXUAIS

Relacionamentos sexuais ilícitos têm sido a causa de quedas e fracassos na vida de muitos líderes, desde os tempos bíblicos. A resposta de José para a mulher de Potifar é um exemplo positivo, mas vemos os maus exemplos de Davi e Salomão (2Sm 11; 1Rs 11), bem como de muitos líderes contemporâneos, o que confirma o princípio de que uma queda nesta área compromete irreparavelmente a maneira como terminaremos a nossa carreira.

PROBLEMAS FAMILIARES

Problemas com o cônjuge, com pais e filhos, e até mesmo com os demais parentes têm, com frequência, destruído o ministério de líderes. Os exemplos de Eli e seus filhos (1Sm 2-4) e Davi e Absalão deveriam sempre nos servir de alerta. Relacionamentos familiares conturbados representam um obstáculo na vida do líder que quer terminar bem.

Apesar de serem inevitáveis, eles não precisam ser necessariamente razão para derrotas e fracassos na vida familiar do líder. Para iniciar o processo de resolução dos mesmos: (1) procure entender a natureza do conflito; (2) identifique o seu estilo no tratamento de conflitos anteriores; (3) pergunte a você mesmo o que funcionou e o que não; (4) aprenda com os seus erros e com o conselho de cristãos mais experimentados a resolver melhor seus conflitos familiares.

ESTAGNAÇÃO

Esta situação é muito comum e acontece com líderes que, a princípio, são competentes no ministério, mas que progressivamente diminuem o ritmo do seu desenvolvimento até se estagnarem. O que era sua força torna-se em fraqueza. É possível para uma pessoa ministrar em um nível de competência sem a presença do Espírito Santo. Em outras palavras, ela foi capaz de desenvolver algumas habilidades ministeriais que podem ser usadas sem a presença ativa de Deus. No entanto, é impossível ser um homem ou uma mulher de Deus sem buscar crescer no relacionamento com ele e no aprendizado contínuo.

Em geral, a estagnação ocorre alguns anos após a pessoa estar envolvida no ministério, quando ela sente que já construiu o seu banco de dados e passa a basear-se quase que exclusivamente nele. O que ocorre neste ponto é que os sermões e estudos já armazenados no banco de dados ficam descontextualizados e não têm o mesmo impacto inicial, pois foram originalmente preparados para uma audiência diferente ou para uma situação específica inserida em um momento histórico que não se repete no presente. O líder que tenta transportar seu banco de dados para uma nova situação sem reciclá-lo perde muito da sua aplicabilidade, não sendo bem-sucedido nem tampouco se aperfeiçoando em seu desenvolvimento pessoal.

Não há nada negativo em construir a partir daquilo que já se tem. O problema está em estacionar nessa faixa, estagnando-se na caminhada espiritual. Este é um risco sempre presente na vida dos líderes cristãos.

Há, porém, esperança para aqueles que se encontram estagnados: nunca é tarde para recomeçar. A vida é sempre algo entusiasticamente desafiador. Para mim, a pior sensação que pode existir é a de que o tempo passou e a pessoa ficou para trás, perdendo a chance do desenvolvimento e progresso. A esperança motiva-nos ao comunicar a convicção de que é sempre possível recomeçar.

Uma atitude de busca de um aperfeiçoamento contínuo é absolutamente essencial para quebrar o estigma da estagnação. A leitura de livros e um espírito aberto ao aprendizado são itens indispensáveis deste processo.

A CONCLUSÃO IDEAL

O líder que termina sua jornada com excelência não apenas transforma sua visão em realidade, mas também inspira gerações futuras a seguir seus passos. Afinal, quais são os segredos de terminar bem sua carreira como líder espiritual?

RELACIONAMENTO COM DEUS

O primeiro segredo é caminhar com Deus até o final de sua vida, zelando sempre pela constância e sinceridade de suas disciplinas espirituais. O princípio aqui é muito simples, mas tremendamente importante. Quando nos preocupamos com a profundidade do nosso relacionamento com Deus e com uma vida de aprendizado daquilo que ele e seu povo nos ensinam, Deus se encarrega da expansão do nosso ministério.

Jesus nunca foi além de duzentos quilômetros do lugar onde nasceu. Apesar disso, o mundo inteiro o conhece, porque ele não somente terminou bem o seu ministério, mas também tinha seu foco voltado para o aprofundamento do seu relacionamento com o Pai e seu investimento em alguns poucos discípulos, que multiplicariam o alcance de sua missão após o Pentecostes. Ele preocupou-se com a profundidade, Deus garantiu a expansão. O caminho da continuidade e progressão passa por uma vida de relacionamento com Deus combinada com uma atitude de aprendizado e investimento na vida de outros.

Cerca de 30% dos personagens bíblicos terminaram bem, como Abraão, Jó, José, Josué, Calebe, Samuel, Elias, Jeremias, Daniel, Jesus, João e Paulo.

Paulo, por exemplo, na fase do seu desenvolvimento ministerial, quando estava completamente envolvido em plantar igrejas, confessou para os presbíteros da igreja de Éfeso que não considerava a vida preciosa para si mesmo, contanto que chegasse bem ao final dela completando o ministério que havia recebido do Senhor Jesus (At 20.24). E ele completou bem a sua carreira: "Combati o bom combate, terminei a corrida, guardei a fé".

Terminar bem não é apenas o fim de uma jornada; é o resultado de ações eficientes e práticas consistentes ao longo do caminho. Líderes que terminam bem são modelos de intimidade com Deus para os outros. Eles mantêm um relacionamento vibrante e pessoal com Deus até o final de suas vidas. Para isso, um fator crucial é manter-se firme em suas disciplinas espirituais.

POSTURA DE APRENDIZADO

Ninguém termina bem sem manter uma postura de aprendizado durante toda a vida.

Em 1935, um membro da Câmara de Lordes inglesa disse: "A minha geração é a primeira em que o ciclo do conhecimento tem que ser renovado no período de vida útil do indivíduo". O que ele estava dizendo era que os estudiosos tinham chegado à conclusão de que aquilo que uma pessoa havia aprendido no curso regular e formal dos seus estudos até o momento de sua entrada no mercado de trabalho havia sido suficiente, até aquela data, para que ela sobrevivesse profissionalmente até o final da sua vida. Segundo ele, a sua geração seria a primeira que estaria enfrentando a realidade de ter que processar outro tanto de conhecimento durante o período produtivo profissional de suas vidas, para acompanhar a velocidade do desenvolvimento do conhecimento e as exigências do mercado de trabalho.

Apesar de não dispor de informação científica a este respeito no momento, atrevo-me a dizer que, na presente velocidade de acréscimo do conhecimento, a reciclagem deve estar acontecendo a uma velocidade muito maior. Se não estudarmos e reprocessarmos constantemente o que já aprendemos, não poderemos competir com aqueles que estão ingressando diariamente no mercado de trabalho. Isto representa um desafio para todo profissional. Esta reciclagem do conhecimento representa um grande obstáculo que precisa ser vencido, caso o líder queira terminar bem.

Um pastor amigo meu disse-me veementemente que não passava mais de três anos em uma igreja, pois este período correspondia ao material que ele já possuía pronto para ser usado! Não há qualquer problema com o fato de se ter um banco de dados. O problema ocorre quando o líder se acomoda com o banco que formou e não busca mais um desenvolvimento contínuo de seu potencial. Tal atitude passiva gera a estagnação na vida e ministério.

O líder que quer terminar bem tem que lutar contra a tendência de acomodar-se em sua busca por aprender coisas novas, e agir intencionalmente para alcançar um nível mais elevado.

CONVICÇÃO E CONFIANÇA EM SEUS VALORES

O líder que termina bem vive sua vida baseado em suas convicções e confiança de que Deus tem se revelado a ele. As promessas de Deus são recebidas pela fé e as decisões são feitas sobre o fundamento desta convicção.

Como vimos, o filósofo Sócrates disse certa vez: "Para o capitão que não sabe o porto aonde quer chegar, todos os ventos lhe são contrários". O líder que quer terminar bem precisa caminhar na convicção de seu chamado, pois só assim será capaz de enfrentar as situações adversas sem desistir da caminhada. Ele somente será capaz de avançar até o ponto em que sua convicção o levar, até o limite daquilo em que acredita.

Todas as pessoas que terminam bem têm os seus pontos inegociáveis. Kouzes e Posner, autores do bestseller O desafio da liderança, contam que fizeram uma pesquisa tentando descobrir quem eram os líderes históricos mais admirados pelas milhares de pessoas que frequentam os seus cursos. A lista compilada incluiu os nomes de personagens famosos na história do nosso mundo moderno. Os mais citados foram Abraham Lincoln, Martin Luther King Jr., Winston Churchill, Mahatma Gandhi, Mikhail Gorbachev, Nelson Mandela, Golda Meir, Dalai Lama, João Paulo II, Eleanor e Franklin Roosevelt, Madre Teresa, Margareth Thatcher e o arcebispo anglicano Desmond Tutu.

O que esses líderes têm em comum? Uma qualidade que fala mais alto do que qualquer outra: fortes convicções em seus princípios. Todos tiveram um comprometimento claro com um bloco pessoal e particular de valores. Todos foram apaixonados pelas causas que defenderam.

Essa é uma lição muito objetiva e clara: todos admiramos aquelas pessoas que creem firmemente em algo, a ponto de nunca negociarem os seus valores. Logo, se alguém aspira tornar-se um líder que granjeará seguidores comprometidos, o requisito fundamental é que ele deve ser uma pessoa de princípios. Até onde ele está disposto a caminhar sem comprometer os princípios éticos e as convicções que tem desenvolvido em sua caminhada com Deus?

Lembremo-nos das duas leis básicas de liderança: (1) se você não crê no mensageiro, você não crerá na mensagem; e (2) você não crerá no mensageiro se não souber no que ele crê.

FOCO EM SEU CHAMADO E TRANSMISSÃO DO LEGADO

O líder que termina bem faz suas escolhas e decisões com base em seu chamado. É a convicção do chamado que o leva a permanecer firme e a terminar bem, a despeito dos percalços que encontra pelo caminho e que o levam, muitas vezes, a desejar desistir de tudo.

Terminar bem não é algo que acontece por acaso, nem com base em um terreno impessoal do ser, mas devido a um Deus infinito e pessoal, que nos criou à sua imagem e nos chama a um relacionamento pessoal consigo. Nosso chamado, portanto, vem do que nós somos criados para ser, do que somos chamados a ser. Esta chamada do nosso Criador não é somente a fonte de profunda autodescoberta e crescimento na vida, mas ela dá às nossas vidas uma inspiração e dinamismo que as transforma em uma jornada além da mais otimista das expectativas.

O líder que termina bem deixa para a geração futura uma contribuição ou legado que atesta sua vida de honra a Deus. Segundo um antigo ditado, se uma pessoa quiser saber o que o povo dirá a respeito dela após sua morte, ela mesma deveria escrever os dizeres da lápide do seu túmulo e viver de acordo com eles. Essa não é uma má ideia. Que mensagem estaria escrita em sua lápide? Como você gostaria de ser lembrado?

Um dos meus modelos de ministério foi o Rev. Denoel Eller. Um homem de Deus, ele foi sempre conhecido pela sua integridade, humildade e serviço a Deus e aos outros. Uma semana antes de sua morte, ele esteve em minha casa e lhe perguntei: "Rev. Denoel, como o senhor gostaria de terminar a sua vida e carreira?" Ele me respondeu dizendo: "Eu quero terminar minha carreira sendo uma pessoa íntegra e pregando o evangelho, porque para isso é que eu fui chamado por Deus". No domingo seguinte, ao celebrar a Ceia do Senhor em sua igreja, o Rev. Denoel faleceu em pleno culto, com o cálice em suas mãos. Ele terminou bem.

Completar bem a carreira deve ser algo maravilhoso. Chegar ao final da vida com um senso de dever cumprido e com a convicção de que, apesar de nossas imperfeições, cumprimos bem o propósito divino para nossas vidas, deve ser muito gratificante.

Um líder eficiente é aquele que termina bem a sua jornada, sendo guiado por um propósito maior e moldando profundamente suas decisões e ações a partir do seu chamado. É essa convicção que o mantém firme, mesmo diante de obstáculos que poderiam levá-lo a desistir. Ao transformar a visão que Deus lhe deu em ações concretas e duradouras, ele abraça o maior desafio de sua liderança. Assim, zelemos por terminar bem, pois esse é o nosso maior legado, para o bem dos nossos descendentes e para a glória de Deus.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — O bom combate
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Reflita sobre a jornada de liderança que você percorreu até agora. Quais são os maiores aprendizados que você levará para o futuro?',
     'reflexao', null),
    (v_aula_id, 2,
     'Faça uma lista de três ações que você pode tomar para garantir que terminará bem sua carreira de liderança, sempre mantendo a excelência.',
     'reflexao', null),
    (v_aula_id, 3,
     'Quem são as pessoas que você pode começar a preparar para assumir sua posição quando chegar a hora de concluir sua liderança? Identifique pelo menos um nome e desenvolva um plano para mentoreá-lo.',
     'reflexao', null);
  end if;
end
$migration$;
