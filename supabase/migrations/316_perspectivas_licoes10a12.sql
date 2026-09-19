-- 316_perspectivas_licoes10a12.sql
-- Quinze leituras das Lições 10, 11 e 12, cada uma na ordem em que o seu guia a
-- chama. Com elas o curso fica completo no que depende do livro, faltando só o
-- capítulo 116 (Mordomo) — ver a nota no fim.
--
-- PROCEDÊNCIA: dois PDFs fotografados, de 78 e 18 páginas. Uma página veio de
-- cabeça para baixo no primeiro lote e uma no segundo.
--
-- DEFEITO NOVO NESTE ACERVO: a p. 61 do lote grande traz a caixa "Perguntas
-- para estudo" impressa de cabeça para baixo DENTRO de uma página que está na
-- vertical. A correção de orientação trabalha por página inteira e não pega um
-- bloco girado no meio de uma página certa — o OCR leu o trecho literalmente e
-- devolveu texto invertido ("opnjsa eJed sejungiad"). Reli a página girada em
-- 180° e emendei o bloco recuperado. Varri os três lotes deste mês atrás do
-- mesmo defeito: é a única página assim em 146 páginas.
--
-- OS GUIAS TAMBÉM SÃO ESCANEADOS, e o OCR estragou justamente os números das
-- chamadas de leitura: "Cap." com maiúscula, "pg." no lugar de "p.", "Leia q
-- artigo", vírgula onde devia haver dois-pontos. Isso escondeu capítulos do meu
-- levantamento do que faltava — os caps. 101, 116 e 118 nunca apareceram nas
-- listas que eu vinha dando, e só surgiram quando li as linhas uma a uma.
--
-- TÍTULOS CONFERIDOS NA PÁGINA DE ABERTURA, não no cabeçalho corrido. Três
-- divergências: o autor do cap. 117 assina Bertil EKSTRÖM (com trema), e o guia
-- escreve "Ekstrôm"; o cap. 118 chama-se "O Pacto de Lausanne", sendo "A
-- responsabilidade social cristã" a seção da p. 783 que o guia aponta dentro
-- dele; e o cap. 109 é "obreiros latino-americanos", não só "Latino-americanos".
--
-- As catorze aberturas com caixa de biografia vieram destruídas pelo OCR e foram
-- reconstruídas olhando a imagem. Onze delas o OCR devolveu em parte, e mesmo
-- assim conferi na imagem: no Queiroz o OCR dizia "presidente do Global
-- COMIBAM" quando o impresso traz "presidente do Global Focus Brasil" e
-- "diretor executivo do COMIBAM".
--
-- O cap. 109 (Guzman) entra DUPLICADO nas Lições 10 e 12, que o pedem.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 83;
  update aulas set ordem = ordem - 10000 + 7 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Pacto de Lausanne, cap. 118: O Pacto de Lausanne', 'Introdução Nós, membros da Igreja de Jesus Cristo, procedentes de mais de 150 nações, participantes do Congresso Internacional de Evangelização Mundial, em Lausanne, louvamos a Deus por sua grande salvação, e regozijamo-nos com a comunhão que, por graça dele mesmo, podemos ter com ele e uns com os outros. Estamos profundamente tocados pelo que Deus vem fazendo em nossos dias, movidos ao arrependimento por nossos fracassos e desafiados pela tarefa inacabada da evangelização. Acreditamos que o evangelho são as boas novas de Deus para todo o mundo, e por sua graça, decidimo-nos a obedecer ao mandamento de Cristo de proclamá-lo a toda a humanidade e fazer discípulos de todas as nações. Desejamos, portanto, reafirmar a nossa fé e a nossa resolução, tornar público o nosso pacto. 1. O propósito de Deus

Afirmamos a nossa crença no único Deus eterno, Criador e Senhor do mundo, Pai, Filho e Espírito Santo, que governa todas as coisas segundo o propósito da sua vontade. Ele tem chamado do mundo um povo para si, enviando-o novamente ao mundo como seus servos e testemunhas, para estender o seu Reino, edificar o Corpo de Cristo, e também para a glória do seu nome, Confessamos, envergonhados, que muitas vezes negamos o nosso chamado e falhamos em nossa missão, em razão de nos termos conformado ao mundo ou nos termos isolado demasiadamente, Contudo, regozijamo-nos com o fato de que, mesmo transportado em vasos de barro, o evangelho continua sendo um tesouro precioso. À tarefa de tornar esse tesouro conhecido, no poder do Espírito Santo, desejamos dedicar-nos novamente. 2, À autoridade e o poder da Bíblia Afirmamos a inspiração divina, a veracidade e a autoridade das

Escrituras tanto do Velho como do Novo Testamento, em sua totalidade, como única Palavra de Deus escrita, sem erro em tudo o que ela afirma, e a única regra infalível de fé e prática. Também afirmamos o poder da Palavra de Deus para cumprir o seu propósito de salvação, À mensagem da Bíblia destina-se a toda

Espírito Santo fala ainda hoje. Ele ilumina sente do povo de Deus em toda cultura, de esodo à perceberem a sua verdade, de maneira «empre nova, com os próprios olhos, cassimrevela a toda a Igreja uma porção cada vez maior da multiforme sabedoria de Deus. 3. À unicidade e a universalidade de Cristo Afirmamos que há um só Salvador e um só evangelho, embora exista uma ampla variedade de maneiras de se realizar a obra de evangezação, Reconhecemos que todos os homens tém algum conhecimento de Deus através da revelação geral de Deus na natureza. Mas negamos que tal conhecimento possa salvar, pois os homens, por sua injustiça, suprimem a verdade. Também rejeitamos, como depreciativo de Cristo e do evangelho, qualquer tipo “de sincretismo ou de diálogo cujo pressuposto seja o de que Cristo fala igualmente através de todas as religiões e ideologias. Jesus Cristo, sendo ele próprio, o único Deus-homem, que se ofereceu a si mesmo como único resgate pe“Jos pecadores, é o único Mediador entre Deus e os homens. Não existe outro nome pelo qual importa que sejamos salvos. Todos os homens estão perecendo por causa do pecado, mas Deus ama todos os homens, desejando que nenhum pereça, mas que todos se arrependam. Entretanto, os que rejeitam a Cristo repudiam o gozo “da salvação e condenam-se à separação eterna de Deus. Proclamar Jesus como “o Salvador do mundo” não é afirmar que todos os homens, automaticamente, ou ao final de tudo, serão salvos; e muito menos que todas as religiões ofereçam salvação em Cristo. Trata-se antes de proclamar o amor de Deus por um mundo de pecadores e convidar todos os homens a se entregarem a ele como Salvador e Senhor no Sincero compromisso pessoal de arrependimento fé. Jesus Cristo foi exaltado sobre todo e Qualquer nome, Anelamos pelo dia em que todo jodho se dobrará diante dele e toda língua o confessará como Senhor.

Jesus Cristo morreu por nossos pecados ressuscitou segundo as Escrituras, e de que, como Senhor e Rei, ele agora oferece o perdão dos pecados e o dom libertador do Espírito a todos os que se arrependem e creem. À nossa presença cristã no mundo é indispensável à evangelização, é o mesmo se dá com aquele tipo de diálogo cujo propósito é ouvir com sensibilidade, a fim de compreender. Mas a evangelização propriamente dita é a proclamação do Cristo bíblico histórico como Salvador e Senhor, com o intuito de persuadir as pessoas a vir a ele pessoalmente e,assim, se reconciliarem com Deus, Ão fazermos o convite do evangelho, não temos o direito de esconder o custo do discipulado. Jesus ainda convida todos os que queiram segui-lo a negarem-se a si mesmos, tomarem a cruz identificarem-se com a sua nova comunidade, Os resultados da evangelização incluem a obediência a Cristo, o ingresso em sua igreja é um serviço responsável no mundo. 5. A responsabilidade social cristã Afirmamos que Deus é o Criador e o Juiz de todos os homens. Portanto, devemos partilhar oseu interesse pela justiça e pela conciliação em toda a sociedade humana, e pela libertação dos homens de todo tipo de opressão. Porque a humanidade foi feita à imagem de Deus, toda pessoa, sem distinção de raça, religião, cor, cultura, classe social, sexo ou idade possui uma dignidade intrínseca em razão da qual deve ser respeitada e servida, e não explorada. Aqui também nos arrependemos de nossa negligência e de termos algumas vezes considerado a evangelização e a atividade social mutuamente exclusivas. Embora areconciliação com o homem não seja reconciliação com Deus, nem a ação social evangelização, nem a libertação política salvação, afirmamos que a evangelização e o envolvimento sociopolítico são ambos parte do nosso dever cristão. Pois ambos são necessárias expressões de nossas doutrinas acerca de Deus e do homem, de nosso amor por nosso próximo e de nossa obediência a Jesus Cristo. À mensagem da salvação implica também uma mensagem de juízo sobre toda forma de alienação, de opressão e de discriminação, e não devemos ter medo de denunciar o mal e a injustiça onde quer que existam. Quando as pessoas recebem a Cristo, nascem de novo em seu Reino e devem procurar não só evidenciar, mas também divulgar a retidão do Reino em meio a um mundo injusto. À salvação que alegamos possuir deve estar nos transformando na totalidade de nossas responsabilidades pessoais e sociais. À fé sem obras é morta. 6. A Igreja e a evangelização a unidade organizacional pode tomar muitas formas e não ativar necessariamente a evangelização. Contudo, nós, que partilhamos a mesma fé bíblica, devemos estar intimamente unidos na comunhão uns com os outros, nas obras no testemunho. Confessamos que o nosso testemunho, algumas vezes, tem sido manchado por pecaminoso individualismo e desnecessária duplicação de esforço. Empenhamo-nos por encontrar uma unidade mais profunda na verdade, na adoração, na santidade e na missão. Instamos para que se apresse o desenvolvimento de uma cooperação regional e funcional para maior amplitude da missão da igreja, para o

Afirmamos que Cristo envia o seu povo redimido ao mundo assim como o Pai o enviou, e que isso requer ação de igual modo profunda e sacrifical. Precisamos deixar os nossos guetos eclesiásticos e nos inserirmos na sociedade não cristã. Na missão de serviço sacrifical da Igreja a evangelização é primordial. À evangelização mundial requer que a Igreja inteira leve oevangelho integral ao mundo todo. À Igreja ocupa o ponto central do propósito divino paracomo mundo, é o agente que ele promoveu para di-. fundir o evangelho. Mas uma igreja que pregue a cruz deve, ela própria, ser marcada pela cruz. Ela torna-se uma pedra de tropeço para aevangelização quando trai o evangelho ou quando lhe falta uma fé viva em Deus, um amor genuíno pelas pessoas, ou uma honestidade escrupulosa em todas as coisas, inclusive em promoção efinanças. À Igreja é antes a comunidade do povo planejamento estratégico, para o encorajamento mútuo, e para o compartilhamento de recursos e de experiências. 8. Esforço conjugado de igrejas na evangelização Regozijamo-nos com o alvorecer de uma nova era missionária. O papel dominante das missões ocidentais está desaparecendo rapidamente. Deus está levantando das igrejas mais jovens um grande e novo recurso para a evangelização mundial, demonstrando assim que a responsabilidade de evangelizar pertence a todo o Corpo de Cristo. Todas as igrejas, portando, devem perguntar a Deus, e a si próprias, o que deveriam estar fazendo tanto para alcançar suas próprias áreas como para enviar missionários a outras partes do mundo. Deve ser permanente o processo de reavaliação da nossa responsabide Deus do que uma instituição, e não pode ser identificada com qualquer cultura em particular, nem com qualquer sistema social ou político, nem com ideologias humanas. 7. Cooperação na evangelização Afirmamos que é propósito de Deus haver na igreja uma unidade visível de pensamento quanto à verdade. À evangelização também nos convoca à unidade, porque o ser um só corpo reforça o nosso testemunho, assim como a nossa desunião enfraquece o nosso evangelho de reconciliação. Reconhecemos, entretanto, que lidade e atuação missionária. Assim, haverá um crescente esforço conjugado pelas igrejas, o que revelará com maior clareza o caráter universal da Igreja de Cristo. Também agradecemos a Deus pela existência de instituições que laboram na tradução da Bíblia, na educação teológica, no uso dos meios de comunicação de massa, na literatura cristã, na evangelização, em missões, no avivamento de igrejas e em outros campos especializados. Elas também devem empenharse em constante autoexame que as levem a uma avaliação correta de sua efetividade como parte da missão da Igreja.

0 à, Urgência da tarefa evangelística Mais de 2,7 bilhões de pessoas, ou seja, mais de dois terços da humanidade, ainda estão por serem evangelizadas. Causa-nos vergonha ver anta gente esquecida; continua sendo uma reprimenda para nós e para toda a Igreja. Existe agora, entretanto, em muitas partes do mundo, pma receptividade sem precedentes ao Senhor Jesus Cristo. Estamos convencidos de que esta é à Ocasião para que as igrejas e as instituições paraeclesiásticas orem com seriedade pela sal“vação dos não alcançados e se lancem em novos esforços para realizarem a evangelização mun“dial. À redução de missionários estrangeiros e de dinheiro num país evangelizado algumas manchada pelo pecado, e parte dela é demoníaca: O evangelho não pressupõe a superioridade de uma cultura sobre a outra, mas avalia todas elas segundo o seu próprio critério de verdade e justiça, e insiste na aceitação de valores morais absolutos, em todas as culturas. As missões muitas vezes têm exportado, juntamente com o evangelho, uma cultura estranha, e as igrejas, por vezes, têm ficado submissas aos ditames de uma determinada cultura, em vez de às Escrituras. Os evangelistas de Cristo têm de, humildemente, procurar esvaziar-se de tudo, exceto de sua autenticidade pessoal, a fim de se tornarem servos dos outros, e as igrejas têm de procurar transformar e enriquecer a cultura;

vezes talvez seja necessária para facilitar o cresmento da igreja nacional em autonomia, e para iberar recursos para áreas ainda não evangeli-tadas, Deve haver um fluxo cada vez mais livre “de missionários entre os seis continentes num espírito de abnegação e prontidão em servir. O alvo deve ser o de conseguir por todos os “meios possíveis e no menor espaço de tempo, que toda pessoa tenha a oportunidade de ouvir, “de compreender e de receber as boas novas. Não podemos esperar atingir esse alvo sem sacrificio. Todos nós estamos chocados com a pobreza de milhões de pessoas, e conturbados pelas injustiças que a provocam. Aqueles dentre nós que vivem em meio à opulência aceitam como obrigação sua desenvolver um estilo de vida simples a fim de contribuir mais generosamente tanto para aliviar os necessitados como para a evangelização deles. 10. Evangelização e cultura O desenvolvimento de estratégias para aevangelização mundial requer metodologia nova e criativa. Com a bênção de Deus, o resultado será o surgimento de igrejas profundamente enraizadas em Cristo e estreitamente relacionadas com a cultura local. À cultura deve sempre ser julgada e provada pelas Escrituras. Porque o homem é criatura de Deus, parte de sua cultura é rica em beleza e em bondade; porque ele experimentou a queda, toda a sua cultura está tudo para a glória de Deus. 11. Educação e liderança Confessamos que às vezes temos nos empenhado em conseguir o crescimento numérico da igreja em detrimento do espiritual, divorciando a evangelização da edificação dos crentes. Também reconhecemos que algumas de nossas missões têm sido muito remissas em treinar e incentivar líderes nacionais a assumirem suas justas responsabilidades. Contudo, apoiamos integralmente os princípios que regem a formação de uma igreja de fato nacional, e ardentemente desejamos que toda a igreja tenha líderes nacionais que manifestem um estilo cristão de liderança não em termos de domínio, mas de serviço. Reconhecemos que há uma grande necessidade de desenvolver a educação teológica, especialmente para líderes eclesiásticos. Em toda nação e em toda cultura deve haver um eficiente programa de treinamento para pastores e leigos em doutrina, em discipulado, em evangelização, em edificação e em serviço. Esse treinamento não deve depender de uma metodologia estereotipada, mas deve se desenvolver a partir de iniciativas locais criativas, de acordo com os padrões bíblicos. 12. Conflito espiritual Cremos que estamos empenhados num permanente conflito espiritual com os principados potestades do mal, que querem destruir a Igreja e frustrar sua tarefa de evangelização mundial. Sabemos da necessidade de nos revestirmos pela libertação deles. Ao mesmo tempo, recusamo-nos a ser intimidados por sua situação. Com a ajuda de Deus, nós também procurada armadura de Deus e combater essa batalha com as armas espirituais da verdade e da oração. Pois percebemos a atividade no nosso inimigo, não somente nas falsas ideologias fora da Igreja, mas também dentro dela, em falsos remos nos opor a toda injustiça e permanecer fiéis ao evangelho, seja a que custo for. Não nos esquecemos de que Jesus nos preveniu de que a perseguição é inevitável.

evangelhos que torcem as Escrituras e colocam o homem no lugar de Deus. Precisamos tanto

14.0 poder do Espírito Santo Cremos no poder do Espírito Santo. O Pai ende vigilância como de discernimento para salvaguardar o evangelho bíblico. Reconhecemos que nós mesmos não somos imunes à aceitação do mundanismo em nossos atos cações,ou seja, ao perigo de capitularmos ao secularismo. Por exemplo, embora tendo à nossa disposição pesquisas bem preparadas, valiosas, sobre o crescimento da Igreja, tanto no sentido numérico como espiritual, às vezes não as temos utilizado. No entanto, por vezes tem acontecido que, na ânsia de conseguir resultados para o evangelho, temos comprometido a nossa mensagem, temos manipulado os nossos ouvintes com técnicas de pressão, e temos estado excessivamente preocupados com as estatísticas, e até mesmo utilizando-as de forma desonesta. Tudo isso é mundano. A Igreja deve estar no mundo; o mundo não deve estar na Igreja.

viouoseu Espírito para dar testemunho do seu Filho. Sem o testemunho dele o nosso seria em vão. Convicção de pecado, fé em Cristo, novo nascimento cristão, é tudo obra dele, De mais a mais, o Espírito Santo é um espírito missionário, de maneira que a evangelização deve surgir espontaneamente numa igreja cheia do Espírito. À igreja que não é missionária contradiz asi mesma e debela o Espírito. À evangelização mundial só se tornará realidade quando o Espírito renovar a Igreja na verdade, na sabedoria, na fé, na santidade, no amor e no poder. Portanto, instamos com todos os cristãos para que orem pedindo pela visita do soberano Espírito de Deus, a fim de que o seu fruto todo apareça em todo o seu povo, e que todos os seus dons enriqueçam o Corpo de Cristo. Só então a Igreja inteira se tornará um instrumento adequado em suas mãos, para que toda

13. Liberdade e perseguição É dever de toda nação, dever que foi estabelecido por Deus, assegurar condições de paz, de justiça e de liberdade em que a Igreja possa obedecer a Deus, servir a Cristo Senhor e pregar o evangelho sem quaisquer interferências. Portanto, oramos pelos líderes das naçõese com eles instamos para que garantam a liberdade de a terra ouça a sua voz, 15.0 retorno de Cristo Cremos que Jesus Cristo voltará pessoal e visivelmente, em poder e glória, para consumar a salvação e o juízo. Essa promessa de sua vinda é um estímulo ainda maior à evangelização, pois nos lembramos de que ele disse que pensamento e de consciência, e a liberdade de praticar e propagar a religião, de acordo com a vontade de Deus, e com o que vem expresso na Declaração universal do direitos humanos. Também expressamos nossa profunda preocupação com todos os que têm sido injustamente encarcerados, especialmente com nossos irmãos que estão sofrendo por causa do seu testemunho do Senhor Jesus. Prometemos orar e trabalhar o evangelho deve ser primeiramente pregado a todas as nações. Acreditamos que o período que vai desde a ascensão de Cristo até o seu retorno será preenchido com a missão do povo de Deus, que não pode parar esta obra antes do fim. Também nos lembramos da sua advertência de que falsos cristos e falsos profetas apareceriam como precursores do Anticristo, Portanto, rejcitamos como sendo apenas "sy sonho da vaidade humana à ideiadequeo sosmem possa algum dia construir uma utopia "ag terra, À nossa confiança cristã é a de que “Deus aperfeiçoará o seu Reino, e aguardamos samente esse dia, e o novo céu ea nova “asso “sesta em que a justiça habitará e Deus reinará para sempre. Enquanto isso, rededicamo-nos s> serviço de Cristo e dos homens em alegre submissão à sua autoridade sobre a totalidade “de mossa vida.

Conclusão Portanto, à luz desta nossa fé e resolução, firmamos um pacto solene com Deus, bem como uns com os outros, de orar, planejar e trabalhar juntos pela evangelização de todo o mundo. Instamos com outros para que se juntem a nós. Que Deus nos ajude por sua graça para a sua glória a sermos fiéis a este Pacto! Amém. Aleluia!

Lausanne, Suíça, 1974', 83 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Moffett, cap. 81: A liderança do evangelismo no trabalho cristão', 'Samuel Moffett

SAMUEL MOFFETT é professor emérito de ecumenismo e missões no Princeton Theological Seminary, em Princeton, New Jersey. Nasceu em Pyongyang, na Coreia do Norte. É filho de missionários e serviu ele mesmo como missionário na China e na Coreia. Escreveu diversos artigos e livros sobre missões, teologia e liderança.

O Novo Testamento emprega o verbo “evangelizar” É num seng;do tão restrito que chega a ser chocante. verdade que uma variedade de expressões é utilizada para descrever o evangelismo; pregar a Palavra (At 8.4), pregar o Reino (Lc 9,2), anunciar as boas novas (Lc 4,18; 8,1). Todavia, o que todas essas expressões significam, em resumo, é o ato de contar as boas novas (evangelho) de que Jesus, o Messias, é o Rei e Salvador, O evangelismo era o anúncio do Reino de Cristo. Era mais que um anúncio, Era também o convite para ingressar nesse Reino, pela fé e com arrependimento.

O que o evangelismo não é O evangelismo, portanto, não é a totalidade da missão cristã. É apenas parte dela, Jesus e seus discípulos realizaram muitas outras coisas além de anunciar o Reino e de convidar as pessoas a aceitar a mensagem. O evangelismo não é a adoração nem a administração

A SAMUEL MOFFETT é professor inériha dé cliaiientiaia é indadas no Princeton Theological Seminary,em Princeton, New Jersey. Nasceu em Aria ad bo bois micianddia na Ching Coreia. Escreveu diversos artigos é livros sobre missões, teologia é história, dos sacramentos. “Não me enviou Cristo para batizar, mas para pregar o evangelho”, foi o que disse o apóstolo Paulo (1Co 1,17).

Também não é crescimento de igreja nem fundação de igrejas. Sem dúvida, a fundação e o crescimento de igrejas são objetivos do evangelismo e os resultados que dele se esperam, mas o evangelismo nem sempre produz uma igreja ou mais membros para a igreja. O evangelismo também não está restrito à apologética. Paulo afirma: “Persuadimos os homens” (2Co 5.11), mas insiste em que foi enviado a anunciar as boas novas “não com sabedoria de palavra” nem com a “sabedoria do mundo” (1Co 1.17,20).

Finalmente, no Novo Testamento o evangelismo não era confundido com o serviço cristão, nem com a ação cristã, nem com os protestos contra as injustiças deste mundo. Um incidente perturbador e revelador, narrado no livro de Átos, conta como os judeus que falavam o grego, pertencentes ao grupo dos primeiros cristãos e fazendo parte do grupo minoritário, começaram a reclamar da distribuição dos recursos. À resposta dos apóstolos parece insensível e muito bitolada: “Não é razoável que nós abandonemos à palavra de Deus para servir às mesas” (At 6.1,2). É claro que os apóstolos tomaram imediatamente providências para resolver essa injustiça, mas não deram a isso o nome de evangelismo.

No contexto do Reino Contudo, dentro do contexto do Reino à protão social como a única missão bem definida da Igreja, o resultado foi um desastre. Ao tentar clamação evangelística nunca foi tão restritaa ponto de ficar isolada das necessidades imefalar ao mundo, quase perderam a igreja.

Houve os que tentaram restabelecer o diatas e prementes dos pobres, dos presos, dos cegos e dos oprimidos.

Lembro-me do evangelismo coreano. Inequilíbrio destacando que “Cristo se torna o Mediador da nova aliança de Deus tanto por meio do evangelismo quanto do serviço e que daguei a um pastor da região de Filadélfia, nos Estados Unidos, por que sua igreja crescia tão rapidamente. Sua resposta foi: “Quando os coreanos chegam, eu primeiro consigo empregos para eles, em seguida ensino um pouco de inglês, Também os ajudo quando enfrentam problemas no emprego com seus chefes. Convido-os à virem à igreja. Então, prego o evangelho para eles”, Isso é contextualizar o evangelismo,

No entanto, se existe algo pior que tirar o texto do contexto, é tirar o contexto do texto. Assim como nunca se deve isolar a avaliação oferecida por Cristo das necessidades reais c imediatas do ser humano, também não se deve identificar essa salvação com as necessidades atuais. Quando citou o texto do Antigo Testamento que menciona a evangelização dos pobres ea libertação dos oprimidos, Jesus o fezcomas próprias palavras, com sua interpretação. Sua salvação não é o shalom do Antigo Testamento e seu Reino não é Israel.

Nada é tão prejudicial ao evangelismo e à ação social quanto confundir as duas coisas na definição ou separá-las na prática. Às vezes, "nossos evangelistas parecem estar nos conclamando aceitar o Rei sem seu Reino, ao mesmo "tempo em que nossos profetas, tão bitolados em seu modo de agir, parecem estar tentando construir o Reino sem o Rei e Salvador.

“os cristãos são desafiados a se envolver tanto no evangelismo quanto na ação social”, Contudo, nem isso foi suficiente. O que a igreja necessita para o futuro de sua missão é mais que de equilíbrio, Ela necessita de impulso, e isso não será uma trégua hesitante entre fé e obras, mas um trabalho cooperativo entre ambas.

Na maioria das equipes de cooperação, deverá haver um membro que lidere, um prímus inter pares, ou não se conseguirá fazer nada, Qual deve ser o membro líder na missão: o evangelismo ou a ação social?

Acredito que o que torna a missão cristã diferente das demais tentativas elogiáveis e sinceras de melhorar as condições humanas é esta: na missão cristã, nosso relacionamento vertical com Deus vem em primeiro lugar. O relacionamento horizontal com o próximo deve ocorrer “à imagem” do primeiro e é igualmente indispensável, mas ainda assim continua em segundo lugar. O membro líder da equipe é o evangelismo.

Não se trata de exaltar a proclamação à custa da ação cristã. Elas estão inseparavelmente relacionadas, mas essa posição do evangelismo insiste em primeiro lugar no fato de que, enquanto sem as obras as boas novas dificilmente são passíveis de crédito, sem a palavra a mensagem de salvação não é nem mesmo compreensível. Além do mais, a verdadeira boa nova não é o que fazemos a favor dos outros pela nossa

Mais do que simples equilíbrio é Houve uma época em que a maioria dos crisbenevolência, mas o que Deus fez a favor de todos por meio de Cristo. Como já se disse, o tãos acreditava que o evangelismo era a única prioridade. Estavam errados. Então a igreja se Anclinou demais para o outro lado. À única prionidade cristã, para alguns, passou a ser a justiça Social por meio da reconstrução. Essa é também "uma prioridade importante, mas não a única. Quando essas pessoas passaram a trataraquesevangelismo é um mendigo contando a outro onde encontrar pão.

No passado, agora ou no futuro, a suprema tarefa da igreja é, portanto, o evangelismo. Estla foi a suprema tarefa da igreja nos tempos do Novo Testamento. É também o supremo desafio que está diante da igreja na atualidade.

PLA sos Metade do mundo ainda não foi evangelizado Creio que o fator determinante no desenvolvimento de estratégias evangelísticas é queo evangelismo sempre se dirige aos não alcancados: “Ele deve concentrar sua atenção nas pessoas sem o evangelho”, Mais da metade da população do mundo ainda não tem o menor conhecimento a respeito das boas novas do amor salvador de Deus em Jesus Cristo. Não existe maior desafio à evangelização do que esse.

Nessa linha de pensamento, poderá ser proveitoso observar que, para o planejamento evangelístico estratégico em geral, alguns missiólogos sugerem que “um grupo de pessoas seja classificado como ainda não alcançado caso menos de 20% professe ser cristão ou seja assim considerado”, É justa a preocupação dos cristãos quanto aos lamentáveis desníveis na distribuição de renda, de alimento e de liberdade no mundo. Mas o que dizer do pior desequilíbrio de todos: a distribuição desigual da luz do conhecimento de Deus em Jesus Cristo?

Não sou muito adepto de estatísticas, mas não posso deixar de ficar impressionado, por exemplo, com a “Análise do evangelismo nos seis continentes”, Nessa análise, descobrimos

A liderança do evangelismo no trabatha

Nos próximos dez anos, o número de cristãos nascidos na Ásia será maior que a Uns população dos Estados Unidos multiplicada Ásia quase três (650 milhões de novos habitantes comparados com os 220 milhões de ame. ricanos; esses 650 milhões representam quas cinco vezes a atual população brasileira, ca! culada em 135 milhões). Tratar todos 05 ses; continentes como se tivessem peso igual dez. tro de uma perspectiva estratégica seria usr; distorção egoísta das realidades evangelística; do mundo.

Um último pensamento. Há uma recompensa adicional para aqueles que mantém sia. ples a definição de evangelismo, Essa definiçã, implica que qualquer pessoa pode evangelizar; Uma das mais significativas lições de evangeEsmo que já aprendi não foi com um evangelista profissional, mas com um vendedor de melancia

Eu estava numa vila da Corcia, e minha esposa dirigiu-se a um homem para lhe perguntar quanto custavam as melancias. Ele fico; tão surpreso ao ver uma estrangeira de nariz comprido falando sua língua que de início Écou mudo. Até se esqueceu de responder, Havia algo mais importante que ele descjava dizer Ele indagou: “Você é cristã?”. Quando minis que a maior parte dos recursos missionários de nossas igrejas ainda retorna para nós no sexto continente, que é constituído de 70 a 80% de pessoas que são cristãs, pelo menos nominalmente. À África, porém, talvez tenha 40% de cristãos, com base nessas mesmas estimativas imprecisas. E a Ásia, que tem uma população superior a 50% da população da terra, possui apenas 3% ou 4% de cristãos, mesmo contando os nominais.

Perguntas esposa respondeu que sim, o homem deu um sorriso largo, exclamando: “Ah, fico muito com tente em saber! Porque se não fosse, eu iria x dizer quanto você está perdendo”.

de mais cristãos estivessem felizes com o qu encontraram no Senhor Jesus Cristo a ponto é não poder esperar mais para contar aos outros o que estes estão perdendo, não haveria mas necessidade de preocupação com o futuro do evangelismo. Ê para estudo

1. Por que o Moffett sugere que o evangelismo deve ter prioridade no ministério entre os pobres

Você concorda ou não? Por quê? 4 2. Quala relação entre a distribuição desequilibrada de comida e a distribuição da luz de Jesus', 84 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Gustafson, cap. 101: Porcos, lagoas e o evangelho', 'James W. Gustafson

JAMES W. GUSTAFSON é membro fundador e presidente da Global Development Network, uma fundação sem fins lucrativos que opera na Tailândia, país onde trabalhou como missionário durante 27 anos, na área de plantação de igrejas e desenvolvimento de comunidades. Também foi diretor executivo de missões mundiais da Igreja da Aliança Evangélica Americana.

Usado com permissão.

James W, Gustafson algumas décadas, os cristãos discutem a integração entre evangelismo e desenvolvimento em missões mundiais, porém se deparam com certos obstáculos. Talvez o principal deles seja uma definição restrita de evangelismo, que limita essa atividade à apresentação verbal do evangelho. O evangelho de Jesus Cristo, no entanto, não são meras palavras pronunciadas. O evangelho é a Palavra viva. O evangelho é vida. É a encarnação do Verbo vivo de Deus nas culturas e na vida dos seres humanos.

À definição secular de desenvolvimento constitui um segundo obstáculo para os cristãos de consciência missionária. No conceito secular, o desenvolvimento, na maioria das vezes, diz respeito unicamente ao crescimento econômico, Com o objetivo de lucros maiores, essa interpretação promove uma atitude individualista e quase sempre é causa de rivalidade entre empresários. Essa ênfase no individualismo e na autorrealização vai contra a Palavra de Deus, pois a Bíblia tem por objetivo o bem da coletividade, ensinando a autonegação e o serviço ao próximo. Como cristãos, devemos lembrar que nossa definição de desenvolvimento provém dos princípios e valores das Escrituras, e não de Wall Street.

O terceiro obstáculo para a integração entre desenvolvimento e evangelismo é erguido pelos próprios cristãos, quando não viá

4 or, a o ço mumummae nã JAMES W. GUSTAFSON é membro ld q li god cics Ri Midas pune ii Tailândia, país onde trabalhou como missionário durante 27 anos, na área de plantação de igrejas desenvolvimento de comunidades. Também foi diretor executivo de missões mundiais da Igreja da Aliança Evangélica Americana. Usado com permissão.

vem a transformação operada por Cristo no próprio estilo de vida. É perceptível essa divergência do evangelho da graça na Igreja hoje, e sem dúvida é motivo de grande preocupação. É enganoso o sistema de valores religiosos que ensina que o ser humano deve trabalhara fim de ser moralmente bom. Somente na vida de cristãos que de fato entendem e acreditam no evangelho de Deus a graça vivida em cada aspecto organizacional da vida e do trabalho resultará em crescente transformação, tanto da Igreja quanto da sociedade ao seu redor.

Um obstáculo final para a integração entre desenvolvimento e evangelismo é que a Igreja é apresentada em muitas circunstâncias como uma estrangeira cultural. Isso acontece especialmente nos países de Terceiro Mundo, onde as culturas locais são vistas pelos missionários, implícita soa Ao ou explicitamente, ag como pecaminosas. Os formatos das igrejas ocidentais mantêm a reputação de ser puros. O resultado é que formatos relevantes de vida eclesiástica não são mes Gustafson explorados nem estabelecidos. O cristianismo ão Ocidente permanece estrangeiro ao coração cAmente dos demais povos. pesenvolvimento holístico integrado Na condição de missionário da Igreja da Alian-

Evangélica Americana durante 27 anos no “a aondeste da Tailândia, área também conhecida somo Issaan, faço parte de um ministério que spocura ultrapassar tais obstáculos para inteerar desenvolvimento, implantação de igrejas A evangelismo. Diversos missionários norteamericanos e uma equipe do nordeste tailandês (150 pessoas em 1994) estão engajados no que chamamos “desenvolvimento holístico integrado”, É “desenvolvimento” porque bus“ca transformar as pessoas do que elas são no que devem ser em Cristo. É “holístico” porque lida com a pessoa por inteiro, em todas as áreas da vida. É “integrado” porque todos os aspectos do ministério estão ligados: não há função nem existência independentes. O ministério hoje consiste na Igreja Aliança da Tailândia, na Fundação de Desenvolvimento Issaan (direcionada às necessidades sociais, econômicas e fisicas) e no Instituto para Desenvolvimento Sustentável (que controla o desenvolvimento de pesquisa e a grade curricular para o treinamento da igreja).

O ministério tem um foco principal: possibilitar o nascimento de Jesus Cristo na cultura

711 com as demandas da religião, mas ao aceitar a Cristo puderam encontrar a salvação. Os novos convertidos logo passam a espalhar as boas novas do evangelho entre os membros da família é entre os amigos, Desse modo, a Igreja continua a expandir espontaneamente.

Alguns dos membros de nossas equipes priorizam o treinamento, Eles desenvolvem uma teologia contextualizada e materiais de estudo para firmar os novos crentes na Palavra de Deus. Os que estudam os materiais ensinam outros crentes. Em vez de traduzir material do inglês para o tailandês, o grupo conta com teólogos tailandeses que trabalham com os missionários e produzem material tailandês para os nativos. Só para registrar, o ministério deu à luz mais de 40 igrejas-mães e mais de 250 igrejas-filhas. Alguns membros de nosso grupo também são especializados em artes. O trabalho deles consiste em traduzir o evangelho nas formas e expressões culturais do povo tailandês. Quem visita essas igrejas fica conhecendo as histórias do evangelho contadas por meio de peças teatrais e de danças tailandesas. O visitante ouve músicas de louvor com melodias tailandesas acompanhadas por instrumentos tailandeses. Utilizando-nos de todos esses meios, encontramos uma maneira de Jesus se tornar vivo no nordeste da Tailândia e de ser entendido por aquele povo.

Essa região é a mais pobre do país. Existe tailandesa daquela região. Membros de equipes dotados de uma “santa habilidade de persuasão ediálogo” percorrem os vilarejos para falar de Jesus. Eles não falam de religião. Ao contrário, dizem: “Não estamos aqui para mudar sua religião, porque todas as religiões são basicamente a mesma coisa: todas visam tornar o ser humano alguém melhor”. Em seguida, fazem menção da necessidade de conhecer a Palavra —a Palavra viwa, que é Jesus Cristo, o qual está acima de todas as religiões. Muitos dos que responderam Ge maneira positiva a esse método de evangelização eram pessoas religiosas que buscavam a verdade e não a encontraram no budismo. Eles aêmitiam que não era possível viver de acordo grande necessidade de se criarem oportunidades de trabalho, mas acreditamos que o desenvolvimento deve “servir”, e não “guiar”. Nosso trabalho é sempre baseado na igreja local. Não é visto estritamente como meio de evangelismo, mas como um caminho para que a igreja local cause impacto na vida social, econômica e física do povo. À peça-chave do empreendimento é a Fazenda Udon Patina, um complexo de três diferentes ecossistemas de fazendas que demonstra a agricultura sustentável da região.

Uma das fazendas contém um sistema de tanques de peixe e também cria patos e porcos. O estrume dos patos e dos porcos é misturado com gramíneas na superfície dos tanques.

Os peixes se alimentam do fitoplâncton eassim crescem e se multiplicam, À água dos tanquese os peixes mortos produzem fertilizante orgânico para à grama as árvores que crescem ao redor dos tanques. Os patos se alimentam do estrume dos porcos. Os porcos, peixes e patos podem sermir de alimento ou ser vendidos em beneficio do trabalho na igreja. Essas fazendas são modelos para projetos cooperativos empreendidos para atender aos vilarejos. Um projeto cooperativo em ação À vila de Nong Hua Koo possui todas as condições para um projeto cooperativo. Kitlowéo habitante típico da região, um lavrador arrendatário. Uma vez que metade de sua colheita pertence ao dono da terra, ele está constantemente em débito com os agiotas. Seus filhos muitas vezes não têm o bastante para comer. Com Wunde, a situação não é diferente. Apesar de ele possuir um pequeno campo de arroz,o clima e o solo da região não são bons paraesse tipo de cultivo. Ele também foi muitas vezes obrigado a emprestar dinheiro dos agiotasatéa colheita seguinte, Com taxas de 120% ou mais, era impossível para ele ter uma vida decente. A Fundação de Desenvolvimento Issaan aproximou-se da Igreja Aliança, da qual Kitlow e Wunde eram membros. Elas ofereceram a ajuda de uma cooperativa “peixe-pato-porco”. A fundação emprestaria o estoque inicial de animais, se responsabilizaria pela orientação nos negócios e faria uma doação para a compra da terra. Os membros da cooperativa, por sua vez, sairiam em busca de uma propriedade à venda, construiriam os viveiros para os porcos patos, escavariam um tanque para os peixes e concordariam em trabalhar juntos. Mais tarde, pagariam o empréstimo com os próprios animais.

As famílias de Kitlow e Wunde e outras cinco aceitaram a oferta, Agora que a cooperativa está estabelecida, cada família trabalha famílias consomem quase metade dos peixes que criam, Eles dão o dízimo dos lucros para a igreja e aplicam outros 10% em projetos no vilarejo, como reservar parte dos peixes para a merenda escolar do ensino fundamental, Os habitantes da vila percebem não apenas a generosidade, mas também a incomum cooperação. Eles véem os membros da comunidade socorrendo os doentes e os menos capacitados e ainda dividindo os lucros igualmente, Vilarejos cooperativos como Nong Hua Koo contribuem para melhorar a situação econômica das famílias participantes e abastecem a igreja com recursos, Mais importante, concedem oportunidade para que os membros vivam sua fé aprendendo a amar, a servir e a perdoar uns aos outros.

Além dos projetos ligados à agricultura, a cooperativa também ajuda igrejas locais a fazer diferença nas comunidades promovendo cursos que desenvolvam vocações e habilidades, como costura e mecânica, e ensinando primeiros socorros. Com isso, procuram satisfazer as necessidades básicas da população rural pobre. "Todos os programas visam à participação de grupos de pessoas, em vez de indivíduos, Desse modo, novas comunidades cheias de pessoas transformadas estão sendo estabelecidas no Nordeste tailandês. O povo fortalece seu relacionamento com Deus, com o próximo e coma natureza. Em resposta à graça de Deus, eles desenvolvem um estilo de vida dinâmico, resultado de uma transformação em seu sistema de valores.

Sete princípios básicos orientam nosso ministério: 1. Autoridade. No centro de todas as nossas atividades está uma crença inabalável na autoridade da Palavra de Deus. O evangelho da graça de Deus, com todas as suas implicações, forma o conjunto de crenças sobre o qual todas as políticas e práticas do ministério são baseadas.

nela um dia por semana. Ássim, conseguem vender porcos e peixes o suficiente para evitar 08 agiotas. Ninguém passa fome porque as

2. Integração. Cada aspecto do ministério está vinculado à graça de Deus. Gerenciamos nossa organização e nossa vida pelos parâmetros da graça. Planejamos, implementamos, avaamos e corrigimos problemas tendo por referência o princípio da graça como nosso modelo e guia, na dependência do poder da graça. 3. Flexibilidade. Tentamos fazer o possível para permitir que a graça de Deus seja comunicada ao nordeste tailandês. Paraalcangar esse alvo, estamos dispostos a alterar "qualquer aspecto de nossa organização, caso necessário. 4. Contextualização. O povo só se comunica com clareza quando compartilha uma cultura em comum. À comunicação efetiva é o que é entendido, não necessariamente o que é dito ou o que significa. Assim, o Jouvore a vida da igreja local, bem como a impacto à comunidade mais ampla com o poder transformador da graça de Deus,

Esse ministério, no entanto, enfrentou alguns problemas, O primeiro foi o rápido crescimento, O aumento do número de membros da equipe fez com que a filosofia básica por trás do trabalho fosse diluída, especialmente nos níveis periféricos. Depois que reduzimos o tamanho das organizações, pudemos nos concentrar na essência de nossos valores, Com o crescimento além do esperado, surgiu a tendência de se priorizar o suporte financeiro da organização. Quando descobrimos que estávamos mais preocupados em cobrir os custos operacionais que em fazer missões, concluímos que seria necessário reduzir o tamanho de nossa estrutura, de estrutura co sistema de administração, têm ultrapassado os limites culturais no nordeste da Tailândia. Confronto de poder. Como o evangelho da Braça encarou na cultura do nordeste tailandês e em toda a área de nosso ministério, amensagem de Cristo sustenta osistema de valores culturais da região de forma poderosa e eficaz. O resultado é a transformação dos valores e da mentalidade do povo. 6. Processo e mediação. O instituto ca fundação trabalham num processo de mediação coma Agrejalocal. Processo significa ir“para baixo e para dentro”, o desenvolvimento que começa com o próprio povo, especialmente os que "compõem a camada inferior da sociedade.

modo a torná-la administrável.

Outro problema era a falha em relatar os fatos com transparência e em detectar valores equivocados em nós mesmos e nos outros. Na cultura tailandesa, assim como na ocidental, existe a tendência de evitar tais confrontos. Diante do objetivo de crescer em força c em serviço ao próximo, precisávamos aprender a dialogar com os membros da equipe e a discordar uns dos outros em amor. Outros problemas poderiam ser mencionados, mas todos convergiam para o tema central: quanto mais aprendemos a negar a nós mesmos, a aceitar nossas fraquezas e a depender de Deus em cada detalhe, mais obtemos de sua sabedoria e de seu poder para suprir todas as nossas necessidades.

E Tem início com um diálogo que os envolve uma aproximação participativa. À mediação

O papel das agências missionárias, das agências cristãs de socorro e das organizações é o trabalho desenvolvido “para cima e para fora”, À fundação pode ligar igrejas locais à cenários recursos exteriores. Pode tam-Ê bém avaliar mercados, pesquisar tecnologia, gassim por diante. 7, Focona igreja local. A ipreja local, como unidade básica da sociedade cristã, é o ponto de partida óbvio para o desenvolvimento holís-

O alvo final é que cla se torne a organização local de desenvolvimento que cause de desenvolvimento locais consiste também na integração corrente de evangelismo e desenvolvimento na jurisdição da igreja local. Ambos são elementos fundamentais na missão da Igreja, e aí é que a transformação da sociedade começa. Uma vez que a igreja local, em qualquer cultura, é capacitada e treinada para influenciar seu contexto com o poder da graça de Deus, o evangelismo eo desenvolvimento se fundirão para causar a verdadeira transformação da sociedade,', 85 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Guzman, cap. 109: Nós como servos: obreiros latino-americanos no Oriente Médio', 'Andres e Angelica Guzman

ANDRES e ANGELICA GUZMAN (pseudônimos) são um casal latino-americano que por 20 anos trabalham na área de assistência e desenvolvimento humanitário. Eles são membros de várias organizações humanitárias seculares e cristãs. Escreveram diversos artigos e livros.

Andres e Angelica Guzman urante os 15 anos em que prestamos serviços humanitários no Oniente Médio, nossa equipe, formada por latino-americanos, teve o privilégio de testemunhar um movimento a favor de Jesus. Isso aconteceu na ocasião em que nossos amigos mais chegados e mentores transmitiam a vida e os ensinamentos de Jesus a várias centenas de pessoas de seus grupos populacionais. O movimento não aconteceu apenas como resultado de nossa relevância e progresso ministerial, mas também por conta da tradução das Escrituras, da formação de liderança e de uma visão encarnacional.

Antes da conclusão de nossa formação acadêmica na área médica, e mesmo antes de nos casarmos, minha esposa ceu nos sentíamos desafiados por textos como Isaías 49.6: “Te dei como luz para os gentios, para seres a minha salvação até à extremidade da terra”. Ainda levamos alguns anos até chegar à compreensão do que significava nosso chamado para servir os povos da terra, porque não tínhamos conhecimento de outras pessoas que compartilhassem de nosso interesse. Jamais havíamos ouvido falar de povos não alcançados e não tínhamos sequer ideia de que Deus estava operando por toda a América Latina, mobilizando sua Igreja no cumprimento da Grande Comissão.

Logo após nosso casamento, mudamos para outro país a fim de obter treinamento transcultural e começamos a pedir a Deus que nos levasse para o lugar no qual ele desejava que o servisseansamsammmmm mos. Sabíamos que Deus não nos havia chamado para sermos “missionários profissionais, e sim para nos unirmos a eleem sua missão de iluminar o mundo por meio do serviço aos necessitados, enquanto vivíamos e falávamos como discípulos de Jesus. Surgiua oportunidade, e, um ano depois, desembarcamos na cidade em que deveríamos supervisionar um projeto destinado a criar umsistema de distribuição de suprimento médico em cooperação com duas

ANDRES e ANGELICA GUZMAN (pseudônimos) são um casal latino-americano que por 20 anos NONO UR DSO desenvolvimento humanitário, Eles só rrasiros de vádãa Cipiniaddos himanitárias seculares é cristãé Escreverem diversos artigos e livros.

outras organizações com fins humanitários.

Paralelamente ao trabalho de manter o suprimento farmacêutico, instalamos um sistema informatizado para o depósito principal de medicamentos e para as farmácias de grande dis» tribuição ER he criadas Mag pelo Ministério ERAS da E Saúde. Desenvolvemos formulários e procedimentos a serem utilizados no depósito e nas farmácias e treinamos o pessoal. Fornecemos também informação especializada aos postos de saúde sobre ocri"sério para a correta administração dos medica“gentos, monitoramos o crescimento infantila “Em de conhecer o resultado dos programas nuericionais e fizemos levantamento das campaphas de vacinação realizadas, Desenvolvemos programas de treinamento para enfermagem, cirurgias, procedimentos de emergência, cuidados bucais e para os leigos envolvidos no serviço de saúde da população, Além dos projetos na área médica, também nos empenhamos em desenvolver um espaço para as viúvas “e mulheres de rua, no qual nos dispomos a “capacitá-las à sobrevivência,

Eram essas as nossas atividades, não apenas com o intento de converter uns poucos indiví“êaos ou ter uma desculpa para nossa presença. Pelo contrário, o que nos motivou foi o amor “3 Deus e ao próximo, Bascamo-nos na pessoa e nos ensinamentos do Senhor Jesus. Nosso desejo era demonstrar que o Reino de Deus realmente estava entre nós. Esperávamos que as pessoas percebessem algo diferente em nosso trabalho, porém nossa ajuda não implicava nenhuma forma de retribuição compulsória por parte da população atendida, Nosso esforço para realizar tudo isso não foi uma iniciativa isolada. A equipe latino-americana de que fazíamos parte era composta de membros procedentes da Bolívia, Colômbia, Costa Rica, México e de um médico canadense casado com uma mexicana.

No processo de servir a comunidade, acabamos por fazer muitos amigos: alguns oficiais do governo e suas famílias, homens de negócio, vizinhos, pessoas que nos auxiliavam com O idioma, membros da equipe e seus amigos. Aprendemos muito com eles: sua cultura, asimplicidade, o respeito pelos mais velhos, a culinária maravilhosa, as belas roupas, as danças alegres, sua criatividade.

Vivemos entre eles como discípulos de Jesus: dispomo-nos a perseverar sem nos deixar pasalisar pelo temor que se apoderou de muitos, porconta da instabilidade e dos conflitos ocor-É ridos na região, Aprendemos a viver alegremenveem meio à tensão, à falta de energia elétrica e à escassez de água, Envolvíamos o povo em nossas brincadeiras, oferecendo amizade incondicional, livres da pressão de ter de impressionar a Deus; compartilhando a capacidade de ouvir a voz dele, de falar-lhe acerca de nossas necessidades e de contar-lhe os segredos mais íntimos; testemunhando de nossa confiança na capacidade sobrenatural de Deus para curar e da autoridade para repreender, amarrar e expulsar os demônios, Também compartilhamos nossa convicção de que as boas novas sobre Jesus e seus ensinos não são exclusividade de uma religião, grupo étnico ou nação em particular, mas se destinam a todas as nações, tribos, famílias, contextos religiosos, gêneros e classes sociais, Tradução das Escrituras Sagradas Tivemos a oportunidade de auxiliar a sociedade bíblica da região na tradução do Novo Testamento no idioma da população minoritária de nossa área de atuação. Não foi difícil encorajar a distribuição da Bíblia. Descobrimos muitos Jíderes respeitados pela comunidade que partilhavam de nossa convicção de ser um direito inalienável de todos os povos a oportunidade de ler esse Livro tão respeitado. Nossos amigos muçulmanos estavam dispostos a receber a Bíblia, porque o profeta-fundador de sua re-Jligião os instou a ler os livros sagrados (Antigo e Novo Testamento) que foram escritos antes do livro sagrado deles, o Alcorão. Um novo movimento Em meio a tudo isso, muitos de nossos amigos decidiram seguir a Jesus. Alguns (sem que os incentivássemos) resolveram segui-lo, tornando-se cristãos, enquanto outros (também de forma voluntária) decidiram seguir a Jesus enquanto permaneciam na religião muçulmana. Outros ainda acharam por bem não se filiar a nenhum grupo religioso estabelecido, passando a chamar-se “crentes”,

O movimento entre os “crentes” nos surpreendeu pela forma rápida em que se multiplicou nos primeiros anos. Muitas novas comunidades germinaram. Acreditamos que existam muitos motivos importantes para tal acontecimento:

1. Eles experimentaram em primeira mão o convívio com verdadeiros discípulos de Jesus. Isso os ajudou a ver a beleza da pessoa e da doutrina de Cristo, livres dos nebulosos conceitos populares a respeito da suposta imoralidade, ganância, orgulho ódio dos cristãos pelos muçulmanos. Nossa vida crença e prática do Novo Testamento, se pedir a Jesus para guiá-la. Eles compreenderam que, independentemente da permanência ou não em sua comunidade religiosa de origem, poderiam se tornar seguidores de Jesus. 5. Foram incentivados a ser bênção, permanecenestava longe da perfeição, mas, pela graça de Deus, apresentamos um modelo de como viver como discípulos, até mesmo no que devemos fazer quando falhamos, À oportunidade de fazer contato com discípulos imperfeitos, porém genuínos, despertou neles o interesse de saber mais a respeito de seu Senhor. 2. O Senhor Jesus em pessoa se manifestou a muitos. Vez após vez, o próprio Senhor interveio a fim de conduzir a si aqueles que o buscavam. Ele lhes apareceu em sonhos c confirmou a verdade que lhes havia sido do em suas famílias e participando ativamente dos principais eventos, tomo casamentos efu= nerais. Nós os incentivamos a ajudarem os necessitados com disposição, a respeitarem as autoridades, a serem bons trabalhadores e chefes e a honrarem de todas as maneiras possíveis seu círculo familiar e seus vizinhos. É claro que eles também seriam bênção ao compartilhar a graça de conhecer verdadeiramente a Deus no meio de sua parentela e dos amigos, valorizando assim seus relacionamentos pessoais.

pregada. Eles testemunharam curas instantâneas e graduais, conforme orávamos pelas pessoas. Também experimentaram visõese receberam proteção sobrenatural. 3. Tiveram oportunidade de compreender que compromisso com Cristo e conversão cultural não são sinônimos. Nós é que nos convertemos à cultura deles, valorizando seu idioma, canções, provérbios, tradições, roupase alimentação. Mesmo quando se mostravam inseguros a respeito de si mesmos e de seu

Motivados pelo amor Todo esse movimento pelo Senhor Jesus aconteceu ao mesmo tempo em que estávamos tremendamente ocupados, dando o melhor de nós para proporcionar ao povo um serviço de socorro humanitário e condições de desenvolvimento de alta qualidade. Não oferecíamos nenhum brinde em troca de conversão religiosa nem distribuímos Bíblias ou qualquer outro tipo de literatura com nossos suprimentos médicos e cobertores. Não realizávamos apresentações do futuro como grupo populacional, nósosmotivávamos, demonstrando confiança nelese ajudando-os a prosseguir no serviço ao seu povo e seus familiares. 4. Tiveram oportunidade de compreender queo compromisso com Cristo é estendido a pessoas de todos os contextos culturais. Foiumagrande surpresa, quando eles descobriram que nós, embora provenientes de um contexto cristão, também tivéramos necessidade de nos tornar discípulos de Jesus, como ensina o Novo Lestamento, em João 8.30,31. Isso os ajudou a entender que qualquer pessoa, de qualquer contexto religioso, pode se tornar discípulo de Cristo, mediante a leitura, filme Jesus após as cirurgias. Procuramos servir a todos da mesma forma, motivados pelo amor de nosso Senhor Jesus por eles, seguindo seu exemplo de alimentar, curar e abençoar a: todos, independentemente de eles o seguirem ou não. Motivados pelo amor, e não porestratégia, não nos preocupávamos com a possibilidade de pessoas trocarem sua crença religiosa na esperança de beneficiar a si mesmas ou aos seus familiares, Não agregávamos nenhumaatividade religiosa ao nosso serviço humanitário e não diferenciávamos absolutamente a assistência prestada. Agindo assim, evitamos um problema comum a outros contextos, nos quais os chamados “cristãos do arroz” se convertiam saves Angelica Guzman “preligião de seus benfeitores na esperança de conseguir deles maiores benefícios. Sabemos que nossa abordagem pode papecer controvertida para alguns. Por um lado, dguns dirão que esse formato ignora a urgênpa em apresentar os fatos evangelísticos e que gsecisamos nos valer de todos os meios a fim de Pa “apresentar o evangelho a todos. Nossa simples sesposta ao argumento é que estamos seguindo 05 passos do senhor Jesus, o qual veio para «sei, e do apóstolo Paulo, que se satisfez em setomar tá “servo de todos À Grande Comissão dos são anula o Grande Mandamento,

Poroutro lado, outros poderão nos apontar o dedo por compartilharmos Jesus com nossos amigos, por considerarem que, ao fazê-lo, Ê

741 (uds corremos o risco de comprometer o trabalho humanitário. Contudo, nenhum autêntico seguidor de Jesus pode permanecer calado quando é questionado a respeito da origem dos frutos em sua vida, e todo trabalho humanitário tem motivações filosóficas que refletem indiretamente na maneira em que o trabalho é realiza- é do, Se servirmos à humanidade e falharmos em reconhecer a verdadeira fonte de nosso serviço, então estaremos anunciando a nós mesmos recebendo um crédito que não nos pertence.

Encontramos o devido equilíbrio em 2Coríntios 4.5: “Não nos pregamos a nós mesmos, mas a Cristo Jesus como Senhor a nós mesmos como vossos servos, por amor de Jesus”.

speseguir deles maiores benefícios, Sabemos que nossa abordagem pode pa“ecer controvertida para alguns. Por um lado, firaos dirão que esse formato ignora a urgén“qa em apresentar os fatos evangelísticos e que grmcisamos nos valer de todos os meios a fim de apessentar o evangelho a todos, Nossa simples dos mesposta do argumento é que estamos seguinpassos do senhor Jesus, o qual veio para vit, E do apóstolo Paulo, que se satisfez em ae tornar “servo de todos”. À Grande Comissão são anula o Grande Mandamento. Poroutro lado, outros poderão nos apontar a dedo por compartilharmos Jesus com nos“sos ASSES amigos, RE por considerarem que, ao fazê-lo, humanitário. Contudo, nenhar autêntico seguidor de Jesus pode permanecer calado ausundo é questionado à respeito da origem dos frutos em sua vida, é todo trabalho humanitário tem motivações filosáficas que refletem indiretamente na maneira em que o trabalho é realcado. Se servirmos à humanidade e falarmos em reconhecer a verdadeira fonte de nossa serviço, então estaremos anunciando a nós fes e recebendo um crédito que não nos pertence

Encontramos o devido equilibrio vim 2Coríntios 4.5: “Não nos pregamos a más mesmos, mas a Cristo Jesus como Senhor e a nós mesmos como vossos servos, por ativos de Jesus”.', 86 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Grigg, cap. 83: Os pobres urbanos: quem somos nós?', 'Viv Grigg

VIV GRIGG, no papel de diretor internacional da Urban Leadership Foundation, convoca obreiros para atuar em favelas de cidades do Terceiro Mundo. Ele liderou equipes pioneiras em Manila e Calcutá e viabilizou missões apostólicas, oriundas de vários países, para trabalhar nas favelas. Ele é o autor de Servos entre os pobres (Viçosa, MG: Ultimato, 2008), Cry of the Urban Poor [Clamor da pobreza urbana] e Transforming Cities [A transformação das cidades].

OE aconteceria se a população do mundo islâmico os do hindus dobrasse a cada dez anos? E se, além disso, esses povos estivessem entre os mais receptivos ao evangelho? De que maneira isso afetaria nossas atuais estratégias de missões? Acestaríamos o desafio?

SA EITA VIY GRIGG, nO papel de diretor e ças niucio aa inhos do ctdsdas dá Terceiro Mundo. Ele liderou equipes pioneiras em Manila e Calcutá é vabiizou mvssões apostóicas, oriundas de vários países, para egrndendrdg Vitimato, 2008), Cry of the Urboo Poor (Clamor da pobreza urbana] é Tronsforming Cisies (A transformação das cidades).

A resposta é um “sim” dramático O número de sem-teto e favelados das principais cidades do mund constitui um bloco tão grande quanto o de mulçumanos ou hix;dus: ele dobra de tamanho a cada década, e todos os indicadores sugerem que seja um grupo receptivo. Portanto, é lógico que as estratégias missionárias precisam se voltar para essas pessoas com um alvo prioritário.

A maioria dos que migram para as megacidades residirá em «ums (Bangcoc), squatter areas (Manila), shanty towns (África do Sul), bustees (Índia), bidonvilles (Marrocos), favelas (Brasil), cashabs (Algéria), ranchitos (Venezuela), ciudades perdidas (México) e barriadas ou pueblos jovenes (Peru). De modo geral, usarei o termo “favelas para defini-los, Às favelas tendem a ser comunidades de esperança. Seus ocupantes vêm em busca de trabalho, encontram algum espaço desocupado e, aos poucos, se estabelecem ali. Eles constroem casas, encontram trabalho e desenvolvem relacionamentos comunitários semelhantes aos das pequenas vilas de onde vieram.

Nas favelas, as forças e expectativas sociais geram um alto grau de receptividade ao evangelho. As missões atuais precisam alcançar as últimas tribos e cumprir os compromissos já firmados com os pobres rurais, mas as novas estratégias missionárias precisam encarar a questão crucial da guerra espiritual pelas megacidades. Dentro desse objetivo maior, alcançar os pobres urbanos se torna um dos alvos principais, por serem as verdadeiras vítimas da opressão e do mal das megacidades e dos governos totalitários. Eles ocupam um lugar importante no coração de Deus e sãoo caminho de acesso à elite e ao coração da cidade. Entre os grupos de povos mais alcançáveis da atualidade estão os migrantes, que preservam seus laços comunitários, os grupos de camponeses que se mudaram para as cidades e vivem nas favelas.

Nas últimas três décadas, cerca de um bilhão de pessoas deixou as áreas rurais rumo às cidades, Nos próximos dez anos, outro bilhão embarcará em ônibus lotados, de mudança para “as áreas urbanas. Para a maioria, O primeiro passo os coloca nas favelas, centros de grande escuridão e de atividade demoníaca.

(Que negócio vocês montariam se conseguissem sair da rua? perguntou meu amigo empresário neozelandês. Estabeleceríamos um quiosque de chá

Entre 1950 e 1980, o crescimento urbano das megacidades do Terceiro Mundo cresceu de 275 milhões para quase um bilhão, com previsão de dobrar até o ano 2000. Parece que, onde houver algum terreno vazio, casebres e barracos serão construídos, Poucos governos "têm condições de evitar esse fenômeno ou de atender às necessidades dos recém-chegados. Talvez nem mesmo os Estados Unidos, pela desaceleração de sua economia, consiga permanecer imune. Alguns dos pobres mais carentes vivemem casas de barro nas ruas da moderna cidade de Dhaka, em Bangladesh, uma cidade nova, mas que contava com 20 milhões de habitantes na virada do século. Os que vivem nas 771 áreasda periferia de Dhaka representam a maior parteda população. Por causa da falta de matéria-primae de outros fatores, existem poucas possibilidades deo crescimento industrial da cidade acompanhar a chegada de novos habitantes. Quase todo o crescimento da população “mundial nas próximas décadas será nas cidades, As populações rurais deverão manter os níveis atuais. Cada país tem, normalmente, pelo menos uma megacidade, que suga os recursos do país inteiro e cuja burocracia neutraliza o responderam.

Várias outras discussões resultaram na conclusão de que era um bom empreendimento para investir 100 dólares. No entanto, foram necessários dez dias para encontrar um espaço vago na rua. Eles tiveram de pagar à polícia duas núpias por dia a título de proteção, mas a proteção exigida pela máfia local reduziria sua margem de lucro a zero. Além disso, a filha de um deles adoeceu com febre, Ela tomou chuva e não tinha bons cobertores para enfrentar o inverno de Calcutá, e essa crise consumiu-lhes mais capital financeiro, Por não poderem pagar a máfia, os membros da família foram espancados. Cidade da alegria Calcutá, ó Calcutá! Cidade onde os poderes das trevas conquistaram tal controle sobre os líderes políticos e judiciais que somente as trevas prevalecem, e a máfia governa a população. À pobreza e o mal triunfam e infestam a vida dos cidadãos comuns até enlouquecerem de dor. Calcutá tem mais pobreza e mais níveis de pobreza que qualquer outra cidade do mundo, Caminho pela rua, e uma figura bem alimentada ce esbelta, com um bebê preso àcintura, corre atrás de mim, suplicando, suplipotencial de crescimento das cidades menores. À cidade de segunda grandeza, via de regra, corresponde a somente 10% do tamanho da megacidade. Chiang Mai, a segunda cidadeem tamanho da Tailândia, por exemplo, é 30 vezes menor que Bangcoc. “Os pobres migrantes: quem somos nós? Um homem era grande, com boa educação e falava um inglês fluente com sotaque britânico. Ooutro era nepalês, de baixa estatura, mascheio de sonhos, cando. Quatro mulheres brigam todos os dias pelo mesmo território. Um amputado sacode a caneca na esquina, e um velho jaz um pouco adiante, moribundo.

Em 1984, Geoffrey Moorchouse afirmou que 400 mil homens estariam desempregados na cidade." Ganguly comenta que talvez não exista outra cidade onde um milhão de jovens instruídos estejam inscritos nas agências oficiais de encaminhamento. Por toda a Índia, existem pedintes, mas nada se compara ao volume de mendicância em Calcutá.

Moorehousê, Caleutta (London: Penguin, 1984). apash Ganguly, Pains of an Obese City, The Week, 17-23 nov. 1985.

Além dos mendigos, entre 48 mile 200 mil indivíduos vivem permanentemente nas ruas. Uma pesquisa mostra que dois terços desses indianos têm algum tipo de trabalho regular, enquanto 20% são mendigos. O trabalho da maioria é intermitente, e quase todos já ganharam dinheiro vendendo verduras, papel, lenha e

As controvérsias constantes da política bengali representam morte para esses pobres, bem como o deslocamento econômico introduzido por um estado marxista teórico que é, na verdade, a continuação do domínio da classe rica. À escravidão perpétua das castas e da cultura hindu soma ainda mais mortos.

sucata. Mais da metade dos 3,5 milhões que vivem na região urbana são favelados. Dois terços das famílias de Calcutá ganham menos de 350 rúpias por mês (uma família é considerada pobre quando ganha menos de 600 rúpias mais ou menos 50 dólares por mês). Menos de 20% dos trabalhadores participam da indús-

Alguns níveis de pobres urbanos Seria um erro pensar que os pobres estão somente nas favelas ou que todos os que moram em favelas são necessariamente pobres. Favela e pobreza não são sinônimos, e mesmo entre os pobres existe uma estrutura de classe, uma tria organizada. À agricultura e o artesanato,e não a manufatura primária ou moderna, são a ocupação principal das pessoas. Cerca de 80% do território municipal, de 1.350 quilômetros escala. Quais seriam, então, os relacionamentos entre os favelados e a pobreza? Diferença entre pobres urbanos do Primeiro quadrados, estão ocupados por 3,15 milhões de favelados.

Há um nível de pobreza inferior àquele experimentado pelo mendigo, pelo morador deruae pelo favelado: é a pobreza dos que estão morrendo à beira das ruas; um velho com olhar fixo;alguns transeuntes que deixam umas moedinhas,a visita da irmandade de caridade aos que dormem debaixo de pontes inacabadas; a súplica comovente da mãe grisalha, violentamente trêmula de febre, que busca umas moedas para comprar remédio; atrás dela, dois menininhos barrigudos, obviamente no primeiro estágio da desnutrição. Calcutá exige, diariamente, que encaremos não apenas a pobreza e a desumanidade, mas essa face acinzentada da morte iminente. O fardo aumenta quando descobrimos que a superfertilidade inerente à pobreza obrigará cinco vezes mais pessoas a migrarem na próxima geração

Mundo e do Terceiro Mundo “Pobreza absoluta” é um termo para os que têm total incapacidade de preencher suas necessidades básicas: alimento, vestimenta e moradia. Muitos dessa categoria morrem de fome, e nessa categoria existem muitos níveis. Podemos, por exemplo, falar da desnutrição em primeiro, segundo e terceiro grau. Já a “pobreza relativa” existe no mundo desenvolvido e é medida pela

Pan ás ER dá 7 diz pag

(uns 20 anos). O fato é que não há mais terra, nem é possível mais fracionamento das roças. A produtividade agrícola, à medida que cresce, faz crescer também a migração, pois aumenta o número de crianças vivas, sem melhorar a qualidade da vida rural.

*Calcutta Metropolitan Planning Organization. 4 Report on the Survey of 10,000 Pavement Dawellers in Calcutta: Under the Shadow of the Metropolis they are citizens, too. Editado por Sudhendu Muukherjee (1973).

comparação do padrão de vida do indivíduo com o de outros da comunidade ou nação. Às vezes, é chamada também “pobreza secundária”, É, na verdade, uma maneira de medir a posição "de pessoas marginalizadas pela sociedade.

À pobreza, relativa ou secundária, geralmente é medida não em termos materiais ou econômicos, mas pela capacidade de possuire consumir bens e serviços, bem como pelas oportunidades de desenvolvimento. Quase sempre se refere à exclusão de oportunidades e de participação, ou seja, da marginalização social. Esse status marginal se associa e é provocado porum disponibilidade de tecnologia, que nos permite usufruir uma vida mais saudável e feliz.

À pobreza pode ainda ser definida em termos do potencial humano e da sociedade ou em termos de uma visão futura do que será um estilo de vida razoável ou ideal. Alguns estudiosos da Bíblia recentemente elaboraram suas definições ao redor do tema shalom do Antigo Testamento: da paz que resulta de uma sociedade justa e segura. Comunidades de pobres urbanos alcançáveis padrão de vida baixo em relação às presentes perspectivas sociais de uma vida confortável. Não ter carro numa cidade da Nova Zelândia, por exemplo, significa ser pobre e impossibilitado de participar da sociedade. No entanto,

As características físicas e a cultura de cada comunidade pobre diferem de um país para outro. Contudo, os processos formativos e os males resultantes são universais na maioria das principais cidades dos países do Terceiro Mundo.

esse já não é o caso, por exemplo, de Lima,no Peru. Um estudo da Organização Trabalhista

Podemos falar de três categorias internacionais primárias de pobres urbanos: moradores

Internacional utiliza uma medida de renda não designada para estabelecer a linha de pobreza, dividindo a soma da renda de toda a população pela quantidade de habitantes, assim estabelede prédios condenados, favelados e grupos especializados.

Os prédios condenados são imóveis que, no passado, foram residências de gente de clascendo um valor para efeito de comparação.

Ao falar da pobreza das favelas do Terceiro Mundo, geralmente tratamos de algo que ocorre num nível abaixo da pior pobreza de um país "ocidental, Afinal, a classe média de Calcutá é "mais pobre que os pobres de Los Angeles. A definição de pobreza é também, em grande parte, uma questão de percepção histórica. Os pobres de Manila não são tão pobres quanto a classe média da Inglaterra era há 400 anos, porém são pobres quando comparados à classe média de qualquer país atual. Como vemos, nossa definição de pobreza vem mudando diante da Relativamente poucas pessoas da sociedade Objetos de discriminação Pouca oferta de trabalho “Segurança” pela assistência do governo se média e alta. Podem ser chamados “núcleos de desespero”, onde irão parar aqueles que desistiram de tentar e os desajustados, mas aqui também se encontram outros grupos, como imigrantes recém-chegados que vivem perto de oportunidades de trabalho e estudantes, centenas de milhares, em busca da mobilidade ascendente da instrução.

Em São Paulo, cerca de metade dos pobres migrantes que ali chegam vão morar nas favelas. À outra metade vai para os cortiços, de onde, após uma média de quatro anos, são obrigados a sair para alguma favela. Porcentagem significativa da população Origem nas classes baixa e média Trabalhadores flexíveis e adaptáveis Busca diária para sobrevivência

Nos prédios condenados, há pouca coesão social ou esperança positiva que desperte ointeresse pelo evangelho. Uma vez que representam áreas mais antigas de pobreza e várias gerações de pecado, os corações ali estão endurecidos e, portanto, não constituem alta prioridade na plantação de igrejas.

Na questão da aceitação, é mais estratégico o trabalho em áreas recentemente povoadas, nas quais ainda existe esperança. Nesses locais, as pessoas sentem que são integrantes da cidadee morte envolve assistência, desenvolvime nto, organização e política, mas, como o brilhante Francis Xavier (missionário pioneiro na Ásia) aprendeu cedo na vida, as questões deste mundo não são resolvidas pela política nem pela força, e sim pelos mistérios da graça e da fé, Pela pregação da cruz, a morte lenta que prende a cidade será vencida, Eventualmente, serão os movimentos dos justos que reverterão a tendência destrutiva. À questão é criar movimentos de discípulos entre esses pobres e, em seguida, encontraram um pequeno espaço, arrumam trabalho e estabelecem relacionamentos semelhantes aos que tinham em sua terra de origem. A tarefa Consideremos as palavras de Jesus: “A vida eterna é esta: que te conheçam a ti, o único Deus verdadeiro, e a Jesus Cristo, a quem enviaste” (Jo 17.3). O confronto da vida com a [er oem berra om ip faço tosa aaa a a SUS TE US IST

Perguntas entre os ricos.

À definição de pobreza, seus tipos, suas causas e suas reações potenciais constituem um passo importante na formação desses movimentos. Quando compreendemos a extensão da necessidade e a possibilidade de aceitação, podemos refletir tanto na iniciativa divina quanto nas possibilidades estratégicas que devemos abraçar em nossa caminhada com Deus. CEAR A Sa pen le e para estudo

1. Que distinções são apresentadas entre ocidental?

os pobres do Terceiro Mundo e os pobres do mundo

2. Explique a diferença entre os núcleos de desespero distinção é importante para as missões urbanas? 3. Grigg diz que, “eventualmente, serão os movimentos

O que isso sugere para as estratégias de plantação de e os núcleos de esperança. Por que essa dos justos” que transformarão as cidades. igrejas?', 87 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Richardson, cap. 68: Os missionários destroem as culturas?', 'Don Richardson

DON RICHARDSON foi pioneiro no trabalho da World Team (anteriormente denominada RBMU Internacional) em meio à tribo Sawi, de Irian Jaya (hoje Papua, na Indonésia), de 1962 a 1977. Desde então, atua como ministro a distância para a World Team. Ele é autor de O totem da paz (Belo Horizonte: Betânia, 1978), Senhores da terra (Belo Horizonte: Betânia, s.d.), Fator Melquisedeque (São Paulo: Vida Nova, 2008) e Segredos do Alcorão (Londrina: Descoberta, s.d.). Richardson ministra palestras em conferências missionárias, seminários, faculdades e em aulas do curso de Perspectivas.

Don Richardson undo ii Diego de Lenda minicntdo conélico que À enormes bibliotecas maias, ele sabia o que tinha de fazer Quezmowdele, eram todos de “superstição e mentiras do Diabo”. Assm em ros, temos às vezes contrisuido para destro coleges Por ques aque não entendermos. Algures. “em teviraerm emma, mevgess enunes DON RICHARDSON foi pioneiro (anter te d nada REM Internacional) em meio à tribo Sawi, de lrian Jaya (hoje Papua, na indonésia), de 1962 à 1977. Desde então, atua como ministro à distância Betânia, 1978), Senhores do terro

O mundo é rapado em qurcebrs emacm somem Cestas seonisgema como Herman Melville, Seremos quão à Ipea besps esterecrtiparam cm emsmsranbram como destro emumaceuntams aguço róticos e enviados gos pah tuas tese Dorsa enlsg Dqoe dor ques pois de ongem (O puetoro Aluea Ade uso Mo crrrgeço Dipo. cem per Me hener, formem oo rage dhs ques dem Egrdrto o, E Egip berra sermões sobe e topo de sedoso comeres que aos serena uma mmessecindros tuo parto de quo «Puma rumo crnias reu j DacAreniA manga penas a tncuddados O rm dutos do O Perspectivas

Quando ou chuneso bubodo é cida ses 17. Muachener tas Hale entrar us torupios dios pars curmgulrar seus tolos

Interessante material literário, é preciso reconhecer:

Infelizmente, para os leitores ingênuos, “Abner Hale” passou a significar “missionário”. Nós o temos carregado nas costas desde então,

O antropólogo Alan Tippett, da School of World Mission, do Fuller Theological Seminary, nos Estados Unidos, certa vez pesquisou centenas de sermões dos primeiros missionários que 45 chegaram. Nenhum deles tinha o estilo bombástico que Michener sugere como típico nos arquivos de Honolulu, capital do Havaí. Parece que os críticos sugerem, ingenuamente, queseos missionários tivessem permanecido em seu país, os povos primitivos ficariam em paz para cumprir o mito do “bom selvagem” de Rousseau,

O fato é que os exploradores comerciais e outras forças seculares já destruíram culturas indígenas e numa escala assombrosa. Livingstone foi precedido pelos mercadores de escravos árabes. Amy Carmichael foi precedida por aqueles que arrastaram meninos e meninas sos templos, onde tiveram de enfrentar os ter"tores da prostituição infantil.

Forças seculares como essas destruíram povos inteiros. Na América do Norte, não apenas os famosos moicanos, mas também os huronianos e possivelmente 20 outras tribos indígenas foram forçadas à extinção pelos colonizadores ávidos por terras. Os pioneiros, certa ocasião,

Antes de 1858, as ilhas Andaman, na Índia eram o lar de pelo menos 6 mil pigmeus negros. Então os britânicos criaram uma colônia penal na ilha, e o sacrifício começou, Hoje restam apenas 600 deles. Tragédias semelhantes encontramos nas Filipinas e na África.

Atualmente, o ser humano se preocupa muito com as espécies animais ameaçadas de extinção e está certo. Contudo, centenas de espécimes humanos correm um risco ainda maior! Uma perda anual de dez tribos linguisticamente distintas talvez seja um cálculo conservador.

Apenas alguns governos do mundo criaram agências para proteger suas minorias étnicas. O Brasil, as Filipinas e a Índia são três exemplos. Às agências seculares, entretanto, sofrem de severas restrições orçamentárias, Além disso, outros assuntos governamentais podem interferir nos programas.

Por exemplo, pouco tempo depois que a Fundação Nacional do Índio, no Brasil, estabeleceu o Parque Nacional do Xingu como reserva para as tribos ameaçadas, foram construídas estradas modernas bem no meio dele! Como resultado, duas tribos “protegidas” do Xingu foram dizimadas pelo sarampo e pela gripe, introduzidos pelos operários da construção.

Está claro que a política “sábia” do “deixa como está” não está funcionando, O que, então, enviaram como presentes a uma tribo carroças cheias de cobertores infectados por varíola.

No Brasil, restam apenas 200 mil índios de uma população original calculada em 4 milhões. Nas últimas oito décadas, mais de uma tribo por ano tem desaparecido. -Talvezos leitores pensem que as tribos desapoderá interromper a marcha para a extinção? Subvenções, terras e programas de bem-estar social podem ajudar no nível físico (embora, às vezes, as autoridades ímpias introduzam o alcoolismo e outros vícios, solapando qualquer bem que seus programas tenham alcançado).

Todavia, o maior perigo para os aborípiparecidas do Brasil tenham sido absorvidas pela sociedade, mas não é o caso. Milhões foram brulilmente envenenados, metralhados ou dinamitados de aviões. Outros milhões sucumbiram à morte mais lenta c agonizante da apatia. Como 2invasão levou sua cultura à desintegração, os Índios até obrigavam suas mulheres a abortar. Eles se recusavam a trazer filhos a um mundo Que eles não conseguiam mais entender. E nes é aquele que tais programas não podem resolver a destruição do senso aborígine do relacionamento “correto” com o sobrenatural. Cada cultura reconhece o sobrenatural e tem procedimentos estritos para “ficar bem” com ele, Quando os forasteiros arrogantes ridicularizam a crença de uma tribo ou despedaçam seus mecanismos de “ficar bem”, estabelecese grave desorientação. Os nativos creem que apáticos, crendo que estão destinados a desaparecer como povo.

Assistentes sociais materialistas e cientistas também materialistas não são capazes de ajudar esse povo. Os nativos sentem até mesmo uma negação velada do sobrenatural, é ficam cada vez mais deprimidos.

Quem poderia, então, ajudar essa gente como um protetor dos índios em questões espirituais? Ninguém mais senão aquele que tem sido caluniado como inimigo número um: o missionário orientado pela Bíblia, aquele que honra a Cristo, Considerem os seguintes casos:

Menos de uma geração atrás, segundo Robert Bell, da Uncvangelized Fields Mission, a tribo vatuai do Brasil ficou reduzida aos seus últimos 60 membros, Isso aconteceu principalmente por causa de enfermidades contraídas de forasteiros e pelo costume dos uaiuais de sacrificar criancinhas aos demônios para evitar aquelas doenças.

Então, um grupo de missionários da UFM identificou=se com a tribo, aprendeu a sua lingua, deu-lhe um alfabeto, traduziu a Palavra de Deus e ensinou uaiuais à ler, Sem negar o mundo sobrenatural, os missionários mostraram aos uaiuais que um Deus de amor reinava supremo sobre o mundo dos espíritos e havia preparado para cles um modo de “ficar bem” num nível mais profundo do que eles jamais teriam sonhado.

Agora os uaiuais têm uma base racional até mesmo agradável para não sacrificar mais seus filhinhos aos demônios catribo começou novamente a crescer. Hoje os uaiuais estão se tornando uma das tribos mais populosas do Brasil, Os cristãos uaiuais, otimistas, estão ensinando a outros grupos indígenas em extinção como enfrentar o mundo de hoje pela fé em Jesus Cristo,

O arrependimento e a fé em Jesus Cristo podem vesolver muitos dos problemas de sobrevivência dos povos ameaçados. À ajuda aos uaivais, além de tudo, é apenas um exemplo

Perto de Stockbridge, onde fica hoje estado de Massachusetts, nos Estados Unida John Sargent, antigo misstonário america, e seus companheiros fundaram uma comunsdade a fim de preservar os direitos dos índios, preparando-os para a sobrevivência entre os curopeus intrusos.

Antes que o etnocentrismo fosse conside rado um mal social e antes do nascimento da. antropologia como ciência, Sargent e seus ajudantes, sem qualquer paternalismo, cultivarams terra lado a lado com seus amigos índios, Exercendo o que os antropólogos chamam ago “mudança dirigida”, eles também partilharam a fé cristã. Os índios receberam-na como se fosse sua própria fé.

Essa fé c o amor de seus defensores espirituais sustentaram a tribo por mais de um século de sofrimentos, pois alguns colonizadores gananciosos logo decidiram que a terraeraboa demais para “simples índios” e os expulsaram. Depois de protestar em vão, Sargent obteve garantias de terras mais ao oeste.

Alguns anos depois, a comunidade foi desarraigada novamente por outros colonizadores. E outra vez. Quinze vezes foram obrigados a

AR ie dos

PRO Es

TARA, o

Gis Po

EL CNA PERES ájtpo es, Tom rosana PE AR de

“mudar-se. Cada vez os missionários mudaramse com eles, lutando por concessões de novas terras e mantendo a comunidade unida.

Finalmente, a comunidade estabeleceu-se no Michigan, onde pôde descansar e sobrevive atéodia de hoje, Como benefício secundário, as "experiências missionárias ajudaram a convencer os estudiosos de que a ciência da antropologia era uma necessidade

Em ambos os casos que acabamos de mencionas, os missionários introduziram mudanças na cultura, mas não arbitrariamente nem pela “força. Eles apenas introduziram as alterações exigidas pelo Novo Testamento ou necessárias Asobrevivência do povo. Em geral, as duas exigências se justapõem (por exemplo, o fim do sacrifício de crianças entre os uaiuais).

Certa vez, um entrevistador censurou-me

(talvez por brincadeira) porque eu persuadira Atrbo dos sawis, na Indonésia, a renunciar ao canibalismo, (O que há de errado com o canibalismo?

ele perguntou. Os sawis o praticam há mihares de anos. Por que abandoná-lo agora?

Respondi:

alguns anos, 4 Holanda cedeu o Iria Ocidental (então chamado Nova Guiné) à Indonésia, Hoje, calcula-se que 100 mil indonésios migraram para lrian Barat, Será que os membros das tribos estão preparados para enfrentar seus vizinhos imigrantes, de espírito mais empreendedor? Ou serão extintos?

Esparsos pelo Irian Barat, mais de 250 misstonários evangélicos (muito pouco) estão ministrando o evangelho às duas raças, Na língua indonésia, como também nas línguas das 400 tribos do Irian, eles estão ajudando os membros das culturas conflitantes a se entenderem. Com a ajuda do governo indonésio, eles estão otimistas, crendo que um choque cultural maior pode ser evitado.

Mediante a fé em Cristo, dezenas de milhares de irianeses começaram uma suave transição para o presente século.

É claro que crises étnicas dessa magnitude são delicadas demais para serem abandonadas à mercê dúbia de interesses puramente comerciais. Os missionários, cujo coração transborda do amor de Cristo, são a chave.

Será que um povo que pratica o canibalismo pode sobreviver no mundo de hoje? "Não, não pode. Os sawis são agora cidadãos da República da Indonésia. À República da

Imperialismo cultural: acusação procedente? Os missionários são imperialistas culturais? Decida você mesmo. Avalie as acusações de um jornalista

Indonésia não permite que seus cidadãos comam gente. Por isso, parte de minha tarefa foi dar aos sawis uma base racional para renunciarem voluntariamente ao canibalismo antes queas armas da polícia começassem a decidir q questão, "Em outro nível, a cultura sawi cultivava uma tencbrosa compulsão de venerar os patentes mortos apalpando e até mesmo comendo acame putrefata dos cadáveres, mas quando os sawis receberam a doutrina cristã da ressurreição, imediatamente abandonaram essa prática, contra os missionários, feitas depois que efe visitou oTrian Barat para cobrir os efeitos de um gronde terremoto ocorrido ali, em junho de 1976, Hlamash MeDonald rapidamente voltou sua atenção para as relações existentes entre os povos das tribos é 05 MISSIONÁTIOS, E, LOIRO consequência, aparrici o seguinte artigo no jornal The Hashington Post, publicado na capital dos Estados Unidos, em sua edição de 3 de agosto de 1976:

PAIN

JAYAPURA, Irian Barat Missionários cristãos fundamentalistas estão provocando rea-

Quase com um suspiro de alívio. O evangelho curon-os dessa estranha compulsão.

Os sais são uma dentre mais ou menos tribos melanésias de pele escura que estão saindongora da idade da pedra em Irian Barar.Ha ções hostis, e às vezes até assassinatos, por parte dos moradores primitivos das tribos, que vivem nas regiões montanhosas ao sul desta ilha. No mais sério dos últimos incidentes, cerca de nm ano e meio atrás, 13 ajudantes locais de uma (a A missão foram assassinados e devorados tão logo o missionário europeu partiu de férias.

Antropólogos e outros observadores também estão criticando contundentemente os missionários por sua tentativa de destruir quase totalmente as culturas locais nas áreas que evangelizam. Considera-se tal fato a causa básica de recentes e violentas agitações, contrastando com as políticas mais flexíveis de grupos católicos romanos e missionários protestantes tradicionais.

Os fundamentalistas estão atuando na região montanhosa de Jayawijaya, de difícilacesso, emssisasessnamainecaas canmaa DIONETTOO COVCOOT DO CLAN pouco conhecida e teve seu primeiro contato com o mundo exterior há apenas 20 anos, 54 recentemente a população melanésia ali restdente aprendeu a usar os metais. Eles subsistem à base de batata-doce, cana-de-açúcar e bananas, alimentação suplementada por carne de porcoe de pequenos marsupiais e aves que eles caçam com arco e flecha.

deus únicos animais domésticos são os porcos, que eles acreditam ter alma. Quando indaguei a um antropólogo por que eles comiam taís amigos íntimos, ele respondeu: “Dá na mesma, Eles também comem gente”.

onde agora se realiza a parte mais difícil do trabalho de ajuda após os recentes terremotos que, acredita-se, mataram pelo menos mil pessoas.

Eles pertencem a cinco grupos missionários: a Aliança Cristã e Missionária, a Missão aos Campos Não Evangelizados, a União Missionária paras as Regiões Remotas, a Missão da Aliança Evangélica e a Missão Cristá da Ásia e do Pacífico. Esses cinco movimentos estão agrupados numa organização denominada A Aliança Missionária. Eles são apoiados por um grupo técnico missionário, a missão Asas de Socorro, um eficiente serviço aéreo que dispõe de 15 aviões pequenos e um helicóptero. Esse último aparelho é essencial num território onde a estrada pavimentada de maior extensão tem 40 quilômetros de comprimento, ligando Jayapura, a capital provincial, ao aeroporto. Esses grupos recebem bom apoio de congregacionais, batistas e grupos bíblicos fundamentalistas sem vínculo denominacional, estabelecidos na América do Norte, na Europa e na Oceania, embora a maioria das pessoas ligadas aos cinco grupos missionários e a maioria dos recursos financeiros provenham dos Estados Unidos.

Os homens usam, apenas o koteka, uma cabaça em forma de pênis que é pendurada à frente dos órgãos genitais, e as mulheres, pequenos tufos de palha à frente e atrás. Separados por um terreno escarpado e por diferenças de língua até mesmo de seus vizinhos mais próximos, eles lutam periodicamente entre si em locais preestabelecidos.

Embora a cultura deles reconheça a propriedade pessoal e familiar, eles são notáveis por sua disposição em compartilhar. O cigarro é seu único vicio, o qual veio do litoral, de algum modo, num passado esquecido. Pequenas conchas usadas em suas transações são a única coisa que faz lembrar dinheiro.

Sua cultura e sua religião tradicional expressam os conceitos humanos mais básicos. Elese outras 900 mil pessoas no Irian Barat produzem belíssimas obras de arte em escultura tradicional e em trabalhos manuais.

Geralmente, ao chegar, o missionário constrói sua casa sozinho, próxima a uma pista de pouso de terra. Um deles contou-me: “À primeira coisa a fazer é mudar-se para junto deles e viver com eles. Você deve provar que quer aju-

Algumas vezes rejeitando o rótulo de “fundamentalistas”, eles se descrevem como cristãos “ortodoxos” ou cristãos “fiéis à Bíblia”. Sua característica central é a crença na verdade literal à da Bíblia.

Nos últimos anos, eles estabeleceram dif versas missões nas montanhas de Jayawijaya, região da qual ainda não existem mapas. É bem dá-los, dando-lhes alimentos, remédios e abrigo, ensinando-os e aprendendo a língua deles. Em geral leva-se dois a quatro anos para aprendera língua. Creio que o que estamos procurando é a chave cultural, a chave que destrava a cultura e abre a porta para o evangelho entrar”.

Todavia, muitos missionários parecem consideraro evangelho incompatível com a cultura

Dono e os emerson mad omilioad ento mo o O

—eses mo eee e sommemmncemr os qa cosa rem emana cum eo te o a apro mo apo O O a o Mono to meg ensendaa erga EO eg a a a O UNO MO UMA A a e ij mora como co a dio ri O a ces o a a

O oe oca semeadas caga rguni centrada cap

O A e a A e O a conta ASI O o rua otra ad ear rosguadito mp a padre o senna cum pregnant O opta a pa Perna O sea Co ad O O O a a e can na O a De

Mebefa danos Sopfimnadd iallruião aah ai) copo Senpe açao rop ris ate cpa piaa AMT 6 dragao Croata O CDA

RR a ca op Usina nto arsrr atri der qa É rio seta og preço ut certas IS O) SO Apac) AN O E O ro o di a a a a a a tai actua UM a a e A co IS O aj o ua a À O AD gos o po À gta a e À ice nO Se A a O a

AMÇ) Us ae priaação À O epa pe apago So co pg o a on ip MAD nte

Ceni O ap rasa O O ds Ca sa ap A tradicional, na qual não distinguem nenhum valor maior. Um missionário que atua na região fronteiriça com Papua Nova Guiné referiu-se aos velhos que se mantinham à distância de sua missão como “não tendo qualquer interesse que atuam no lado sul de Irian Barat, de conformidade com uma divisão territorial iniciada pelos holandeses e mantida pelos indonésios após a transferência de administração, em 1963.

“À diferença entre eles é bem simples”, afirnas coisas espirituais”. À primeira providência de um missionário que ficou algum tempo em determinado vale foi distribuir camisas aos homou uma fonte em Jayapura. “Os protestantes tentam destruir a cultura. Os católicos tentam preservá-la.”

mens da tribo. Na missão em Nalca, as mulheres foram persuadidas a aumentar até o joelho o comprimento das saias de palha, aparentemente para satisfazer o recato dos missionários.

O uso do cigarro é condenado e proibido como pecaminoso. Até bem recentemente,o serviço aéreo missionário revistava a bagagem e recusava-se a transportar quem fosse estivesse levando cigarros ou bebida alcoólica.

Em 1968, dois missionários ocidentais fo"ram mortos no sopé do lado sul da cordilheira de Jayawijaya. Três meses atrás, um missionário americano foi praticamente expulso do vale Fa-Malinkele por causa do tratamento que dispensava à população.

O incidente de canibalismo ocorreu numa missão chamada Nipsan, onde o missionário holandês empregara ajudantes irianeses originários de uma região que fora evangelizada havia "muito mais tempo, próxima de Wamena, bem mais oeste. Quando o missionário partiu para seu país, os moradores da tribo voltaram-se contra os 15 ajudantes, matando e devorando 13 deles. Dois conseguiram escapar para a selva. Posteriormente, uma unidade do exército indonésio entrou na área, mas abandonou o casoem razão de complicações de ordem legal.

Em seguida, o missionário holandês fez uma viagem de levantamento de recursos pela Europa e América do Norte, com vistas a comprar um helicóptero com o qual se propunhaa

Numa missão denominada Jaosakor, próxima do litoral sul, os católicos consagraram recentemente uma igreja que foi em grande parte idealizada pelos habitantes locais e que incorporou as tradicionais esculturas asmats ao redor das paredes. O bispo Alphonse Sowada, de uma ordem de padres sediada no estado de Nebraska (Estados Unidos), conduziu a cerimônia em trajes episcopais acompanhado pelos líderes locais, que estavam pintados conforme a tradição e usavam colares de dentes e ossos pendurados no nariz. Espalhar cal, obtida de conchas do mar queimadas, constituiu o ritual de dedicação. À cal foi espalhada com recipientes de bambu sobre as paredes, o chão e o altar, segundo os costumes do povo asmat, na inauguração de seus edifícios comunitários.

Exige-se de quase todos os missionários católicos em Irian Barat que tenham pelo menos mestrado em antropologia para poderem iniciar seu trabalho. Muitos têm escrito artigos e livros sobre os povos locais. “À base de nosso método é que cremos que Deus já está atuando na cultura existente, ideia que é uma consequência da crença de que Deus criou todas as coisas e está presente em todas elas”, declarou um sacerdote. Inocentados Como você responderia às afirmações de McDonald? Em 21 de setembro de 1976, enviei uma carta realizar evangelização aérea, por meio de um alto-falante. Entretanto, na primeira vez em áâguele jornal, porém ela jamais foi publicada na coluna “Cartas ao editor”. Esta é, em forma ligeique tentou tal empreendimento, um mêsatrás, conforme informações obtidas, nuvens de flechas receberam o pregador aéreo.

Os fundamentalistas são comparados negativamente aos missionários católicos romanos ramente resumida, minha carta aberta: Prezados senhores, Poucas semanas atrás o jornalista Hamish McDonald chegou ao Irian Barat para realizar uma reportagem sobre o terremoto que recentemente devastou uma região montanhosa aqui. Pelo menos, foi o que ele disse aos missionários de cuja ajuda precisou para alcançar a área atingida,

O terremoto despertou atenção especialpor ter atingido o habitat de inúmeras das últimas tribos remanescentes da idade da pedra de toda a terra, algumas das quais ainda praticam o canibalismo. Provocando literalmente milhares de deslizamentos de terra, a catástrofe varreu 15 aldeias tribais, matou mais de mil pessoas e deixou 15 mil sobreviventes com apenas 15% de suas plantações. Os missionários que McDonald abordou estavam ocupados, preparando-se para despachar por avião uma urgente remessa de alimentos. Ainda assim, gentilmente ofereceram-lhe lugar num dos vôos lotados que ja partir de Jayapura para o interior.

O mundo jamais teria tomado conhecimento da existência dessas tribos nem as agências internacionais de socorro teriam sabido daquela tragédia se uma dúzia ou mais de missionários evangélicos protestantes não tivessem explorado aquela região, que era desconhecida até 15 anos atrás. Com o risco da própria vida,os cosingênuos, instalados em suas torres de marfim, poderão protestar, dizendo que as culturas primitivas remanescentes de todo o mundo devem ser deixadas em paz, mas os fazendeiros, os exploradores de madeira, os especuladores deterra, os garimpeiros, os caçadores, os chefes militares, os construtores de estrada, os colecionadores de arte, os turistas e os traficantes de drogas não querem saber disso.

Eles irão de qualquer maneira. Geralmente para destruir. Para se aproveitar. Para explorar. Para sacrificar. Para corromper. Tomando para si e dando muito pouco em troca, à não ser doenças para as quais os povos primitivos não têm qualquer imunidade nem remédios.

É por essa razão que, desde o início do século, mais de 90 tribos desapareceram, apenas no Brasil. Muitos outros países da América Latina, África e Ásia apresentam uma taxa igualmente alta de extinção de suas minorias primitivas. Uma perda irrecuperável de cinco ou seis tribos em todo o mundo por ano é um número provavelmente conservador.

Nós, os missionários, não desejamos o mesmo destino para essas magníficas tribos do Irian Barat. Arriscamos nossa vida para chegar prievangélicos conseguiram conquistar a amizade de milhares e milhares dos desconfiados e imprevisíveis moradores das tribos. Meticulosamente, aprenderam e analisaram as línguas tribais ágrafas, tarefa tão árdua que pessoas menos motivadas não encontrariam tempo para isso. Eles também abriram com as próprias mãos as quatro pistas de pouso que tornaram possíveis as operações de socorro e que, diga-se de passagem, permitiram a McDonald realizar sua tarefa no local.

O avião missionário fez uma parada num desses campos de pouso. McDonald pulou do avião e começou a tirar fotografias.

Há razões para os missionários terem ido a regiões tão remotas como o Jrian Barat tão logo fosse possível. À História ensinou-os que até mesmo as minorias culturais mais isoladas hnalmente serão surpreendidas pela expansão comercial e política de povos maiores. Acadêmimeiro a eles porque cremos que somos agentes de mudança mais compreensivos que aqueles movidos por motivações materiais e que estão ávidos de lucro. À semelhança de nosso precursor, John Sargent, que em 1796 lançou um programa que salvou a tribo moicana da extinção, e de nossos colegas no Brasil que, apenas uma geração atrás, salvaram os uaiuais de um destino semelhante, cremos que sabemos como preparar as tribos do Irian Barat paras sobrevivência no mundo moderno. À pergunta: “Alguém deve ir?” está ultrapassada, pois obviamente alguém irá.

Essa pergunta foi substituída por uma de ordem mais prática: “Será que as pessoas mais compreensivas e solidárias chegarão primeiro?”. Para tornar o mais aceitável possível o choque de deixar a idade da pedra. Para que se garanta que os indígenas tenham novos ideais para substituir os que devem perder a fim de sobreviverem. Para ensinar-lhes a língua do país a fim de que possam se defender nas disputas com os “civilizados”. E, ainda assim produzir literatura no idioma deles, de modo que este não seja esquecido. Para ensinar-lhes o valor do dinheiro, de modo que comerciantes inescrupulosos não consigam se aproveitar deles. E, mais importante, para que alguns deles se iniciem nos negócios de maneira que o comércio na região não caia inteiramente em mãos de pessoas de fora. Para cuidar deles quando as

O preciso ser compreensivo. Às vezes, não é fácil encontrar ajudantes responsáveis dispostos ase aventurar conosco nessas regiões selvagens. Hálhoras em que você tem de confiar em alguém, não há escolha.

Antes disso, em 1968, dois de nossos colegas bem chegados, Phil Masters e Stan Dale, morreram juntos enquanto desbravavam uma nova área da tribo yali, Mas então Kusaho, um ancião yali, repreendeu os jovens que os haviam matado, dizendo: “Nenhum desses homens jamais epidemias irromperem e quando os terremotos ocorrerem. É, mais importante, para treinar alguns deles como enfermeiras e médicos que irão cuidar dos demais quando tivermos ido embora. Nós vamos a eles como defensores de seus interesses, ajudando culturas em conflito a se compreenderem mutuamente.

Nós, os missionários, somos defensores não apenas da verdade espiritual, mas também da sobrevivência física, e temos obtido surpreendente êxito em Irian Barat e em muitos outros "lugares, Entre os ekaris, os damals, os danis, "os ndugwas e outras tribos, mais de 100 mil pessoas da idade da pedra deram as boas vindas ao nosso evangelho como a concretização de algo que suas respectivas culturas haviam anunciado por centenas de anos. Os ekaris chamam asso aji, Para os damalis, é hai. Para os danis, nabelan-kabelan uma mensagem imortal que fez algum mal contra qualquer um de nós, nem mesmo resistiram enquanto vocês os matavam. Com toda certeza, eles vieram pacificamente, e vocês cometeram um terrível engano. Se outros homens desse tipo chegarem ao nosso vale, devemos recebê-los bem”.

Foi assim que uma porta de aceitação se abriu através dos ferimentos causados em nossos amigos. Foi uma vitória de preço elevado. Às viúvas de Stan e de Phil ficaram sozinhas para criar, cada uma delas, cinco crianças. Ainda assim, nenhuma delas culpou quem quer que seja pela morte do marido, e uma delas ainda hoje trabalha conosco no Irian Barat.

Nossa tarefa é grande e bem difícil. Ela não recebe subsídios de nenhum governo, e só conseguirá se sair bem caso conte com o apoio ea compreensão das igrejas, dos indivíduos e do público em geral. Era aí que o corresponum dia iria evitar a guerra entre as tribos caliviar o sofrimento humano.

O resultado: realização cultural do tipo mais profundo possível. Isso abriu a porta para a fé em Jesus Cristo a dezenas de milhares.

Em meio aos nossos êxitos, também temos "experimentado retrocessos. Quase dois anos atrás, um de nossos colegas de uma missão europeia, Gerrit Kuijt, deixou alguns ajudantes nativos, oriundos do litoral, cuidando de um novo posto missionário enquanto ele teve de "voltar à Holanda. Na sua ausência, um número pequeno desses ajudantes começou a perturbar os indígenas das redondezas por razões pessoais. Ireze ajudantes foram mortos em represália.

dente McDonald poderia ter ajudado. Mas em vez disso...

McDonald passou, então, para um helicóptero da organização Asas do Socorro, carregado com batatas-doces ofertadas pelos cristãos da tribo dani e com arroz vindo dos armazéns do governo indonésio. O piloto Jeff Heritage reparou que McDonald parecia surpreendentemente desinteressado nas inúmeras aldeias indígenas em dificuldades, que eram como ilhas no meio dos deslizamentos de terra intransponíveis, com seus moradores à beira da inanição. Após ter passado umas poucas horas no interior, ele voltou ao litoral e escreveu sua reportagem.

Empregando o chavão “fundamentalista” com a intenção óbvia de nos estigmatizar e nos aborrecer, McDonald lançou um ataque voraz, ainda que sem base, que apareceu como arti= go de fundo do Hishington Poste foi enviado pelo serviço telegráfico a centenas de jornais ao redor do mundo, Citando a perda dos ajudantes de Gerrit Kuijt e o assassinato de Phil e de Stan, ocorrido hã oito anos, ele feza absurda acusação de que estamos “provocando reações hostis, e às vezes até assassinatos, por parte dos primitivos moradores das tribos", Ele

A mudança direcionada é exatamente 0 qu o missiônário evangélico John Sargent pôs em prática já em 1796 e o que estamos praticando em 1976, Na verdade, os missionários são vir. tualmente os únicos a fazê-lo. Os antropólo. gos não permanecem no meio das tribos tempo suficiente para tal, Os humanistas não se encontram suficientemente motivados, mas caso estejamos, de fato, sendo objeto de crítica, um repórter cuidadoso deveria, pelo menos, ter-nos prossegue: “Antropólogos e outros observadores também estão criticando contundentemente os perguntado o que tínhamos a dizer em nossa defesa. McDonald não o fez, embora tivesse missionários por sua tentativa de destruir quase totalmente as culturas locais...”

Quem são esses antropólogos e os outros observadores? Dentro de nossos quadros, temos inúmeros homens que possuem mestrado e doutorado em antropologia, e eles não nos advertiram acerca de nenhuma critica contundente por pessoas de sua especialidade. Nos últimos 20 anos, temos cooperado com grande número de antropólogos em Irian Barat e tem havido uma boa compreensão mútua entre eles e nós.

É possível que McDonald esteja se referindo aos três membros remanescentes de uma equipe cientifica alemã que ele encontrou numa das paradas do helicóptero no interior. É sabido que alguns membros dessa equipe têm sido muito críticos em relação a nós, não com base em amplo conhecimento de nosso trabalho, mas em atitudes antimissionárias que trouxeram consigo para O Inian Barat.

O problema deles é que se apegam auma velha escola de antropologia, ainda em voga em algumas áreas, que defende o isolamento de tribos primitivas de todas as mudanças, como em reservas animais. Uma nova escola, que agora está surgindo nos Estados Unidos, tem pelo menos reconhecido a futilidade desse método e defende a ideia de que as tribos primitivas sejam expostas a “mudanças direcionadas”, voltadas para a sobrevivência, a fim de que possam aprender a lidar com o avanço de povos mais desenvolvidos, o que é visto agora como inevitável.

oportunidade, Que provas ele apresenta para a acusação de que estamos tentando “destruir quase totalmente as culturas locais” no Jrian Barat? Ele afirma: “A primeira providência de um missionário em determinado vale foi distribuir camisas aos homens da tribo”.

Os indígenas em questão haviam acabado de perder a maioria de seus lares no terremoto, As autoridades indonésias providenciaram camisas para que se mantivessem aquecidos durante a noite nos abrigos improvisados, que ficavam em altitudes de cerca de 1.700 metros acima do nível do mar. Ninguém desejava um surto de pneumonia a complicar as operações de socorro. Johnny Benzei, o missionário, cooperou com as diretrizes governamentais, distribuindo as camisas.

Em lugar algum e em momento algum, fornecemos roupas de estilo indonésio ou ocidental até que a necessidade para tal surgisse entre os moradores das tribos. Isso geralmente leva de 7a 15 anos para ocorrer. Os líderes das igrejas das tribos pregavam a céu aberto ou debaixo de abrigos cobertos de palha, usando as cabaças em forma de pênis, e ninguém se preocupava com isso. Ainda hoje, a grande maioria dos homens continua usando as cabaças, as mulheres, saias de sapé.

É o governo indonésio, não os missionários, que tenta constranger os indígenas a trocar as cabaças e saias de sapé por calçõese vestidos. É a chamada Operação Koteka. O governo, porém, o faz por razões compreensíveis. Ele quer que os indígenas se tornem parte da sociedade indonésia o quanto antes, encontrem empregos etc,

Em Nalca, McDonald tirou rapidamente uma fotografia de um nativo com uma caneta esferográfica presa através do septo perfurado do nariz. Essa foto apareceu em alguns jornais comuma legenda ridícula: “Caneta esferográficasubstitui osso; pregadores fundamentalistas destroem a cultura”, Um nativo apanha uma caneta esferográfica usada do cesto de lixo de “Johnny Benzei, prende-a ao nariz, e pronto! -Acusam Johnny de destruir a cultura, Muito ardiloso, McDonald,

McDonald mais uma vez se volta contra Johnny: “Na missão em Nalca, as mulheres foram persuadidas a aumentar até o joelho o comprimento das saias de palha O que de fato o que permite aos antagonistas ver seus problemas por outro ângulo.

Somos contra a magia, cujas suspeitas são uma das principais causas de guerras. Matar por meio da magia é contrário não apenas aos conceitos cristãos de bondade, mas também aos conceitos humanistas, ou não é?

Somos contra a promiscuidade sexual, e não apenas por motivos religiosos. Em 1903, comerciantes chineses, à procura de plumas da ave-do-paraíso, desembarcaram no litoral sul de Irian Barat, Eles introduziram uma doença venérea chamada /ymphogranuloma venereum entre os 100 mil habitantes das tribos merinds. Uma vez que o sexo grupal era largamente aceito, a doença se espalhou como fogo no palheiro e matou 10 mil pessoas em dez anos.

acontece é que algumas famílias danis acompanham os missionários a lugares como Nalca, c depois de alguns anos as mulheres de Nalca começaram a imitar o estilo das mulheres danis, cujas saias são mais compridas.

Será que isso quer dizer que concordamos com tudo que existe nas culturas locais? Não, não concordamos, assim como ninguém em nossa cultura ocidental concorda automaticamente com tudo que nela existe.

Nosso propósito é extinguir o canibalismo,o Qquetambém é o propósito do governo indonési, À diferença é que empregamos a persuasão "morale,se falharmos, o governo finalmente virá, "empregando a força bruta. Nossa tarefa é dar aos indígenas uma base racional para abandonar voluntariamente essa prática, antes que as armas da polícia decidam a questão com resultados traumáticos.

Também queremos acabar com o estado de guerra entre as tribos, que já dura sécuos. Em vista de tudo que eles têm de atra-Vessar nos próximos 50 anos, é imperativo "Que parem agora de matar e de ferir uns ao Outros. Com certa frequência, temos conse-Euido parar a luta ao enfatizar mecanismos de "pacificação pouco usados e já existentes nas Próprias culturas. Ou simplesmente proporq Sionamos a presença de uma terceira pessoa,

McDonald tenta criar antagonismo ainda maior contra nós ao comparar desfavoravelmente nossos métodos com “as políticas mais flexíveis de grupos católicos romanos e missionários protestantes tradicionais”.

Apenas uma missão protestante “tradicional” trabalha no interior de Irian Barat, e eles enfrentam os mesmos problemas que McDonald emprega como base para nos incriminar. Por exemplo, oito anos atrás o diretor daquela missão foi seriamente ferido por três flechas, e oito de seus carregadores foram mortos enquanto faziam uma viagem através de uma região inóspita. Tais incidentes são simples contratempos desse trabalho, e não devem ser empregados para jogar a culpa em quem quer que seja.

Até onde eu saiba, os missionários católicos romanos não têm sido feridos nem mortos pelos indígenas em Irian Barat. Isso se deve não às “políticas mais flexíveis”, mas ao fato de que eles limitam seu trabalho principalmente a regiões já bem controladas pelo governo. Contudo, eles têm seus mártires do outro lado da fronteira, em Papua Nova Guiné, e isso não é vergonha alguma para eles.

Caso McDonald tivesse se dado ao trabalho de visitar as áreas de atuação dos católicos romanos e dos protestantes e feito uma comparação entre elas, teria descoberto que o grau

ERRA pe de transformação cultural é pelo menos tão grande, se não maior, nas áreas católicas roma: nas. Por exemplo, em todas as áreas católicas romanas espera-se que os indígenas primitivos abandonem seus nomes tribais e tomem para el nomes latinos, como Pius ou Constantius, enquanto nas Árcas evangélicas protestantes eles ainda usam seus nomes irianeses, como [sai ou Yana, Mas aqui também, caso essa seja uma mudança direcionada voltada para à sos brevivência, ela não pode ser rejeitada em bases antropológicas,

MeDonald continuas “Exige-se de quase todos os missionários católicos em Irian Barat que tenham pelo menos mestrado em antropo= logia”, Na verdade, o percentual de missionários católicos romanos e evangélicos protestantes que possuem pelo menos mestrado em antro= pologia é quase o mesmo, e quando a questão é a capacidade de aprender dialetos tribais, os evangélicos superam de longe, À maioria dos sacerdotes católicos ensina no idioma indonésio, mesmo onde ele não é compreendido.

McDonald descreve a consagração de uma nova igreja católica, em Jaosakor, feita com um ritual de espalhar cal, Sem dúvida, se esse éo limite da penetração cultural que tem conseguido, nossos amigos católicos não devem estar nada satisfeitos, À penetração cultural, para ser cficaz, deve ir a um nível muito mais profundo do que simples atos exteriores como espalhar cal, Só depois de lidar com os conceitos Íntimos

Perguntas profundos, no nível do aji dos ekaris ou do o nabelan-habelan dos danis, é que alguém poterd dizer que se aproximou do coração de um por Ei nessas questões nós, evangélicos, estamos na vanguarda, Como um dos membros de nom equipe disse a McDonald: “O que estamos pros curando é a chave cultural.” MeDonald suas palavras, e ainda assim não foi capaz de perceber seu valor,

Outro ponto do artigo de McDonald exgs refutação: Gemit Kuijt levantou recursos parsa aquisição de um helicóptero para uso geral dos povos de todas as tribos do Irian Barar, não pars “evangelismo aéreo”, Aliás, foi esse helicóptero que chegou a tempo de ajudar na operação de socorro logo após o terremoto e que transpor tou McDonald em sua missão de reportagem. Obrigado, Gerrit, por sua visão, Nós aqui não temos a atitude depreciativa de McDonald.

McDonald, seu artigo foi incorreto, absut: do e irresponsável, Você conseguiu perturbare atrapalhar os outros, Você e o jornal Washingtim Post nos devem desculpas por escrito,

Os missionários destroem culturas? Podemos destruir certas coisas nas culturas, exatamente como os médicos às vezes destroem certas coisas no corpo humano para que o pacien te possa continuar vivendo, mas sem dúvida, conforme vamos crescendo na experiência nã sabedoria dada por Deus, não devemos nem iremos destruir as culturas propriamente ditas. para estudo

1. Que variações das críticas de McDonald você leu

Por quê?

ou ouviu? Você as considera justas?

2, Richardson responde de modo oportuno às críticas de McDonald? O que você acrescentaria à resposta de Richardson, ou o que suprimiria dessa resposta? 3, Você concorda com a política de “mudança direcionada” nas sociedades tribais? Por quê?', 88 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 10 · Leitura — Steuernagel, cap. 24: O evangelho integral', 'Valdir Steuernagel

VALDIR STEUERNAGEL é pastor luterano, diretor do Centro de Pastoral e Missão (Curitiba) e líder da Visão Mundial Internacional. É conferencista internacional e autor de vários artigos e livros, entre eles Obediência missionária e prática histórica (São Paulo: ABU, 1993).

Este artigo foi adaptado de uma palestra ministrada durante o I Congresso Brasileiro de Missões (Caxambu, MG), publicado em Aos que ainda não ouviram (São Paulo: SEPAL, 1998). Usado com permissão.

Steuernagel O é completo em si mesmo, assim como Deus é completo em si mesmo. O evangelho é integral, porém nós, em nossa maneira de compreendê-lo e vivê-lo, precisamos sempre das correções nele contidas. Deus ainda não concluiu sua obra em nós, e o evangelho continua a nos chamar para uma integralidade maior.

O evangelho ainda tem algo a nos dizer aliás, tem muito a nos dizer. Por isso, falar do evangelho é falar de arrependimento e discipulado. O evangelho quer nos revelar coisas que Deus gostaria de mudar em nossa vida.

É interessante como as diferentes cartas às igrejas registradas no livro de Apocalipse se caracterizam por essa dimensão de celebração e convite ao arrependimento. “Conheço as tuas obras, tanto o teu labor como a tua perseverança”, lemos na carta à igreja de Éfeso (Ap 2.2). “Conheço a tua tribulação, a tua pobreza”, diz a carta à igreja de Esmirna 9). À carta endereçada à igreja de Pérgamo diz: “Conheço o lugar em que habitas, onde está o trono de Satanás” (v. 13).

4 cibadi á

As mesmas cartas, porém, afirmam também outras coisas. “Tenho, porém, contra ti que abandonaste o teu primeiro amor. Lembra-te, pois, de onde caíste, arrepende-te e volta à prática das primeiras obras; e, se não, venho a ti e moverei do seu lugar o teu candeeiro”, diz-se à igreja de Éfeso (v. 4-5); e à de Esmirna: “Não temas as coisas que tens de sofrer” (v. 10); e à de Pérgamo: “Tenho, todavia, contra ti algumas coisas, pois que tens aí os que

VALDIR STEUERNAGEL é pastor luterano, diretor do Centro de Pastoral e Missão (Curitiba) e líder da Visão Mundial Imemaciona Conferencista A, internacional é autor de vários artigos e livros, entre eles Obediência missionária e prática histórico (São Paulo: ABU, 1993)

Este artigo foi adaptado de uma preseo ministrado durante 9) Congresso Brasileiro de Missões fesninio, LÍGIA orésicado am dé Que ainda não ouviram (São Paulo: SEPAL, 1938). Usado com permissão.

sustentam a doutrina de Balaão” (v. 14).

O Senhor conhece nossa vida, a vida de nossas igrejas e a vida de nossas famílias. Ele conhece nosso trabalho e nossa prática missionária. Deus conhece nossa vida em sua totalidade, em todas às suas relações, e quer nos dizer: “ai “Celebro seu esforço, seu suor, seu sangue, Celebro sua luta pelo discernimento no discipulado. Contudo, há coisas que quero mudar em sua vida. Há coisas que desejo transformar na organização que representa e encarna. Ainda não terminei meu trabalho com você!”. As cartas às igrejas de Apocalipse terminam com a frase: “Quem tem ouvidos, ouça O que o Espírito diz às igrejas”, Ser discípulo requer bom ouvido. Os que "Já estão prontos” só têm boca, Os fariseus só tinham boca, não ouvidos. Eram incapazes de abrir-se parao que Deus queria fazer, para o que Deus estava fazendo na pessoa e na vida de Jesus Cristo, "mas achavam que já sabiam.

O evangelho integral implica também acatee significativa no Congresso de Lausanne, em 1974, quando enfatizou que precisamos voltar à Grande Comissão, só que de acordo com o quarto evangelho. Sua proposta teve repercussão mundial. Temos dado ênfase demasiadamente tar de novo, submeter-se outra vez ao mandato missionário de Jesus à Igreja, ao “fazei discípulos de todas as nações”, ao “ser empurrado para O mundo”. Que privilégio enorme, para o «cristão, ter o mundo diante dos olhos! O povo de Deus são cidadãos do mundo porque carregam o mundo no coração e diante dos olhos esse mundo tão carente do evangelho e de "um encontro com Jesus. “Fazei discípulos de todas as nações ensinando-os a guardar todas as coisas que vos tenho ordenado”: essa busca de quantidade e intensidade no discipulado é imprescindível para quem deseja o evangelho integral.

unilateral à Grande Comissão segundo o evangelho de Mateus, e nos esquecemos do mandato registrado no evangelho de João.

À importância do retorno à Grande Comissão joanina, disse Stott, é que nela Jesus se apresenta como modelo para a vida da Igreja em sua prática de missão. Para entender o que significa sua vocação missionária, a Igreja precisa encontrar-se com Jesus. Para entender o que significa sua vocação missionária hoje a Igreja precisa reler os evangelhos e aprender o caminho do discipulado nos passos de Jesus: “Disse-lhes Jesus outra vez: Paz seja convosco! Assim como o Pai me enviou, eu tam-

Muitas vezes, temos uma dificuldade enorme de ser completos e, de fato, nunca o somos. Por isso, precisamos constantemente não apenas da correção do evangelho, mas também de complementação mútua. Falar de evangelho integral, portanto, é falar da necessidade que temos, tanto da correção do evangelho quanto de interdependência. Precisamos uns dos outros, assim como necessitamos abraçar o evangelho em sua totalidade, em sua integralidade.

O movimento de Lausanne fixou esse mandato num slogan: Todo o evangelho paratodoo "mundo, todo o evangelho para todos os povos”. Ou seja, não apenas segmentos do evangelho paratodo o mundo, mas todo o evangelho, todo bém vos envio (Jo 20.21). E é interessante que João repete isso duas vezes, uma no contexto da oração sacerdotal “Assim como tu me enviaste ao mundo, também eu os enviei ao mundo” (Jo 17.18) e de novo no final de seu evangelho.

A comunidade dos discípulos é enviada ao mundo, e Jesus praticou isso com eles. Por isso, enviou também os Setenta, dizendo: “Eis que eu vos envio como cordeiros para o meio delobos” (Lc 10.3). À comunidade dos discípulos é enviada ao mundo da mesma forma e inspirada no modelo que o próprio Deus usou para enviar seu Filho ao mundo, por meio da encarnação: “Assim como o Pai me enviou, eu

9 conselho de Deus para o mundo todo. Não são palavras direcionadas aos círculos eclesiásticos já estabelecidos, às igrejas que se fecham em si mesmas e ficam estudando, estudando estudando o conselho de Deus sem ir além "das próprias paredes. Não! São as duas coisas à0 mesmo tempo: todo o evangelho para todo o mundo!

Falar de evangelho integral é reencontrar-se com Jesus. À missão da Igreja hoje tem navida de Jesus sua fonte de autoridade e inspiração. John Stott trouxe isso à tona de maneira elegantambém vos envio”,

Às vezes, parece ser essa uma ênfase esquecida em nossa teologia de missões e na prática missionária. Segundo John Stott, a razão de nos adaptarmos com mais facilidade à Grande Comissão de Mateus é porque nela, aparentemente, encontramos mais liberdade para pôr em prática nossos conceitos e estratégias. Já o mandato de João requer que nossas compreensões das estratégias missionárias e nossa teologia de missões sejam submetidas ao crivo do ministério de Jesus. Precisamos trazer nossa

À O vida, sem como fosso conceito de missões possas estratégias para US evangelhos. Precisamos trazer tudo ao Senhor Jesus U perguntar sc essas estratégias, conceitos e práticas cor-= respondem à metodologia de Deus; se elas correspondem ao coração de Deus e ao modo de ele de se comunicar conosco e de estabelecer sua Igreja; se correspondem ao modelo da encarnação assumida por Jesus. Caso cona

Às mãos O ento... há muita gente

Que VIVO assim, Quando paramos no semáforo, não invadem as janelas de nosso carro. Meninos é meninas de rua com mãos estendidas invadem, nossas praças. Mãos vazias e estendidas inva. dem nosso interfone. Mãos com a carteira de trabalho aberta e sem assinatura invadem nossas indústrias e estabelecimentos comerciais. Mãos estendidas invadem as panificadoras em busca trário, estaremos nos afastando do caminho do discipulado.

de pão e de um litro de leite, Mãos estendidas em busca de ajuda; mãos que se estendem como

Vejamos, em Lucas 18.35-43, como isso acontecia na vida de Jesus:

sinal de humilhação; mãos que representam dor, angústia e violência; mãos que representam a morte! Mãos estendidas.

Aconteceu que, ao aproximar-se ele de Jericó, estava um cego assentado à beira do caminho, pedindo esmolas. É, ouvindo o tropel

E os gritos que ecoam ao nosso redor? Gritos de ajuda, de dor, de angústia e de revolta. Gritos a povoar nossos ouvidos, a povoar nosda multidão que passava, perguntou o que era aquilo. Anunciaram-lhe que passava Jesus, o Nazareno. Então, ele clamou: Jesus, Filho de sas cidades, a povoar nossas praças... gritos! As mãos os gritos... a experiência de um cego.

Herodes às vezes passava por Jericó com sua

Davi, tem compaixão de mim! E os que iam na frente o repreendiam para que se calasse; ele, porém, cada vez gritava mais: Filho de caravana, rumo ao palácio de verão. Quando passava, O que o cego esperava era, no máximo, ganhar um dinheirinho, uma daquelas esmolas

Davi, tem misericórdia de mim! Então, parou Jesus e mandou que lho trouxessem. É, tendo ele chegado, perguntou-lhe: Que quedadas de cima para baixo. Naquele dia, porém, o dia em que Jesus chegou a Jericó, a esperança dele foi outra: a de poder enxergar! No entanto, res que eu te faça? Respondeu ele: Senhor, que eu torne a ver. Então, Jesus lhe disse: Recupera a tua vista; a tua fé te salvou. Imeseu grito insistente tornou-se fonte de profundo incômodo porque, como informa o texto, tInha aquela turma à frente dele, repreendendo-o diatamente, tornou a ver e seguia-o glorifi- para que se calasse. São pessoas interessantes cando a Deus. Também todo o povo, vendo os tais defensores do protocolo. Eles queriam isto, dava louvores a Deus. que o cego se calasse porque os gritos dele não esa An si esti Abç É SED Aa PENTA a AS E PORTOS DE E nie OLA Eng GU DASÉS Ca] CORPLAR PLEASE APTAS ap Missiologia da periferia Samuel Escobar Das terras que costumavam ser territórios missionários, uma nova missiologia tem começado a se desenvolver e está deixando sua voz ser ouvida, Lausanne foi caracterizada pela abertura à nova reflexão, ao mesmo tempo contextual e engajada. Podemos dizer que o impulso básico dessa missiologia é sua natureza critica. À questão não é quanta ação missionária é requerida hoje, mas que tipo de ação missionária o mundo samuel Escobar nasceu no Peru e ministrou na América Latina com a Aliança Bíblica Universitária. Foi cátedra de missiologia no Palmer Theological Seminary (Estados Unidos). Palestrou no Congresso Internacional sobre Evangelização Mundial (Lausanne, 1974) e foi membro da comissão que produziu o Pacto de Lausanne. Atualmente, vive e ensina na Espanha.

Extraído de William D. Taylor (Org.), Missiologia global para o século XXI (Londrina: Descoberta, 2001). Usado com permissão, status quo. Quando o protocolo é imposto, os cegos não gritam, não incomodam, mas também o grito das mães que traziam seus filhos para conhecê-lo, de discernir o grito de necessidade não chegam a rir. Diz o texto que os defensores do protocolo, que jam mais à frente, disseram: “Fique quieto, rapaz! Você não se toca? É Jesus quem está na cidade, e ele tem muitas pessoas da mulher que queria apenas tocá-lo; sta capacidade de perceber o grito de angústia de Jairo pela doença fatal da filha e de ver que, sentado à beira da estrada, havia um homem que preimportantes para ver. Ele está só de passagem, então veja se não incomoda. Fique quieto aí no seu canto!

O triste em relação à turma do protocolo é cisava encontrá-lo, pois nesse encontro residia sua esperança.

Esse, portanto, é o ministério da Igreja. Essa é nossa caminhada missionária a percepção, que tudo fica como está. As coisas estão limpas e organizadas, o negócio funciona, há horário para tudo, elaboram-se atas, criam-se estatutos a sensibilidade do ouvido que nos ajuda a perceber os gritos de angústia e de necessidade ecoando nas beiras de estradas deste nosso país e regimentos, está tudo calmo e bonitinho... mas o cego continua sentado à beira da estrada com a mão estendida e o grito engasgado na garganta. Essa calmaria, porém, é a do cemitério, dos que não conseguem abafar o grito e de nosso continente. Homens e mulheres; crianças, jovens e idosos; casados e descasados; gente com um grito na garganta. Pessoas que precisam encontrar-se com Jesus. Esse é o encontro que faz toda a diferença na vida, que faz do cego. Felizmente, o protocolo foi rompido naquele dia em Jericó. Graças a Deus, Jesus acabou com aquilo. Abaixo o protocolo, porque toda a diferença do mundo.

Multidões passavam por Jericó Herodes com sua caravana, fariseus, escribas, religiosos, o cego precisa ver! Abaixo o protocolo, porque há um grito no ar: “Jesus, Filho de Davi, tem compaixão de mim!”.

O barulho da multidão não impede Jesus saduceus e outras autoridades. Só Jesus, porém, tinha palavras de esperança e de vida para aquele cego. “Que queres que eu te faça?”, perguntou. “Senhor, que eu torne a ver”, respondeu o de ouvir o grito do cego. À agenda do protocolo não impede que ele tenha tempo para o cego! Essa é uma das coisas mais belas do texto aliás, uma das marcas do ministério de Jesus: a capacidade de perceber o grito na garganta precisa. À preocupação com a qualidade está ligada cego. À relação de Jesus com o cego é rápida e profunda. Primeiro Jesus ouve seu grito de angústia e de esperança, depois ordena: “Iragam o homem aqui!”. É a turma do protocolo retruca: “Deixa para lá, Jesus, é só um cego na naturalmente às perguntas sobre o dinamismo social do evangelho e sobre o poder transformador da experiência de conversão a Jesus Cristo...

René Padilla expressa bem uma perspectiva evangélica recuperada de uma nova leitura dos evangelhos: “Jesus Cristo é, por excelência, o missionário de Deus, e ele envolve seus seguidores em sua missão”. A missão de Jesus, como a encontramos nos evangelhos, implica a “pesca para o Reino”, isto é, a chamada para a conversão a Jesus Cristo, o Caminho, a Verdade e a Vida. É essa conversão a Jesus que se destaca como a base na qual a comunidade cristã é formada. A missão também implica “compaixão” como resultado da imersão entre as multidões. Não é um ímpeto sentimental de emoção nem uma opção acadêmica pelos pobres: trata-se de ações definidas e intencionais de serviço para “alimentar a multidão” com o pão para a vida e também com o Pão da vida. A missão implica ainda “confrontação” dos poderes da morte com o poder do Servo sofredor, e esse “sofrimento” se torna uma marca da missão messiânica de Jesus e um resultado dessa luta contra o poder e contra a injustiça humana.

E beira da estrada. Vamos em frente! Aliás, ali está uma pessoa que precisas encontrar, Acena aqui, cumprimenta ali e vamos andando, que já estamos atrasados”, Jesus, porém, insiste: “Tragam-no aqui!”. E a turma do protocolo fica nervosa com Jesus, porque ele insiste em fazer profunda: “Que queres que eu te faça?”, Porque a palavra do evangelho responde à necessidade humana, À palavra do evangelho preenche 6 vazio humano e as necessidades mais profundas da vida, À questão, no entanto, é se temos ou não disposição e tempo para ouvir as necessicoisas que “não estão no programa”.

Falar de missão integral é falar da capacidadades dessa gente.

Às vezes, tenho a impressão de que já tede de ouvir o gemido de necessidade, de onde quer que ele venha. Falar de evangelho integral é colocar-se nos passos de Jesus para que ele nos dê esse discernimento, essa perspicácia, esse amor, esse ouvido para o grito do cego. É orar para que o Senhor nos dê a capacidade que ele tem de perceber onde a necessidade está e de responder a ela com um encontro “olhos nos olhos”.

Falar de evangelho integral é falar sobreessa Igreja que precisa ter ouvidos muito sensíveis à dor humana, à dor que se expressa nas inúmeras facetas da vida das pessoas individual, familiar ou comunitária. Falar da capacidade de não orientar nossos passos pelas nossas estratégias nem nossos ouvidos pelo “barulho” ou pelo “silêncio” do protocolo, mas colocar nossas prioridades onde estão as prioridades do Reino. Na prioridade do Reino, Jesus ouve o grito do cego.

Falar de evangelho integral é imbuir-se do ministério de facilitar o encontro de Jesus com os que sofrem. Portanto, esta pergunta é fundamos respostas prontas antes mesmo de ouvir as perguntas, ou então que temos respostas para as quais nem existem perguntas. Enquanto isso, as verdadeiras perguntas não têm espaço na vida de nossas igrejas. Com esse episódio, Jesus ensina a importância de ouvir e abrir espaço para um encontro com ele.

Falar de evangelho integral é abraçar a transformação. À transformação na vida do cego foi profunda: ele tornou a ver! Essa era a necessidade básica e fundamental de sua vida. Jesus é a resposta às necessidades básicas da vida humana: um copo de água, um copo de leite, uma angústia de alma, um endemoninhamento, enfim, tudo o que violenta, produz morte, amarra as pessoas e as condena a viver à beira da estrada da vida com suas angústias e dores.

O encontro com o evangelho é a resposta às necessidades fundamentais da vida humana. O cego vê, graças a Deus, e quando os cegos veem e os coxos andam; quando se prega o evangelho aos pobres; quando, conforme relatado mental: “No contexto da Igreja, somos da turma do protocolo, ou pertencemos ao grupo que facilita o encontro dos que gritam por Jesus”. Para responder a essa pergunta, em termos de discipulado, precisamos dizer que há coisas em nossa vida e na vida de nossas igrejas que precisam ser profundamente alteradas para que ne-Jas não reine essa calmaria de cemitério, que é subserviente ao protocolo, Falar de evangelho integral com coerência é colocar-se a serviço j do encontro com Jesus,

Halar de evangelho integral é abrir caminho para que pessoas, famílias, jovens, idosos e comunidades inteiras se encontrem com Jesus a fim de que cle possa fazer-lhes esta pergunta tão no evangelho de Lucas, Jesus se levanta e diz: “Hoje, se cumpriu a Escritura...”, é sinal de que a esperança chegou, e chegou para ficar! Isso é evangelho integral.

À nova dimensão, esse novo passo, é fazer o que o cego fez depois de curado. Leiamos o texto: “Jesus lhe disse: Recupera a tua vista; a tua fé te salvou. Imediatamente, tornou a ver e seguia-o glorificando a Deus”. Movido pelo coração agradecido do cego e por sua iniciativa de louvar a Deus, todo o povo também passou a dar louvores a Deus. Glória a Deus! Ainda há pouco, ele estava sentado à beira da estrada, gritando como um doido para que o ouvissem, e agora canta, exultante! Encontrar o E e ser encontrado por Jesus determina uma nova fase da vida. O encontro com Jesus produz nos lábios um novo cântico.

[É verdade isso? Quantos de nós já fomos encontrados por Jesus em nossas necessidades mais profundas: iniciamos a oração tristes e abatidos e saímos do quarto cantando! Não é esta a sua história e a minha, um testemunho

A Igreja é comunidade em missão porque ela tem uma história a contar a história do encontro que mudou a vida de homens é mu-Iheres e a vida da própria comunidade. À história do encontro com Jesus. E esse encontro com Jesus é o encontro da angústia com a esperança, da perdição com a salvação, da morte com a vida.

de que o encontro com Jesus satisfaz às nossas necessidades pessoais, às nossas necessidades de. salvação mais profundas, e põe em nossos lábios um novo cântico? Canto que celebra a presença de Jesus entre nós, que celebra o cumprimento da esperança messiânica, que celebra os olhos que agora veem?

Perguntas

Quais são os gritos de necessidade e de dor que ecoam em nossos dias e em nosso contexto de vida? Conseguimos ouvi-los? Como líderes de igrejas, quem somos nós: defensores do protocolo ou facilitadores do acesso a Jesus? Jesus ouviu, chamou o cego e o curou. O que significa Isso para nosso ministério messiânico hoje? para estudo

1. Quais são outras ocasiões, além do caso do cego, em dente, o clamor de alguém que sofria? 2. O missionário transcultural que trabalha onde a Igreja que Jesus atendeu, de modo surpreenainda não está formada seria mais sensível ou menos sensível aos “gritos” dos que sofrem? ouvisse?

Que tipo de “barulho” impediria que os', 89 from cursos where slug = 'perspectivas';
-- Lição 11: as quatro novas vêm ANTES do Parshall, que já estava carregado
do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 91;
  update aulas set ordem = ordem - 10000 + 4 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Patterson, cap. 86: A multiplicação espontânea de igrejas', 'George Patterson

GEORGE PATTERSON leciona na Division of Intercultural Studies, do Western Seminary, em Portland, Oregon, nos Estados Unidos. Ele é tutor e treinador de missionários com o propósito de multiplicar igrejas em várias regiões do mundo. Trabalhou durante 21 anos no norte de Honduras, num programa de extensão de educação teológica e evangelismo.

Dar uma rápida olhada nos “campos” dos mais de 2,5 bilhões de pessoas não alcançadas é assustador, À simples matemática envolvida leva-nos a concluir que não é suficiente apenas 11 a um campo missionário ou enviar alguém. Nem mesmo é suficiente ir a um campo missionário e dar início a umas poucas igrejas. À obediência à Grande Comissão implica enviar e treinar (ou então sermos nós mesmos) aquele missionário que dará início a igrejas que crescerão e se multiplicarão normalmente (como as igrejas desejam) e que darão início a igrejas filhas, netas e bisnetas, e assim por diante, até que se alcance grandes áreas populacionais. Não há outra maneira de obedecer a Cristo.

Em Honduras, trabalho na direção de um instituto bíblico que é nossa ferramenta para a fundação de igrejas, Nosso campo não possui uma elevada receptividade ao evangelho, Os métodos missionários comuns tradicionais produzem pouquíssimos resultados. O povo é bem pobre e semianalfabeto, constituído de

Vea A

CSORGE PATTERSON leciona na

Oeision of Intercultural Studies, do

Western Seminary, em Portland,

Srezon, nos Estados Unidos. Ele é ade É ari pes dó mino Vrabashoy durante 21 anos nonortede “Honduras, num programa de extensão

Beeducação teológica e evangelismo, lavradores de culturas de subsistência. Embora a maioria de nossas igrejas seja pequena, localizadas em lugarejos também pequenos, desenvolvemos uma estratégia para capacitá-las a se multiplicar. Em média, começamos uma nova igreja a cada três ou quatro meses e estamos fazendo isso há mais de dez anos.

Quinze anos atrás, dirigíamos um instituto bíblico tradicional, muito semelhante aos seminários e institutos bíblicos dos Estados Unidos. Seu programa de ensino baseava-se no método de residência: os alunos vêm à escola, ali moram e estudam. Observamos, todavia, resultados bem negativos. Os estudantes que se formavam simplesmente não saíam para dar início a novas igrejas, nem a maioria deles conseguia pastorear igrejas. O mesmo fato vem acontecendo por toda a América Latina. Por essa razão, mudamos para um programa de ETE (Educação Teológica por Extensão). Levamos os estudos às pessoas que moravam nos vilarejos, nas montanhas e nas cidades, Concentramo-nos mais nos chefes de família, em pessoas com um pouco mais de idade, e não nos rapazes solteiros, que costumavam matricular-se no instituto bíblico. Voltamos nossa atenção para os homens com raízes onde moravam, os quais seriam capazes de pastorear e teriam o respeito do povo com muito mais facilidade que um jovem solteiro.

(im 620 À multiplicação espontânea de igrejas

Desejo compartilhar alguns princípios biblicos de extensão, que deram ótimos resultados em Honduras, quando empregamos a ETE para fundar igrejas. Os métodos e formas específicos podem não ser compatíveis com seu campo, mas esses princípios, aplicados com métodos adequados à cultura na qual você ministra, devem favorecer a multiplicação espontânea de igrejas em qualquer campo missionário. Lembre-se de que Deus não abençoa os métodos: eleabençoa a obediência. O que fizemos foi simplesmente combinar a ETE com um vigoroso programa de discipulado, enfatizando a obediência, e, com trabalho árduo, as igrejas começaram a surgir. Esses princípios não se destinam exclusivamente a quem está indo para o campo missionário, São igualmente importantes para os que permanecem em seu ambiente de origem, seja multiplicando discípulos em sua região, seja modelando sua igreja de modo que ela treine e envie missionários capazes de fundar outras

Qual sua área de responsabilidade?

Ah! Vou ganhar Honduras para Cristo.

Ele está indo de um lado para outro, “ga-. nhando Honduras para Cristo”, mas nunca começou uma igreja e provavelmente jamais o fará. Ele vai para uma cidade e depois para outra; distribui folhetos nas prisões e nos quartéis do Exército. Todavia, nunca definiu sua área de responsabilidade. Você tem de aprender a definir sua área em termos precisos e concretos. Minha área de responsabilidade, por exemplo, é “o povo de língua espanhola que vive na zona rural da região centro-norte de Honduras”. Ela abrange cerca de 400 vilarejos e algumas cidadezinhas e cidades. Definir sua área irá requerer muito estudo e oração, Utilize um mapa. Consulte os líderes missionários, os colegas e os obreiros nacionais. Realize uma investigação em várias áreas para poder descobrir onde a população vive, onde outros missionários não estão trabalhando e onde as pessoas estão reagindo positivamente igrejas que multipliquem a si mesmas. Existem quatro princípios básicos a serem seguidos: “Olhe os campos”, “Edifique o Corpo”, “Busque a obediência” e “Organize pensando na multiplicação espontânea”.

ao evangelho. Busque respostas exatas. Você não conseguirá desenvolver planos práticos até que saiba exatamente onde irá trabalhar. Defina o tipo de igreja que você deve fundar

Olhe os campos Cristo ordena uma observação cuidadosa dos campos (Jo 4.35). Paulo sabia muito bem qual era sua “esfera” de ministério (2Co 10.12-16). Sabia que tipos de igreja desejava fundar conde desejava fundá-las. Tinha uma ideia clara acerca de seu ministério.

Que tipo de igrejas você deve fundar para que multipliquem a si mesmas de modo espontâneo em toda a área sob sua responsabilidade? Em vez de descrever a igreja em termos de estrutura e de organização, descreva-a em termos do que é capaz de fazer e do que faz. Por favor, faça uma distinção bem clara entre pontos de pregação e

Defina sua área de responsabilidade Cada um de nós precisa fazer a si mesmo a pergunta: “Por quem sou responsável”. Muitos missionários nunca aprenderam a definir sua responsabilidade, Os aspectos geográficos e étnicos de seu ministério nunca são claros. Alguns são oportunistas, agindo como garimpeiros de ouro, indo de um garimpo para outro, sempre procurando aquele que tenha mais ouro a oferecer. Certa vez, perguntei a um missionário de Honduras;

genuínas igrejas neotestamentárias. Bem, o que é um ponto de pregação? É umlocal determinado onde o missionário ou o obreiro nacionalirá pregar semanalmente ao povo que se reúne para ouvi-lo. Eles poderão cantar, tocar violão e orar. A liderança local não é treinada nem instituída. Os novos convertidos raramente são batizados. Poucas vezes a ceia do Senhor é servida. Quase não há diferença perceptível entre os cristãose os não cristãos. Talvez chegue a 90% o número de missionários que trabalham para fundar igrejas e comecem com pontos de pregação, orge Patterson 621 (o ma esperança de que, de alguma forma, eles se transformem em igrejas. Isso não acontece, a ndo ser pela graça de Deus, quando ele manifesta sua misericórdia. Os pontos de pregação tendem a se perpetuar,

É imperativo saber exatamente qual é seu como estações de rádio, escolas, atendimento médico e outros meios indiretos. Quando eles começarem o que pensam que é uma igreja, na verdade não será igreja nenhuma, É de novo um ponto de pregação, dominado pelo missionário, não uma igreja real, que cresce e se reproduz objetivo para que você não fique andando deum lado para outro com uma ideia fixa na cabeça: "Preciso ir lá e pregar, e espero que alguma coisa aconteça”, Cuidado para não começar um traba"lo num lugar cm que o povo venha para ouvir você pregar. Na verdade, você nem precisa pregar para dar início a uma igreja. Existem muitas maneiras de comunicar o evangelho além da pregação pública feita de um púlpito.

Uma igreja é uma congregação de discípu-Josque obedecem aos mandamentos do Senhor Jesus Cristo. É constituída de crentes arrependi-Gose batizados que celebram a ceia do Senhor, amam uns ao outros, demonstram compaixão Par como próximo, oram, contribuem e evan-Eelizam. Em Honduras, definimos uma igreja simplesmente como “um grupo de crentes dedicadosa obedecer a Cristo”. Talvez você prefira usaruma definição própria de igreja, mas asseespontaneamente como Corpo vivo. Se houver necessidade de instituições auxiliares, mais tarde você poderá ajudar a igreja nacional a formá-las, Em Honduras multiplicamos igrejas mais rapidamente quando seguimos estes cinco passos: Testemunhe primeiro aos chefes de família. Acompanhe-os para ganhar seus amigos e parentes. Não realize reuniões públicas até que os homens do lugar estejam habilitados a dirigi-las, 2. Batize sem demora todos os crentes arrependidos. 3. Organize imediatamente uma diretoria provisória constituída pelos anciãos (At 14.23), Explique que devem conquistar seu povo e aprender a pastorcá-los eles mesmos. Autorize-os a servir a ceia do Senhor c a levar o rebanho a fazer as outras coisas que Cristo ordenou. Éles ainda não “pregam”.

gure-se de que seja uma definição breve, exata ebíblica, de modo que você saiba exatamente qual seu objetivo no campo missionário. Defina o caminho mais curto para fundar uma igreja Vamos descrever a cena: você recebeu uma boa educação, está agora no campo missionário, conhece um pouco o idioma do lugar, já desfez as É malas, abre a porta de casa e encontra 5 milhões Ge pessoas bem ali na entrada. O que você irá fazer? Qual o caminho mais curto para fundar uma igreja que dê início a um movimento es-pontâneo em direção a Cristo? Os passosirão

4. Matricule esses anciãos em classes por extensão. Encontre-se com eles a cada duas ou três semanas, ou tão frequentemente quanto possível, até que estejam mobilizados. 5. Forneça uma lista de verificação onde estejam relacionadas as atividades da igreja, determinadas por Cristo e pelos apóstolos às igrejas. Utilize essa lista como um guia de ensino e mobilize um dos anciãos para que ensine e mobilize os demais. Defina seu ministério O que você está fazendo? Meu ministério é: “ajudar as igrejas hondurenhas a treinar obreiros variar em cada situação. No processo de formação da igreja, evite desviar-se por estágios desnecessários. Às vezes, acontece de um fator Cultural exigir definitivamente um caminho indireto, Mantenha os passos curtos esimples.Se aerescentar passos desnecessários, você cairá no erro de dar início a instituições desnecessárias, nativos”, Posso dizê-lo numa única sentença. Provavelmente, seu ministério será algo diferente. Talvez você tenha de trabalhar durante algum tempo antes de descobrir o que pode fazer. Seja flexível. Talvez você precise permanecer no campo missionário um ou dois anos antes de ser capaz de definir seu ministério, mas

Uma Igreja passiva centralizada no pastor

Da 424 atá

Um pastor fraco A interação numa Igreja dinâmica

Vá N º areia POA domina sua igreja

VA. APLINES:, à (a eee

Ra STE Ars ques VEN SA ET nao

Novos núcleos de liderança formam-se rapidamente, tanto na igreja-mãe quanto nas igrejas-filhas. ls a Ai

Um pastor forte cria laços de relacionamento entre seus membros continue trabalhando nisso até chegar a uma definição. Seja conciso. Se você não consegue serbrevee preciso, provavelmente incluiu muitas coisas na definição, Vá eliminando coisas secundárias até chegar ao ponto em que você mão possa deixar de fazer um bom trabalho. Então, deixe que Deus torne seus horizontes "ainda mais amplos.

Semdivida, você deverá levar em consideraão os dons que o Espírito Santo lhe concedeu. Todavia, lembre-se de que devemos buscar os dons não para chamar a atenção sobre nós mes-. mos, mas exclusivamente para ministrar uns 3os outros da maneira mais prática e edificante. Assegure-se de que seu ministério dá prionidade absoluta ao maior dos mandamentos:o “amor (Jo 17.26), Edifique o Corpo O segundo princípio é edificar a igreja como Corpo vivo. Paulo ensina, em Efésios 4.11,12, À que tudo o que os pastores, professores e missionánios fizerem seja com o propósito deaperfeiçoar os membros da igreja para a edificação do Corpo de Cristo.

Desenvolva um relacionamento de ensinoreensino com os líderes leigos da Igreja Como conduzir o povo da igreja a ter relacionamentos pessoais e em amor, por meio dos quais possam prontamente servir, ensinas e aconselhar uns aos outros? Paulo deixou Timóteo para trás a fim de que este trabalhasse com os anciãos de várias igrejas recém-fundadas. O apóstolo deu-lhe uma responsabilidade: “O que de minha parte ouviste isso mesmo transmite a homens fiéis e também idôncos para instruir a outros” 2.2), Desenvolva um relacionamento de amor e de confiança entre o professor coaluno, um relacionamento “Paulo-Timóteo”, de mestre e aprendiz. Ensine pelo método de Cristo. Ensine à maneira dos apóstolos. Ensine seus homens a realizar o trabalho.

Em Honduras, tenho apenas três alunos, a quem ensino um de cada vez. Eles “reensinam” oque aprendem em várias igrejas, a homens que “reensinam” em outras igrejas ainda, Temos mais de uma centena de obreiros-alunos ativos. Sempre que damos início a uma nova igreja, uma diretoria provisória de anciãos é imediatamente organizada. Tão logo quanto possível, o obreiro

Desenvolva relacionamentos de amor e de serviço entre os membros da igreja Quetipo de organização eclesiástica ofereceum mínimo de orientação e coordenação necessánas capacitação dos membros de uma jovem Igreja, de modo que possam ministrar uns aos outros e aos perdidos, em amor? À chave parao desenvolvimento de relacionamentos edificantes entre os membros da igreja é o pastor. Não. Se esqueça do modelo bíblico para a lideranqa da igreja (Tt 1.5; Ef 4.11-16; 2Tm 2.2; At i 20.17-38). Um pastor fraco domina sua con-Bregação. Um pastor forte cria laços de relacionamento entre seus membros.

Desdeo início, ensine os convertidos a edificarem uns aos outros em amor. Desenvolver Uma rede de relacionamentos fortes atende as necessidades de um grande número de ministérios necessários à igreja local, a fim de queela cresça e produza igrejas-filhas, de fora indica o líder natural (o mais respeitado e amado pelo povo) como seu “Timóteo” e obreiro-aluno. Esse homem ensinará os outros anciãos provisórios da nova igreja. Não se preocupe com o tal “treinamento de liderança”. Apenas estruture os relacionamentos humanos, de modo que muitos possam ensinar ou servir uns aos outros e que igrejas-filhas possam nascer, Um projeto desse tipo despertará automaticamente o surgimento de líderes, mas se você inverter o processo, fabricando primeiramente os “líderes”, na esperança de que cles em seguida executem o projeto, você só conseguirá que as coisas aconteçam com um enorme dispêndio de dinheiro. Confie no Espírito de Deus para que ele levante e motive seus líderes!

O obreiro de fora (um missionário ou um natural do país) não decide quem serão esses novos líderes, Ele deixa que a igreja observe e reconheça aqueles que mais se enquadram na ideia bíblica de anciões (1 Tm 3.1-7).

Cuidado com os objetivos educacionais tradicionais, que concentram sua atenção na educação de uma pessoa! Os objetivos educacionais bíblicos buscam a edificação da igreja. O professor tradicional só enxerga o aluno.

PROFESSOR ALUNO PASSIVO o, Dá a 0)

Igreja-mãe

E SERIE Ria igreja-mãe ministra aulas na igreja-filha

Outra opção, quando não há na igrejamãe alguém que possa viajar com frequência: o obreiro principal da igreja-filha vai âigreamãe a cada duas semanas.

Esse professor fica satisfeito se o aluno responder corretamente às perguntas e pregar bons sermões. Ele não repara no que o aluno faz na igreja com base no que aprende, nem se preocupa com isso. O professor obediente, porém, procura observar seu aluno além das atividades da aula, reparando em seu ministério na igreja. O professor responde às necessidades da igreja por meio dos relatórios do obreiro-aluno eensina de acordo com a necessidade da igreja

OBREIRO-ALUNO j PROFESSOR A,

BORA

Gee" À

Er ERA

O Desenvolva relacionamentos entre as igrejas Para formar igrejas-filhas, devemos desenvolver edificantes relacionamentos de amor entre elas e a igreja-mãe. Nosso objetivo deve sera edificação do Corpo de Cristo por meio desses relacionamentos.

Existem inúmeros exemplos bíblicos de bons relacionamentos entre igrejas (At 11.1926; 14.26,27; 15.1,2,28-31). Existem muitas maneiras de as igrejas darem e receberem entre st. Em Honduras, fazemos isso de diversos modos, O modo mais simples é pela ministração de classes de extensão nas igrejasfilhas por um obreiro de extensão da igreja-mãe a cada duas semanas.

lgreja-mãe a CRER pdBo ais ço À

Ed igreja-mãe

É claro que se pode fazer uma combinação desses dois modos, especialmente se as igresas estão separadas por uma grande distância (temos vários casos em que uma caminhada de dois dias separa a igreja-mãe da igreja-filha). Em determinado mês, alguém da igreja-mãe visita a igreja-filha; no mês seguinte, alguém da igreja-filha vai até a igreja-mãe.

Esses relacionamentos entre igrejas sãoessenciais à multiplicação espontânea das próprias igrejas. Você descobrirá que esses relacionamentos entre mãe e filha podem multiplicar -s rapidamente, de modo espontâneo. Defato,os relacionamentos entre igrejas são a melhor maneira de se alcançar um grande campo. Cuidado com aquela estratégia ruim de a igreja-mãeenviar obreiros para várias igrejas-filhas.

Você desgastará os obreiros e desencorajaráa igreja-mãe. Não funciona. À estratégiade Deus capacitaa igreja-mãe a darorigemauma ou duas igrejas-filhas e, então, a assegurar-se de que as igrejas-filhas repitam esses passos. Esse sistema conduzirá à formação de igrejas-netas, e assim por diante. Isso de fato funciona.

Os elos dessa cadeia de igrejas são mantidos por professores de extensão voluntários, oriundos da igreja-mãe. Devemos incentivar patterson ade

Coy, SE

Yes É

IGREJAS-FILHAS E.

DA am vangelização Aa TeE e Educação E E

IGREJAS-FILHAS,

BISNETAS etc.

A multiplicação espontânea de igrejas (Sede do ministério por extensão) jocón

Lama Buena Vista

(Igrejamãe) ALTA CRUZ (Igreja-filha) Macora Agua y ha LN Arriba Abajo Agua Dalia Mejia

Soledad San

Pad

Icaca o

Guadarama

Aguacate

Ne El Corozo N Tres Marias La Loma San Lorenzo usado Abajo Orcones esses laços entre as igrejas. Ajude os homens a conhecer, amar e treinar uns aos outros.

Edifique o Corpo de Cristo. Deixe que os líderes naturais e escolhidos pelo povo treinem os anciãos. Deixe que as igrejas-mães treinem as igrejas-filhas. Deixe que uma forte liderança desenvolva. Não cometa o maior dos pecados do missionário: controlar as igrejas nacionais. Fique fora do caminho. Deixe que trabalhem e cresçam. É aí que você verá a dinâmica “espontãnea”. A palavra “espontâneo” indica o impulso que vem do próprio Corpo, o qual é habitado pelo Espírito Santo. O impulso controlador não parte do missionário. Você pode compartilhar sua visão e dar início ao processo. Depois disso, dêum passo atrás e deixe que o Espírito Santo opere.

Uma das inúmeras cadeias de extensão que temos em Honduras já teve cinco gerações, num total de vinte igrejas. Busque a obediência Jesus enviou os apóstolos a fim de que fizessem discípulos que obedecessem a tudo que ele ordenara (Mt 28.20). Muitos missionários RN simplesmente pregam, desejando “decisões” em a vez de tentar fazer discípulos obedientes. f o Defina os objetivos da evangelização em termos de obediência Nas culturas onde se dá ênfase às decisões individuais, como é o caso da nossa, elas muitas vezes levam à conversão, porém muitas pessoas de outras culturas não estão conscientes de terem feito uma decisão ao nascer de novo. O arrependimento é algo bem mais profundo que uma decisão. As decisões são feitas diaseriamente, mas você só se arrepende uma única vez, e o faz de modo definitivo. É uma mudança permanente, operada por Deus quando nascemos de novo.

Descobrimos em Honduras que, quando batizamos imediatamente os crentes arrependidos, sem antes ministrar-lhes demorados cursos doutrinários, podemos realizar um trabalho de integração com a grande maioria deles e ensiná-los a obedecer desde o início. Eles são salvos para obedecer ao Senhor Jesus Cristo em amor, e não damos ênfase acentuada à doutrina. À doutrina tem seu lugar, e eles terão a vida inteira para aprendê-la. Esse é o erro de muitos missionários norte-americanos. Eles fabricam cristãos por meio de um processo intelectual. Creem cegamente que, se os novos convertidos aprenderem a doutrina certa, crerem corretamente e tiverem a interpretação correta das Escrituras, então se tornarão cristãos. NÃO! Não é assim que fazemos discípulos. O discipulado tem pouco que ver com o cérebro, mas muito que ver com o coração e com a alma. Faça discípulos obedientes e verá as igrejas se multiplicarem. Caso você os leve apenas a tomar decisões intelectuais, eles poderão crer da maneira certa, conhecer todas as dispensações alianças apresentadas pela Bla e saber mais sobre isto ou aquilo, mas..e 44% Será que estão multiplicando igrejas? Esão cumprindo a Grande Comissão de Cristo? Estão, de fato, realizando o que Cristo ordenou?

O que Jesus Cristo ordenou claramente que Eséssemos? Em Honduras, solicitamos a cada pova igreja que memorize a seguinte lista dos principais mandamentos dados por Cristo:

ARREPENDA-SE E CREIA Marcos 1,15 2 SEJA BATIZADO Atos 2.38 ame João 13,34 4, CELEBRE ACEIA DO SENHOR Lucas 22.17-20 5, orE— João 16.24 6. CONTRIBUA Mateus 6,19-21 ele pertence. Os objetivos educacionais mais importantes e os planos de trabalho devem estar baseados nos mandamentos de Cristo,

Memorize os “mandamentos” que o Senhor Jesus Cristo deu às igrejas, Eles são o abecé da fundação de igrejas, Só Cristo tem a autoridade de determinar o que suas igrejas devem fazer.

Devemos aprender a discernir trés níveis de autoridade:

1, Mandamentos de Cristo, Estes têm em si toda a autoridade do céu (Mt 28.18-20): arrependimento e fé, batismo, amor, ceia do Senhor, contribuição, oração e evangelização,

2. Práticas apostólicas (não ordenadas), Estas tém em si apenas a autoridade do exemplo: ter todas as coisas em comum, imposição de mãos

TESTEMUNHE Mateus 28.18-20

Desde o início, ensine cada novo crente a obedecer a todos esses mandamentos. Não fique à espera de alguma coisa. Às primeiras semanas e meses da vida espiritual do convertido são muito marcantes e influirão bastante em seu futuro caráter cristão.

Em Honduras, damos início a cada nova igreja com a celebração da ceia do Senhor. Por escolha própria, a maioria das igrejas celebraa sobre os novos crentes, celebração frequente da ceia do Senhor nos lares, batismo imediato, falar em línguas como um sinal para os incrédulos etc,

3, Costumes humanos. Sua autoridade provém de um consenso da congregação a respeito do assunto, decisão reconhecida nos céus como tendo autoridade sobre os membros daquela congregação em particular (Mt 18.18-20), Por essa razão, não devemos fulgar outra congregação com base nos costumes da nossa.

ceia semanalmente, Não adie o treinamento dos novos anciãos para servirem a ceia do Senhor; não espere para começar a obedecer a Cristo! Defina os objetivos educacionais teológicos em termos de obediência Quala melhor maneira de você ajudar seu aluno a treinar a congregação que dirige a fazero que Cristo ordena?

Quase todas as divisões e dissensões nas igrejas são resultado da exigências de práticas apostólicas ou costumes humanos (níveis 2 3) como se fossem mandamentos divinos (nível 1).

Em Honduras, usamos o “Gráfico do progresso da congregação”, o qual relaciona as atividades determinadas às igrejas por Cristo e seus apóstolos. No campo de cada atividade, estão relacionados estudos sugeridos, referentes ao

À Grande Comissão, dada pelo Nosso

Senhor e registrada em Mateus 28.19,20, exi-Be essa orientação, O casamento da educação "Coma evangelização no tipo de ministério que adotamos torna-se uma ferramenta eficiente

-paraa fundação de igrejas: combinar educação "evangelização faz com que um reforce o outro, Para sermos bíblicos na maneira de ensinar, tema correspondente, bem como perguntas que verificam o trabalho prático necessário. Para o líder da nova igreja, esse currículo organizado de modo funcional, com ênfase exclusiva na obediência a Cristo e seus mandamentos, combina os ministérios de edificação da igreja e educação teológica num único programa pastoral, À medida que o aluno segue a lista de nosso objetivo educacional básico não deve ser “educar” um aluno, mas edificar a igreja a que atividades (sendo a sequência determinada pelas próprias necessidades), ele vai trabalhando também todos os elementos essenciais de um currículo tradicional de treinamento pastoral.

Leve os novos crentes a testemunharem aos parentes e amigos

A cada duas semanas, isto é, sempre que nos encontramos com o aluno ou com um pastor menos experiente, consultamos o gráfico de progresso. Bascamos todas as tarefas na obediéncia a Cristo, e não ao professor, Primeiramente, deixamos que o aluno explique ao professoras necessidades o progresso de sua igreja, Anotamos essas observações no gráfico. Isso deve revelar o próximo passo lógico na obediência a Cristo. Perguntamos a ele qual seu plano e escrevemos esse plano num papel, fazendo uma cópia, a fim de verificarmos o progresso de seu trabalho na reunião seguinte. Fazemos também sugestões, caso necessárias, mas só as escrevemos no papel se o aluno concordar com elas. Ao dar trabalho prático específico a ser realizado na igreja, trabalhe com um homem de cada vez. Isso estabelece responsabilidade.

Desenvolva um plano para mostrar a cada novo convertido como testemunhar à família e aos amigos. O Espírito Santo flui mais prontamente através de laços já existentes entre as pessoas. Se você não usar esses vínculos como pontes para a transmissão do evangelho, logo os próprios elos se tornarão barreiras.

Em Honduras, oferecemos estudos simples ao novo convertido para que ele possa também ensinar os parentes c amigos mais chegados, Um cristão mais experiente acompanha-o nas primeiras ocasiões em que ele vai testemunhar, para mostrar “como se faz”. Temos preparado material tanto para pessoas alfabetizadas quanto para analfabetos (só com desenhos). Eles ensinam a respeito de Cristo, arrependimento, fée perdão, já cm vistas ao batismo,

Organize pensando na multiplicação

Planeje os objetivos do campo com os líderes nacionais espontânea Estabeleça uma corrente de extensão Assim como fez a igreja de Antioquia (At 13.1-3), cada igreja deve enviar um ou dois obreiros de extensão com a tarefa de fundar igrejas-filhas. Quanto mais cedo, melhor. É muito mais dificil mobilizar uma igreja mais velha para o trabalho de multiplicação. Qualquer igreja-mãe pode

Utilize um mapa da área sob sua responsabilidade, sobre o qual seus colegas nacionais realizarão um planejamento conjunto deevangelização (fundação de igrejas) e educação (treinamento pastoral).

Deixe que os nacionais liderem essa atividade. Você os ajudará apenas a saber que tipo de objetivos irão orientar a realização dotrabalho que Cristo ordenou. Se nessa fase de plainiciar uma ou mais igrejas-filhas, as quais, por sua vez, poderão dar início a outras igrejas. Esse é o processo que chamamos “corrente de extensão Os elos dessa corrente não são as pessoas, e sim as congregações.

Qualquer corrente de reprodução espiritual (alguém alcança e treina outra pessoa, quefazo mesmo com outra pessoa, e assim por diante) um dia será quebrada, a menos que seja continuamente reenergizada por um Corpo de crentes onde o Espírito Santo habita, À unidade reprodutora na corrente de reprodução espiritual não é o testemunho individual, mas a igreja. Planeje suas correntes de extensão tendo isso em mente. Cada igreja deve ser um elo na corrente; cada testemunha de Cristo, um braço de sua igreja.

nejamento dos objetivos do campo você deixar de fora os líderes nacionais, eles só cooperarão depois de modo passivo.

Solicite a cada homem que, no mapa, ponha seu nome ao lado das localidades pelas quais ele, em nome de sua igreja, aceita a responsabilidade de alcançar. Para levar um grupo a concordar acerca de planos concretos, dê um passo de cada vez, orando a respeito de cada decisão. É Continue a redirecionar o grupo para a exigência básica da Grande Comissão que Cristo nos deu: treinar discípulos para que obedeçam aos seus mandamentos.

Redija um pequeno esboço dos objetivos do campo, acerca dos quais já existe concordância. Quais as novas localidades que você espera sScançar? Onde estão localizados os centros esé tratégicos para a extensão do trabalho? Quemsão es homens que aceitam essa responsabilidade?

Em Honduras, iniciamos nosso progragua de extensão trabalhando com uma igrejapás (Olanchito). Realizamos uma reunião e dividimos nossa área de responsabilidade (o vale Aguan) em nove regiões. Nosso primeiro objetivo foi dar início a uma igreja-filha em cada uma das nove regiões, estabelecendo para cada uma das igrejas a meta de alcançar todos es vilarejos à sua volta por meio de classes de extensão. Cada obreiro escreveu seu nome na região em que iria trabalhar, todas delimitadas tum grande mapa. O segundo objetivo foimobaliza cada igreja-filha a proceder da mesma forma. O resultado foi que, em 11 anos, surgram 80 congregações, mais da metade agora constituida de igrejas que se sustentam, se govermam e se reproduzem.

Tenha certeza de que está planejando com objetivo de resultados específicos. Quantas igre2s-filhas para este ano? Quantos novos convertdos e quantos pastores em treinamento?

Os alunos do instituto bíblico por extensão de Honduras inauguram uma média de sete novas igrejas por ano, as quais possuem em média 15 crentes adultos batizados no primeiro ano de trabalho. Cada congregação tem “de um a três pastores em treinamento. Temos grande expectativa de que o mesmo progresso acontecerá no futuro, na antiga área sob nossa tesponsabilidade. Estamos também desbravando áreas inteiramente novas onde repetiremos todo o programa. Estabelecemos alvos anuais para continuar obedecendo à ordem de Cristo de evangelizar, levando em conta nossos obje-Evos para O campo nossa fé Procure descobrir o que está impedindo às plantas. Como todos os demais seres vivos que Deus criou, clas se reproduzirão de acordo com sua espécie, darão bons frutos, proporcionarão uma colheita abundante e crescerão por si mesmas (um obreiro planta, outro rega, mas Deus dá o crescimento). Crescer é próprio da natureza da Igreja. Se isso não acontece, é como o pé de milho que para de crescer com apenas alguns centímetros de altura: alguma coisa está errada, Em condições normais, uma igreja obediente tem de crescer; é de sua natureza. Se isso não ocorrer, é porque foi plantada em terreno inadequado ou porque precisa de água, de ser podada, de inseticida ou de mais iluminação, Quando uma igreja não cresce no meio de um povo moderadamente receptivo, algo está obstruindo o poder do Espírito Santo no Corpo de Cristo.

Existem vários perigos a serem evitados:

1. Evite rituais de decisão. Não tente confirmara salvação por meio de rituais de tomada de decisão (levantar as mãos, ir à frente, preencher cartão de decisão e outros). Nenhum desses rituais enfatiza o suficiente a necessidade de arrependimento. Tais rituais de decisão são uma novidade na história da Igreja. Substituem o batismo, que é o ritual determinado por Deus para a confirmação da fé e do arrependimento do novo convertido. O batismo foi transformado numa cerimônia de formatura, realizada após um curso de discipulado e um período de experiência.

Não fique esperando que cidadãos de sociedades não democráticas “se decidam” individualmente por Cristo. Nesses casos, uma decisão sincera em geral implica muita análise (e quase sempre debate) com seus parentes amigos mais íntimos. À Bíblia não fala em “decisões” por Cristo nem em “aceitar” a Cristo: ela exige uma fé que transforme a vida e um o crescimento e o desenvolvimento "normais da igreja às parábolas de Cristo sobre “crescimento de “Igreja” (Mt 13; Me 4,26-29; Jo 15,1-6) reveam que 45 igrejas, se forem devidamente pastoreadas, crescerão de modo muito semelhante arrependimento dos pecados.

2. Evite adiar o batismo. Não temos o direito de desobedecer ao mandamento de Cristo e rejeitar, por qualquer razão, que o pecador sinceramente arrependido seja batizado (At 10.47,48). Sirva-lhe a ceia do Senhor logo que for batizado.

FERA 630 Ensine-o a fazer tudo que Cristo ordenou, especialmente sobre o amor, pois é o que nosso Senhor e seus apóstolos ensinaram como mais importante (Jo 13.34,35; At 2.41,42).

Para o convertido, as primeiras semanas da nova vida em Cristo são muito importantes para a formação de seu caráter cristão. É difícil convencer o crente mais antigo a trabalhar para Cristo, pois ele passou sua adolescência espiritual apenas ouvindo sermões, de modo passivo.

Alguns evangélicos exigem que o novo crente se santifique fora da igreja, antes de ser batizado e de tornar-se membro. Os apóstolos batizavam imediatamente os recémarrependidos, sem exceção. O doutrinamento e o aperfeiçoamento continuavam dentro da igreja sob o cuidado pastoral. Não adie a obediência aos mandamentos de Cristo, uma vez que uma pessoa confessou seu arrependimento c sua fé,

3, Evite subsídios missionários. Muitos missjonários hesitam em ensinar a mordomia, Corrompem as igrejas com “dinheiro fácil”, desencorajando, dessa forma, os crentes a contribuir. Sustentar o trabalho de Deus éum privilégio. O crente, quando bem ensinado, tem prazer nisso. Não roube essa bênção aos crentes pobres. Com sua matemática celestial, Deusirá multiplicar o que tiverem ofertado, ea igreja prosperará espiritualmente (Lc 21.1-4).

São pouquíssimas as missões que sustentam os pastores nacionais, pois isso tende a desvirtuar tanto o pastor quanto a igreja, especialmente nas comunidades pobres. Se uma congregação ou igreja é pobre demais para sustentar seus ministros, é melhor que trabalhem em serviço voluntário. Treine diversos homens para trabalharem juntos. Nunca crie uma igreja que seja

A multiplicação espontânea de igrejas:

Nenhuma igreja é jovem demais para obedecer a Cristo. Assim que houver um obreiro disponível, envie-o para começar uma igrejafilha. Se você esperar que a igreja se fortaleça, ela também “endurecerá”. Mobilizar uma igreja velha a gerar igrejas-filhas pode ser uma tarefa impossível.

5. Evite o colapso das comunicações. Uma igreja dá início a outra, que dá início a outra, cassm por várias gerações. O fluxo do estudo por extensão deve acompanhar a mesma corrente. Um homem ensina outro, que por sua vez ensina outro, O melhor crescimento da igreja parece acontecer a um ou dois elos de distânciadomissionário estrangeiro, pois há menos dependência da ajuda deste e mais dependência do Espírito Santo. Todavia, além de três ou quatro elos de relacionamentos entre professor e aluno, à comunicação pode ser cortada, sendo necessário reorganizar a corrente.

O professor deve receber relatórios constantes e minuciosos de cada igreja sob sua área de influência dentro dessa corrente. Se não receber essas informações, não conseguirá ensinar bem,ca corrente se partirá. Ele deve identificar e fortalecer os elos fracos.

6. Evite a pressão de crescer. Não podemos fazera igreja crescer: podemos apenas deixar que cresça. Não force seu aluno a converter o povo por meio de expedientes humanos. Deixe que a igreja que ele dirige cresça espontaneamente. Uma igreja normal e obediente cresce pelo simples fato de obedecer ao Senhor. Às parábolas de Jesus sobre crescimento de igreja revelam que esse crescimento é semelhante ao das plantas animais, Todos os seres vivos criados (até mesmo a igreja) crescem e se reproduzem. À igreja é viva. Ela é o Corpo de Cristo. Devemos esperar que ela cresça. Se tentarmos controlar seu dependente de ajuda estrangeira. Isso irá criar ressentimento e gerar igrejas fracas, controladas crescimento, iremos matá-la. Seu crescimento é espiritual. Tudo que temos a fazer é obedecer pelo missionário,

4. Evite adiamentos, Não aceite 0 argumento: “Ainda não podemos começar uma igreja-filha. Nossa igreja é muito fraquinha. Precisamos aguardar até estarmos internamente fortes”.

aos mandamentos de Deus. Plantamos, regamos, tiramos as ervas daninhas, espantamos os pássaros, e Deus dá a colheita.

Entre 1970 e 1973,0 programa produziu novas igrejas em Honduras da seguinte maneira:

Fo 1970 7 Igrejas-mães o originais ft -Totaldeigrejas 4

Mo programa

ARA Dinis

Totaldemem- 205 bros das igrejas envolvidas Ee

Igrejas-filhas

Dado Nifejes meras xa Igrejas-bisnetas

Í 295 450 760 Atéo fim de 1979, o programa havia produzido: Igrejas trinetas 8 Igrejas tetranetas 4 Total de igrejas no programa 64 Total aproximado de membros batizados 2020 Perguntas para estudo

1. Os objetivos educacionais tradicionais concentram a atenção na educação do indivíduo, enquanto os objetivos educacionais bíblicos buscam a edificação da igreja. Explique a diferença entre esses dois tipos de objetivos. Como cada um deles influencia a estratégia de treinamento da “liderança da igreja?

2. Descreva como você procederia, caso tivesse de entrar numa nova área geográfica de trabalho, para dar início a uma corrente por extensão a partir de você mesmo, indo até uma igreja-bisneta, e para desenvolver essa corrente. Mencione as pessoas envolvidas (isto é, treinador, pessoa a ser treinada, congregação, ançiãos, novos crentes, parentes, amigos ctc.), as responsabilidades básicas de cada um os principais perigos a serem evitados, de modo que haja crescimento “dentro da corrente, 3. O que é um “ponto de pregação” e como você pode evitar o estabelecimento deles?', 91 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Chua Wee Hian, cap. 88: Evangelização de famílias inteiras', 'Chua Wee Hian

CHUA WEE HIAN é pastor sênior da Emmanuel Evangelical Church, em Londres. Ele foi secretário geral da International Fellowship of Evangelical Students de 1972 a 1991.

Este artigo apareceu pela primeira vez no livro Let the Earth Hear His Voice [Que a terra ouça sua voz] (Minneapolis: World Wide Publications, 1975). Usado com permissão da Comissão de Lausanne para a evangelização mundial.

Estudos de casos: 1. À abordagem e a estratégia de duas mulheres europeias solfeiras, 2. A abordagem e a estratégia da Assembleia Pequeno Rebanho em Chefoo, Shantung. Objetivos: Idênticos plantar igrejas locais e engajar-se num amplo evangelismo de vilarejos.

Estudo de caso 1 Duas mulheres, dedicadas e talentosas, foram enviadas por sua agência missionária para o noroeste da China, com a missão de evangelizar e plantar congregações num aglomerado de vilarejos, Elas eram fluentes no chinês e, por trabalharem fiel e fervorosamente, após uma década surgiu ali uma pequena congregação. Contudo, a maioria dos membros eram mulheres, cujos filhos assistiam regularmente à escola dominical, O visitante que chegasse à pequena congregação logo detectaria a falta de homens, Em seus relatórios e circulares, ambas se referiam à “dureza de coração” que prevalecia entre os homens. Também eram feitas referências aos adolescentes promissores que encontravam oposição dos pais ao pedir permissão para se batizar, o es==== (ajA WEE HIAN é pastor sênior da cal Entrsádcal Einreh, em londres, Ele fo) secretário geral da ermstonal Fellowship of Evangelica! udents de 1972 a 1991, Egeartigo apareceu pela É Vemeira vez no livro Let the Earth cotas des e Er

Estudo de caso 2 Em 1930, um avivamento espiritual passou pela Assembleia Pequeno Rebanho em Shantung. Muitos membros venderam suas posses a fim de enviar 70 famílias para o Noroeste, formando“ o congregações FRIO instantâneas”, nes” O Outras 30 30 famílias famílias migraram mi para o Nordeste. Por volta de 1944, quarenta novas assembleias haviam sido estabelecidas, todas ativamente envolvidas em evangelismo,

Como vemos, em termos de dedicação c ortodoxia doutrinária, tanto as europeias quanto a Assembleia Pequeno Rebanho compartilhavam do mesmo compromisso e fé. Por que, então, os eras gritantes nos resultados e nas estratégias de plantação hagcations, 1975), Usado com E Bermiccãn da Comissão de Lausanne eyangelização mundial,

Consideremos o caso das duas missionárias solteiras. Dia após dia, os moradores dos vilarejos viam-nas estabelecendo contatos e construindo pontes de amizade vom as mulheres, geralmente quando os maridos e pais estavam fora, trabalhando nos campos ou negociando nas cidades vizinhas. O estrangeinsmo delas (apelidadas de “diabos ruivos”) incitava preconceitos culturais e raciais na mente do povo. Ademais, o estado civil delas era considerado socialmente questionável. Em toda a sociedade chinesa, era fato bem conhecido que a família constitui a unidade social básica, que garante segurança. Nos ensinamentos de Confúcio, três de cinco relacionamentos bási-

Evangelizando famílias em outras culturas À estratégia de evangelizar famílias inter, não se aplica apenas às comunidades me sas, Ela também é eficaz em outras comunal des asiáticas, em aldeias e tribos africanas, bes como em bairros e sociedades latino-americanos. Escrevendo sobre a rápida expansão dz fé cristã na Coreia, Roy Shearer observa: “Us fator de suma importância no crescimento dz igreja é a estrutura da sociedade coreana. Coreia, lidamos com uma sociedade bascadá ma família, não na tnibo. À família é forte, mesmo cos estão relacionados com vínculos familiares: pai e filho, irmão mais velho e irmãos menores, marido e esposa. O fato de as missionárias fazerem contato individual com as mulheres e não terem diálogos com os anciãos, dava a impressão. de que elas eram agentes estranhos, dispostosa destruir a estrutura da comunidade local, Um assunto constante nas fofocas e discussões entre os moradores das aldeias era o estado civil das missionárias. Afinal, por que elas não eram casadas? Por que não eram visivelmente relacionadas com seus pais, irmãos e irmãs, tios tias e outros parentes? Por isso, quando elas persuadiam as mulheres e jovens a deixar a religião de seus antepassados, eram consideradas “destruidoras de famílias”.

Contrastando com essa situação, a Assembleia Pequeno Rebanho, ao designar famílias cristãs chinesas para trabalho, enviava agentes que eram entidades socioculturais reconhecidas. Portanto, as 70 famílias tornaram-se uma efetiva força-tarefa missionária. Não é dificilimaginar os cabeças dessas famílias compartilhando sua fé com os anciãos das aldeias. As avós podiam, informalmente, transmitir a alegria de seguir a Cristo e dar testemunho da libertação dos ponos dias de hoje. À maneira mais saudável de. um homem vir a Cristo é no ambiente de sus família”, Ele relata repetidas situações em que: os cabeças das famílias voltavam às aldeias e eram bem-sucedidos em persuadir seus parestese compatriotas a “desviar-se dos ídolos paz servir ao Deus vivo”, Ele conclui:“O evangelho fluiu através da rede dos relacionamentos fa=liares, Essa rede é a linha de transmissão pas. o poder do Espírito Santo que trouxe homes e mulheres para a igreja”.

Em seu livro New Patterns for Disciplmz Hindus [Novos padrões no discipulado de hz dus),a senhorita B. Subbamma afirma categoricamente que a família hindu talvez sejaa única instituição social pela qual o evangelho possa ser transmitido e recebido. Nem todos concordam com essa declaração, pois há exdências de estudantes universitários que têm: professado a fé em Cristo nos grandes centros universitários da Índia, alguns deles, possivelmente, por estarem livres da pressão dos pas. Contudo, como regra geral, a observação ez dedução de Subbamma estão corretas.

Evangelizar famílias inteiras é o padrão anal de abordagem missionária em algumas partes da deres demoníacos às mulheres mais velhas das aldeias pagãs. As donas de casa, nos mercados,

América Latina. Na cultura católica romana de relacionamentos de rede, as estruturas famipodiam convidar outras mães de família paraos cultos, que aconteciam todos os domingos nas “congregações instantâneas”. Não é de admirar, portanto, que 40 novas assembleias tenham sido estabelecidas como resultado desse método de evangelismo e de plantação igrejas!

liares são fortes. Na tentativa de explorar esse padrão social, os pentecostais chilenos, como fez a Assembleia Pequeno Rebanho décadas atrás, despacham famílias de crentes fiéis como agentes e embaixadores de expansão da igrea. Por meio dessas famílias evangelistas, muitas soognegações têm sido plantadas em diferentes portes do continente, O espantoso crescimento do pmovimento pentecostal na América Latina «dote à eficácia do uso de Famílias para evaneat famílias,

Hi momentos em que é dificil para os ociletais individualistas reconhecerem que, em “setas sociedades relacionais, as decisões religosas são tomadas corporativamente, O indiváduo, nesse tipo de sociedade, seria rotulado de “traidor” e tratado como excluído, se abranacionais se dedicaram a diálogos e discussões com os mais velhos e os líderes de comunidades muçulmanas locais, Quando esses “tomadores de decisões” se convenceram de que Cristo é o único caminho para Deus e o Salvador do mundo, eles retornaram às suas aldeias e vilarejos e incitaram todos os membros a se voltar para Cristo. Portanto, não foi nenhuma surpresa testemunhar comunidades inteiras sendo discipuladas e batizadas juntas, Tais movimentos são rotulados de “movimentos de povo”, Muitos passe uma nova crença religiosa. Após o Resascimento, na maioria dos países ocidentaisa “Wentidade passou a ser expressa segundo o dito “artestano cogito ergo sum Penso, logo existo"). O ser humano, como indivíduo racional, podia pensar em opções religiosas para si, estando li“uz para escolher a fé que desejasse seguir. Esse Sa na entanto, não se aplica a muitas comueades tribais africanas. Para os africanos, e anos antes do exemplo indonésio, por exemplo, Ko Tha Byu, notável evangelista birmanês, desempenhou um papel fundamental no discipulado de vilas e comunidades karens inteiras, Hoje, a igreja karen é uma das comunidades cristãs mais fortes no sudoeste da Ásia, Os registros bíblicos Quando olhamos para os registros bíblicos, deseuntos outros, o dito imutável é: “Participo, bgo existo”. À conformidade e a participação atos e costumes religiosos tradicionais éo que dá às pessoas sua identidade. Então, se é para haver uma mudança radical na fidelidade mEgãosa, ela terá de ser uma decisão corporativa eu que abranja um grupo.

Isso ocorre especialmente nas famílias e memanidades muçulmanas, onde o método de eangelismo individual não funcionará. Um paestrante amigo meu, que leciona numa uniwersidade multirracial de Cingapura, fez esta importante declaração: “Descobri que, para a maioria dos estudantes malaios, que são quase dos muçulmanos, o islamismo não consiste crer em Alá como Deus supremo éuma mmunidade Os embaixadores de Cristo em aações islâmicas devem não apenas lidar com questões teológicas referentes àunidade eânatureza de Deus, mas também considerar as assxtações culturais e sociais dos muçulmanos. Nos lugares em que grupos muçulmanos de tamanho considerável se converteram, as deás foram corporativas.

Um excelente exemplo é a Indonésia, onde Curante 15 anos, sábios missionários e pastores cobrimos que as famílias atuam, proeminentemente, tanto como receptores quanto como agentes da bênção da salvação.

Para começar, a família é reconhecida como instituída por Deus (Ef De fato, todas as famílias devem sua descendência e composição ao Criador. Na redenção, a igreja, que é o próprio povo de Deus, é descrita como “família de Deus” (Ef 2.19) e a “família da fé” (Gl 6.10). No Pentateuco, é dada grande ênfase à santidade do casamento e ao relacionamento entre pais e filhos, mestres e escravos. Essa ênfase é reiterada no Novo Testamento (v. Ef5.22—6.9;

É a família ou o grupo familiar que jura fidelidade a Yahweh. Josué, como chefe de sua casa, pôde declarar: “Eu e a minha casa serviremos ao Senhor” (Js 24.15). Por meio do predecessor de Josué, Moisés, Yahweh ensinou seu povo a celebrar seus grandes feitos com banquetes e festas sagradas. É interessante observar que a festa da Páscoa era uma refeição familiar (Ex 12.3,4), onde o chefe da família deveria recitar e representar o grande drama da libertação de Israel nesse ajuntamento familiar, Ao longo da história de Israel e até os dias do Novo has e a “soprScene sosoÔ aivas seladd e a “a dA sp orôesan|o Emo TOURINdI

E OD OU ORI SICUI 2pOd ONSUIT) EIPÁ SETPUDES IEQULS Opera 0 mê mé T opnisa eszd sejuntsaa

FIO) PEN S9TTmIZ) crumomo op eme; vos va roms ap ADI AEVILOD SEI WA) opôs cp srpp om od su spepam e eua CÍEESLIIOSD PP OTVEZO ONO TIDOY UG 25-E47p cus o EIBd comeusadr cemprd O) SSPE] SOP SVISIQUIT O “PULSOS PUISSUI ECT SENEPOL SENA, SE INZTP sOUIapoR “aptas (LOL ETI WA IV) 070) 2 0dsum CELIO) FESERASA 2P STIPUDT] SE UITIC] EoLPy Us? CLIPOSSITUI OjossOdE Ipuri3 Cp so) «uy sonsmassd, $0O) (PELE STEI9L IV) rum E REENSÁ IPI TI OU) UU OI Op LE LOL 44) E formos curumos se SENA OE-ETNEDSEAI

SOGUAS soand otssandi: vpungosé apesneo 3 JEUIES CULTOS IPUDINTPOS SUNS:

US ESSISÃO ENSINOUOUI XY samuopas sOJE SAaS AP SIFTSLA SNUIE CuumnÔ o! cá TÍEIS Tp Cqnigo SUE 2-DOUIO Ep trqrus

U2 ORÍEIOPE SIQÕEIO SEZSOS Uqg animo', 92 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — McGavran, cap. 89: Uma igreja para cada povo', 'Donald A. McGavran

DONALD A. MCGAVRAN nasceu na Índia, filho de missionários. Retornou àquele país na terceira geração de missionários, em 1923, e trabalhou como diretor de educação religiosa, além de traduzir o evangelho para o dialeto chhattisgarhi. Ele fundou a School of World Mission, do Fuller Theological Seminary, e foi seu deão emérito. McGavran escreveu vários livros influentes, entre eles The Bridges of God [Pontes de Deus], How Churches Grow [Como as igrejas crescem] e Compreendendo o crescimento da igreja (São Paulo: SEPAL, 2001).

Nº final do século XX, traçou-se o objetivo de pregar o evangelho e organizar, com a graça de Deus, o Corpo de Cristo de modo visível em cada segmento da humanidade que ainda não tenha uma igreja formada. À pergunta que se faz agora é: *Devemos organizar uma igreja ou um conglomerado de igrejas que crescem?”, Com a expressão “segmento da humanidade” quero dizer um núcleo urbano, um vilarejo, uma casta, uma tribo, um vale, uma planície ou um grupo populacional minoritário. O alvo de longo alcance ao qual se apegar nunca deverá ser o primeiro, mas sempre o segundo. O alvo não é uma congregação que seja um grupo isolado em cada povo, e sim um conglomerado de igrejas que crescem em cada segmento, É preciso ter sempre em mente esse alvo durante anos ou décadas, até que seja alcançado.

E á 288888 RE NE fra filho de missionários. Retornou Aquele país na terceira geração de mssionários, em 1923, e trabalhou toeno diretor de educação religiosa, ERRA PReieE O EvangENa pa Qéaleto chhattisgarhi. Ele fundou a School of World Mission, do Fuller Taeological Seminary, e foi seu deão tmésito. MeGavran escreveu vários Eros influentes, entre eles The Rare pod HNOrIES de Deus, Bow Churches Grow [Como as gejas crescem] e Compreendendo Aerescimento da Igreja (São Paulo: SEFAL, 2001).

Ão considerar o tema destacado em itálico, devemos nos lembrar de que geralmente é fácil dar início a uma única igreja no meio de um povo que ainda não tem nenhuma igreja, O missionário chegou. Ele e sua família cultuam aos domingos. São os primeiros membros da congregação, Ele aprende o idioma local, prega o evangelho e vive como cristão. Fala às pessoas acerca de Cristo e ajuda-as em seus problemas. Vende folhetos e evangelhos ou os distribui. Às vezes, as pessoas aproximam-se dele por razões aceitáveis e espirituais; outras vezes, fazem-no até com segundas intenções. Aqui e ali, uma mulher, um homem, um menino, uma menina tomam a decisão de seguir à Jesus. Alguns empregados da missão tornam-se cristãos: pedreiros contratados para construir edifícios, empregadas domésticas que trabalham na casa do missionário, pessoas recuperadas, órfãos. À história das missões na África está repleta de casos de igrejas que começaram com escravos que foram comprados pelas missões, libertados e empregados ali, de modo que não tinham condições de voltar ao convívio dos parentes. Nessa situação, podiam decidir aceitar ao Senhor. Há cerca de 150 anos, esse era uma forma comum de iniciar uma igreja. Com o fim da escravatura, naturalmente esse método deixou de ser usado.

Uma única congregação que surja da maneira que acabei de descrever é quase sempre uma igreja que é um ajuntamento de pessoas, composta de membros de diferentes segmentos da sociedade.

Alguns membros são pessoas idosas, outros são jovens, órfãos, pessoas recuperadas, empregados domésticos dos missionários e entusiastas, Os mais entusiasmados são investigados para se ter certeza de que, de fato, pretendem recebera Cristo. Um edifício para a igreja é construído no devido tempo, e então se diz que “aquele povo já tem uma igreja”. Contudo, é uma igrejamassificada: não passa de um aglomerado de pessoas, Está isolada dos demais grupos da região. Nenhum segmento da população chega a dizer: “Esse grupo de adoradores é gente nossa”. Eles estão certos. Simplesmente não pertencem ao seu povo. Etnicamente, constituem uma unidade social distinta.

falar. Eles lhe dizem: “Você não é mais um dos nossos, Você nos abandonou, gosta mais deles que de nós. Agora você adora os deuses deles,e não os nossos”, Como resultado, congregações que são simples ajuntamentos, constituídas de convertidos ganhos dessa maneira, crescem muito Jentamente, Aliás, pode-se corretamente afirmar que, nos lugares em que as congregações crescem dessa maneira, a conversão de unidades étnicas (grupos de pessoas) dos que deixaram seu povo para unir-se a uma igreja é muito mais difícil. O restante do grupo dirá: “Os cristãos desencaminharam um dos nossos. Vamos tomar providências para que não desencaminhem mais ninguém!”.

Esse método comum de iniciar o processo de evangelização é lento quando se trata de discipular os povos da terra repare no plural: “os povos da terra”. Analisemos detidamente O que acontece enquanto essa congregação vai se formando. À medida que cada convertido aceita o evangelho, seus parentes passam a vê-lo como alguém que “nos” deixa e se une à “eles”, Ele deixa “nossos” deuses para adorar os deuses “deles”. Em consequência disso, os próprios parentes o expulsam. Alguns passam a ser totalmente ignorados pelos demais. Outros são expulsos de casa é têm a esposa ameaçada. Centenas de convertidos já foram envenenados ou mortos. Há casos em que o ostracismo é brando e não passa de uma severa desaprova-

Alcançar um por um é relativamente fácil. Talvez 90% dos missionários que planejam fundar igrejas só consigam formar ajuntamentos. Eles pregam o evangelho, falam de Jesus, distribuem folhetos e porções bíblicas e evangelizam de diversas outras maneiras. Dão as boas-vindas aos interessados, mas quem é que eles conquistam? Bem, conquistam um homem aqui, uma mulher ali, um menino mais adiante e uma menina acolá, os quais possuem várias razões para desejar tornar-se cristãos e para suportar pacientemente uma desaprovação maior. ou menor por parte de seu povo.

Caso queiramos compreender como as igrejas crescem ou deixam de crescer num novo terreno, ali onde vivem povos ainda não alcanção. O povo considera o convertido um traidor. Para os habitantes da região, uma igreja resultante desse processo parece uma assembleiade traidores. Trata-se de uma congregação que é um ajuntamento. É constituída de indivíduos que, um a um, vieram de diferentes sociedades, castas ou tribos.

O que acontece quando alguém aceita o çados, devemos observar que o processo que acabei de descrever parece irreal para a maioria: dos missionários. Sua reação será: Então qual a melhor maneira de entrar numa região de povos não alcançados senão ganhar alguns deles primeiro? Em vez de ter uma igreja isolada, como você descreve, na verdade o processo nos proporciona pontos de contato e de entradaem evangelho é que, caso seja forçado a abandonar ou voluntariamente abandone um segmento rigidamente estruturado da sociedade, a causa do cada sociedade nas quais temos convertidos. Parece-nos ser isso o que de fato acontece”.

Os que raciocinam dessa maneira conheevangelho ganha o indivíduo, mas perde a família. À família, seu povo, os vizinhos dessa tribo, ficam muito indignados com ele. São homens e mulheres com quem ele não consegue mais cem o processo de crescimento de igreja apenas como ocorre num país onde é grande o número de cristãos e onde os que seguem a Cristo não são marginalizados nem tidos por traidores, as, ão contrário, como pessoas que tomaram «es3 decisão correta. Nesse tipo de sociedade, cada convertido pode mesmo se tornar um cacal pará fazer Auir a fé cristã até seus parentes esssiggos. Quanto a isso, não há o que discutir: jastamente o que tento destacar ao daraum meus livros o título The Bridges of God [As pontes de Deus].

alvo então não será ganhar alguns motoristas de táxi, alguns professores universitários, alguns fazendeiros e alguns pescadores, mas organizar igrejas constituídas em sua maior parte por motoristas de táxi, com suas esposas e filhos, seus ajudantes e seus mecânicos. Enquanto você ganha convertidos dessa comunidade especifica, a congregação possui uma coesão social natural

Todavia, nas sociedades rigidamente esecoturadas, onde o cristianismo é visto como cinterna. Todos se sentem em casa, Sim, o alvo tem de ser claro, religião invasora e onde os indivíduos são E expulsos por faltas graves, conseguir convertidos

Segundo: o líder nacional ou o missionário e seus auxiliares devem concentrar a atenção geulsos entre os vários segmentos da sociedade é prejudicial, Em vez de construir pontes que conduzam a cada um desses segmentos, a conversão de indivíduos isolados apenas levanta sstáculos difíceis de serem transpostos.

Façamos agora um contraste desse método “som outro meio que Deus está empregando para discipular os povos da terra. Meu relato não é uma teoria, mas uma descrição pondeada de fatos facilmente observáveis. Ao olhar “e mundo em redor, percebe-se que, enquan+»a maioria dos missionários consegue apenas organizar igrejas-ajuntamentos pelo método de “rbrada de um indivíduo de cada vez de seu grupo social aqui e ali surgem conglomerados e igrejas em crescimento pelo método de monmentos populares. Elas surgem como resulta&o de tribos ou castas que passam para o lado de Cristo, De muitas maneiras esse é o melhor estema. Para usá-lo com eficácia, o missionário deve agir com base em sete princípios.

Primeiro: o alvo deve ser claro, Oalvo nãoé ruma única igreja-ajuntamento numa cidade “a numa região. Pode ser que só venham ater “ssa única igreja, mas isso não deverá nunca ser tava, O alvo deve ser um conglomerado de ongregações crescentes e autóctones em que tada um dos membros permanece em conta9 intimo com seu povo. Esse conglomerado Spenimentará o máximo de crescimento, caso esteja ligado a um único povo, a uma única cas-

2 uma única tribo, a um único segmento da *aGiedade. Por exemplo, se você estiver evan-Eeizando os motoristas de táxi de Taipé, seu num único povo. Digamos que você vá formar um conglomerado de congregações crescentes entre o povo nair, em Kerala, no extremo sudoeste da Índia. Nesse caso, você precisa deixar a maior parte de seus missionários e respectivos auxiliares em condições de trabalhar no meio desse povo. Eles devem proclamar o evangelho aos nairs. Devem também dizer com toda a franqueza que esperam logo contar com milhares de seguidores de Jesus Cristo dentro da casta deles, os quais deverão permanecer firmes na comunidade. É claro que esses seguidores não irão adorar os antigos deuses do povo nair, mas já existem muitos que não os adoram, porque há um grande número de comunistas entre esse povo, os quais ridicularizam as ve-Ilhas crenças.

Os nairs que forem chamados por Deus, e escolherem crer em Cristo, irão amar os vizinhos como nunca antes e também andarão na luz. Serão um povo salvo e belo. Continuarão sendo nairs, porém na condição de cristãos. Repetindo: concentre sua atenção num único grupo de pessoas. Se você contar com três missionários, não ponha um missionário a evangelizar este grupo, outro missionário para atingir aquele e o terceiro a quilômetros de distância para evangelizar outro grupo ainda. Este é o melhor caminho para se ter igrejas pequenas e sem crescimento: conquistar as pessoas uma a uma. À dinâmica social desses segmentos trabalhará vigorosamente contra o surgimento de qualquer movimento popular e significativo que conduza a Cristo.

O terceiro princípio é: encoraje os convertidos a que permaneçam vivendo da mesma maneira que seu povo na maioria dos aspectos. Devem continuar a comer o que seu povo come, Não devem dizer: “Meu povo é vegetariano, mas agora que me tornei cristão vou começar à comer carne”, Depois de se tornarem cristãos, devem mostrar-se ainda mais rigorosos

Incentive os convertidos, na maioria dos aspectos, a permanecerem vivendo da mesma maneira que seu povo. Observe, por favor, a palavra “maioria”, Eles não podem permanecer em união com seu povo na idolatria, na embriaguez ou em pecados óbvios. Se pertencem a um segmento da sociedade que ganha a vida roubando, não devem mais roubar. Na maioria em seu vegetarianismo, No que diz respeito ao vestuário, devem continuar com a mesma aparência que os outros representantes de seu povo. Quanto ao casamento, a maioria dos povos é endógama: insistem em que “só se deve sé casar com pessoas do próprio povo”. Olham com grande desdém para os que se casam com pessoas de outros povos. Quando acontece de os cristãos irem se convertendo um a um, eles não têm como se casar com alguém do próprio povo, pois ninguém mais se tornou cristão. Na época de eles ou seus filhos se casarem, terão de buscar maridos e esposas em outros segmentos dos casos (como conversam, como se vestem, como se alimentam, aonde vão, em que tipo de casas vivem.), porém, podem se comportar exatamente como seu povo c fazer todo esforço para assim proceder.

Quarto: tente conseguir decisões em grupo ao Jado de Cristo. Se uma única pessoa decide seguir a Jesus, não a batize imediatamente. Diga à pessoa:“Você e cu vamos trabalhar juntos para levar outros 5, 10, ou, se Deus quiser, uns 50 do seu povo a aceitar a Jesus como Salvador, de modo que, quando você for batizado, seja batizado com eles”. O ostracismo é bem eficiente da população. Em razão disso, o povo ao qual pertencem logo os acusa: “É isso que acontece quando você se torna cristão. Agora vocês vão cruzar seus filhos com gente estranha. Vocênos deixou e se uniu a eles”,

Todos os convertidos devem ser encorajados a suportar alegremente a expulsão, a opressãoe a perseguição, que não deixará de seruma probabilidade. Sempre que alguém adotaum novo quando se trata de uma pessoa solitária, porém não terá a mesma força contra uma dezena de pessoas, e, manifestado contra um grupo de duas centenas de membros, não exercerá praticamente nenhum efeito.

Quinto: tenha como alvo que muitos e muitos grupos desse povo se tornem cristãos num fluxo cada vez maior, no correr dos anos. Um dos erros mais comuns, cometidos por missioestilo de vida, é provável que encontre alguma oposição por parte de seus entes queridos. Essa oposição poderá ser suave ou muito severa. Ele deve suportar qualquer antagonismo com paciência e ser capaz de dizer em todas as ocasiões: “Sou um filho melhor que antes;souum pai melhor que antes; sou um marido melhor que antes. Hoje amo a todos vocês mais do que nários orientais e ocidentais em todo o mundo, é que quando uns poucos se tornam cristãos, chegando a uma ou duas centenas ou mesmo a mil convertidos, o tempo é quase todo dedicado a ensinar os novos convertidos. Querem fazer desses convertidos bons cristãos, edizem a si mesmos: “Se eles se tornarem bons cristãos, então o evangelho irá se espalhar”. Assim, costumava amar. Vocês podem me odiar, maseu não os odiarei. Vocês podem me expulsar, mas cu os receberei. Vocês podem me pôr para fora da casa em que nossa família mora há muitas durante anos, eles se dedicam a umas poucas congregações. Uma ou duas décadas depois, quando começam a evangelizar fora do grupo, o restante do povo já não tem mais interesse gerações, mas eu irei morar na sua varanda. Ou então vou conseguir uma casa do outro lado da "tua, Ainda sou um de vocês, Pertenço agora a vocês muito mais que antes”, em se tornar cristão. Isso tem acontecido repetidas vezes, Esse princípio exige que, desde o q início, o missionário trabalhe para alcançar novos grupos. Todavia, alguém pode argumentar: Ã

*Mas será que isso não irá resultar num grupo de cristãos fracos, que não conhecem a Bíblia?

atacou todas as instituições sociais imperfeitas. Porexemplo, não combateu a escravatura. Paulo

Seseguirmos esse princípio logo teremos uma “porção de cristãos imaturos, uma comunidade disse ao escravo que fosse um melhor escravo. Disse ao dono de escravos que os tratasse de e milhares de pessoas que não passam deum peojeto de cristãos”.

Sem dúvida, existe esse perigo. À essaaltusa, devemos depender inteiramente do Novo Testamento, lembrando-nos das rápidas semaas ou meses de instrução que Paulo ministrou às povas igrejas. Devemos confiar no Espírito Sento e crer que Deus chamou essas pessoas êas trevas para sua maravilhosa luz. Entre os dois males, ou seja, não ministrar quase neeum ensino cristão e deixar que eles se tomem ema comunidade isolada que não consegue alcamçar 0 próprio povo, o último é bem maior. Devemos impedir que os novos convertidos se iso-Je. Devemos sempre garantir que um fluxo “constante de novos convertidos vá sendo acrescentado ao conglomerado sempre crescente de congregações. Sexto: os convertidos, sejam eles 5 ou 5 mê, devem dizer ou pelo menos sentir: “Nós, mestãos, somos a sentinela avançada de nosso pesa, de nosso segmento da sociedade. Estamos mostrando aos nossos parentes e vizinhos um modo de vida melhor. O caminho que estamos Percorrendo de modo pioneiro é bom para nós, q3* nos tornamos cristãos, e será muito bom Pea os milhares de vocês que ainda precisam mex Por favor, não olhem para nós como traideres de espécie alguma. Somos filhos, irmãose maneira mais gentil.

Na famosa passagem em que Paulo enfatiza a unidade, ele também afirma: “Não pode haver nem homem nem mulher”. Todavia os cristãos, em seus colégios internos e orfanatos, continuam a manter dormitórios separados para meninos e meninas! Em Cristo não há distinção de sexo. Os meninos as meninas são igualmente preciosos aos olhos de Deus. Todos somos igualmente pecadores, salvos da mesma forma pela graça. Essas coisas são verdadeiras, porém há certas sutilezas acerca de questões sociais que os cristãos devem agora reparar.

Quando enfatizamos a fraternidade, não podemos nos esquecer de que a maneira mais eficaz de alcançá-la é conduzir um número crescente de homens e mulheres de cada etnia, tribo ou segmento da sociedade a um relacionamento de obediência com Cristo. À medida que multiplicarmos os cristãos em cada um desses segmentos, a possibilidade de fraternidade, justiça e bondade genuínas será tremendamente aumentada, De fato, a melhor maneira de conseguir justiça, ou talvez a única, é conseguir que um grande número de pessoas em cada segmento da sociedade se tornem cristãos consagrados.

Enquanto trabalhamos para que movimentos em direção a Cristo ocorram em cada povo, não vamos cometer o erro de crer que o método esposas melhores, melhores membros datribo, casta ou do sindicato, melhores do que an-

Estamos mostrando maneiras pelas quais, embora permanecendo integrados ao nosso -gmento de sociedade, podemos ter uma vida Eeihor. Queiram, por favor, considerar-nos os Femeiros do nosso povo a entrar numa maraq Toiosa terra prometida”, 4 étmo e último: enfatize a fraternidade *onstamtemente. Em Cristo, não há judeu, nem F<eo, nem escravo, nem livre, nem bárbaro, E nezs cita. Todos somos um em Cristo. Entre“anta, lembremo-nos também de que Paulo não a

7 de tirar uma pessoa de cada vez da sociedade para ingressar na igreja seja ruim. Uma alma preciosa disposta a suportar um terrível ostracismo a fim dé se tornar um seguidor de Jesus; uma alma preciosa que vem a Cristo por iniciativa própria esse é um método que Deus tem abençoado e usado para a salvação da humanidade. Todavia, é um método lento, que tende a isolar o povo a que pertence o convertido, impedindo esse povo de ouvir algo mais acerca do evangelho.

Às vezes, o método de ganhar um à um é o único possível. Quando for o caso, louvemos a ya Deus por isso e convivamos com suas limitações. Desafiemos todos aqueles maravilhosos cristãos que vêm suportando perseguição e opressão a orar a favor de seus queridos e a trabalhar constantemente, de modo a que mais pessoas de seu povo possam crer ser salvas.

Um a um é um dos métodos que Deus usa para o crescimento de sua Igreja. O movimento popular é outro método. Os grandes avanços da Igreja em regiões de religiões não cristãs sempre têm ocorrido por meio dos movimentos populares, nunca pelo sistema de um a um. Contudo, é igualmente verdadeiro que o método deum a um é uma mancira bem comum de começar. No livro Bridges of God, que Deus usou para dar início ao movimento de crescimento da igreja, utilizo uma ilustração. Digo que as missões começam a proclamar a Cristo numa planície

Uma igreja para ads so mero enorme de pessoas, onde grandes rgreia, podem ser organizadas, e onde à Igreja cre forte. Lá está a terra do movimento popular

Deixo essa ilustração com você. Aceitemos o que Deus nos concede. Caso seja trabalhar pelo método um a um, aceitemos o e orientemos os convertidos a confiar inteiramente em Cristo. Todavia, devemos otar para que, depois desse início, possamos chegara um terreno mais elevado, às regiões de pastos mais verdejantes, às terras mais férteis, onde grandes grupos de homens e mulheres, todos pertencentes ao mesmo segmento da sociedade se tornem cristãos e, dessa forma, abram caminho para movimentos em direção a Cristono meio de cada povo da terra. Nosso alvo deve ser estabelecer esses movimentos dentro de cada. segmento. Ali, a dinâmica da coesão sociallequase desértica. Ali a vida é dura, e o número de cristãos permanece pequeno. É preciso uma grande presença missionária, mas aqui ealios varáo evangelho adiante e conduzirá multidões das trevas para sua maravilhosa vida. Estamos chamando povo após povo para deixara mor missionários ou os convertidos encontram caminhos para sair da planície árida e subiratéas montanhas verdejantes. É lá que vive um nú-

Perguntas te e vir para a vida. Asseguremo-nos de que estamos realizando essa tarefa pelos métodos mais eficazes. para estudo “A melhor maneira de conseguir justiça, ou de pessoas em cada segmento da sociedade com esse pensamento? Por quê?

talvez a única, é conseguir que um grande número se tornem cristãos consagrados.” Você concond

E é. Por que McGavran insiste que “um conglomerado de igrejas que cresçam”, em vez de “ums igreja”, é o alvo correto no trabalho pioneiro de fundação de igrejas?', 93 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Xá Ali e Woodberry, cap. 105: Ásia do Sul: legumes, peixes e mesquitas messiânicas', 'Xá Ali e J. Dudley Woodberry

XÁ ALI é o pseudônimo de um seguidor de Cristo de uma família muçulmana do sul da Ásia. Atualmente, os cristãos de seu país sofrem perseguição. Ele traduziu o Novo Testamento para seu idioma valendo-se de terminologia muçulmana.

J. DUDLEY WOODBERRY é deão emérito e professor sênior de estudos islâmicos na School of World Mission, da Fuller Theological Seminary. Ele trabalhou no Paquistão, Afeganistão e Arábia Saudita. Dentre suas publicações, destacam-se Muslims and Christians on the Emmaus Road [Muçulmanos e cristãos na estrada de Emaús], Missiological Education for the 21st Century [Educação missiológica para o século XXI] e From Seed to Fruit: Global Trends, Fruitful Practices, and Emerging Issues [Da semente ao fruto: tendências mundiais, práticas frutíferas e questões emergentes].

Extraído de Theology, News and Notes, Fuller Theological Seminary, jun. 1992, p. 12-3. Usado com permissão.

Me pai, muçulmano, tentou me matar com uma espada quando me tornei seguidor de Jesus, após comparar o Alcorão com a Bíblia. Ele interpretou minha decisão como uma rejeição não apenas à minha fé, mas à minha família e à cultura também, Historicamente, os cristãos eram em grande parte convertidos da comunidade hindu e incorporaram palavras hinduístas e práticas ocidentais na adoração.

Tentando expressar minha fé, encontrei dois problemas. Primeiro: O cristianismo parecia coisa de estrangeiros. Segundo: as tentativas dos cristãos para satisfazer as tremendas necessidades humanas na região atraíam convertidos insinceros e oportunistas e, consequentemente, O ressentimento da maioria muçulmana.

Ee q sas

E AM unumnua

E ARBAET WOOD BERRY É dedo

Ge ESNDOS Seas 13 School of World Mission, 2:de Treologial Seminary, Ele rEshos no Paquistão, Afeganistão stiia Saudita. Dentre suas in

Fé cristã em veste muçulmana Eu começava a me adaptar à maneira estranha do cristianismo quando um missionário me contratou para traduzir o Novo Testamento, que utilizaria vocabulário muçulmano, em vez de hindu. Foi chamado também pelo seu nome muçulmano: Injil Sharif(evangelhonobre”). Milhões de injils eram comprados, e em sua maioria, por muçulmanos que agora o aceitavam como o “evangelho” do qual falava o Alcorão. Essa aproximação mostrou-se acertada não apenas na prática, com surpreendentes resultados, mas também no que dizia LÃ respeito à teologia. Diferentemente utdea das escrituras hinduístas, o Alcorão contém muito material da Bíblia. De fato, a maioria dos termos teológicos muçulmanos foram emprestados de judeus e cristãos.

ohisóci é aiiêa 2 cbrâda do Epi Weasiciogicol Education for fe Cercury IEducação missiológica Ers sécio Wi] e From seed to rea eo Ra Ni tendências coundias, práticas Prfras é questões emergentes], Etraido de Theology, News and

Mais tarde, um graduado da School of World Mission, do Fuller Theological Seminary, pediu-me para treinar 25 casais para viverem em vilas, dedicados à agricultura. Apenas um casal era de um contexto muçulmano. Todos os outros teriam problemas: os muçulmanos aceitariam visitá-los e ser visitados por eles, mas não comeriam sua comida até que eles começassem a se banhar pela manhã, assim estariam cerimonialmente puros, pela lei muçulmana, depois de terem dormido com a esposa.

[E 2552, 8 12.3, Usado com emenda

Arthur Jeffery, The Foreign Vocabulary of the Qur''an Oriental Institute, 1938).

Os casais cristãos eram chamados “anjos”, porque eram muito bondosos, honestos e altruistas e oravam à Deus, Entretanto, não eram considerados religiosos verdadeiros por= que não faziam à oração atual muçulmana cinco vezes por dia, Maus tarde, empregamos apenas casais cristãos vindos de contextos muçulmanos e desenvolvemos uma oração ritual que conti= nha todas as formas e conteúdos que muçulmanos e cristãos podiam compartilhar, mas que substitulam passagens do Mhonio por passagens bíblicas, Um pouco de adaptação foi necessária, porque o islã antigo emprestou muito das prá ticas judaicas e cristãs na formulação dos “pilares” da observância religiosa (a confissão de fé, permissão, e daquele cujo discurso ele apro (5:109, edição egipeia). Mas o Ingil Cevangelho”), que vem de Deus, de acordo com à Alurdo não apenas atesta que Deus aprenva a Jesus (Mt 3,17), mas que ele é 0 único intercessor 2.5),

Deus também tem mostrado seu poder por meio de orações respondidas, a recuperação de uma menina de 3 anos de idade que, segundo 5 médicos, morreria em algumas horas; o envio de chuva é a cessação de enchentes, o aparecitnento de um homem desconhecido para impedir uma multidão de matar um imame que seguia a Cristo,

Um esforço consciente tem sido feito para oração ritual, caridade, jejum e peregrinação)”

Nossos vizinhos muçulmanos definiram “cristianismo” como “uma religião estrangeira de inhéis”, por isso passamos a nos denominar “muçulmanos” (literalmente, “submissos a Deus"). À necessidade de submissão a Deus sem dúvida é cristã (v. Tg 4.7), e os discípulos de Jesus se diziam “muçulmanos”, de acordo com 0 lord

Quando uma vila inteira decide seguir a Jesus, o povo continua a usar à mesquita para adorar a Deus, mas agora por meio de Cristo, Sempre que possível, os líderes formais das fomentar o movimento de grupos para Cristo, em vez de apenas indivíduos. Membros de uma família só são batizados se o cabeça da famflia for batizado. Também há um empenho em verificar se os líderes entenderam a mensagem. Um xeque muçulmano místico (suf), depois de saber que o véu do templo foi rasgado de cima a baixo, atirou seu gorro muçulmano ao chão, aceitou a Cristo trouxe todos os seus segui dores consigo.

Uma vez que o analfabetismo é alto, a Bíblia eos materiais de treinamento são gravados em fitas cassete, e aparelhos para reproduzir as fimesquitas de oração (imames) são treinados para continuar a exercer o papel de lideres espirituais. Persuasão, poder e pessoas Deus usou outros meios, assim como a contextualização, para trazer muçulmanos à féem Cristo, Em diversas ocasiões, envolvi-me em debates públicos com professores muçulmanos (malvis) e mostrei-lhes que, ao contrário da crença popular, o Alorão não nomeia Maomé como intercessor, Em vez disso, atesta que, no dia do julgamento, “a intercessão não será válida, exceto a dele, a quem o Misericordioso der tas são disponibilizados para os moradores das vilas a baixo custo,

Tem havido perseguição. Nosso centro de treinamento foi fechado, Um processo foi aberto contra mim e contra três colegas de trabalho, Do mesmo modo, tem havido atrito entre os líderes e desentendimento entre grupos cristãos, Contudo, o movimento de pessoas para Cristo continua. À maioria dos novos crentes permanece em mesquitas independentes, mas algumas congregações contextualizadas têm se juntado denominação principal, enquanto outros individuos são absorvidos para dentro do tradicional contexto hindu da igreja.

Woodbemy Contextualizanos Aron Word Among Ui (Dulhas: Word, 1989), p. 282312, Nest contento, entre tanto, eles demonstravam que ainda são havis nascido),

Mus: Reusing Common Pillara, in; Dean 5, Galiitand (Org), 7h sua submissão per acreditar em Deus é em seu proteta (talve é Maoné,

7 gm direção responsável de autoajuda “Aém de tentar expressar nossa fé por meio de senificativas formas culturais, temos tentadoir encontro das tremendas necessidades básicas lizadas num sistema integrado de cultivo de legumes e criação de peixes. Os trabalhadores são, em turnos, mandados aos locais mais carentes, onde assumem a responsabilidade de sa nosso redor. Queremos proclamar o Reino demonstrar seus valores. Tentando fazer os “sis, surgem alguns problemas.

Primeiro: usar a necessidade básica para propúsitos evangelísticos e com isso manipular as pessoas ou atrair 0 insincero. Por isso, ajudamos os moradores nos vilarejos de qualquer filiação “«igiosa e não damos suporte financeiro a mesgaitas de Jesus ou aos seus imames. "Segundo: o antigo sistema de dependência volonizador-colonizado facilmente se transfere eara a dependência doador-beneficiário.

Terceiro: mesmo que a distribuição de comida doada de fora ajude apenas os moradores êa cidade, por causa da dificuldade de distribuição, é dado pouco incentivo aos camponeses para que produzam mais, por causa do preço eduzido artificialmente.

Quarto: a tecnologia introduzida só pode gadar aqueles que têm capacidade ou dinheiro para fazer uso dela, enquanto os mais pobres “podem apenas assistir ao aumento da distância Entre os que não têm. Para lidar com esses problemas, seguimos Práticas de desenvolvimento comuns, como em-Prestar sementes a serem devolvidas no tempo da colheita e providenciar bombas de água que são pagas conforme o aumento de pro-Cutividade. No momento, estamos adaptando “m programa de desenvolvimento no Sudeste Asiático com o objetivo de expressar a preocu-Pação holística cristã, lidar com os problemas detectados c assegurar que a igreja indígena *omtinue autossuficiente.

O programa está treinando trabalhadores Eatóctones na plantação de igrejas contextuatreinar fazendeiros locais na fácil transferência tecnológica que os tornará autossuficientes. O aumento da população significa menos terra disponível para cultivo, e uma pobre infraestrutura no transporte significa que a comida deve ser produzida próxima da data de consumo,

O sistema intensivo de produção alimentícia foi desenvolvido em outros locais. Nesse sistema, lagos para peixes são cavados, e a terra extraída é usada nos canteiros de legumes. Os caules que sobram e as folhas são usados para alimentar os peixes, e os resíduos dos peixes são usados como fertilizante para os vegetais. Esses centros de produção alimentícia ficam a uma distância dos centros urbanos que é possível percorrer a pé, o que possibilita as vendas diárias e facilitam o treinamento regional de fazendeiros e líderes das mesquitas de Jesus.

O conceito de mesquitas e muçulmanos (seguindo o modelo de sinagogas messiânicas judaicas) ainda causa considerável desentendimento entre alguns cristãos. À combinação de evangelismo e ministérios humanitários pelas mesmas pessoas também levanta preocupações entre os que sentem que as agências cristãs devem apenas concentrar-se numa atividade ou em outra, Contudo, os modelos que estamos desenvolvendo têm sido usados por Deus para conquistar muitos novos discípulos e expressam preocupação pelas necessidades físicas e espirituais do povo. Do mesmo modo, o movimento messiânico muçulmano tem se estendido a mais de um país vizinho por meio das habituais visitas de parentes. Meus colegas e eu visitamos um país do Sudeste Asiático recentemente, e uma vila inteira de muçulmanos começou a seguir a Jesus.

1. Por que as tentativas de utilizar formas culturais humanas apresentam tais problemas?

significativas e de suprir as necessidades

2. Podem os misstonários islâmico? Por quê?

chamar 4 si mesmos “muçulmanos” ou expressar sua fé ao mado cultural', 94 from cursos where slug = 'perspectivas';
do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 99;
  update aulas set ordem = ordem - 10000 + 5 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 12 · Leitura — Guzman, cap. 109: Nós como servos: obreiros latino-americanos no Oriente Médio', 'Andres e Angelica Guzman

ANDRES e ANGELICA GUZMAN (pseudônimos) são um casal latino-americano que por 20 anos trabalham na área de assistência e desenvolvimento humanitário. Eles são membros de várias organizações humanitárias seculares e cristãs. Escreveram diversos artigos e livros.

Andres e Angelica Guzman urante os 15 anos em que prestamos serviços humanitários no Oniente Médio, nossa equipe, formada por latino-americanos, teve o privilégio de testemunhar um movimento a favor de Jesus. Isso aconteceu na ocasião em que nossos amigos mais chegados e mentores transmitiam a vida e os ensinamentos de Jesus a várias centenas de pessoas de seus grupos populacionais. O movimento não aconteceu apenas como resultado de nossa relevância e progresso ministerial, mas também por conta da tradução das Escrituras, da formação de liderança e de uma visão encarnacional.

Antes da conclusão de nossa formação acadêmica na área médica, e mesmo antes de nos casarmos, minha esposa ceu nos sentíamos desafiados por textos como Isaías 49.6: “Te dei como luz para os gentios, para seres a minha salvação até à extremidade da terra”. Ainda levamos alguns anos até chegar à compreensão do que significava nosso chamado para servir os povos da terra, porque não tínhamos conhecimento de outras pessoas que compartilhassem de nosso interesse. Jamais havíamos ouvido falar de povos não alcançados e não tínhamos sequer ideia de que Deus estava operando por toda a América Latina, mobilizando sua Igreja no cumprimento da Grande Comissão.

Logo após nosso casamento, mudamos para outro país a fim de obter treinamento transcultural e começamos a pedir a Deus que nos levasse para o lugar no qual ele desejava que o servisseansamsammmmm mos. Sabíamos que Deus não nos havia chamado para sermos “missionários profissionais, e sim para nos unirmos a eleem sua missão de iluminar o mundo por meio do serviço aos necessitados, enquanto vivíamos e falávamos como discípulos de Jesus. Surgiua oportunidade, e, um ano depois, desembarcamos na cidade em que deveríamos supervisionar um projeto destinado a criar umsistema de distribuição de suprimento médico em cooperação com duas

ANDRES e ANGELICA GUZMAN (pseudônimos) são um casal latino-americano que por 20 anos NONO UR DSO desenvolvimento humanitário, Eles só rrasiros de vádãa Cipiniaddos himanitárias seculares é cristãé Escreverem diversos artigos e livros.

outras organizações com fins humanitários.

Paralelamente ao trabalho de manter o suprimento farmacêutico, instalamos um sistema informatizado para o depósito principal de medicamentos e para as farmácias de grande dis» tribuição ER he criadas Mag pelo Ministério ERAS da E Saúde. Desenvolvemos formulários e procedimentos a serem utilizados no depósito e nas farmácias e treinamos o pessoal. Fornecemos também informação especializada aos postos de saúde sobre ocri"sério para a correta administração dos medica“gentos, monitoramos o crescimento infantila “Em de conhecer o resultado dos programas nuericionais e fizemos levantamento das campaphas de vacinação realizadas, Desenvolvemos programas de treinamento para enfermagem, cirurgias, procedimentos de emergência, cuidados bucais e para os leigos envolvidos no serviço de saúde da população, Além dos projetos na área médica, também nos empenhamos em desenvolver um espaço para as viúvas “e mulheres de rua, no qual nos dispomos a “capacitá-las à sobrevivência,

Eram essas as nossas atividades, não apenas com o intento de converter uns poucos indiví“êaos ou ter uma desculpa para nossa presença. Pelo contrário, o que nos motivou foi o amor “3 Deus e ao próximo, Bascamo-nos na pessoa e nos ensinamentos do Senhor Jesus. Nosso desejo era demonstrar que o Reino de Deus realmente estava entre nós. Esperávamos que as pessoas percebessem algo diferente em nosso trabalho, porém nossa ajuda não implicava nenhuma forma de retribuição compulsória por parte da população atendida, Nosso esforço para realizar tudo isso não foi uma iniciativa isolada. A equipe latino-americana de que fazíamos parte era composta de membros procedentes da Bolívia, Colômbia, Costa Rica, México e de um médico canadense casado com uma mexicana.

No processo de servir a comunidade, acabamos por fazer muitos amigos: alguns oficiais do governo e suas famílias, homens de negócio, vizinhos, pessoas que nos auxiliavam com O idioma, membros da equipe e seus amigos. Aprendemos muito com eles: sua cultura, asimplicidade, o respeito pelos mais velhos, a culinária maravilhosa, as belas roupas, as danças alegres, sua criatividade.

Vivemos entre eles como discípulos de Jesus: dispomo-nos a perseverar sem nos deixar pasalisar pelo temor que se apoderou de muitos, porconta da instabilidade e dos conflitos ocor-É ridos na região, Aprendemos a viver alegremenveem meio à tensão, à falta de energia elétrica e à escassez de água, Envolvíamos o povo em nossas brincadeiras, oferecendo amizade incondicional, livres da pressão de ter de impressionar a Deus; compartilhando a capacidade de ouvir a voz dele, de falar-lhe acerca de nossas necessidades e de contar-lhe os segredos mais íntimos; testemunhando de nossa confiança na capacidade sobrenatural de Deus para curar e da autoridade para repreender, amarrar e expulsar os demônios, Também compartilhamos nossa convicção de que as boas novas sobre Jesus e seus ensinos não são exclusividade de uma religião, grupo étnico ou nação em particular, mas se destinam a todas as nações, tribos, famílias, contextos religiosos, gêneros e classes sociais, Tradução das Escrituras Sagradas Tivemos a oportunidade de auxiliar a sociedade bíblica da região na tradução do Novo Testamento no idioma da população minoritária de nossa área de atuação. Não foi difícil encorajar a distribuição da Bíblia. Descobrimos muitos Jíderes respeitados pela comunidade que partilhavam de nossa convicção de ser um direito inalienável de todos os povos a oportunidade de ler esse Livro tão respeitado. Nossos amigos muçulmanos estavam dispostos a receber a Bíblia, porque o profeta-fundador de sua re-Jligião os instou a ler os livros sagrados (Antigo e Novo Testamento) que foram escritos antes do livro sagrado deles, o Alcorão. Um novo movimento Em meio a tudo isso, muitos de nossos amigos decidiram seguir a Jesus. Alguns (sem que os incentivássemos) resolveram segui-lo, tornando-se cristãos, enquanto outros (também de forma voluntária) decidiram seguir a Jesus enquanto permaneciam na religião muçulmana. Outros ainda acharam por bem não se filiar a nenhum grupo religioso estabelecido, passando a chamar-se “crentes”,

O movimento entre os “crentes” nos surpreendeu pela forma rápida em que se multiplicou nos primeiros anos. Muitas novas comunidades germinaram. Acreditamos que existam muitos motivos importantes para tal acontecimento:

1. Eles experimentaram em primeira mão o convívio com verdadeiros discípulos de Jesus. Isso os ajudou a ver a beleza da pessoa e da doutrina de Cristo, livres dos nebulosos conceitos populares a respeito da suposta imoralidade, ganância, orgulho ódio dos cristãos pelos muçulmanos. Nossa vida crença e prática do Novo Testamento, se pedir a Jesus para guiá-la. Eles compreenderam que, independentemente da permanência ou não em sua comunidade religiosa de origem, poderiam se tornar seguidores de Jesus. 5. Foram incentivados a ser bênção, permanecenestava longe da perfeição, mas, pela graça de Deus, apresentamos um modelo de como viver como discípulos, até mesmo no que devemos fazer quando falhamos, À oportunidade de fazer contato com discípulos imperfeitos, porém genuínos, despertou neles o interesse de saber mais a respeito de seu Senhor. 2. O Senhor Jesus em pessoa se manifestou a muitos. Vez após vez, o próprio Senhor interveio a fim de conduzir a si aqueles que o buscavam. Ele lhes apareceu em sonhos c confirmou a verdade que lhes havia sido do em suas famílias e participando ativamente dos principais eventos, tomo casamentos efu= nerais. Nós os incentivamos a ajudarem os necessitados com disposição, a respeitarem as autoridades, a serem bons trabalhadores e chefes e a honrarem de todas as maneiras possíveis seu círculo familiar e seus vizinhos. É claro que eles também seriam bênção ao compartilhar a graça de conhecer verdadeiramente a Deus no meio de sua parentela e dos amigos, valorizando assim seus relacionamentos pessoais.

pregada. Eles testemunharam curas instantâneas e graduais, conforme orávamos pelas pessoas. Também experimentaram visõese receberam proteção sobrenatural. 3. Tiveram oportunidade de compreender que compromisso com Cristo e conversão cultural não são sinônimos. Nós é que nos convertemos à cultura deles, valorizando seu idioma, canções, provérbios, tradições, roupase alimentação. Mesmo quando se mostravam inseguros a respeito de si mesmos e de seu

Motivados pelo amor Todo esse movimento pelo Senhor Jesus aconteceu ao mesmo tempo em que estávamos tremendamente ocupados, dando o melhor de nós para proporcionar ao povo um serviço de socorro humanitário e condições de desenvolvimento de alta qualidade. Não oferecíamos nenhum brinde em troca de conversão religiosa nem distribuímos Bíblias ou qualquer outro tipo de literatura com nossos suprimentos médicos e cobertores. Não realizávamos apresentações do futuro como grupo populacional, nósosmotivávamos, demonstrando confiança nelese ajudando-os a prosseguir no serviço ao seu povo e seus familiares. 4. Tiveram oportunidade de compreender queo compromisso com Cristo é estendido a pessoas de todos os contextos culturais. Foiumagrande surpresa, quando eles descobriram que nós, embora provenientes de um contexto cristão, também tivéramos necessidade de nos tornar discípulos de Jesus, como ensina o Novo Lestamento, em João 8.30,31. Isso os ajudou a entender que qualquer pessoa, de qualquer contexto religioso, pode se tornar discípulo de Cristo, mediante a leitura, filme Jesus após as cirurgias. Procuramos servir a todos da mesma forma, motivados pelo amor de nosso Senhor Jesus por eles, seguindo seu exemplo de alimentar, curar e abençoar a: todos, independentemente de eles o seguirem ou não. Motivados pelo amor, e não porestratégia, não nos preocupávamos com a possibilidade de pessoas trocarem sua crença religiosa na esperança de beneficiar a si mesmas ou aos seus familiares, Não agregávamos nenhumaatividade religiosa ao nosso serviço humanitário e não diferenciávamos absolutamente a assistência prestada. Agindo assim, evitamos um problema comum a outros contextos, nos quais os chamados “cristãos do arroz” se convertiam saves Angelica Guzman “preligião de seus benfeitores na esperança de conseguir deles maiores benefícios. Sabemos que nossa abordagem pode papecer controvertida para alguns. Por um lado, dguns dirão que esse formato ignora a urgênpa em apresentar os fatos evangelísticos e que gsecisamos nos valer de todos os meios a fim de Pa “apresentar o evangelho a todos. Nossa simples sesposta ao argumento é que estamos seguindo 05 passos do senhor Jesus, o qual veio para «sei, e do apóstolo Paulo, que se satisfez em setomar tá “servo de todos À Grande Comissão dos são anula o Grande Mandamento,

Poroutro lado, outros poderão nos apontar o dedo por compartilharmos Jesus com nossos amigos, por considerarem que, ao fazê-lo, Ê

741 (uds corremos o risco de comprometer o trabalho humanitário. Contudo, nenhum autêntico seguidor de Jesus pode permanecer calado quando é questionado a respeito da origem dos frutos em sua vida, e todo trabalho humanitário tem motivações filosóficas que refletem indiretamente na maneira em que o trabalho é realiza- é do, Se servirmos à humanidade e falharmos em reconhecer a verdadeira fonte de nosso serviço, então estaremos anunciando a nós mesmos recebendo um crédito que não nos pertence.

Encontramos o devido equilíbrio em 2Coríntios 4.5: “Não nos pregamos a nós mesmos, mas a Cristo Jesus como Senhor a nós mesmos como vossos servos, por amor de Jesus”.

speseguir deles maiores benefícios, Sabemos que nossa abordagem pode pa“ecer controvertida para alguns. Por um lado, firaos dirão que esse formato ignora a urgén“qa em apresentar os fatos evangelísticos e que grmcisamos nos valer de todos os meios a fim de apessentar o evangelho a todos, Nossa simples dos mesposta do argumento é que estamos seguinpassos do senhor Jesus, o qual veio para vit, E do apóstolo Paulo, que se satisfez em ae tornar “servo de todos”. À Grande Comissão são anula o Grande Mandamento. Poroutro lado, outros poderão nos apontar a dedo por compartilharmos Jesus com nos“sos ASSES amigos, RE por considerarem que, ao fazê-lo, humanitário. Contudo, nenhar autêntico seguidor de Jesus pode permanecer calado ausundo é questionado à respeito da origem dos frutos em sua vida, é todo trabalho humanitário tem motivações filosáficas que refletem indiretamente na maneira em que o trabalho é realcado. Se servirmos à humanidade e falarmos em reconhecer a verdadeira fonte de nossa serviço, então estaremos anunciando a nós fes e recebendo um crédito que não nos pertence

Encontramos o devido equilibrio vim 2Coríntios 4.5: “Não nos pregamos a más mesmos, mas a Cristo Jesus como Senhor e a nós mesmos como vossos servos, por ativos de Jesus”.', 99 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 12 · Leitura — Queiroz, cap. 112: Missões de qualidade', 'Edison Queiroz

EDISON QUEIROZ é pastor da Primeira Igreja Batista em Santo André (SP) e presidente do Global Focus Brasil. Foi diretor executivo do COMIBAM, presidente da Cooperación Misionera de los Hispanos de Norte América (COMHINA) e fundador do Movimento Atos 1.8 em Ação. É autor de nove livros, entre eles O melhor para missões (Londrina: Descoberta, 1998) e A igreja local e missões (São Paulo: Vida Nova, 1998).

Extraído do livro Administrar missões (São Paulo: Vida Nova, 1998), do mesmo autor. Usado com permissão.

Minha resposta baseia-se naquilo que temos visto acontecer. na igreja evangélica no Brasil. As igrejas denominacionais têm feito o trabalho por meio de uma junta, de um departamento ow de uma secretaria de missões e têm obtido algum resultado, mas em certa medida esse modelo impede a igreja local de ter visão, de tea

E es v z=asmna EDISON QUEIROZ é pastor da Primeira Igreja Batista em Santo André (SP) e presidente do Global epa Brasi. Foi diretor executivo do onte América (COMHINA) e fundador do Movimento Atos 1 8 em Ação. É autor de nove livros, entre eles O meihor pora missões (tonárina: Descoberta,

Apa fog é múões São dorso sen ná missões (São Paufo: Vida Nova, 1258), do mesmo autor. Usado com permissão.

desenvolver projetos e de fazer a obra missionária como à Bíblia manda. O envolvimento da igreja acontece apenas num dia ou num mês do ano. Envia-se uma oferta para a denominação, é os membros se acomodam, pensando ter feito o trabalho missionário. Desse modo, não se utiliza o potencial missionário: aproveita-se apenas parte dele.

Há também as igrejas independentes que não têm programa de missões mundiais. Para elas, esse assunto é estranho. Não fazem nada, não oram, não contribuem. Entretanto louvado seja Deus! há igrejas que lutam para ser fiéis, obedientes e realizar a obra da evangelização do mundo. O número dessas igrejas, po-TéM, é pequeno, comparado com o número de crentes e de igrejas no Brasil.

O problema básico está no pastor da igreja. É dele a responsabilidade de levar o rebanho a cumprir a vontade de Deus. Todavia, há muitos pastores que não fazem nada para motivar as igrejas a buscar um crescimento efetivo, um discipulado dinâmico e a expansão do Reino de Deus. ERR

Estudando o movimento missionário Sape brasileiro, cheguei à conclusão de que, no que se refere ao envolvimento do pastor, existem três antudes em relação a missões. Primeira: o pastor apoia integralmente a obra missionária, que para ele é prioridade. Suas atirudes demonstram claramente que as missões mundiais são prioridade. Segunda: o pastor não quer saber de missões mundiais. Diz que não precisa fazer nada pela obra missionária, pois as missões são um ministério que Deus qutorgou a outro pastor. Terceira: o pastor não se envolve. Ele deixa O povo fazer, dá apoio de gabinete, envia gáison Queiroz oferta de vez em quando e pode até reali«ma rar uma ou outra conferência missionária, mas «cu coração não bate por missões. Precisamos orar por um verdadeiro avivamento espiritual “ma igreja brasileira, que traga uma visão séria

751 (séP a”. melhor desempenho possível nesse movimento. Por falta de informação e material de apoio, tem havido falhas nas quatro áreas básicas da obra missionária: processo de seleção, treinamento, envio cuidado do missionário.

da obra missionária.

Outro problema que detectamos está na eclestologia disciplina teológica que estuda a Igreja. Perdeu-se de vista a natureza missionária da Igreja. As End di elemento fundamental da Igreja. Ela mer paes fazer a obra ato A Uma igreja que não realiza rare dA

Dada, cogdiiçã banal ea asério aobra corpus uma E a De cada vez RA DE DE 0. SAPETUNIO APPO PPA na América Latina, com o movimento COMI-BAM, temos dado forte ênfase sobre a igreja local como base missionária. E Rncadid Charles van Engen faz a seguinte afirmação:

Recentemente, criou-se um padrão internacional, denominado ISO 9000, para atestar a excelência dos produtos e da prestação de serviços das organizações seculares. Recebem o selo de aprovação apenas os produtos e serviços que preenchem os requisitos do ISO 9000. O celo confere credibilidade ao trabalho desses grupos comerciais. Da mesma forma, as igredeveriam também ter um tipo de padrão de qualidade nas atividades missionárias. Isso exige boa administração. mafe À boa administração arbadirag é necessária para se aperfeiçoarem os padrões a de seleção, treinamento, envio e cuidado do missionário E no campo. Iemos falhado como líderes do povo de Deus por não o aplicar sá os elevados

Muitas vezes a missão Ver é relegada a uma daquelas a “sonhadas categorias a que esperamos chegar algum dia em nosso ministério, e quto Supõese que as go igrejas mais novas do Terceiro Mundo não estejam prontas para tomar parte da missão por conta própria até que conquistem certo grau de maturidade aquela maturidade em geral arbitrada pelos ocidentais, de acordo com padrões ocidentais. Enquanto isso, as congregações dos Estados Unidos e Europa muitas vezes relegam a “missão” à categoria de resto, dando prioridade às necessidades internas da congregação e dos membros. A missão chama-nos à um reexame radical. Se ela faz parte da essência da natureza da Igreja como Corpo de Cristo e povo de Deus, então deve ser a primeira da lista.! Aqui no Brasil, há um movimento de missões, e muitas igrejas se esforçam para obtero Povo missionário, povo de Deus (São Paulo: Vida Nova, padrões administrativos no planejamento das atividades A da igreja. ua”

A obra missionária O as é Bs coisa muito É séria. cas Já é o de re said e RE O TO a hdi da al pra no c dem Ave se K di ao a o de cite od L Em wi so pralond id dio di locar no campo missionário pessoas mal treinadas, sem chamado e sem apoio básico, espiritual e logístico da igreja local.

Acredito que é preciso rever e avaliar nossa metodologia missionária, a fim de levar o movimento missionário brasileiro para um alto padrão de qualidade. Oro a fim de que Deus ajude as igrejas brasileiras a realizar uma administração eficaz. Como resultado, veremos missionários saindo do Brasil bem preparados e com forte apoio espiritual e logística da igreja que os envia. Vidas serão salvas, igrejas missionárias serão plantadas e o nome de Cristo será glorificado em muitas nações. 1996), p. 100.

Perguntas para estudo

1. Quais as razões indicadas pelo autor para a falta de envolvimento de muitas igrejas locais em missões? Compare isso com a realidade das igrejas em sua região.

2. Se não existir apoio sério da parte da igreja local para o candidato a missões, é possível ele seguir em frente sozinho? Se não for possível, por que não? Se for possível, quais os critérios para tomar essa atitude?', 100 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 12 · Leitura — Carriker, cap. 114: A vocação missionária', 'C. Timóteo Carriker

C. TIMÓTEO CARRIKER é obreiro da Igreja Presbiteriana Independente e ministra no Brasil há mais de 30 anos. Doutor pela School of Intercultural Studies, do Fuller Theological Seminary, ele ministra aulas em cursos de graduação e pós-graduação e faz pesquisa para produzir material missiológico. Foi presidente fundador da Associação de Professores de Missões no Brasil (APMB), consultor da Associação de Missões Transculturais Brasileiras (AMTB) e de diversas outras organizações missionárias.

Timóteo Carriker Us uando se fala de “missões”, um dos problemas mais compleum verdadeiro quebra-cabeças para os jovens que estão considerando um ministério transcultural, é a questão do chamamento missionário. Trataremos da necessidade e da natureza de tal chamamento, distinguiremos entre o chamamento e a direção de Deus e, ainda, daremos algumas sugestões sobre como receber esse chamamento.

Ântes, porém, advirto sobre duas posições extremas, Por um

E k es a guuumu Renan lado, alguns insistem em que há um chamamento sobrenatural, como o que Paulo experimentou para ir à Macedônia (At 16.9,10), e que esse é o padrão para todo chamamento missionário. Geralmente, pensa-se em vozes, visões acontecimentos misteriosos pelos quais Deus fala audivelmente. Por outro lado, alguns alegam que nenhum tipo de chamamento é exigido, já que a tarefa missionánia cabe a todos os cristãos. Parecem duas posições contrárias. Para complicar, ambas demonstram um pouco da perspectiva bi-

TIMÓTEO CARRIKER é obreiro da Igreja Presbiteriana Independente e ministra no Brasil há mais de 30 anos. Doutor pela School of Intercultural Studies, do Fuler Theological Seminary, ele ministra aulasem cursos de graduação e pós-graduação e Pes pesquisa paia proSuES MANO papas jo as E ces Missões no Brasil (APMB), consultorda Associação de Missões Transculturais Brasileiras (AMTB) e de diversas outras organizações missionárias. É riam irei ou organizador de 12 livros, entre eles Missões na Biblia (São Paulo: Vida Nova, 1992), O caminho missionário de Deus (Brasília: Palavra, 2005) e A missão apocaliptica de Poulo (São derobesa ide blica, mas nenhuma a revela totalmente. Podemos desemaranhar essa questão? É necessário um chamamento? Essa pergunta diz respeito ao segundo ponto de vista mencionado anteriormente. Se a tarefa missionária cabe a todos os cristãos, seria necessário um chamamento?

Tudo depende do tipo de chamamento em que se pensa. À pala-Vra chamamento” é usada de várias maneiras no Novo Lestamento. Na maioria das vezes, refere-se à vida cristã, e não ao ministério. Há um chamamento geral de Deus (Rm 9.24-26), articulado por Cristo (Lc 5.32), a que todos os crentes sejam santos (Rm 1.7) segundo o padrão de Jesus Cristo (Rm 8.30). De fato, a Igreja toda “exerce um papel missionário Sage 1.8). Portanto, até certo ponto, podemos concordar com a segunda opinião: que todo crente, por ser crente, possui um chamamento geral para a vida cristã, isto é, para a santidade (testemunho de vida) e a evangelização (testemunho verbal). Esse é um chamamento geral e “automático” para (Org), Missões e O igreja brasileiro (São Paulo: Mundo Cristão, 1993), v.1. Usado com permissão.

“todos os crentes.

Quer dizer que nenhum tipo de chamamento específico e especial existe? Não. Há também um segundo tipo de chamamento “paro ministério de tempo integral (At 6,4; “4Co 12.29), o qual não é automático para todos es crentes, como o primeiro, e sim o resultado da eperação específica de Deus. Paulo era apóstolo pela “vontade de Deus” e foi constituído ou

Esse é um chamamento para o ministério evangelístico de tempo integral (Le 5.11), contudo não é necessariamente a um ministério missionário transcultural. Quanto a isso, observamos, em primeiro lugar, que alguns protestam designado ou feito ministro (Gl 1.1; Ef3.7; 2Tim 1.1). Não foi o chamamento macedônico que constituiu seu chamamento vocacional contra uma distinção entre o ministério “sagrado” (de tempo integral) e o ministério “secular” (de tempo parcial), mas Paulo aparentemente para 0 ministério de tempo integral, pois este já fora recebido antes (At 9.15; 13.2). O “chamamento” macedônico era mais propriamente separa o ministério de carreira da vocação secular (At 20.24; 2Tm 4.7). É dificil escapar da convicção de que a Igreja primitiva considerou a a direção específica do Espírito para uma etapa do ministério de Paulo, e não o chamamento de sua vida.

O chamamento para o ministério detempo integral é exemplificado por Jesus. Ele chamou “oração e o ministério da palavra” iguais ao que chamamos hoje “ministério de tempo integral”,

Em segundo lugar, esse chamamento de tempo integral é evidente, pois nenhum dos discípulos mencionados André, Pedro, Tiago

André e Pedro, e imediatamente eles o seguiram (Mt 4.20). Chamou Tiago e João, que também o seguiram sem demora (Mt 4.22), À evangelização do mundo e João retornou à sua profissão,

Em terceiro lugar, reparamos que Paulo foi chamado para ser apóstolo, um ministro

John R. Mott

Terconhecimento de Cristo é incorrer em tremenda responsabilidade eu não recebemos essa grande herança para nos apropriarmos dela la a outros. Ela abrange toda a humanidade. Somos administradores proprietários dele.

para com os que não o têm. Você e com exclusividade, mas para passádo evangelho e de modo nenhum

O peso da responsabilidade se torna ainda maior quando paramos para nos perguntar: "Se não levarmos o conhecimento de Cristo a essa gente, quem o fará? O que impeliria a nós, os jovens, e aqueles a quem fepresentamos, a nos lançar nesse empreendimento, levando Cristo a esses povos?”, Parece que nossas afirmações de uma humanidade comum e acerca da fraternidade universal bastariam para nos inspirar a irou enviar substitutos. Se isso não for suficiente, a regra áurea do Senhor, pela qual, segundo creio, cada umde nós deseja moldar conscientemente sua vida, nos conduziria lógica e irresistivelmente a fazê-lo, Se isso não nos comover, o exemplo do Senhor nesta era pragmática deve nos levar à ação, pois quem diz que permanece nele deve andar como ele andou. Se isso não nos comover, então cada pessoa que reflete Seriamente, ao que parece, deve sentir-se impelida pela Grande Comissão ou pelas ordens de marcha da Igreja de Deus. O último mandamento de Cristo está em vigor até que seja revogado, e não temos nenhuma indicação de que tenha sido cancelado. Não é opcional, como imaginam alguns, mas obrigatório. Ele aguarda seu cumprimento por meio de uma geração que terá a fé e a coragem necessárias, a audácia e O propósito de coração para cumprir seu dever para com todo o mundo. Parece-me que todo cristão de ver"dade deve ser um cristão missionário, pois, como disse o arcebispo Whately: “Se minha fé for falsa, devo mudá-la; mas se for verdadeira, estou obrigado a propagá-la”. Não há meio-termo: ou abandono minha religião ou sou um missionário no espírito.

John R. Mott foi um dos fundadores do Movimento Estudantil Voluntário, no final do século XIX, nos Estados Unidos. "Por mais de 30 anos, foi presidente do movimento, falando a dezenas de milhares de universitários. Por influência desse "movimento, mais de 20 mil missionários foram enviados ao campo. Esta seleção foi extraída de um sermão que Mott

Pregouem1901, de tempo integral, quer como missionário para seu povo, os judeus (ministério monocultural), quer para o gentio (ministério transcultural; v. At 9.15; 13.2,46). Ele também foi dirigido por Deus de maneira especial para um ministério entre os gentios, um ministério transcultural (Ef 3.8). Mais adiante, voltaremos à distinção entre o chamamento de Deus e sua direção. Aqui, ressaltamos apenas que o chamamento de Paulo se referia à sua separação como ministro de Deus de tempo integral e que a especificação desse chamamento veio depois, por direção do Espírito Santo, O que constitui um chamamento? Poucas vezes ocorre como relâmpago caindo do céu. Mais frequentemente, manifesta-se como uma convicção profunda e crescente, basceada em princípios bem definidos da Palavra de Deus, testemunhada no interior pelo Espírito vontade de Deus é dupla: é geral c é específica. À vontade geral abrange toda a criação e se manifesta na Bíblia. Não há mistério quanto a ela. Por exemplo, quanto à perdição, a Bíblia revela que Deus não quer que ninguém pereça (2Pe 3.9). Entretanto, a condição eterna específica de cada um é outra questão.

A vontade específica de Deus é o que o Espírito Santo revela a cada crente e varia de cristão para cristão. Os detalhes de sua percepção não são tão claramente delineados. Para conhecê-la, o crente deve ser renovado dia após dia em consagração (Rm 12.1,2). E preciso tempo e disciplina para sintonizá-la. O dr. Leighton Ford, da Associação Evangelística Billy Graham, disse-me certa vez que conhecer a vontade específica de Deus é como conhecer o cenário da próxima esquina só chegando lá é que o conheceremos. Isto é, precisamos primeiro dar os passos no caminho diante de nós de Deus e confirmada no exterior pelo Corpo de Cristo, a igreja.

2.4 Palavra de Deus. À medida que ocrente caminha com o Senhor à luz de sua Palavra, ele descobre, passo a passo, o lugar onde escuta aquela voz que diz: “Este é o caminho, andai por ele” (Is 30.21). O discípulo cristão precisa reconhecer, antes de tudo, o senhorio de Cristo para ser sensível à sua voz durante a leitura da Bíblia. Quem não se submete às diretrizes do

—a direção que já conhecemos para que, lá adiante, conheçamos o que vem depois. Muitos cristãos tentam saber a vontade específica de Deus para sua vida lá adiante, sem obedecer à vontade geral dele para hoje.

3. O Corpo de Cristo, a igreja. À igreja local confirma exteriormente aquilo do qual o Espírito dá testemunho no interior. Esse é um aspecto comum no Novo Testamento, mas que hoje poucos levam a sério. Na Bíblia, por mais

Senhor não pode esperar receber orientação muito clara dele. “Jesus Cristo é o Senhor” era a grande afirmação e o primeiro credo da Igreja primitiva. Esse fato deveria resolver a questão. Ele tem o primeiro direito em nossa vida.

2. O Espírito Santo. O testemunho interior do discípulo, pelo Espírito Santo, é mais intangível e pessoal, variando de pessoa para pessoa (Jo 3.8). Infelizmente, muitos cristãos hojeem dia não desenvolvem sua percepção espiritual. O Espírito Santo virou “doutrina”,em vez desera pessoa dinâmica que capacita o Corpo de Cristo para o alcance missionário, como era comum na vida cotidiana da Igreja primitiva.

É o testemunho do Espírito Santo quedirige o cristão e revela a vontade de Deus. À claro que fosse o chamamento, sempre havia uma confirmação pela igreja. Foi o caso de Paulo e Barnabé (At 9,15; 13.2), Timóteo (At 16.1,2), Epafras (C1 1.7; 4.12), Gaio, de Derbe, e Sópatro, de Bercia (At 20.4; Rm 16.23).

O chamamento para o ministério detempo integral só pode ocorrer por meio do Espírito Santo, mas deve haver algum tipo de confirmação por parte da igreja da qual o indivíduo participa. Ninguém o conhece melhor. Seisso for feito, as mãos e o coração dos jovens candidatos ao ministério serão fortalecidos, Caso contrário, será como a autoafirmação da profetisa Jezabel (Ap 2.20). Quanto a isso, Guilherme Kerr. Neto comenta em seu livro Liderança pastoraf “Deus é que declara alguém profeta, à igreja “geconhece, concorda e usufrui desse ministé“do. Quem a si mesmo se declara profeta em peral não é, Resumo Afirmamos que todos os cristãos são chamados para um testemunho missionário pela sua vida consagrada e pela proclamação verbal, por isso Já são “missionários”. Todavia, Deus chamaalguns para o ministério de tempo integral, quer monocultural (trabalho dentro da própria cultura), quer transcultural (numa cultura diferente). No contexto do ministério de toda a Igreja, o “sacerdócio dos santos” encontra a liderança ministerial de tempo integral após-. tolos, profetas, evangelistas, pastores e mestres. Tal chamamento é percebido na convivência coma Palavra de Deus, prefaciado com o reconhecimento do senhorio de Jesus Cristo, testemunhado no íntimo pelo Espírito Santo e confirmado pela igreja local.

apóstolo, sem a distinção monocultural ou transcultural, visto que ele pregava tanto para os judeus quanto para os gentios (At 13,1-49; 19.8-20; Rm 1.16), Seu chamamento ao apostolado estava ligado ao sujeito do chamamento: Jesus Cristo (Rm 1Co 1,1;2C0 Ef 1,1;C11.1;1Im 1.1;2Tm 1,1), Foi só com o tempo e com a direção do Espírito Santo que Paulo entendeu que seu esforço maior no exercício de seu chamamento seria um ministério transcultural entre os gentios. Podemos então dizer que o aspecto secundário de seu apostolado, o objeto de seu chamamento, era seu trabalho entre os gentios (Ef 3,7,8; Rm 11,13; G11.15,16). O chamamento de Paulo (como apóstolo) recebeu especificação (ministério transcultural) por direção do Espírito Santo,

Servir entre o próprio povo ou numa situação transcultural? À direção do Espírito é precisa, Ele dirige seus servos segundo sua vontade, Não é por acaso. Ele enviou Paulo aos

Quanto à natureza do chamamento específicoparao ministério de tempo integral, afirmamos que ele surge de uma convivência íntimae contínua com Deus. Pode acontecer de várias Maneiras, mas sempre estará relacionado aos seguintes fatores: convicção crescente pormeio "do conhecimento da Bíblia, reconhecimento gentios e Pedro aos judeus. Enviou William Carey para a Índia, Hudson Taylor para a China e Sadhu Sundar Sing ao Tibete. Percebendo a direção do Espírito Já mencionamos que Paulo recebeu a direção do Espírito, em Atos 16, para ir à Macedônia. Às do senhorio de Jesus, testemunho interior do Espírito Santo e convicção pessoal reconhecida e confirmada publicamente pela igreja. Chamamento ou direção Deve-se fazer uma distinção. O “chamamento” macedônico cra mais precisamente a direção do Espírito Santo (At 16,6-10). O chamamento Ocorre uma vez na vida e, uma vez compreendidoc obedecido, não precisa ser repetido. Con"tudo a direção para o bom desempenho desse chamamento é necessariamente contínua, algo para a vida toda.

O chamamento de Paulo era para o mi-Nistério de tempo integral, nesse caso, como apóstolo, tanto num ministério monocultural “Quanto num ministério transcultural, como já foi dito, O chamamento de Paulo era como circunstâncias dessa visão são instrutivas para entendermos como funciona a direção do Espírito. Repare que Paulo havia feito tentativas anteriores de ministrar em várias regiões, mas o Espírito Santo o impediu (v. 6,7). Em nenhum dos casos de impedimento pelo Espírito, Paulo é admoestado por tomar decisões sem primeiro receber um “sinal” de Deus. Aliás, a impressão do leitor é de que Paulo fez o certo, tentando penetrar naquelas regiões, e que assim o Espírito o dirigiu. O princípio em jogo nesse relato é que Paulo não era passivo, mas agia e tomava decisões, sendo estas depois confirmadas ou não,

Dessa forma, a direção do Espírito pode ser descrita como o leme de um barco, que não dirige o barco, a não ser que ele esteja em movimento. O servo de Deus percebe melhor a raia direção do Espírito quando exercita ativamente seu ministério.

Essa perspectiva pode parecer um tanto “carnal” qu “não espiritual”. Parece resultado ei

Aqui há dois perigos: hiperatividade ou pass sividade, correr antes do Senhor ou ficar para trás, Creio que para cada um que caí no primei» roerro, dez caem no segundo, São pessoas que de ideias próprias, porém é o processo que encontramos na Bíblia, O próprio Paulo se expressou assim: "Penso que também eu tenho o Espírito de Deus" (1Co 7,40), Lucas disse: “e concluindo que Deus nos havia chamado” (At 16.10). À direção do Espírito é acertada não conseguem fazer uma decisão importante em relação ao ministério, Examinam os fatores oram a respeito, conversam com os outros, mas não tomam uma decisão, O problema é que querem 100% de certeza, o que, é claro, nunca acontece, À direção do Espírito sem somente depois que o servo toma decisões e age, não confiando na certeza de sua decisão, mas convicto de que o Espírito o dirigirá ou impedirá, permitindo ou se revelando de ou tra maneira,

Enfim, quem deseja acertar a direção do Espírito precisa ser ativo com a mente aberta (disponibilidade de pensamento), o ouvido atento (acostumado a ouvir a Deus e obedecer à sua direção), o coração puro (a imoralidade ensurndece a percepção, 51 66.18), as mãos ocupadas (lembre-se do leme do barco)e pre é perfeita mas nunca é percebida assim, pois tem de passar pelo filtro da mente humana. Todavia, justamente porque não há certeza, agrada à Deus que confiemos nele, ténhamos fé e sejamos sempre dependentes dele, O cristão caminha pela fé, e não pelo que vê (2005,7), Chega a hora em que ele precisa tomar uma decisão, agir e ir em frente, disposto a encontrar impedimentos do Espírito e visões para outros caminhos.

Jaime Elliot escreveu, em 1949, quando estudava na universidade cristã:“Não é tolo os pés em prontidão (disponibilidade de ação, 91119,32; 52,7).

Perguntas quem entrega o que não pode possuir a fim de ganhar o que não pode perder”, para estudo

1. IEm vista das necessidades espirituais de nosso mundo, é estejam seguindo o chamamento do Senhor. Explique.

provável que muitos cristãos não

2. O que é necessário para o cristão não ficar ir além?

para trás da direção do Espírito Santo? E para não', 101 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 12 · Leitura — Burns e Machado, cap. 113: O papel da igreja local no preparo missionário', 'Barbara Helen Burns e Jonas Machado

BARBARA HELEN BURNS é coordenadora acadêmica da Escola de Missões Transculturais da Missão JUVEP (João Pessoa) desde 1999. Antes disso, ajudou no início da Missão Antioquia e, por muitos anos, foi professora de missões na Faculdade Teológica Batista de São Paulo. Doutora em missões pela Trinity Evangelical Divinity School, foi fundadora e secretária executiva da Associação de Professores de Missões no Brasil (APMB). É membro do Grupo de Liderança da Comissão de Missões da Aliança Evangélica Mundial desde 1992.

JONAS MACHADO é pastor batista em Jundiaí (SP).

Extraído da revista Capacitando, n. 11, 2002. Usado com permissão.

R Ê o Par e MA po AR Y aummma Desse BARBARA HELEN BURNS é tordenadora acadêmica da Escola ée Missões Transculturais da Missão Eco povo PESSOA) GSE JON, Artes disso, ajudou no início da É MssSo Antigua é, points foi professora de missões na Faculdade Teológica Batista de São Pao. Doutora emmissôespela Trinity Evangelical Divinty School, fo espaço e ba in o e O rea é. PO Brasil (APMB), É membro do Grupo "de Liderança da Comissão de Missões Bá Aliança Evangélica Mundial Cedo 1992, ese Qunuansnmnmus JONAS MACHADO é pastor baita E emtundal(so)

Etraido da revista Copacitando, AM, 2002. Usado com permissão.

dO unas a igreja local é considerada o lugar do preparo misionário. Ela envia os candidatos para seminários e escolas de treinamento sem conhecê-los profundamente c sem ter tido uma contribuição significativa na vida deles, pensando que todo treinamento será feito naquelas instituições. Os resultados são alunos sem experiência cristã consistente, sem prática ministerial e sem conhecimento da Palavra de Deus e das grandes verdades que definem o cristianismo, Sem o preparo na igreja local, o candidato a missões E chega à escola e, mais a tarde, ao campo missionário com os fundamentos minados e com lacunas na formação e na construção do caráter e da capacidade missionária.

Temos de compreender a vital importância da igreja local no preparo do missionário. O contato de longo prazo, o ensino da Palavra, a vida em comunidade e o crescimento mútuo de cristãos que se amam e ajudam uns aos outros a viver dignamente no Senhor é a melhor escola missionária. O missionário levará con-SÍgO para O campo as atitudes co modelo que fizeram parte de sua formação cristã, repetindo e imitando o que experimentou e “viveu (muito mais do que aprendeu numa escola formal, embora precise dela também, para complementar seu conhecimento tcológico e missiológico).

Como é importante esse modelo de igreja que serve ficlmente ao Senhor no trabalho evangelístico va e no discipulado o cristão! TA Como é importante que o missionário tenha experiência profunda numa igreja que segue as diretrizes bíblicas em seu modo de ser e de servir e louvar ao Senhor:

Em termos práticos, o que a igreja local pode fazer para melhor enviar seus candidatos a missionários? Creio que há cinco áreas principais em que ela tem maior responsabilidade e melhores condições na formação k dos missionários, de Ta 1. Atitudes para com Deus "Quem é Deus? Quais são suas características? Como é nosso relacionamento com ele? Às mais variadas atitudes a respeito de Deus VigOrAM Em nossas igrejas. Scott Horrell elaborou a seguinte lista:

Deus é um ditador sobre ovelhas passivas. O fatalismo cul- “tural invade as doutrinas sob diversos nomes: “confiança”, “fé, se Deus quiser”, "Deus quis assim", “Deus é soberano”.

Deus éum sorridente pal passivo. Ele não irá fazer mala nlaguém, especialmente se a mãe de Jesus e o próprio Jesus lhe pedem. Ele quer ser aceito pelo povo, então agrada e faz 0 que a pova quere ordena,

Deus é um animador celestial de festas, com gritos e danças, Servir a Deus con siste em fazer muito barulho e movimen= tação, quase exclusivamente na hora do louvor, nos cultos,

Deus é austero, quase sempre negativo, não gosta de nós. Ele é perigoso e deve ser evitado!

Podemos rir de algumas dessas classificações, mas, infelizmente, elas são verdadeiras para muitas pessoas, Com que ideia de Deus o missionário sairá do Brasil para evangelizar um povo que ainda não sabe nada do Deus cristão? Que ideia será comunicada e implan= tada nos fundamentos da nova igreja iniclada pelo missionário?

Que Deus maravilhoso temos para manifestar com a vida e com palavras aos povos um Deus majestoso, criador, justo! Sabemos que esse Deus grande, imenso, nos ama também. Cabe a nós ser submissos a ele, aceitá-lo e saber com certeza que sua vontade em nossa vida é por amor. Se ele entregou o próprio Filho por nós, quanto mais irá cuidar de nós, mesmo nas dificuldades!

Deus não é obrigado a nos poupar das dificuldades. Ao contrário, ele prometeu dificuldades, para nosso aperfeiçoamento, Jesus nunca negou as informações da destruição de Jeru= salém, da dispersão dos crentes e do martírio de seus discípulos, Mesmo assim, eles não duvidaram de que era tudo direção de Deus, Eles tinham não apenas promessas de tribulações, mas também promessas de vitória e glória no final, Por isso, perseveraram é venceram,

Deus é trino. O Pai, o Filho e o Espírito Santo são envolvidos na missão da Igreja. Deus

Adaptado de Ultrapassando barreiras (São Paulo: Vida

Dal enviou se Filho poe amar de mundo O Filho, por sta ves, envia acus discípulos, pelo poderdo Espírito Santo, é promete estar com eles até à consumação dos séculos)

A doutrina da Trindade pode ser conside: rada por multos teórica demais, sem aplicação prdtlea e dificil de entender Sem diminuto seu valor mas deixando de lado infindáveis dia cussões sobre minúcias, alguns tém chamado a atenção para vários aspectos de aplicação prática dessa doutrina, que antes não eram tão ressals tados. Isso também pode ser observado quanta A stia relação com missões,

O Deus trino tem conição missionário. De fato, à doutrina da Trindade sugere apltcações bem práticas para as missões, Eis alumas delas:

a) Cooperação. O Deus trino age em coaperação, O Pai criou, o Filho redimiu, o Espírita Santo levou a efeito, Aliás, a cooperação faz parte de sua natureza, O missionário, ser humano criado À imagem do Deus trino, é convocado para atuar em cooperação não por ser uma boa estratégia, mas porque trabalhar em equipe faz parte da natureza e da obra de Deus, Assim, q obra missionária deve acontecer em cooperação entre missionários e missionários, igreja local e agências, Essa visão do missionário no campo. começa na igreja local e compreende a natureza de cooperação do Deus trino, b) Distribuição de funções sem parcialidade Às pessoas da Trindade têm funções definidas. O Pai criou, o Filho redimiu, o Espírito Santo capacitou, Assim, podemos falar de Deus sobre nós, Deus por nós, Deus em nós, Tanto a igreja local quanto os missionários entre ste. as agências missionárias devem entender bem suas funções, Um não precisa atropelar o outro ou prescindir do outro,

O missionário no campo, por exemplo, deve desde cedo delegar funções, Deve confiar na capacitação dada por Deus nos nacionais, em vez de ficar nutrindo o sentimento de que “eles ainda não são capazes, Se o missionária cons. viveu numa igreja local onde à obra é realizada. Nova, 1994), po 10, Rae "pen base nos vários dons distribuídos entre os casãos Crentes, e não no sacerdotalismo ou meso nO messianismo do pastor ou de uns poucos sinistros, será muito mais fácil para ele comprender essa necessidade.

Humildade voluntária. À Bíbliadiz queo Fio decidiu voluntariamente se humilhar

Espírito glorifica o Filho (Jo 16.14). O Filho glorifica o Pai (Jo 17.4). O Paiexalta

Filho (Fp 2.9-11). Isso implica a natureza

SErVIÇO da obra missionária, Ninguém deve querer ser missionário para ficar famoso ou para terum emprego (já que não consegue outro mesmos). À igreja local não deve se envolver missões para crescer e ficar famosa como seu nome se pregasse arrependimento para remissão de pecados a todas as nações, começando de Jerusalém (Lc 24.44-47),

Em nossos dias, à mensagem do “evangelho” em geral consiste em convidar o povo para conhecer um Jesus que irá resolver todos os problemas, que ajudará todos a se sentirem bem e que é um bilhete para o céu. Não entendem o pecado, à cruz, o sangue sacrifical de Jesus como Cordeiro de Deus nem a esperança da ressurreição. Pouco entendem a graça e a misericórdia de Deus. Há pouco quebrantamento em nossas igrejas nos dias de hoje. À mensagem pácica foi alterada.

“grande igreja missionária”, O envolvimento qom missões deve ser resultado do desejo votuntário de Servir, Servir à Deus. Servir à igreja. Servir A sobe ee aE di Enfim, o missionário precisa experimentara— Di doerbio do Deus ua de forma bem prática, é O Pa o ATI local o FE E EAR A dcnaia Então, “Jocal. Atitudes de submissão, temor, Juvor verdadeiro (de coração, não apenas barulho), amor e até paixão em seguir e servir a um Deus como o nosso podem acontecer entre os membros da comunidade e na vida da igreja local. É parte essencial do preparo missionário daigreja ajudar as pessoas a conhecerem profundamente esse Deus soberano e maravilhoso.

7 2. Atitudes para com a mensagem do evangelho Jesus deixou claro aos seus discípulos o cerne da mensagem dele e da Ipreja:

Sãoestasas palavras que eu vos falei, estando ainda convosco: importava se cumprisse tudo o que de mim está escrito na Lei de Moinos Profetas e nos Salmos. Então, lhes abrivo entendimento para compreenderem às Escrituras; e lhes disse: Assim está escrito a que o Cristo havia de padecer ressuscitar “dentre ós mortos no terceiro dia e que em

Uma sala de aula não pode ser o lugar para aprender essas coisas. O evangelho tem de ser aprendido e conhecido na igreja local, para que se tenha a compreensão e a possibilidade de comunicar essa maravilhosa mensagem aos outros. (Os membros das igrejas devem ouvir a mensagem do evangelho repetidamente (Paulo nunca CANSOU de anunciá-la) e ser levados, desde o a RAD ne ER tia a vida ERA eco E E ÇA ae E ê Em Eve PENAL SA Go oe Te pesa e o campo Efe

AUçeS E TaCENT Ad palavra Rag de CLA D Na Grande Comissão, Jesus ordenou que fóssemos a todas as nações, ensinando a guardar ço que ele havia ensinado. Podemos ver claramente em Lucas 24 que Jesus constantemente ensinava seus discípulos: “começando por Moisés, discorrendo por todos os Profetas, expunhalhes o que a seu respeito constava em todas as Escrituras” (v. 27), Mais adiante, ele diz a todos: “São estas as palavras que eu vos falei, estando ainda convosco: importava se cumprisse tudo o que de mim está escrito na Lei de Moisés, nos Profetas e nos Salmos” (v, 44).

Jesus baseava seu ensino nas Escrituras. São inúmeras as citações que ele faz, chega a dizer que nem um jota ou til seria mudado, e que tudo passará, menos sua Palavra.

Os membros das igrejas sabem que a Bíblia tem essa autoridade? Que é a verdade de fato? Ou para eles é apenas um enfeite na cabeceira da cama, uma falsa demonstração de espiritualidade nos domingos, quando é levada embaixo do braço?

Alunos de teologia e missiologia que não tiveram formação sólida na igreja local quanto ao significado da Bíblia começam seus estu= dos com grande desvantagem. À Palavra não é um meto livro. É o que o Espírito Santo usa para nossa edificação e constante crescimento no conhecimento e obediência a Deus. Paulo escreveu a Timóteo nos mesmos termos:

Tu permanece naquilo que aprendeste e de que foste inteirado, sabendo de quem o aprendeste e que, desde a infância, sabes as sagradas letras, que podem tornar-te sábio para a salvação pela fé em Cristo Jesus.

Toda a Escritura é inspirada por Deus e útil para o ensino, par a repreensão, para a correção, para a educação na justiça, a fim de que o homem de Deus seja perfeito e perfeitamente habilitado para toda boa obra (2Tm 3.14-17),

Com que visão e conteúdo da Palavra os missionários têm sido enviados por nossas igrejas? Adquirem eles algum conteúdo nas mensagens, na escola dominical, nas conversas com os líderes e com outros membros? Ouvemeles ensinos sobre a história bíblica, as grandes doutrinas do Novo Testamento e as bases essenciais antecedentes do Antigo? Sabem eleso que aconteceu em Gênesis c o que significam os sacrifícios, as festas e a lei para Israel? Compreendem eles como Deus preparou o mundo para a chegada do Messias? Creem eles que é Deus quem fala através das páginas da Bíbliae que devem prestar muita atenção e buscar com dedicação o que nela está contido? Consideram eles a Bíblia relevante e essencial para sua vida cotidiana? Amam eles a Palavra de Deus?

Se a resposta for negativa, como irão “fazer discípulos de todas as nações”, ensinando-osa obedecer a tudo que Jesus ordenou? Ensinara

Palavra e sobre a Palavra deve ser a essência do curriculo missionário da igreja local, 4, Atitudes para com a própria Igreja O que é a igreja local? De onde veio? Qual seu papel e significado? Como deve ser estruturada e mantida? Como é sua liderança e como se dá o processo de mudança e de crescimento? Se o missionário vai trabalhar no plantio de novas igrejas ao redor do mundo ou edificar igrejas já existentes, ele precisa ter convicções fortes quanto ao significado da igreja local,

Há contrastes na concepção de muitas pessoas acerca da igreja local, À cultura influencia muito em seu funcionamento e significado, Alguns a consideram uma espécie de clube: o interessado se torna sócio pelo batismo e paga a mensalidade para manter essa condição, Outros a encaram como um hospital: procuram a igreja para serem curados, Para outros, é uma empresa com chefes, subordinados e funcionários, tudo organizado em níveis de hierarquias e autoridades. Pode ser também como uma sociedade secreta: os de fora não têm acesso aos seus ensinos. Pode ainda ser o lugar onde se pode ficar rico e ter os pedidos atendidos, se for pago o suficiente nas ofertas.

Infelizmente, para outros, é uma rotina, uma obrigação a cumprir, pois se não participarem, pelo menos sentados no banco, o patrão ficará zangado ou eles não terão aceitação da família e dos amigos.

À Bíblia, porém, deixa claro que a igreja local é outra coisa. É uma família, um Corpo no qual todos são amados e importantes. É lugar de crescimento, de comunhão e de exortação para aperfeiçoamento. É um edifício, no qual todos os membros trabalham para o crescimento e edificação mútua, Não há grupos privilegiados, mais amados por Deus. Todos possuem dons que são úteis para os demais, Todos devem ser cuidados e amados aproveitados para o Reino de Deus.

A igreja é o canal por onde Deus comunica seu amor e sua majestade às nações. À continuidade dessa comissão, desde Israel, é evidente. O apóstolo Pedro cita fexodo 19.5,6 em sua primeira carta às igrejas da Dispersão:

Vósl..) sois raça eleita, sacerdócio real, nação tanta, povo de propriedade exclusiva de Deusa fim de proclamardes as virtudes daquele que vos chamou das trevas para a sua maravilhosa luz; vós, sim, que, antes, não tres povo, mas, agora, sois povo de Deus, que não tínheis alcançado misericórdia, mas, ago-Fá alcançastes misericórdia (1Pe 2.9,10),

À igreja, portanto, é um grupo de redimidos ai vibram com a praça de Deus que receberam,

MO gratos pela misericórdia demonstrada nosa“«nificio de Jesus e são rs do amor que Deus fes derrama ho coração, um grupo de pessoas cheias do Espírito Santo, o qual veio para Jhes dar poder, à fim de que possam fazer missões “44 1.8), À igreja tem de crescer, acrescentar 4 cê dras à sua PO (crescimento numérico)

gar à Ego di po egobeom piora da did e rea REM sie e relevante, para Que dare F é ii PERLA é mada em ida poa afro éh a à ia na Da 19T hBreja *Ocal, Estudar s0bre algo é dem Ci" q terente de viver algo.

A maioria e dos missionários E transculturais estará trabalhando, de uma forma ou outra, ou Dyson o obictio lê iorelás Ad ari teziões s nionieirás pioneir ou “edificando dO igrejas que já existem, mas para isso Enecessário que o tenham passado pelo currículo de preparo da PE igreja é local, À maioria esquecerá bag boa parte ai do que aprendeu na sala de aula, mas R9 campo irá lembrar e repetir o que aprendeu na prática (e “na pele”), dentro da igreja, Predisamos de missionários vindo de igrejas sau“Báveis e bíblicas, que possam multiplicá-lasao NAMda da EAR 5, Atitudes para com o povo O enissonáão rá inbalhas Go Dio risdo sempre de um contexto diferente. O modoem “Que as pessoas “diferentes” eram tratadas emsua Igreja de origem determinará, em grande parte, O tratamento que ele dispensará ao povo-alvo caos dominador, ele será um missionário dominador, de 0 pastor era “mais importante”, ele também irá querer ser 0 mais importante no campo considerará o povo uma classe inferior, Se 0 pobre era tratado com desprezo em sua igreja, assim O missionário O tratará no campo.

A igreja pode ajudar na formação de boas atitudes sociais não apenas no tratamento que dispensa às pessoas, mas também na forma em reage aos acontecimentos fora dela. Qual a atirude da igreja quando há uma guerra na África ou um terremoto na Índia? À igreja se envolve em oração? Quando há injustiças, perto ou longe, a igreja procura defender os fracos e ame“mirar seu cotrimento

Como os ricos de sua igreja tratam os pobres? Mostram-se acessíveis? Compartilham refeições? Og pobres ocupam funções de liderança espiritual na igreja? À Bíblia inteira revela o desejo de Deus de ver seu povo tratando com justiça 4 todos, de igual modo, desde a pessoa vestida de trapos até o dignitário que entra pela porta.

Jesus escolheu a nós pessoas sem nenhum merecimento de sua salvação e de sua presença em nossa vida, a Não adá temos nenhum direito tê de aspirar posições fo de superioridade, cid mesmo com FERNINOS 6 GUIDOS ACIMA do normal, Com atitude de gratidão e humildade, podemos viver e trabalhar no meio de qualquer grupo, amando-os com o amor de Deus e alcançando-os para sua glória! ese die Ros dinda À MA e unchns dei á iacadlá Eai o Reg al a AMP id it é mei ais bem ai Da de que o candidato está pronto para outro preparo fora dela. O acompanhamento mais de perto, os relacionamentos estreitados com os líderes da reconhecimento de problemas pessoais familiares Pap 6,968 UNPORVANTES POR Parte da igreja local, Tem sido de grande benefício os currículos mais formais de algumas igrejas, que passam ao candidato tarefas de leituras bíblicas tra paternalista, ele provavelmente terá dificul-Sades em não ser paternalista. Se o pastor era isso apenas para a escola, O candidato tem condições de compreender e comunicar um texto bíblico sobre missões? Tem o hábito de ler livros de teologia, biografias missionárias e outras

A seguir, apresentamos um quadro que ugtra a diferença entre o papel da igreja não só no obras relevantes? O candidato busca melhorar seu conhecimento, ou acha que já sabe de tudo? Participa de conferências e congressos missionápreparo, mas também na atuação total do missionário, em comparação com escolas agências, As escolas e agências têm suas funções, mas a rios? Contribui para o desenvolvimento da consciência missionária na igreja? Ora pelas missões igreja local é sagrada em todo o processo de conversão, discipulado, preparo, envio suse pelos povos? Os pastores conhecem todosesses aspectos da vida do candidato?

FUNÇÃO IMEA tento daquele que pretende levar tudo isso a outros campos, EA O AGA e Treinamento básico; experiência prática de minis-E

Ajuda a desenvolver o e Treinamento especializado e raciocínio, a utilizar a lógica; mais profundo,

PREPARO (E(4.11-16); Formação de atitudes básicas para com Deus, à Bíblia, a igreja e as pessoas.

conhecimentos; proporciona um preparo mais profundo e especializado, e Seleção de quem está pronto para ser missionário, julgando-se SELEÇÃO caráter, prum porno soh cgi chamado (Fp 2.19-22), e Deve fornecer avaliações do Confirma a seleção em aluno (e deve ser procurado relação ao ministério e vida para essas avaliações); transcultural; Deve contatar a Igreja e a e Informa a igreja e a escola agência para saber qual o sobre o tipo de pessoa treinamento mais adequado, necessária á para o campo, é e O Espírito Santo envia por melo da igreja (At 13,1-4); ENVIO Escolher uma agência e uma boa escola,

Deve ser o alvo das escolas Culda da burocracia, contatos teológicas. no campo, logística, estratégia acta a

Apoio de quem já viveu transculturalmente, e O missionário é sustentado, principalmente pela igreja SUSTENTO Fp 4,10-20); hs

Sustentar alguém; º Ser fiel no sustento, e Deve também orar, ofertar; e Estabelece o nível do sustento

Oferecer reciclagem: necessário no campo; à Eviar liros colevantos e Canaliza o sustento;

e Verifica se o sustento é suficiente, e Procurar entender e TRABALHO aprender (At 20);

DO MiS-SIONÁRIO o Verifi erificar contorm formidad ade com os princípios bíblicos. FAS ee Apoiar o missionário consa (ERG TOS em oração Rat Eira PA ea O e Educar conforme a Bíblia e e Coordenação estratégica;

as necessidades do campo e Trabalho em equipe.

educação teórica com aplicação prática. 4H

Em cada aula, cultos; e Ajuda a igreja como orar; e Ensino sobre oração e Envia cartas de oração;

missões, Mantém contato com a igreja sobre necessidades.

Manter comunicação constante com o missionário COMUNI- (exemplo de Paulo); "CAÇÃO Manter comunicação constante comajunta queo enviou, e Aprendizado por meio do Mantém comunicação cons- À conhecimento do missionário; tante com o missionário;

ES Viagens de curto prazo, Mantém comunicação constante com a igreja.

E e Demonstrar compreensão RECEPÇÃO (At RETORNO Verificar necessidades, DOCAMPO Demonstrar amor einteres-À co] severdadeiros/ cuidados, e Convidar para compartilhar; e Controle de tempo adequado,

Reciclagem; época, logística, e Convidar para dar aulas. e Verificar saúde, atividades, 1:

descanso. ne

Soa:

Perguntas para estudo Quala melhor idade para começar o treinamento de quem se sionário? Em sua opinião, o que a igreja pode fazer com os sente chamado para o serviço misadolescentes? E com os juniores?

Em termos práticos, como a igreja local pode coordenar o escola c a agência missionária?

treinamento do candidato com à', 102 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 12 · Leitura — Ekström, cap. 117: Missões e Cia', 'Bertil Ekström

BERTIL EKSTRÖM é pastor batista, professor de teologia e de missões e diretor executivo da comissão de missões da Aliança Evangélica Mundial. É ex-presidente da AMTB (1991-1995), ex-presidente do COMIBAM (1997-2000), e foi coordenador do I e II Congresso Brasileiro de Missões.

Extraído do livro Missões e Cia (Londrina: Descoberta, 2000), de Bertil Ekström e Paulo Mendes. Usado com permissão.

PA spo do Nepal era esperada por muitos. Durante décadas, cristãos da Índia e de outras partes do mundo oraram a favor daquele país encravado no Himalaia, À mudança de atitude do governo nepalês no início da década de 1950 respondia a esse anseio, Fechado durante séculos a qualquer influência externa, o Nepal desenvolveu um hinduísmo do qual se dizia haver “mais deuses que habitantes e mais templos que residências”, Com a abertura para o mundo exterior, muitas missões se apresentaram como candidatas a iniciar trabalhos no Nepal, Todavia, diante da ameaça de uma invasão ocidental e cristã, o governo nepalés decidiu restringir a entrada das missões. Apenas uma seria permitida, A solução encontrada pelas missões foi formar uma organização missionária cooperativa, chamada de United Mission to Nepal (UMN). Em 1954, a UMN entrou oficialmente naquele país, Formada por mais de 40 organizações, a UMN desenvolveu um excelente trabalho desde então,

Queremos ponderar sobre as motivações c as vantagens da cooperação. À cooperação só será eficaz e produtiva se houver motivação suficiente e todos lucrarem com o envolvimento,

ES o da à amuuaa SERTILEKSTROM é pastor batista, Proessor de teologia e de missões Pprectapçgeia Mundial É expresidente da AMTB(1991-1995), ex-presidente SOCOMIBAM (1997-2000), e foi qe palehho Congresso ie reta ME?

raido do livro Missões e Cla Nondeina: Descoberta, 2000), de Berti -Bistrôme Paulo Mendes, Usado com Permissão,

Motivações para a cooperação Poderíamos enumerar diversos aspectos que motivam o trabalho em cooperação, desde motivações pessoais de realização de um chamado específico até os desafios globais da evangelização. Destacaremos aqui, no entanto, apenas três motivos básicos para a colaboração missionária. Um testemunho de unidade Um dos grandes problemas na história da Igreja tem sido a falta de unidade. Inúmeras divisões, geradas por conflitos pessoais entre líderes ou por divergências doutrinárias de grupos, têm marcado a trajetória sinuosa e, muitas vezes, pouco brilhante da Igreja, À diversidade de opiniões e a necessidade de expressões distintas na prática na vida cristã são naturais e condizem com à liberdade concedida pela Palavra de Deus, Contudo, a variedade e a diversi- sis dade dentro do contexto do Corpo de Cristo são asseguradas com base numa unidade e numa mutualidade entre os membros desse

Corpo. À oração sacerdotal de Jesus expressa bem essa preocupação do Mestre: Não rogo somente por estes, mas também por aqueles que vierem a crer em mim, por intermédio da sua palavra; à fim de que todos sejam um; é como és tu, ó Pai, em mim e eu em ti, também sejam eles em nós; para que o mundo creia que tu me enviaste. Eu lhes o testemunho dessa verdade, Se os que se di zem transformados por uma experiência pessoal com Cristo e possuidores do mesmo Espírito Santo não conseguem trabalhar juntos e conviver de forma pacífica, que representação fazem do Deus que querem retratar?

À unidade do Corpo de Cristo não é uma opção deslumbrante de uma comunidade utópica. Trata-se da coerência do testemunho de que sotenho transmitido a glória que me tens dado, para que sejam um, como nós o somos; eu neles, e tu em mim, a fim de que sejam aperfeiçoados na unidade, para que o mundo conheça que tu me enviaste e os amaste, como também amaste a mim (Jo 17.20-23). É interessante notar a ligação que Jesus faz entre a unidade e a credibilidade do evangelho. O mundo, percebendo que os discípulos mos todos um em Cristo. Sabemos, entretanto, que não é possível que todos trabalhem juntos ou mesmo que tenham a mesma ênfase em sua expressão de fé, Contudo, não faria mal se déssemos, com mais frequência, provas de que é possível cooperar e de que lutamos a favor do mesmo Reino. Um esforço conjunto, num trabalho cooperativo em missões, será evidência de que o povo de Deus é unido e que, apesar das divergências e das diferentes nomenclaturas, existem propósão unidos, poderá crer que Jesus é o enviado do Pai. O amor e a comunhão entre o Filho e o Pai são demonstrados, no dia a dia, pormeio do amor e da comunhão entre os seguidores de Jesus. Isso não significa, naturalmente, que sitos em comum. Mostra uma fé em Cristo que sobrepuja as diferenças históricas e doutrinárias das distintas ramificações do cristianismo. Um ministério integral nosso fracasso na questão da unidade afete a unidade da Trindade divina, mas põe em risco Decálogo da cooperação

O segundo aspecto é o da visão integral ou “holística” do evangelho. O ministério de Jesus foi

Paulo Mendes

1. Fazer tudo para a glória de Deus Quando o apóstolo Paulo diz que somos “cooperadores de Deus”, está dizendo que o trabalho é do Senhor e que somos apenas seus cooperadores. Nesse sentido, o bom desempenho de nosso trabalho deve ser motivo de exaltação do nome do Senhor.

2. Buscar o melhor Muitas vezes, os critérios de seleção não são rígidos, por isso os missionários regressam frustrados ou deixam um mau testemunho por onde passam. À urgência da tarefa não exclui o devido cuidado na seleção do melhor.

3. Erguer pontes, e não monumentos Não é dificil constatar a existência de organizações preocupadas com seus monumentos, mantendo trabalhos fechados, sem nenhuma abertura à comunhão com outras organizações. A construção de “pontes” sugere a busca de relacionamentos com outros missionários e organizações, criando-se um ambiente de fraternidade.

4. Manter constante diálogo A primeira pessoa a querer um constante diálogo com o ser humano é o próprio Deus. Em todas as atividades humanas, o diálogo é sempre um fator determinante para o bom entendimento entre as partes.

Paulo Mendes é missionário da Convenção das

Extraído do livro Missões e Cia (Londrina: permissão.

Igrejas Batistas Independentes (CIBI) em Portugal. Descoberta, 2000), de Bertil Ekstrôm e Paulo Mendes. Usado com "caracterizado pelo cuidado com o ser humano como um todo. Ele reintegrou os marginalizados da sociedade, denunciou as injustiças sociais, enfatizou o amor sacrifical entre as pessoas, curou enfermos, expulsou demônios, ressuscitou mortos e perdoou pecados. Seu evangelho tinha uma resposta para todas as áreas da vida cotidiana, além de apontar para a esperança eterna de salvação.

-Caímos com facilidade na ênfase ministenial: damos mais importância à evangeliza-

O exemplo da UMN, citado no início, mostra que isso é possível. Missões com ministérios na área evangelística e de plantação de igrejas têm colaborado com outras que atuam na área educacional e social. Enquanto à UMN consegue manter um bom relacionamento com o governo nepalês, ajudando no desenvolvimento comunitário do país, existe também liberdade para testemunhar acerca de Cristo. O resultado foi o nascimento de uma igreja autóctone, ção propriamente dita ou a aspectos sociais. À cooperação resolve o problema da ênfase unilateral, Organizações com diferentes ministérios podem se completar, transmitindo, no conjunto, um evangelho integral que atenda ao ser humano como um todo. O Pacto de Lausanne, que nos últimos anos tem crescido significativamente, chegando hoje a mais de 500 mil de evangélicos, ou 2,5% da população. Continuidade do trabalho O terceiro aspecto, que preocupa as missões em adotado pela grande maioria das igrejas evangélicas e das organizações missionárias do mundo, bascia-se na frase: “Toda a Igreja levando todo o evangelho a todo homem em todo o mundo”, Para que o evangelho completo possa alcançar o ser humano como um todo, em “todos os rincões do globo, é necessária uma cooperação que ultrapasse os limites da igreja geral, as brasileiras em particular, é a continuidade do trabalho missionário. Uma das razões para Jesus enviar os discípulos de dois em dois (Lc 10) era que um poderia apoiar o outro e dessa forma garantir que a tarefa seria cumprida. Em muitos casos, infelizmente, temos constatado a dificuldade em manter os propósitos de abertura de novos campos e de ver uma igreja local, da denominação e até do movimento evangélico nacional estabelecida. Geralmente isso se dá em razão da falta de recursos financeiros, da mudança

5. Ir sempre na direção do alvo À elaboração de um projeto é execução de um projeto pode trazer surpresas. Algumas podem ser de "isso, recomenda-se a perseverança, olhando para o alvo proposto. 6. Reformular, em vez de parar O regresso de um missionário e demter prejuízos irreparáveis. As reformulações são necessárias, mas 7. Alegrar-se e chorar juntos A parceria em missões não prevê mãos e vasta correspondência: deve incluir uma caminhada, na qual mentos de alegria e de tristeza.

bem mais fácil que sua execução. À alento, e outras, de desânimo. Por o cancelamento de um projeto ponão devem interromper o projeto. apenas longos debates, apertos de nos dispomos a compartilhar mo-

8. Contar com os recursos espirituais Os recursos espirituais precisam fazer parte de nossos projetos de parceria, como um de seus principais itens: cristãos orando pela agência missionária e pelos líderes e executivos; tendo momentos de oração juntos; missionários unindo-se com outros em reuniões de oração. 9. Manter uma boa coordenação O papel central de uma boa coordenação consiste em manter vivo o interesse pela execução do projeto, sabendo trabalhar com os problemas, até mesmo de relacionamentos entre os envolvidos. Ao mesmo tempo, uma boa coordenação procura soluções de interesse comum, Para que isso aconteça, é melhor prevenir que remediar.

10. Saber quando começar e quando terminar Quando nosso trabalho entra na fase de continuida"de com tempo indefinido, ele pode cair na rotina. O resultado disso pode ser o desestímulo, o desânimo até o fracasso do projeto. Por isso, recomenda-se: saber começar e saber terminar.

prematura do obreiro ou do grau de rejeição do povo-alvo. Um trabalho em conjunto, com uma base financeira mais sólida, uma equipe de trabalho e à união de esforços, terá maiores chances de continuidade,

Um exemplo interessante foi o trabalho rea= lizado pelo Projeto América do Sul (PAS), ini= ciado por líderes brasileiros em 1983, passando a ser a Missão Avante em 1987, À ideia em formar equipes de jovens brasileiros que, após um breve curso preparatório, seriam enviados à lugares da América do Sul nos quais não ha= via igrejas evangélicas plantadas, Fazia-se um acordo de cooperação com alguma denominação ou igreja local do país de destino, ea equipe permanceia de 3 à 12 meses evangelizando a comunidade-alvo. À continuidade do traba= lho da igreja plantada seria responsabilidade

Contudo, é comum essa duplicação, às vezes por falta de informação um do outro ou por pura concorrência de mercado. Melhor aproveitamento dos recursos À segunda vantagem é que a parceria em projetos missionários permite um melhor aproveitamento dos recursos humanos e materiais. Temos aprendido essa lição nos últimos anos com o movimento misstonário no Brasil, A concentração das pesquisas com a SEPAL, a produção de material conjunto entre as associações missionárias, encontros e consultas para discutir temas afins e a abertura para cooperação no apolo logístico e pastoral aos missionários no campo são alguns exemplos. Desse modo, são trocadas experiências, e o movimento como um todo é enriquecido, Para cumprir a tarefa da denominação local, evitando-se assim que os frutos colhidos se perdessem. Em Tambo dé Mora, na província de Chincha Baja, 200 quilômetros no sul de Lima, no Peru, há uma igreja que surgiu como resultado desse esforço de levar o evangelho a todos os povos da terra, urge otimizarmos os recursos, não desperdicando dinheiro nem o tempo dos obreiros com sobreposição de trabalho, e hoje conta com mais de cem membros. Vantagens da cooperação Ninguém irá se dispor a participar de um empreendimento se não houver algum lucro ou resultado positivo que justifique o esforço da colaboração, Nos dias de hoje, fala-se muito em “efeito multiplicador”, Qualquer que seja à área de parceria, precisa haver o efeito multiplicador. Significa que o resultado obtido é mais do que a simples soma do esforço de cada parte, Na cooperação missionária, essa sinergia é possível,

Um trabalho mais eficiente Todos queremos que o trabalho missionário seja bem feito, mas é difícil encontrar especialistas nas áreas distintas e necessárias à boa qualidade desse trabalho. À colaboração entre as missões, tanto por parte de suas bases quanto entre os missionários no campo, possibilita o aproveitamento do conhecimento e da habilidade existente no meio da liderança e do corpo missionário. O trabalho conjunto também estimula a busca pelo melhor e se torna um fator de cobrança positiva e de incentivo à reciclagem, Se cada um fizer o que sabe fazer e para o qual foi treinado, teremos um movimento missio-

A não duplicação de esforços À primeira vantagem é que a cooperação evita a duplicação de esforços, Um líder evangélico da Oceania contou-me que, numa mesmailha, havia três organizações fazendo a tradução do mesmo livro bíblico para o idioma nativo, Por sorte, alguém descobriu aquele desperdício de tempo e de recursos e conseguiu unir os três grupos para fazer um trabalho em conjunto.

nário de qualidade, Se todos fizerem de tudo, tem-se um ministério “quebra-galho” permanente, que tenta fazer o melhor mas não tem capacidade para tal, Oferecer um exemplo de comunidade alternativa Intimamente ligada À anterior, está a questão do modelo que queremos apresentar ao mundo,

É Se a credibilidade do evangelho depende da unidade da Igreja, a influência do trabalho missonário numa comunidade é diretamente proporcional ao exemplo vivido. O mundo precisa verum modelo alternativo de relação entre pessoas c organizações. Fomos criados e treinados puma sociedade individualista e competitiva, Disseram-nos que “a união faz a força”, mas pos ensinaram a viver cada um para si tratando de vencer os outros na competição desenfreada pelo material, À Igreja precisa mostrar a outra possibilidade: a de apoiar uns aos outros cbuscar à realização conjunta de uma vida melhor.

implantado, o que mostrou à população que é melhor cooperar que competir. Equilíbrio e solidez no trabalho Outra vantagem é o equilíbrio e a solidez que um trabalho conjunto pode oferecer, de organizações e pessoas de diferentes contextos se unem a favor de um projeto, a possibilidade de que haja abrangência e equilíbrio no tratamento das questões é bem maior, Tendemos a favorecer certas linhas de pensamento ou de ênfases eclesiásticas, mas no necessário ajuste à parceria e ao trabalho em equipe ocorre um processo de

Mulungu do Morro é uma cidade no intenor da Bahia, a 300 quilômetros de Feira de Santana, aproximadamente. O grande problema do município, assim como de tantos ou“tros no Nordeste, era o abastecimento de água. Num projeto cooperativo entre a igreja local, uma missão do exterior, a prefeitura da cidade e as comunidades, o problema foi resolvido. À exigência era justamente que os diferentes bairros e comunidades ao redor formassem associações locais para administrar os poços que seriam abertos. Mulungu do Morro não tem mais problema de falta de água, mesmo no tempo da seca, porque um modelo foi mostrado e

Perguntas 1. Até que ponto a unidade do Corpo de Cristo avaliação das antigas posturas. À decisão conjunta sobre como realizar o trabalho promove um desenvolvimento equilibrado e favorece um crescimento em maturidade que, por sua vez, gera solidez e seriedade no empreendimento, Veja o que Paulo diz aos crentes de Éfeso: “Seguindo a verdade em amor, cresçamos em tudo naquele que é a cabeça, Cristo, de quem todo o corpo, bem ajustado e consolidado pelo auxílio de toda junta, segundo a justa cooperação de cada parte, efetua o seu próprio aumento para à edificação de si mesmo em amor” (Ef 4.15,16). para estudo é possível na prática? Dê exemplos concretos.

2, Quala razão para a tegral do evangelho indiferença de muitos em relação ao evangelho de Cristo? Uma visão inajudaria a vencer certas barreiras existentes na sociedade atual?', 103 from cursos where slug = 'perspectivas';
-- FALTA AINDA: cap. 116 (Mordomo), "De volta para o futuro: missão empresarial
-- e missões transculturais", p. 769-776, que a Lição 12 pede. A p. 776 da
-- fotografia saiu fora de foco e estourada de claro (brilho médio 245 de 255,
-- desvio 21, contra 221/71 e 234/55 das vizinhas) e não há o que recuperar
-- dela. Subir o capítulo com um buraco no meio seria pior do que esperar a
-- refotografia.

commit;
