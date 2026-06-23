-- Curso: O Evangelho Segundo os Apóstolos (Vários autores) — slug evangelho-segundo-os-apostolos. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'evangelho-segundo-os-apostolos';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('evangelho-segundo-os-apostolos','O Evangelho Segundo os Apóstolos','Estudo a partir de O Evangelho Segundo os Apóstolos, de Vários autores. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/evangelho-segundo-os-apostolos', false, 0, 'ensino', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução$t$, 1,
$conteudo$Este livro não é uma seqüência de O Evangelho Segundo Jesus. Devia ter sido escrito antes deste, visto ser uma abordagem de um assunto que estava em discussão na época. Ele exibe a estrutura sobre a qual havia apenas alusões em seu predecessor, O Evangelho Segundo Jesus, que era uma análise do ministério evangelístico de Jesus e que contrastava a pregação de nosso Senhor, seu ensino e seu ministério individual com os métodos do evangelicalismo do século XX. Este livro, porém, trata da doutrina da salvação abordada pelos apóstolos, mostrando que o evangelho segundo Jesus é também o evangelho segundo os apóstolos. Assim, toda a mensagem do Novo Testamento contrasta totalmente com o “evangelho” vazio que muitos estão proclamando hoje.

Talvez você esteja pensando: Não, obrigado. Eu deixarei os estudos doutrinários aos teólogos profissionais. Em vez disso, dê-me um bom livro de devocionais.

Mas, por favor, continue lendo. Este não é um estudo técnico ou um tratado acadêmico. Não é um livro-texto para teólogos, é uma mensagem que tem tocado fortemente meu coração durante todos os anos de meu ministério. Longe de ser uma dissertação fria, é um olhar apaixonado para a mais essencial de todas as verdades cristãs. Se a salvação é importante para você (o que poderia ser mais importante?), você não pode dar-se ao luxo de ignorar as questões tratadas neste livro. Se você está inclinado a pensar que um livro doutrinário é a antítese de um livro de devocionais, espero que mude de opinião.

Creio que, hoje, OS cristãos encontram-se famintos por conteúdos doutrinários. Vários anos atrás, quando eu estava escrevendo O Evangelho Segundo Jesus, essa questão ocupou o primeiro lugar em meus pensamentos. Vários editores me advertiram que o livro era “doutrinário demais” para ser vendido. Todo o objetivo do livro era responder a uma controvérsia doutrinária que, por anos, vinha causando corrupção sob a superfície do evangelicalismo. Eu não podia escrever o livro sem imergir na doutrina. Quando finalmente completei o livro, tive de admitir que parecia mais um livro-texto. Foi empregada uma terminologia teológica que você pode encontrar numa faculdade bíblica ou numa sala de aula de seminário, mas que não é familiar para muitos leigos. Foi impresso em letras pequenas, tem muitas notas de rodapé e começa com uma avaliação crítica da soteriologia de alguns dispensacionalistas — não é o tipo de leitura que um leigo deseja para devoções diárias. No fim, o livro foi publicado como um estudo acadêmico, editado e comercializado pelo departamento de livros-texto da publicadora.

Naturalmente, eu esperava que o livro alcançasse um público mais amplo, mas admito que fiquei espantado quando ele se tornou um dos livros cristãos lidos mais amplamente nos anos 1980. Em anos, foi o primeiro livro “doutrinário” a tornar-se um best-seller. Ficou óbvio que O Evangelho

Segundo Jesus pareceu familiar — ou trouxe à mente algo delicado, dependendo do lado do debate em que você está.

Quase imediatamente após o livro ter sido publicado, comecei a receber cartas de leitores leigos pedindo mais material sobre o assunto. Eles queriam conselhos práticos: Como explicar o evangelho para crianças? Que panfletos apresentam o caminho da salvação completa e biblicamente? Eles queriam ajuda para compreender suas próprias experiências espirituais: Eu vim a Cristo quando era criança e não me rendi a ele como Senhor até vários anos depois. Isso invalida minha salvação? Eles queriam aconselhamento espiritual: Por anos tenho lutado com um pecado e com uma falta de certeza. Você pode me ajudar a entender a fé genuína e como posso tê-la? Eles queriam esclarecimento; O que dizer de Ló e dos coríntios que viviam em desobediência? Eles eram pessoas redimidas, não eram? Eles queriam explicações simples; Não entendo facilmente terminologias teológicas como “dispensacionalismo” e “soteriologia”. Você pode me explicar a controvérsia do senhorio numa linguagem simples?

Este livro é para essas pessoas. É uma discussão mais simples, o que é apropriado porque o evangelho em si é simples. Além disso, também argumento que as questões bíblicas no centro da controvérsia do senhorio são todas muito simples também. Não é preciso ser um teólogo talentoso para discernir o sentido de passagens difíceis como 1 Jo 2.3-4; “Sabemos que o temos conhecido por isto; se guardamos os seus mandamentos. Aquele que diz; Eu o conheço e não guarda os seus mandamentos é mentiroso, e nele não está a verdade”.

Mais uma vez estou usando notas de esclarecimento principalmente para documentar as citações que um livro como este requer. Incluí novamente uma seção sobre dispensacionalismo porque queria explicar em mais detalhes o que é isso e qual sua relação com a controvérsia do senhorio. Entretanto, este é um livro para todo cristão, não tem a intenção de ser um estudo avançado. Cada termo-chave é definido na primeira vez que o menciono. Meu objetivo é explicar os assuntos de forma que um recémchegado à fé compreenda sobre o que estou falando.

Infelizmente, a controvérsia do senhorio tornou-se, desnecessariamente, um assunto confuso por causa de argumentos complexos expressos em jargões teológicos. Tudo isso tende a intimidar as pessoas que sinceramente querem entender o assunto. Muitos cristãos leigos — e alguns líderes cristãos — têm concluído que essas questões são profundas demais para serem sondadas. Outros têm-se permitido desencaminhar por argumentos simples demais ou serem distraídos por retórica carregada de emoção, em vez de relacionarem os assuntos por si mesmos, cuidadosamente. Espero que este livro ajude a fornecer um antídoto para a confusão e a lógica deturpada que têm permeado o debate sobre o senhorio desde a metade da década passada.

Meu propósito não é responder a críticas. Tenho uma gaveta cheia de críticas literárias a respeito de O Evangelho Segundo Jesus. A maioria tem sido positiva e aprecio o encorajamento e a confirmação do trabalho. Mas também tenho lido muito cuidadosamente todas as críticas negativas (e têm sido muitas). Eu as tenho estudado com o coração aberto. Tenho pedido aos meus assistentes e ao The Master’s Seminary para avaliar cada crítica e recorrer às Escrituras para estudar, em oração, as questões bíblicas. O processo tem ajudado a aprimorar meu pensamento, e sou grato por isso. Alguns leitores têm percebido que as últimas edições do livro incluem mudanças de vocabulário que esclarecem ou refinam o que eu estava dizendo.

Em especial, devo confessar que tenho me decepcionado profundamente com a qualidade das críticas. A esmagadora maioria delas não tem nada a ver com assuntos bíblicos. Alguns críticos têm reclamado que a questão do senhorio é muito divisora, que a mensagem é dura demais ou que minha posição é muito dogmática. Outros argumentam quanto à semântica ou objetam a minha terminologia. Alguns fingem indignação, alegando que O Evangelho Segundo Jesus é um ataque pessoal injusto contra eles, seus amigos ou esta ou aquela organização. Umas poucas críticas orais têm declarado que falta equilíbrio no livro, acusando-me de preparar o caminho de volta a Roma, dizendo que estou abandonando o dispensacionalismo, rotulando-me de hipercalvinista, culpando-me como se eu fosse ar-miniano demais ou (mais gravemente) acusando-me abertamente de ensinar salvação por obras.

A todos que têm-me pedido para responder a essas acusações, tenho dito simplesmente que leiam o livro e julguem se as reclamações são justas. Creio que todas são respondidas por O Evangelho Segundo Jesus.

O problema em todas as criticas como essas é que nenhuma delas trata dos detalhes bíblicos. Como disse naquele primeiro livro, não estou realmente preocupado se as coisas que ensino confundem o mapa esquemático dispensacionalista de alguém. Finalmente, não me interessa se algo é compatível com um sistema particular de teologia. Também não tenho o propósito de promover algum esquema teológico novo. Meu único objetivo é discernir e ensinar o que as Escrituras dizem. Não faço apologia disso. Se vamos discutir assuntos doutrinários, permitamos que a Bíblia determine a questão.

Muitos cristãos desejavam condenar a “salvação por senhorio” por chamar pecadores a uma rendição completa, mas nenhum se deu ao trabalho de explicar por que o próprio Jesus disse às multidões não-salvas: “Se alguém quer vir após mim, a si mesmo se negue, tome a sua cruz e siga-me” (Mc 8.34). Muitos me chamaram de legalista por ensinar que uma vida transformada é a consequência inevitável de uma fé genuína. Entretanto, ninguém ofereceu outra explicação possível para 2 Corín-tios 5.17: “Se alguém está em Cristo, é nova criatura; as coisas antigas já passaram; eis que se fizeram novas”. Muitos estavam ávidos por discutir excelentes pontos teológicos, casos hipotéticos, ramificações lógicas, premissas racionais, diferenças semânticas e assim por diante. Quase ninguém desejava empenhar-se com os textos bíblicos pertinentes.

O evangelicalismo moderno parece pobremente equipado para lidar com questões controversas como a que se refere ao senhorio. Temos sido condicionados a ouvir apenas breves e insípidas citações. Ao considerar assuntos dessa magnitude, precisamos ouvir, raciocinar, ponderar com cuidado o assunto e chegar a uma resolução e acordo. Muitos parecem pensar que a controvérsia do Senhorio deve ser resolvida por meio de uma prova final pública, semelhante aos debates presidenciais apresentados na televisão. Tenho sido desafiado repetidamente a medir forças, em reuniões públicas, com os principais defensores do pensamento contrário ao senhorio. Tenho declinado consistentemente e quero explicar por quê.

Minha experiência com tais debates tem me convencido de que não são particularmente edificantes. Os ouvintes saem pensando que compreendem plenamente os assuntos, mas o formato típico dos debates só permite o tempo necessário para abordar o assunto com superficialidade. As questões reais não serão resolvidas em reuniões de uma ou duas horas. Na prática, raramente os verdadeiros assuntos são tratados. Em vez disso, debates públicos tendem a enfatizar o que é menos importante. Debates, no fim, oferecem aos participantes mais inteligentes apenas um fórum em que podem ganhar pontos. O pior de tudo é que os debates contribuem para a percepção da hostilidade pessoal.

Uma competição em forma de discurso não resolve as diferenças nessa controvérsia. Além disso, tal abordagem não tem fundamento bíblico. Não conheço uma só ocasião nas Escrituras em que um debate tenha sido usado para se chegar a uma compreensão apropriada e unânime de uma questão doutrinária.

Em O Evangelho Segundo Jesus, expressei o desejo de que o livro fosse um catalisador de discussões e de resoluções finais acerca dos assuntos. Desde a publicação do livro tenho-me encontrado particularmente com alguns dos mais importantes líderes cristãos da outra posição - e a minha porta permanece aberta. Não vejo nenhum desses homens como inimigos, nem considero nossa diferença de opinião como uma rixa pessoal. No âmbito de tudo em que cremos, concordamos em muito mais do que discordamos. Contudo, não há como negar que esses assuntos concernentes ao evangelho são fundamentais; e, portanto, nosso desacordo sobre eles é sério. Certamente, todos os envolvidos concordam que não podemos simplesmente agir como se alguma coisa insignificante estivesse em jogo.

Finalmente, o melhor encontro para apresentar esse tipo de discussão doutrinária é um diálogo cuidadoso, em que haja argumentação bíblica, preferivelmente de forma escrita. Na escrita, é mais fácil medir as palavras com cuidado, é mais fácil ser abrangente e evitar O tipo de animosidade sobre a qual, certamente, todos nos preocupamos. Precisamos esclarecer os assuntos, não galgar O cume emocional de nossa divergência.

Meu desejo é apresentar O caso de forma bíblica, clara, graciosa, justa e em termos que todos os cristãos possam compreender. Minha abordagem consistirá em examinar algumas das passagens principais das epístolas e de Atos dos Apóstolos, as quais revelam como os apóstolos proclamavam O evangelho e como mostravam as verdades da salvação à igreja primitiva. Há tantas revelações claras nesse tema que você pode ter a sensação de estar recebendo a mesma coisa repetidas vezes - e você está - porque é crucial ao propósito do Espírito Santo em comunicar a questão da salvação que essas verdades sejam tecidas na malha de muitas epístolas.

Penso que você concorda que O evangelho segundo os apóstolos é O mesmo evangelho que Jesus pregava. Creio que você também será convencido de que O evangelho deles difere dramaticamente da mensagem popular que hoje é tão diluída com muitas outras. E oro para que você considere este livro um encorajamento, à medida que busca colocar sua própria fé em ação.

Capítulo 1

Prólogo Uma base acerca “Salvação por Senhorio” Sem fé é

O que a fé faz Graça barata? A necessidade Pela fé somente Livres do pecado, A luta mortal

O simples ouvir Uma antecipação

O Perigo da Falsa Segurança Guardados pelo

O Problema da Quantificação

Que devo fazer

Onde se encaixam as boas obras? Comparando os três

Que evangelho devemos pregar hoje? O evangelicalismo americano e a teologia do não-senhorio$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O autor diz que a salvação não pode haver algo mais importante para você; quando você examina a sua vida, o que ela revela que você de fato trata como mais urgente do que saber se a sua fé é verdadeira?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Esta introdução insiste que "uma vida transformada é a consequência inevitável de uma fé genuína" (2 Co 5.17); olhando para o que mudou em você desde que diz ter crido, que evidências dessa nova criatura você consegue apontar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante das palavras de Jesus de que segui-lo é negar-se a si mesmo e tomar a cruz, em que áreas concretas você percebe que ainda quer um Salvador que livre do inferno sem um Senhor que governe o seu dia a dia?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prólogo$t$, 2,
$conteudo$Encontro no evangelho satisfação para minha mente, satisfação que não encontro em nenhum outro lugar... Não há um problema em minha vida que o evangelho não aborde e não ofereça uma resposta. Encontro descanso intelectual e resposta para todas as minhas perguntas.

E, graças a Deus, meu coração e meus desejos também são satisfeitos. Encontro completa satisfação em Cristo. Não há um desejo, nada há que meu coração almeje que Ele não possa mais do que satisfazer. Toda a inquietação dos desejos é subjugada por Cristo, quando sopra a sua paz em meus aborrecimentos, problemas e inquietações...

Então, recebo descanso apesar de minhas circunstâncias. O evangelho me capacita a dizer, juntamente com o apóstolo Paulo: “Estou bem certo de que nem a morte, nem a vida, nem os anjos, nem os principados, nem as coisas do presente, nem do porvir, nem os poderes, nem a altura, nem a profundidade, nem qualquer outra criatura poderá separar-nos do amor de Deus, que está em Cristo Jesus, nosso Senhor” (Rm 8.38-39). Esse é o descanso perfeito, que não depende de circunstâncias. Isso é estar calmo em meio à tempestade.

D. MARTYN LLOYD-JONES1 1

Enquanto escrevia este livro, toda a minha vida mudou de repente. Numa tarde, enquanto esperava que meu filho se encontrasse comigo no campo de golfe, recebi um telefonema me informando que minha esposa, Patricia, e nossa filha mais nova, Melinda, haviam sofrido um acidente de carro muito sério. Patricia havia ficado gravemente ferida e estava sendo levada de helicóptero para um hospital que ficava a, aproximadamente, uma hora do lugar onde eu estava. Não me foi dado nenhum outro detalhe. Deixando inadvertidamen-te meus tacos de golfe no campo de treinos, entrei de imediato em meu carro e me dirigi ao hospital.

Aquele percurso de uma hora que fiz até ao hospital ficará profundamente gravado em minha memória, para sempre. Mil pensamentos inundaram minha mente. Eu compreendia, é claro, que poderia nunca mais ver Patricia viva. Pensava na lacuna que existiria em minha vida sem ela. Refletia sobre a parte essencial que ela havia tido em minha vida e ministério ao longo dos anos. Eu me perguntava como viveria sem ela. Lembrei a ocasião em que nos encontramos pela primeira vez, como passamos a amar um ao outro e centenas de outras pequenas coisas sobre nossa vida juntos. Daria qualquer coisa para mantê-la comigo, mas percebia que essa escolha não cabia a mim.

Uma paz sobrenatural inundou minha alma. Minha dor, tristeza, incerteza e meus medos foram todos cobertos por aquela paz tranquila. Eu sabia que Patricia e eu estávamos nas mãos de nosso Senhor, e, sob tais circunstâncias, aquele era o único lugar onde eu poderia imaginar qualquer senso de segurança. Eu não conhecia os desígnios de Deus, não conseguia ver seus propósitos, não conseguia entender o que havia acontecido ou por que, mas podia descansar em saber que seu plano destinado a nós era, enfim, para o nosso bem e para sua glória.

Quando cheguei à emergência do hospital, descobri que Melinda tinha ficado muito machucada e cortada, mas não estava seriamente ferida. Estava fortemente abalada, mas não corria qualquer risco.

Um médico veio para dar-me explicações sobre os ferimentos de Patricia. O pescoço dela estava quebrado, duas vértebras haviam sido severamente esmagadas. O dano aconteceu acima dos nervos cruciais na medula espinhal que controlam a respiração. Na maioria dos casos como o dela, a vítima morre imediatamente. Entretanto, nosso Senhor poupou providencialmente sua vida.

Ela também havia resistido a uma pancada severa na cabeça. O impacto do teto sendo esmagado sobre a cabeça dela, enquanto o carro sacudia, poderia tê-la matado. Eles estavam lhe dando doses fortes de uma nova droga destinada a conter o inchaço no cérebro. O cirurgião preocupava-se com a possibilidade de o ferimento na cabeça ainda se mostrar fatal. Havia dado mais de quarenta pontos para fechar o ferimento no couro cabeludo dela. Sua mandíbula e vários ossos em seu rosto estavam quebrados. Por muitos dias, ela não sairia do estado de risco.

O pessoal da emergência iria removê-la para uma cirurgia, pela qual os médicos prenderiam um arco de aço em sua cabeça, por meio de quatro pinos perfurados diretamente no crânio. O dispositivo suspenderia a cabeça dela e estabilizaria seu pescoço, enquanto as vértebras sarassem. Ela usaria o arco por vários meses e, após isso, se submeteria a um exaustivo programa de reabilitação física.

Nos dias imediatamente posteriores, os médicos descobriram outros ferimentos. A clavícula direita estava quebrada. Pior ainda, o braço direito de Patrícia estava paralisado. Ela conseguia mexer os dedos e pegar coisas, mas seu braço pendia flácido, e ela não tinha sensibilidade nele. Sua mão esquerda estava quebrada e precisava de uma atadura imobilizadora. Isso significava que Patrícia não podia usar nenhuma das mãos.

Tudo isso criou uma maravilhosa oportunidade de servir à minha esposa. Durante toda a nossa vida juntos, ela cuidara de minhas necessidades, servira à família e nos atendera de inúmeras maneiras. Agora era a minha vez; e valorizei a oportunidade. Meu amor por ela e minha apreciação por tudo que ela fazia cresceram grandemente.

Enquanto escrevia este texto, Patricia ainda estava usando o arco. É um aparelho notável, um enorme jugo de aço que suspende a cabeça dela, ao apoiar o seu peso em quatro hastes de aço que saem da parte de cima de um colete. Mantém a cabeça e o pescoço dela imóveis.

Alegro-me em dizer que algum tempo depois ela ficou fora de perigo. Ela recuperou a mobilidade do braço direito, teve uma recuperação completa.

Toda esta experiência foi o trauma mais difícil de nossa vida juntos. Ainda assim, em meio a tudo isso, Patricia e eu aprendemos novamente — de uma maneira muito prática — que a fé age. Nossa fé em Cristo — a mesma com a qual, desde o começo, confiamos nele como Senhor — tem permanecido forte e nos capacitado a confiar nele durante esta provação.

Entendemos, como nunca antes, a doçura do convite de nosso Senhor em Mateus 11.28-30: “Vinde a mim, todos os que estais cansados e sobrecarregados, e eu vos aliviarei. Tomai sobre vós o meu jugo e aprendei de mim, porque sou manso e humilde de coração; e achareis descanso para a vossa alma. Porque o meu jugo é suave, e o meu fardo é leve”. Descobrimos repetidas vezes que, embora o jugo nem sempre pareça suave, e o fardo nem sempre pareça leve, viver sob a preciosa realidade do senhorio de Cristo oferece a única vida verdadeiramente tranquila, não importando o que aconteça.

Isso é, afinal de contas, o âmago do evangelho segundo Jesus. Os apóstolos sabiam essa verdade tanto por causa do ensino do Senhor como por sua própria experiência. Era o âmago da mensagem deles para um mundo nãosalvo. Eles pregavam que a fé é operante. Ela não falha, nem se mantém passiva, mas age imediatamente na vida do crente. Age por nós, em nós e por meio de nós. A fé é sustentada e nos sustenta em meio às provações da vida. Ela nos motiva em face das dificuldades da vida e nos conduz durante as tragédias da vida. Visto que a fé é operante, ela nos capacita a desfrutar de um descanso espiritual sobrenatural.

A nossa experiência na provação de Patricia me deu um novo vigor para escrever este livro. Sou lembrado constantemente de que minha confiança no senhorio de Jesus Cristo é a base e o suporte da minha vida. A imensa provisão de sua graça salvadora nos capacita a suportar.

O senhorio de Cristo não é um tema doutrinário abstrato, frio e antiquado. O evangelho não é uma matéria acadêmica. A fé não é uma busca teórica. A graça de Deus não é uma realidade conjectural. O modo como entendemos as verdades do evangelho determinará como vivemos. Todos esses assuntos são dinâmicos, intensamente práticos e de suprema relevância em nossa vida diária. Por favor, tenha isso em mente enquanto estuda estas páginas.

Capítulo 2

D. Lloyd-Jones, Martyn. The heart of the gospel. Wheaton, HI Crossway, 1991. p. 165-166.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$No relato do acidente da esposa do autor, uma paz sobrenatural inundou a alma dele no momento mais incerto; quando a sua vida desmorona, o que essa hora revela sobre onde a sua confiança realmente repousa?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor afirma que viver sob o senhorio de Cristo, mesmo quando o jugo não parece suave, oferece a única vida verdadeiramente tranquila; em que provação recente você descobriu se a sua fé age ou apenas permanece passiva?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele diz que a fé operante o capacitou a confiar no mesmo Senhor a quem se entregou desde o início; ao olhar para a sua caminhada, o Cristo em quem você confia hoje é o mesmo a quem você se rendeu como Senhor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$“salvação por Senhorio”$t$, 3,
$conteudo$Amados, quando empregava toda a diligência em escrever-vos acerca da nossa comum salvação, foi que me senti obrigado a corresponder-me convosco, exortando-vos a batalhardes, diligentemente, pela fé que uma vez por todas foi entregue aos santos.

Judas 3

Por que você quer escrever outro livro a respeito de ‘salvação por senhorio’?” - um amigo me perguntou. “Esse assunto já foi tratado demais, não?”

Admito que uma parte de mim teve esse mesmo sentimento. Originalmente, eu não tinha a intenção de escrever uma sequência de O Evangelho Segundo Jesus. Havia anos que ele vinha sendo preparado e, quando finalmente o terminei, fiquei ansioso por iniciar uma coisa diferente. Embora eu sentisse que muito mais poderia ser dito, estava satisfeito com o fato de o livro abranger adequadamente todo o tema. Eu não estava tentando me colocar no centro de um debate que já estava acontecendo. Ainda mais, não queria que a controvérsia da salvação por senhorio se tornasse o ponto principal de meu ministério.

ISSO foi há vários anos. Hoje sinto um pouco do que Judas deve ter sentido quando escreveu as palavras citadas acima. Uma motivação urgente, no mais profundo de minha alma, me constrange a dizer mais.

Essa questão é realmente crucial?

O maior motivo de minha preocupação está relacionado a algumas concepções populares erradas que obscurecem toda a controvérsia. “A salvação por senhorio” se tornou O tópico teológico mais discutido e menos entendido na cristandade evangélica. Quase todos parecem saber do debate; poucos compreendem verdadeiramente as questões. É fácil encontrar opiniões fortes em ambos OS lados, mas encontrar pessoas com uma compreensão genuína é outro caso. Muitos supõem que toda a questão é um conflito superficial e que a igreja estaria melhor se todos esquecessem isso. Um líder cristão famoso me disse que evitava propositada-mente ler livros sobre O assunto; ele não queria ser forçado a tomar partido. Outro líder cristão me disse que O assunto causa divisão desnecessária.

Contudo, este assunto não é uma trivialidade teológica. A forma como proclamamos O evangelho tem complicações eternas para OS não-cristãos e define O que somos como cristãos. A questão do senhorio também não é um problema teórico ou hipotético. Suscita várias questões fundamentais que repercutem no nível mais prático do viver cristão.

Como devemos proclamar O evangelho? Apresentamos Jesus aos descrentes como Senhor ou apenas como Salvador? Quais são as verdades essenciais da mensagem do evangelho? O que significa ser salvo? Como uma pessoa sabe que sua fé é real? Podemos ter certeza absoluta da salvação? Que tipo de transformação é realizada no novo nascimento? Como explicar O pecado na vida cristã? Até que ponto um cristão pode pecar? Qual a relação entre fé e desobediência? Cada área do viver cristão é afetada por uma ou mais dessas questões.

É claro que isso não significa que a discussão sobre o senhorio é puramente pragmática. Algumas doutrinas cruciais emergem no debate: dispensacionalismo, eleição, a ordo salutis (“ordem da salvação”), a relação entre a santificação e a justificação, a segurança eterna, a perseverança dos santos e assim por diante.

Não se sinta desconcertado. Talvez você reconheça imediatamente alguns desses termos ou talvez não consiga defini-los todos, mas, se você é um cristão, cada um deles é importante para você. É preciso ter uma compreensão básica do que eles significam e como se relacionam com as Escrituras e com a mensagem do evangelho. Doutrina não é propriedade exclusiva de professores de seminários. Todos os cristãos verdadeiros devem preocupar-se em compreender a sã doutrina. Esta é a disciplina de discernir e de sistematizar o que Deus nos diz em sua Palavra, de modo que tenhamos vidas que o glorificam. A doutrina forma o sistema de crenças que controla e compele o comportamento. O que poderia ser mais prático — ou mais importante?

Mantenhamos essa perspectiva enquanto abordamos este assunto controverso. Discordamos em assuntos doutrinários? Consideremos juntos o que a Palavra de Deus diz. Sistemas teológicos, polêmicas, retórica elegante ou linguagem bombástica e desafios podem persuadir algumas pessoas, mas não aqueles que buscam conhecer a mente de Deus. A verdade de Deus é revelada em sua Palavra. Portanto, é a ela que temos de examinar para resolver este ou qualquer outro assunto doutrinário.

O que é a "Salvação por Senhorio"?

O chamado do evangelho à fé pressupõe que pecadores devem se arrepender de seus pecados e render-se à autoridade de Cristo. Isso é, em uma frase, o que a “salvação por senhorio” ensina.

Não gosto do termo salvação por senhorio. Rejeito a conotação pretendida por aqueles que cunharam a expressão. Ela insinua que um coração submisso é alheio ou adicional à fé salvífica. Embora eu tenha usado o termo relutantemente para descrever meu ponto de vista, isso é uma concessão ao uso popular. Render-se ao senhorio de Jesus não é um suplemento aos termos bíblicos da salvação. Em toda a Escritura, o chamado à submissão está no âmago do convite do evangelho.

Aqueles que criticam a salvação por senhorio gostam de lançar a acusação de que estamos ensinando um sistema de justiça baseado em obras. Nada poderia estar mais longe da verdade. Embora eu tenha me empenhado por deixar isso bastante claro em O Evangelho Segundo Jesus, alguns críticos continuam a fazer tal alegação. Outros têm imaginado que estou defendendo uma doutrina de salvação nova ou modificada, uma doutrina que desafia o ensino dos reformadores ou redefine radicalmente a fé em Cristo. É claro que meu propósito é justamente o oposto.

Portanto, deixe-me tentar explicar, com maior clareza possível, os pontos cruciais da minha posição. Essas declarações de fé são fundamentais para todo ensino evangélico:

•    A morte de Cristo na cruz pagou toda a penalidade por nossos pecados e comprou a salvação eterna. Seu sacrifício expiatório permite que Deus justifique pecadores gratuitamente, sem comprometer a perfeição da justiça divina (Rm 3.24-26). Sua ressurreição dentre os mortos declara sua vitória sobre o pecado e sobre a morte (1 Co 15.54-57).

•    A salvação é pela graça, por meio da fé somente no Senhor Jesus Cristo — nem mais, nem menos (Ef 2.8-9).

•    Os pecadores não podem obter a salvação ou o favor de Deus em troca de obras (Rm 8.8).

•    Deus não exige dos que são salvos obras preparatórias ou um autoaperfeiçoamento como condição prévia (Rm 10.13; 1 Tm 1.15).

•    A vida eterna é um dom de Deus (Rm 6.23).

•    Os crentes são salvos e plenamente justificados antes de sua fé produzir uma única obra de justiça (Ef 2.1o).

•    Os cristãos estão sujeitos a pecar e pecam (1 Jo 1.8, 10). Até os cristãos mais fortes travam, na carne, uma luta constante e intensa contra o pecado (Rm 7.15-24). Crentes genuínos cometem, às vezes, pecados abomináveis, como o fez Davi (2 Samuel 11).

Juntamente com essas verdades, creio que as Escrituras ensinam estas:

•    O evangelho chama os pecadores à fé em unidade com o arrependimento (At 2.38; 17.30; 20.21; 2 Pe 3.9), o qual consiste em abandonar o pecado (At 3.19; Lc 24.47). O arrependimento não é uma obra, e sim uma graça concedida por Deus (At 11.18; 2 Tm 2.25). É uma mudança de coração, mas o arrependimento genuíno também produz uma mudança de comportamento (Lc 3.8; At 26.18-20).

•    A salvação é, completamente, uma obra de Deus. Aqueles que crêem são salvos absolutamente sem qualquer esforço de sua própria parte (Tt 3.5). Até mesmo a fé é um dom de Deus, não uma obra do homem (Ef 2.1- 5, 8). Portanto, a fé genuína, não pode ser defecti-va ou efêmera, mas permanece para sempre (Fp 1.6, cf. Hb 11).

•    O objeto da fé é o próprio Cristo, não só um credo ou uma promessa (Jo 3.16). A fé envolve um compromisso pessoal com Cristo (2 Co 5.15). Em outras palavras, todos os crentes verdadeiros seguem a Jesus (Jo 10.27-28).

•    A fé genuína produz inevitavelmente uma vida transformada (2 Co 5.17). A salvação inclui uma transformação da pessoa interior (Gl 2.20). A natureza do cristão é diferente, é nova (Rm 6.6). O padrão contínuo de pecado e inimizade contra Deus não prossegue quando uma pessoa é nascida de novo (1 Jo 3.9-10).

•    O “dom de Deus", a vida eterna (Rm 6.23), inclui tudo que diz respeito à vida e à piedade (2 Pe 1.3; Rm 8.32), e não somente uma passagem para o céu.

•    Jesus é Senhor de todos, e a fé que Ele exige envolve rendição incondicional (Rm 6.17-18; 10.9-10). Ele não concede a vida eterna àqueles cujo coração permanece contra Ele (Tg 4.6).

•    Aqueles que crêem verdadeiramente amam a Cristo (1 Pe 1.8-9; Rm 8.28-30; 1 Co 16.22). Portanto, eles desejarão obedecer-lhe (Jo 14.15, 23).

•    O comportamento é uma importante prova da fé. A obediência evidencia que a fé de alguém é genuína (1 Jo 2.3). Por outro lado, a pessoa que permanece relutando em obedecer a Cristo não evidencia fé verdadeira (1 Jo 2.4).

•    Crentes verdadeiros podem tropeçar e cair, mas perseverarão na fé (1 Co 1.8). Aqueles que, mais tarde, se afastam completamente do Senhor mostram que nunca foram verdadeiramente nascidos de novo (1 Jo 2.19).

Esta é a minha posição quanto à “salvação por senhorio”. Aqueles que supõem que tenho uma lista mais profunda do que essa não compreendem o que estou dizendo.

Radical ou ortodoxo?

A maioria dos cristãos reconhece que os pontos que alistei não são idéias novas ou radicais. Através dos séculos, esses pontos têm predominado nos cristãos que crêem na Bíblia e mantêm que esses são os princípios básicos da ortodoxia. Eles são precei-tos-padrões de doutrina afirmados, por exemplo, por todos os grandes credos reformados e calvinistas. Embora nossos irmãos wesleyanos talvez discordem quanto a alguns poucos detalhes, a maioria deles afirmaria rapidamente que o senhorio de Cristo está no âmago da mensagem do evangelho.1 Nenhum dos maiores movimentos ortodoxos na história do cristianismo ensinou que os pecadores podem rejeitar o senhorio de Cristo e tê-lo como Salvador.

A verdade é que o evangelho que prega não haver senhorio é um desenvolvimento razoavelmente recente. Embora a maioria dos defensores desse evangelho escreva e fale como se o seu ensino representasse a tendência histórica do cristianismo evangélico, ele não representa isso. Com exceção de um círculo de pastores, autores e palestrantes norte-americanos, praticamente nenhum líder de igreja do mundo defende a doutrina do nãosenhorio como ortodoxa. Até pouco tempo, na Europa oriental e na antiga União Soviética, por exemplo, ser um cristão poderia, literalmente, custar tudo a uma pessoa. Lá a noção da fé sem compromisso era inimaginável. Na Inglaterra e no restante da Europa, líderes cristãos que tenho conhecido condenam o ensino do não-senhorio como uma aberração americana. O mesmo é verdade em outras partes do mundo com as quais sou familiarizado.

Isso não significa que o ensino do não-senhorio não apresenta riscos fora dos Estados Unidos. Nas últimas três ou quatro décadas, panfletos evangélicos, livros sobre como testemunhar, programas de rádio e televisão e outros meios de comunicação têm levado a mensagem do não-senhorio até às partes mais remotas da terra. O assim chamado evangelho da fé simples — sem arrependimento, sem rendição, sem compromisso, sem vida transformada — tem exercido uma influência horrorosa no vocabulário do evangelismo. Visto que a terminologia do não-senhorio (“aceite a Jesus como Salvador” agora, “faça-o Senhor” mais tarde) se tornou familiar e confortável, o pensamento de muitos cristãos sobre o evangelho é vago. Quando 1 muitos dos fornecedores da salvação sem senhorio acusam de heresia aqueles que se opõem ao seu ensino, devemos admirar que cristãos sinceros fiquem genuinamente confusos? Que sistema representa a ortodoxia verdadeira?

O que ensina o evangelho sem senhorio?

Alistei dezesseis crenças da salvação por senhorio. As primeiras sete são princípios que os maiores defensores do evangelho sem senhorio também afirmariam:

•    A morte de Cristo comprou a salvação eterna.

•    Os salvos são justificados pela fé somente em Cristo.

•    Os pecadores não podem receber o favor divino como recompensa por obras.

•    Deus não exige obras preparatórias ou uma mudança anterior à salvação.

•    A vida eterna é um dom.

•    Os crentes são salvos antes de a fé produzir qualquer obra de justiça.

•    Às vezes, os cristãos pecam horrivelmente.

Todos cremos nisso. Nos nove pontos restantes, aqueles que aderem à posição do não-senhorio diferem dramaticamente dos que crêem na salvação por senhorio. Em vez disso, eles ensinam:

•    O arrependimento é uma mudança de mente no tocante a Cristo (SGS 96, 99).2 No contexto do convite do evangelho, arrependimento é apenas um sinônimo de fé (SGS 97-99). Não é exigido um abandono do pecado para que aconteça a salvação (SGS 99).

•    Toda a salvação, incluindo a fé, é um dom de Deus (SGS 96). Entretanto, a fé pode não permanecer. Um verdadeiro cristão pode parar de crer completamente (SGS 141).

•    A fé salvífica é simplesmente estar convicto ou acreditar na verdade do evangelho (SGS 156). É a confiança de que Cristo pode remover a culpa e dar vida eterna, não um compromisso pessoal com Ele (SGS 119).

•    Algum fruto espiritual é inevitável na experiência de cada cristão. O fruto, contudo, pode não ser visível aos outros (SGS 45). Os cristãos podem até cair num estado de permanente de esterilidade espiritual (SGS 53-54).

•    Apenas os aspectos judiciais da salvação — tais como justificação, adoção, justiça imputada e santificação posicionai — são garantidos aos crentes nesta vida (SGS 150-152). Santificação prática e crescimento na graça exigem um ato de dedicação posterior à conversão.3

•    A submissão à suprema autoridade de Cristo como Senhor não é pertinente à transação salvífica (SGS 71-76). Nem a dedicação, nem a disposição de ser dedicado a Cristo é uma questão envolvida na salvação (SGS 74). As novas de que Cristo morreu por nossos pecados e ressuscitou dentre os mortos é o evangelho completo. Não devemos crer em nada mais do que isso para sermos salvos (SGS 40-41).

•    Os cristãos podem cair num estado de carnalidade vitalícia. Toda uma categoria de “cristãos carnais" — pessoas nascidas de novo que vivem continuamente como os não-salvos — existe na igreja (SGS 31, 59-66).

•    Desobediência e pecado prolongado não são motivo para duvidar da realidade da fé de alguém (SGS 48).

•    Um crente pode negar a Cristo terminantemente e chegar ao ponto de não crer. Deus garantiu que não repudiará aqueles que abandonam a fé deste modo (SGS 141). Aqueles que creram uma vez estão seguros para sempre, mesmo que se desviem (SGS 143).

Alguns dos defensores mais radicais da doutrina não-senhorio não param por aí. Eles ainda estipulam:

•    O arrependimento não é essencial. Em nenhum sentido, o arrependimento está relacionado à fé salvífica (AF 144-146).4

•    A fé é um ato humano, não um dom de Deus (AF 219). Ela ocorre num momento decisivo, mas não continua necessariamente (AF xiv, 107). A verdadeira fé pode ser subvertida, derrotada, pode desfalecer ou até tornarse descrença (AF 111).

•    “Crer" para a salvação é crer nos fatos do evangelho (AF 37-39). “Crer em Jesus" significa crer nos “fatos salvíficos" sobre Ele (AF 39). E crer nesses fatos significa tomar posse do dom da vida eterna (AF 40). Aqueles que adicionam qualquer sugestão de compromisso têmse afastado da idéia do Novo Testamento sobre a salvação (AF 27).

•    Os frutos espirituais não são garantidos na vida cristã (AF 73-75, 119). Alguns cristãos passam a vida no solo improdutivo da derrota, confusão e todo tipo de mal (AF 119-125).

•    O céu é garantido aos crentes (AF 112), mas não a vitória cristã (AF 118-119). Poderíamos até dizer que “os salvos" ainda precisam de salvação (AF 195-199). Cristo oferece uma série de experiências de livramento pós-conversão, a fim de suprir o que falta aos cristãos (AF 196). Mas todas essas outras “salvações" exigem o acréscimo de obras humanas, tais como obediência, submissão e confissão de Jesus como Senhor (AF 74, 119, 124-125, 196). Assim, Deus depende, em certo grau, do esforço humano para concluir o livramento do pecado nesta vida (AF 220).

•    A submissão não é, em nenhum sentido, uma condição para a vida eterna (AF 172). “Invocar o Senhor" significa fazer uma petição a Ele, não submeter-se a Ele (AF 193-195).

•    Nada garante que um verdadeiro cristão amará a Deus (AF 130131). A salvação nem mesmo posiciona, necessariamente, O pecador num relacionamento correto de comunhão harmoniosa com Deus (AF 145-160).

•    Se as pessoas têm certeza de que crêem, sua fé deve ser genuína (AF 31). Todos que, pela fé, afirmam ser Cristo o Salvador — mesmo aqueles envolvidos em pecado sério ou prolongado — devem ser assegurados de que pertencem a Deus, aconteça o que acontecer (AF 32, 93-95). É perigoso e destrutivo questionar a salvação de cristãos professos (AF 18-19, 91-99). Os escritores do Novo Testamento nunca questionaram a realidade da fé de seus leitores (AF 98).

•    É possível experimentar um momento de fé que garante o céu por toda a eternidade (AF 107), depois desviar-se de forma permanente e ter uma vida inteiramente desprovida de qualquer fruto espiritual (AF 118-119). Crentes genuínos podem até parar de mencionar o nome de Cristo ou de confessar o cristianismo (AF 111).

O Apêndice 1 é um quadro que mostra, lado a lado, as maiores diferenças e semelhanças dos vários pontos de vista.

O que realmente está no centro do debate acerca do senhorio?

Deve ser óbvio que essas são diferenças doutrinárias reais. A controvérsia do senhorio não é uma divergência semântica. Os que participam desse debate têm perspectivas amplamente diferentes.

No entanto, esses assuntos têm sido freqüentemente obscu-recidos por distrações semânticas, por interpretações distorcidas do ensino sobre o senhorio, pela lógica mutilada e pela retórica carregada de emoção. Com freqüência, é mais fácil interpretar erroneamente um ponto do que apresentar uma resposta sobre ele.

E, infelizmente, esse é O curso de ação que muitos têm tomado. Tudo que isso tem feito é confundir as verdadeiras questões.

Por favor, permita-me tratar de alguns dos mais desagradáveis enganos que têm impedido a compreensão e resolução do assunto do senhorio.

A controvérsia do senhorio não é uma disputa a respeito de a salvação ser pela fé somente ou ser pela fé mais as obras.

Nenhum cristão verdadeiro insinuaria que obras precisam ser acrescentadas à fé para assegurar a salvação. Ninguém que interpreta apropriadamente as Escrituras faria a proposição de que esforço humano ou obras carnais podem ser meritórios — dignos de honra ou recompensa da parte de Deus.5

A controvérsia do senhorio é uma divergência quanto à natureza da fé verdadeira. Aqueles que querem eliminar O senhorio de Cristo do evangelho vêem a fé como uma simples confiança num conjunto de verdades sobre Cristo. A fé, como eles a descrevem, é meramente uma apropriação pessoal da promessa da vida eterna. A Escritura defende a fé como mais do que isso — é uma confiança sincera em Cristo, de modo pessoal (cf. Gl 2.16; Fp 3.9). Não é meramente fé a respeito dEle, e sim fé nEle. Perceba a diferença: se eu digo que acredito em alguma promessa que você fez, estou dizendo muito menos do que se dissesse que confio em você. Acreditar numa pessoa envolve necessariamente algum grau de compromisso. Confiar em Cristo significa colocar-se sob sua custódia tanto para a vida quanto para a morte. Significa que confiamos em seu conselho, em sua bondade e nos entregamos por todo O tempo e por toda a eternidade à sua tutela. A fé verdadeira, salvífica, é tudo que há em mim (mente, emoções e vontade) abraçando tudo que Ele é (Salvador, Advogado, Sustentador, Conselheiro e Senhor Deus).

Aqueles que possuem essa fé amam a Cristo (Rm 8.28; 1 Co 16.22; 1 JO 4.19). Portanto, eles desejarão fazer o que Ele diz. Como alguém que crê verdadeiramente em Cristo poderia continuar a desafiar sua autoridade e buscar o que Ele odeia? Nesse sentido, a questão crucial da salvação por senhorio não é meramente autoridade e submissão, e sim as afeições do coração. Jesus como Senhor é muito mais do que uma figura de autoridade. Ele também é nosso mais elevado tesouro e mais precioso companheiro. Nós lhe obedecemos com deleite absoluto.

Então, o evangelho demanda rendição não só por causa da autoridade, mas também porque a rendição é a maior alegria do crente. Tal rendição não é um suplemento externo para a fé; é a essência exata da atitude de crer.

A salvação por senhorio não ensina que verdadeiros cristãos são perfeitos ou impecáveis.

Um compromisso sincero com Cristo não significa que nunca desobedeceremos ou que temos uma vida perfeita. Os vestígios de nossa carne pecaminosa tornam inevitável que façamos freqüentemente o que não desejamos fazer (Rm 7.15). Mas o compromisso com Cristo significa que a obediência, em vez da desobediência, será o nosso traço característico. Deus lidará com o pecado em nossa vida, e responderemos à sua amorosa punição tornando-nos mais santos (Hb 12.5-11). Esforcei-me para deixar isso claro em O Evangelho Segundo Jesus. Por exemplo, escrevi: “Os que têm uma fé genuína irão falhar — e, em alguns casos, freqüentemente — mas o crente verdadeiro terá como padrão de vida a confissão do pecado e irá ao Pai buscando o perdão (1 Jo 1.9)” (p. 256).

No entanto, umas poucas críticas têm procurado retratar a sal- vação por senhorio como uma forma de perfeccionismo levemente disfarçada. Um querido irmão — uma personalidade de rádio cristã — escreveu-me sugerindo que comentários classificadores no livro, como aquele que acabei de citar, são, na verdade, inconsistentes com minha posição geral. Ele preferia admitir que esses comentários eram “repúdios” adicionados por um editor que tentavam “diminuir” meu livro. Evidentemente, ele supôs que minha verdadeira intenção era ensinar a perfeição como o teste da verdadeira salvação, mas se enganou completamente.

É claro que os cristãos pecam. Eles desobedecem, falham. Todos ficamos aquém da perfeição nesta vida (Fp 3.12-16). “Todos tropeçamos em muitas coisas” (Tg 3.2). Até os cristãos mais maduros e piedosos vêem “como em espelho, obscuramente” (1 Co 13.12). Nossa mente precisa de renovação constante (Rm 12.2). Entretanto, isso não invalida a verdade de que a salvação, em certo sentido, nos torna justos na prática. A epístola que descreve o ódio dos cristãos pelo pecado e a batalha deles contra o pecado (Rm 7.8-24) diz, antes de falar sobre essa batalha, que os crentes são libertados do pecado e servos da justiça (6.18). O mesmo apóstolo que escreveu: “Se dissermos que não temos pecado nenhum, a nós mesmos nos enganamos” (1 Jo 1.8) escreveu depois: “Todo aquele que permanece nele não vive pecando” (3.6). Em um lugar, ele disse: “Se dissermos que não temos cometido pecado, fazemo-lo mentiroso, e a sua palavra não está em nós” (1.10) e, em outro: “Todo aquele que é nascido de Deus não vive na prática de pecado; pois o que permanece nele é a divina semente” (3.9).

Há um paradoxo verdadeiro — não uma inconsistência — em todas essas verdades. Todos os cristãos pecam (1 Jo 1.8), mas todos os cristãos também obedecem: “Sabemos que o temos conhecido por isto: se guardamos os seus mandamentos” (1 Jo 2.3). O pecado e a carnalidade ainda estão presentes em todos os crentes (Rm 7.21), mas não podem ser a marca do caráter deles (Rm 6.22).

A Escritura confirma com clareza, repetidas vezes, o ponto de vista do senhorio neste assunto; “Amado, não imites O que é mau, senão o que é bom. Aquele que pratica o bem procede de Deus; aquele que pratica o mal jamais viu a Deus” (3 Jo 11). Isso fala de procedimento, e não de perfeição. Esse versículo faz do comportamento uma prova da realidade da fé.

O papel do pecador na salvação não é o principal assunto na controvérsia do senhorio.

O âmago do debate trata de quanto Deus faz na redenção dos eleitos.

O que acontece na regeneração? O pecador que crê é realmente nascido de novo (Jo 3.3, 7; 1 Pe 1.3, 23)? O nosso velho “eu” está realmente morto, “crucificado... para que... não sirvamos o pecado como escravos” (Rm 6.6)? Os crentes realmente são “co-participan-tes da natureza divina” (2 Pe 1.4)? É verdade que, “se alguém está em Cristo, é nova criatura; as coisas antigas já passaram; eis que se fizeram novas” (2 Co 5.17)? Podemos realmente dizer; “Uma vez libertados do pecado... [fomos] feitos servos da justiça” (Rm 6.18)?

A salvação por senhorio diz que sim.

Afinal de contas, este é o desígnio da redenção; “Aos que de antemão conheceu, também os predestinou para serem conformes à imagem de seu Filho” (Rm 8.29). Essa obra de Deus de nos conformar — a santificação — começa nesta vida? Mais uma vez, a salvação por senhorio diz que sim.

A Escritura concorda; “E todos nós, com o rosto desvendado, contemplando, como por espelho, a glória do Senhor, somos transformados, de glória em glória, na sua própria imagem” (2 Co 3.18). Embora “ainda não se manifestou o que haveremos de ser”, é certo que, “quando ele se manifestar, seremos semelhantes a ele... E a si mesmo se purifica todo o que nele tem esta esperança, assim como ele é puro” (1 Jo 3.2-3).

Ainda há mais; “Aos que predestinou, a esses também chamou; e aos que chamou, a esses também justificou; e aos que justificou, a esses também glorificou” (Rm 8.30). Perceba que a parte desempenhada por Deus na salvação começa na eleição e termina na glória. Entre essas duas coisas, cada aspecto do processo redentor é obra de Deus, não do pecador. Deus não para o processo nem omite nenhum de seus aspectos.

Tito 3.5 é bastante claro: a salvação — toda ela — acontece não “por obras de justiça praticadas por nós”. É a obra de Deus, feita “segundo sua misericórdia”. Não é um negócio declaratório, assegurando legalmente um lugar no céu, mas deixando o pecador cativo em seu pecado. A salvação envolve uma transformação da disposição, da própria natureza humana, “mediante o lavar regenerador e renovador do Espírito Santo”.

A questão não é se somos salvos pela graça, e sim como a graça opera na salvação.

Os defensores da doutrina do não-senhorio amam descrever a si mesmos como advogados da graça. Entretanto, eles caracterizam a graça de modo débil, que falha em compreender toda a questão. A graça de Deus é um processo espiritual que age na vida dos redimidos, “educando-nos para que, renegadas a impiedade e as paixões mundanas, vivamos, no presente século, sensata, justa e piedosamente” (Tt 2.12). A verdadeira graça é mais do que um gigantesco presente que abre a porta para o céu no agradável porvir, permitindo-nos andar em pecado no penoso aqui e agora. A graça é Deus trabalhando presentemente em nossa vida. Pela graça “somos feitura dele, criados em Cristo Jesus para boas obras, as quais Deus de antemão preparou para que andássemos nelas” (Ef 2.10). Pela graça, Ele “a si mesmo se deu por nós, a fim de remir-nos de toda iniqüidade e purificar, para si mesmo, um povo exclusivamente seu, zeloso de boas obras” (Tt 2.14).

A obra contínua da graça na vida do cristão é tão certa quanto a justificação, a glorificação ou qualquer outro aspecto da obra reden- tora de Deus. “Estou plenamente certo de que aquele que começou boa obra em vós há de completá-la até ao Dia de Cristo Jesus” (Fp 1.6). A salvação é totalmente uma obra de Deus; Ele termina o que começa. A graça de Deus é suficiente e poderosa; não pode ser defec-tiva em qualquer sentido. “Graça” que não afeta o comportamento de uma pessoa não é a graça de Deus.

O arrependimento não é incidental ao evangelho.

O que é o evangelho, afinal de contas, senão um chamado ao arrependimento (At 2.38; 3.19; 17.30)? Em outras palavras, ele demanda que pecadores façam uma mudança — parem de seguir por um caminho e voltem-se para outro caminho (1 Ts 1.9). Os convites evangelísticos de Paulo sempre exigiam arrependimento: “Deus... agora... notifica aos homens que todos, em toda parte, se arrependam” (At 17.30). Eis como Paulo descrevia seu próprio ministério e sua mensagem: “Não fui desobediente à visão celestial, mas anunciei primeiramente aos de Damasco e em Jerusalém, por toda a região da Judéia, e aos gentios, que se arrependessem e se convertessem a Deus, praticando obras dignas de arrependimento” (At 26.19-20, ênfase acrescentada). O arrependimento é o que conduz à vida (At 11.18) e ao conhecimento da verdade (2 Tm 2.25). Assim, a salvação é impossível sem arrependimento.

Os defensores da posição do não-senhorio sugerem freqüentemente que pregar o arrependimento acrescenta algo à doutrina bíblica da salvação pela graça, mediante a fé somente.

Entretanto, a fé pressupõe arrependimento. Como podem aqueles que são inimigos mortais de Deus (Rm 5.10) crer since-ramente em seu Filho, se não se arrependem? Como alguém pode compreender, de fato, a verdade da salvação do pecado e suas conseqüências, se não entende genuinamente o que é o pecado e se não o odeia? Todo o sentido da fé é que confiamos em Cristo para nos libertar do poder e da penalidade do pecado. Portanto, pecadores não podem chegar à fé sincera sem uma mudança completa do coração, uma reviravolta da mente, das afeições e da vontade. Isso é arrependimento. Não é um suplemento ao convite do evangelho; é precisamente o que o evangelho exige. Nosso Senhor mesmo descreveu sua missão primária — chamar pecadores ao arrependimento (Mt 9.13).

Com freqüência, falamos da experiência de salvação em termos de “conversão”. Essa é uma terminologia bíblica (Mt 18.3; Jo 12.40; At 15.3). Conversão e arrependimento são termos estreitamente relacionados. A conversão ocorre quando um pecador se volta para Deus em fé contrita. É uma reviravolta completa, uma mudança absoluta de direção moral e volitiva. Uma inversão radical é a resposta que o evangelho exige, independentemente de o apelo aos pecadores ser descrito como “crer”, “arrepender-se” ou “ser convertido”. Um termo está vinculado ao outro.

Se você diz a alguém que passa por você: “Vem cá”, não é necessário dizerlhe: “Volte-se e venha”. A volta está implícita na ordem de “vir”. De maneira semelhante, quando nosso Senhor diz: “Vinde a mim” (Mt 11.28), a meia-volta do arrependimento está implícita. Nenhuma passagem da Escritura emite um apelo evangelístico que, pelo menos, não implique a necessidade do arrependimento. Nosso Senhor não oferece nada a pecadores que não se arrependem (Mt 9.13; Mc 2.17; Lc 5.32).

Mais uma vez, o arrependimento não é uma obra humana. Jesus disse: “Ninguém pode vir a mim se o Pai, que me enviou, não o trouxer” (Jo 6.44). É Deus quem garante o arrependimento (At 11.18; 2 Tm 2.5). O arrependimento não é um auto-aperfeiçoamen-to que antecede a salvação. Não é uma questão de expiar o pecado ou de fazer uma restituição antes de voltar-se para Cristo, com fé. É uma volta interior do pecado para Cristo.

Embora não seja, em si mesmo, uma “obra” desempenhada pelo pecador, o arrependimento genuíno produzirá boas obras como frutos inevitáveis (Mt 3.8).

A controvérsia da salvação por senhorio não envolve todas as igrejas.

Por causa da publicidade dada ao debate sobre a salvação por senhorio nos últimos anos, as pessoas podem ter a impressão de que todo o movimento evangélico, em todo o mundo, está dividido no que se refere a esses assuntos. Contudo, como observei antes, a teologia moderna do nãosenhorio é, primariamente, um fenômeno norte-americano. Por certo, ela tem sido exportada para algumas partes do mundo por missionários e outras pessoas treinadas em escolas americanas, mas nunca ouvi falar de proeminentes líderes cristãos de fora da América do Norte que tenham-se comprometido a defender o ponto de vista do não-senhorio com bases doutrinárias.

Sendo ainda mais específico, a controvérsia moderna do senhorio é principalmente uma disputa entre os dispensacio-nalistas. O Apêndice 2 explica o dispensacionalismo e a razão por que ele está no centro do debate do senhorio. Sem chegar, neste momento, a uma discussão técnica sobre teologia, deixe-me simplesmente observar que um ramo do movimento dispensacionalista tem-se desenvolvido e defendido a doutrina do não-senhorio. A influência deles na cultura evangélica tem-se difundido muito. À medida que a controvérsia do senhorio é debatida em programas de rádio e em outros formatos populares, começa a parecer que se trata de um conflito monumental ameaçando dividir, de forma decisiva, o cristianismo protestante. A verdade é que apenas uma parte do dispensacionalismo tem se erguido para defender o ponto de vista do nãosenhorio.

Quem são os defensores do dispensacionalismo contrário ao senhorio? Quase todos eles estão firmados numa tradição que tem raízes no ensino de Lewis Sperry Chafer. Mostrarei no Apêndice

2 que O Dr. Chafer é O pai do ensino moderno do não-senhorio. Toda figura proeminente da posição do não-senhorio descende da linhagem espiritual de

Dr. Chafer. Embora ele não tenha inventado ou dado origem a qualquer um dos principais elementos da doutrina do não-senhorio, O Dr. Chafer codificou O sistema do dispensacionalismo em que toda a doutrina contemporânea do não-senhorio está fundada. Esse sistema é um elo comum entre aqueles que tentam defender a doutrina do não-senhorio com bases teológicas.

As epístolas do Novo Testamento não apresentam um evangelho diferente daquele que o próprio Jesus pregou.

Uma das marcas do dispensacionalismo do Dr. Chafer é a forma como ele segmentou O NOVO Testamento e, particularmente, os ensinos de Cristo. Como perceberemos no Apêndice 2, Chafer acreditava que muitos dos sermões e dos convites evangelísticos do nosso Senhor eram direcionados a pessoas em outra dispensação. Ele contrastava os ensinos de Jesus sobre O reino e seus ensinos sobre a graça. Apenas os ensinos sobre a graça, segundo Chafer, podem ser legitimamente aplicados à presente época.

Muitos dispensacionalistas têm abandonado esse tipo de pensamento, mas alguns ainda não acreditam que O evangelho segundo Jesus é, ao menos, relevante à discussão sobre a salvação por senhorio. “É claro que Jesus ensinou uma mensagem de senhorio”, um irmão dispensacionalista tradicional escreveu para mim. “Ele estava pregando para pessoas que viviam sob a vigência da lei. Sob a vigência da graça, devemos ter O cuidado de pregar uma mensagem referente à graça. Devemos pregar O evangelho segundo os apóstolos.”

Portanto, no restante deste livro nos concentraremos na pregação e no ensino dos apóstolos. Daremos atenção especial ao ensino do apóstolo Paulo. Examinaremos O que os apóstolos ensinaram sobre assuntos doutrinários decisivos no debate sobre O senhorio; fé, graça, arrependimento, justificação, santificação, pecado, obras, segurança, perseverança e a mensagem do evangelho. Um fato claro emergirá; o evangelho segundo Jesus é o mesmo evangelho segundo os apóstolos. A fé que o evangelho exige não é inativa, mas dinâmica. É uma fé contrita, submissa, confiante e permanente, uma fé operante.

Capítulo 3

Os wesleyanos crêem, por exemplo, que crentes genuínos podem abandonar a fé, mas, em geral, ensinam que aqueles que abandonam perdem sua salvação. O sistema deles não tem lugar para “cristãos” que vivem em contínua rebeldia contra Cristo.

Em todo este livro, usarei a abreviação SGS em referência à obra So Great Salvation (RYRIE, Charles. Wheaton, 1ll.: Victor, 1989).

RYRIE, Charles C. Balancing the Christian life. Chicago: Moody, 1969. p. 186.

AF refere-se à obra Absolutely Free! (HODGES, Zane. Grand Rapids, Mich.: Zonder-van, 1989).

Entretanto, curiosamente, a doutrina do não-senhorio associa-se com freqüência a ponto de vista que considera as obras posteriores à salvação como meritórias. Zane Hodges, por sua vez, defende esta visão. Ele ensina que a vida eterna pode ser obtida gratuitamente pela fé, mas a vida abundante mencionada em João 10.10 é uma recompensa que pode ser adquirida apenas por obras (AF 203).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O autor afirma que o chamado do evangelho pressupõe que o pecador se arrependa e se renda à autoridade de Cristo; quando você se converteu, houve de fato um abandono do pecado e uma entrega do seu coração, ou apenas uma concordância com fatos sobre Jesus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ele distingue crer fatos sobre Cristo de confiar em Cristo de modo pessoal, colocando-se sob a sua custódia para a vida e para a morte; qual dessas duas coisas descreve melhor a sua relação com Ele hoje?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O texto diz que quem ama verdadeiramente a Cristo desejará obedecer-lhe e não buscará o que Ele odeia; observando seus desejos mais profundos, a obediência tem sido para você um deleite ou um peso que você tentaria evitar se pudesse?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Impossível Agradá-lo$t$, 4,
$conteudo$Fé é a aceitação de um dom da parte de Cristo... E uma coisa maravilhosa; envolve uma mudança de toda a natureza do homem; envolve um ódio novo pelo pecado e uma fome e sede novas pela justiça. Uma mudança tão maravilhosa como essa não é obra do homem. A fé, em si mesma, é-nos dada pelo Espírito de Deus. Os cristãos nunca tornam a si mesmos cristãos, mas são feitos cristãos por Deus.

...É inconcebível que um homem receba essa fé em Cristo, que ele aceite esse dom que Cristo oferece e continue a viver alegremente em pecado, porque o que Cristo nos oferece é exatamente a salvação do pecado — não somente salvação da culpa do pecado, mas também a salvação do poder do pecado. Portanto, a atitude correta do cristão é a de cumprir a lei de Deus. Ele a cumpre não mais como uma forma de ganhar sua salvação — pois a salvação lhe foi dada gratuitamente por Deus — mas ele a cumpre alegremente como parte central da própria salvação. A fé sobre a qual Paulo fala é, como ele mesmo diz, uma fé que age por meio do amor; e o amor é o cumprimento de toda a lei... A fé à qual Paulo se refere quando fala de justificação pela fé somente é uma fé que age.

J. GRESHAM MACHEN1

NO centro do erro da doutrina do não-senhorio está um desastroso engano sobre a natureza da fé. O ensino do não-senhorio descreve a fé como inerentemente neutra — e, até, contrária às obras, à obediência e à rendição da vontade a Deus. Os discípulos da doutrina do não-senhorio têm muito a dizer sobre a fé. Afinal, uma “fé simples” é O fundamento de todo O seu sistema. Infelizmente, a maioria deles confia em definições incompletas de fé (“sendo convencidos ou dando crédito a algo ou a alguém” - SGS 156) e de crença (“defender algo como verdadeiro” - SGS 155). Muitos relutam em dar qualquer definição dessas palavras. Uma pessoa escreveu:

Não nos embaraçamos com perguntas introspectivas sobre a “natureza” da nossa fé em nenhuma esfera da vida, exceto no que se refere à religião... quero deixar claro que palavras como “crer” ou “fé” funcionam como equivalentes plenamente adequados aos seus correlativos gregos. Não há qualquer resíduo de significado escondido nas palavras gregas que não seja transmitido por suas traduções normais...

Logo, um leitor grego que encontra as palavras “quem crê em mim tem a vida eterna” entende a palavra “crê” exatamente como a entendemos. O mais certo é que O leitor não entenderia essa palavra como que implicando submissão, rendição, arrependimento ou qualquer outra coisa desse tipo. Para esses leitores, assim como para nós, “crer” significaria “crer”.

Certamente, uma das presunções da teologia moderna é supor que podemos definir termos simples como “crença” e “descrença” e substituir seus significados por elaborações complicadas. A confusão gerada por esse tipo de processo tem uma influência abrangente na igreja contemporânea (AF 27-29).

Essas afirmações resumem a tese do capítulo intitulado “Fé Significa só Isso — Fé!”

Certo. Suponhamos que fé e crença sejam equivalentes satisfatórios das palavras gregas pistis (“fé, fidelidade”} e pisteu (“crer, confiar”}. O que os dicionários dizem sobre fé?

O Dicionário Americano Oxford diz que fé é “1. confiança ou crença numa pessoa ou coisa; 2. convicção a respeito de uma doutrina religiosa; 3. um sistema de convicção religiosa, a fé cristã; 4. lealdade, sinceridade”.

Espere um minuto. “Lealdade, sinceridade”? O ensino do não-senhorio garantiria que esses são elementos da fé verdadeira? Tais conceitos não são excluídos especificamente da definição de fé na doutrina não-senhorio?

Vejamos o Dicionário Oxford, que alista mais de uma página inteira de significados da palavra fé. Ele define fé como “confiança, esperança, crença”; “convicção procedente de confiança num testemunho ou numa autoridade”; “o dever de satisfazer a confiança de alguém; sujeição devida a um superior, fidelidade; a obrigação de uma promessa ou de um compromisso”; e “a qualidade de satisfazer a confiança de alguém; sinceridade, fidelidade, lealdade”. O dicionário até inclui uma definição teológica:

O tipo de fé (distintivamente chamada de fé salvífica ou justificado-ra} pela qual, no ensino do N. T., um pecador é justificado diante de Deus. Ela é definida por teólogos de forma variável (ver citações}, mas a respeito dela há um acordo geral no sentido de uma convicção ope-rante no caráter e na vontade e, assim, oposta a uma mera aceitação intelectual da fé religiosa (às vezes, chamada de fé contemplativa}.

A doutrina do não-senhorio estaria de acordo com essas definições? Certamente, não. Os patronos da salvação sem senhorio redefinem a fé precisamente para despojar a palavra de qualquer idéia de lealdade, sinceridade, obediência, submissão, fidelidade, compromisso e “qualquer outra coisa desse tipo”.

Então, o partidário da doutrina do não-senhorio não encontra apoio em um apelo ao significado padrão da palavra fé. O que podemos dizer sobre a palavra crer?

De acordo com o dicionário, crer é um verbo que significa “ter confiança e fé em (uma pessoa) e, consequentemente, contar com essa pessoa, depender dela”. O dicionário observa que crer é derivada de palavras formadoras de outras que significam “considerar estimável, valioso, agradável ou satisfatório, satisfazer-se com”.

Estar satisfeito com Cristo.

Vindo diretamente do dicionário, vemos que, francamente, essa é uma definição de crer melhor do que aquela proposta pelos defensores da salvação sem senhorio. Essa definição coloca explicitamente a atitude de crer à parte de mera aquiescência abstrata com fatos acadêmicos. Descreve uma fé que não pode ser colocada em oposição a compromisso, rendição, arrependimento, deleite no Senhor e “qualquer outra coisa desse tipo”.

Em última análise, não é ao dicionário, mas à Escritura que devemos nos voltar em busca de uma definição de fé. Um capítulo no Novo Testamento (Hebreus 11) nos foi dado com o propósito evidente de definir e descrever a fé. O escritor de Hebreus nos diz com exatidão o que é a fé e o que ela faz. Nisto, descobrimos que a fé representada pela doutrina do não-senhorio tem pouca semelhança com a fé sobre a qual as Escrituras falam.

O que é a fé

Hebreus 11 começa dizendo: “Ora, a fé é a certeza de coisas que se esperam, a convicção de fatos que se não vêem. Pois, pela fé, os antigos obtiveram bom testemunho. Pela fé, entendemos que foi o universo formado pela palavra de Deus, de maneira que o visível veio a existir das coisas que não aparecem” (vv. 1-3).

Todo este capítulo de Hebreus aborda a supremacia e a superioridade da fé. Confronta a hipocrisia do judaísmo daquele século: O judaísmo ensinava que a justiça, o perdão dos pecados e, finalmente, a salvação podiam ser alcançados apenas por meio de um rigoroso sistema de obras meritórias. A tradição judaica distorceu tanto a lei de Deus, que a maioria dos judeus viam-na como o caminho para merecer o favor de Deus. Mesmo após terem sido mostradas as verdades básicas sobre Cristo, alguns dos he-breus relutavam em abandonar sua religião baseada em obras de justiça.

A salvação baseada em obras é, e sempre foi, desprezada por Deus (cf. Rm 8.3; Gl 2.16; Fp 3.9; 1 Tm 1.9). Deus nunca redimiu o homem por obras, mas sempre por fé (cf. Gn 15.6). “O justo viverá pela sua fé” (Hc 2.4) não é uma verdade sobre a Nova Aliança somente. Como Hebreus 11 deixa claro, desde Adão o instrumento da salvação de Deus tem sido a fé, e não as obras. As obras são um subproduto da fé, nunca um meio de salvação.

Habacuque 2.4 é citado três vezes no Novo Testamento: Rm 1.17, Gl 3.11 e Hb 10.38. Romanos explica o significado de “o justo”. Gálatas é um tipo de comentário sobre a palavra “viverá”. Hebreus 11 sonda a profundidade da expressão “pela fé”.

Habacuque forma uma ponte entre Hebreus 10 e seu grande tema de justificação pela fé. Os santos mencionados em Hebreus 11 são exemplos de pessoas que foram justificadas pela fé e viveram pela fé. A fé é tanto o caminho para a vida como o modo de viver. A fé é o único meio; sem ela ninguém pode agradar a Deus (v. 6).

O que é fé? “A fé é a certeza de coisas que se esperam, a convicção de fatos que se não vêem” (11.1). Essa é uma parelha de frases no estilo poético hebraico. O versículo define a fé em duas frases paralelas, quase idênticas. Ele não objetiva ser uma definição teológica plena. No entanto, todos os elementos cruciais que resumem a doutrina bíblica da fé são sugeridos por esse versículo e pelos exemplos de fé que seguem.

A fé é a certeza de coisas que se esperam.

A fé transporta as promessas de Deus para o tempo presente.

Em outras palavras, a fé verdadeira crê, inquestionavelmente, no que Deus afirma em sua Palavra e age de acordo com isso. A fé é uma confiança sobrenatural — e, portanto, dependência — naquele que fez as promessas. Não é uma esperança incerta de algo que pode acontecer num futuro vago e indefinido. É uma confiança que traz absoluta certeza, aqui e agora, às “coisas que se esperam”.

A palavra traduzida por “certeza” (no grego, hupostasis) aparece mais outras duas vezes em Hebreus. Em Hebreus 1.3, ela foi traduzida por “ser” na frase “a expressão exata do seu Ser”, falando sobre a semelhança de Cristo com seu Pai. Em Hebreus 3.14, ela foi traduzida por “confiança”. Refere-se a essência, substância, conteúdo real — a realidade oposta à mera aparência. Hupostasis é formada por stasis (“ficar”) e hupo (“sob”). Ela se refere a um fundamento, a base sobre a qual algo é construído. Um dicionário grego observa que hupostasis era usada na literatura grega antiga como um termo legal que se referia a “documentos relacionados à propriedade das pessoas, depositados em arquivos e constituintes de evidência de posse”. Esse é o sentido transmitido em Hebreus 11.1. O dicionário grego oferece esta tradução: “Fé é o documento de propriedade das coisas esperadas”.2

Em sentido semelhante, a versão King James, em inglês, apresenta uma boa tradução de Hebreus 11.1: “A fé é a substância das coisas que se esperam, a evidência das coisas que se não vêem”. A fé, em vez de ser ambígua ou incerta, é convicção concreta. É a confiança presente de uma realidade futura “a certeza de coisas que se esperam”.

A certeza que esse versículo descreve não é uma certeza pessoal de salvação, mas uma certeza absoluta quanto à mensagem do evangelho. O versículo está dizendo que fé é uma convicção produzida por Deus a respeito da verdade das promessas da Bíblia e da fidelidade de Cristo. O versículo não está dizendo que a fé garante automaticamente plena segurança da salvação pessoal de alguém.

Uma pergunta que tem sido levantada pelo debate acerca do senhorio é se a essência da fé salvífica é segurança pessoal. A doutrina radical do nãosenhorio ensina que fé é certeza e certeza é fé. “Uma pessoa que nunca teve certeza da vida eterna nunca creu na mensagem salvadora de Deus” (AF 51). Também: “Dar crédito à mensagem do evangelho sem saber que somos salvos é completamente impossível para nós” (AF 50). Por outro lado, se você tem certeza de que é salvo, deve se encaixar em: “As pessoas sabem se crêem em algo ou não, esse é o ponto real da discussão no que se refere a Deus” (AF 31). Esse ensino não dá qualquer espaço para a possibilidade de uma certeza falsa.

No capítulo 10, trataremos desse assunto mais inteiramente. Como veremos, há muito mais envolvido na plena certeza da salvação do que simplesmente crer nas promessas objetivas da Escritura. Na fé, há muito mais do que um mero sentimento de certeza. Hebreus 11.1 significa apenas que a fé é uma certeza sobrenatural quanto à verdade do evangelho e à confiabilidade de Cristo.3

Essa fé segura deve ser obra de Deus em nós. Embora a verdade do evangelho seja confirmada por muitas evidências, a natureza humana é predisposta a rejeitar a verdade sobre Cristo. Então, sem a obra do Espírito em nós, nunca podemos crer do modo como o versículo descreve.

A fé de Hebreus 11.1 não é a fé comum da qual falamos no cotidiano. Bebemos água que sai de uma torneira acreditando que isso é seguro. Dirigimos nosso carro em auto-estradas confiando que os freios funcionarão. Submetemo-nos pela fé ao bisturi do cirurgião e à broca do dentista. Quando entregamos os filmes para serem revelados confiamos que as fotografias ficarão prontas no tempo prometido (cf. SGS 118). Confiamos na integridade básica de nossos líderes governamentais (AF

27-28). A capacidade de ter esse tipo de fé é intrínseca à natureza humana, mas esse não é o tipo de fé que Hebreus 11.1 descreve.

Para começar, a fé natural apoia-se num objeto que não é necessariamente confiável. A água, na verdade, pode estar suja. Os freios podem falhar. Os cirurgiões cometem erros. O estúdio fotográfico pode não entregar as fotos a tempo. O presidente provavelmente negligenciará algumas das promessas de sua campanha. Mas cremos na vida eterna, cremos em algo mais real e Alguém mais confiável do que qualquer coisa ou qualquer pessoa que possamos compreender com os sensos naturais. Nossos sensos podem mentir, Deus não (Tt

I. 2). As pessoas falham, Deus não (Nm 23.19). As circunstâncias mudam, Deus nunca muda (Ml 3.6). Então, a fé descrita em Hebreus 11 se concentra num objeto infinitamente mais fidedigno do que qualquer uma das variedades cotidianas de fé.

Além disso, a natureza da fé é diferente no campo espiritual. A fé natural confia nos sentidos físicos. Tendemos a acreditar somente no que nós ou outros vemos, ouvimos, provamos e sentimos. Quando confiamos na água, em nossos freios, no cirurgião, nas pessoas do estúdio fotográfico ou no presidente, nós o fazemos porque nossos sentidos e nossa experiência humana nos dizem que essas coisas são, de modo geral, dignas de nossa confiança. Por outro lado, a fé de Hebreus

II. 1 é uma convicção sobrenatural — uma segurança sólida, inabalável, que é contrária à natureza humana. Inclui uma capacidade de abraçar a realidade espiritual imperceptível ao homem natural. “O homem natural não aceita as coisas do Espírito de Deus, porque lhe são loucura; e não pode entendê-las, porque elas se discernem espiritualmente” (1 Co 2.14). Hebreus 11.27 caracteriza da mesma maneira a fé de Moisés (“permaneceu firme como quem vê aquele que é invisível”).

A implicação clara de tudo isso é que a fé é um dom de Deus. Se a fé fosse uma mera decisão humana, ela não teria garantia nenhuma. Poderia ser uma decisão ruim. Se crer fosse apenas uma função da mente humana, a fé não seria uma base para a confiança. A mente pode ser facilmente enganada e iludida, errar e estar mal informada. A fé verdadeira é uma certeza implantada por Deus, uma certeza que se eleva acima do funcionamento natural da mente humana. Afinal, o homem natural não vê aquele que é invisível (v. 27).

A fé é... a convicção de fatos que se não vêem.

Essa frase paralela amplia ainda mais a mesma verdade. Convicção implica uma manifestação mais profunda da segurança interior. Pessoas de fé estão preparadas para viver sua fé. Sua vida reflete um compromisso com o que sua mente e seu coração estão certos de que é verdade. Elas têm tanta certeza das promessas e das bênçãos futuras, que se comportam como se essas promessas já estivessem realizadas (Hb 11.7-13; cf. Rm 4.17-21).

“Convicção de fatos que se não vêem” repete a descrição de Pedro a respeito da fé salvífica (1 Pe 1.8-9): embora não tenhamos visto a Cristo, nós o amamos. Embora não o vejamos agora, cremos nEle — somos comprometidos com Ele — com alegria indizível e gloriosa, obtendo o resultado da fé, a salvação de nossa alma. Tal fé é incontestável. Não importa o que coloque a fé à prova, não importa o preço a ser pago, esta fé permanece. De fato, todos os exemplos apresentados em Hebreus 11 mostram pessoas cuja fé foi severamente testada. Em cada caso, a fé da pessoa citada permaneceu forte. A esses exemplos poderíamos acrescentar Jó, cuja fé Satanás tentou destruir com as mais severas tragédias pessoais, e Pedro, a quem Satanás peneirou como trigo — mas a fé de Pedro não desfaleceu (Lc 22.32). Jesus orou em favor de Pedro com essa finalidade. Ele intercede por todos os salvos de modo igualmente bemsucedido (Rm 8.34; Hb 7.25; 1 Jo 2.2). Não importa o que ataca esta fé, ela não pode ser destruída.

Como esta fé pode deixar de transformar a vida? Isso não acontece. Esta fé é uma convicção firme e sobrenatural que governa o comportamento do verdadeiro crente, como os exemplos de Hebreus

11 demonstram. Pessoas de fé adoram, suportam, sacrificam-se e trabalham pela fé. Nossas obras não são esforços carnais, e sim o inevitável resultado de uma firme convicção de que os “fatos que se não vêem” são, apesar disso, reais. Obedecemos porque estamos comprometidos com o objeto de nossa fé.

Compromisso é o elemento contestado da fé, ao redor do qual gira a controvérsia do senhorio. A teologia do não-senhorio nega que crer em Cristo envolve qualquer compromisso pessoal com Ele. É impossível harmonizar o conceito de fé da doutrina do não-senhorio com Hebreus 11. Todo o objetivo deste capítulo é destacar exemplos de pessoas que eram comprometidas com o que acreditavam. Mais precisamente, elas eram comprometidas com o Deus em quem acreditavam — até à morte.

A teologia sistemática reconhece geralmente três elementos da fé: conhecimento (notitia), aceitação (assensus) e confiança (fiducia). Augustus H. Strong e Louis Berkhof ambos referem-se a notitia como o “elemento intelectual” da fé. Assensus é o “elemento emocional”. Fiducia é o “elemento voluntário [volitivo]”.4 A fé verdadeira envolve toda a pessoa — mente, emoções e vontade. A mente inclui conhecimento, uma identificação e entendimento da verdade de que Cristo salva. Do coração vem a aceitação ou a confiança e afirmação estabelecidas de que a salvação de Cristo é aplicável à própria alma de alguém, A vontade responde com confiança, o compromisso pessoal com Cristo e a apropriação dEle como a única esperança para a salvação eterna,

Essa “confiança” ou fiducia, o componente volitivo da fé, é o elemento supremo do crer, Envolve rendição ao objeto da fé, É uma apropriação pessoal de Cristo tanto como Senhor quanto como Salvador, A teologia padrão afirma isso universalmente, Strong definiu fiducia como “confiar em Cristo como Senhor e Salvador ou, em outras palavras, distinguir seus dois aspectos: (a) rendição da alma, como culpada e corrompida, ao governo de Cristo,,, (b) receber e apropriar-se de Cristo como a fonte de perdão e vida espiritual”,5 Neste ponto, Berkhof repete, quase palavra por palavra, o que Strong escreveu,6 B, B, Warfield, observando que confiança inclui alguns elementos do compromisso com seu objeto, escreveu: “Não podemos dizer que cremos em alguma coisa da qual desconfiamos demais e não podemos comprometer-nos com ela”,7

Fé salvífica é todo o meu ser aceitando tudo de Cristo, A fé não pode ser separada do compromisso,

A teologia radical do não-senhorio repudia tudo que acabamos de dizer como “psicanálise” desnecessária a respeito do que deveria ser um conceito simples, “Ninguém precisa ser psicólogo para entender o que é a fé”, escreveu Zane Hodges, “Tampouco precisamos recorrer à “psicologia popular” para explicá-la, É perda de tempo empregar as categorias populares — intelecto, emoção ou vontade — como um modo de analisar a mecânica da fé, Essas discussões estão longe, fora dos limites do pensamento bíblico” (AF 30-31).

Contudo, todos os três elementos da fé estão claramente implícitos em nosso texto: conhecimento - “Pela fé, entendemos” (v, 3); aceitação - “a fé é a certeza de coisas que se esperam” (V. 1); e confiança - “a fé É... a convicção de fatos que se não vêem” (V. 1). OS homens e mulheres apresentados nessa grande Galeria da Fé eram todos plenamente comprometidos — mente, coração e alma — com o objeto de sua fé. Como alguém familiarizado com este capítulo projetaria uma noção de fé em que falta o compromisso pessoal?

Fé é crer que Deus existe.

Hebreus 11.6, um versículo referencial, oferece mais um critério para a natureza da fé: “Sem fé é impossível agradar a Deus, porquanto é necessário que aquele que se aproxima de Deus creia que ele existe e que se torna galardoador dos que o buscam”.

Absolutamente, nada que fazemos pode agradar a Deus sem este tipo de fé. Sem fé, agradar a Deus é impossível. Religião, herança racial, obras meritórias — tudo que os hebreus consideravam agradável a Deus — são completamente inúteis sem fé.

A origem da fé é simplesmente crer que Deus existe. Certamente, isso significa muito mais do que crer num ser supremo sem nome e desconhecido. Os hebreus conheciam o nome de Deus como EU SOU (EX 3.14). A frase “é necessário que aquele que se aproxima de Deus creia que ele existe” é um chamado à fé no Deus que se revelou na Escritura. Esse versículo não endossa a crença em alguma deida-de abstrata — o “fundamento do ser”, o “homem lá de cima”, “Alá”, “o deus desconhecido” dos filósofos gregos (At 17.23) ou qualquer outro dos deuses feitos pelos homens. A frase se refere ao Deus único, apresentado na Bíblia, cuja mais elevada revelação de si mesmo está na pessoa de seu Filho, o Senhor Jesus Cristo.

Evidentemente, a fé verdadeira tem uma substância objetiva. Há um conteúdo intelectual em nossa fé. Crer não é um salto descuidado no escuro ou algum tipo de confiança etérea à parte do conhecimento. Há uma base factual, histórica, intelectual para a nossa fé. A fé que não está fundamentada nessa verdade objetiva não é fé, de modo algum. Quanto a isso, creio que todos, em ambos os lados da questão do senhorio, estão de pleno acordo.

Entretanto, a doutrina do não-senhorio inclina-se, neste ponto, a dois erros sérios. Primeiro, ela despoja a fé de tudo, exceto do objetivo, do aspecto acadêmico, fazendo do exercício da fé uma simples ilusão. Em segundo, ela tende a diminuir o conteúdo objetivo da fé ao mínimo, fazendo o fundamento da fé tão escasso, que as pessoas raramente precisam saber alguma coisa sobre quem Deus é ou o que Cristo fez. É uma abordagem vazia da crença, uma abordagem que não tem base na Escritura.

Até que ponto os apologistas da doutrina do não-senhorio querem despojar o evangelho de seu conteúdo essencial? Um artigo impresso em um dos principais periódicos da fraternidade do não-senhorio sugeriu que “uma pessoa pode colocar sua confiança em Jesus Cristo, e somente nEle, sem entender exatamente como Ele tira os pecados”. Por conseguinte, o artigo afirmava: “É possível ter fé salvífica em Cristo sem entender a realidade de sua ressurreição”.8 O homem que escreveu o artigo sustentava que nem a morte de Cristo nem sua ressurreição são essenciais à mensagem evangelística. É suficiente, disse ele, “apresentar apenas a verdade central do evangelho, ou seja, que a pessoa que crê em Jesus Cristo tem vida eterna”.9 Evidentemente, ele acredita que podem ser salvas as pessoas que nunca ouviram que Cristo morreu pelos pecados delas.

Mas o apóstolo Paulo disse: “Se, com a tua boca, confessares Jesus como Senhor e, em teu coração, creres que Deus o ressuscitou dentre os mortos, serás salvo” (Rm 10.9). A ressurreição era central no evangelho de Paulo: “Irmãos, venho lembrar-vos o evangelho que vos anunciei... que Cristo morreu pelos nossos pecados... e que foi sepultado e ressuscitou ao terceiro dia, segundo as Escrituras” (1 CO 15.1-4). Há muitos falsos cristos (Mt 24.24). O único que garante vida eterna ressuscitou dos mortos para tornar possível a salvação. Aqueles que adoram um cristo inferior não podem ser salvos: “Se Cristo não ressuscitou, é vã a nossa pregação, e vã, a vossa fé” (1 Co 15.14).

A crucificação e a ressurreição são os fatos mais vitais do evangelho (1 Co 15.1-4). Quando Hebreus 11.6 exige que creiamos que Deus existe, está exigindo que creiamos no Deus da Escritura, aquele que deu seu Filho para morrer e ressuscitar. Sabemos que os santos do Antigo Testamento não tinham uma revelação plena sobre a morte e a ressurreição de Cristo. Eles eram salvos mediante sua fé, baseada no que Deus havia revelado. Mas desde aquela primeira ressurreição, no domingo, ninguém tem sido salvo de outro modo, senão por meio da fé na expia-ção de Cristo pelos pecados e em sua subseqüente ressurreição.

Então, a frase “creia que ele existe” fala sobre a fé no Deus da Escritura, tendo como base uma compreensão da verdade crucial sobre Ele. Isso é notitia, conhecimento — o lado objetivo da fé. Mas, como estamos vendo, ainda existe mais na fé salvífica.

Fé é buscar a Deus.

Apenas crer que o Deus da Bíblia existe não é suficiente. Não é suficiente conhecer as suas promessas ou mesmo acreditar intelectualmente na verdade do evangelho. A fim de agradar-lhe, também é necessário crer que Ele “se torna galardoador dos que o buscam”. Essa frase une a aceitação (assensus) e a confiança (fiducia) para tornar completo o quadro da fé. A aceitação vai além de uma observação imparcial de quem Deus é. O coração que aceita afirma a bondade do caráter de Deus como “galardoador”. A confiança aplica esse conhecimento de modo pessoal e prático quando a pessoa, com fé sincera, se volta para Deus, como alguém que o busca.

Não é suficiente pressupor a existência de um ser supremo. Não é suficiente nem mesmo aceitar o Deus certo. A fé verdadeira não é apenas saber sobre Deus: é buscar a Deus. De fato, na Escritura “buscar a Deus” é usado com freqüência como sinônimo de fé. Isaías 55.6 é um chamado à fé: “Buscai o

SENHOR enquanto se pode achar, invocai-o enquanto está perto”. O próprio Deus disse a Israel: “Buscar-me-eis e me achareis quando me buscardes de todo o vosso coração” (Jr 29.13). “Assim diz o SENHOR à casa de Israel: Buscai-me e vivei” (Am 5.4). “Buscai, pois, em primeiro lugar, o seu reino e a sua justiça, e todas estas coisas vos serão acrescentadas” (Mt 6.33).

Talvez alguém faça objeção dizendo que Hebreus 11.6 afirma apenas que devemos crer que Deus recompensa os que o buscam; não diz que temos de buscá-Lo. Mas, por que Deus recompensa os que o buscam? Por causa de suas obras? Não, “as nossas justiças [são] como trapo da imundícia” (Is 64.6). Deus recompensa apenas aqueles que têm fé — sem fé é impossível agradar-Lhe. Esse versículo identifica o buscar a Deus como o epítome da fé verdadeira.

Buscá-Lo leva a encontrá-Lo plenamente revelado no Senhor Jesus Cristo (Mt 7.7; Lc 11.9).

A atitude descrita aqui é a antítese da justiça procedente de obras. Em vez de tentar merecer o favor de Deus, a fé busca o próprio Deus. Em vez de negociar a aprovação de Deus, a fé o segue como o maior prazer da alma. Em vez de tornar a fé em uma obra humana, esta definição enfatiza que fé é o abandono da tentativa de agradar a Deus pelas obras e que a fé é a lealdade a Ele, que manifesta o que Lhe agrada mediante suas obras por meio de seu povo.

A fé, portanto, é buscar e encontrar a Deus em Cristo, desejando-o e, finalmente, satisfazendo-se nEle. Outra forma de dizer isso é que a fé consiste em confiar completamente em Cristo para a redenção, para a justiça, para aconselhamento, para comunhão, para sustento, para direcionamento, para alívio, para seu senhorio e tudo na vida que pode satisfazer verdadeiramente.

Observe que completamos O CÍCIO da definição de fé sugerida pelo dicionário: fé é estar satisfeito com Cristo. O próprio Jesus disse isto: “Eu sou o pão da vida; o que vem a mim jamais terá fome; e o que crê em mim jamais terá sede” (Jo 6.35). Não há como um crente genuíno deixar de estar satisfeito com Cristo. Afinal de contas, o próprio Deus declarou que seu próprio Filho satisfaz plenamente (Mt 3.17; 17.5). Como a fé sincera poderia considerá-Lo menos do que isso?

Como você supõe que seja a ação deste tipo de fé? O restante de Hebreus 11 dá uma resposta inequívoca a essa pergunta.

MACHEN, J. Gresham. What is faith? New York: Macmillan, 1925. p. 203-204.

MOULTON, James H.; MILLIGAN, George. The vocabulary of the Greek Testament. Grand Rapids, Mich.: Eerdmans, 1930. p. 660.

Hebreus 11.1 afirma, certamente, que um elemento de certeza está no centro da própria fé. Como veremos no capítulo 10, a fé salvífica em Cristo é o fundamento de toda segurança. O senso de segurança pessoal de alguém se aprofunda e se fortalece com a maturidade espiritual; mas a semente da certeza está presente já no início da fé salvífica.

STRONG, Augustus H. Systematic theology. Philadelphia: Judson, 1907, p. 837838. BERKHOF, Louis. Systematic theology. Grand Rapids, Mich.: Eerdamns, 1939. p. 503-505.

Em Absolutely Free!, Zane Hodges alegou que eu havia “distorcido seriamente” a definição de Berkhof (AF 207). “Assensus não é um ‘elemento emocional'”, Hodges protestou. Mas, afinal, essas são as próprias palavras de Berkhof. Observe que Strong tinha uma opinião idêntica. Até Ryrie concorda (SGS 120). Ao usarem a expressão “elemento emocional”, Strong e Berkhof queriam dizer que assensus vai além de considerar o objeto da fé de modo negligente e desinteressado. Berkhof escreveu: “Quando alguém segue a Cristo pela fé, ele tem uma profunda convicção da verdade e da realidade do objeto da fé, sente que a fé supre uma necessidade importante de sua vida e fica consciente de um interesse cativante por ela... Essa é exatamente a característica distintiva do conhecimento da fé salvífica”. João Calvino definiu assensus como “mais uma questão do coração do que da cabeça, da afeição do que do intelecto”. Ele igualou aceitação à “afeição piedosa”. Ver: CALVINO, João. Institutas da religião cristã. Trans. Henry Beveridge. Grand Rapids, Mich.: 1966. 3:2:8.

STRONG, Augustus H, Systematic theology, Philadelphia: Judson, 1907, p, 338-339,

BERKHOF, Louis, Systematic theology, Grand Rapids, Mich,: Eerdamns, 1939, p, 505,

WARFIELD, Benjamin B, Biblical and theological studies, Philadelphia: Presbyterian & Reformed, 1968, p, 402-403,

WILKIN, Bob. Tough questions about saving faith. The Grace Evangelical Society News, Denton, p. 1, June 1990.

Ibid. p. 4.

O que a fé faz

A fé obedece.

Isso, em três palavras, é o principal ensino de Hebreus 11. Neste capítulo de Hebreus, vemos pessoas de fé adorando a Deus (v. 4), andando com Deus (v. 5), trabalhando por Deus (v. 7), obedecendo a Deus (vv. 8-10), superando a esterilidade (v. 11) e subjugando a morte (v. 12).

A fé capacitou essas pessoas a perseverar até à morte (vv. 1316); a confiar em Deus com aquilo que lhes era mais precioso (vv. 17-19); a acreditar em Deus para o futuro (vv. 20-23); a rejeitar tesouros terrenos pelo galardão celestial (vv. 24-26); a ver Aquele que é invisível (v. 27); a receber milagres das mãos de Deus (vv. 28-30); a ter coragem diante de grandes perigos (vv. 31-33); a subjugar reinos, a praticar atos de justiça, a fechar a boca de leões, a extinguir a violência do fogo, a escapar ao fio da espada, a tirar força da fraqueza, a fazerem-se poderosos em guerra, a colocar em fuga exércitos de estrangeiros (vv. 33-34). Esta fé superou a morte, suportou torturas, venceu algemas e prisões, resistiu a tentações, sofreu martírio e sobreviveu a todo tipo de privação (vv. 35-38).

A fé resiste.

Se existe uma verdade sobre a fé de Hebreus 11, é a de que a fé não pode ser destruída. Ela persevera. Ela resiste, não importa o que aconteça — agarrando-se a Deus com amor e segurança, independentemente do tipo de ataque que o mundo ou as forças do mal possam trazer contra ela.

A teologia do não-senhorio prega um tipo de fé totalmente diferente. A fé da doutrina do não-senhorio é frágil; às vezes, temporária; com freqüência, inoperante. A fé da doutrina do não-se-nhorio é simplesmente estar convicto de algo ou dar crédito a fatos históricos (SGS 30). É confiança, esperança e considerar algo como verdadeiro — mas sem qualquer compromisso com o objeto da fé (SGS 118-119). A fé da doutrina do nãosenhorio é uma convicção interna de que aquilo que Deus nos diz no evangelho é verdade — isso, e somente isso (AF 31). A fé da doutrina do não-senhorio é “a apropriação única do dom de Deus, aquela que já aconteceu”. Ela não continua necessariamente crendo (AF 63); e, de fato, pode até se tornar descrença hostil (SGS 141).

A fé é meramente a iluminação da razão humana ou a transformação de todo o ser? Alguns defensores do ponto de vista do não-senhorio ressentemse da acusação de que vêem a fé apenas como uma atividade mental. Mas eles falham consistentemente em definir a crença como qualquer coisa além de uma função cognitiva. Muitos usam a palavra confiança, mas, quando a definem, na verdade descrevem a aceitação.

Charles Ryrie, por exemplo, menciona o parágrafo de Berkhof sobre notitia, assensus e fidúcia, aprovando-o. Ele até cita a definição de Berkhof de fidúcia (confiança): “Uma confiança pessoal em Cristo como Salvador e Senhor, incluindo uma rendição da alma a Cristo, como culpada e corrupta, e uma recepção e apropriação de Cristo como a fonte de perdão e de uma vida espiritual” (SGS

120, ênfase acrescentada). Contudo, no mesmo parágrafo, Ryrie faz a curiosa declaração de que “Berkhof não introduz ou fala da questão do domínio de Cristo sobre a vida de alguém”. À medida que Ryrie continua sua própria explicação de “confiança”, torna-se claro que ele realmente quer resumir Berkhof a isso: fiducia é “uma confiança pessoal em Cristo como Salvador... e... como a fonte de perdão e vida [eterna]”. De fato, quando Ryrie explica melhor o que pretende dizer ao usar a expressão “confiança pessoal em Cristo”, ele recorre continuamente a uma linguagem que fala apenas de fatos de crença: “Crer em Cristo para a salvação significa ter confiança de que Ele pode remover a culpa do pecado e dar vida eterna” (SGS 119). Isso é aceitação, e não confiança. Aceitação é a aprovação da verdade sobre Cristo; confiança é voltar-se para Ele em plena rendição (cf. Dt 30.10; 2 Rs 23.25; 1 Ts

1.9) . Esse era o ensino de Berkhof.

Eis o apelo típico da doutrina do não-senhorio aos pecadores: “Confie no evangelho” (SGS 30), “creia nas boas-novas” (SGS 39), “Creia que Cristo morreu pelos nossos pecados” (SGS 40), “creia que Ele é Deus e o seu Messias, que morreu e ressuscitou dos mortos” (SGS 96), “creia que Cristo pode perdoar” (SGS 118), “creia que sua morte pagou todos os seus pecados” (SGS 119), “confie na verdade” (SGS 121), “creia que Alguém... pode tirar pecados” (SGS 123).

A doutrina do não-senhorio torna inevitavelmente a mensagem do evangelho no objeto da fé, em vez de esse objeto ser o próprio Senhor Jesus. Contraste o apelo da doutrina do não-senhorio com a linguagem bíblica: “Crê no Senhor Jesus e serás salvo” (At 16.31). Os pecadores são chamados a crer nele, e não somente nos fatos sobre Ele (At 20.21; 24.24; 26.18; Rm 3.22, 26; Gl 2.16, 20; 3.22, 26; Fp

3.9) . A fé inclui, certamente, conhecimento e aceitação da verdade sobre Cristo e sua obra salvífica, mas a fé que salva deve ir além do conhecimento e da aceitação. Ela é confiança pessoal no Salvador. O chamado do evangelho é que confiemos nEle (cí. JO 5.39-40).10 ISSO envolve necessariamente certo grau de amor, submissão e rendição a autoridade de Cristo.

Isso mistura a íé e as obras, como alguns gostam de dizer? De jeito nenhum. Que não haja coníusão neste ponto. Fé é uma realidade interna com conseqüências externas. Quando dizemos que a íé inclui obediência, estamos Falando da atitude da obediência dada por Deus; não estamos tentando Fazer das obras uma parte da deíinição de íé. Deus Faz do coração que crê um coração obediente, ou seja, um coração ávido por obedecer. A própria íé já está completa antes mesmo de uma única obra de obediência ser maniíestada.

Mas não se engane — a íé verdadeira sempre produzirá obras de justiça. A íé é a raiz; as obras são os Frutos. Como o próprio Deus é o vinhateiro, o Fruto é garantido. Por isso, sempre que a Escritura dá exemplos de íé — como em Hebreus 11 —, a íé é vista inevitavelmente como obediente, operante e ativa.

A teologia do não-senhorio conclui que, para ser verdadeiramente livre de justiça baseada em obras, a íé deve ser livre de toda obediência, inclusive da atitude de obediência. No pensamento dos advogados do não-senhorio, é inaceitável exigir que a íé inclua uma disposição de obedecer.11 Entretanto, a disposição de obedecer é precisamente o que distingue a íé genuína e a hipocrisia. Waríield escreveu: “Pode ser bastante razoável argumentar que ‘a prontidão para agir’ Fornece uma prova muito boa da autenticidade da ‘íé’, ‘crença’. Uma suposta ‘íé’, ‘crença’, que 1 2 não nos prepara para agir não se aproxima, de modo algum, de uma ‘fé’, ‘crença’, genuína. Certamente, deveríamos confiar naquilo de que estamos convictos, e não parecemos certos daquilo em que não estamos dispostos a confiar — não parecemos acreditar completamente, ter fé naquilo”.3

Fé e incredulidade são estados do coração. Mas são, necessariamente, comportamentos impactantes.4 Jesus disse: “O homem bom do bom tesouro do coração tira o bem, e o mau do mau tesouro tira o mal; porque a boca fala do que está cheio o coração” (Lc 6.45). O estado do coração de alguém será revelado inevitavelmente por seus frutos. Essa é uma das principais lições a ser aprendida de He-breus 11 e sua crônica de fidelidade.

Um ponto crucial deve ser abordado aqui. As obras descritas em Hebreus 11 são obras de fé. Não são esforços carnais para merecer o favor de Deus. As obras descritas ali não são, em nenhum sentido, meritórias. São a pura expressão de corações crentes. Pela fé, Abel ofereceu mais excelente sacrifício (V. 4). Pela fé, Enoque foi trasladado (V. 5). Pela fé, Noé construiu uma arca (V. 7). Pela fé, Abraão obedeceu (V. 8). Pela fé, ele viveu numa terra estranha e, pela fé, ofereceu Isaque (V. 17). Pela fé, Isaque, Jacó e José perseveraram até ao fim de sua vida (VV. 20-22). Pela fé, os pais de Moisés o esconderam (V. 23). Pela fé, Moisés rejeitou o Egito em favor do opróbrio de Cristo (VV. 24-26). Pela fé, ele deixou o Egito sem medo (V. 27), celebrou a Páscoa (V. 28). Pela fé, todo o Israel atravessou o Mar Vermelho (V. 29). Pela fé, eles conquistaram Jericó (V. 30). Pela fé, Raabe recebeu em paz os espias (V. 31).

E que mais direi? Certamente, me faltará o tempo necessário para referir o que há a respeito de Gideão, de Baraque, de Sansão, de Jefté, de Davi, de Samuel e dos profetas, os quais, por meio da fé, subjugaram reinos, praticaram a justiça, obtiveram promessas, fecharam a boca de leões, extinguiram a violência do fogo, escaparam ao fio da espada, da fraqueza tiraram força, fizeram-se poderosos em guerra, puseram em fuga exércitos de estrangeiros. Mulheres receberam, pela ressurreição, os seus mortos. Alguns foram torturados, não aceitando seu resgate, para obterem superior ressurreição; outros, por sua vez, passaram pela prova de escárnios e açoites, sim, até de algemas e prisões. Foram apedrejados, provados, serrados pelo meio, mortos a fio de espada; andaram peregrinos, vestidos de peles de ovelhas e de cabras, necessitados, afligidos, maltratados... errantes pelos desertos, pelos montes, pelas covas, pelos antros da terra.

Hebreus 11.32-38, ênfase acrescentada.

Justiça baseada em obras? Não. “Todos estes... obtiveram bom testemunho por sua fé” (V. 39). Hebreus 12.1 identifica essas pessoas como uma “grande nuvem de testemunhas” a rodear-nos. Testemunhas em que sentido? Elas dão testemunho da eficácia, da alegria, da paz, da satisfação, do poder e da continuidade da fé salvífica. Então, o autor convida todos a correr a carreira da fé (vv. 1-2).

Apesar desse testemunho monumental das obras da fé, os apologistas da doutrina do não-senhorio alegam com freqüência que ver as obras como expressão inevitável da fé equivale a estabelecer um sistema de justiça baseada em obras. Zane Hodges argumenta assim:

A salvação por senhorio não pode escapar da acusação de que mescla fé e obras. O modo como ela faz isso é sucintamente afirmado por MacArthur: “Obediência é a manifestação inevitável da fé salvífica".

Mas isso é o mesmo que dizer: “Sem obediência não há justificação, nem céu". De acordo com esse ponto de vista, “obediência" é, na verdade, uma condição para acontecer a justificação e o acesso ao céu... Se o céu realmente não pode ser alcançado sem obediência a Deus — e isso é o que a salvação por senhorio ensina — então, logicamente, essa obediência é uma condição para chegar lá (AF 213-214).

A insensatez dessa linha de raciocínio torne-se logo evidente. Dizer que obras são um resultado necessário da fé não é o mesmo que fazer delas uma condição para a justificação. O próprio Hodges acredita, certamente, que todos os cristãos serão, por fim, glorificados (Rm 8.30). Ele aceitaria a acusação de que está fazendo da glorificação uma condição para a justificação? Presumivelmente, ambos os pontos de vista do senhorio e do não-senhorio concordam que todos os crentes serão, por fim, conformados à imagem de Cristo (Rm 8.29). Discordamos apenas na questão do tempo. A teologia da salvação por senhorio mantém que o processo de tornar-se como Cristo começa no momento da conversão e continua por toda a vida.

O ponto de vista do não-senhorio permite a possibilidade de que a santificação prática deixe de cumprir seu objetivo ou nem mesmo comece enquanto não terminar esta vida na terra.

Obras meritórias não têm qualquer relação com a fé, mas obras de fé estão plenamente vinculadas à fé. Como veremos no capítulo 9, a fé que não produz obras é morta, é ineficaz. A fé que permanece inativa não é melhor do que a fé dos demônios (Tg 2.19).

Devemos encerrar este capítulo com uma distinção clara e cuidadosa. Obras da fé são conseqüência da fé, e não um componente da fé. Conforme observamos antes, a fé é uma resposta plenamente interna e, portanto, está completa antes de produzir sua primeira obra. No momento da salvação, a fé nada faz, exceto receber a provisão de Cristo. O próprio crente não faz qualquer contribuição meritória para o processo salvífico. Como J. Gresham Machen afirmou na citação com a qual iniciei este capítulo: “Fé é a aceitação de um dom da parte de Cristo”. Melhor ainda, a fé firma-se no próprio Cristo. Em nenhum sentido, isso é uma questão de obras ou mérito.

Mas a fé verdadeira nunca permanece passiva. Desde o momento da regeneração, a fé entra em atividade. Ela não trabalha pelo favor divino, não trabalha contra a graça de Deus, e sim de acordo com a graça. À medida que desenvolvemos a nossa “salvação com temor e tremor” (Fp 2.12), descobrimos que “Deus é quem efetua em vós [nós] tanto o querer como o realizar, segundo a sua boa vontade” (v. 13). A fé verdadeira mantém nossos olhos em Jesus, o autor e consumador de toda a fé genuína (Hb 12.2).

Capítulo 4

Ryrie fala ocasionalmente de Cristo como o objeto da fé, mas define o que deseja dizer de um modo que anula toda a argumentação. Por exemplo, quando ele diz: “O objeto da fé ou da confiança é o Senhor Jesus Cristo”, apresenta oposição imediata ao dizer: “O aspecto a respeito do qual confiamos nele é a sua habilidade de perdoar nosso pecado e nos levar ao céu” (SGS 121).

RYRIE, Charles C. Balancing the Christian life. p. 169-170.

WARFIELD, Benjamin B. Biblical and theological studies. Philadelphia: Presbyterian & Reformed, 1968. p. 379.

Essa fé tem necessariamente resultados morais práticos. Isso pode ser visto nas afirmações de causa e efeito de João 8.36-47 (ênfase acrescentada):

“Se, pois, o Filho vos libertar, verdadeiramente sereis livres. Bem sei que sois descendência de Abraão; contudo, procurais matar-me, porque a minha palavra não está em vós. Eu falo das coisas que vi junto de meu Pai; vós, porém, fazeis o que vistes em vosso pai. Então, lhe responderam: Nosso pai é Abraão. Disse-lhes Jesus: Se sois filhos de Abraão, praticai as obras de Abraão. Mas agora procurais matar-me, a mim que vos tenho falado a verdade que ouvi de Deus; assim não procedeu Abraão. Vós fazeis as obras de vosso pai. Disseram-lhe eles: Nós não somos bastardos; temos um pai, que é Deus. Replicou-lhes Jesus: Se Deus fosse, de fato, vosso pai, certamente, me havíeis de amar; porque eu vim de Deus e aqui estou; pois não vim de mim mesmo, mas ele me enviou. Qual a razão por que não compreendeis a minha linguagem? É porque sois incapazes de ouvir a minha palavra. Vós sois do diabo, que é vosso pai, e quereis satisfazer-lhe os desejos. Ele foi homicida desde o princípio e jamais se firmou na verdade, porque nele não há verdade. Quando ele profere mentira, fala do que lhe é próprio, porque é mentiroso e pai da mentira. Mas, porque eu digo a verdade, não me credes. Quem dentre vós me convence de pecado? Se vos digo a verdade, por que razão não me credes? Quem é de Deus ouve as palavras de Deus; por isso, não me dais ouvidos, porque não sois de Deus”.

Um versículo-chave nessa passagem é o versículo 42: “Se Deus fosse, de fato, vosso pai, certamente, me havíeis de amar”. O fato de eles dizerem que Deus era seu Pai não tornava isso verdade. O comportamento e as afeições deles refletiam a realidade espiritual.

GRAÇA BARATA?

Graça barata significa graça vendida no mercado como artigos de mascates...

Graça barata não é o tipo de perdão que nos livra das armadilhas do pecado. Graça barata é aquela que outorgamos a nós mesmos.

Graça barata é a pregação de perdão que não requer arrependimento, é o batismo sem disciplina da igreja, é participar da Ceia sem confissão, é absolvição sem confissão pessoal. Graça barata é graça sem discipulado, graça sem a cruz, graça sem Jesus Cristo vivo e encarnado.

DIETRICH BONHOEFFER1$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A aula descreve a fé de Hebreus 11 como uma certeza sobrenatural que governa o comportamento e leva a obedecer, adorar e sacrificar; quando você examina como vive, a sua fé tem produzido esse tipo de ação ou permanece apenas como uma convicção da mente?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor mostra que crer, segundo a Escritura, é estar satisfeito em Cristo como o pão que sacia toda fome e sede; honestamente, é em Cristo que a sua alma busca satisfação, ou você ainda o procura em outras coisas e o trata como um complemento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele afirma que a fé verdadeira é buscar a Deus, e não apenas saber sobre Ele; o seu coração realmente busca o próprio Deus, ou você se contenta em ter informação correta sobre Ele sem desejá-lo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Graça barata. 0 termo é, em si mesmo, ofensivo.$t$, 5,
$conteudo$“Por que você usa essa expressão?” - perguntou-me um amigo. “Isso parece denegrir a graça de Deus. Afinal, a graça não é barata — é absolutamente gratuita! A liberalidade não é a essência exata da graça?”

Mas “graça barata” não fala da graça de Deus. É uma graça autoconcedida, uma pseudograça. Ela é “barata” em valor, não em custo. É uma graça de valor semelhante ao de produtos que estão em liquidação ou danificados, desbotados, roídos por traças ou de 1 segunda mão. É uma graça artificial, remanescente das indulgências que Roma mascateava nos dias de Martinho Lutero. Barata? O custo é, na verdade, muito maior do que o comprador possivelmente perceberia, embora seja uma “graça” completamente inútil.

O termo “graça barata” foi cunhada por um pastor luterano, alemão,quefaziaresistênciaaonazismo,chamadoDietrichBonhoeffer. Ele foi enforcado em 1945 pela guarda SS, mas não antes de seus escritosdeixaremsuamarca.ÂperspectivateològicadeBonhoefferera neoortodoxa, e o evangelicalismo corretamente rejeita muito de seu ensino. Mas Bonhoeffer falou vigorosamente contra a secularização da igreja. Ele analisou de forma correta os perigos da atitude frívola da igreja para com a graça. Após descartarmos os ensinos neo-ortodoxos, fazemos bem em dar atenção à severa crítica de Bonhoeffer à graça barata:

Graça barata significa graça como uma doutrina, um princípio, um sistema. Significa perdão dos pecados proclamado como verdade geral, significa o amor a Deus ensinado como a “concepção” cristã de Deus. Uma aceitação intelectual da idéia que é considerada, em si mesma, suficiente para assegurar a remissão de pecados. A igreja que defende a doutrina correta da graça tem, supostamente, ipso facto, uma parte nessa graça. Numa igreja assim, o mundo encontra um esconderijo barato para seus pecados; contrição nenhuma é exigida e muito menos qualquer desejo real de ser resgatado do pecado. A graça barata, portanto, equivale a uma negação da encarnação do Verbo de Deus.

Graça barata significa a justificação do pecado sem a justificação do pecador. A graça faz tudo sozinha, dizem eles, e, portanto, tudo pode permanecer como era antes. “Tudo que o pecado não poderia reparar.” O mundo continua do mesmo jeito, e ainda somos pecadores, “mesmo quando temos a melhor vida”, como disse Lutero. Bem, deixemos que o cristão viva como o restante do mundo; deixemos que ele se conforme ao padrão do mundo em cada esfera da vida e não aspire viver audaciosamente, sob a graça, uma vida diferente da que ele tinha antes, sob o pecado.2

A graça barata não perdeu seu apelo mundano desde que Bo-nhoeffer escreveu essas palavras. A tendência de baratear a graça tem levado sua destruição até ao coração do cristianismo evangélico. O movimento do nãosenhorio tem liderado o caminho da legitimação e institucionalização da graça barata no fundamentalismo religioso. A doutrina do não-senhorio interpreta de modo trágico e aplica de modo errado a doutrina bíblica da graça. Enquanto exalta verbalmente as maravilhas da graça, ela muda o item verdadeiro por um imitação. Essa tática ilegal tem confundido muitos cristãos sinceros.

A teologia do não-senhorio ignora completamente a verdade bíblica de que a graça nos educa “para que, renegadas a impiedade e as paixões mundanas, vivamos, no presente século, sensata, justa e piedosamente” (Tt 2.12). Em vez disso, ela retrata a graça como um “alvará de soltura” sobrenatural — um pacote ilimitado e irrestrito de anistia, beneficência, indulgência, paciência, caridade, leniência, imunidade, aprovação, tolerância e privilégio autoconferido, divorciado de qualquer exigência moral.

A supergraça está se tornando, rapidamente, a propaganda mais popular no desfile evangélico. Aqueles que fazem da submissão ao senhorio de Cristo algo opcional estão liderando o caminho. Eles até começaram a chamar seu ensino de “teologia da graça” e a referir-se a seu movimento como “O Movimento da Graça”.

Contudo, a “graça” da qual eles falam altera a posição dos crentes, sem afetar seu estado. É uma graça que chama pecadores a Cristo, mas não lhes ordena que se rendam a Ele. De fato, os teólogos do não-senhorio alegam que a graça é enfraquecida se O pecador convertido deve se render a Cristo. Quanto mais alguém se rende, tanto mais reduzida fica a eficácia da graça (SGS 18). É óbvio que essa não é a graça de Tito 2.11-12.

Não é surpreendente que os cristãos estejam confusos. Visto que tantos ensinos contraditórios e, obviamente, antibíblicos continua a ganhar popularidade, devemos nos questionar sobre o futuro do cristianismo bíblico.

O que é graça?

Graça é uma palavra terrivelmente mal interpretada. Defini-la de modo sucinto é notoriamente difícil. Alguns dos livros teológicos mais detalhados não oferecem qualquer definição concisa do termo. Alguém propôs esta síntese: “Graça é as riquezas de Deus às expen-sas de Cristo.” Esse não é um modo ruim de caracterizar a graça, mas não é uma definição teológica suficiente. Uma das definições de graça mais conhecidas tem apenas seis palavras: o favor não merecido de Deus. A. W. Tozer a ampliou: “Graça é a boa vontade de Deus que o inclina a conceder benefícios aos indignos”.3 Berkhof é mais perspicaz em sua definição: a graça é “a ação imerecida de Deus no coração do homem, realizada por meio da atividade do Espírito Santo”.4

No âmago do termo graça está a ideia do favor divino. A palavra hebraica traduzida por “graça” é chen, usada, por exemplo, em Gênesis 6.8: “Noé achou graça diante do SENHOR”. Intensamente relacionado a ela, está o verbo chãnan, que significa “mostrar favor”. No Novo Testamento, “graça” é uma tradução da palavra grega cha-ris, que significa “elegância”, “benevolência”, “favor” ou “gratidão”.

Intrínsecas a esse significado, estão as idéias de favor, bondade e boa vontade.

Graça é tudo isso e mais. Graça não é meramente um favor imerecido; é favor concedido a pecadores que merecem a ira. Mostrar bondade a um estranho é “favor imerecido”; fazer o bem a inimigos é mais descritivo do espírito da graça (Lc 6.27-36).

A graça não é uma qualidade inativa ou abstrata, e sim um princípio dinâmico, ativo, operante: “A graça de Deus se manifestou salvadora... educando-nos” (Tt 2.11-12). Ela não é algum tipo de bênção etérea que fica à toa, até nos apropriarmos dela. Graça é a iniciativa soberana de Deus para com pecadores (Ef 1.5-6). Graça não é um acontecimento que ocorreu uma vez por todas na experiência cristã. Estamos na graça (Rm 5.2). Toda a vida cristã é dirigida e capacitada pela graça: “O que vale é estar o coração confirmado com graça e não com alimentos” (Hb 13.9). Pedro disse que devemos crescer “na graça e no conhecimento de nosso Senhor e Salvador Jesus Cristo” (2 Pe 3.18).

Assim, poderíamos definir apropriadamente a graça como a influência voluntária e benevolente de um Deus santo, que age soberanamente na vida de pecadores indignos.

Benevolência é um atributo de Deus. Um das características de sua natureza é conceder graça. “Ele é benigno, misericordioso e justo” (Sl 112.4). “Ele é misericordioso, e compassivo, e tardio em irar-se, e grande em benignidade, e se arrepende do mal” (Jl 2.13). Ele é “o Deus de toda a graça” (1 Pe 5.10); seu Filho é “cheio de graça e de verdade” (Jo 1.14); seu Espírito é “o Espírito da graça” (Hb 10.29). Berkhof observou: “Embora, às vezes, falemos de graça como uma qualidade inerente, ela é, na realidade, a comunicação ativa de bênçãos divinas, mediante a ação interna do Espírito Santo, procedentes da plenitude daquele que é ‘cheio de graça e de verdade’”.5

Charis é encontrada no texto grego 155 vezes. Somente nas epístolas de Paulo ela é encontrada 100 vezes. Interessantemente, esse termo nunca é usado em referência à graça divina em qualquer das palavras registradas de Jesus. Mas a graça permeava todo o seu ministério e ensino (“os cegos vêem, os coxos andam, os leprosos são purificados, os surdos ouvem, os mortos são ressuscitados, e aos pobres está sendo pregado o evangelho” [Mt 11.5]; “Vinde a mim, todos os que estais cansados e sobrecarregados, e eu vos aliviarei” [Mt 11.28]).

Graça é um dom.6 Deus “dá maior graça... aos humildes” (Tg 4.6). “Todos nós temos recebido da sua plenitude e graça sobre graça” (Jo 1.16). É dito que os cristãos são “despenseiros da multiforme graça de Deus” (1 Pe 4.10). Mas isso não significa que a graça de Deus encontra-se à nossa disposição. Não possuímos a graça de Deus nem controlamos sua ação. Somos sujeitos à graça, nunca vice-versa.

Paulo contrastou freqüentemente a graça com a lei (Rm 4.16; 5.20; 6.14-15; Gl 2.21; 5.4). Contudo, ele foi cuidadoso em afirmar que a graça não anula as exigências morais da lei de Deus. Em vez disso, ela satisfaz a justiça da lei (Rm 6.14-15). De certo modo, a graça é para a lei o que os milagres são para a natureza. Ela se eleva acima da lei e realiza o que a lei não pode realizar (cf. Rm 8.3). Entretanto, a graça não invalida as exigências de justiça da lei; ela as confirma e valida-as (Rm 3.31). A graça tem sua própria lei, uma lei mais elevada, libertadora: “A lei do Espírito da vida, em Cristo Jesus, te livrou da lei do pecado e da morte” (Rm 8.2; cf. Tg 1.25). Observe que essa nova lei nos emancipa do pecado e da morte. Paulo foi claro quanto a isso: “Que diremos, pois? Permaneceremos no pecado, para que seja a graça mais abundante? De modo nenhum! Como viveremos ainda no pecado, nós os que para ele morremos?” (Rm 6.1-2). A graça reina por meio da justiça (Rm 5.21).

Há dois extremos a serem evitados no que diz respeito à graça. Devemos ter cuidado para não invalidar a graça através do legalismo (Gl 2.21) ou corrompê-la através da licenciosidade (Jd 4).

Dois tipos de graça

Os teólogos falam de graça comum e de graça especial. A graça comum é conferida à humanidade em geral. É a graça que refreia a expressão completa do pecado e abranda os efeitos destrutivos do pecado na sociedade humana. A graça comum impõe uma restrição moral no comportamento das pessoas, mantém uma aparência de ordem nos afazeres humanos, reforça o sentido de certo e errado por meio da consciência e do governo civil, capacita homens e mulheres a apreciarem a beleza e bondade e concede bênçãos de todos os tipos a todas as pessoas. Deus “faz nascer o seu sol sobre maus e bons e vir chuvas sobre justos e injustos” (Mt 5.45). Isso é graça comum.

A graça comum não é redentora. Ela não perdoa pecados nem purifica pecadores. Não renova o coração, não estimula a fé, nem possibilita a salvação. Pode convencer de pecado e instruir a alma sobre a verdade de Deus. Mas a graça comum sozinha não conduz à salvação eterna, porque o coração dos pecadores se posiciona firmemente contra Deus (Rm 3.10-18).

A graça especial, mais bem designada de graça salvífica, é a obra irresistível de Deus que livra homens e mulheres da punição e do poder do pecado, renovando a pessoa interior e santificando o pecador, por meio da ação do Espírito Santo. Normalmente, quando o Novo Testamento usa o termo graça, este se refere à graça salvífica.

Em todo este livro, quando falo sobre a graça, refiro-me a graça salvífica, a menos que especifique outro sentido.

A graça salvífica reina “pela justiça para a vida eterna” (Rm 5.21). A graça salva, santifica e glorifica a alma (Rm 8.29-30). Cada estágio do processo de salvação é governado por graça soberana. De fato, o termo graça no Novo Testamento é usado freqüentemente como sinônimo de todo o processo da salvação, em especial nas epístolas paulinas (cf. 1 Co 1.4; 2 Co 6.1; Gl 2.21). Paulo via toda a redenção como uma obra da graça de Deus e usava a palavra graça como um termo geral para se referir à totalidade da salvação. A graça dirige tudo que diz respeito à salvação, do começo ao fim. Ela nunca para antes de concluir seu trabalho, também nunca o estraga.

O que estamos realmente dizendo é que a graça é eficaz. Em outra palavras, a graça produz com certeza os resultados pretendidos. A graça de Deus sempre é eficaz. Essa verdade está arraigada nas Escrituras. Era um dos principais temas dos ensinos de Agostinho. A doutrina da graça eficaz é a base da soteriologia (o ensino sobre a salvação)7 reformada. Charles Hodges definiu a graça eficaz como “o grande poder de Deus”.

A teologia do não-senhorio é, fundamentalmente, uma negação da graça eficaz. A “graça” descrita na doutrina do não-senhorio não tem certeza de realização dos seus propósitos — e com frequência, segundo parece, ela não os realiza. Na graça da doutrina do não-senhorio, partes decisivas do processo de salvação — incluindo arrependimento, compromisso, rendição e santidade — são aspectos opcionais da experiência cristã, deixados por conta do próprio crente (cf. SGS 18). A fé do crente poderia até desgastarse até ao ponto de estrepitosa parada. Ainda assim, a graça da teologia do não-senhorio diz que não devemos concluir que “ele OU ela nunca foram crentes” (SGS 142). Então, o que devemos concluir? Que a graça salvífica não é eficaz? Essa é a única conclusão razoável que podemos tirar da teologia do não-senhorio: “O milagre da salvação em nossa vida, realizado pela graça, mediante a fé, sem obras, dá ampla provisão para a vida de boas obras à qual Deus nos designou, mas ela não garante isso” (AF 73-74, ênfase acrescentada).

Alguém poderia caracterizar legitimamente toda a controvérsia do senhorio como uma disputa acerca da graça eficaz. Em última análise, todos os pontos na discussão voltam-se para isto: a graça salvífica de Deus obtém inevitavelmente seus efeitos desejados? Se todos os lados pudessem chegar a um consenso nessa questão, o debate seria resolvido.

Graça soberana

De tudo isso, fica claro que a soberania de Deus na salvação está no centro do debate sobre o senhorio. A ironia é que o suposto Movimento da Graça nega todo o ensino sobre a graça: é Deus quem realiza completamente a obra salvífica nos pecadores. A redenção é por completo uma obra de Deus. Ele é plenamente soberano no exercício de sua graça; não está sujeito à vontade humana. “Pois ele diz a Moisés: Terei misericórdia de quem me aprouver ter misericórdia e compadecer-me-ei de quem me aprouver ter compaixão. Assim, pois, não depende de quem quer ou de quem corre, mas de usar Deus a sua misericórdia” (Rm 9.15-16).

Não entenda de modo errado: não ficamos inertes durante o processo, e a graça salvífica também não força as pessoas a crerem contra a sua vontade. Não é isso que graça irresistível significa. Graça não é coerção; mas, ao transformar o coração, a graça torna o crente completamente disposto a confiar e a obedecer.

As Escrituras deixam claro que cada aspecto da graça é obra soberana de Deus. Ele conhece OS eleitos de antemão e OS predestina (Rm 8.29), chama o pecador para Si mesmo (Rm 8.30), leva a alma a Cristo (Jo 6.44), realiza o novo nascimento (Jo 1.13; Tg 1.18), outorga o arrependimento (At 11.18) e a fé (Rm 12.3; At 18.27), justifica o crente (Rm 3.24; 8.30).8 Em nenhum estágio do processo, a graça é impedida pela falha humana, nem depende de méritos humanos ou está subjugada ao esforço humano. “Que diremos, pois, à vista destas coisas? Se Deus é por nós, quem será contra nós? Aquele que não poupou o seu próprio Filho, antes, por todos nós o entregou, porventura, não nos dará graciosamente com ele todas as coisas?” (Rm 8.31-32, ênfase acrescentada). Isso é graça.

Muitas pessoas lutam com o conceito de graça soberana, mas, se Deus não é soberano no exercício de sua graça, ela não é graça, de modo algum. Se os propósitos de Deus dependessem de uma resposta de fé originada por si mesma ou do mérito humano, Deus mesmo não seria soberano, e a salvação não seria uma obra completamente dEle. Se esse fosse o caso, os redimidos teriam algo de que se gloriar, e a graça não seria graça (Rm 3.27; Ef 2.9).

Além disso, por causa da depravação humana, não há nada no pecador caído e perverso que deseje Deus ou que seja capaz de responder com fé. Paulo escreveu: “Não há quem entenda, não há quem busque a Deus; todos se extraviaram, à uma se fizeram inúteis; não há quem faça o bem, não há nem um sequer. A garganta deles é sepulcro aberto; com a língua, urdem engano, veneno de víbora está nos seus lábios” (Rm 3.11-13). Observe as metáforas que envolvem morte. Esse é o estado de cada pessoa que ainda está no pecado. Como veremos em breve, as Escrituras ensinam que a humanidade pecaminosa está morta em delitos e pecados (Ef 2.1), “separados da comunidade de Israel e estranhos às alianças da promessa, não tendo esperança e sem Deus no mundo” (v. 12). Não há meios de fugir dessa situação infeliz, exceto pela soberana intervenção da graça salvífica de Deus.

Pela graça sois salvos

O texto clássico da salvação pela graça é Efésios 2.8-9: “Pela graça sois salvos, mediante a fé; e isto não vem de vós; é dom de Deus; não de obras, para que ninguém se glorie”. Vejamos esses versículos em seu contexto e tentemos compreender melhor como as Escrituras descrevem a salvação pela graça, mediante a fé no Senhor Jesus Cristo.

Em Efésios 1, o principal ensino de Paulo era a soberania de Deus em salvar graciosamente os eleitos. Ele escreveu que Deus nos escolheu (v. 4), nos predestinou (v. 5), garantiu nossa adoção (v. 5), nos concedeu sua graça (v. 6), nos redimiu (v. 7), derramou a riqueza de sua graça sobre nós (vv. 7- 8), desvendou-nos sua vontade (v. 9), adquiriu para nós uma herança (v. 11), garantiu que o glorificaría- mos (VV. 11-12), nos salvou (V. 13) e nos selou com O Espirito Santo (VV.13-14). Resumindo, Ele nos abençoou “com toda sorte de bênção espiritual nas regiões celestiais em Cristo” (V. 3). Tudo isso foi obra de sua graça soberana, realizada não por causa de qualquer bem que há em nós, mas apenas “segundo o beneplácito de sua vontade” (V. 5, cf. V.9) e “segundo o propósito daquele que faz todas as coisas conforme o conselho da sua vontade” (V. 11).

Agora, nos primeiros dez versículos de Efésios 2.1-10, Paulo registra o processo de salvação visto desde a eternidade:

Ele vos deu vida, estando vós mortos nos vossos delitos e pecados, nos quais andastes outrora, segundo o curso deste mundo, segundo o príncipe da potestade do ar, do espirito que agora atua nos filhos da desobediência; entre os quais também todos nós andamos outrora, segundo as inclinações da nossa carne, fazendo a vontade da carne e dos pensamentos; e éramos, por natureza, filhos da ira, como também os demais. Mas Deus, sendo rico em misericórdia, por causa do grande amor com que nos amou, e estando nós mortos em nossos delitos, nos deu vida juntamente com Cristo, - pela graça sois salvos, e, juntamente com ele, nos ressuscitou, e nos fez assentar nos lugares celestiais em Cristo Jesus; para mostrar, nos séculos vindouros, a suprema riqueza da sua graça, em bondade para conosco, em Cristo Jesus. Porque pela graça sois salvos, mediante a fé; e isto não vem de vós; é dom de Deus; não de obras, para que ninguém se glorie. Pois somos feitura dele, criados em Cristo Jesus para boas obras, as quais Deus de antemão preparou para que andássemos nelas.

Nesses versículos, o foco de Paulo está unicamente na obra de Deus em nos salvar, porque não há obra humana a ser considerada como parte do processo salvífico (VV. 8-9). Esses versículos descrevem nosso passado, presente e futuro como cristãos: o que éramos

(VV. 1-3), O que somos (VV. 4-6, 8-9) e O que seremos (VV. 7,1O). A passagem é um tratado sobre a salvação por senhorio. O apóstolo Paulo nomeia seis aspectos da salvação: Deus salva do pecado (VV. 1-3), salva por amor (V. 4), salva para a vida (V. 5), para a sua glória (VV. 6-7), mediante a fé (VV. 8-9), para praticarmos boas obras (V. 10).

Ela salva do pecado. Paulo escreveu: “Ele vos deu vida, estando vós mortos nos vossos delitos e pecados, nos quais andastes outrora, segundo O curso deste mundo, segundo O príncipe da potestade do ar, do espírito que agora atua nos filhos da desobediência; entre os quais também todos nós andamos outrora, segundo as inclinações da nossa carne, fazendo a vontade da carne e dos pensamentos; e éramos, por natureza, filhos da ira, como também os demais” (2.1-3). Talvez não haja nas Escrituras uma declaração mais sucinta sobre a depravação total e O estado de perdição da humanidade pecadora.

Visto que nascemos em pecado, nascemos para a morte: “Porque O salário do pecado é a morte” (Rm 6.23). As pessoas não se tornam espiritualmente mortas porque pecam; elas são pecadoras “por natureza” (Ef 2.3) e, portanto, nascem sem vida espiritual. Como estávamos mortos para Deus, estávamos mortos para a verdade, a justiça, a paz, a felicidade e cada outra coisa boa. Éramos tão incapazes de responder a Deus como um cadáver é incapaz de responder a alguma pessoa.

Numa tarde, bem no início de meu ministério na Grace Community Church, ouvi batidas frenéticas na porta de meu escritório. Abri a porta e vi um menino sem fôlego, chorando. Com uma voz de quem estava em pânico, ele perguntou: “Você é O reverendo?” Quando eu disse que sim, ele falou: “Depressa! Por favor, venha comigo”. Era óbvio que algo terrível havia acontecido, corri com ele até sua casa, a meio quarteirão de distância, no outro lado da rua da igreja.

Dentro de casa, a mãe do menino chorava incontrolavelmen-te. Ela dizia: “Meu bebê está morto! Meu bebê está morto!” Ela me levou rapidamente a um quarto nos fundos. Na cama, jazia O corpo débil de uma pequena criança. Evidentemente, ele havia morrido durante o sono. O corpo estava azul, e, quando o tocamos, sentimos que estava frio. A mãe havia tentado desesperadamente reavivá-lo, mas nada podia ser feito: a criança havia morrido. Não havia absolutamente nenhum sinal de vida. A mãe segurava ternamente o pequenino corpo, beijava-o, tocava com ternura o seu rosto, falava com ele e chorava sobre ele. Entretanto, a criança não reagia. Uma equipe de paramédicos chegou e tentou fazê-la voltar a respirar; era tarde demais. Nada fazia efeito. Não havia resposta porque não existia vida. Nem mesmo o poderoso amor de uma mãe, que estava com o coração partido, podia suscitar uma reação.

A morte espiritual é exatamente assim. Pecadores não-re-generados não têm vida com a qual podem responder a estímulos espirituais. Nenhuma quantidade de amor, de súplica ou de verdade espiritual pode provocar uma resposta. Pessoas que estão sem Deus são mortos ingratos, zumbis espirituais, mortos ambulantes, incapazes até de entender a gravidade de sua situação. São inanimadas. Podem até agir como se estivessem vivas, mas não possuem vida. Estão mortas, mesmo enquanto vivem (cf. 1 Tm 5.6).

Antes da salvação, todo cristão estava precisamente nessa mesma situação terrível. Nenhum de nós respondia a Deus ou a sua verdade. Estávamos “mortos nos... [nossos] delitos e pecados” (Ef 2.1). Estávamos “mortos em nossos delitos” (v. 5). “Delitos e pecados” não se referem a atos específicos. Descrevem a esfera de existência da pessoa sem Deus, o reino em que os pecadores vivem. É a noite eterna dos mortos vivos. Todos os seus habitantes são totalmente depravados.

Depravação total não significa que o estilo de vida de cada pessoa é igualmente corrupto ou perverso ou que pecadores são sempre tão maus quanto podem ser. Significa que a humanidade é corrupta em cada aspecto. Os não-redimidos são depravados em sua mente, seu coração, sua vontade, suas emoções e seu físico. São completamente incapazes de fazer qualquer coisa além de pecar, Ainda que realizem atos humanitários, filantrópicos ou religiosos, eles o fazem para sua própria glória, e não para a glória de Deus (cf, 1 Co doji), Os pecadores talvez não pequem sempre de modo tão grosseiro quanto é possível, mas não conseguem fazer qualquer coisa que agrade a Deus ou que mereça o seu favor, O pecado manchou cada aspecto do ser deles, Isso é o que significa estar espiritualmente morto,

Centenas de cadáveres no necrotério podem estar em fases diferentes de decomposição, mas todos estão igualmente mortos, A depravação, como a morte, é manifesta de muitas maneiras diferentes, mas, assim como a morte em si mesma não tem graus diferentes de intensidade, a depravação é sempre absoluta, Nem todas as pessoas são abertamente tão más quanto poderiam ser, mas todas estão igualmente mortas em pecados,

Como é a existência de pessoas que se encontram nesse estado de morte espiritual? Elas andam “segundo o curso deste mundo, segundo o príncipe da potestade do ar, do espírito que agora atua nos filhos da desobediência” (Ef 2,2), Satanás é “o príncipe da potestade do ar”, Ele governa o reino do pecado e da morte (“este mundo”), em que agem os não-redimidos, É um reino que se caracteriza por diferentes religiões, sistemas morais e padrões de comportamento, aparentemente rivais, mas, em última análise, estão todos sob o controle e domínio do diabo, “O mundo inteiro jaz no Maligno” (1 Jo 5,19),

Assim, os não-redimidos — quer percebam, quer não — têm um senhor em comum, “o príncipe da potestade do ar”, Satanás é o archo (o príncipe), Ele é o príncipe deste mundo e reinará até que o Senhor o expulse (Jo 12,31), Todos aqueles que estão nesse reino de pecado e morte vivem sob domínio de Satanás, compartilham de sua natureza, são conspiradores na sua rebelião contra Deus e respondem naturalmente à sua autoridade, Estão na mesma condição espiritual. Jesus chama O Diabo de pai daqueles que se encontram sob O seu senhorio (JO 8.44).

Observe que os não-salvos são “por natureza, filhos da ira” (Ef 2.3). As pessoas não são todas filhas de Deus, como alguns gostam de dizer. Aqueles que não receberam a salvação por meio de Jesus Cristo são inimigos de Deus (Rm 5.10; 8.7; Tg 4.4). São não somente “filhos da desobediência”, mas também, consequentemente, “filhos da ira” — objetos da condenação eterna de Deus.

O propósito de Paulo em Efésios 2.1-3 não é mostrar como vivem as pessoas não-salvas — embora O ensino seja valioso para cumprir esse propósito — e sim lembrar os crentes como eles viviam antes. Todos nós andávamos, “outrora, segundo as inclinações da nossa carne, fazendo a vontade da carne e dos pensamentos; e éramos, por natureza, filhos da ira, como também os demais” (v. 3, ênfase acrescentada). O reino do pecado e da morte é uma experiência passada para O crente. Éramos desesperadamente sujeitos ao mundo, à carne e ao diabo (vv. 2-3). Outrora andávamos como filhos da desobediência (v. 2). Estávamos mortos em delitos e pecados (v. 1). Agora, tudo isso está no passado.

Embora tenhamos sido como O restante da humanidade, pela graça de Deus não mais somos assim. Por causa de sua obra salvífica em nós, somos atual e eternamente redimidos. Fomos libertos da morte espiritual, do pecado, da inimizade com Deus, da desobediência, do controle do Diabo, da lascívia e do juízo divino (vv. 1-3). Isso é O que a fé salvífica realiza.

A salvação é por amor.

“Mas Deus, sendo rico em misericórdia, por causa do grande amor com que nos amou... nos deu vida juntamente com Cristo” (vv. 4-5). A misericórdia de Deus é “rica”, imensurável, superabundante, copiosa, ilimitada. Alguns que lutam com O conceito de graça sobera- na acreditam que Deus é injusto por eleger alguns e não salvar todos. Isso é exatamente o oposto do pensamento correto. A verdade é que todos merecem o inferno. Deus, em sua graça, escolhe salvar alguns. Ninguém seria salvo sem a graça soberana de Deus. O que impede pecadores de reconciliarem-se com Deus não é uma deficiência de misericórdia ou graça da parte de Deus. É o pecado que impede; e o pecado é um problema. Rebelião e rejeição fazem parte da natureza de todo pecador.

As duas palavras “mas Deus” afirmam que a iniciativa de salvar é toda de Deus. Por ser rico em misericórdia e por causa de seu grande amor para conosco, Deus interveio e providenciou uma maneira, pela graça, de retornarmos a Ele.

Deus é intrinsecamente bom, misericordioso e amoroso. O amor é tão integrante da natureza de Deus, que o apóstolo João escreveu: “Deus é amor” (1 Jo 4.8, 16). Em seu amor, Ele alcança seres humanos pecadores, corruptos, pobres, condenados, espiritualmente mortos e os abençoa com toda sorte de bênção espiritual nas regiões celestiais em Cristo (Ef. 1.3).

Deus ama bastante não somente para perdoar aqueles que o ofenderam, mas também para dar seu Filho para morrer por eles. “Deus amou ao mundo de tal maneira que deu o seu Filho unigênito, para que todo o que nele crê não pereça, mas tenha a vida eterna” (Jo 3.16). “Ninguém tem maior amor do que este: de dar alguém a própria vida em favor dos seus amigos” (Jo

15.13). O amor de Deus por aqueles que não o merecem torna a salvação possível, enchendo-a com toda sorte de misericórdia. É o epitome da graça soberana.

A salvação é para a vida.

“Estando nós mortos em nossos delitos, [Deus] nos deu vida juntamente com Cristo” (Ef 2.5). A salvação começa no momento em que Deus outorga vida espiritual a uma pessoa morta. É Deus que realiza o primeiro movimento. Jesus disse: “Ninguém pode vir a mim se O Pai, que me enviou, não o trouxer” (Jo 6.44). É claro! Os não-salvos estão mortos, incapazes de qualquer atividade espiritual. Até que Deus nos vi-vifique, não temos capacidade de responder a Ele com fé.

Quando os pecadores são salvos, não permanecem mais afastados da vida de Deus. Tornam-se espiritualmente vivos mediante a miraculosa união com Cristo, que é realizada por Deus. Tornam-se sensíveis a Deus pela primeira vez. Paulo chama isso de “novidade de vida” (Rm 6.4). Agora eles entendem as verdades espirituais e desejam as coisas espirituais (1 Co 2.10- 16). Eles se tornaram co-participantes da natureza divina (2 Pe 1.4). Podem buscar a piedade — as “coisas lá do alto” — em vez das coisas “que são aqui da terra” (Cl 3.2).

Essa nova vida está “em Cristo Jesus” (Ef 2.6). Ele é nossa vida (Cl 3.4). “Com ele viveremos” (Rm 6.8), na semelhança de sua ressurreição (6.5). Nossa nova vida é, na verdade, a vida dele vivida em nós (Gl 2.20). Ela é completamente diferente de nossa vida anterior, é a suprema manifestação da graça soberana de Deus.

A salvação é para a glória de Deus.

“E, juntamente com ele, nos ressuscitou, e nos fez assentar nos lugares celestiais em Cristo Jesus; para mostrar, nos séculos vindouros, a suprema riqueza da sua graça, em bondade para conosco, em Cristo Jesus” (Ef 2.6- 7). A salvação tem um propósito específico: que desfrutemos da glória de

Cristo e a manifestemos, tornando conhecidas as riquezas da sua glória (cf. Rm 9.23).

Nossa cidadania está no Céu (Fp 3.20). Deus nos ressuscita com Cristo e nos faz assentar com Ele em lugares celestiais. Não pertencemos mais a este mundo ou à sua esfera de pecaminosidade e rebelião. Somos resgatados da morte espiritual e das consequências de nosso pecado. Isso é pura graça.

Perceba que O apóstolo descreve esta vida celestial como se já estivesse plenamente realizada. Embora ainda não tenhamos posse completa de tudo que Deus tem para nós em Cristo, vivemos em seu domínio, assim como vivíamos anteriormente no reino do pecado e da morte. “Lugares celestiais” implica claramente O pleno do domínio de Deus. Essa expressão não pode ser lida de uma maneira que faz O senhorio de Cristo parecer opcional. Habitar no domínio celestial é desfrutar de plena comunhão com Deus. Porque habitamos neste reino, desfrutamos da proteção de Deus, de sua provisão cotidiana, de todas as bênçãos de seu favor. Mas não habita ali aquele que ainda vive segundo O curso deste mundo, segundo O príncipe da potestade do ar e sob O controle do espírito que agora atua nos filhos da desobediência. Não somos mais filhos da ira, e sim “filhos de Deus” (JO 1.12; 1 JO 3.1) e cidadãos do céu (Ef 2.19).

Assim como no antigo reino de pecado e morte estávamos sujeitos ao príncipe da potestade do ar (v. 2), assim, no novo reino, seguimos um novo Senhor. Assim como éramos “por natureza, filhos da ira” (v. 3) e “filhos da desobediência” (v. 2), agora temos, por natureza, “vida juntamente com Cristo” (v. 5).

O propósito supremo de Deus em nossa salvação é exaltar sua graça soberana, “para mostrar, nos séculos vindouros, a suprema riqueza da sua graça, em bondade para conosco, em Cristo Jesus” (v. 7). Então, nosso Pai amoroso glorifica-se a si mesmo enquanto nos abençoa. Sua graça é a parte mais bela de sua glória. Desde O primeiro momento da salvação até aos “séculos vindouros”, nunca deixamos de beneficiar-nos da graça e da bondade de Deus para conosco. Em nenhum momento, a graça pára, e O esforço humano assume.9

A salvação é pela fé.

“Porque pela graça SOÍS salvos, mediante a fé; e isto não vem de vós; é dom de Deus; não de obras, para que ninguém se glorie” (2.8-9). Fé é a nossa resposta, e não a causa da salvação. Nem mesmo a fé “vem de” nós mesmos, está incluída no “dom de Deus”.

Alguns defensores da doutrina do não-senhorio contestam essa interpretação.10 11 Eles argumentam que o vocábulo “fé” (pistis) é feminino, enquanto o vocábulo “isto” (touto) é neutro. No aspecto gramatical do texto, o pronome “isto” não tem um antecedente claro. Ele se refere não ao substantivo fé, mas, provavelmente, ao ato (subentendido) de crer. Pode se referir a toda a salvação.

De um modo ou de outro, não há como evitar o significado; fé é um dom gracioso de Deus. Jesus afirmou explicitamente essa verdade, quando disse; “Ninguém poderá vir a mim, se, pelo Pai, não lhe for concedido” (Jo 6.65). Também achamos referências à fé como um dom de Deus em Atos 3.16; “A fé que vem por meio de Jesus deu a este saúde perfeita na presença de todos vós”; Filipenses 1.29; “Porque vos foi concedida a graça de padecerdes por Cristo e não somente de crerdes nele”; e 2 Pedro 1.1; “Simão Pedro, servo e apóstolo de Jesus Cristo, aos que conosco obtiveram fé igualmente preciosa”.11

O termo “não por obras” não expressa um contraste entre a fé e o arrependimento, entre a fé e o compromisso ou entre a fé e a rendição. De fato, a questão aqui não é tão simples como fé versus circuncisão, ou fé versus batismo. O contraste é entre a graça divina e o mérito humano.

O esforço humano não pode trazer salvação. Somos salvos apenas pela graça, tão-somente por meio da fé em Cristo. Quando abandonamos toda esperança, e nos rendemos à fé em Cristo e sua obra completa em nosso favor, estamos agindo pela fé que Deus, em sua graça, provê. Por conseguinte, crer é o primeiro ato de um morto espiritual ressuscitado; é o novo homem respirando pela primeira vez. Visto que a fé é infalível, o homem espiritual continua respirando.

É óbvio que, se a salvação é totalmente pela graça de Deus, ela não pode ser resultado de obras. O esforço humano nada tem a ver com a obtenção ou a manutenção da salvação (cf. Rm 3.20; Gl 2.16). Ninguém deve-se gloriar como se tivéssemos qualquer parte em realizá-la (cf. Rm 3.27; 4.5; 1 Co 1.31).

Mas não podemos parar aqui, pois há mais um ensino crucial na linha de raciocínio de Paulo - a tese mais importante para a qual ele vinha construindo.

A salvação é para fazermos boas obras.

“Pois somos feitura dele, criados em Cristo Jesus para boas obras, as quais Deus de antemão preparou para que andássemos nelas” (2.10). Esse é um versículo que a teologia do não-senhorio não pode explicar adequadamente. Muitos livros sobre a doutrina do não-senhorio simplesmente o ignoram. Mas, sem o versículo 10, não temos o quadro completo do que Paulo está dizendo sobre a nossa salvação.

Não podemos enfatizar demais que as obras não desempenham nenhum papel na obtenção da salvação. Entretanto, as boas obras têm tudo a ver com o viver a salvação. Nenhuma boa obra pode merecer a salvação, porém muitas boas obras resultam da salvação genuína. As boas obras não são necessárias para nos tornarmos um discípulo, mas são as marcas necessárias de todos os discípulos verdadeiros; afinal de contas, Deus ordenou que andássemos nelas.

Observe que, antes de podermos fazer qualquer boa obra para o Senhor, Ele faz sua boa obra em nós. Pela graça de Deus, nos tornamos “feitura dele, criados em Cristo Jesus para boas obras”. A mesma graça que nos tornou vivos com Cristo e nos ressuscitou com Ele nos capacita a fazer as boas obras para as quais Ele nos salvou.

Perceba também que foi Deus que “preparou” essas boas obras. Não ficamos com nenhum crédito por elas. Mesmo nossas boas obras são obras da graça de Deus. No capítulo anterior, nós as chamamos de “obras de fé”. Também seria apropriado chamá-las de “obras da graça”. Elas são as evidências que corroboram a verdadeira salvação. Essas obras, como cada aspecto da salvação divina, são o produto da graça soberana de Deus.

Boas ações e atitudes justas são intrínsecas ao que somos enquanto cristãos. Elas procedem da própria natureza de quem vive no reino celeste. Assim como os não-salvos são pecadores por natureza, os redimidos são justos por natureza. Paulo disse aos crentes de Corinto que a graça abundante de Deus oferecia suficiência supera-bundante que os equipava para “toda boa obra” (2 Co 9.8). Ele disse a Tito que Cristo “a si mesmo se deu por nós, a fim de remir-nos de toda iniqüidade e purificar, para si mesmo, um povo exclusivamente seu, zeloso de boas obras” (Tt 2.14, ênfase acrescentada).

Lembre que a mensagem principal de Paulo em Efésios 2 não é evangelística. Ele estava escrevendo para crentes, muitos dos quais haviam sido convertidos a Cristo anos antes. O objetivo de Paulo não era dizer-lhes como serem salvos, e sim lembrar-lhes como haviam sido salvos, para que pudessem ver como a graça deve operar na vida dos redimidos. A frase “somos feitura dele” é a chave de toda esta passagem.

A palavra grega traduzida por “feitura” é poiema, da qual temos a nossa palavra poema. Nossa vida é como um soneto divinamente escrito, uma obra-prima literária. Desde a eternidade passada, Deus nos designou para sermos iguais à imagem de seu Filho (Rm 8.29).

Todos nós ainda somos imperfeitos, obras de arte não concluídas, que estão sendo trabalhadas cuidadosamente pelo Mestre divino. Ele ainda não terminou sua obra em nós, e seu trabalho não cessará até que nos tenha transformado na perfeita semelhança de seu Filho (1 Jo 3.2). A energia que Ele usa para realizar sua obra é a graça. Às vezes, o processo é lento e árduo; às vezes, é imediatamente triunfante. Em ambos os casos, “Estou plenamente certo de que aquele que começou boa obra em vós há de completá-la até ao Dia de Cristo Jesus” (Fp 1.6).

Graça barata? De modo nenhum. Nada que diz respeito à graça verdadeira é barato. Custou a Deus o seu Filho. Seu valor é inestimável. Seus efeitos são eternos. Mas ela é gratuita — concedida gratuitamente no Amado (Ef 1.6) — e abundante sobre muitos (Rm 5.15), elevando-nos àquele reino celeste no qual Deus ordenou que andássemos.

<3^si

Capítulo 5

Bonhoeffer, Dietrich. The cost of discipleship. New York: Collier, 1959. p. 45-47.

Ibid. p. 45-46.

TOZER, A. W. The knowledge of the Holy. New York: Harper & Row, 1961. p. 100.

BERKHOF, Louis. Systematic Theology. Grand Rapids, Mich.: Eerdmans, 1939. p. 427.

Ibid.

Isso é contrário à alegação imprecisa de Zane Hodges: “É inerentemente contraditório falar de ‘graça' aqui como o ‘dom de Deus'. A concessão de um dom é um ato de ‘graça'. Entretanto, ‘graça', quando vista como um princípio ou base de ação divina, nunca é mencionada como um ‘dom' ou parte de um dom” (AF 219). A Escritura está cheia de afirmações que contradizem essa declaração: “O Senhor dá graça e glória; nenhum bem sonega aos que andam retamente” (Sl 84.11); “dá graça aos humildes” (Pv 3.34); “dá maior graça” (Tg 4.6); “resiste aos soberbos, contudo, aos humildes concede a sua graça” (1 Pe 5.5; cf. também Rm 15.15; 1 Co 1.4; 3.10; Ef 4.7).

Isso explica porque os teólogos reformados, sem exceção, concordam quanto à salvação por senhorio. Muitos deles consideram tolos os argumentos do ensino do não-senhorio porque entendem, corretamente, que fé, arrependimento, rendição e santidade são parte da graciosa obra salvífica de Deus.

www.gty.org

Nesses comentários, não estou sugerindo explicitamente uma ordo salutis ou ordem de salvação. Muito tem sido escrito sobre a ordo salutis; e está além do escopo de meus propósitos neste livro lidar com a questão. Uma das melhores obras sobre o assunto é Saved by Grace, escrita por Anthony A. Hoekema.

Hoekema mostra que salvação não é tanto uma série de passos sucessivos como uma aplicação simultânea de vários aspectos da graça salvífica. A ordo salu-tis deve ser primeiramente um arranjo lógico e não cronológico, pois, no mesmo momento em que somos regenerados, somos convertidos, nos arrependemos, cremos, somos justificados, santificados e iniciamos uma vida de fé e obediência que perseverará até à glorificação.

No sentido mais amplo, a regeneração, ou o novo nascimento, é um termo usado às vezes como sinônimo de salvação (Tt 3.5; cf. Jo 3.3, 5, 7; 1 Pe 1.23). Em seu sentido teológico específico, regeneração é a obra do Espírito Santo que concede vida nova ao pecador. A palavra nunca é usada no Novo Testamento como uma ação limitada da parte de Deus, anterior à fé, uma ação que pode ser separada como um acontecimento autônomo ou uma comodidade independente. Do ponto de vista da razão, a regeneração deve logicamente dar início à fé e ao arrependimento. Entretanto, o processo da salvação é uma ocorrência única, instantânea.

No que diz respeito a isso, o argumento crucial a ser estabelecido é que a regeneração anula a possibilidade de que a santificação, a consagração, o batismo do Espírito ou qualquer outro aspecto da conversão sejam consideradas experiências de segundo nível. Nenhuma fase da conversão é preterida ou oferecida como uma segunda obra da graça.

Uma das maiores falhas na teologia do não-senhorio é a sua tendência de achar que a graça opera apenas na justificação e de considerar as obras como fundamento da santificação. Zane Hodges ensina que “o dom da vida, que Deus outorga”, e o “potencial” para a santificação são dons “absolutamente gratuitos” da graça. “Mas, a partir desse ponto”, o crescimento, o produzir frutos e a santificação prática exigem árduo esforço humano (AF 74).

Charles Ryrie pode ser uma exceção neste ponto. Em determinado lugar, ele reconhece que “toda a salvação, incluindo a fé, é dom de Deus” (SGS 96). Infelizmente, ele menciona essa realidade crucial apenas como “uma interessante luz lateral” e não trata das implicações dela em seu sistema.

Faça um contraste com a declaração de Zane Hodges; “A Bíblia nunca afirma que a fé salvífica é, por si mesma, um dom” (AF 219).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Bonhoeffer chama de graça barata o perdão que não exige arrependimento nem desejo real de ser resgatado do pecado; ao olhar para como você recebe a graça de Deus, ela tem realmente transformado a sua vida ou virou uma desculpa para continuar como você sempre foi?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor afirma que a verdadeira graça é Deus trabalhando presentemente em você, educando-o a renegar a impiedade e a viver de modo piedoso; que evidências dessa graça operante você consegue ver agindo em você hoje?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele compara o pecador não regenerado a um morto incapaz de qualquer resposta espiritual; lembrando o que Deus fez por você, a sua vida demonstra que você passou da morte para a vida, ou você apenas age como se estivesse vivo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pela Fé Somente$t$, 6,
$conteudo$A diferença entre Roma e a Reforma pode ser vista nestas fórmulas simples:

Visão Romana Visão Protestante

fé + obras = justificação fé = justificação + obras

Nenhum dos posicionamentos elimina as obras. A visão protestante elimina o mérito humano. Ela reconhece que, embora as obras sejam evidência ou fruto da fé verdadeira, elas nada contribuem ou nada acrescentam à base meritória de nossa redenção.

O debate atual da doutrina de “senhorio/salvação” deve ser cuidadoso em proteger dois limites. Por um lado, é importante enfatizar que a fé verdadeira produz frutos verdadeiros. Por outro lado, é vital realçar que o único mérito que nos salva é o mérito de Cristo recebido pela fé somente.

R. C. SPROUL1

Por volta do ano 1500, um monge meticuloso que, segundo seu próprio testemunho, “odiava a Deus” estava estudando a Epístola de Paulo aos Romanos. Ele não conseguia passar da primeira metade de Romanos 1.17: “A justiça de Deus se revela no evangelho, de fé em fé”. E escreveu:

Desejava intensamente compreender a Epístola de Paulo aos Romanos, e nada além da seguinte expressão ficava em meu caminho: “A justiça de Deus”, porque considerei que ela significava a justiça pela qual Deus é justo e pune o injusto de forma justa. Minha situação era que, embora eu fosse um monge irrepreensível, estava diante de Deus como um pecador de consciência perturbada e não tinha confiança de que meu mérito a aliviaria. Portanto, eu não amava um Deus justo e irado, em vez disso, odiava e murmurava contra Ele. Contudo, apegava-me ao querido Paulo e tinha grande desejo de saber o que ele queria dizer.2

Uma simples verdade bíblica mudou a vida daquele monge — e deu início à Reforma Protestante. Foi a compreensão de que a justiça de Deus poderia se tornar a justiça do pecador — e isso poderia acontecer por meio da fé. Martinho Lutero descobriu a verdade no mesmo versículo em que tropeçara - Romanos 1.17: “A justiça de Deus se revela no evangelho, de fé em fé, como está escrito: O justo viverá por fé” (ênfase acrescentada). Lutero sempre tinha visto “a justiça de Deus” como um atributo do soberano Senhor, mediante o qual Ele julgava os pecadores — não um atributo que os pecadores poderiam possuir. Ele descreveu a descoberta que pôs fim à era das trevas.

Vi a conexão entre a justiça de Deus e a afirmação de que “o justo viverá por fé”. Então, compreendi que a justiça de Deus é aquela pela qual, mediante graça e absoluta misericórdia, Deus nos justifica por meio da fé. Nisso, senti haver nascido de novo e entrado, pelas portas abertas, até ao paraíso. Toda a Escritura assumiu um novo significado. E, se antes a “justiça de Deus" me enchera de ódio, ela se tornou para mim indizivelmente agradável, em imenso amor. Essa passagem de Paulo se tornou para mim um portão para o céu.3

A justificação pela fé foi a grande verdade que resplandeceu em Lutero e alterou dramaticamente a igreja. Também é a doutrina que traz equilíbrio à posição da salvação por senhorio. Os críticos alegam com freqüência que a salvação por senhorio é salvação por obras. A justificação pela fé é a resposta a essa acusação.

Visto que os cristãos são justificados pela fé somente, sua posição diante de Deus não está, de algum modo, relacionada ao mérito pessoal. Boas obras e santidade prática não oferecem razão para a aceitação da parte de Deus. Ele recebe como justos aqueles que crêem não por causa de qualquer coisa boa que vê neles — nem mesmo por causa de sua própria obra santificadora na vida deles — mas unicamente por causa da justiça de Cristo, atribuída a eles. “Mas, ao que não trabalha, porém crê naquele que justifica o ímpio, a sua fé lhe é atribuída como justiça” (Rm 4.5) - isso é justificação.

Declarado justo: o que muda realmente?

Em seu sentido teológico, a justificação é um termo forense ou puramente legal. Ele descreve o que Deus declara sobre o crente, e não o que Ele faz para mudar o crente. De fato, a justificação não efetua qualquer mudança real na natureza ou caráter do pecador. A justificação é um decreto judicial da parte de Deus. Ela muda apenas nossa posição legal, mas possui ramificações que garantem que outras mudanças seguirão.

Decretos forenses como este são bastante comuns na vida cotidiana.

Por exemplo, quando casei, Patricia e eu ficamos diante do pastor (meu pai) e fizemos nossos votos. Quase ao fim da cerimônia, meu pai declarou: “Pela autoridade a mim conferida pelo Estado da Califórnia, agora eu os declaro marido e mulher”. De imediato, nos tornamos legalmente marido e mulher. Segundos antes éramos um casal de noivos, agora estávamos casados. Nada dentro de nós mudou realmente quando aquelas palavras foram ditas, mas a nossa posição legal mudou diante de Deus, da lei, de nossa família e amigos. As implicações daquela simples declaração têm sido vitalícias e transformadoras da vida (pelo que sou grato). Mas, quando meu pai disse aquelas palavras, elas eram apenas uma declaração legal.

Semelhantemente, quando o primeiro jurado lê o veredicto, o réu não é mais “o acusado”. Legal e oficialmente, ele se torna, de imediato, inocente ou culpado — dependendo do veredicto. Nada muda em sua natureza, mas, se ele não for considerado culpado, sairá da corte como um homem livre aos olhos da lei, plenamente justificado.

Em termos bíblicos, a justificação é um veredicto divino de “não culpado — plenamente justo”. É a inversão da atitude de Deus para com o pecador. Antes Ele condenava, agora defende. Embora o pecador tenha vivido antes sob a ira de Deus, agora, sendo crente, ele está sob a bênção de Deus. Justificação é mais do que simples perdão; sozinho, o perdão ainda deixaria o pecador sem mérito diante de Deus. Então, quando Deus justifica, Ele imputa a sua justiça ao pecador (Rm 4.22-25). Assim, o mérito infinito de Cristo torna-se a base sob qual o crente se posiciona diante de Deus (Rm 5.19; 1 Co 1.30; Fp 3.9). Assim, a justificação eleva o crente a um reino de plena aceitação e privilégio divino em Jesus Cristo.

Portanto, por causa da justificação, os crentes são perfeita-mente libertados de qualquer acusação de culpa (Rm 8.33) e, além disso, têm o pleno mérito de Cristo atribuído a eles (Rm 5.17). Na justificação, somos adotados como filhos e filhas (Rm 8.15); tornamo-nos co-herdeiros com Cristo (V. 17); somos unidos com Cristo de modo que nos tornarmos um com Ele (1 Co 6.17); desse momento em diante, estamos “em Cristo” (Gl 3.27), e Ele, em nós (Cl 1.27). Todas essas realidades são forenses e procedem da justificação.

Em que a justificação e a santificação são diferentes

A justificação distingue-se da santificação pelo fato de que na justificação Deus não torna o pecador justo; Ele declara aquela pessoa justa (Rm 3.28; Gl 2.16). A justificação imputa a justiça de Cristo ao pecador (Rm 4.11b); a santificação concede justiça ao pecador, de modo pessoal e prático (Rm 6.1- 7; 8.11-14). A justificação acontece fora dos pecadores e muda sua posição (Rm 5.1-2); a santificação é interior e muda o estado do crente (Rm 6.19). A justificação é um acontecimento, a santificação, um processo. As duas devem ser diferenciadas, mas nunca podem ser separadas.

Por que distingui-los? Se a justificação e a santificação se relacionam tão intimamente, que não podemos ter uma sem a outra, por que nos preocuparmos em defini-las de modos diferentes?

Essa pergunta era o assunto central entre Roma e os reformadores no século XVI.

A justificação na doutrina católica romana

O catolicismo romano mistura suas doutrinas de santificação e de justificação. A teologia católica vê a justificação como uma infusão da graça que torna o pecador justo. Na teologia católica, o fundamento da justificação é algo tornado bom dentro do pecador — e não a justiça imputada de Cristo.

O Concilio de Trento, a resposta de Roma à Reforma, proferiu um anátema contra qualquer um que dissesse “que O [pecador] é justificado pela fé somente — se isto diz que nada mais é requerido como meio de cooperação na aquisição da graça da justificação”.4 O concilio católico determinou que a “justificação... não é meramente remissão de pecados, mas também a santificação e a renovação do homem interior, mediante o recebimento voluntário da graça e dos dons por meio dos quais os homens passam de injustos a justos”.5 Portanto, a teologia católica confunde os conceitos de justificação e santificação, substituindo a justiça de Cristo pela justiça do crente.

Esta diferença entre a igreja romana e os reformadores não é exemplo de uma distinção sutil. A corrupção da doutrina da justificação resulta em muitos outros erros teológicos graves. Se a santificação está incluida na justificação, isso significa que a justificação é um processo, e não um acontecimento. Isso torna a justificação progressiva, não completa. A posição de alguém diante de Deus é, por isso mesmo, baseada em experiência subjetiva, e não assegurada por uma declaração objetiva. Portanto, a justificação pode ser experimentada e, depois, perdida. A certeza da salvação nesta vida torna-se praticamente impossivel, porque a segurança não pode ser garantida. Em última análise, o fundamento da justificação é a própria virtude do pecador continuamente presente, e não a perfeita justiça de Cristo e sua obra expiatória.

Na Reforma, esses assuntos foram violentamente debatidos, e as linhas foram claramente traçadas. Até hoje, a teologia reformada defende a doutrina biblica da justificação pela fé, em contrário à opinião da igreja romana da justificação por obras/mérito.

A Justificação no Ensino da Reforma

OS DEFENSORES DA TEOLOGIA DO NÃO-SENHORIO SUGEREM COM FREQÜÊNCIA QUE A

SALVAÇÃO POR SENHORIO É MAIS CONSONANTE COM O CATOLICISMO ROMANO DO

QUE COM O ENSINO DA REFORMA. UM SINCERO DEFENSOR DA VISÃO DA DOUTRINA

DO NÃO-SENHORIO RADICAL TEM PROCLAMADO REPETIDAS VEZES QUE A SALVAÇÃO

POR SENHORIO NÃO ESTÁ “PREPARANDO UM CAMINHO DE RETORNO A WITTENBERG,

E SIM A ROMA”.6

Essa sugestão ignora tanto a história da igreja como as verdadeiras questões no debate atual sobre a salvação por senhorio. Não conheço nenhum defensor da teologia da salvação por senhorio que negue a doutrina da justificação pela fé. Em vez disso, essa teologia representa uma recusa em divorciar a justificação e a santificação. Nisso estamos de acordo com todos os reformadores mais expressivos.

O ensino da Reforma era claro nesta questão. Calvino, por exemplo, escreveu:

Cristo... não justifica o homem sem também santificá-lo. Essas bênçãos estão ligadas por um vínculo perpétuo e indissolúvel. Aqueles que Cristo ilumina com sua sabedoria, a esses Ele redime; e aqueles que Ele redime, a esses justifica; e, aqueles que Ele justifica, a esses santifica. Entretanto, como a questão diz respeito apenas à justificação e à santificação, limitemonos a elas. Embora façamos distinção entre essas doutrinas, ambas - a justificação e a santificação - se acham em Cristo. Você deseja obter a justificação em Cristo? Primeiro, você precisa ter a Cristo, mas não pode têlo sem que tenha sido feito participante de sua santificação, pois Cristo não está dividido. Portanto, visto que o Senhor não nos garante o gozo dessas bênçãos sem nos dar a si mesmo, Ele concede ambas de uma vez; nunca as dá separadamente. Assim, torna-se evidente como é verdade que não somos justificados sem as obras, mas, também, não por causa delas, uma vez que, no participarmos de Cristo, pelo que somos justificados, não há menos santificação do que justificação.7

Em outra de suas obras, comentando Tiago 2.21-22 (“Não foi por obras que Abraão, o nosso pai, foi justificado, quando ofereceu sobre o altar o próprio filho, Isaque? Vês como a fé operava juntamente com as suas obras; com efeito, foi pelas obras que a fé se consumou”), Calvino acrescentou:

Parece certo que ele está falando da manifestação, e não da im-putação da justiça, como se tivesse dito que os justificados pela fé verdadeira provam sua justificação mediante a obediência e boas obras, e não por uma simples e imaginária aparência de fé. Em resumo, ele não está discutindo o modo da justificação, e sim recomendando que a justificação dos crentes seja operante. Assim como Paulo argumenta que os homens são justificados sem ajuda das obras, Tiago não admite que alguém destituído de boas obras seja considerado justo. Deste modo, a devida atenção ao objetivo esclarece toda dúvida. O erro de nossos oponentes está principalmente nisto: em pensarem que Tiago está definindo o modo da justificação, enquanto seu único objetivo é destruir a segurança depravada daqueles que simulavam futilmente uma fé como desculpa para seu desprezo pelas boas obras. Portanto, deixem que distorçam as palavras de Tiago como quiserem, eles nunca extrairão delas mais do que duas proposições: um espectro de fé vazio não justifica; e o crente, insatisfeito com tal imaginação, manifesta sua justificação mediante boas obras.8

Martinho Lutero advogou a justificação pela fé tão apaixo-nadamente como qualquer outro reformador, Ele acreditava que a santificação era opcional? De modo nenhum, Quando alguns de seus companheiros começaram a ensinar antinomianismo (a idéia de que o comportamento não está relacionado à fé ou de que os cristãos não estão sujeitos a qualquer lei moral), Lutero se opôs, Chamou o ensino deles de “o erro mais grosseiro” destinado a “desanimar-me e colocar o evangelho em confusão”, Esse ensino, de acordo com Lutero, esvazia a obra salvífica de Deus,9

Alguém informou a Lutero que um desses homens, Jacob Schenck, “havia pregado licenciosidade carnal e ensinado: faça o que lhe agrada; apenas creia e você será salvo”,10 11

Lutero replicou: “Esta é uma separação perversa, reduz a questão a isto: ‘Querido amigo, creia em Deus e, depois, quando houver nascido de novo, quando for um novo homem, etc,, faça o que estiver ao seu alcance’, Os tolos não sabem o que é a fé, Supõem que seja apenas uma idéia inerte,,, É impossível nascer de Deus e pecar [continuamente], pois essas duas coisas contradizem uma a outra,11

Embora muitos outros exemplos pudessem ser dados, mencionarei apenas mais um, A Fórmula de Concórdia, a declaração de fé luterana definitiva, escrita em 1576, tratou extensivamente da relação entre a justificação e a obediência do crente, Esse documento revela que na mente dos reformadores também havia as mesmas questões que hoje constituem o âmago da controvérsia do senhorio, A Fórmula de Concórdia, como qualquer credo protestante significativo, recusou-se a separar a justificação da santificação, embora salientasse a distinção entre as duas,

De acordo com este credo, “a renovação do homem,,, é corretamente diferenciada da justificação da fé”, A Fórmula declarava explicitamente que “contrição anterior [arrependimento] e subseqüente nova obediência não fazem parte da justificação diante de Deus”,12

Entretanto, ela acrescentava imediatamente: “Contudo, não devemos imaginar que uma fé justificadora como esta pode existir e permanecer em nós com um propósito mau,,, Mas, após o homem ser justificado pela fé, então, a fé verdadeira e viva atua pelo amor [Gl 5,6], e as boas obras sempre acompanham a fé justificadora; e essas obras são, muito certamente, encontradas junto com esta fé”}13

A Fórmula de Concórdia repudiou o ensino de que justificar significa “tornar-se, em ações, justo diante de Deus”, mas também condenou a noção de que a “fé é um tipo de confiança na obediência a Cristo que pode existir mesmo no homem destituído de arrependimento verdadeiro, no qual ela não é acompanhada de caridade [amor], mas que, mesmo em contrário à consciência, persevera no pecar”,14

A famosa epigrama da Reforma é: “A fé justifica sozinha, mas a fé não vem sozinha”, R, W, Robertson acrescenta: “O relâmpago estala, mas não o relâmpago que vem sem trovão”,15 Em todos esses assuntos, os principais reformadores concordam, Apenas os antinomianos ensinavam que a fé verdadeira pode deixar de produzir boas obras,

A justificação no debate da salvação por senhorio

A doutrina contemporânea do não-senhorio não é nada além de um antinomianismo moderno, Embora a maioria dos defensores da doutrina do não-senhorio oponham-se a esse termo,16 essa é uma caracterização justa da doutrina deles.

Zane Hodges falha em compreender o essencial quando chama o antinomianismo de “a ‘palavra de maldição’ favorita da teologia reformada”.17 Ele escreveu:

Poderíamos definir “antinomianismo” como o dicionário americano Heritage (Segunda Edição College, 1985) o define: “Sustentar que a fé somente é necessária para a salvação”. Se era isso que se queria dizer com esse termo, eu me sentiria bastante confortável com tal definição. Infelizmente, porque “antinomianismo” implica para muitas mentes um descuido quanto a assuntos morais, devo rejeitar essa designação. Peço com insistência aos meus companheiros reformados que desistam deste termo por causa de suas conotações e implicações pejorativas e, com freqüência, injustas. Entretanto, não ficarei empolgado, esperando que eles o façam!18

É importante compreender o termo antinomianismo em seu sentido teológico. Eu não uso esta palavra para depreciar. Dizer que alguém é antinomiano não é necessariamente dizer que esta pessoa rejeita a santidade ou que fecha os olhos para a impiedade. A maioria dos anti-nomianos apela vigorosamente aos cristãos que andem de modo digno de sua vocação; mas, ao mesmo tempo, subestimam a relação entre a obediência e a fé. Antinomianos típicos crêem que os cristãos devem render-se ao senhorio de Cristo; mas não crêem que a rendição seja uma obrigação no chamado do evangelho à fé. Antinomianos não desprezam necessariamente a lei de Deus. Apenas crêem que ela é irrelevante à fé salvífica. Sugerem que obediência aos princípios justos da lei pode não se tornar um padrão na vida cristã (cf. Rm 8.4; 10.4). Resumindo, anti-nomianismo é a crença que admite a justificação sem a santificação.

O antinomianismo torna a obediência opcional. Enquanto a maioria dos antinomianos aconselham fortemente os cristãos a obedecer (até insistem que obedeçam), eles não crêem que a obediência seja uma conseqüência necessária da fé verdadeira. Zane Hodges, por exemplo, incluiu em sua obra um capítulo sobre obediência intitulado “A Escolha é Sua” (AF 117-126). O principal teólogo do movimento do não-senhorio escreveu: “A pessoa não-salva tem apenas um curso de ação — servir ao pecado e a si mesma ou deixar Deus fora de sua vida — enquanto o crente tem uma opção. Ele pode servir a Deus e, enquanto está num corpo humano, também pode escolher deixar Deus de fora e viver de acordo com sua velha natureza”.19 Claramente, a teologia do não-senhorio torna a obediência opcional; e isso é o que caracteriza essa teologia como antinomiana.

Esse tipo de antinomianismo tende a ver a justificação pela fé como toda a obra salvífica de Deus. Antinomianos subestimam a santificação ou apresentam-na como não-compulsória. Discussões antinomianas acerca da salvação omitem tipicamente qualquer consideração de santidade prática. Enfatizam a justificação pela fé e a liberdade cristã a tal extremo, que perdem o equilíbrio, temem falar da retidão pessoal, da obediência, da Lei de Deus ou de qualquer coisa além dos aspectos puramente forenses da salvação.

A teologia do não-senhorio é antinomianismo clássico; não há como negar esse fato. Visto que é importante entender o ponto de vista do não-senhorio no contexto do ensino da Reforma, não podemos evitar o termo antinomianismo, embora os proponentes da doutrina do não-senhorio o considerem ofensivo. Afinal de contas, o ponto de vista deles se enquadra firmemente na tradição do antinomianismo histórico.20

Outro ponto deve ser exposto sobre a tendência da teologia do não-senhorio de subestimar a santificação. A maioria dos defensores da doutrina do nãosenhorio reconhece a necessidade de algum grau de santificação. O Dr. Ryrie admite que “cada cristão dá frutos espirituais em algum lugar, em algum tempo, de alguma forma; do contrário, a pessoa não é crente. Cada indivíduo nascido de novo é prolífico. Não dar frutos é ser infiel, é não ter fé e, portanto, não ser salvo” (SGS 45).

Até Zane Hodges afirmou ultimamente que “alguma medida ou algum grau de santificação resultará da justificação [e] que a santificação final é um resultado inevitável da justificação”.21

Mas essas retratações devem ser entendidas no contexto. Ryrie, por exemplo, apressa-se a acrescentar que os frutos de alguns crentes podem ser tão escassos e tão passageiros que são invisíveis às pessoas ao redor deles (SGS 45). Em outra passagem, Ryrie parece sugerir que a santificação prática não é, de maneira alguma, garantida. Ele cita Romanos 8.29-30: “Porquanto aos que de antemão conheceu, também os predestinou para serem conformes à imagem de seu Filho, a fim de que ele seja o primogênito entre muitos irmãos. E aos que predestinou, a esses também chamou; e aos que chamou, a esses também justificou; e aos que justificou, a esses também glorificou”. “E a santificação?”, Ryrie pergunta.

Na lista de Paulo, em Romanos 8.29-30, ela não aparece em parte alguma. Apenas predestinação, justificação e glorificação. Será que Paulo não queria basear nossa garantia de glorificação final em nossa santificação pessoal? Indubitavelmente, a glorificação não depende da santificação, pois os muitos filhos que serão glo-rificados terão apresentado graus variados de santidade pessoal durante sua existência. Entretanto, todos, desde o carnal até ao mais maduro, serão glorificados (SGS 150).

Ryrie delineia três aspectos da santificação — santificação posicionai, “uma posição genuína que não depende do estado de crescimento e maturidade de alguém”; santificação progressiva, ou santidade prática, e santificação final, santidade perfeita que será realizada no céu (SGS 151). É óbvio que Ryrie vê o primeiro e o terceiro aspectos da santificação como garantidos. Mas acredita que a santificação prática pode ser omitida ou deixada de lado, pois ele abre espaço para “crentes” que caem em carnalidade completa e descrença permanente (SGS 141).

Zane Hodges tem opinião semelhante. Sua tendência de depreciar o aspecto prático da santificação é mais marcante do que a de Ryrie. O livro mais extenso de Hodges sobre o debate do senhorio, Absolutely Free!, omite qualquer discussão sobre a santificação como doutrina.22 O que ele deixa claro, do começo ao fim de seu livro, é que nenhuma medida de santidade prática é garantida na vida de um filho de Deus.

Embora a doutrina do nâo-senhorio possa, em palavras, apoiar a necessidade da santificação, parece certo que a maioria dos seus proponentes realmente não acredita que a santificação prática anda de mãos dadas com a justificação. Este é, de fato, o ponto fundamental que os defensores da doutrina do não-senhorio desejam estabelecer. Eles têm desmembrado a doutrina bíblica da salvação por separarem a justificação da santificação.23 O que lhes restou foi um antinomianismo defeituoso que não garante qualquer medida de santidade na experiência cristã. Portanto, eles falham completamente em entender a doutrina bíblica da justificação pela fé, visto que ela está intimamente relacionada à santificação.

A justificação no novo testamento

A justificação é o coração e a alma da soteriologia do Novo Testamento. Sendo este o caso, um amigo me perguntou por que meu livro O Evangelho Segundo Jesus quase não aborda a justificação. A razão é que o próprio Jesus tinha muito pouco a dizer explicitamente sobre justificação pela fé. Essa doutrina foi exposta em sua plenitude primeiramente pelo apóstolo Paulo. Na sua Epístola aos Romanos, a doutrina da justificação é um dos temas principais.

A primeira metade de Romanos divide-se naturalmente em três partes. Paulo começa mostrando que todos os homens e todas as mulheres pecaram contra a justiça perfeita de Deus. Esse é seu tema nos primeiros capítulos da epístola: “Não há justo, nem um sequer” (3.10). Começando em Romanos 3.21 e indo até ao fim do capítulo 5, Paulo explica em detalhes a doutrina da justificação pela fé. “Justificados, pois, mediante a fé, temos paz com Deus por meio de nosso Senhor Jesus Cristo” (5.1). Nos capítulos 6 ao 8, Paulo expõe a doutrina da santificação. “A fim de que o preceito da lei se cumprisse em nós, que não andamos segundo a carne, mas segundo o Espírito” (8.4).

Portanto, em Romanos Paulo fala sobre o pecado, a fé salvífica e a santificação. Ou, como disse um amigo meu, Romanos 1.1-3.20 trata da justiça de Deus desafiada por um mundo pecador. Romanos 3.21-5.21 mostra a justiça de Deus satisfeita em favor de pecadores que crêem. Os capítulos 6 a 8 concentram-se na justiça de Deus aplicada à vida dos santos.

A justificação pela fé é o meio pelo qual a justiça de Deus é satisfeita em favor de pecadores que crêem. Gostaria de que houvesse neste livro espaço suficiente para uma exposição completa desses capítulos cruciais (Rm 3-5), os quais compõem a essência da verdade bíblica sobre a justificação. Mas isso exigiria vários capítulos. Então, em vez disso, nos concentraremos apenas em uma parte, a principal ilustração de Paulo da justificação pela fé — Abraão — encontrada em Romanos 4.

Neste capítulo, Paulo escreve:

Que, pois, diremos ter alcançado Abraão, nosso pai segundo a carne? Porque, se Abraão foi justificado por obras, tem de que se gloriar, porém não diante de Deus. Pois que diz a Escritura? Abraão creu em Deus, e isso lhe foi imputado para justiça. Ora, ao que trabalha, o salário não é considerado como favor, e sim como dívida. Mas, ao que não trabalha, porém erê naquele que justifica o ímpio, a sua fé lhe é atribuída como justiça.

Romanos 4.1-5

Várias verdades cruciais aparecem nesse texto.

A verdadeira salvação não é ganha por obras.

Existem apenas dois tipos de religião em todo o mundo. Cada religião falsa já inventada pela humanidade ou por Satanás é uma religião de mérito humano. Religião pagã, humanismo, animismo e cristianismo falso, todas caem nessa categoria. Elas se concentram no que as pessoas devem fazer para alcançar a justiça ou agradar a deidade.

Apenas o cristianismo bíblico é a religião da realização divina. Outras religiões dizem: “Faça isto”. O cristianismo diz: “Está feito” (cf. Jo 19.30). Outras religiões exigem que o devoto satisfaça algum tipo de mérito para expiar pecados, satisfazer a deidade ou, de alguma outra maneira, atingir o objetivo de aceitabilidade. As Escrituras dizem que o mérito de Cristo é satisfeito em favor do pecador que crê.

Nos dias de Paulo, os fariseus haviam transformado o judaísmo numa religião de realizações humanas. A própria vida de Paulo antes da salvação era um grande e inútil esforço de agradar a Deus mediante o mérito pessoal. Ele estava saturado de tradição farisaica - “fariseu, filho de fariseus” (At 23.6), “hebreu de hebreus; quanto à lei, fariseu, quanto ao zelo, perseguidor da igreja; quanto à justiça que há na lei, irrepreensível” (Fp 3.5-6). Paulo entendia a cultura religiosa de seus dias tão bem como qualquer outro judeu. Ele sabia que os fariseus veneravam Abraão como o pai de sua religião (Jo 8.39); por isso, escolheu Abraão para provar que a justificação diante de Deus é pela fé no que Deus realizou.

Ao mostrar Abraão como o exemplo fundamental da justificação pela fé, Paulo colocando a doutrina cristã em oposição a séculos de tradição rabinica. AO apelar às Escrituras do Antigo Testamento, Paulo estava mostrando que o judaísmo havia se afastado das verdades mais básicas afirmadas por todos os judeus crentes, desde o próprio Abraão. Estava procurando nortear a igreja para que ela não seguisse a direção de Israel.

A fé de Abraão era o fundamento da nação judaica e a base da aliança de Deus com seu povo eleito. Estar em desacordo com Abraão era inimaginável para a tradição dos fariseus. Entretanto, como Paulo estava para provar, Abraão não praticava a religião de méritos dos fariseus.

A jactância é excluída.

Se as pessoas pudessem ganhar a justificação por obras, elas teriam, de fato, algo de que se vangloriar. Por conseguinte, a doutrina de justificação pela fé é uma verdade humilhante. Não merecemos a salvação. Não podemos ser suficientemente bons para agradar a Deus. No plano de Deus quanto à redenção, não há lugar para o orgulho humano. Até Abraão, o pai da fé, não tinha razão de gloriar-se em si mesmo: “Se Abraão foi justificado por obras, tem de que se gloriar, porém não diante de Deus. Pois que diz a Escritura? Abraão creu em Deus, e isso lhe foi imputado para justiça” (Rm 4.2-3).

Paulo citou Gênesis 15.6: “Ele [Abraão] creu no SENHOR, e isso lhe foi imputado para justiça”. Esse único versículo do Antigo Testamento é uma das afirmações mais claras sobre a justificação em todas as Escrituras. A palavra imputado mostra a natureza forense da justificação. Em Romanos 4, imputado é a tradução da palavra grega logizomai, termo usado em contabilidade e propósitos legais. Fala de algo colocado na conta de alguém.

Este cômputo foi uma transação unilateral. Deus atribuiu justiça à conta espiritual de Abraão, que não fez nada para merecê-la. Nem mesmo a sua fé era meritória. A fé nunca é mencionada como o fundamento da justificação; é apenas O canal por meio do qual a graça justificadora é recebida. Abraão creu em Deus, que, por sua vez, imputou justiça à conta de Abraão.

Mais uma vez, a natureza forense da justificação é evidente: “Ora, ao que trabalha, o salário não é considerado como favor, e sim como dívida. Mas, ao que não trabalha, porém crê naquele que justifica o ímpio, a sua fé lhe é atribuída como justiça.” (vv. 4-5). Aqueles que tentam ganhar a justificação por fazerem algo encontrarão um imenso débito em seu livro de contas.

Aqueles que recebem o dom de Deus pela graça, mediante a fé, têm em sua conta recursos infinitamente suficientes.

Portanto, a fé significa o fim de qualquer tentativa de ganhar o favor de Deus mediante o mérito pessoal. Deus salva apenas aqueles que não confiam em si mesmos — aqueles que confiam “naquele que justifica o ímpio”. Enquanto uma pessoa não confessa que é ímpia, ela não pode ser salva, pois ainda confia em sua própria bondade. Foi isso que Jesus quis dizer, quando falou: “Não vim chamar justos, e sim pecadores, ao arrependimento” (Lc 5.32). Aqueles que são justos aos seus próprios olhos não têm parte na obra redentora da graça de Deus. Conseqüentemente, aqueles que são salvos não têm nada do que se gloriar.

A justificação traz a bênção do perdão.

Nos versículos 6 a 8, Paulo cita Davi para apoiar o conceito de justiça por imputação: “E é assim também que Davi declara ser bem-aventurado o homem a quem Deus atribui justiça, independentemente de obras: Bemaventurados aqueles cujas iniqüidades são perdoadas, e cujos pecados são cobertos; bem-aventurado o homem a quem o Senhor jamais imputará pecado”. Paulo está citando Salmos 32.1-2. A bênção à qual Davi se refere é a salvação.

Observe que Davi fala tanto de uma conta positiva como de uma conta negativa: a justiça é atribuída ao crente; o pecado não é levado em conta. A justificação tem elementos positivos e negativos: a imputação da justiça ao indivíduo e O perdão de pecados. Esse perdão não seria possível se nosso pecado não houvesse sido pago pelo sacrifício do próprio sangue de Cristo. Sua morte pagou o preço; por isso, o termo “PAGO” pode ser escrito na fatura espiritual do crente (cf. Cl 2.14).

Assim como nosso pecado foi imputado a Cristo (1 Pe 2.24), a justiça dele é imputada ao crente. Nenhum outro pagamento ou reembolso é exigido.

Abraão não foi justificado pela circuncisão.

Paulo previu a pergunta que os judeus fariam a si mesmos neste ponto de sua argumentação: se Abraão foi justificado apenas por sua fé, por que Deus exigiu a circuncisão de Abraão e de todos os seus descendentes?

Nos tempos do Novo Testamento, a maioria dos judeus estava plenamente convicta de que a circuncisão era a única marca que os distinguia como povo escolhido de Deus. Também acreditavam que a circuncisão era o meio pela qual eles se tornavam aceitáveis a Deus. De fato, a circuncisão era considerada uma marca tão importante do favor de Deus, que muitos rabinos ensinavam um judeu só poderia ser mandado para o inferno, se, primeiro, Deus anulasse a sua circuncisão.

Gênesis 17.10-14 registra as instruções de Deus quanto ao fato de que a circuncisão deveria ser uma marca da aliança de Deus com Abraão e seus descendentes. Com bases nessa passagem, os rabinos ensinavam que a circuncisão era, em si mesma, o meio de estar bem com Deus. Mas, como Paulo mostra cuidadosamente, Abraão não foi tornado justo por sua circuncisão. Quando Deus mandou que Abraão fosse circuncidado, ele já havia sido declarado justo:

Vem, pois, esta bem-aventurança exclusivamente sobre os circun-cisos ou também sobre os incircuncisos? Visto que dizemos: a fé foi imputada a Abraão para justiça. Como, pois, lhe foi atribuída? Estando ele já circuneidado OU ainda ineireundso? Não no regime da circuncisão, e sim quando incircunciso. E recebeu o sinal da circuncisão como selo da justiça da fé que teve quando ainda incircunciso; para vir a ser o pai de todos os que crêem, embora não circuncidados, a fim de que lhes fosse imputada a justiça, e pai da circuncisão, isto é, daqueles que não são apenas circuncisos, mas também andam nas pisadas da fé que teve Abraão, nosso pai, antes de ser circuncidado.

Romanos 4.9-12

A cronologia de Gênesis prova que Abraão foi declarado justo muito antes de observar o mandamento de Deus quanto a ser cir-cuncidado. Abraão tinha noventa e nove anos de idade na época de sua circuncisão, e Ismael tinha treze (Gn 17.24-25). Mas, quando Abraão foi justificado (15.6),

Ismael ainda nem havia sido concebido (16.2-4). Por ocasião do nascimento de Ismael, Abraão tinha oitenta e seis anos (16.16). Então, Abraão foi justificado pelo menos catorze anos antes de sua circuncisão. Quando Abraão foi declarado justo, ele não era diferente de um gentio incircunciso.

Circuncisão e outros rituais externos — incluindo batismo, penitência, ordens santas, casamento, celibato, extrema unção, jejum, oração ou seja o que for — não são meios de justificação. Abraão estava na aliança de Deus e sob sua graça muito antes de ser cir-cuncidado, enquanto Ismael, embora circuncidado, nunca esteve na aliança. A circuncisão, um sinal da necessidade humana de purificação espiritual, era apenas uma marca do relacionamento pactual entre Deus e seu povo.

Em Romanos 2.28-29, Paulo já havia afirmado: “Porque não é judeu quem o é apenas exteriormente, nem é circuncisão a que é somente na carne. Porém judeu é aquele que o é interiormente, e circuncisão, a que é do coração, no espírito, não segundo a letra, e cujo louvor não procede dos homens, mas de Deus”. Apenas a justificação pela fé torna alguém um filho de Abraão (4.12).

Abraão não foi justificado pela lei.

“Não foi por intermédio da lei que a Abraão OU a sua descendência coube a promessa de ser herdeiro do mundo, e sim mediante a justiça da fé. Pois, se os da lei é que são os herdeiros, anula-se a fé e cancela-se a promessa, porque a lei suscita a ira; mas onde não há lei, também não há transgressão” (4.13-15).

Mais uma vez, a cronologia da Escritura prova de modo incontestável o que Paulo queria dizer. Obviamente, a lei só foi revelada a Moisés mais de meio milênio depois de morte de Abraão, que, evidentemente, não se tornou justo mediante a lei.

A justificação nunca aconteceu por meio de um ritual ou por meio da lei. A lei de Deus “é santa; e o mandamento, santo, e justo, e bom” (Rm 7.12; cf. Gl 3.21). Entretanto, a lei nunca foi um meio de salvação. “Todos quantos, pois, são das obras da lei”, isto é, que buscam justificar-se por guardarem a lei, “estão debaixo de maldição; porque está escrito: Maldito todo aquele que não permanece em todas as coisas escritas no Livro da lei, para praticálas” (Gl 3.10). A lei demanda perfeição, mas a única maneira de obter justiça perfeita é pela imputação — isto é, ser justificado pela fé.

O propósito da lei era revelar os perfeitos padrões de justiça de Deus. Ao mesmo tempo, ela estabelece um padrão de acordo com o qual é impossível pecadores viverem. Isso deve nos mostrar a nossa necessidade de um Salvador e levar-nos a Deus em fé. Assim, a lei é um “aio para nos conduzir a Cristo, a fim de que fôssemos justificados por fé” (Gl 3.24).

Deus nunca reconheceu qualquer justiça, a não ser a justiça da fé. A lei não pode salvar porque só traz ira. Quanto mais alguém busca a justificação mediante a lei, tanto mais ela comprova a sua pecaminosi-dade; e mais juízo e ira são debitados em sua conta (cf. Rm 4.4).

Então, vem o clímax.

Abraão foi justificado pela graça de Deus.

“Essa é a razão por que provém da fé, para que seja segundo a graça, a fim de que seja firme a promessa para toda a descendência, não somente ao que está no regime da lei, mas também ao que é da fé que teve Abraão (porque Abraão é pai de todos nós, como está escrito: Por pai de muitas nações te constituí.), perante aquele no qual creu, o Deus que vivifica os mortos e chama à existência as coisas que não existem” (4.16-17).

O ensino principal de toda essa passagem está expresso no versículo 16: “Provém da fé, para que seja segundo a graça”. A dinâmica da justificação é a graça de Deus. A fé de Abraão não era a justiça em si mesma, ela apenas é imputada para a justiça. A justificação é, por completo, uma obra da graça de Deus.

Mais uma vez, vemos aqui a natureza puramente forense da justificação: Deus “chama à existência as coisas que não existem”. A versão King James, em inglês, diz: Ele “chama as coisas que não existem como se existissem”. Essa é uma afirmação fascinante sobre Deus.

Se você ou eu tivéssemos de declarar “as coisas que não são como se já fossem”, estaríamos mentindo. Deus pode fazer isso porque Ele é Deus, e seus decretos portam toda a força da soberania divina. Deus falou, e o mundo foi criado. “O visível veio a existir das coisas que não aparecem” (Hb 11.3). Ele falou coisas que não existiam, e, vejam, elas passaram a existir! Ele pode chamar pessoas, lugares e acontecimentos à existência unicamente por seus soberanos decretos divinos. Ele pode declarar justos os pecadores que crêem, embora eles não o sejam. Isso é justificação.

Mas a justificação nunca ocorre sozinha no plano de Deus. Ela sempre é acompanhada pela santificação. Deus não declara os pecadores justos no aspecto legal, sem torná-los justos na prática. A justificação não é uma ficção legal. Quando Deus declara alguém justo, Ele faz isso acontecer inevitavelmente. “Aos que justificou, a esses também glorifi-

COU” (Rm 8.30). Quando a justificação ocorre, O processo de santificação começa. A graça sempre envolve as duas coisas.

Como veremos no capítulo 7, Paulo ensinou claramente as duas verdades. Ele não terminou a discussão sobre justificação deixando de lado O assunto da santificação. A salvação que Paulo descreveu em sua epístola à igreja de Roma não tinha uma faceta só, uma mera ação forense. Mas O elemento forense — a justificação — foi, sem dúvida, O alicerce sobre O qual em que Paulo baseou toda a experiência cristã.

Capítulo 7

SPROUL, R. C. “Works or Faith?” Tabletalk, Lake Mary, p. 6, May 1991.

Citado em: BAINTON, Roland. Here I stand. New York: Oxford, 1963. p. 263.

Ibid.

BETTENSON, Henry (Ed.). Documents of the Christian church. New York: Oxford, 1963. p. 263.

SCHAFF, Philip. The creeds of Christendom, 3 v. Grand Rapids, Mich.: Baker, 1983. 3:94.

RADMACHER, Earl. First response to faith according to the apostle James, by John F MacArthur Jr. Journal of the Evangelical Theological Society, Louisville, v. 33, n. 1, p. 40, Mar. 1990.

CALVIN, John. Institutes of the Christian religion. Trans. Henry Beveridge. Grand Rapids, Mich.: Eerdmans, 1966. 2:99.

Ibid. 2:115.

LUTHER, Martin, Table talk, In: LEHMAN, Helmut T. (Ed,); TAPPERT, Theodore G, (Trad,), Luther’s works, 55 v, Philadelphia: Fortress, 1967, 54:248,

Ibid, 54:289-290,

Ibid, 54:290,

SCHAFF, Philip, The creeds of christendom, 3 v, Grand Rapids, Mich,: Baker, 1983. 3:117-118,

Ibid, 3:118 (ênfase acrescentada),

Ibid, 3,119,

Citado em: STRONG, Augustus H, Systematic theology, Philadelphia: Judson, 1907, p,875,

BUTCHER, J. Kevin. A critique of The Gospel According to Jesus. Journal of the Grace Evangelical Society, Denton, v. 2, n. 1, p. 28, Spring 1989. Butcher acredita que, ao descrever Chafer, Ryrie e Hodges como antinomianos, estou concluindo que “esses homens (bem como o ponto de vista que representam) preocupam-se apenas em povoar o céu, mostrando desdém por santidade e um viver cristão consistente”. Mas não é isso que o termo antinomianismo significa, como mostra a discussão nestas páginas.

HODGES, Zane. Calvinism ex cathedra. Journal of the Grace Evangelical Society, Denton, v. 4, n. 2, p. 68, Autumn 1991.

Ibid. p. 69.

RYRIE, Charles C. Balancing the Christian life. Chicago: Moody, 1969. p. 35. O contexto dessa citação é uma seção que argumenta que os crentes têm duas naturezas. Ryrie sugere que carnalidade pode ser um estado contínuo para o cristão (170-173). Quando ele fala sobre aqueles que “escolhem deixar Deus de fora e viver de acordo com sua velha natureza”, está se referindo claramente a algo mais do que falha temporária.

Há muitos paralelos entre a teologia moderna do não-senhorio e outras formas de antinomianismo que têm aparecido de tempos em tempos na história da igreja. Estes incluem, por exemplo, os ensinos de Johann Agricola, a quem Lutero censurou, e o culto sandemaniano que prosperou na Escócia no século XVIII.

HODGES, Zane. Calvinism ex cathedra. Journal of the Grace Evangelical Society, Denton, v. 4, n. 2, p. 67, Autumn 1991. Numa nota de rodapé, Hodges sugere que expressara essa mesma opinião em seu livro Absolutely Free! (213-215). Mas, em Absolutely Free!, Hodges não fez uma afirmação como essa. Indo à seção de Absolutely Free! que Hodges cita, descobrimos, ironicamente, que ele começa censurando-me, por escrever: “A obediência é a manifestação inevitável da fé salvífica” (AF 213). E conclui, incoerentemente, declarando: “Devemos acrescentar que não há necessidade de contender com a opinião dos reformadores de que as obras existirão indubitavelmente onde houver fé justificadora” (AF 215). Mas esta é precisamente a opinião contra a qual Hodges está argumentando! Ele conclui que as obras acompanharem a fé é apenas “uma suposição razoável”. E tais obras podem ser imperceptíveis a um observador humano: “É possível que somente Deus seja capaz de detectar os frutos da regeneração em alguns de seus filhos” (215).

22 Em minha leitura de Absolutely Free!, não encontrei uma única ocorrência das palavras santificar ou santificação, exceto em uma citação de meu livro. A santificação também não é abordada nas outras grandes obras de Hodges que tratam da questão do senhorio: The Gospel Under Siege (Dallas: Redención Viva, 1981) e Grace in Eclipse (Dallas: Redenci-ón Viva, 1985). Evidentemente, Hodges vê a santidade prática e o crescimento em graça como obras do crente (AF 117-126). Lidaremos com o assunto da santificação em detalhes no capítulo 7.

R. T. Kendall, a quem Hodges freqüentemente menciona como apoio, é explícito sobre isto: “É verdade que a santificação não era um prerrequisito para a glorificação; do contrário, Paulo a teria colocado junto com ‘chamado' e ‘justificação' (Rm 8.30)”. (KENDALL, R. T. Once saved, always saved. Chicago: Moody, 1983. p. 134.) Perceba a semelhança entre a afirmação de Kendall e o parágrafo de Ryrie citado acima (SGS 150).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A aula resume a Reforma na fórmula "a fé justifica sozinha, mas a fé não vem sozinha"; ao examinar a sua vida, a fé que você professa tem vindo acompanhada das boas obras que comprovam que ela é real?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor mostra que Deus nunca declara alguém justo no plano legal sem torná-lo justo na prática, pois justificação e santificação jamais se separam; você tem tentado abraçar o perdão de Cristo enquanto resiste à santidade que sempre o acompanha?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele descreve o antinomianismo como crer que a obediência é opcional para o cristão; sinceramente, em quais áreas você trata a obediência a Cristo como algo que pode ficar para depois, em vez de fruto inevitável da fé verdadeira?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Escravos da Justiça$t$, 7,
$conteudo$Você não pode receber Cristo somente como sua justificação e, depois, recusar-se a aceitá-lo como sua santificação. Ele é um e indivisível. E, se você recebê-lo de uma vez, Ele se torna para você “sabedoria, e justiça, e santificação, e redenção”. Você não pode recebê-lo apenas como seu Salvador e, mais tarde, aceitá-lo ou rejeitá-lo como seu Senhor, pois o Salvador é o Senhor que, pela sua morte, nos comprou e, portanto, nos possui. Em nenhum lugar do Novo Testamento, a santificação é ensinada ou oferecida como uma experiência adicional possível ao crente. Em vez disso, ela é representada como algo que já está dentro do crente, algo que ele deve compreender cada vez mais e no que ele deve crescer progressivamente.

DR. MARTYN LLOYD-JONES1

Um querido amigo meu ministrou numa igreja onde encontrou um homem aposentado e leigo que se considerava um professor da Bíblia. Ele aproveitava toda oportunidade para ensinar ou testemunhar publicamente, e sua mensagem era sempre a mesma. Ele falava sobre como a “verdade posicionai” lhe dera novo entusiasmo pela fé cristã.

A “verdade posicionai” da qual ele falava incluía a perfeita justiça de Cristo que é imputada aos crentes na justificação. O homem também amava dizer que todos os cristãos estão assentados com Cristo em lugares celestiais (Ef 2.6) e ocultos juntamente com Cristo, em Deus (Cl 3.3). Ele ansiava por lembrar a seus companheiros cristãos que todos estamos diante de Deus como “raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus” (1 Pe 2.9). Estas realidades “posicionais” são verdade no que diz respeito a todos os cristãos genuínos, independentemente de nosso nível de maturidade espiritual. Nossa posição incontestável em Cristo é uma das verdades mais preciosas da doutrina cristã.

Entretanto, este homem em particular, obcecado pela “verdade posicionai”, tinha uma vida deplorável. Ele era um bêbado, viciado em cigarros, malhumorado, arrogante e desamoroso para com sua esposa. Criou divisão e contendas em várias igrejas ao longo dos anos, sendo completamente indisciplinado em quase todas as formas. Certa vez, meu amigo visitou a casa deste homem, e sinais de seu estilo de vida pecaminoso estavam por todas as partes da casa.

Para este homem, a “verdade posicionai” significava uma verdade que não tinha efeitos práticos. Ele concluíra erroneamente que, se a nossa posição em Cristo não é alterada por nossa prática, os cristãos não precisam preocupar-se com seus pecados. Evidentemente, ele acreditava que podia ter certeza das promessas da vida cristã, embora nenhum dos frutos práticos da fé fosse evidente em sua caminhada. Resumindo, ele amava a idéia da justificação, mas parecia dar rara atenção à santificação. Agindo de modo correto, meu amigo o encorajou a examinar se estava realmente em Cristo (2 Co 13.5).

Em nenhum lugar das Escrituras, encontramos justiça posicio-nal colocada em oposição a um comportamento justo, como se essas duas realidades fossem desligadas por natureza. De fato, o ensino do apóstolo Paulo era diametralmente contrário à noção de que a “verdade posicionai” significa que somos livres para pecar. Após dois capítulos e meio de ensino sobre assuntos “posicionais”, Paulo escreveu: “Que diremos, pois? Permaneceremos no pecado, para que seja a graça mais abundante? De modo nenhum!” (Rm 6.1-2). Em total contraste com o homem que concluiu não haver qualquer problema em pecar, visto que nossa prática não altera nossa posição, Paulo ensinou que nossa posição faz diferença em nossa prática: “Como viveremos ainda no pecado, nós os que para ele morremos?” (v. 2).

O que é a teologia do não-senhorio, senão o ensino de que os que morreram para o pecado podem viver nele? Nesse aspecto, o ensino do não-senhorio apoia-se no mesmo fundamento da fanática doutrina da “verdade posicionai” que acabei de descrever. Ela separa a justificação da santificação.

A Espiritualidade como Segunda Bênção?

A teologia do não-senhorio exige uma abordagem de dois níveis quanto à experiência cristã. Por causa da pressuposição de que a fé não tem nada a ver com rendição, a doutrina do não-senhorio quanto a obediência e a maturidade espiritual deve começar com uma experiência posterior à conversão, uma experiência de consagração pessoal a Deus. Isso é semelhante à teologia da “vida mais profunda”, a qual, por sua vez, repete a idéia wesleyana de uma “segunda bênção” ou de uma segunda obra da graça.

Charles Ryrie é sincero na abordagem da teologia do não-se-nhorio quanto à espiritualidade:

Antes de fazer qualquer progresso duradouro no caminho do viver espiritual, o crente deve ser uma pessoa dedicada. Embora isso não seja uma exigência para a salvação, é o fundamento básico para a santificação. Como já indicamos, dedicação é um compromis- so completo e crítico do “eu” por todos os anos que a pessoa viver. Essa dedicação pode ser causada por algum problema OU decisão que tem de ser enfrentada, mas diz respeito a uma pessoa, o filho de Deus, e não a uma atividade, uma ambição ou um plano para o futuro. Uma pessoa dedicada terá planos dedicados e ambições, mas planos dedicados não exigem necessariamente ou garantem dedicação daquele que planeja.

Dedicação é a interrupção do controle que alguém exerce sobre sua própria vida e a entrega desse controle ao Senhor. Isso não resolve todos os problemas imediata e automaticamente, mas provê a base para a solução, para o crescimento e o progresso na vida cristã.2

O Dr. Ryrie inclui um diagrama que ilustra como ele vê o progresso típico na vida cristã. Trata-se de uma linha que sobe e desce para mostrar os altos e baixos da vida cristã, sempre com uma tendência para cima. O que é significativo sobre o diagrama é que a linha é plana — não indicando qualquer tipo de crescimento — entre o ponto de conversão e o “momento decisivo” da dedicação. Somente após a dedicação, tem início a santificação prática.

De acordo com a teologia do não-senhorio, parece que a conversão sozinha não “oferece a base para... crescimento e progresso na vida cristã” ou o “fundamento básico para a santificação”. Uma experiência de segundo nível é necessária antes que a santificação prática possa, ao menos, começar. Assim, a teologia do não-senhorio divide os cristãos em dois grupos — os que têm e os que não têm. A terminologia é levemente diferente, mas essa teologia não é nada mais do que um recondicionamento da doutrina da santificação como segunda bênção. Leva os cristãos a uma busca fútil por uma experiência que lhes dê o que já possuem — se são crentes verdadeiros.

Há mais de um século, J. C. Ryle analisou corretamente O maior erro de toda a abordagem da espiritualidade em dois níveis:

Saltos súbitos e instantâneos de conversão para a consagração não percebo nas Escrituras. Realmente, duvido que tenhamos qualquer base para dizer que um homem pode converter-se sem que se consagre a Deus! Mais consagrado, sem dúvida, ele pode ser, e isso sucederá à medida que a graça divina opere nele. Mas, se ele não se consagrou a Deus no dia em que se converteu e nasceu de novo, então, já não sei o que significa a conversão...

Algumas vezes tenho pensado, nos últimos anos, enquanto leio a estranha linguagem usada por muitos acerca da “consagração", que aqueles que a usam devem ter tido um ponto de vista muito baixo e inadequado da “conversão" anteriormente, se é que chegaram a experimentá-la. Em suma, quase tenho suspeitado de que, quando se “consagraram", na verdade, estavam se convertendo pela primeira vez!...

Esforcemo-nos por ensinar que há uma santificação mais profunda a ser atingida, um pouco mais do céu a ser usufruído na terra do que a maioria dos crentes tem experimentado atualmente. Porém, jamais direi a uma pessoa convertida que ela precisa de uma segunda conversão.3

Toda a doutrina do não-senhorio depende de uma teoria de dois estágios na vida cristã. O primeiro estágio, a conversão, é receber a Cristo como Salvador. O segundo estágio, a consagração, é render-se a Ele como Senhor. Entre os dois estágios, há geralmente um período de tempo durante o qual o

“cristão carnal" vive como um pagão, antes de fazer a “decisão" de tornarse um “discípulo".4

SÓ em ouvir OS testemunhos, percebe-se quão penetrante esse ensino tem-se tornado no evangelicalismo americano: “Recebi Cristo como meu Salvador aos sete anos e não o tornei meu Senhor até chegar aos trinta”.

Tenho convicção de que testemunhos como esse mostram que as pessoas interpretam erroneamente suas próprias experiências. Há muitos graus de santificação e, por isso, muitos níveis de compromisso com Cristo. Mas ninguém que crê verdadeiramente em Cristo para sua salvação é, no princípio, descomprometido com o senhorio de Cristo; e ninguém que vive perpetuamente em rebelião consciente e intencional contra Ele pode, realmente, alegar que crê nEle.

Conforme já mostrei, Deus não justifica a quem Ele não san-tifica. Nenhuma segunda obra da graça é necessária para aqueles que nasceram de novo. O apóstolo Pedro não poderia ter afirmado isso mais claramente: “Pelo seu divino poder, nos têm sido doadas todas as coisas que conduzem à vida e à piedade, pelo conhecimento completo daquele que nos chamou para a sua própria glória e virtude” (2 Pe 1.3, ênfase acrescentada). A santificação não é uma experiência de segundo nível à qual chegamos algum tempo depois da conversão. Paulo se dirigiu aos cristãos de Co-rinto como “os santificados em Cristo Jesus, chamados para ser santos, com todos os que em todo lugar invocam o nome de nosso Senhor Jesus Cristo, Senhor deles e nosso” (1 Co 1.2, ênfase acrescentada). E lembrou-lhes: “Mas vós sois dele [de Deus], em Cristo Jesus, o qual se nos tornou, da parte de Deus, sabedoria, e justiça, e santificação, e redenção” (v. 30). Ele disse aos cristãos de Tessalônica: “Deus vos escolheu desde o princípio para a salvação, pela santificação do Espírito e fé na verdade” (2 TS 2.13).

Se os aspectos posicionais da verdade de Deus são aplicáveis a uma pessoa, a obra santificadora e prática de Deus também serão operantes nessa pessoa.

O que é Santificação?

Santificação é a obra continua do Espirito Santo nos crentes, tornando-nos santos, ao conformar nosso caráter, afeições e comportamento à imagem de Cristo. A justificação é um acontecimento único, ocorre de uma vez por todas. A santificação é um processo continuo. A justificação nos livra da culpa do pecado; a santificação, da contaminação do pecado. Como estamos vendo, ambas são partes indispensáveis da obra salvifica de Deus.

Observe esta distinção crucial: na justificação, renunciamos o princípio do pecado e nossa autonomia. Na santificação, abandonamos a prática de pecados específicos à medida que amadurecemos em Cristo. Rendição total ao senhorio de Cristo não significa que tomamos todas as decisões da vida como um prerrequisito para a conversão (cf. SGS 49). Não exige que nos desprendamos de todos os nossos pecados antes de sermos justificados. Não é “a entrega dos anos da vida de alguém na terra” (SGS 118, cf. 106-107, 120, 123). Significa que, ao confiarmos em Cristo para nossa salvação, decidimos a questão de quem está no controle. Na salvação, nos rendemos a Cristo no principio, mas, como cristãos, nos renderemos a Ele continuamente em nosso viver. Essa obra prática e perfeita do senhorio de Cristo é o processo de santificação.

Há um aspecto da santificação que é simultâneo à justificação: “Tais fostes alguns de vós; mas vós vos lavastes, mas fostes santificados, mas fostes justificados em o nome do Senhor Jesus Cristo e no Espirito do nosso Deus” (1 Co 6.11). Esse aspecto definitivo da santificação era indubitavelmente o que o apóstolo tinha em vista quando se dirigiu aos coríntios como “os santificados” (1.2). Às vezes, referimo-nos a esse aspecto inicial e imediato como “santificação posicionai” (SGS 151).

Mas a santificação, diferentemente da justificação, não é uma declaração legal que acontece apenas uma vez. É uma separação experiencial do pecado, que começa na salvação e continua em graus progressivos de santidade prática na vida e comportamento do crente. A santificação pode ser observável em graus maiores ou menores de crente para crente, mas não é opcional, nem separável dos outros aspectos de nossa salvação.

Talvez o escritor da Epístola aos Hebreus tenha declarado a necessidade da santificação prática de modo bastante sucinto: “Segui a paz com todos e a santificação, sem a qual ninguém verá o Senhor” (Hb 12.14). O contexto mostra que o verso está falando de comportamento santo, de justiça prática, não somente de santidade posicionai ou forense (vv. 11-13, 15-16).

Fazer boas obras ou não?

Em Romanos 4.5: “Ao que não trabalha, porém crê naquele que justifica o ímpio, a sua fé lhe é atribuída como justiça”, o objetivo de Paulo era dizer que a justiça de Deus é atribuída a pessoas que crêem, e não a pessoas que tentam ganhar o favor de Deus mediante rituais religiosos ou obras de justiça própria. Paulo não estava sugerindo, como muitos fazem hoje, que um crente que foi declarado justo pode deixar de fazer boas obras. Este versículo não ergue, de maneira nenhuma, uma barreira — ou pelo menos sugere uma divisão — entre justificação e santificação.

De fato, seguindo a progressão do argumento de Paulo em Romanos 3 a 8, verificamos que ele trata precisamente deste assunto. Como observamos no capítulo 6, Romanos 3 e 4 descreve o aspecto legal da justificação, a atribuição de justiça por parte de Deus, mediante a qual um pecador que crê é declarado plenamente justo. Romanos 5 explica como a culpa ou a justiça podem ser imputadas a alguém por causa da obediência ou desobediência de outra pessoa.

Em Romanos 6, o apóstolo volta-se para o aspecto prático da justiça de Deus — a santificação. Ele está ensinando que a justiça de Deus, garantida pela fé a cada crente, tem implicações judiciais e práticas. Não há dois tipos de justiça — apenas dois aspectos de justiça divina. A justiça é um pacote individual, Deus não declara justo a quem Ele não torna justo. Tendo iniciado o processo, Ele o continuará até à glorificação final (Rm 8.29-30; cf. Fp 1.6).

O Dr. B. B. Warfield viu isto como o principal ensino de Romanos 6:

Todo o sexto capítulo de Romanos... foi escrito com o propósito de afirmar e demonstrar que a justificação e a santificação estão unidas indissoluvelmente; que não podemos ter uma sem ter a outra; que, na linguagem figurativa de Paulo, morrer com Cristo e viver com Cristo são elementos integrantes de uma salvação que não se fragmenta. Divorciar essas duas coisas e torná-las dons separáveis da graça evidencia uma confusão na conceituação da salvação de Cristo, o que é nada menos do que extraordinário. Isso extrai de nós a triste lamentação: Cristo está dividido? E nos compele a salientar mais uma vez a verdade primária de que não obtemos os benefícios de Cristo sem a pessoa dele - mas apenas nele e com Ele - e a verdade de que quando o temos, possuímos tudo.5

A santificação é uma parte tão essencial da salvação, que é o termo é usado comumente na Escritura como sinônimo de salvação (cf. At 20.32; 26.18; 1 Co 1.2, 30; 6.11; 2 Ts 2.13; Hb 2.11; 10.14; 1 Pe 1.2).

Examinando melhor Romanos 6

Quando Paulo encerrou a sua discussão sobre a justificação, ele exaltou a graça de Deus. “Sobreveio a lei para que avultasse a ofensa; mas onde abundou o pecado, superabundou a graça, a fim de que, como o pecado reinou pela morte, assim também reinasse a graça pela justiça para a vida eterna, mediante Jesus Cristo, nosso Senhor” (Rm 5.20-21). Se a presença abundante do pecado significa que a graça flui de modo transbordante, uma pergunta óbvia nos ocorre: “Permaneceremos no pecado, para que seja a graça mais abundante?” (6.1). Afinal, se justificação significa que somos declarados perfeitamente justos, que diferença faz se pecamos ou não? Se o nosso pecado apenas acentua a graça de Deus, por que não pecamos ainda mais?

Paulo previu que tais perguntas seriam feitas. E respondeu-as com profundidade, fazendo várias colocações essenciais sobre a maneira como a santificação age.

A santificação está ligada inseparavelmente à justificação.

Paulo combate a noção de que a justificação é a totalidade da obra de Deus na salvação. “Que diremos, pois? Permaneceremos no pecado, para que seja a graça mais abundante? De modo nenhum! Como viveremos ainda no pecado, nós os que para ele morremos? Ou, porventura, ignorais que todos nós que fomos batizados em Cristo Jesus fomos batizados na sua morte? Fomos, pois, sepultados com ele na morte pelo batismo; para que, como Cristo foi ressuscitado dentre os mortos pela glória do Pai, assim também andemos nós em novidade de vida” (Rm 6.1-4).

Evidentemente, Paulo já havia encontrado considerável oposição à doutrina da justificação pela fé. Certamente, seus ouvintes judeus foram incapazes de conceber um agradar a Deus por qualquer meio diferente da rigorosa lealdade à lei rabinica. NO sistema deles, o legalismo representava a essência da piedade (cf. At 15.1-29). Para os judeus legalistas, a justificação pela fé soava como antino-mianismo. Ensinar que salvação é obra de Deus, e não nossa, era uma afronta ao ego arrogante deles. A noção de que a graça de Deus flui onde o pecado floresce atingia o âmago do sistema deles (cf. Lc 18.11-12). Como não entendiam a graça, podiam pensar somente numa alternativa oposta ao legalismo: antinomianismo. Concluíam que, se a salvação é totalmente pela graça, e a graça glorifica Deus, e Deus tem prazer em justificar o ímpio, então, por que não pecar mais? Afinal de contas, a impiedade permite que Deus demonstre sua graça em medidas maiores

A propósito, essa era a teologia de Rasputin, conselheiro religioso da família que reinou na Rússia há aproximadamente um século. Ele ensinava que o pecado do homem glorifica a Deus. Quanto maior o pecado do homem, tanto mais Deus é glorificado em conceder graça. Portanto, ele encorajava as pessoas a pecarem com liberalidade. Segundo Rasputin, aqueles que reprimem seu pecado reprimem a habilidade de Deus de mostrar sua glória. Seu ensino contribuiu para a ruína da Rússia.

Em meados do século XVII, uma seita inglesa conhecida como os Ranters (faladores) ensinou doutrina semelhante. Eles encorajavam a imoralidade e a auto-satisfação, crendo que Deus é glorificado em mostrar graça. O puritano Richard Baxter se opôs ao ensino deles.

O próprio Paulo já havia confrontado idéias semelhantes. Em Romanos 3.5- 6, ele mencionou o argumento dos que alegavam que Deus era injusto em punir o pecado, uma vez que nossa injustiça manifesta a justiça dEle. Em seguida, Paulo censurou aqueles que haviam acusado os apóstolos de ensinar antinomianismo pragmático - “Pratiquemos males para que venham bens?” (Rm 3.8).

Vemos que o antinomianismo tem sido uma ameaça desde

OS primeiros dias da igreja. Judas escreveu; “Certos indivíduos se introduziram com dissimulação, OS quais, desde muito, foram antecipadamente pronunciados para esta condenação, homens ímpios, que transformam em libertinagem a graça de nosso Deus e negam O nosso único Soberano e Senhor, Jesus Cristo” (v. 4). Judas estava descrevendo OS primeiros antinomianos.

Em Romanos 6, Paulo disse que a justificação pela fé não deixa espaço para

O antinomianismo. Ele combateu O antinomianismo sem ceder O mínimo aos legalistas. Paulo não abandonaria a graça de Deus para acomodar O legalismo, nem abandonaria a justiça de Deus para acomodar a devassidão. De acordo com Paulo, a verdadeira santidade é um dom de Deus, assim como O é O novo nascimento e a vida espiritual que ele traz. Uma vida destituída de santidade não pode afirmar que possui a justificação.

“Permaneceremos no pecado, para que seja a graça mais abundante?” A palavra grega traduzida por “permaneceremos” tem a idéia de persistência habitual. Paulo não estava perguntando se OS crentes podiam cair em pecado; ele estava descartando a atitude de pecar intencional, obstinada e constante como uma rotina de vida.

Em termos teológicos, esta é a pergunta direta; a justificação pode realmente existir sem a santificação? A resposta de Paulo é, enfaticamente, não.

Estar vivo em Cristo é estar morto para o pecado.

“De modo nenhum” (6.2) é uma tradução exata, mas a força da exclamação de Paulo é mais bem afirmada nestes termos; “ISSO nunca acontecerá!” A própria sugestão de que O pecado na vida do crente pode, de algum modo, glorificar a Deus era detestável para Paulo; “Como viveremos ainda no pecado, nós OS que para ele morremos?”

OS cristãos morreram para O pecado. Portanto, era inconcebível para Paulo que continuemos a viver no pecado do qual fomos libertos pela morte. Só uma mente corrompida que usa uma lógica pervertida pode argumentar que continuar vivendo em pecado mag-nifica a graça de Deus. É evidente que a morte acaba com a vida, é igualmente óbvio que a morte para o pecado deve por fim a uma vida de transgressão ininterrupta.

“Para ele [o pecado] morremos” (no grego, apothnêskõ) fala de um evento histórico, referindo-se a nossa morte na morte de Cristo. Porque estamos “em Cristo” (6.11; 8.1), e Ele morreu em nosso lugar (5.6-8), somos considerados mortos com Ele. Estamos, portanto, mortos para a punição e domínio do pecado; a morte é permanente. Morte e vida são incompatíveis. Então, a pessoa que morreu para o pecado não pode continuar a viver em iniquidade. Certamente, podemos cometer pecados, porém não vivemos mais na dimensão do pecado e sob a lei do pecado (cf. 8.2-4). O pecado é contrário à nossa nova disposição. De acordo com o apóstolo João, “todo aquele que é nascido de Deus não vive na prática de pecado; pois o que permanece nele é a divina semente; ora, esse não pode viver pecando, porque é nascido de Deus” (1 Jo 3.9). A verdade é não somente que não devemos continuar a viver em pecado ininterrupto, mas também que não podemos viver assim.

Morrer para o pecado implica um abrupto, irreversível e completo rompimento com o poder do pecado. Esta separação do pecado é o aspecto imediato e definitivo da santificação, sobre o qual falamos antes. É o aspecto passado da santificação, do qual toda a santidade prática procede.

A expressão “nós os que para ele [o pecado] morremos” não descreve uma classe avançada de cristãos. Paulo estava falando de todos os crentes. O objetivo dele era dizer que uma vida justificada deve ser uma vida santificada. A santidade prática é uma obra de Deus, assim como qualquer outro elemento da redenção. Quando nascemos de novo, Deus não somente nos declara justos, mas também começa a cultivar a justiça em nossa vida.

Assim, a salvação não é somente uma declaração forense; é um milagre de conversão, de transformação. Não existe tal coisa como um verdadeiro convertido a Cristo que é justificado, mas não está sendo santificado. Não existe um vácuo entre a justificação e a santificação. O Dr. Donald Grey Barnhouse escreveu:

Embora a justificação não seja a santificação, ela deve produzir a santificação. A santidade deve ser o critério da vida cristã. Cristo veio para salvar seu povo de seus pecados (Mt 1.21). Eles não seriam salvos em meio a seus pecados e, depois, submetidos a eles de novo. Embora os homens busquem perverter o evangelho, os cristãos não devem ser colocados em qualquer posição diferente daquela que exige santidade e conduz à santidade...

A justificação e a santificação são tão inseparáveis como a cabeça e o tronco. Não podemos ter um sem o outro. Deus não dá “justiça gratuita" sem novidade de vida. Embora a justificação, em sua ação, não tenha nada a ver com a santificação, não concluímos que a santificação é desnecessária. “Segui a paz com todos e a santificação, sem a qual ninguém verá o Senhor" (Hb 12.14). A santidade começa onde a justificação termina; e, se a santidade não começa, temos o direito de suspeitar que a justificação também nunca começou".6

Assim como a pessoa pecadora, não-regenerada, não pode deixar de manifestar seu verdadeiro caráter, tampouco o pode a pessoa regenerada. É impossível estar vivo em Cristo e, ao mesmo tempo, vivo para o pecado.

Nossa união com Cristo garante uma vida transformada.

A morte para o pecado é um resultado da união do crente com Cristo. “Ou, porventura, ignorais que todos nós que fomos batiza- dos em Cristo Jesus fomos batizados na sua morte? Fomos, pois, sepultados com ele na morte pelo batismo; para que, como Cristo foi ressuscitado dentre os mortos pela glória do Pai, assim também andemos nós em novidade de vida. Porque, se fomos unidos com ele na semelhança da sua morte, certamente, o seremos também na semelhança da sua ressurreição” (Rm 6.3-5, ênfase acrescentada).

Em outra epístola, Paulo diz que nos tornamos novas criaturas “em Cristo” (2 Co 5.17). Ele quer dizer que nossa união com Cristo é a base de nossa santificação; significa tanto o fim do velho como o começo do novo.

“Em Cristo” é uma das expressões favoritas de Paulo (cf. Rm 8.1; 12.5; 16.7; 1 Co 1.2; Cl 1.28). Porque estamos “em Cristo Jesus”, Ele se tornou para nós, “da parte de Deus, sabedoria, e justiça, e santificação, e redenção” (1 Co 1.30). Nossa vida está oculta com Cristo, em Deus (Cl 3.3). Somos sepultados com Ele na morte pelo batismo (Rm 6.4; Cl 2.12). Somos um só corpo nEle (Rm 12.5). Cristo é a nossa vida (Cl 3.4). Cristo é, em nós, a esperança da glória (Cl 1.27). Esses versículos descrevem a identificação absoluta com Cristo, que é a característica essencial dos eleitos. Estamos inseparavelmente unidos em uma esfera espiritual de vida nova.

Essa verdade insondável foi a razão pela qual Paulo repreendeu tão severamente a imoralidade sexual de alguns membros da igreja de Corinto: “Não sabeis que os vossos corpos são membros de Cristo? E eu, porventura, tomaria os membros de Cristo e os faria membros de meretriz? Absolutamente, não” (1 Co 6.15).

Estar “em Cristo” é não somente crer em algumas verdades sobre Ele, mas também estar unido a Ele, de maneira inseparável, como a fonte de nossa vida eterna, como “Autor e Consumador da fé” (Hb 12.2, ênfase acrescentada). Estar “nEle” é estar no processo de santificação.

Somos unidos com Cristo especificamente em sua morte e ressurreição (Rm 6.3-10). Essa verdade é maravilhosa demais para compreendermos plenamente, mas a idéia principal que Paulo deseja comunicar é que morremos com Cristo, a fim de que tenhamos vida por meio dEle e vivamos como Ele. A ênfase de Paulo não está na imoralidade de continuarmos vivendo como vivíamos antes de sermos salvos, mas na impossibilidade de isso acontecer. Todo o propósito de nossa união com Cristo em sua morte e ressurreição é que “andemos nós em novidade de vida” (v. 4). Como poderíamos continuar no domínio do pecado?

Então, a consequência certa de nossa união na morte de Cristo para o pecado e sua ressurreição para a vida é que compartilharemos o seu viver santo. “Se fomos unidos com ele na semelhança da sua morte, certamente, o seremos também na semelhança da sua ressurreição”. Visto que morreu o que éramos antes, uma nova criação nasceu (cf. 2 Co 5.17). O bispo Handley Moule escreveu: “Não devemos nem mesmo pensar no pecador aceitando a justificação e continuando a viver para si mesmo. Isso é uma contradição moral do tipo mais grave, e não pode ser nutrido sem evidenciar um erro no credo espiritual do homem”.7

Em Cristo não somos as mesmas pessoas que éramos antes da salvação. “Foi crucificado com ele o nosso velho homem, para que o corpo do pecado seja destruído, e não sirvamos o pecado como escravos” (Rm 6.6). Em outra epístola, Paulo escreveu: “Estou crucificado com Cristo; logo, já não sou eu quem vive, mas Cristo vive em mim; e esse viver que, agora, tenho na carne, vivo pela fé no Filho de Deus, que me amou e a si mesmo se entregou por mim” (Gl 2.19-20). Nossa nova vida como cristãos não é uma antiga vida aperfeiçoada, e sim uma nova vida divinamente concedida, que possui a mesma natureza do próprio Cristo. Foi sobre essa vida que nosso Senhor falou quando prometeu vida abundante (Jo 10.10).

Paulo também não está descrevendo um cristão dualista, esquizofrênico. O velho homem — a pessoa não-regenerada que estava “em Adão” (cf. 1 Co 15.22; Rm 5.14-15) — está morta. Devemos nos “despojar” do velho homem crucificado, morto e corrupto (Ef 4.22) e nos revestir “do novo homem, criado segundo Deus, em justiça e retidão procedentes da verdade” (v. 24). No que concerne a todo crente genuíno, é verdade que nosso velho homem está morto. “Os que são de Cristo Jesus crucificaram a carne, com as suas paixões e concupiscências” (Gl 5.24). Se o velho homem não está morto, a conversão não ocorreu. Paulo lembrou aos crentes de Colossos que eles já se haviam despido “do velho homem com os seus feitos” e se revestido “do novo homem que se refaz para o pleno conhecimento, segundo a imagem daquele que o criou” (Cl 3.9-10).

Como observaremos no capítulo 8, os cristãos pecam por causa dos vestígios da carne pecaminosa, e não porque possuem a mesma velha e ativa natureza pecaminosa. Certamente, pecamos, mas, quando pecamos, nós o fazemos em contrário à nossa natureza, e não porque temos duas disposições — uma pecaminosa e outra que não é pecaminosa. “Foi crucificado com ele o nosso velho homem, para que o corpo do pecado seja destruído” (Rm 6.6).

Isso não significa que nossas tendências pecaminosas estão aniquiladas. A palavra grega traduzida por “destruído” significa literalmente “tornar ineficaz, invalidar”. O pecado perdeu seu controle sobre nós. Obviamente, todos lutamos com propensões pecaminosas. A morte do velho homem pecador não significa a morte da carne e de suas inclinações corruptas. Por causa dos prazeres do pecado e da fraqueza de nossa carne remanescente, geralmente cedemos ao pecado.

A tirania e a punição do pecado foram anuladas, mas o seu potencial de expressão ainda não foi completamente removido. Nossas fraquezas e instintos humanos nos tornam capazes de sucumbir à tentação (como veremos no capítulo 8, ao considerarmos Romanos 7.14-25). Somos, em resumo, novas criaturas — santas e redimidas, mas envolvidas em mortalhas de um corpo não-redimido. Somos como Lázaro, que saiu do túmulo ainda envolvido, da cabeça aos pés, em vestes de sepultamento. Jesus instruiu àqueles que estavam perto: “Desatai-o e deixai-o ir” (Jo 11. 44).

Por ÍSSO, O apóstolo admoesta OS crentes; “Não sirvamos O pecado como escravos” (Rm 6.6). A tradução deixa o significado um pouco ambíguo. Paulo está sugerindo que é opcional viver como escravos do pecado? Ele está inferindo que temos uma escolha — que os cristãos ainda podem ser subjugados ao pecado? OS versículos 17 e 18 respondem a essa pergunta sem ambiguidade; “Outrora, escravos do pecado, contudo, viestes a obedecer de coração à forma de doutrina a que fostes entregues; e, uma vez libertados do pecado, fos-tes feitos servos da justiça” (ênfase acrescentada). Cada verbo nesses dois versículos ressalta a verdade de que nossa escravidão ao pecado já foi destruída por Cristo e, daqui em diante, é coisa do passado. O versículo 22 confirma isso; “Libertados do pecado, transformados em servos de Deus, tendes o vosso fruto para a santificação e, por fim, a vida eterna”.

No versículo 6, a expressão “não sirvamos o pecado como escravos” significa claramente que os crentes não podem mais ser escravos do pecado. Nenhum cristão genuíno vive em sujeição ao pecado. Aqueles que morreram em Cristo estão livres de tal escravidão (v. 7). Paulo até usa a analogia do casamento (Rm 7.1-4), detalhando que o primeiro esposo morreu, de modo que não estamos mais sujeitos a ele, pois fomos libertados e unidos a um novo esposo, isto é, a Cristo, “a fim de que frutifiquemos para Deus” (v.4).

Pedro ensinou precisamente a mesma coisa; “Ora, tendo Cristo sofrido na carne, armai-vos também vós do mesmo pensamento; pois aquele que sofreu na carne deixou o pecado, para que, no tempo que vos resta na carne, já não vivais de acordo com as paixões dos homens, mas segundo a vontade de Deus” (1 Pe 4.1-2).

A fé é o meio pelo qual vencemos o pecado.

A série de verbos em Romanos 6 — “saber” (vv. 3, 6, 9), “considerar” (v. 11) e “oferecer” (v. 13) — falam de fé. Na verdade, correspondem perfeitamente aos três elementos essenciais da fé que registramos no capítulo 3: conhecimento (notitia), aceitação (assensus) e confiança (fiducia). Paulo estava desafiando os crentes romanos a aplicarem sua fé mais diligentemente, despirem-se das velhas roupas de sepultamento e viverem a nova vida para a plenitude da justiça e da glória de Cristo. “Considerai-vos mortos para o pecado, mas vivos para Deus, em Cristo Jesus. Não reine, portanto, o pecado em vosso corpo mortal, de maneira que obedeçais às suas paixões; nem ofereçais cada um os membros do seu corpo ao pecado, como instrumentos de iniqüidade; mas oferecei-vos a Deus, como ressurretos dentre os mortos, e os vossos membros, a Deus, como instrumentos de justiça. Porque o pecado não terá domínio sobre vós; pois não estais debaixo da lei, e sim da graça” (6.11-14). Isso resume a vida de fé.

Nossa morte espiritual para o pecado e nossa ressurreição espiritual para uma nova vida com Cristo são o novo fundamento de nossa santificação. Precisamos saber e crer que não somos o que costumávamos ser. Devemos admitir que não somos pecadores remodelados, mas santos nascidos de novo. Devemos entender a verdade de que não estamos mais sob a tirania do pecado. O alvorecer da fé é o conhecimento dessas realidades espirituais. “O meu povo está sendo destruído, porque lhe falta o conhecimento. Porque tu... rejeitaste o conhecimento, também eu te rejeitarei” (Os 4.6).

Considerar leva adiante a resposta do crente: “Considerai-vos mortos para o pecado, mas vivos para Deus, em Cristo Jesus” (Rm 6.11). “Considerar” ou “imputar” vêm da mesma palavra grega, logi-zomai, que vimos em Romanos 4.3 (“Abraão creu em Deus, e isso lhe foi imputado para justiça”). Era um termo de contabilidade que significava “calcular” ou “avaliar”. Neste contexto, ele conduz a fé do crente para além do mero conhecimento. “Considerar”, nesta passagem, significa ter confiança sem reservas, afirmar a verdade com todo o coração; e isso é o contrário de apenas conhecê-la intelectualmente.

Oferecer avança mais ainda e envolve a vontade do crente. Paulo escreveu: “Não reine, portanto, o pecado em vosso corpo mortal, de maneira que obedeçais às suas paixões; nem ofereçais cada um os membros do seu corpo ao pecado, como instrumentos de iniqüidade; mas oferecei-vos a Deus, como ressurretos dentre os mortos, e os vossos membros, a Deus, como instrumentos de justiça” (Rm 6.12-13).

O pecado ainda é uma força poderosa, porém não é mais senhor do cristão. O pecado é como um monarca deposto, embora furioso e determinado a reinar novamente em nossa vida. Ainda ocupa algum território, mas não a capital. Paulo diz que não devemos nos oferecer ao pecado, e sim a Deus. Isso é um ato de confiança. “Esta é a vitória que vence o mundo: a nossa fé” (1 Jo 5.4). Então, até nossa santificação acontece pela fé.

A graça garante a vitória sobre o pecado.

Visto que a salvação permanece para sempre, nossa alma imortal está eternamente além do alcance do pecado. Todavia, o pecado pode atacar os cristãos no corpo mortal deles. Até o nosso corpo um dia será glorificado e estará para sempre fora do alcance do pecado; mas, enquanto esta vida durar, estaremos sujeitos à corrupção e à morte. “É necessário que este corpo corruptível se revista da incorruptibilidade, e que o corpo mortal se revista da imortalidade” (1 Co 15.53). Até que isso aconteça, nosso corpo mortal ainda estará sujeito ao pecado. É por isso que “gememos em nosso íntimo, aguardando a adoção de filhos, a redenção do nosso corpo” (Rm 8.23).

Portanto, Paulo diz: “Nem ofereçais cada um os membros do seu corpo ao pecado, como instrumentos de iniqüidade; mas oferecei-vos a Deus, como ressurretos dentre os mortos, e os vossos membros, a Deus, como instrumentos de justiça” (Rm 6.13). Esse texto corresponde a Romanos 12.1: “Rogo-vos, pois, irmãos, pelas misericórdias de Deus, que apresenteis O VOSSO corpo por sacrifício VÍVO, santo e agradável a Deus, que é O VOSSO culto racional” (ênfase acrescentada); bem como a 1 Coríntios 9.27: “Esmurro O meu corpo e O reduzo à escravidão, para que, tendo pregado a outros, não venha eu mesmo a ser desqualificado” (ênfase acrescentada).

Muitos tradutores têm sido embaraçados pelos tempos verbais de Romanos 6.12-13. “Não reine... O pecado” e “nem ofereçais” são imperativos no tempo presente e na voz ativa. Estão em contraste com o imperativo aoristo “oferecei-vos a Deus”. À primeira vista, parece que O apóstolo estava dizendo “parem de deixar O pecado reinar e parem de oferecer seus membros ao pecado, mas submetam-se a Deus”, implicando que essas pessoas eram cristãos que nunca haviam-se rendido ao senhorio de Cristo.

NO entanto, O contexto indica claramente outra coisa. Paulo também lhes recorda: “Viestes a obedecer de coração” (V. 17); “fos-tes feitos servos da justiça” (V. 18); “[fostes] libertados do pecado, transformados em servos de Deus” (V. 22). Eles não eram pessoas que nunca haviam-se rendido. Aqui, em Romanos 12.1-2, Paulo estava apenas encorajando-os a continuar rendendo na prática O que já haviam rendido em princípio. Estava pedindo uma rendição decisiva e deliberada na vida deles naquele exato momento.

Há dúvidas quanto ao resultado? Certamente, não. NO versículo 14 Paulo oferece essas palavras animadoras: “O pecado não terá domínio sobre vós; pois não estais debaixo da lei, e sim da graça” (Rm 6.14). O cristão não está mais sob O poder condenatório da lei de Deus, mas está, agora, sob O poder redentor de sua graça. É no poder dessa graça, pela fé, que O Senhor O chama a viver agora.

A liberdade do pecado nos faz servos da justiça. Paulo retorna à questão do antinomianismo:

E daí? Havemos de pecar porque não estamos debaixo da lei, e sim da graça? De modo nenhum! Não sabeis que daquele a quem

VOS ofereeeis como servos para obediência, desse mesmo a quem obedeceis sois servos, seja do pecado para a morte ou da obediência para a justiça? Mas graças a Deus porque, outrora, escravos do pecado, contudo, viestes a obedecer de coração à forma de doutrina a que fostes entregues; e, uma vez libertados do pecado, fostes feitos servos da justiça.

Romanos 6.15-18

Liberdade da lei significa liberdade da escravidão do pecado e liberdade da punição da lei — não liberdade da restrição moral. Graça não significa que temos permissão de fazer O que nos agrada; significa que temos O poder de fazer O que agrada a Deus. A mera sugestão de que a graça de Deus nos dá permissão para pecar contradiz a si mesma, pois O propósito da graça é libertar-nos do pecado. Como podemos continuar em pecado, nós que somos recebedores da graça?

“De modo nenhum!” é a mesma poderosa e inequívoca negação que Paulo expressou no versículo 2. Essa verdade não precisa de provas; é evidente em si mesma. “Não sabeis?” implica que todos deveriam entender esse fato tão básico. O que poderia ser mais óbvio? Quando vocês se apresentam a alguém como escravos, para obedecer, são escravos daquele a quem obedecem! Há somente duas escolhas. Se nossa vida é caracterizada pelo pecado, somos escravos do pecado. Se somos caracterizados pela obediência, somos escravos da justiça (VV. 16-17). Em qualquer dos casos, não somos nossos próprios senhores.

Também é verdade que “ninguém pode servir a dois senhores; porque ou há de aborrecer-se de um e amar ao outro, ou se devotará a um e desprezará ao outro. Não podeis servir a Deus e às riquezas” (Mt 6.24). Você não pode servir a Deus e ao pecado. Aqueles que pensam ser cristãos, mas são dominados pelo pecado estão terrivelmente enganados. Não podemos ter, ao mesmo tempo, duas naturezas contraditórias. Não podemos viver simultaneamente em dois domínios espirituais opostos. Não podemos servir a dois senhores. Ou somos, por nascimento, escravos do pecado, ou somos, pela regeneração, escravos da justiça. Não podemos estar tanto no Espírito como na carne (cf. Rm 8.5-9).

Paulo não estava ensinando aos cristãos romanos que eles tinham de ser escravos da justiça. Estava lembrando-lhes que eram escravos da justiça. Ele disse essa mesma verdade aos cristãos de Colossos: “E a vós outros também que, outrora, éreis estranhos e inimigos no entendimento pelas vossas obras malignas, agora, porém, vos reconciliou no corpo da sua carne, mediante a sua morte, para apresentar-vos perante ele santos, inculpáveis e irrepreensíveis” (Cl 1.21-22). Para o cristão, a vida de injustiça e inimizade para com Deus está no passado. Nenhum crente verdadeiro continuará indefinidamente em desobediência, porque o pecado é diametralmente oposto à nossa nova e santa natureza. Os cristãos verdadeiros não suportam um viver perpetuamente pecaminoso.

Assim, Paulo lembra aos cristãos romanos que eles não são mais escravos do pecado: “Graças a Deus porque, outrora, escravos do pecado, contudo, viestes a obedecer de coração à forma de doutrina a que fostes entregues” (v. 17). Paulo não está falando sobre uma demonstração de justiça legalista ou mecânica: “Viestes a obedecer de coração”. A graça transforma o ser mais íntimo da pessoa. Alguém cujo coração não foi transformado não é salvo. A marca da graça é um coração obediente.

Outra vez, devemos ser claros: a obediência não produz nem mantém a salvação, é, porém, a característica inevitável daqueles que são salvos. O desejo de conhecer a verdade de Deus e obedecer-Lhe é uma das marcas mais seguras da salvação genuína. Jesus deixou claro: aqueles que obedecem à sua palavra são cristãos verdadeiros (cf. Jo 8.31; 14.21, 23, 24; 15.10).

Escravos do pecado — incrédulos — são livres da justiça (Rm 6.20). Por outro lado, os cristãos são livres do pecado e escravos de

Deus mediante a fé em Jesus Cristo (V. 22). O beneficio inevitável é santificação, e o resultado final é vida eterna (V. 22). Essa promessa resume todo o objetivo de Romanos 6: Deus não somente nos livra da punição do pecado (justificação), mas também nos livra da tirania do pecado (santificação).

No entanto, embora não estejamos mais sujeitos ao domínio do pecado, todos nós lutamos desesperadamente contra o pecado em nossa vida. Como isso acontece e o que podemos fazer a seu respeito - isso é o assunto do capitulo 8.

Capítulo 8

Citado em: MURRAY, Iain. D. Martyn Lloyd-Jones: the first forty years. Edinburgh: Banner of Truth, 1982. p. 375.

RYRIE, Charles C. Balancing the christian life. Chicago: Moody, 1969. p. 186-187. Enfase acrescentada.

RYLE, J. C. Santidade sem a qual ninguém verá o Senhor. 2. ed. São José dos Campos, SP: Fiel, 2009. p. 22-23.

Por essa razão, Zane Hodges escreveu: “O jovem rico não estava pronto para uma vida [de confiança no senhorio de Jesus], mas os discípulos do Filho de Deus que nasceram de novo estavam" (AF 189).

WARFIELD, Benjamin B. Perfectionism. Philadelphia: Presbyterian & Reformed, 1958. p. 356- 357. Warfield continuou dizendo: “Esta separação grosseira entre a santificação e a justificação, como se a santificação fosse um dom adicional da graça, a ser buscado e obtido por si mesmo — em vez de um componente inseparável da salvação que pertence a todos os crentes, como ela realmente é — oferece o fundamento, é claro, para aquele círculo de idéias que são resumidas na expressão ‘segunda bênção'. Essas idéias estão longe de ser benéficas. Entre elas pode ser mencionada, por exemplo, a criação de dois tipos diferentes de cristãos, uma variedade mais baixa e uma mais elevada” (Ibid., p. 357-358). É claro que o erro de considerar os cristãos como divididos em duas classes está na base de todo o ensino da teologia do nãosenhorio. Veja outra discussão sobre isso no capítulo 8.

BARNHOUSE, Donald G. Romans, 4 v. Grand Rapids, Mich.: Eerdmans, 1961. 3:2.10-12.

MOULE, Handley. The epistle to the Romans. London: Pickering & Inglis, [n. d.]. p. 160-161.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O autor conta de um homem que amava a "verdade posicional" mas vivia em pecado, concluindo que a sua posição em Cristo não exigia mudança na prática; você já usou as verdades preciosas da sua salvação como motivo para não se preocupar com o seu pecado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A aula ensina, a partir de Romanos 6, que quem morreu para o pecado não pode mais viver nele como rotina de vida; ao olhar para o padrão da sua existência, você é caracterizado por obediência ou pela prática habitual e intencional do pecado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele afirma que ninguém precisa de uma "segunda bênção" depois da conversão, pois quem é justificado já começou a ser santificado; você tem esperado uma experiência futura que lhe dê o que a verdadeira conversão já deveria ter produzido em você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Com 0 Pecado$t$, 8,
$conteudo$A forma que a santificação assume é a de conflito com o pecado dentro de nós, o qual nos ataca constantemente. O conflito, que dura toda a vida, envolve tanto resistência aos ataques do pecado como o contra-ataque da mortificação, pela qual buscamos esgotar a vida deste inimigo incômodo.

J. I. PACKER1

Um homem que há muito tem defendido a doutrina do não-se-nhorio escreveu para mim a fim de contestar meu ensino quanto ao evangelho. Eu o convidei para almoçarmos juntos, pensando que uma conversa pessoal poderia ajudar-nos a entender melhor um ao outro. Ele era um colega de ministério, pastor de uma grande igreja; acreditei que teríamos muito em comum, embora discordássemos neste assunto tão básico.

Encontramo-nos, e senti o diálogo foi proveitoso. Embora nenhum de nós tenha mudado seu ponto de vista sobre o evangelho, conseguimos esclarecer mal-entendidos em ambos os lados.

Vários meses depois de nosso encontro, fiquei triste ao ler a noticia de que sua igreja lhe pedira que renunciasse o cargo, porque era culpado de imoralidade sexual. Ele vinha mantendo uma vida dupla por mais de dez anos; agora, seu pecado e infidelidade haviam sido vergonhosamente expostos.

Sua tolerância àquele pecado era resultado de sua teologia? Talvez, não. Certamente outros pastores que não aderem à teologia do não-senhorio têmse desqualificado moralmente. Por outro lado, muitos que sustentam a teologia do não-senhorio conseguem evitar sua queda em pecado sórdido.

Mudemos a pergunta: a teologia dele foi um auxilio ao seu estilo de vida pecaminoso? Deve ter sido. Pelo menos isto é certo: a teologia do nãosenhorio teria um efeito amenizante num cristão professo que tenta racionalizar a imoralidade prolongada. Em vez de submeter sua consciência e comportamento à mais intensa auto-análise, ele podia achar segurança na idéia de que, afinal de contas, muitos cristãos são permanentemente “carnais”. Com certeza, a crença de que o arrependimento é opcional encoraja aquele que deseja afirmar que segue a Cristo enquanto justifica uma vida de pecado impenitente. Sem dúvida, a pregação que promove constantemente a “graça” e jamais mostra a lei pode ajudar esse tipo de pessoa a achar conforto enquanto peca. A doutrina do não-senhorio é uma conveniência perfeita para qualquer pessoa que tenta justificar um cristianismo frio.

Não estou dizendo, de modo nenhum, que todos que apóiam a doutrina do não-senhorio têm uma vida imoral. Obviamente, este não é o caso. Também não estou dizendo que essas pessoas defendem um viver injusto. Não conheço um só mestre da doutrina do não-se-nhorio que ignoraria publicamente o comportamento pecaminoso. De fato, a verdade é o oposto: os pregadores da teologia do não-senhorio apresentam, com freqüência, fortes apelos à santidade. Um dos principais objetivos da pregação da teologia do não-senhorio é convencer OS “crentes carnais” a tornarem-se “crentes espirituais”. Então, apelos à obediência e à rendição são comuns na pregação da doutrina do não-senhorio, exceto nas mensagens evangelísticas. Felizmente, a maioria dos mestres da teologia do não-senhorio vivem uma teologia melhor do que aquela em que dizem acreditar.

Entretanto, creio que muitas pessoas que permitem intencionalmente o pecado impenitente e inconfesso em sua vida também adotam a doutrina do não-senhorio, porque esta lhes permite ter o consolo da “segurança” em meio à rebelião do pecado.

Creio que a teologia do não-senhorio tende a enfraquecer a santidade, embora não seja esta a intenção dos mestres dessa teologia. Ela faz isso por oferecer a salvação do inferno, e não a salvação do pecado; por remover os efeitos morais da fé e do arrependimento, por tornar opcional a obediência a Deus, por oferecer segurança de salvação até a pessoas que vivem em carnalidade perpétua.

O mito do crente carnal

Quase toda a teologia do não-senhorio apóia-se fortemente na noção de que há três classes de pessoas na humanidade: os não-salvos, os crentes espirituais e os crentes carnais. Essa idéia foi um dos suportes colocados por Lewis Sperry Chafer na plataforma da doutrina do não-senhorio. Chafer popularizou o conceito de cristão carnal em seu livro Aquele que é Espiritual, publicado em 1918.2 C. I. Scofield, amigo de Chafer, incluiu um esquema semelhante em um comentário na Bíblia de Referência de Scofield.

Em anos recentes, a idéia de cristão carnal tem sido disseminada por meio de uma série de panfletos e livretes publicados pelo ministério Campus Crusade for Christ. A literatura desse ministério realça um diagrama com três círculos que representam as três classes de pessoas da humanidade. No centro de cada círculo, há um trono. O não-cristão tem a si mesmo no trono, e Cristo está fora do círculo. O cristão carnal “convidou” a Cristo para entrar no círculo, mas o próprio cristão se mantém no trono. O cristão espiritual coloca a Cristo no trono e fica aos pés do trono. O livrete desafia os cristãos carnais a tornarem-se espirituais. Milhões desses livretes foram distribuídos por todo o mundo nos últimos trinta anos. Sem dúvida, eles são a porção de literatura da doutrina do não-senhorio lida mais amplamente e têm ajudado a influenciar multidões a aceitarem como bíblica a dicotomia de cristão espiritual/carnal.

Mas toda a idéia se baseia numa compreensão errônea de 1 Co-ríntios 2.14- 3.3:

Ora, o homem natural não aceita as coisas do Espírito de Deus, porque lhe são loucura; e não pode entendê-las, porque elas se discernem espiritualmente. Porém o homem espiritual julga todas as coisas, mas ele mesmo não é julgado por ninguém. Pois quem conheceu a mente do Senhor, que o possa instruir? Nós, porém, temos a mente de Cristo. Eu, porém, irmãos, não vos pude falar como a espirituais, e sim como a carnais, como a crianças em Cristo. Leite vos dei a beber, não vos dei alimento sólido; porque ainda não podíeis suportá-lo. Nem ainda agora podeis, porque sois carnais. Porquanto, havendo entre vós ciúmes e contendas, não é assim que sois carnais e andais segundo o homem?

Nessa passagem, o apóstolo Paulo estava repreendendo os crentes de Corinto por seu comportamento não-cristão. A igreja estava-se dividindo em facções, alguns dizendo: “Eu sou de Paulo”, e outros: “Eu, de

Apoio” (1 CO 3.4). Paulo lhes disse que seu comportamento divisor era indigno de cristãos; “Ainda sois carnais [grego sarkikos, ‘concernente à carne’]. Porquanto, havendo entre vós ciúmes e contendas, não é assim que sois carnais e andais segundo o homem?”

Claramente, Paulo estava acusando os coríntios de comportarem-se como não-cristãos. Facções não era o único problema em Corinto. Os crentes daquela igreja estavam tolerando um relacionamento incestuoso que um suposto irmão mantinha com a esposa de seu pai (5.1). Alguns embriagavam-se e comportavam-se desorde-nadamente no culto de Ceia do Senhor (11.17-22). Alguns cristãos levavam aos outros ao tribunal (6.1-8). Estavam abusando do dom de línguas (14.23); e as mulheres se mostravam indisciplinadas nos cultos (14.34).

No entanto, em 1 Coríntios 2.14-3.3, o mais do que certo é que Paulo não estava definindo duas classes de cristãos ou três classes de humanidade. Paulo fez distinção nítida entre “o homem natural” e “o homem espiritual” (2.14-15) — entre a pessoa não-salva e o cristão. Ele reconheceu que todos os cristãos são capazes de comportamento carnal. Mas nunca, em nenhuma de suas epístolas, o apóstolo falou em duas classes de crentes.

Em Romanos 8, o contraste de Paulo era entre “o pendor da carne” (nãocristãos) e “o [pendor] do Espírito” (v. 6 — cristãos); entre “os que estão na carne” (v. 8 — não-cristãos) e aqueles que estão “no Espírito” (v. 9 — cristãos). O que ele queria dizer é inconfundível, pois falou explicitamente no versículo 9; “Vós, porém, não estais na carne, mas no Espírito, se, de fato, o Espírito de Deus habita em vós. E, se alguém não tem o Espírito de Cristo, esse tal não é dele”.

Então, de acordo com Paulo, todos os cristãos são espirituais. Conforme veremos, Paulo também reconheceu que todos os crentes comportam-se às vezes de modo carnal. Por isso, ele estava repreendendo os coríntios.

Obviamente, esses cristãos de Corinto eram imaturos; e, por ÍSSO, Paulo os chamou de “crianças em Cristo” (3.1). Entretanto, diferentemente de muitos supostos cristãos carnais em nossos dias, eles não eram indiferentes às coisas espirituais. De fato, a sua submissão a certos líderes e a sua atitude de abusarem dos dons refletiam um zelo mal empregado. É claro que esses cristãos tinham desejos espirituais, não importando quão imperfeitamente seguissem tais desejos.

Observe também que Paulo não insistiu em que os coríntios buscassem alguma experiência de segundo nível. Ele não os aconselhou a “fazer de Cristo o Senhor” ou a dedicarem-se de uma vez por todas. Pelo contrário, ele lhes disse: “De maneira que não vos falte nenhum dom, aguardando vós a revelação de nosso Senhor Jesus Cristo, o qual também vos confirmará até ao fim, para serdes irrepreensíveis no Dia de nosso Senhor Jesus Cristo” (1.7-8).

Todavia, Paulo não tolerava aqueles que, de propósito, agiam segundo a carne. Por exemplo, quando ele soube do pecado de incesto daquele homem, instruiu os cristãos de Corinto a entregarem-no “a Satanás para a destruição da carne, a fim de que o espírito seja salvo no Dia do Senhor [Jesus]” (5.5). Perceba o que o apóstolo fala sobre aqueles que estão na igreja e são impuros, idólatras, maldizentes, be-berrões ou roubadores. Ele não os chama de cristãos carnais, e sim de pessoas que se dizem irmãos (5.11). Paulo instruiu os irmãos a que nem mesmo comessem com pessoas assim. Fica claro que ele sabia que tais pecados — persistentes, intencionais e inveterados — colocavam em dúvida a profissão de fé de alguém. Paulo corrigiu a atitude leniente da igreja para com este homem em pecado e outros semelhantes a ele. Evidentemente, os coríntios tinham o hábito de aceitar esse tipo de pessoa talvez como cristãos de segunda classe — como o fazem os evangélicos contemporâneos. Contudo, Paulo mandou a igreja discipliná-los (5.9-13); isso proporcionaria o discernimento quanto a serem pessoas naturais, não-redimidas e associadas aos crentes, ou pessoas espirituais que agiam de modo carnal.

Até que ponto os cristãos podem pecar?

Recentemente, li um livro que falava sobre os cristãos e o pecado. O livro começava com um relato incomum. O autor do livro conhecia um pastor que fora enviado à prisão por roubar catorze bancos para financiar seus namoros com prostitutas! O autor estava plenamente convicto de que o ladrão de bancos libertino era um cristão verdadeiro; e escreveu um livro para investigar como isso poderia ser possível.

Você pode me chamar de antiquado, mas penso que é justo questionar se alguém que rouba bancos regularmente, a fim de pagar por sexo ilícito, é salvo! O pecado do homem era, secretamente, seu estilo de vida. Há razões para acreditarmos que ele ainda estaria cometendo seus crimes hoje, se não tivesse sido preso. Podemos admitir que este “suposto irmão” era um cristão genuíno só porque havia sido um pastor evangélico?

É verdade que não podemos julgar o coração do homem, mas devemos julgar seu comportamento (1 Co 5.12). “Ou não sabeis que os injustos não herdarão o reino de Deus? Não vos enganeis: nem impuros, nem idólatras, nem adúlteros, nem efeminados, nem sodomitas, nem ladrões, nem avarentos, nem bêbados, nem maldizentes, nem rou-badores herdarão o reino de Deus” (1 Co 6.9-10). Nesses versículos, o apóstolo Paulo estava descrevendo pecados crônicos de comportamento, pecados que afetam todo o caráter de alguém. Uma predileção por esses pecados reflete um coração não-regenerado. Paulo lembrou àqueles cristãos: “Tais fostes alguns de vós; mas vós vos lavastes, mas fostes santificados, mas fostes justificados em o nome do Senhor Jesus Cristo e no Espírito do nosso Deus” (v. 11, ênfase acrescentada).

Mas, espere. As Escrituras não incluem exemplos de crentes que cometeram pecados graves? Davi não cometeu assassinato e adultério, permanecendo quase um ano sem confessar seu pecado? Ló não foi caracterizado por transigência mundana em meio a um pecado abominável? Sim, esses exemplos provam que crentes genuí- nos são capazes de cometer os piores pecados imagináveis, mas não podemos tornar Davi e Ló exemplos de crentes “carnais”, cujo estilo de vida e anelos não são diferentes de pessoas não-regeneradas.

Davi, por exemplo, arrependeu-se completamente de seu pecado, quando Natã o confrontou, e aceitou de bom grado a disciplina do Senhor (2 Sm 12.1-23). Salmos 51 é uma expressão do profundo arrependimento de Davi no fim deste sórdido episódio de sua vida. A verdade é que o pecado foi apenas um episódio na vida de Davi. Certamente ele não tinha predisposição para aquele tipo de pecado. De fato, 1 Reis 15.5 diz: “Davi fez o que era reto perante o Senhor e não se desviou de tudo quanto lhe ordenara, em todos os dias da sua vida, senão no caso de Urias, o heteu” (ênfase acrescentada).

Ló é um caso diferente. No relato do Antigo Testamento, não sabemos muito sobre Ló; e o que é registrado a respeito dele é decepcionante. Ló foi um exemplo triste de transigência e desobediência. Na véspera da destruição de Sodoma, quando deveria ter fugido da cidade, ele demorou (Gn 19.16). Os mensageiros angelicais tiveram de pegá-lo pela mão e colocá-lo fora da cidade. Ao aproximar-se o fim de sua vida, suas duas filhas o embebedaram e cometeram incesto com ele (Gn 19.30-38). Certamente Ló parecia ter uma inclinação para pecados de transigência e mundanismo.

Apesar disso, no Novo Testamento, o escritor inspirado nos diz que Ló era “afligido pelo procedimento libertino daqueles insubordinados (porque este justo, pelo que via e ouvia quando habitava entre eles, atormentava a sua alma justa, cada dia, por causa das obras iníquas daqueles)” (2 Pe 2.7-8). Ele odiava o pecado e desejava a justiça. Teve respeito pelos santos anjos — evidência de seu temor a Deus (Gn 19.1-14). Obedeceu a Deus não olhando para trás, para Sodoma, quando o juízo de Deus caiu sobre a cidade (cf. v. 26).

Certamente, Ló não era carnal no sentido de que lhe faltavam anelos espirituais. Embora vivesse num lugar de iniqüidade, ele mesmo não era iníquo. Sua alma era atormentada, irritada, afligida, torturada com tristeza severa, ao ver o mal ao seu redor. Evidentemente, a sua consciência não se tornou endurecida; ele “atormentava a sua alma justa, cada dia”, com as ações perversas dos que viviam ao seu redor. Embora Ló vivesse em Sodoma, nunca se tornou um sodomita. Aqueles que o usam como uma ilustração de alguém que é salvo, mas completamente carnal, não entendem 2 Pedro 2.8.

De acordo com o ponto de vista de Pedro, qual é a lição da vida de Ló? O versículo 9 resume: “O Senhor sabe livrar da provação os piedosos e reservar, sob castigo, os injustos para o Dia de Juízo”.

No caso de Ló, um dos meios que o Senhor usou para resgatá-lo da tentação foi um castigo severo. Ló perdeu sua casa, sua esposa foi morta pelo juízo divino, e suas próprias filhas o desgraçaram e o aviltaram. Ele pagou um preço terrível por seu pecado, atormentando sua alma cada dia. Se a história de Ló prova alguma coisa, ela prova que crentes verdadeiros não pecam e ficam impunes.

Deus sempre disciplina seus filhos que pecam. Se não experimentam punição, eles não são verdadeiramente filhos de Deus, e sim bastardos espirituais. Hebreus 12.7-8 declara isso explicitamente: “Que filho há que o pai não corrige? Mas, se estais sem correção, de que todos se têm tornado participantes, logo, sois bastardos e não filhos”. O propósito específico com o qual Deus nos disciplina é “aproveitamento, a fim de sermos participantes da sua santidade” (Hb 12.10).

Tudo isso desfia a noção de que milhões de cristãos vivem num estado de carnalidade contínua. Se essas pessoas são verdadeiros filhos de Deus, por que não estão constantemente sob a disciplina de Deus?

O principal dos pecadores

Talvez o exemplo clássico de um crente pecador seja o apóstolo Paulo.

Paulo? Sim. Quanto mais o apóstolo amadurecia em Cris- to, tanto mais se consdentizava de sua própria pecaminosidade. Quando escreveu sua primeira epístola aos coríntios, referiu-se a si mesmo como “o menor dos apóstolos, que mesmo não sou digno de ser chamado apóstolo, pois persegui a igreja de Deus” (1 CO 15.9). Poucos anos depois, quando escreveu à igreja em Éfeso, ele chamou a si mesmo de “o menor de todos os santos” (Ef 3.8). Perto do fim de sua vida, quando escreveu a Timóteo, Paulo falou de si mesmo como “o principal [dos pecadores]” (1 Tm 1.15).

Isso não era um esquema engenhoso da parte dele. Paulo era extremamente sensível ao pecado em sua vida e bastante honesto sobre a sua própria luta com o pecado. Ele se angustiava com seu pecado e combatia-o constantemente. Ainda assim, Paulo foi um dos maiores santos que já viveram.

Como pode ser isso? Você não acha que alguém da estatura de Paulo seria um exemplo de vitória sobre o pecado? Ele foi. Mas, Paulo chamou a si mesmo de “desventurado homem” e principal dos pecadores? Sim. As duas coisas podem ser verdadeiras ao mesmo tempo? Absolutamente. De fato, quanto mais santos nos tornamos, tanto mais sensíveis ao pecado nos tornamos.

Martinho Lutero percebeu o paradoxo do pecado na vida de cada crente e cunhou uma expressão latina: simul justus et peccator (“justo e pecador ao mesmo tempo”). Cada crente verdadeiro luta com esse dilema. Nossa justificação é completa e perfeita; portanto, a nossa posição diante de Deus é inalterável. Mas a nossa santificação não será perfeita enquanto não formos glorificados. Ela é o prêmio de nossa soberana vocação em Cristo (Fp 3.14). Paulo escreveu: “Não que eu o tenha já recebido ou tenha já obtido a perfeição; mas prossigo para conquistar aquilo para o que também fui conquistado por Cristo Jesus” (v. 12). Neste mundo, a nossa prática nunca será perfeitamente harmônica com a nossa posição, não importando quão sinceramente busquemos a santificação.

Mas, se formos verdadeiramente nascidos de novo, buscaremos a santificação, pois O próprio Deus garante a nossa perseverança em retidão; “O mesmo Deus da paz vos santifique em tudo; e o vosso espírito, alma e corpo sejam conservados íntegros e irrepreensíveis na vinda de nosso Senhor Jesus Cristo” (1 TS 5.23). Ele “é poderoso para vos guardar de tropeços e para vos apresentar com exultação, imaculados diante da sua glória” (Jd 24).

A passagem clássica da luta pessoal de Paulo contra o pecado é Romanos 7.14-25;

Sabemos que a lei é espiritual; eu, todavia, sou carnal, vendido à escravidão do pecado. Porque nem mesmo compreendo o meu próprio modo de agir, pois não faço o que prefiro, e sim o que detesto. Ora, se faço o que não quero, consinto com a lei, que é boa. Neste caso, quem faz isto já não sou eu, mas o pecado que habita em mim. Porque eu sei que em mim, isto é, na minha carne, não habita bem nenhum, pois o querer o bem está em mim; não, porém, o efetuá-lo. Porque não faço o bem que prefiro, mas o mal que não quero, esse faço. Mas, se eu faço o que não quero, já não sou eu quem o faz, e sim o pecado que habita em mim. Então, ao querer fazer o bem, encontro a lei de que o mal reside em mim. Porque, no tocante ao homem interior, tenho prazer na lei de Deus; mas vejo, nos meus membros, outra lei que, guerreando contra a lei da minha mente, me faz prisioneiro da lei do pecado que está nos meus membros. Desventurado homem que sou! Quem me livrará do corpo desta morte? Graças a Deus por Jesus Cristo, nosso Senhor. De maneira que eu, de mim mesmo, com a mente, sou escravo da lei de Deus, mas, segundo a carne, da lei do pecado.

Desventurado homem que sou!

Muitos que comentam essa passagem admiram-se de como ela pode seguir logicamente as grandes declarações de Romanos 6; de que OS crentes estão mortos para O pecado (Rm 6.2), crucificados com Cristo para que O corpo do pecado seja destruído (V. 6), justificados do pecado (V. 7), não estão debaixo da lei, e sim da graça (V. 14), e são servos da justiça (V. 18).

Alguns propõem que em Romanos 7 Paulo estava descrevendo sua vida antes de conhecer a Cristo. Sugerem que O versículo 14 é a chave do entendimento: “Eu, todavia, sou carnal, vendido à escravidão do pecado”.

Outros acreditam que Paulo estava descrevendo sua vida como um cristão carnal, antes de render-se ao senhorio de Cristo. Eles chamam atenção ao fato de que Paulo disse: “NO tocante ao homem interior, tenho prazer na lei de Deus; mas vejo, nos meus membros, outra lei” (VV. 22-23) Acreditam que

O USO freqüente da primeira pessoa do singular, por parte de Paulo, nessa passagem texto revela que esse era O conflito íntimo de uma pessoa egoísta, justa aos seus próprios olhos, alguém que tentava tornar-se justo no poder de sua própria carne. Com freqüência, OS mestres da “vida mais profunda” citarão essa passagem para instar OS cristãos a “saírem de Romanos 7 e irem a Romanos 8” em sua experiência com Deus.

Entretanto, um estudo do texto revela que essa não é a experiência de um incrédulo, nem a expressão de um cristão “carnal”.3 Essa passagem retrata a experiência da vida de Paulo no momento em que ele escreveu ÍSSO. Embora fosse um dos crentes mais espirituais que já viveram, ele lutava com O pecado pessoal, assim como nós também lutamos. Embora Paulo fosse usado poderosamente por Deus, ele lutava com O pecado e a tentação. “Aquele, pois, que pensa estar em pé veja que não caia. Não vos sobreveio tentação que não fosse humana” (1 CO 10.12-13).

Como sabemos que Paulo era salvo, quando experimentava O que essa passagem descreve? A mudança no tempo verbal entre os versos 13 e O 14 oferece a primeira pista. Em Romanos 7.7-13, Paulo estava descrevendo sua vida antes da conversão e lembrando a condenação que sentiu quando se viu face a face com a lei de Deus. Os verbos nesses versos estão todos no passado. Contudo, nos versículos 14 a 25, os verbos estão no presente. Esses versos descrevem a batalha com O pecado, que era a experiência atual de Paulo.

Além disso, ele escreveu: “NO tocante ao homem interior, tenho prazer na lei de Deus” (Rm 7.22). NO versículo 25, ele acrescentou: “Eu, de mim mesmo, com a mente, sou escravo da lei de Deus”. Nenhum incrédulo poderia afirmar isso. “O pendor da carne é inimizade contra Deus, pois não está sujeito à lei de Deus, nem mesmo pode estar” (Rm 8.7).

Paulo nos dá mais descrições de seu desejo de obedecer a Deus, O qual era freqüentemente contrariado: “Não faço O que prefiro, e sim O que detesto... querer O bem está em mim; não, porém, O efetuá-lo. Porque não faço O bem que prefiro... Então, ao querer fazer O bem, encontro a lei de que O mal reside em mim” (7.15, 18-19, 21). Entretanto, em Romanos 3, Paulo disse que a pessoa não-salva não tem O desejo de fazer a vontade de Deus: “Não há quem entenda, não há quem busque a Deus... não há quem faça O bem, não há nem um sequer... Não há temor de Deus diante de seus olhos” (vv.11-12, 18). A pessoa descrita em Romanos 7.14-25 só pode ser uma pessoa redimida.

Não é um cristão carnal ou alguém com baixo grau de santificação. O uso repetido da primeira pessoa do singular, por parte de

Paulo, nesse contexto enfatiza que essa era sua própria experiência. Os tempos verbais mostram que ele não julgava estar além desse estágio. O conflito que Paulo descreveu nessa passagem era um conflito que ele conhecia bem — mesmo sendo um cristão maduro. A obra santificadora de Deus em seu coração era evidente. Ele disse que odiava o pecado (v. 15), amava a justiça (vv. 19, 21), de coração tinha prazer na lei de Deus (v. 22), agradeceu a Deus pela libertação que possuía em Cristo (v. 25). Tudo isso era a resposta de um cristão maduro, neste caso, um apóstolo maduro, e não de alguém que se debatia nas aflições de um estado desesperador de carnalidade estabelecida. De fato, essa é a descrição de um homem piedoso cujo pecado ocasional parece algo constante, quando visto no contexto de seus desejos santos.

Assim, Romanos 7.14-15 descreve o lado humano do processo de santificação. Não devemos colocar essa passagem em oposição a Romanos 8, como alguns o fazem, imaginando que esses capítulos descrevem dois estágios distintos do crescimento cristão. Eles apenas nos dão duas perspectivas diferentes sobre a santificação. Romanos 7 é a perspectiva humana; Romanos 8 é a perspectiva divina. Romanos 7 é o próprio testemunho de Paulo sobre o que significa viver como um crente controlado pelo Espírito, espiritualmente fundamentado. Ele amava, de todo o coração, a santa lei de Deus, mas estava envolto em carne humana e era incapaz de satisfazer a lei de Deus como seu coração desejava. Existe, em algum lugar, cristãos tão espirituais que podem testemunhar que vivem acima deste nível? Ou tão carnais que vivem abaixo do nível de Romanos 8?

Todos os crentes verdadeiros devem estar vivendo neste nível, lutando com a mesma tensão que Paulo descreve, entre uma fome por justiça sempre crescente e uma crescente sensibilidade ao pecado. Embora o grau do pecado possa variar, dependendo do nível de maturidade espiritual da pessoa, o pecado no crente genuíno deve sempre fazê-lo sentir o conflito que Paulo descreve nesses versículos.

Embora alguns tentem alegar que vivem acima de Romanos 7, eles apenas revelam sua própria insensibilidade aos efeitos penetrantes do pecado na carne. Se tais pessoas avaliassem honestamente a si mesmas, segundo os padrões da justiça de Deus, perceberiam quão longe estão de corresponder ao ideal. Quanto mais perto estamos de Deus, tanto mais vemos nosso próprio pecado. Somente pessoas carnais e legalistas podem viver sob a ilusão de que estão à altura dos padrões de Deus. O nível de discernimento espiritual, quebranta-mento, contrição e humildade que caracteriza a pessoa descrita em Romanos 7 é marca de um crente espiritual e maduro que, diante de Deus, não confia em sua própria bondade e realizações.

Portanto, Romanos 7 não é o brado de um cristão carnal que não se importa com a retidão, e sim o lamento de um cristão piedoso que, apesar de estar no auge se sua maturidade espiritual, considera-se incapaz de viver à altura do padrão de santidade. Também é a experiência de cada crente genuíno em cada estágio de desenvolvimento espiritual.

Sou carnal, mas a lei é boa.

Vejamos melhor o lamento de Paulo: “Sabemos que a lei é espiritual; eu, todavia, sou carnal, vendido à escravidão do pecado. Porque nem mesmo compreendo o meu próprio modo de agir, pois não faço o que prefiro, e sim o que detesto. Ora, se faço o que não quero, consinto com a lei, que é boa. Neste caso, quem faz isto já não sou eu, mas o pecado que habita em mim” (Rm 7.14-17).

A justificação pela fé sem as obras da lei não implica, de modo algum, que a lei é má. A lei é espiritual, vem do Espírito de Deus, é um reflexo de sua natureza santa, justa e boa (v. 12).

Mas existe uma barreira impedindo que os crentes obedeçam sempre à lei de Deus: nossa natureza carnal. Perceba o que Paulo disse: “Sou carnal”. Ele não disse que estava “na carne”. Aqui, a carne (em grego, sarx) não é uma referência ao corpo físico, nem mesmo a uma “parte”

de nossa pessoa como corpo, mas ao principio da fragilidade humana — especialmente de nosso egoísmo pecaminoso — que permanece conosco após a salvação, até que sejamos finalmente glorificados. “Os que estão na carne não podem agradar a Deus” (8.8). “Na carne” é descritivo de uma condição não-regenerada (7.5). Cristãos não estão “na carne”.

Todavia, a carne ainda está em nós. Somos de carne, ou seja, somos humanos. Este é o problema: “Eu sei que em mim, isto é, na minha carne, não habita bem nenhum... eu, de mim mesmo, com a mente, sou escravo da lei de Deus, mas, segundo a carne, da lei do pecado” (7.18, 25). Carne, usada neste contexto, refere-se a nossa ruína. Ela mancha todos os aspectos da pessoa — incluindo nossa mente, emoções e corpo. Essa ruína remanescente — a carne — é o que nos arrasta repetidas vezes ao pecado, embora o odiemos e desprezemos.

Era isso que Paulo tinha em mente quando disse: “Sou carnal, vendido à escravidão do pecado” (v. 14). A expressão “vendido à escravidão do pecado” parece apresentar um problema, como o faz uma frase semelhante no versículo 23: “Prisioneiro da lei do pecado que está nos meus membros”. Paulo está contradizendo o que disse em Romanos 6.14: “O pecado não terá domínio sobre vós; pois não estais debaixo da lei, e sim da graça”? Não. “Vendido à escravidão do pecado” não significa que Paulo entregava-se freqüentemente ao pecado. Ele estava apenas reconhecendo que sua carne arrastava-o de volta a cometer os pecados que ele odiava.

Esse é o estado de todo crente verdadeiro. Não temos mais parentesco com o nosso antigo pai, o Diabo (Jo 8.44); não amamos mais o mundo (1 Jo 2.15) e não somos mais escravos do pecado — mas nossa carne ainda está sujeita ao engano do pecado e ainda é atraída por muitas de suas seduções.

Contudo, como cristãos, não podemos ser felizes com nosso pecado, porque ele é contrário ao que somos em Cristo e sabemos que o pecado entristece o nosso Senhor. O pecado entristece o Espírito de Deus (Ef 4.30), desonra a Deus (1 Co 6.19-20), impede que nossas orações sejam respondidas (1 Pe

3.12), faz as boas coisas de Deus serem retidas (Jr 5.25), rouba-nos da alegria de nossa salvação (Sl 51.12), inibe o crescimento espiritual (1 Co 3.1), traz correção da parte do Senhor (Hb 12.5-7), impede que sejamos utensílios de honra para o uso do Senhor (2 Tm 2.21), profana a comunhão cristã (1 Co 10.21) e pode pôr em risco nossa vida e saúde física (1 Co 11.29-30). Não é surpresa que os cristãos verdadeiros odeiem o pecado.

Um incrédulo, ao ouvir a verdade da justificação pela fé, comentou: “Se eu cresse que a salvação é gratuita, mediante a fé somente, creria e, depois, me satisfaria no pecado”. A pessoa que testemunhava o evangelho para ele respondeu sabiamente: “Quantos pecados você acha seriam necessários para satisfazer um verdadeiro cristão?” Uma pessoa que não perdeu seu apetite pelo pecado — e não obteve fome pelas coisas de Deus — não pode ser verdadeiramente convertida. “Quais são nossos gostos, nossas escolhas, preferências e inclinações? Essa grande pergunta de teste”.4

Nesta passagem, Paulo confirma que os gostos e desejos do homem interior do verdadeiro crente são governados pela lei de Deus: “No tocante ao homem interior, tenho prazer na lei de Deus; mas vejo, nos meus membros, outra lei que, guerreando contra a lei da minha mente, me faz prisioneiro da lei do pecado que está nos meus membros” (7.22-23).

O querer o bem está em mim; não, porém, o efetuá-lo.

Todo cristão verdadeiro pode repetir o lamento de Paulo. Concordamos que a lei de Deus é boa, desejamos obedecer-lhe, contudo, não podemos nos livrar do pecado. Temos mãos e pés amarrados pela nossa própria fragilidade humana. O pecado está nos nossos próprios membros. Pessoas justas a seus próprios olhos enganam a si mesmas ao pensar que são dignas e boas; mas Romanos 7 nos mostra que um verdadeiro cristão, guiado pelo Espírito, não se engana. Quanto mais espiritual é o cristão, mais consciente ele é do pecado interior. O pecado em nossos membros não pode vencer em todo o tempo — e finalmente deixará de nos derrotar — mas frustra perpetuamente nossas tentativas de obedecer a Deus com perfeição.

Paulo disse: “Em mim, isto é, na minha carne, não habita bem nenhum”

(V.18). Há uma grande diferença entre o pecado remanescente e o pecado prevalecente: O pecado não reina mais em nós (6.18-20), mas permanece em nós (7.20). Gálatas 5.17 diz: “A carne milita contra o Espírito, e o Espírito, contra a carne, porque são opostos entre si; para que não façais o que, porventura, seja do vosso querer”. Romanos 7 simplesmente descreve a batalha em seus horríveis detalhes. Mas Gálatas 5.16 nos diz como vencer: “Andai no Espírito e jamais satisfareis à con-cupiscência da carne”. O Espírito Santo nos dá vitória.

No entanto, essa vitória parece vir com abatimento frustrante. Nos versículos 18 e 19, Paulo escreveu: “O querer o bem está em mim; não, porém, o efetuá-lo. Porque não faço o bem que prefiro, mas o mal que não quero, esse faço”. Ele não estava dizendo quer era incapaz de fazer qualquer coisa correta. Estava dizendo que seu desejo de obedecer era sempre maior do que sua própria habilidade de obedecer. Este é o padrão de crescimento espiritual: à medida que nosso ódio pelo pecado aumenta e nossa capacidade de vencer o pecado é ampliada, nossa frustração com os resíduos do pecado na carne também é intensificada. Em outras palavras, nossa sensibilidade ao pecado interior é inversamente proporcional à nossa experiência de vitória. Quanto mais derrotamos o pecado em nossa vida, mais conscientes de sua presença ficamos.

Eis o ensino crucial: Paulo não estava dizendo que tinha uma tendência para o pecado. A verdade é exatamente o oposto. A sua inclinação era para com a justiça; mas se sentia frustrado pela influência de sua carne pecaminosa.

Outra vez, esse não é O testemunho de alguém que vive num estado negligentemente “carnal”. Em seu coração, Paulo almejava a justiça, ansiava por obedecer a Deus, amava a lei de Deus e queria fazer o bem. Essa é a orientação de todo cristão verdadeiro, independentemente de onde estamos no processo de santificação.

Tenho prazer na lei.

“Ao querer fazer o bem, encontro a lei de que o mal reside em mim. Porque, no tocante ao homem interior, tenho prazer na lei de Deus; mas vejo, nos meus membros, outra lei que, guerreando contra a lei da minha mente, me faz prisioneiro da lei do pecado que está nos meus membros” (vv. 21-22).

Não era a consciência de Paulo que o incomodava. Ele não estava lamentando algum pecado não perdoado ou descrevendo uma recusa desafiadora em seguir o Senhor. O que o preocupava era seu homem interior, recriado à semelhança de Cristo e habitado por seu Espírito. Essa pessoa interior, tendo visto algo da verdadeira santidade, bondade e glória da lei de Deus, sofria com a menor violação ou falta de cumprimento da mesma. Num evidente contraste em relação à sua satisfação consigo mesmo, a qual ele tinha antes da conversão (cf. Fp 3.6), agora Paulo percebia quão distante vivia da perfeita lei de Deus, mesmo sendo um crente habitado pelo Espírito e um apóstolo de Jesus Cristo.

Esse espírito de contrição humilde é uma marca de todo verdadeiro discípulo de Cristo e leva-o a clamar: “Senhor, não consigo ser tudo que desejas que eu seja. Sou incapaz de cumprir tua perfeita, santa e gloriosa lei”. Em grande frustração e pesar, devemos confessar tristemente, como Paulo: “Não estou sempre fazendo o que gostaria de fazer”.

Paulo tinha prazer na lei de Deus. A expressão “homem interior” poderia ser traduzida por “do fundo do meu coração”. Emanando das profundezas de sua alma, Paulo tinha um grande amor pela lei de Deus. Seu homem interior, a parte que “se renova de dia em dia” (2 Co 4.16) e está sendo fortalecida com poder, mediante o Espírito de Deus (Ef 3.16), ressoava com a lei de Deus. A fonte de seus problemas era o princípio de fragilidade e ruína que é inerente à natureza humana.

O autor do salmo 119 experimentou o mesmo conflito de Paulo. O salmo que ele escreveu reflete seu profundo desejo pelas coisas de Deus. Eis algumas expressões do desejo do salmista pela lei de Deus:

•    Versículos 81 a 83:

“Desfalece-me a alma, aguardando a tua salvação; porém espero na tua palavra. Esmorecem os meus olhos de tanto esperar por tua promessa, enquanto digo: quando me haverás de consolar? Já me assemelho a um odre na fumaça; contudo, não me esqueço dos teus decretos”.

•    Versículo 92:

“Não fosse a tua lei ter sido o meu prazer, há muito já teria eu perecido na minha angústia”.

•    Versículo 97:

“Quanto amo a tua lei! É a minha meditação, todo o dia!”

•    Versículo 113:

“Aborreço a duplicidade, porém amo a tua lei”.

•    Versículo 131:

“Abro a boca e aspiro, porque anelo os teus mandamentos”.

•    Versículo 143:

“Sobre mim vieram tribulação e angústia; todavia, os teus mandamentos são o meu prazer”.

•    Versículo 163:

“Abomino e detesto a mentira; porém amo a tua lei”.

•    Versículo 165:

“Grande paz têm os que amam a tua lei; para eles não há tropeço”.

•    Versículo 174:

“Suspiro, SENHOR, por tua salvação; a tua lei é todo o meu prazer”.

A medida de espiritualidade que o salmista expressa é impressionante. Ele havia sido cativado por um amor irresistível pelas coisas de Deus. Por isso, o último verso deste salmo é tão surpreendente: “Ando errante como ovelha desgarrada; procura o teu servo, pois não me esqueço dos teus mandamentos” (v. 176). Você pode pensar que uma pessoa com um amor tão intenso pela lei de Deus não experimentaria a falha de andar espiritualmente errante. Mas esse é o conflito que todos os crentes experimentam.

Por que pecamos? Ainda pecamos porque Deus não fez um trabalho perfeito quando nos salvou? Ou pecamos porque Ele nos deu uma nova natureza que ainda não é completa? Ou pecamos porque ainda não estamos preparados para o céu e precisamos ganhar um meio de entrar?

Não, nós pecamos porque o pecado ainda está presente em nossa carne.

De maneira que... mas...

“Desventurado homem que sou! Quem me livrará do corpo desta morte? Graças a Deus por Jesus Cristo, nosso Senhor. De maneira que eu, de mim mesmo, com a mente, sou escravo da lei de Deus, mas, segundo a carne, da lei do pecado” (Rm 7.24-25).

Assim, Paulo deixa escapar um último lamento de aflição e frustração. Novamente, ele ecoa O salmista; “Das profundezas clamo a ti,

SENHOR. Escuta, Senhor, a minha voz; estejam alertas os teus ouvidos às minhas súplicas. Se observares, SENHOR, iniqüidades, quem, Senhor, subsistirá? Contigo, porém, está o perdão, para que te temam. Aguardo o

SENHOR, a minha alma o aguarda; eu espero na sua palavra” (Sl 130.1-5).

Com certeza Paulo estava numa disposição mental semelhante quando disse; “Quem me livrará do corpo desta morte?” Mas ele respondeu a sua própria pergunta; “Graças a Deus por Jesus Cristo, nosso Senhor” (vv. 24- 25). Paulo tinha certeza do triunfo final sobre o pecado em sua própria carne; “Tenho por certo que os sofrimentos do tempo presente não podem ser comparados com a glória a ser revelada em nós. A ardente expectativa da criação aguarda a revelação dos filhos de Deus” (8.18-19). A fase final de nossa salvação está garantida; “Aos que justificou, a esses também glorificou” (8.30). “É necessário que este corpo corruptível se revista da incorruptibilidade, e que o corpo mortal se revista da imortalidade.... Graças a Deus, que nos dá a vitória por intermédio de nosso Senhor Jesus Cristo” (1 Co 15.53, 57). “Pois, na verdade, os que estamos neste taberná-culo gememos angustiados, não por querermos ser despidos, mas revestidos, para que o mortal seja absorvido pela vida” (2 Co 5.4). “Aguardamos o Salvador, o Senhor Jesus Cristo, o qual transformará o nosso corpo de humilhação, para ser igual ao corpo da sua glória” (Fp 3.20-21). Nossa esperança é triunfante!

Todavia, neste ínterim, a batalha prossegue. A plena libertação aguarda a glorificação. A vitória aqui e agora é possível somente aos poucos, à medida que mortificamos os feitos do corpo mediante o poder do Espírito Santo; “Fazei, pois, morrer a vossa natureza terrena; prostituição, impureza, paixão lasciva, desejo maligno e a avareza, que é idolatria” (Cl 3.5). “Porque, se viverdes segundo a carne, caminhais para a morte; mas, se, pelo Espírito, mortificardes os feitos do corpo, certamente, vivereis” (Rm 8.13).

Sempre seremos frustrados por nossa incapacidade de experimentar a santidade no grau que desejamos. Essa é a experiência inevitável de todo verdadeiro santo de Deus. Por causa de nossa carne, nesta vida nunca podemos alcançar o nível de santidade que aspiramos. “Também nós, que temos as primícias do Espírito, igualmente gememos em nosso íntimo, aguardando a adoção de filhos, a redenção do nosso corpo” (Rm 8.23). Mas esta esperança estimula ainda mais nossas aspirações por santidade.

“Amados, agora, somos filhos de Deus, e ainda não se manifestou o que haveremos de ser. Sabemos que, quando ele se manifestar, seremos semelhantes a ele, porque haveremos de vê-lo como ele é. E a si mesmo se purifica todo o que nele tem esta esperança, assim como ele é puro” (1 Jo 3.2-3).

Capítulo 9$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A aula desmonta o mito do "cristão carnal" que vive continuamente como os não salvos e ainda se considera seguro; você já se acomodou na ideia de que pode seguir Cristo apenas de nome enquanto justifica uma vida de pecado impenitente?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor mostra que, quanto mais Paulo amadurecia, mais sensível ao próprio pecado ele se tornava, a ponto de se chamar o principal dos pecadores; o seu crescimento espiritual tem aumentado o seu ódio pelo pecado ou o tornado mais indiferente a ele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele lembra que Deus sempre disciplina os filhos que pecam, e que sem correção alguém é bastardo e não filho; quando você cai em pecado, você experimenta a amorosa disciplina do Pai que o leva à santidade, ou peca e fica impune sem qualquer convicção?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Produz Obras$t$, 9,
$conteudo$A santificação... é o invariável resultado da união vital com Cristo, que a verdadeira fé confere a um cristão. “Quem permanece em mim, e eu, nele, esse dá muito fruto” (Jo 15.5). O ramo que não produz fruto não faz parte da videira como uma porção viva. A união com Cristo que não produz qualquer efeito sobre o coração e a vida não passa de uma união meramente formal, indigna diante de Deus. A fé que não envolve uma influência santificadora sobre o caráter da pessoa não é melhor que a fé dos demônios. Antes, é uma fé morta, porque esta sozinha. Não é o dom de Deus. Não é a fé dos eleitos de Deus. Em suma, onde não há santificação de vida, não há fé real em Cristo. A verdadeira fé opera através do amor. Ela constrange o homem a viver para o Senhor, movido por um profundo senso de gratidão pela redenção recebida. Ela faz com que ele sinta que nunca poderá fazer demais por Aquele que deu a vida por ele. Sendo muito perdoado, muito ama. Aquele que é purificado pelo sangue de Cristo anda na luz. Aquele que tem uma esperança real e viva em Cristo purifica-se a si mesmo, assim como Ele épuro (Tg2.17-20; Tt 1.1; Gl 5.6; 1 Jo 1.7; 3.3).

J. C. RYLE5

Um panfleto escrito por um dos mais vigorosos defensores da salvação sem senhorio procura explicar a redenção; “Ainda que dê o seu melhor, você nunca pode ganhar ou merecer um relacionamento com Deus. Apenas o objeto de sua fé, Jesus

Cristo, possui o mérito”. Concordo com isso. Esse é o ensino claro das Escrituras (Tt 3.5- 7).

Entretanto, outro panfleto também diz; “Seus pecados não são um problema para Deus”. Quando o autor tenta explicar a fé em termos práticos, ele diz isto; “Você responde a Deus, o Pai, simplesmente formando as palavras em sua mente, de maneira secreta; ‘Creio em Cristo’”.6

Tudo isso contribui para uma noção de que a fé é pouco mais do que uma artifício mental. A “fé” descrita naquele panfleto não é mais do que um aceno da cabeça em aquiescência. É um mero assentimento intelectual.

Como mencionei no capítulo 3, muitos apologistas da doutrina do nãosenhorio ressentem-se de serem acusados de retratar a fé como uma simples aquiescência mental. O Dr. Ryrie, por exemplo, chama-o de argumento vazio.

Dificilmente poderíamos dizer que estar convicto de algo ou pôr a confiança no evangelho é uma aceitação casual de algo. Quando uma pessoa dá crédito aos fatos históricos de que Cristo morreu e ressuscitou dos mortos e ao fato doutrinário de que isso aconteceu em favor dos pecados dela, ela está confiando seu destino eterno à confiabilidade dessas verdades... Não se engane, as pessoas que crêem na doutrina do nãosenhorio não dizem o que [este] argumento... alega que elas dizem (SGS 30).

Entretanto, muitas pessoas que seguem a doutrina do não-senhorio dizem realmente o que Ryrie nega que elas dizem. Zane Hodges, por exemplo, quase admite que “aceitação intelectual” descreve adequadamente sua idéia de fé. Ele não se sente bem com a “conotação preconceituosa” da expressão, mas defende obstinadamente sua essência. Assentimento, ele destaca, significa apenas “consentimento significativo”. O sentido negativo, Zane sugere, é causado por modificadores do tipo mental ou intelectual. Embora estes não signifiquem “nada mais que ‘do ou concernente ao intelecto’” — ele diz — considera-se geralmente que implicam “separação e desinteresse pessoal” (AF 30). “Neste contexto, deveríamos descartar inteiramente palavras como mental ou intelectual.” Hodges acrescenta: “A Bíblia nada menciona sobre uma fé intelectual oposta a algum outro tipo de fé (como a emocional ou volitiva). O que a Bíblia reconhece é a distinção óbvia entre a fé e a descrença!” (AF 30).

Como Zane Hodges descreve a fé? “A fé significa realmente, na linguagem bíblica, receber o testemunho de Deus. É a convicção interna de que aquilo que Deus nos diz no evangelho é verdade. Isso — e apenas isso — é a fé salvífica” (AF, ênfase original).7

Essa é uma caracterização adequada do que significa crer? A fé é totalmente passiva? É verdade que as pessoas sabem intuitivamente que sua fé é genuína? Todas as pessoas verdadeiramente salvas têm segurança completa? Não é possível alguém estar enganado ao pensar que é crente, quando, de fato, não é? Uma pessoa pode pensar que crer e, assim mesmo, não crer realmente? Não existe a fé espúria?

As Escrituras respondem clara e repetidamente essas perguntas. Os apóstolos viam a fé simulada como um perigo real. Muitas das epístolas, embora dirigidas a igrejas, contêm advertências que revelam a preocupação dos apóstolos com membros de igreja que eles suspeitavam não serem crentes genuínos. Por exemplo, Paulo escreveu à igreja de Corinto: “Examinai-vos a vós mesmos se realmente estais na fé; provai-vos a vós mesmos. Ou não reconheceis que Jesus Cristo está em vós? Se não é que já estais reprovados” (2 Co 13.5). Pedro escreveu: “Por isso, irmãos, procurai, com diligência cada vez maior, confirmar a vossa vocação e eleição; porquanto, procedendo assim, não tropeçareis em tempo algum” (2 Pe 1.10).

Evidentemente, no começo da igreja havia alguns que brincavam com a noção de que a fé poderia ser um tipo de aceitação estática, inerte e inanimada dos fatos.8 A epístola de Tiago, talvez a primeira epístola do Novo Testamento, confronta especificamente esse erro. É quase como se Tiago estivesse escrevendo para os defensores da doutrina do não-senhorio no século XX. Ele ensina que as pessoas podem estar iludidas ao pensar que crêem quando, de fato, não crêem; ensina também que o único fator que distingue a fé genuína e a falsa é o comportamento justo produzido inevitavelmente pela fé autêntica.

Em última análise, o debate sobre a doutrina do senhorio de Cristo na salvação tem de responder estas perguntas: é suficiente saber, entender e aceitar os fatos do evangelho — mesmo quando tenho a “convicção interna” de que essas verdades se aplicam a mim pessoalmente — e nunca evitar o pecado ou submeter-me ao Senhor Jesus? A pessoa que mantém esse tipo de crença tem a garantia da vida eterna? Uma esperança assim constitui a fé no sentido em que as Escrituras usam o termo?

Tiago ensina expressamente que não. A fé verdadeira, ele diz, produzirá, sem dúvida, um comportamento justo. O verdadeiro caráter da fé salvífica pode ser examinado à luz das obras do crente. Isso é consistente com toda a soteriologia do Antigo e do Novo Testamento. Uma pessoa chega à salvação pela graça mediante a fé (Ef 2.8-9). A fé dirige-se, por natureza, à obediência e com ela se harmoniza (At 5.32; Rm 1.5, 2.8, 16.26). Portanto, é inevitável que as boas obras estejam presentes na vida daquele que acredita de verdade. Essas obras não têm parte na realização da salvação (Ef 2.9; Rm 3.20, 24; 4.5; Tt 3.5), mas demonstram que a salvação está realmente presente (Ef 2.10; 5.9; 1 Jo 2.5).

“É evidente que existe fé e FÉ”, escreveu Roy Aldrich em referência a Tiago 2. “Existe a fé nominal e a fé real. Existe a fé intelectual e a fé do coração. Existe a fé dos sentidos e a fé espiritual. Existe a fé morta e a fé viva. Existe a fé tradicional, que pode ficar aquém da fé transformadora e pessoal. Existe uma fé que pode ser louvada como ortodoxa e, assim mesmo, ter valor salvífico semelhante ao da fé dos demônios”.5 Tiago combate todo tipo de “fé” que não cumpre o padrão bíblico. O que eu e outros chamamos, às vezes, de “aquiescência mental” ou “aceitação intelectual” Tiago caracteriza como mero ouvir, profissão vazia, ortodoxia demoníaca e fé morta.

PACKER, J. I. Hot tub religion. Wheaton: Tyndale, 1987. p. 172.

CHAFER, Lewis Sperry. He that is spiritual. New York: Our Hope, 1918. Em O Evangelho Segundo Jesus, descrevi o livro de Chafer e a crítica de B. B. Warfield sobre ele. A resenha de Warfield, em The Princeton Theological Review (April 1919, p. 322-327), era repleta de bom senso e discernimento bíblico. É uma excelente crítica moderna da teologia do não-senhorio. Se Chafer e aqueles que foram influenciados por ele houvessem interagido seriamente com Warfield sobre estes assuntos, talvez o evangelicalis-mo americano do século XX tivesse sido poupado de muita confusão e falso ensino.

“Os melhores expositores de todas as eras da Igreja sempre aplicaram Romanos 7 a crentes maduros. Os expositores que não assumiram essa posição, com algumas pouquíssimas exceções, foram os romanistas, os socinianos e os arminianos. Contra eles lançamos o juízo de quase todos os reformadores, de quase todos os puritanos e dos melhores eruditos evangélicos modernos... Porém, se não peço que alguém chame de ‘mestres' aos reformadores e aos puritanos, peço que as pessoas leiam o que eles disseram sobre esse assunto e que respondam aos argumentos deles, se puderem. Isso até hoje não foi feito!... lembremo-nos de que há um aspecto importantíssimo que não podemos negligenciar. De um lado avultam as opiniões e interpretações dos reformadores e puritanos e, do outro, as opiniões e interpretações dos romanistas, socinianos e arminianos. Que isso seja claramente compreendido.” RYLE, J. C. Santidade sem a qual ninguém verá o Senhor. 2. ed. São José dos Campos, SP: Fiel, 2009. p. 19.

Ibid. p. 62.

RYLE, J. C. Santidade sem a qual ninguém verá o Senhor. 2. ed. São José dos Campos, SP: Fiel, 2009. p. 46

THIEME JR., R. B. A matter of life [and] death: the gospel of Jesus Christ. Houston; Thieme Bible Ministries, 1990. p. 10-12.

Ao enfatizar as palavras “convicção interna” e ressaltá-las com a expressão “isso — e apenas isso”, Hodges está rejeitando explicitamente o conceito de que a fé produz inevitavelmente um comportamento justo. Contrastando com isso, os reformadores tinham um ditado: “Só a fé salva, mas a fé que salva nunca vem só”.

“Provavelmente como uma reação contra o ensino de justificação pelas obras da lei, havia surgido entre os cristãos judeus a falácia de que a fé em Cristo existindo como um princípio inativo, uma mera crença contemplativa seria suficiente sem as obras. Tiago mostrou que essa posição é impossível.” CARR, Arthur. The general Epistle of

St. James. In:_.    Cambridge Greek testament for schools and colleges. Cambridge:

Cambridge University Press, 1896. p. 35.

O simples ouvir

Tiago escreveu: “Tornai-vos, pois, praticantes da palavra e não somente ouvintes, enganando-vos a vós mesmos” (1.22). Tiago usa um substantivo (poietai) “praticantes da palavra” ou “cumpridores da palavra”, em vez de um imperativo direto (“praticai a palavra”). Ele está descrevendo um comportamento característico, e não uma 1 2 atividade ocasional. Uma coisa é lutar; outra, é ser um soldado. Uma coisa é construir um abrigo; outra, é ser um construtor. Tiago não está apenas desafiando seus leitores a praticarem a Palavra, ele está dizendo-lhes que crentes verdadeiros são praticantes da Palavra. Isso descreve a disposição básica daqueles que crêem para a salvação.

Ouvir é importante, como Tiago enfatizou em 1.19-21. A fé vem pelo ouvir (Rm 10.17). Contudo, a fé genuína deve ser algo mais do que o simples ouvir. Ouvir é o meio, não o fim. O fim é a fé, que resulta em obediência.

Crentes verdadeiros não podem ser apenas ouvintes. A palavra traduzida por “ouvintes” (Tg 1.22) é akroates, um termo que era usado para descrever alunos que assistiam aulas como ouvintes. Alunos ouvintes assistem geralmente às aulas, mas têm a permissão de considerar trabalhos e provas como opcionais. Muitas pessoas na igreja hoje abordam a verdade espiritual com uma mentalidade de aluno ouvinte que recebe a Palavra de Deus apenas passivamente. Mas o que Tiago queria dizer, expresso por suas ilustrações nos versículos 23 a 27, é que apenas ouvir a Palavra de Deus resulta em religião inútil (v. 26). Em outras palavras, o mero ouvir não é melhor do que a incredulidade ou a rejeição total. De fato, é pior! O simples ouvinte é uma pessoa esclarecida, mas não regenerada. Tiago está reiterando uma verdade que, sem dúvida, ouviu diretamente do próprio Senhor. Jesus advertiu, com vigor, contra o erro de ouvir sem praticar (Mt 7.21-27), assim como o apóstolo Paulo (Rm 2.13-25).

Tiago diz que ouvir sem obedecer é iludir a si mesmo (v. 22). O termo grego traduzido por “enganar” (paralogizomai) significa “raciocinar contra”. Fala de uma lógica distorcida. Aqueles que acreditam ser suficiente ouvir a Palavra sem obedecer-lhe cometem um erro grave, enganam a si mesmos. Robert Johnstone escreveu:

Sabendo que o estudo da verdade divina — mediante a leitura da Bíblia, a participação nas ordenanças públicas da graça e outros meios — é uma das obrigações mais importantes e, na verdade, O caminho que conduz à entrada da vida eterna, eles se permitem, por meio da aversão natural do homem a toda espiritualidade genuína, ser persuadidos pelo maligno de que isso é a essência de todo o dever cristão e a entrada à vida eterna; de modo que, pelo mero “ouvir", eles entrem e se sintam bem com isso. Descansar satisfeito com os meios de graça, sem render nosso coração ao poder deles como meios, para que recebamos graça e mostremos sua utilidade em nossa vida, é evidentemente uma tolice semelhante à de um operário que se contenta em possuir ferramentas sem usá-las; é uma loucura idêntica à de um homem que perece de fome, quando deveria alegrar-se porque tem pão em suas mãos, mas não o come; é tolice e loucura imensamente maior do que essas, visto que “a obra de Deus" (João 6.29) transcende em importância a obra de um artífice terreno, e a vida “juntamente com Cristo, em Deus, transcende a existência perecível na terra.3

Tiago apresenta duas ilustrações que contrastam aqueles que são apenas ouvintes com os ouvintes obedientes.

O espelho.

“Porque, se alguém é ouvinte da palavra e não praticante, assemelha-se ao homem que contempla, num espelho, o seu rosto natural; pois a si mesmo se contempla, e se retira, e para logo se esquece de como era a sua aparência. Mas aquele que considera, atentamente, na lei perfeita, lei da liberdade, e nela persevera, não sendo ouvinte negligente, mas operoso praticante, esse será bem-aventurado no que realizar" (1.23-25).

“Não praticante” é alguém cuja disposição consiste em ouvir sem fazer. Ao contrário do que dizem alguns comentadores bíblicos, “contempla num espelho” não descreve uma olhadela apressada ou casual. O verbo

(katanoeõ) significa “olhar cuidadosamente, com prudência, vigilantemente”. O homem estuda com cuidado o seu rosto e familiariza-se por completo com seus traços. Ele ouve a Palavra não de forma momentânea, mas demoradamente, de modo que compreende o que ouve e sabe o que Deus espera que ele faça. Qualquer falha em responder não pode ser atribuída a falta de entendimento.4 O que Tiago quer dizer não é que este homem falhou em olhar por tempo suficiente ou que não houve bastante sinceridade — e sim que ele se afastou sem tomar qualquer atitude. “Logo se esquece de como era a sua aparência” (v. 24). Esta passagem é similar à dos solos improdutivos em Mateus 13. A pessoa que ouviu a Palavra não tem a resposta apropriada do coração; portanto, o que foi semeado não pode produzir fruto.

A questão tem dois aspectos. Primeiro, Tiago está ilustrando a urgência de obedecer a Palavra ativamente. Se você não observa o que vê, enquanto se contempla no espelho, mais tarde esquecerá o que viu. Já na segunda de manhã, você pode esquecer o impacto do sermão do domingo. À tarde, as leituras feitas de manhã podem ser uma lembrança vaga. Se você não dá as respostas necessárias enquanto Deus está convencendo seu coração, provavelmente não dará tais respostas. A imagem refletida no espelho da Palavra de Deus logo desbotará.

O segundo e mais penetrante aspecto consiste na ilustração de Tiago da completa inutilidade de receber a Palavra passivamente. O versículo 21 fala a respeito de como devemos receber a Palavra: “Portanto, despojandovos de toda impureza e acúmulo de maldade, acolhei, com mansidão, a palavra em VÓS implantada, a qual é poderosa para salvar a vossa alma”. A conjunção pois, no início do versículo 22, é equivalente a além disso ou agora, implicando que depois vem não um contraste, e sim uma amplificação da ordem expressa no versículo 21. Em outras palavras, Tiago está dizendo que é maravilhoso ser receptivo à Palavra — ouvir com aprovação e concordância de opinião — mas não é suficiente. Devemos recebê-la como aqueles que são praticantes. Aqueles que não praticam a Palavra não são crentes verdadeiros.

Tiago apresenta um exemplo de contraste. Este é o praticante efetivo da Palavra: “Aquele que considera, atentamente, na lei perfeita, lei da liberdade, e nela persevera, não sendo ouvinte negligente, mas operoso praticante, esse será bem-aventurado no que realizar” (1.25). A palavra traduzida por “considera atentamente” é parakupto, a mesma palavra usada em João 20.5 e 11 para descrever como João se inclinou para observar o túmulo vazio de Jesus. A palavra também é usada em 1 Pedro 1.12 a respeito de anjos que anelam perscrutar coisas concernentes ao evangelho. Ela expressa um olhar profundo e cativante, o olhar de alguém que se inclina para examinar algo mais de perto. Hiebert diz que essa palavra “retrata o homem como que curvando-se sobre um espelho, em cima da mesa, a fim de examinar mais minuciosamente o que está revelado nele”.5 Fica implícito um desejo de entender razões que vão além do que é acadêmico.

Isso é uma descrição do crente verdadeiro. Em contraste com aquele que é apenas ouvinte, o crente verdadeiro “inclina-se para o espelho e, fascinado pelo que vê, continua a olhar e a obedecer aos seus preceitos. Essa característica marca sua diferença crucial em relação ao primeiro homem”.6 Esse homem está olhando fixamente à “lei perfeita, lei da liberdade” (v. 25). Isso se refere ao evangelho em seu sentido mais amplo — todo O conselho de Deus, a palavra implantada, que salva (v. 21). Burdick escreveu:

Isto não é uma referência à lei do Antigo Testamento ou à lei mosaica pervertida a ponto de tornar-se um sistema legalista de ganhar a salvação pelas boas obras. Quando Tiago a chama de “lei perfeita", ele tem em mente a soma da verdade revelada de Deus — e não meramente a porção preliminar encontrada no Antigo Testamento, mas também a revelação final feita por meio de Cristo e seus apóstolos que logo estaria registrada no Novo Testamento. Assim, ela é completa, em contraste com aquela que é preliminar e preparatória. Além disso, ela é a “lei da liberdade", pelo que Tiago tenciona dizer que ela não escraviza. Ela não é forçada por uma coerção externa. Em vez disso, ela é aceita e cumprida livremente, com devoção alegre sob a capacitação do Espírito de Deus (Gl 5.22-23).7 8

Tiago não está falando da lei em contraste com o evangelho. A “lei perfeita, lei da liberdade" é a Palavra implantada (v. 21). Aqueles que entendem a expressão “lei perfeita, lei da liberdade" como que significando algo separado do evangelho não entendem o que Tiago está dizendo. Ao descrever o homem que olha para a Palavra, permanece nela e é abençoado, ele está retratando o efeito da verdadeira conversão.11

Isso significa que todos os crentes verdadeiros são praticantes da Palavra? Sim. Eles sempre colocam a Palavra em prática? Não

— OU O trabalho de um pastor seria relativamente simples. OS crentes falham e, às vezes, falham de maneiras chocantes. Entretanto, mesmo quando falham, os crentes verdadeiros não deixam de ter plenamente a disposição e a motivação de alguém que é praticante. Tiago oferece estas palavras como um lembrete ao verdadeiro crente (O “operoso praticante” - v. 25) e um desafio aos descrentes que têm-se identificado com a verdade, mas não lhe obedecem (os “ouvinte[s] negligente[s]”).

A língua desenfreada.

Além disso, Tiago ilustra a natureza enganosa de ouvir sem obedecer: “Se alguém supõe ser religioso, deixando de refrear a língua, antes, enganando O próprio coração, a sua religião é vã. A religião pura e sem mácula, para com

O nosso Deus e Pai, é esta: visitar os órfãos e as viúvas nas suas tribulações e a si mesmo guardar-se incontaminado do mundo” (1.26-27).

A palavra traduzida por “religioso” no verso 26 é threskos, uma palavra usada freqüentemente em referência ao cerimonial de adoração pública. Foi a palavra que Josefo USOU, por exemplo, quando descreveu a adoração no templo. Threskeia (“religião”, vv. 26 e 27) é a mesma palavra que Paulo

USOU em Atos 26.5 para referir-se à tradição dos fariseus. Ela enfatiza os aspectos externos da cerimônia, do ritual, da liturgia e assim por diante. Tiago está dizendo que todas as coisas semelhantes a essas, quando separadas da obediência significativa, são inúteis.

Todos nós lutamos para controlar nossa língua. Foi Tiago que escreveu: “Porque todos tropeçamos em muitas coisas. Se alguém não tropeça no falar, é perfeito varão, capaz de refrear também todo O corpo” (3.2). Mas a língua deste homem é como um cavalo desenfreado, ele a deixa agir sem controle, enquanto engana seu próprio coração (1.26). Ele não está combatendo uma falha transitória no controle da lingua; antes, é dominado por um padrão que caracteriza sua própria natureza. Embora ele professe ser religioso, seu caráter não está em sincronia com sua afirmação. Ainda que pense indubitavelmente em si mesmo como justo, está enganado quanto à eficácia de sua própria religião.

A despeito da religião externa desse homem, sua lingua constantemente desenfreada e incontrolada demonstra um coração enganado e profano, pois “o que sai da boca vem do coração” (Mt 15.18). “O homem bom do bom tesouro do coração tira o bem, e o mau do mau tesouro tira o mal; porque a boca fala do que está cheio o coração” (Lc 6.45). Nosso Senhor advertiu: “Pelas tuas palavras, serás justificado e, pelas tuas palavras, serás condenado” (Mt 12.37).

Kistemaker observou o significado da expressão “enganando o próprio coração”:

Esta é a terceira vez que Tiago aconselha seus leitores a não se enganarem (1.16, 22, 26). Como pastor, ele se mostra plenamente consciente da religião falsa que é nada mais do que um formalismo externo. Tiago sabe que muitas pessoas apenas fingem servir a Deus, mas o seu discurso mostra a verdade. A sua religião tem um som vazio; e, embora não percebam isso, por suas palavras e ações — ou pela falta delas — enganam a si mesmas. Seu coração não é honesto com Deus e com seu próximo; e sua tentativa de esconder essa falta de amor apenas amplia o seu engano. A sua religião é inútil.9

Essa religião inútil contrasta nitidamente com a verdadeira religião que é “pura e sem mácula, para com o nosso Deus e Pai... visitar os órfãos e as viúvas nas suas tribulações e a si mesmo guardar-se incontaminado do mundo” (V. 27). Tiago não está tentando definir religião; está fazendo uma ilustração concreta do princípio com o qual ele começou: a verdadeira religião envolve mais do que o simples ouvir. A verdadeira fé salvífica produzirá inevitavelmente o fruto das boas obras.

Profissões vazias

Os primeiros treze versículos de Tiago 2 continuam a expandir a argumentação de Tiago no sentido de serem os crentes, por disposição, praticantes da Palavra e não somente ouvintes. Tiago confronta o problema do favoritismo, que evidentemente havia surgido na igreja ou nas igrejas para as quais ele estava escrevendo. Tendo em mente que esse é o contexto, prosseguimos para Tiago 2.14. Neste versículo, após advertir seus leitores de que estavam enfrentando juízo por causa de seu comportamento profano e cruel (V. 13), Tiago se volta ao âmago da questão: o aparente malentendido de que a fé é um ingrediente inerte na fórmula da salvação. O desafio de Tiago não poderia ser mais claro:

Meus irmãos, qual é o proveito, se alguém disser que tem fé, mas não tiver obras? Pode, acaso, semelhante fé salvá-lo? Se um irmão ou uma irmã estiverem carecidos de roupa e necessitados do alimento cotidiano, e qualquer dentre vós lhes disser: Ide em paz, aquecei-vos e fartai-vos, sem, contudo, lhes dar o necessário para o corpo, qual é o proveito disso? Assim, também a fé, se não tiver obras, por si só está morta. Mas alguém dirá: Tu tens fé, e eu tenho obras; mostra-me essa tua fé sem as obras, e eu, com as obras, te mostrarei a minha fé. Crês, tu, que Deus é um só? Fazes bem. Até os demônios crêem e tremem. Queres, pois, ficar certo, ó homem insensato, de que a fé sem as obras é inoperante? Não foi por obras que Abraão, o nosso pai, foi justificado, quando ofereceu sobre O altar O próprio filho, Isaque? Vês como a fé operava juntamente com as suas obras; com efeito, foi pelas obras que a fé se consumou, e se cumpriu a Escritura, a qual diz: Ora, Abraão creu em Deus, e isso lhe foi imputado para justiça; e: Foi chamado amigo de Deus. Verificais que uma pessoa é justificada por obras e não por fé somente. De igual modo, não foi também justificada por obras a meretriz Raabe, quando acolheu os emissários e os fez partir por outro caminho? Porque, assim como o corpo sem espírito é morto, assim também a fé sem obras é morta.

Tiago 2.14-26, ênfase acrescentada.

Nada menos do que cinco vezes nessa passagem (vv. 14, 17, 20, 24, 26), Tiago reitera a sua tese: a fé passiva não é fé eficaz. Ele faz um ataque frontal à profissão vazia daqueles cuja esperança está numa fé inerte.

Reicke escreveu: “Deve ser observado que a discussão é sobre uma pessoa que apenas afirma ter fé. Essa pessoa não tem uma fé genuína, visto que sua fé não se expressa em feitos. O autor não discorda da fé em si mesma, e sim de uma concepção superficial de fé, que permite a fé seja apenas uma anuência formal. Ele deseja ressaltar que um cristianismo de mera obras não conduz à salvação”.10 Cranfield comenta de modo semelhante: “A dica para compreender esta parte da epístola é o fato (ignorado muito freqüentemente) de que no versículo 14... o autor não disse ‘se alguém tiver fé’, mas ‘se alguém disser que tem fé’. Devemos permitir que esse fato controle nossa interpretação de todo o parágrafo... A idéia principal desta parte da epistola não é (como as pessoas supõem muitas vezes) que somos salvos mediante a fé acompanhada das obras, e sim que somos salvos mediante a fé genuína, em oposição à fé falsa”.11

Tiago não pode estar ensinando que a salvação é ganha pelas obras. Ele já havia descrito a salvação como “boa dádiva” e “dom perfeito”, outorgados quando, “segundo o seu querer, ele nos gerou pela palavra da verdade, para que fôssemos como que primícias das suas criaturas” (1.17-18). A fé é parte desse dom perfeito. Ela é concedida sobrenaturalmente por Deus, não concebida de forma independente na mente ou vontade do crente.

Como observamos no capítulo 3, a fé não é um anelo melancólico, uma confiança cega, nem mesmo uma “convicção interna”. É uma certeza sobrenatural, uma compreensão de realidades espirituais que “nem olhos viram, nem ouvidos ouviram, nem jamais penetrou em coração humano o que Deus tem preparado para aqueles que o amam. Mas Deus no-lo revelou pelo Espírito; porque o Espírito a todas as coisas perscru-ta, até mesmo as profundezas de Deus” (1 Co 2.9-10). A fé é um dom de Deus, não algo obtido pelo esforço humano, para que ninguém se vanglorie — nem mesmo de sua fé (cf. Ef 2.8-9).

Na frase “se alguém disser que tem fé, mas não tiver obras” (Tg 2.14), os verbos estão no futuro do subjuntivo. Descrevem a possibilidade de alguém alegar ser um crente, mesmo quando lhe falta evidência externa de fé. A pergunta “pode, acaso, semelhante fé salvá-lo?” emprega a partícula negativa grega més indicando que, por certo, há uma resposta negativa. Literalmente, ela pode ser traduzida como “essa fé não pode salvá-lo, pode?” Tiago, como o apóstolo João, desafia a autenticidade de uma profissão de fé que não produz frutos (cf. 1 Jo 2.4, 6, 9). O contexto indica que as “obras” das quais ele fala não são ofertas de ninguém para ganhar a vida eterna. São atos de compaixão (v. 15).

Neste contexto, a fé referida é claramente a fé salvífica (V. 1). Tiago está falando de salvação eterna. Em 1.21, ele se referiu à “palavra em vós implantada, a qual é poderosa para salvar a vossa alma”. Neste capítulo 2, ele tem em vista a mesma salvação, pois não está questionando se a fé salva. Em vez disso, ele está se opondo à noção de que a fé pode ser um exercício passivo, infrutífero e intelectual e, assim mesmo, salvar. Devemos supor que, onde não há obras, também não existe fé. Nessa questão, Tiago apenas repete o que Jesus disse: “Pelos seus frutos os conhecereis. Colhemse, porventura, uvas dos espinheiros ou figos dos abrolhos? Assim, toda árvore boa produz bons frutos, porém a árvore má produz frutos maus. Não pode a árvore boa produzir frutos maus, nem a árvore má produzir frutos bons” (Mt 7.16-18). Sem obras, sem fé. A fé genuína produz inevitavelmente obras de fé.

Neste ponto, até Charles Ryrie parece um defensor da “salvação por senhorio”:

Uma fé inoperante, morta, espúria pode salvar uma pessoa? Tiago não está dizendo que somos salvos por obras, e sim que uma fé que não produz boas obras é uma fé morta...

Uma fé improdutiva não pode salvar, porque não é fé genuína. Fé e obras são como um bilhete de duas faces de entrada no céu. A face das obras não serve como passagem, e a face da fé não é válida se destacada da parte das obras.12

Tiago prossegue usando uma ilustração pela qual compara a fé sem obras com a falsa compaixão, palavras sem ação: “Se um irmão ou uma irmã estiverem carecidos de roupa e necessitados do alimento cotidiano, e qualquer dentre vós lhes disser: Ide em paz, aquecei-vos e fartai-vos, sem, contudo, lhes dar o necessário para o corpo, qual é O proveito disso?” (2.15-16). A fé daquele que a confessa falsamente é inútil: “Assim, também a fé, se não tiver obras, por si só está morta” (v. 17).

Tiago conclui com um desafio àqueles cuja profissão de fé é suspeita: “Mas alguém dirá: Tu tens fé, e eu tenho obras; mostra-me essa tua fé sem as obras, e eu, com as obras, te mostrarei a minha fé” (v. 18). Comentadores bíblicos não concordam a respeito de o vocábulo “alguém” se referir a um opositor e de quanto do discurso seguinte deve ser atribuído a este “alguém” que se opunha ao próprio Tiago.13 De qualquer modo, a idéia principal que Tiago está apresentando é clara: a única evidência possível da fé são as obras. Como alguém pode mostrar fé sem obras? Não se pode fazer isso.

Barnes refina o sentido da passagem:

Tiago não está argumentando contra a fé real e genuína, nem contra sua importância na justificação, mas contra a suposição de que a fé constituía tudo que era necessário para salvar um homem, quer fosse acompanhada por boas obras, quer não. Ele sustenta que, se existe fé genuína, ela sempre será acompanhada por boas obras e que somente esta fé pode justificar e salvar. Se ela não conduz à santidade de vida... não tem valor algum.14

Ortodoxia demoníaca

Tiago continua seu ataque contra a fé passiva, fazendo esta declaração chocante: “Crês, tu, que Deus é um só? Fazes bem. Até os demônios crêem e tremem” (v. 19). A doutrina ortodoxa por si mesma não é uma prova de fé salvifica. OS demônios afirmam a unidade de Deus e tremem com suas implicações, mas não são redimidos. Mateus

8.29 fala sobre um grupo de demônios que reconheceu Jesus como o Filho de Deus. Até demonstraram medo. Demônios reconhecem, muitas vezes, a existência e a autoridade de Cristo (Mt 8.29-30; Mc 5.7), sua divindade (Lc 4.41) e sua ressurreição (At 19.15), mas a natureza diabólica deles não muda pelo que sabem e por aquilo em que crêem. A sua afirmação temerosa de doutrina ortodoxa não é o mesmo que a fé salvifica.

Tiago infere que a fé demoniaca é maior do que a fé fraudulenta daquele que faz uma falsa profissão de fé, pois a fé demoniaca produz temor, enquanto nos homens não-salvos “não há temor de Deus diante de seus olhos” (Rm 3.18). Se os demônios crêem, tremem e não são salvos, o que isso diz a respeito daqueles que professam crer e nem mesmo tremem? (Cf. Is 66.2, 5.)15

O puritano Thomas Manton resume perfeitamente a natureza enganosa da ortodoxia estéril que constitui a fé demoniaca:

Trata-se de uma aceitação simples e superficial das coisas expostas na Palavra de Deus e torna os homens mais cheios de conhecimento, porém não melhores, nem mais santos, nem mais espirituais. Aqueles que possuem esta fé podem crer nas promessas, nas doutrinas e nos preceitos, bem como nas histórias... contudo, isso não é a fé salvifica e viva, pois aquele que possui essa fé tem seu coração comprometido com Cristo; ele erê tão firmemente nas promessas do evangelho concernentes ao perdão de pecados e à vida eterna, que as busca como a sua felicidade. Crê de tal modo nos mistérios de nossa redenção por meio de Cristo, que toda sua esperança, paz e confiança vêm disso. Além disso, ele crê tão seguramente nas ameaças, pragas temporais ou condenação eterna, que, comparadas com isso, todas as coisas assustadoras deste mundo são nada.16

Fé morta

Agora, Tiago profere a sua repreensão mais forte: “Queres, pois, ficar certo, ó homem insensato, de que a fé sem as obras é inoperante?” (2.20). Ele classifica como “insensato” aquele que se opõe; e “insensato” significa

“vazio, defectivo”. O homem é vazio porque lhe falta a fé viva; a sua alegação de que crê é fraudulenta, a sua fé é um engano.

Hiebert escreveu: “‘Queres tu saber’ (theleis gnõnaí) - ‘queres certificar-te’ - sugere que a pessoa que se opõe não tem disposição de enfrentar o caso. Sua falta de disposição para concordar com a verdade demonstrada não se deve a qualquer obscuridade no assunto, mas à sua relutância em reconhecer a verdade. O infinitivo traduzido como ‘saber’ também pode significar ‘reconhecer’ ou ‘admitir’ e exige um ato definido de reconhecimento por parte do opositor. Sua recusa em fazê-lo implicaria perversidade íntima da vontade”.17

Tanto “fé” como “obras”, no versículo 20, trazem artigos definidos no texto grego (“a fé sem as obras”). “Inoperante” é arge, que significa “estéril, improdutivo”. Aparentemente, o sentido é que essa fé é inútil à salvação. A versão King James, em inglês, usa a palavra morta. Certamente, este é o sentido transmitido aqui (cf. vv. 17, 26). A ortodoxia morta não tem poder para salvar. De fato, ela pode até ser um obstáculo à fé verdadeira e viva. Então, Tiago não está contrastando dois métodos de salvação (fé versus obras). Seu contraste diz respeito a dois tipos de fé: uma fé que salva e uma fé que não salva.

Tiago está afirmando a verdade de 1 João 3.7-10:

Filhinhos, não vos deixeis enganar por ninguém; aquele que pratica a justiça é justo, assim como ele é justo. Aquele que pratica o pecado procede do diabo, porque o diabo vive pecando desde o princípio. Para isto se manifestou o Filho de Deus: para destruir as obras do diabo. Todo aquele que é nascido de Deus não vive na prática de pecado; pois o que permanece nele é a divina semente; ora, esse não pode viver pecando, porque é nascido de Deus. Nisto são manifestos os filhos de Deus e os filhos do diabo: todo aquele que não pratica justiça não procede de Deus, nem aquele que não ama a seu irmão.

Um comportamento justo é resultado inevitável da vida espiritual. A fé que deixa de produzir tal comportamento está morta.

A fim de sermos mais breves, devemos privar-nos de considerar em detalhes os exemplos de fé viva de Abraão e de Raabe (2.21- 25).18 Entretanto, eis uma declaração sucinta a respeito do que Tiago está querendo dizer: Abraão e Raabe, embora fossem de extremos opostos no contexto social e religioso, tiveram a disposição de sacrificar o que lhes era mais importante por causa de sua fé. Essa submissão é uma prova de que a fé deles era real.

O problema mais sério que esses versículos apresentam é o significado do versículo 24: “Verificais que uma pessoa é justificada por obras e não por fé somente”. Alguns imaginam que isso contradiz o ensino de Paulo em Romanos 3.28: “Concluímos, pois, que o homem é justificado pela fé, independentemente das obras da lei”. João Cal-vino explicou esta aparente dificuldade:

Parece certo que [Tiago] está falando da manifestação, e não da imputação da justiça, como se ele tivesse dito: “Aqueles que são justificados pela fé provam sua justificação pela obediência e pelas boas obras, e não por um tipo de fé vazia e imaginária. Numa palavra, ele não está discutindo o modo da justificação, mas exigindo que a justificação de todos os crentes seja operante. Assim como Paulo argumenta que os homens são justificados sem o concurso das obras, Tiago não admite que qualquer pessoa destituída de boas obras seja considerada justificada... Deixe que distorçam as palavras de Tiago o quanto quiserem, eles nunca extrairão delas mais do que duas proposições: uma aparência de fé vazia não justifica; e o crente, não se contentando com tal imaginação, manifesta sua justificação pelas boas obras.19

Tiago não está em desarmonia com Paulo. “Eles não são antagonistas que enfrentam um ao outro numa disputa; antes, eles ficam de costas um para o outro confrontando diferentes inimigos do evangelho”.20 Conforme vimos em 1.17-18, Tiago afirmou que a salvação é um dom concedido de acordo com a vontade soberana de Deus. Agora ele está enfatizando a importância dos frutos da fé — o comportamento justo que a fé genuína sempre produz. Paulo também viu as obras justas como uma prova necessária da fé.

Aqueles que imaginam uma discrepância entre Tiago e Paulo raramente observam que Paulo escreveu: “Havemos de pecar porque não estamos debaixo da lei, e sim da graça? De modo nenhum!” (Rm 6.15) e: “uma vez libertados do pecado, fostes feitos servos da justiça” (V. 18). Assim, Paulo condena O mesmo erro que Tiago está expondo. Paulo nunca defende qualquer conceito de fé inoperante.

Quando Paulo escreveu “ninguém será justificado diante dele por obras da lei” (Rm 3.20), ele

Estava combatendo o legalismo judaico que insistia na necessidade de obras para a justificação. Tiago insiste na necessidade das obras na vida daqueles que foram justificados pela fé. Paulo argumenta que nenhum homem jamais pode ganhar a justificação por meio de seus próprios esforços... Tiago exige que um homem que alega estar num relacionamento justo com Deus, por meio da fé, demonstre, mediante uma vida de boas obras, que se tornou uma nova criatura em Cristo. Paulo concordou plenamente com isso; ele estava rejeitando as “obras” que excluem e destroem a fé salvífica. Tiago estava encorajando a fé morosa que dava pouco valor aos resultados da fé salvífica na vida diária.21

Ambos Tiago e Paulo ecoam a pregação de Jesus. A ênfase de Paulo ressoa o espírito de Mateus 5.3: “Bem-aventurados os humildes de espírito, porque deles é o reino dos céus”. O ensino de Tiago possui o tom de Mateus 7.21: “Nem todo o que me diz: Senhor, Senhor! entrará no reino dos céus, mas aquele que faz a vontade de meu Pai, que está nos céus”. Paulo representa o início do Sermão do Monte, e Tiago, o fim. Paulo declara que somos salvos por fé, sem as obras da lei. Tiago declara que somos salvos por fé, que se revela em obras. Ambos, Tiago e Paulo, vêem as boas obras como prova de fé — não como o caminho para a salvação.

Tiago não podia ser mais explícito. Está confrontando o conceito de “fé” passiva, falsa, destituída dos frutos da salvação. Ele não está argumentando a favor das obras em acréscimo à fé ou separada desta.

Está mostrando por que e como a fé verdadeira e viva sempre funciona; e combatendo a ortodoxia morta e a sua tendência de abusar da graça.

O erro que Tiago critica assemelha-se intensamente ao ensino da salvação sem senhorio. É a fé sem obras, a justificação sem santificação, a salvação sem vida nova.

Mais uma vez, Tiago repete o que disse o próprio Senhor, quando insistiu na teologia de senhorio que envolve obediência, e não uma confissão da boca para fora. Jesus repreendeu os desobedientes que se haviam ligado Ele apenas em palavras: “Por que me chamais Senhor, Senhor, e não fazeis o que vos mando?” (Lc 6.46). Submissão verbal, Ele disse, não levará ninguém ao céu (Mt 7.21).

Isso está em perfeita harmonia com Tiago: “Tornai-vos, pois, praticantes da palavra e não somente ouvintes, enganando-vos a vós mesmos” (1.22), pois “a fé, se não tiver obras, por si só está morta” (2.17).22

Capítulo 10

5. ALDRICH, Roy L. Some simple difficulties of salvation. Bibliotheca Sacra, Dallas, v.

n. 442, p. 167, April-June 1954.

JOHNSTONE, Robert. Lectures, exegetical and practical on the Epistle of James. Minneapolis: Klock & Klock, 1978. p. 144. Reimpressão.

BURDICK, Donald W. James. In: GAEBELEIN, Frank E. (Ed.). The expositor's Bible commentary. Grand Rapids, Mich.: Zondervan, 1981. 11:175.

HIEBERT, D. Edmond. The Epistle of James. Chicago: Moody, 1979. p. 135-136.

Ibid.

BURDICK, Donald W. James. In: GAEBELEIN, Frank E. (Ed.). The expositor's Bible commentary. Grand Rapids, Mich.: Zondervan, 1981. p. 176.

A declaração de Tiago de que o praticante da Palavra será bem-aventurado assemelha-se às palavras de Jesus registradas em João 13.17: “Se sabeis estas coisas, bem-aventurados sois se as praticardes" e Lucas 11.28: “Bem-aventurados são os que ouvem a palavra de Deus e a guardam!" A “bem-aventurança" sobre a qual esses versículos falam é o direito de nascimento de todos os redimidos.

KISTEMAKER, Simon J. Exposition of the Epistle of James. Grand Rapids, Mich.: Baker, 1986. p. 64.

REICKE, Bo. The epistles of James, Peter and John. In: FREEDMAN, David N. (Ed.). The anchor Bible. Garden City, N. Y.: Doubleday, 1964. 37:32.

CRANFIELD, C. E. B. The message of James. The Scottish Journal of Theology, Cambridge, v. 18, n. 3, p. 338, Sept. 1965.

RYRIE, Charles C. (Ed.). The Ryrie Study Bible. Chicago: Moody, 1978. p. 19591860.

HIEBERT, D. Edmond. The Epistle of James. Chicago: Moody, 1979. p. 182-185. Ver também: HODGES, Zane C. Light on James two. Bibliotheca Sacra, Dallas, v. 120, n. 480, p. 341-350, October-December 1963.

BARNES, Albert. Notes on the New Testament. Grand Rapids, Mich.: Baker, 1983. 13:50. Reimpressão.

Lenski escreveu: “‘Fazes bem' é certamente uma ironia, visto que é seguido por ‘até os demônios crêem e tremem'. O verbo denota terror que faz arrepiar os cabelos. Isso é chocante. Nunca foi apresentada uma ilustração mais impressionante da fé morta. Sim, até os demônios têm fé. Esse ‘alguém' lhes dirá que ter fé é suficiente? Insinuará que os demônios são salvos por sua fé? Insinuará que o cristão a quem ele diz: ‘Tu tens [professado] fé' não precisa de uma fé melhor?” LENSKI, R. C. H. The interpretation of the Epistle to the Hebrews and the Epistle of James. Minneapolis: Augsburg, 1966. p. 585.

MANTON, Thomas. The complete works of Thomas Manton. London: Nisbet, 1874. 17:113-114.

HIEBERT, D. Edmond. The Epistle of James. Chicago: Moody, 1979. p. 188.

Esses versículos são estudados com detalhes em: MACARTHUR JR., John. True faith. Chicago: Moody, 1989. p. 123-131.

CALVIN, John. Institutes of the Christian religion. Trans. Henry Beveridge. Grand Rapids, Mich.: Eerdmans, 1966. 3.17.12.

ROSS, Alexander. The epistles of James and John. The new international commentary on the New Testament. Grand Rapids, Mich.: Eerdmans, 1954. p. 53.

HIEBERT, D. Edmond. The Epistle of James. Chicago: Moody, 1979. p. 175.

Devemos notar que Zane Hodges publicou um livrete sobre Tiago 2 que desafia mais de quatro séculos de erudição protestante. Reconhecendo que suas opiniões são incomuns, ele sugere que todas as interpretações convencionais de Tiago 2 estão fundamentalmente erradas e se propõe, num tratado de trinta e duas páginas, a corrigi-las. Hodges escreveu: “Não existe no protestantismo pós-Reforma uma interpretação de Tiago 2.14-26 aceita comumente, mas, de fato, a maioria das maneiras de entender esse texto estão erradas. E não somente erradas, mas seriamente erradas. Essas opiniões estão erradas de tal modo, que, se o próprio Tiago pudesse ouvi-las, ficaria surpreso e amedrontado!” HODGES, Zane C. Dead faith: what is it? Dallas: Redención Viva, 1987 (ênfase no original). Outro professor de teologia avaliou a alegação de Hodges com ceticismo: “Talvez um dos aspectos mais intrigantes — e importunos — do livro de Zane C. Hodges... é que, no melhor de meu conhecimento, nenhum intérprete expressivo das Escrituras, em toda a história da igreja, defendeu a interpretação de Hodges sobre as passagens que ele discute. Isso não significa necessariamente que Hodges esteja errado, mas significa certamente que pode estar errado e talvez signifique que ele não refletiu de modo suficiente sobre o conjunto de falácias conectadas com a epístola [o entendimento das pressuposições de alguém no texto bíblico]”. CARSON, D. A. Exegetical fallacies. Grand Rapids, Mich.: Baker, 1984. p. 137. Menciono o livrete de Hodges, porque a voz desse mestre exerce muita influência entre aqueles que estão convencidos da posição da salvação sem senhorio. Respondi à tese do livrete num artigo de um periódico (“Faith According to the Apostle James”, Journal of the Evangelical Theological Society, v. 33, n. 1, p. 13-34, March 1990). Grande parte deste capítulo foi adaptado desse artigo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Tiago diz que devemos ser praticantes da Palavra e não apenas ouvintes que enganam a si mesmos; ao sair de um culto ou de uma leitura que tocou o seu coração, você costuma obedecer ao que ouviu ou logo esquece como o espelho mostrou que você era?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A aula adverte que até os demônios creem e tremem, e que ortodoxia correta não prova fé salvífica; será que a sua segurança repousa em concordar com as doutrinas certas, sem o comportamento justo que a fé verdadeira sempre produz?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Tiago insiste que a fé sem obras está morta; quando você confessa ter fé, há atos concretos de compaixão e obediência que a comprovam, ou a sua fé tem permanecido apenas como palavras e um aceno da mente?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Da Glória$t$, 10,
$conteudo$Os crentes não podem perder os hábitos, as sementes, a raiz da graça; entretanto, podem perder a segurança, que é a beleza e a fragrância, a coroa e a glória da graça (1 João 3.9; 1 Pedro 1.5). Estas duas companheiras, a graça e a segurança, não foram unidas tão intimamente por Deus de modo a não poderem, por causa do pecado, no tocante a nós, e, da justiça, no tocante a Deus, ser separadas. A permanência destas duas companheiras juntas, a graça e a segurança, renderá à alma dois céus: um céu de alegria e paz, aqui, e um céu de felicidade e bem-aventurança, no futuro; mas separar essas companheiras colocará a alma num inferno aqui, embora ela escape do inferno no futuro. Crisóstomo mostrou saber isso muito bem quando confessou que a falta do prazer de Deus era para ele um sofrimento pior do que o sentimento de qualquer outra punição.

TOMAS BROOKS1

*

E possível ter plena segurança da salvação? Os cristãos podem descansar na firme confiança de que são redimidos e destinados à eternidade no céu?

A Escritura responde, categoricamente, sim, A Bíblia ensina que ter segurança é possível para os cristãos nesta vida; e o apóstolo Pedro também deu esta ordem: “Procurai, com diligência cada vez maior, confirmar a vossa vocação e eleição” (2 Pe HO), A segurança não é somente um privilégio, é o direito inato e a confiança sagrada de cada verdadeiro filho de Deus, A Bíblia nos ordena que cultivemos a segurança, e não que tenhamos certeza da segurança de uma vez por todas,

A segurança é uma amostra do céu na terra, Fanny Crosby expressou esta verdade num hino bastante conhecido:

Vivo feliz, pois sou de Jesus,

E já desfruto o gozo da luz!

O puritano Thomas Brooks observou a mesma realidade e intitulou de Heaven on Earth (Céu na Terra) seu livro sobre segurança, Possuir segurança genuína é experimentar um pouco da felicidade divina neste lado do céu, Quanto maior for nosso senso de segurança, tanto mais poderemos saborear essa glória na vida terrena,

Os críticos alegam com freqüência que a salvação por senhorio torna impossível a segurança pessoal, Isso não é verdade, mas a controvérsia do senhorio certamente tem implicações sérias no que diz respeito à questão da segurança, Portanto, a segurança emergiu como um dos temas principais na discussão, Embora eu mal tenha falado sobre o assunto em meu livro anterior,2 o diálogo subseqüente parece convergir inevitavelmente à questão da possibilidade de OS cristãos terem certeza de salvação e de como podem ter certeza de estarem na fé.

Estou convicto de que este é um bom direcionamento a ser tomado pela discussão. No cristianismo contemporâneo, a segurança é, com muita freqüência, ignorada ou reivindicada por pessoas que não têm direito a ela. Muitas pessoas acreditam que são salvas apenas porque alguém lhes disse isso. Elas não examinam a si mesmas, não provam sua segurança mediante a Palavra de Deus; são ensinadas de que as dúvidas sobre a sua salvação só podem ser prejudiciais à saúde e ao crescimento espiritual. Contudo, multidões dessas pessoas não demonstram evidências de qualquer saúde ou crescimento espiritual.

Segurança na Reforma

Mais uma vez, a controvérsia moderna do senhorio toca num assunto que era o âmago da Reforma Protestante. A Igreja Católica Romana negou — e nega até hoje — que qualquer pessoa sobre a terra pode ter segurança da salvação. Visto que a teologia católica vê a salvação como um esforço conjunto entre Deus e o pecador, o resultado se mantém na dúvida do começo ao fim. Se uma pessoa falha em sua espiritualidade antes de a salvação estar completa, ela perde a vida eterna. Uma vez que ninguém pode saber, com certeza, se terá forças para suportar até ao fim, ninguém está realmente certo quanto ao céu.3

Os reformadores, pelo contrário, ensinavam que os crentes podem e devem estar completamente seguros de sua salvação. Os primeiros reformadores foram tão longe ao ponto de definir a fé de um modo que incluísse a segurança. A definição de fé de Calvino é citada freqüentemente nestes termos: “É um conhecimento firme e certo do favor divino para conosco, fundamentado na verdade de uma promessa gratuita em Cristo, revelado à nossa mente e selado em nosso coração pelo Espírito Santo”.4 Calvi-no enfatizava a fé como conhecimento em contraste com a idéia dos escolásticos católicos, de que a fé é uma confiança ingênua e oposta ao conhecimento. Por isso, ele incluiu a segurança em sua definição de fé.

Em outras palavras, Calvino ensinou que a segurança é a essência da fé. Isso significa que, no momento em que uma pessoa crê em Cristo para a salvação, ela terá um senso de segurança. Como observamos no capítulo 3, Hebreus 11.1 diz: “Fé é a certeza de coisas que se esperam, a convicção de fatos que se não vêem”. Assim, com base nas Escrituras, parece claro que certo grau de segurança é inerente à atitude de crer.

Contudo, a segurança da fé é freqüentemente obscurecida pela dúvida. Calvino também ensinou que dúvidas quanto a si mesmo podem coexistir com a crença verdadeira. Ele escreveu: “Quando dizemos que a fé deve ser certa e segura, não falamos certamente de uma segurança que nunca é afetada por dúvida, nem de uma segurança que nunca é atacada por ansiedade; em vez disso, sustentamos que os crentes têm uma luta perpétua com sua própria desconfiança, e, portanto, estamos longe de pensar que sua consciência possui quietude plácida, não interrompida por perturbações [aflições]”.5

As Escrituras estão claramente ao lado de Calvino. Certo grau de segurança faz parte da essência da fé, mas crer não traz necessariamente plena segurança. “Eu creio! Ajuda-me na minha falta de fé” (Mc 9.24) é uma expressão sincera do coração de todo novo convertido. Até os apóstolos rogaram a Jesus: “Aumenta-nos a fé” (Lc 17.5).

Teólogos reformados posteriores, reconhecendo que aos cris- tãos genuínos faltava freqüentemente segurança, negaram que qualquer segurança está implícita na atitude de crer. Eles discordavam de Calvino nessa questão. Calvino, argumentando contra a Igreja de Roma, foi zeloso em enfatizar a possibilidade da segurança imediata. Os reformadores posteriores, lutando contra tendências antinomianas em seu movimento, desejavam enfatizar a importância da evidência prática na vida dos crentes.

A Confissão de Fé de Westminster, redigida em 1646, distin-guiu a fé da segurança. A Confissão incluía esta afirmação:

[Capítulo 18] Seção III — Esta segurança infalível não está incluída de tal modo na essência da fé, que um verdadeiro crente, antes de possuí-la, não tenha de esperar muito e lutar com muitas dificuldades. Contudo, sendo habilitado pelo Espírito a conhecer as coisas que lhe são dadas gratuitamente por Deus, ele pode alcançá-la sem revelação extraordinária, no uso dos meios ordinários. É, pois, dever de todo crente empregar toda a diligência para tornar certas a sua vocação e sua eleição (ênfase acrescentada).

Em outras palavras, a Confissão ensinava que a segurança era algo distinto da fé. Assim, alguém pode tornar-se um crente genuíno e ainda permanecer incerto quanto à salvação. Para os clérigos de Westminster, a segurança era possível — e altamente desejável — mas não automática. Eles acreditavam que alguns cristãos precisavam “esperar por longo tempo” e lutar com Deus, antes que Ele lhes desse segurança. A maioria dos puritanos (reformadores ingleses do século XVII) compartilhava dessa visão da segurança.

Então, por um lado, Calvino tendia a tornar o fundamento da segurança completamente objetivo, estimulando os crentes a considerarem as promessas das Escrituras a fim de ganharem um senso de segurança pessoal. Por outro lado, os puritanos tendiam a enfatizar meios subjetivos de estabelecer segurança, aconselhando as pessoas a examinarem sua vida e comportamento em busca de evidências de sua eleição.6

De fato, alguns puritanos levavam a extremos seu ensino sobre segurança. Eles tendiam a tornar-se místicos nessa questão, inferindo que segurança era algo que Deus outorga sobrenaturalmente em seu tempo e em medidas especiais para santos eleitos — quase semelhante a uma visão celestial pela qual alguém poderia ser morto ou a uma obra de uma graça acrescentada. A maioria dos puritanos ensinava que os crentes não poderiam obter segurança até muito depois da conversão e somente após uma vida de prolongada fidelidade.7 Eles tendiam a tornar a segurança dependente da habilidade do crente de viver quase em um nível inatingível de santidade pessoal. Tenho me beneficiado muito da leitura dos livros deles, mas me pergunto freqüentemente quantos deles foram capazes de viver à altura de seus próprios padrões.

Como poderíamos esperar, a pregação exigente dos puritanos levou a uma falta de segurança difundida entre as ovelhas deles. Os cristãos se tornaram obcecados por saber se eram realmente eleitos, e muitos caíram em introspecção mórbida e completo desespero. Isso explica por que tanto da literatura puritana foi escrita para pessoas que lutavam com a questão da segurança.

Ao contrário disso, hoje em dia a segurança é raramente tornada um assunto de debate. Para poucos cristãos professos parece faltar segurança pelo motivo de que a pregação evangelística geralmente é destituída de qualquer chamado a um viver santo. Evangelistas e conselheiros buscam normalmente afastar dúvidas quanto à salvação, declarando-as infundadas ou ensinando os convertidos a verem todas as dúvidas como um ataque do inimigo. Os pregadores temem tanto abalar a confiança de alguém, que parecem esquecer que a segurança falsa é um problema mais sério do que não ter nenhuma segurança (cf. Mt 7.21-23).

Certamente, há um ponto intermediário. As Escrituras encorajam os verdadeiros crentes com a promessa de segurança plena, enquanto deixam perturbados aqueles que fazem falsas profissões de fé, procurando destruir seu falso senso de segurança. O senso de segurança do verdadeiro crente não deve aumentar e diminuir com as emoções; a segurança deve ser um refúgio mesmo em meio às dificuldades da vida. Mas aquele que faz uma profissão de fé falsa não tem direito à segurança. Nossa pregação não deveria refletir essa ênfase dupla? Podemos recuperar o entendimento bíblico quanto à segurança de salvação?

Temos de recuperá-lo. Neste ponto, o debate sobre a salvação por senhorio atinge quase todos os cristãos no nível mais prático. Se confundirmos o assunto da segurança, teremos por um lado multidões cuja vida espiritual será mutilada pela dúvida; por outro lado, teremos multidões que esperam ser conduzidas ao céu, mas um dia serão desoladas ao ouvir o Senhor dizer: “Nunca vos conheci. Apartai-vos de mim” (Mt 7.23).

A Segurança é Objetiva ou Subjetiva?

A diferença entre Calvino e OS puritanos suscita uma pergunta que chega ao âmago do debate sobre o senhorio: os cristãos devem buscar a segurança mediante um apego apenas às promessas objetivas da Escritura ou mediante auto-análise subjetiva? Se optarmos apenas pelas promessas objetivas, aqueles que professam fé em Cristo ao mesmo tempo que, com suas ações, o negam (cf. Tt 1.16) podem reivindicar uma segurança à qual não têm direito. Mas, se dissermos que a segurança está disponível apenas mediante auto-análise subjetiva, interpretamos a segurança plena como praticamente impossível e tornamos a segurança uma questão completamente mística.

Aqueles que argumentam em favor de uma abordagem subjetiva mostrarão que as Escrituras exigem claramente a auto-análise. Somos ordenados a examinarmos a nós mesmos com regularidade — pelo menos na mesma freqüência com que participamos da Ceia do Senhor (1 Co 11.28). Paulo também emitiu este desafio à igreja em Corinto: “Examinai-vos a vós mesmos se realmente estais na fé; provai-vos a vós mesmos. Ou não reconheceis que Jesus Cristo está em vós? Se não é que já estais reprovados”

(2 Co 13.5). Nessa passagem, Paulo estava lidando com uma questão de segurança de fé. OS coríntios deveriam examinar a si mesmos para saber se realmente estavam “na fé”. Mas, que tipo de auto-exame Paulo estava exigindo? Por qual “teste” os coríntios tinham de passar? O apóstolo estava aconselhando-os a olhar para dentro de si mesmos e firmar a sua segurança em sua própria bondade? Estava desafiando-os a pensar no passado e lembrar algum momento de fé, no qual pudessem fixar suas esperanças? Ou estava sugerindo que deveriam olhar para suas obras e confiar em suas realizações espirituais?

Nenhuma dessas sugestões responde adequadamente à ques- tão. As obras sozinhas não garantem segurança genuína, assim como não podem ser o fundamento para a salvação eterna. Afinal, obras exteriores podem ser realizadas até por não-cristãos. Por um lado, como temos visto, até os cristãos mais espirituais descobrem pecado quando olham para dentro de si. Então, ninguém faz obras que estejam à altura dos padrões de perfeição de Deus. Nesse sentido, os mestres da doutrina do não-senhorio estão corretos: aqueles que apenas olham para dentro de si mesmos, a fim de estabelecer sua segurança, colocam-se numa vida de frustração. Segurança firme não pode ser encontrada em nenhuma quantidade de obras. Se alicerçarmos nossa segurança unicamente em algo de nós mesmos ou de nossa experiência, nossa confiança estará apoiada sobre um fundamento inadequado.8 Essa maneira de entender a segurança é muito subjetiva.

No entanto, a doutrina do não-senhorio oferece esta alternativa:

AS PROMESSAS DE DEUS SÃO SUFICIENTES PARA INSPIRAR CONFIANÇA. ENQUANTO

AS OBRAS DE ALGUÉM PODEM TER VALOR CONFIRMADOR, NÃO SÃO ESSENCIAIS À

SEGURANÇA. QUALQUER CRENTE PODE TER 100% DE CERTEZA DE SUA SALVAÇÃO,

SE SUA ATENÇÃO ESTIVER VOLTADA APENAS ÀS PROMESSAS DA PALAVRA DE DEUS

PARA O CRENTE.

Uma pessoa pode ter segurança de salvação firme e, apesar disso, andar em pecado. O pecado, embora seja grave, não enfraquece necessariamente a segurança. O pecado só pode enfraquecer a segurança se a pessoa tirar os olhos das promessas de Deus.9

Então, de acordo com O ensino do não-senhorio, se uma pessoa se apega às promessas objetivas da Palavra de Deus, nenhuma quantidade de pecado pode perturbar sua segurança de fé. Alguém que escolhe “andar em pecado” pode fazer isso com plena segurança de fé.10

Mas essa posição extrema não pode ser apoiada pela prática nem pela Bíblia. Hebreus 10.22 diz especificamente que, a fim de possuirmos “plena certeza de fé”, devemos ter “o coração purificado de má consciência”. 2 Pe 1.5-10 registra várias virtudes espirituais que são essenciais à salvação: fé, virtude, conhecimento, domínio próprio, perseverança, piedade, fraternidade e amor. A pessoa a quem faltam essas qualidades é cega ou míope, havendo “esquecido da purificação dos seus pecados de outrora” (v. 9, ênfase acrescentada).

Aqueles que andam em pecado podem, em sua mente, estar convictos de que sua salvação está assegurada, mas, se o seu coração e a sua consciência não estiverem cauterizados, terão de admitir que o pecado arruína a sua segurança. A abordagem da doutrina do não-senhorio em relação à segurança de fé é objetiva demais.

Quais são os fundamentos bíblicos da segurança?

A Bíblia sugere que uma segurança bem fundamentada tem apoio tanto objetivo quanto subjetivo.11 O fundamento objetivo é a obra consumada de Cristo em nosso favor, incluindo as promessas da Escritura, que possuem nele o seu sim e seu amém (2 Co 1.20). O fundamento subjetivo é a obra contínua do Espírito Santo em nossa vida, incluindo seus ministérios de convicção e santificação. Romanos 15.4 menciona ambos os aspectos da segurança: “Pois tudo quanto, outrora, foi escrito para o nosso ensino foi escrito, a fim de que, pela paciência [subjetivo] e pela consolação das Escrituras [objetivo], tenhamos esperança”.

Ambos os fundamentos, objetivo e subjetivo, de nossa segurança nos são aplicados pelo Espírito Santo, que “testifica com o nosso espírito que somos filhos de Deus” (Rm 8.16).

A base objetiva de nossa segurança inclui a verdade da justificação pela fé, a promessa de que Cristo nunca nos deixará nem abandonará (Hb 13.5), a garantia de nossa segurança em Cristo (Rm 8.38-39) e todas as verdades objetivas da Palavra de Deus, na qual a nossa fé está fundamentada. A pergunta objetiva é: você crê? Se você crê verdadeiramente, pode ter certeza de que é salvo (Jo 3.16; At 16.31).

A pergunta subjetiva é: sua fé é genuína? Essa foi a pergunta que Paulo fez em 2 Coríntios 13.5.

Aqui retornamos a uma pergunta que fizemos antes e ainda não respondemos: que tipo de auto-exame Paulo exigiu naquele versículo? Sabemos que ele não estava sugerindo que os cristãos podem achar segurança em si mesmos OU em suas obras. Qual é, então, O exame pelo qual temos de passar?

Paulo fizera alusão à resposta em capítulos anteriores da mesma epístola. Em 2 Co 3.18, ele escreveu: “E todos nós, com o rosto desvendado, contemplando, como por espelho, a glória do Senhor, somos transformados, de glória em glória, na sua própria imagem, como pelo Senhor, o Espírito”. Quando os verdadeiros cristãos contemplam o espelho da Palavra de Deus (cf. Tg 1.23), devem ver a glória do Senhor refletida ali. Com certeza, é um reflexo ofuscado: “Agora, vemos como em espelho, obscuramente; então, veremos face a face. Agora, conheço em parte; então, conhecerei como também sou conhecido” (1 Co 13.12), mas esse reflexo ofuscado de sua glória — e não qualquer coisa inerente a nós — é a base subjetiva de nossa segurança.

Até Calvino reconheceu um fundamento subjetivo da segurança, embora isso não fosse a principal ênfase de seu ensino. Enquanto enfatizava que todas as obras são demeritórias, Calvino disse que as boas obras dos crentes são “dons divinos nos quais [os crentes] reconhecem a bondade [de Deus] e os sinais do chamado, pelo que eles discernem sua eleição”.12 Elas são a obra de Deus em nós, e não nossas próprias realizações. Nesse mesmo contexto, Calvino cita uma oração de Agostinho: “Não louvo as obras de minhas mãos, pois temo que, ao examinares tais obras, encontrarás mais faltas do que méritos. Só digo isto, peço isto e desejo isto: não desprezes as obras de tuas mãos. Vê em mim uma obra tua, e não minha. Se vês minhas obras, me condenas; se vês tua própria obra, honras. Quaisquer que sejam as boas obras que eu tenha, elas provêm de ti” (Agostinho, em Salmos 137)”.13

A glória de Deus — ainda que um reflexo ofuscado desta glória — é o que veremos no espelho, se somos crentes verdadeiros.

Esse é O teste que Paulo COIOCOU diante dos corintios; VOCÊS conseguem ver a glória de Cristo refletida em vocês — embora ofuscada? “Examinai-vos a vós mesmos se realmente estais na fé; provai-vos a vós mesmos. Ou não reconheceis que Jesus Cristo está em vós? Se não é que já estais reprovados” (2 CO 13.5). Assim, a imagem de Cristo em nós provê O fundamento subjetivo de nossa segurança. Em outras palavras, Cristo em

VOCÊ é a esperança da glória (cf. Cl 1.27).

A Fim de que saibais

As epístolas do NOVO Testamento estão repletas de ensino necessário sobre a segurança e poderiam encher inúmeros volumes de comentários. Não posso neste tipo de livro apresentar um resumo completo da doutrina de segurança no NOVO Testamento. Mesmo a pequena epístola de 1 JOÃO, escrita para lidar precisamente com O assunto da segurança, é tão rica de ensino que não podemos considerá-la com plena justiça nestas poucas páginas. Quero ressaltar alguns dos pontos principais dessa epístola preciosa e seu ensino claro sobre este assunto. Certamente, nenhuma outra passagem das Escrituras confronta a teologia do não-senhorio com mais vigor do que essa carta breve, porém forte.

A afirmação do propósito de JOÃO é clara; “Estas coisas vos escrevi, a fim de saberdes que tendes a vida eterna, a vós outros que credes em O nome do Filho de Deus” (1 JO 5.13, ênfase acrescentada). Neste versículo, O apóstolo explica sua intenção. Ele não está tentando fazer os crentes duvidarem; antes, deseja que tenham plena segurança. O que ele tem a dizer não abalará os crentes genuínos, embora deva alarmar aqueles que têm um falso senso de segurança.

Observe que O apóstolo pressupõe a fé em Cristo como base de toda a segurança; “Estas coisas vos escrevi... a vós outros que credes”. Não há lugar para a auto-análise onde não há a fé em Cristo. Então, tudo que João diz sobre segurança está baseado na fé em Cristo e nas promessas das Escrituras.14

Por toda essa epístola, o apóstolo João mantém um equilíbrio cuidadoso entre os fundamentos objetivo e subjetivo da segurança. A evidência objetiva constitui um teste doutrinário. A evidência subjetiva não é um teste de obras, e sim um teste moral. João faz uma combinação entre os dois tipos de testes. Eis as provas que ele diz serem evidentes em todo crente genuíno:

Crentes verdadeiros andam na luz.

“Se dissermos que mantemos comunhão com ele e andarmos nas trevas, mentimos e não praticamos a verdade. Se, porém, andarmos na luz, como ele está na luz, mantemos comunhão uns com os outros, e o sangue de Jesus, seu Filho, nos purifica de todo pecado” (1 Jo 1.6-7). Em toda a Escritura, a luz é usada como uma metáfora da verdade — tanto a verdade intelectual como a verdade moral.

Salmos 119.105 diz: “Lâmpada para os meus pés é a tua palavra e, luz para os meus caminhos”. O versículo 130 acrescenta: “A revelação das tuas palavras esclarece e dá entendimento aos simples”. Provérbios 6.23 diz: “Porque o mandamento é lâmpada, e a instrução, luz”. Todos esses versículos falam da verdade como algo que deve ser conhecido e obedecido. É tanto doutrinária quanto moral. A luz de toda a verdade é personificada em Cristo, que disse: “Eu sou a luz do mundo; quem me segue não andará nas trevas; pelo contrário, terá a luz da vida” (Jo 8.12).

Andar nas trevas é o oposto de seguir a Cristo. Todas as pessoas não-salvas andam nas trevas; os cristãos foram libertados para a luz:

“Outrora, éreis trevas, porém, agora, SOÍS IUZ no Senhor; andai como filhos da luz” (Ef 5.8). “VÓS, irmãos, não estais em trevas” (1 TS 5.4). Andar na luz significa viver no reino da verdade. Portanto, todos os crentes verdadeiros estão andando na luz — mesmo quando pecamos. Quando pecamos, “o sangue de Jesus... nos purifica” (1 Jo 1.7). O tempo verbal neste versículo indica que o sangue de Cristo nos purifica continuamente. Quando pecamos, já estamos sendo purificados, de modo que nenhuma escuridão obscurece a luz em que habitamos (cf. 1 Pe 2.9).

Andar na luz descreve uma realidade posicionai e uma realidade prática para o crente. Confiar em Jesus Cristo é andar na luz. Andar na luz é prestar atenção à luz e viver adequadamente. Então, nesse primeiro teste, o apóstolo nos guia aos fundamentos da segurança, tanto objetivos como subjetivos. Para determinar se andamos na luz, devemos responder a pergunta objetiva: eu creio?, assim como a pergunta subjetiva: a minha fé é genuína?

Os verdadeiros crentes confessam seus pecados.

“Se dissermos que não temos pecado nenhum, a nós mesmos nos enganamos, e a verdade não está em nós. Se confessarmos os nossos pecados, ele é fiel e justo para nos perdoar os pecados e nos purificar de toda injustiça. Se dissermos que não temos cometido pecado, fazemolo mentiroso, e a sua palavra não está em nós. Filhinhos meus, estas coisas vos escrevo para que não pequeis. Se, todavia, alguém pecar, temos Advogado junto ao Pai, Jesus Cristo, o Justo” (1 Jo 1.8-2.1).

A palavra traduzida por “confessar” (no grego, homologeo) significa “dizer a mesma coisa”. Confessar “os nossos pecados” significa concordar com Deus sobre eles. Essa é uma característica de todos os crentes verdadeiros. Eles concordam com Deus quanto aos seus pecados. Isso significa que odeiam seus pecados, não os amam. Reconhecem que são pecadores e, ao mesmo tempo, sabem que são perdoados e têm um Advogado junto ao Pai (2.1).

Nestes versículos, parece que O apóstolo está sugerindo um teste objetivo para a segurança: “Você crê?” Especificamente: “Você concorda com o que Deus disse sobre o seu pecado?”

A verdadeira segurança da salvação sempre caminha de mãos dadas com uma conscientização de nossa própria pecaminosidade. De fato, quanto mais certos estamos da salvação, mais profunda se torna a nossa conscientização de nosso pecado. John Owen escreveu: “Um homem pode ter um profundo senso de pecado todos os seus dias, andar continuamente sob esse senso, abominar a si mesmo por sua ingratidão, descrença e rebeldia contra Deus, sem qualquer contestação de sua segurança”.15 Isso pode soar paradoxal, mas é exatamente o que impede que os cristãos caiam em completo desespero. Sabemos que somos pecadores. Concordamos com Deus sobre isso. Não nos surpreendemos em descobrir o pecado em nossa vida, mas o odiamos. Sabemos que somos perdoados e purificados e que Cristo é nosso Advogado. Contudo, em vez de usarmos esse conhecimento para justificar nosso pecado, nós o utilizamos como um motivo para mortificar ainda mais o pecado. “Estas coisas vos escrevo para que não pequeis” (2.1, ênfase acrescentada).

Os verdadeiros crentes guardam os mandamentos dEle.

“Ora, sabemos que o temos conhecido por isto: se guardamos os seus mandamentos. Aquele que diz: Eu o conheço e não guarda os seus mandamentos é mentiroso, e nele não está a verdade” (2.3-4). “Nisto conhecemos que amamos os filhos de Deus: quando amamos a Deus e praticamos os seus mandamentos. Porque este é o amor de Deus: que guardemos os seus mandamentos; ora, os seus mandamentos não são penosos” (5.2-3).

Nestes versículos, O apóstolo se concentra no fundamento subjetivo da segurança. Está nos estimulando a perguntar: a minha fé é genuína? Eis como podemos ter certeza de que chegamos a conhecê-lo: guardarmos os seus mandamentos. Este é um teste de obediência. A palavra grega traduzida por “guardar”, em 1 João 2.3-4, transmite a idéia de uma obediência vigilante, observadora. Não se trata de uma obediência que é apenas o resultado de pressão externa. É a obediência zelosa de alguém que “guarda” os mandamentos de Deus como algo precioso a proteger.

Em outras palavras, isso fala de uma obediência motivada por amor; e 1 João 2.5 explica: “Aquele, entretanto, que guarda a sua palavra, nele, verdadeiramente, tem sido aperfeiçoado o amor de Deus. Nisto sabemos que estamos nele”.

Aqueles que confessam conhecer a Deus e, ao mesmo tempo, desprezam seus mandamentos são mentirosos (v. 4). “No tocante a Deus, professam conhecê-lo; entretanto, o negam por suas obras; é por isso que são abomináveis, desobedientes e reprovados para toda boa obra” (Tt 1.16).

Os crentes verdadeiros amam os irmãos.

Este teste e o anterior estão intimamente relacionados: “Nisto são manifestos os filhos de Deus e os filhos do diabo: todo aquele que não pratica justiça não procede de Deus, nem aquele que não ama a seu irmão” (1 Jo 3.10). “Aquele que diz estar na luz e odeia a seu irmão, até agora, está nas trevas. Aquele que ama a seu irmão permanece na luz, e nele não há nenhum tropeço. Aquele, porém, que odeia a seu irmão está nas trevas, e anda nas trevas, e não sabe para onde vai, porque as trevas lhe cegaram os olhos” (2.9-11). “Nós sabemos que já passamos da morte para a vida, porque amamos os irmãos; aquele que não ama permanece na morte. Todo aquele que odeia a seu irmão é assassino; ora, vós sabeis que todo assassino não tem a vida eterna permanente em si” (3.14-15). “Nisto conhecemos que amamos os filhos de Deus: quando amamos a Deus e praticamos os seus mandamentos” (5.2).

A razão pela qual esses dois testes se relacionam tão fortemente é que o amor cumpre a lei de modo perfeito. “Quem ama o próximo tem cumprido a lei” (Rm 13.8). Amar a Deus e amar o próximo cumpre toda a lei moral. Jesus disse: “Amarás o Senhor, teu Deus, de todo o teu coração, de toda a tua alma e de todo o teu entendimento. Este é o grande e primeiro mandamento. O segundo, semelhante a este, é: Amarás o teu próximo como a ti mesmo. Destes dois mandamentos dependem toda a Lei e os Profetas” (Mt 22.37-40).

O amor por outros crentes é uma evidência particularmente importante da fé genuína. O fato determinante não é se temos o amor intrínseco em nós ou se ele é algo que flui de nossa própria bondade. “Amados, amemo-nos uns aos outros, porque o amor procede de Deus; e todo aquele que ama é nascido de Deus e conhece a Deus” (1 Jo 4.7, ênfase acrescentada). O amor que evidencia a fé verdadeira é o amor de Deus e está sendo aperfeiçoado em nós: “Se amarmos uns aos outros, Deus permanece em nós, e o seu amor é, em nós, aperfeiçoado” (4.12). Mais uma vez, é esse reflexo obscure-cido da glória divina em nós que provê o fundamento subjetivo de nossa segurança.

Os verdadeiros crentes afirmam a sã doutrina.

Agora retornamos ao fundamento objetivo: “E vós possuís unção que vem do Santo e todos tendes conhecimento. Não vos escrevi porque não saibais a verdade; antes, porque a sabeis, e porque mentira alguma jamais procede da verdade. Quem é o mentiroso, senão aquele que nega que Jesus é o Cristo? Este é o anticristo, o que nega o Pai e o Filho. Todo aquele que nega o Filho, esse não tem o Pai; aquele que confessa o Filho tem igualmente o Pai” (2.20-23). “Nisto reconheceis o Espírito de Deus:

todo espirito que confessa que Jesus Cristo veio em carne é de Deus... Nós somos de Deus; aquele que conhece a Deus nos ouve; aquele que não é da parte de Deus não nos ouve. Nisto reconhecemos o espirito da verdade e o espirito do erro” (4.2, 6).

João estava escrevendo em oposição a uma forma primitiva da heresia gnóstica, que negava ser Jesus Cristo plenamente Deus e plenamente homem. Estava dizendo que ninguém verdadeiramente salvo pode cair em erro sério ou heresia de negar a Cristo. Por quê? Porque “vós possuis unção que vem do Santo e todos tendes conhecimento... a unção que dele recebestes permanece em vós, e não tendes necessidade de que alguém vos ensine; mas, como a sua unção vos ensina a respeito de todas as coisas, e é verdadeira, e não é falsa, permanecei nele, como também ela vos ensinou” (2.20, 27). Mais uma vez, é a obra divina em nós, e não nossas próprias habilidades ou realizações, que oferece uma base perfeita para nossa segurança.

E quanto àqueles que se afastam completamente da sã doutrina? João responde, com clareza, a esse caso: “Eles sairam de nosso meio; entretanto, não eram dos nossos; porque, se tivessem sido dos nossos, teriam permanecido conosco; todavia, eles se foram para que ficasse manifesto que nenhum deles é dos nossos” (2.19). Nesse ponto, o ensino do não-senhorio contradiz ostensivamente as Escrituras (cf. SGS 141, AF 111). Aqueles que apostatam e negam a Cristo apenas provam que sua fé nunca foi genuína. Examinaremos melhor essa idéia no capitulo 11.

Os crentes verdadeiros seguem a santidade.

“Se sabeis que ele é justo, reconhecei também que todo aquele que pratica a justiça é nascido dele” (2.29). “E a si mesmo se purifica todo o que nele tem esta esperança, assim como ele é puro. Todo aquele que pratica o pecado também transgride a lei, porque

O pecado é a transgressão da lei” (3.3-4). “Todo aquele que permanece nele não vive pecando; todo aquele que vive pecando não O viu, nem O conheceu. Filhinhos, não vos deixeis enganar por ninguém; aquele que pratica a justiça é justo, assim como ele é justo. Aquele que pratica O pecado procede do diabo, porque O diabo vive pecando desde O princípio. Para isto se manifestou O Filho de Deus: para destruir as obras do diabo. Todo aquele que é nascido de Deus não vive na prática de pecado; pois O que permanece nele é a divina semente; ora, esse não pode viver pecando, porque é nascido de Deus” (3.6-9).

Esses versículos têm confundido muitas pessoas. A chave para a sua compreensão é a definição de pecado em 3.4: “O pecado é a transgressão da lei”. A palavra grega para “transgressão da lei” é anomia. Literalmente, ela significa “sem lei” e descreve aqueles que têm vida imoral, ímpia e injusta como prática contínua. Eles odeiam a justiça de Deus e vivem perpetuamente como se fossem soberanos sobre a lei de Deus. Isso não pode ser verdade em um crente genuíno.

É claro que O apóstolo não está fazendo da perfeição uma prova de salvação. Afinal de contas, ele começou sua epístola dizendo:

“Se dissermos que não temos pecado nenhum, a nós mesmos nos enganamos, e a verdade não está em nós” (1.8).

Ele também não está fazendo uma discussão sobre freqüência, duração ou dimensão dos pecados de alguém. Como observamos no capítulo 8, todos os cristãos pecam. A questão que João está levantando aqui tem a ver com nossa atitude em relação ao pecado e à retidão, a resposta de nosso coração quando pecamos, e com toda a direção de nosso caminhar.

O teste é este: qual é O objeto de nossas afeições — O pecado ou a retidão? Se O que você mais ama é O pecado, você é “do diabo” (3.8, 10). Se você ama a retidão e pratica a justiça, você nasceu de Deus (2.29). Qual é direção de sua afeição? Como John

Owen escreveu habilmente, “O seu estado não deve ser avaliado pela oposição que O pecado lhe faz, e sim pela oposição que você faz ao pecado”.16

Aqueles que se apegam à promessa de vida eterna, mas não se importam com a santidade de Cristo não têm nada do que podem ser assegurados. Eles não crêem realmente. Ou a “fé” que professaram em Cristo é um completo engano ou estão iludidos. Se tivessem, verdadeiramente, sua esperança firme em Cristo, purificariam a si mesmos, como Ele é puro (3.3).

Os crentes verdadeiros têm o Espírito Santo.

Este é O teste abrangente que resume todos os outros: O Espírito Santo habita em você?17 JOÃO escreveu: “Nisto conhecemos que permanecemos nele, e ele, em nós: em que nos deu do seu Espírito” (1 JO 4.13). “Aquele que crê no Filho de Deus tem, em si, O testemunho. Aquele que não dá crédito a Deus O faz mentiroso, porque não crê no testemunho que Deus dá acerca do seu Filho. E O testemunho é este: que Deus nos deu a vida eterna; e esta vida está no seu Filho” (5.10-11).

Nesses versículos há uma repercussão da teologia paulina. Paulo escreveu: “O próprio Espírito testifica com O nosso espírito que somos filhos de Deus”

(Rm 8.16). As Escrituras dizem: “Pelo depoimento de duas ou três testemunhas, se estabelecerá O fato” (Dt 19.15; cf. Mt 18.16; 2 CO 13.1). Romanos 8.16 está dizendo que O Espírito Santo acrescenta seu testemunho ao testemunho de nosso espírito, sendo assim confirmada a nossa segurança.

Isso dissipa completamente a noção de que a auto-análise equivale a colocar a fé nas obras. A evidência que buscamos me- 16 17 diante a auto-análise é O fruto do Espirito (Gl 5.22-23), a prova de que Ele habita em nós. A nossa segurança é confirmada nesse testemunho.

BROOK, Thomas Heaven on earth: a treatise on Christian assurance. Edinburgh: Banner of Truth, 1982. p. 49. Reimpressão.

Um editor publicou uma resenha de O evangelho segundo Jesus a qual começava assim: “O livro de MacArthur trata de quatro assuntos principais: a segurança, a fé, o arrependimento e a relação entre a salvação e o discipulado”, Mas não há tais divisões em meu livro, A segurança de salvação não era certamente o assunto principal, Mencionei falsa segurança apenas causal-mente e três ou quatro vezes no máximo, Entretanto, a resenha prosseguiu: “Embora não o exponha em muitas palavras, MacArthur não acredita em segurança”, É claro que isso é um absurdo e um bom exemplo da razão por que as pessoas não compreendem o que é o debate do senhorio, Essa resenha foi publicada no boletim de uma organização que existe para defender a teologia do não-senhorio, E continha vários outros erros e calúnias graves, O editor não respondeu às cartas que lhe pediam corrigisse suas distorções,

Obviamente, existe um problema semelhante na teologia wesleyana e arminiana, bem como em qualquer outro sistema de crenças que dá lugar ao ensino de que os cristãos abandonam a fé e perdem a salvação.

CALVIN, John. Institutes of the Christian religion. Trans. Henry Beveridge. Grand Rapids, Mich.: Eerdmans, 1966. 3:2:7.

Ibid.

Zane Hodges vê grande importância nessa divergência entre Calvino e os que vieram depois dele. Hodges tenta alistar Calvino no apoio à posição da salvação sem senhorio (AF 207-209, 214-215). Contudo, ele vai muito além de Calvino nessa questão, fazendo da segurança de salvação a totalidade e a substância da fé salvífica (AF 50-51) e negando qualquer necessidade de auto-exame quanto à segurança (AF 174-175). De acordo com Hodges, a segurança é fé e vice-versa. Nenhuma outra evidência de regeneração é necessária. Ele compreende que o reformador ensinou isso.

No entanto, qualquer que tenha sido a opinião de Calvino sobre a fé e a segurança, fica claro que ele não teria apoiado o tipo de soteriologia da salvação sem senhorio de Hodges. Calvino escreveu: “Devemos ter o cuidado de não separar aquilo que o Senhor une perpetuamente. O que deve ser feito? Sejam os homens ensinados que é impossível serem considerados justos pelo mérito de Cristo, sem serem renovados por seu Espírito para uma vida santa... Deus não recebe em seu favor a quem Ele não tornou verdadeiramente justo”. BEVERIDGE, Henry; BONNET, Jules (Ed.). Selected works of John Calvin, 7 v. Grand Rapids, Mich.: Baker, 1983. 3:246. Ênfase acrescentada.

Calvino acrescentou: “[Fé] não é um conhecimento vazio que paira na mente, [mas] carrega consigo uma afeição ativa, que se fundamenta no coração” (Ibid., p. 205).

Os escritos de John Owen sobre segurança são uma estimulante exceção dessa regra. Cf. FERGUSON, Sinclair B. John Owen on the christian life. Edinburgh: Banner of Truth, 1987. p. 99-124.

“A fé vacila quando atenta às obras, visto que ninguém, nem mesmo o mais santo, encontrará nas obras uma base em que possa confiar.” CALVIN, John. Institutes of the Christian religion. Trans. Ford Lewis Battles. Philadelphia: Westminster, I960. 3.11.11.

WILKIN, Bob. Putting the gospel debate in sharper focus. The Grace Evangelical Society News, Denton, p. 1, May 1991.

Segurança de fé sem santificação é a essência do antinomianismo; e o antino-mianismo é freqüentemente o resultado de uma ênfase extrema na segurança como a essência da fé. No início dos anos 1800, Charles Hodge observou essa tendência. Ele disse: “Aqueles que fazem da segurança a essência da fé reduzem geralmente a fé a mera aceitação intelectual. Eles são, com freqüência, censuradores e se recusam a reconhecer como irmãos aqueles que não concordam com eles; e, às vezes, são anti-nomianos.” (HODGE, Charles. Systematic theology. Grand Rapids, Mich.: Eerdmans, 1989. 3:106-107.)

Berkhof, enquanto reconhecia perigo do antinomianismo, entendia que alguém pode sustentar a posição de que a segurança integra a essência da fé e, apesar disso, pode manter em equilíbrio essa opinião. Ele escreveu: “Em contrário à doutrina da Igreja de Roma deve ser mantida a posição de que este firme conhecimento pertence à essência da fé; e, em oposição a teólogos [antinomianos] como Sandeman, Wardlaw, Alexander, Chalmers e outros, deve ser mantido que uma mera aprovação intelectual da verdade não é tudo que a fé significa.” (BERKHOF, Louis. Systematic theology. Grand Rapids, Mich.: Eerdmans, 1939. p. 503.)

“Em seu contexto neo-testamentário, [segurança] tem referências tanto objetivas como subjetivas. No aspecto objetivo, a palavra denota o fundamento da confiança e certeza do crente... No aspecto subjetivo, “segurança” refere-se à experiência do crente... A segurança interior deve ser verificada por testes morais e espirituais (cf. 1 Co 6.9; Ef 4.17; 1 Jo 2.3-5, etc.), por meio dos quais sabemos que somos da verdade e que nosso coração está seguro diante de Deus (1 Jo 3.19).” (ASSURANCE. In: MCDONALD, H. D. The new international dictionary of the christian church. Grand Rapids, Mich.: Zondervan, 1978. p. 79.)

CALVIN, John. Institutes of the Christian religion. Trans. Henry Beveridge. Grand Rapids, Mich.: Eerdmans, 1966. 3:14:20.

Ibid.

“Os fundamentos da segurança são mais objetivos do que subjetivos. Não estão tanto dentro de nós como estão fora de nós. Por isso, a base da segurança deve estar na evidência objetiva suficiente.” ASSURANCE. In: BOYD, Robert F. Baker’s dictionary of theology. Grand Rapids, Mich.: Baker, 1960. p. 70.

OWEN, John. The Works of John Owen, 16 v. London: Banner of Truth, 1965. 6:549.

Ibid. 6:605.

O teste que João sugere nesta passagem é quase idêntico à auto-análise que Paulo recomendou em 2 Coríntios 13.5: Jesus Cristo está em vós?

O Perigo da Falsa Segurança

Antes de prosseguirmos para outro capitulo, devemos abordar brevemente a questão da falsa segurança. Em toda a sua primeira epístola, o apóstolo João ataca a falsa confissão daqueles que não têm direito à segurança: “Aquele que diz: Eu o conheço e não guarda os seus mandamentos é mentiroso, e nele não está a verdade” (2.4). “Aquele, porém, que odeia a seu irmão está nas trevas, e anda nas trevas, e não sabe para onde vai, porque as trevas lhe cegaram os olhos” (2.11). “Todo aquele que nega o Filho, esse não tem o Pai” (2.23). “Aquele que pratica o pecado procede do diabo” (3.8). “Todo aquele que odeia a seu irmão é assassino; ora, vós sabeis que todo assassino não tem a vida eterna permanente em si” (3.15). “Aquele que não ama não conhece a Deus” (4.8). “Se alguém disser: Amo a Deus, e odiar a seu irmão, é mentiroso; pois aquele que não ama a seu irmão, a quem vê, não pode amar a Deus, a quem não vê” (4.20).

Um dos perigos do ensino radical do não-senhorio é que ele ignora o risco da falsa segurança. Como? Primeiramente, essa posição enxerga a segurança e a fé salvifica quase como sinônimos. “Explicando de forma simples, a mensagem [do evangelho] traz consigo a segurança da salvação... quando uma pessoa crê, ela tem a segurança da vida eterna. Como poderia ser de outro modo?... Duvidar da garantia da vida eterna é duvidar da própria mensagem. Resumindo, se não acredito que sou salvo, não acredito na oferta que Deus fez para mim... Uma pessoa que nunca tem certeza da vida eterna nunca creu na mensagem salvifica de Deus” (AF 50-51).

De fato, segundo essa posição, uma convicção de segurança na mente de alguém é a melhor evidência de salvação. “As pessoas sabem se acreditam em algo ou não; e é isso que realmente interessa a Deus” (AF 31). É óbvio que nessa posição não há lugar para falsa segurança. Todos que professam crê em Cristo são encorajados a reivindicar “100% de segurança”. Todos que professam ter segurança são aceitos como crentes verdadeiros, embora seu estilo de vida se oponha a tudo que Cristo representa.

A consciência grita contra essa doutrina! Ela promete uma “segurança” que o coração nunca confirmará. Não oferece paz real para a alma. Em vez disso, ela faz da segurança um patrimônio completamente intelectual. A doutrina do não-senhorio é, portanto, forçada a negar o fundamento subjetivo da segurança, porque a auto-análise revelaria imediatamente o vazio da esperança infundada de cada pessoa que faz uma profissão de fé falsa. Lançando um alicerce inseguro, a doutrina do não-senhorio declara que a construção está completa. O teste objetivo é tudo que eles podem suportar. Se a mente está convicta, não há necessidade de envolver a consciência. Isso é o epitome da falsa segurança.

John Owen chamava a falsa segurança de “percepção nocional do perdão dos pecados”.1 Owen acreditava que o efeito dessa segurança era “infunde secretamente na alma estimulos que levam-na a permanecer em [pecado]”. “No mundo não há ninguém que tenha um relacionamento tão ruim com Deus quanto aqueles que possuem uma infundada persuasão de perdão... Ousadia carnal, formalidade e desprezo para com Deus são os assuntos comuns em tal noção e persuasão”.2 “Quando a consciência acusa, [a falsa segurança] deve satisfazer o erro.”3 Owen não teve medo de especificar como impios

(Jd 4) aqueles que tornam a graça de nosso Deus em licenciosida- de. “Deixem professar o que quiserem”, Owen escreveu, “eles são ímpios .

A teologia do não-senhorio diz a pessoas obstinadamente ímpias que elas podem descansar seguras na esperança do céu. Essa não é a segurança genuína. A segurança verdadeira emana da fé ope-rante, permitindo-nos olhar para o espelho e ver, além de nosso ego pecaminoso, um o reflexo ofuscado da glória de Deus que se torna cada vez mais brilhante, em ondas sempre crescentes. “E todos nós, com o rosto desvendado, contemplando, como por espelho, a glória do Senhor, somos transformados, de glória em glória, na sua própria imagem, como pelo Senhor, o Espírito” (2 Co 3.18).4

Capítulo 11

OWEN, John. The works of John Owen, 16 v. London: Banner of Truth, 1965. 6:397.

Ibid. 6:396.

Ibid. 6:398.

Ibid. 6:397.

Quanto a uma discussão mais completa sobre a segurança de salvação, ver: MA-CARTHUR JR., John. Saved without a doubt. Wheaton, Ill.: Victor, 1992.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A aula ensina que a verdadeira segurança tem base objetiva e subjetiva, e que ao olhar para o espelho da Palavra você deve ver refletida nele a glória de Cristo em você; quando você se examina, consegue enxergar esse reflexo, ainda que ofuscado, da imagem de Cristo na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$João dá como prova da fé genuína que os crentes verdadeiros guardam os mandamentos e amam os irmãos; a sua vida tem demonstrado essa obediência amorosa e esse amor real pelo povo de Deus, ou você apenas afirma conhecê-lo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O autor alerta que a falsa segurança é mais perigosa do que não ter segurança nenhuma; será que você tem descansado numa certeza apenas intelectual que a sua consciência nunca confirma, enquanto o seu coração permanece frio para Cristo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Poder de Deus$t$, 11,
$conteudo$A fim de considerarmos adequadamente a doutrina da perseverança, precisamos saber o que ela não é. Ela não significa que a todos que professam fé em Cristo e são aceitos como crentes na comunhão dos santos é assegurada a eternidade e que eles podem nutrir a segurança da salvação eterna. Nosso próprio Senhor advertiu seus seguidores nos dias em que esteve encarnado, quando disse àqueles judeus que creram nele: “Se vós permanecerdes na minha palavra, sois verdadeiramente meus discípulos; e conhecereis a verdade, e a verdade vos libertará” (Jo 8.31, 32). Ele estabeleceu um critério pelo qual os verdadeiros discípulos podem ser distin-guidos; e o critério é a permanência na Palavra de Jesus.

JOHN MURRAY1

Se algum personagem do Novo Testamento era inclinado ao fracasso, esse personagem era Simão Pedro. Avaliando pelo relato bíblico, nenhum dos discípulos de nosso Senhor — exceto

Judas, O traidor — tropeçou mais freqüente e mais dolorosamente do que ele. Pedro era O discípulo que mais errava no falar. Parecia ter aptidão para dizer a pior coisa possível no momento mais inapropriado. Era impetuoso, inconstante, vacilante — às vezes, covarde; às vezes, fraco; às vezes, irascível. Em várias ocasiões, mereceu repreensões fortes do Senhor; e nenhuma foi mais severa do que aquela registrada em Mateus 16.23: “Arreda, Satanás! Tu és para mim pedra de tropeço, porque não cogitas das coisas de Deus, e sim das dos homens”. Isso aconteceu quase imediatamente depois do auge na experiência de Pedro com Cristo, quando Pedro confessou: “Tu és O Cristo, O Filho do Deus vivo” (Mt 16.16).

A vida de Pedro ilustra outra verdade bíblica mais significativa: O poder de Deus em guardar. Na noite de sua traição, Jesus deu a Pedro uma compreensão da batalha espiritual que, em segredo, acontecia a respeito de sua alma: “Simão, Simão, eis que Satanás vos reclamou para vos peneirar como trigo! Eu, porém, roguei por ti, para que a tua fé não desfaleça” (Lc 22.31-32, ênfase acrescentada).

Pedro estava confiante em sua disposição para ficar com Jesus a qualquer preço. Ele disse ao Senhor: “Senhor, estou pronto a ir contigo tanto para a prisão como para a morte” (v. 33).

Mas Jesus sabia a verdade e, com tristeza, disse a Pedro: “Hoje, três vezes negarás que me conheces, antes que O galo cante” (v. 34).

Pedro falhou? Miseravelmente. Sua fé foi arruinada? Nunca. O próprio Jesus estava intercedendo por ele, e suas orações não ficaram sem resposta.

Você sabia que nosso Senhor intercede assim por todos os crentes genuínos? Em João 17.11, temos um vislumbre de como Ele ora: “Já não estou no mundo, mas eles continuam no mundo, ao passo que eu vou para junto de ti. Pai santo, guarda-os em teu nome, que me deste, para que eles sejam um, assim como nós” (ênfase acrescentada).

E continua:

Não peço que os tires do mundo, e sim que os guardes do mal. Eles não são do mundo, como também eu não sou. Santifica-os na verdade; a tua palavra é a verdade. Assim como tu me enviaste ao mundo, também eu os enviei ao mundo. E a favor deles eu me santifico a mim mesmo, para que eles também sejam santificados na verdade. Não rogo somente por estes, mas também por aqueles que vierem a crer em mim, por intermédio da sua palavra; a fim de que todos sejam um; e como és tu, ó Pai, em mim e eu em ti, também sejam eles em nós; para que o mundo creia que tu me enviaste. Eu lhes tenho transmitido a glória que me tens dado, para que sejam um, como nós o somos; eu neles, e tu em mim, a fim de que sejam aperfeiçoados na unidade, para que o mundo conheça que tu me enviaste e os amaste, como também amaste a mim.

João 17.15-23, ênfase acrescentada.

Observe em favor de que nosso Senhor orou: que os crentes fossem guardados do poder do mal; que fossem santificados pela Palavra; que compartilhassem de sua santificação e glória e fossem aperfeiçoados em sua união com Cristo e uns com os outros. Ele orou em favor de que eles perseverassem na fé.

Nosso Senhor orou apenas pelos onze discípulos fiéis? Não, Ele incluiu cada crente das gerações posteriores: “Não rogo somente por estes, mas também por aqueles que vierem a crer em mim, por intermédio da sua palavra” (v. 20). Isso inclui todos os cristãos verdadeiros, até em nossos próprios dias!

Além disso, o Senhor continua a realizar seu ministério de inter-cessão pelos crentes agora mesmo, enquanto você lê isto. “Também pode salvar totalmente os que por ele se chegam a Deus, vivendo sempre para interceder por eles” (Hb 7.25). A versão King James, em português, o traduz assim: “Ele é poderoso para salvar definitivamente aqueles que, por intermédio dele, achegam-se a Deus, pois vive sempre para interceder por eles” (ênfase acrescentada).

Totalmente salvos

Todos OS crentes verdadeiros serão totalmente salvos. O ministério de Cristo como sumo sacerdote garante isso. Fomos justificados, estamos sendo santificados e seremos glorificados. Nenhum crente verdadeiro perderá qualquer estágio do processo, embora nesta vida estejamos em pontos diferentes ao longo da jornada. Historicamente, essa verdade tem sido conhecida como a perseverança dos santos.

Nenhuma outra doutrina tem sido mais severamente atacada pela teologia do não-senhorio. Deve-se esperar isso, porque a doutrina da perseverança é contrária a toda a teologia do não-senhorio. De fato, o que eles rotularam pejorativamente de “salvação por senhorio” é nada mais do que a doutrina da perseverança dos santos!

A perseverança significa que “aqueles que têm fé verdadeira não perdem essa fé, nem total nem finalmente”.2 Isso reflete a promessa de Deus feita por meio de Jeremias: “Farei com eles aliança eterna, segundo a qual não deixarei de lhes fazer o bem; e porei o meu temor no seu coração, para que nunca se apartem de mim” (32.40, ênfase acrescentada).

Isso contradiz a noção do não-senhorio, de que a fé pode desaparecer, produzindo “crentes” que não crêem mais (cf. SGS 141). A doutrina da perseverança se opõe ao ensino radical do não-senhorio, de que cristãos genuínos podem escolher “pular fora” do processo de crescimento espiritual (AF 79-88) e “parar de confessar o cristianismo” (AF 111). É o oposto da teologia que torna a fé um “momento histórico”, um “ato” passado que assegura o céu, mas não oferece garantia de que a vida terrena “do crente” será mudada (AF 63-64).

A perseverança foi definida assim pela Confissão de Fé de Westminster: “Os que Deus aceitou em seu Bem-Amado, os que ele chamou eficazmente e santificou pelo seu Espírito não podem cair do estado de graça, nem total nem finalmente; mas, com toda a certeza, hão de perseverar nesse estado até ao fim e serão eternamente salvos” (capitulo 17, seção 1).

A verdade não nega a possibilidade de fracassos miseráveis na experiência de um cristão. A Confissão também declarou:

Eles, porém, pelas tentações de Satanás e do mundo, pela força da corrupção neles restante e por negligência em relação aos meios de preservação, podem cair em graves pecados e continuar neles por algum tempo. Incorrem, assim, no desagrado de Deus, entristecem o seu Espirito Santo e, de algum modo, se tornam privados das graças e confortos do Espirito; têm seu coração endurecido e sua consciência, ferida; prejudicam e escandalizam os outros, atraindo sobre si juizos temporais (seção 3).

No capitulo 8 abordamos a realidade do pecado na experiência do crente. Portanto, já deve ser claro para nós que a teologia do senhorio não inclui a idéia de perfeccionismo. No entanto, as pessoas saturadas da doutrina do não-senhorio entendem mal a questão concernente à perseverança.

Um cristão leigo que abraçou o ensino do não-senhorio escreveu-me uma carta muito educada, de dezessete páginas, explicando por que rejeitava a doutrina do senhorio. A queixa dele era que a teologia do senhorio “não parece permitir nada além de um viver cristão altamente bem-sucedido”.

Zane Hodges faz uma acusação semelhante:

A crença de que todo cristão terá uma vida basicamente bem-sucedida até ao fim é uma ilusão. Isso não tem apoio nas instruções e advertências do Novo Testamento... Não é surpreendente que aqueles que não percebem esse aspecto da revelação do Novo Testamento empobrecem sua habilidade de motivar tanto a si mesmos como a outros crentes. Tragicamente, eles cedem à técnica de questionar a salvação daqueles cuja vida parece não alcançar os padrões bíblicos. Entretanto, no processo, eles corroem as bases da segurança do crente e tomam parte — embora inconscientemente — no cerco do evangelho.3

Não conheço nenhum defensor da salvação por senhorio que ensine que “todo cristão terá uma vida basicamente bem-sucedida até ao fim”. Hodges está certo quando diz que o Novo Testamento não apóia tal visão.

John Murray, defendendo a doutrina da perseverança, reconheceu as dificuldades que ela apresenta: “Experiência, observação, história bíblica e certas passagens das Escrituras parecem oferecer argumentos muito fortes contra a doutrina... O relato bíblico, assim como a história da igreja, não contém muitos exemplos daqueles que naufragaram na fé?”4

Certamente, as Escrituras parecem estar cheias de advertências no sentido de que os cristãos não apostatassem (cf. Hb 6.4-8; 1 Tm 1.18-19; 2 Tm 2.16-19). Zane Hodges sugere que essas advertências provam que eles podem apostatar: “Se alguém supõe que nenhum crente verdadeiro pode desistir, ou desistiria, não prestou atenção à Bíblia. Precisa ler novamente seu Novo Testamento, mas, agora, com os olhos abertos” (AF 83).

Deus não se contradiz. As passagens de advertência não negam as muitas promessas de que os crentes perseverarão: “Aquele, porém, que beber da água que eu lhe der nunca mais terá sede; pelo contrário, a água que eu lhe der será nele uma fonte a jorrar para a vida eterna” (Jo 4.14, ênfase acrescentada).5 “Eu sou o pão da vida; o que vem a mim jamais terá fome; e O que crê em mim jamais terá sede” (6.35). “De maneira que não vos falte nenhum dom, aguardando vós a revelação de nosso Senhor Jesus Cristo, o qual também vos confirmará até ao fim, para serdes irrepreensíveis no Dia de nosso Senhor Jesus Cristo. Fiel é Deus, pelo qual fostes chamados à comunhão de seu Filho Jesus Cristo, nosso Senhor” (1 Co 1.7-9, ênfase acrescentada). “O mesmo Deus da paz vos santifique em tudo; e o vosso espírito, alma e corpo sejam conservados íntegros e irrepreensíveis na vinda de nosso Senhor Jesus Cristo. Fiel é o que vos chama, o qual também o fará” (1 Ts 5.23-24, ênfase acrescentada). “Eles saíram de nosso meio; entretanto, não eram dos nossos; porque, se tivessem sido dos nossos, teriam permanecido conosco; todavia, eles se foram para que ficasse manifesto que nenhum deles é dos nossos” (1 Jo 2.19, ênfase acrescentada). “Ora, àquele que époderoso para vos guardar de tropeços e para vos apresentar com exultação, imaculados diante da sua glória, ao único Deus, nosso Salvador, mediante Jesus Cristo, Senhor nosso, glória, majestade, império e soberania, antes de todas as eras, e agora, e por todos os séculos. Amém!” (Jd 24-25, ênfase acrescentada).

Charles Horne observou: “É notável que, ao exortar-nos a que nos guardemos no amor de Deus (v. 21), Judas concluiu com uma doxologia àquele que é capaz de guardar-nos de tropeços e que nos apresentará imaculados diante da sua glória (v. 24). As passagens de advertências são meios que Deus usa em nossa vida para realizar seu propósito em graça”.6

Podemos dizer também que passagens de advertência como Judas 21 revelam que os escritores da Bíblia eram muito incisivos ao alertar aqueles cuja esperança de salvação pudesse estar fundamentada numa fé espúria. Obviamente, os autores apostólicos não trabalhavam sob a ilusão de que cada pessoa nas igrejas para as quais eles escreviam eram genuinamente convertidas (cf. AF 98).

Uma vez salvo sempre salvo?

É crucial compreendermos O que a doutrina bíblica da perseverança não significa. Não significa que as pessoas que “aceitam a Cristo” podem viver de qualquer modo que lhes seja agradável, sem temerem o inferno. A expressão “segurança eterna” com freqüência é usada neste sentido, como, por exemplo, em “uma vez salvo, sempre salvo”. R. T. Kendall, argumentando a favor desta expressão, definiu assim o seu significado: “Qualquer pessoa que crê verdadeiramente que Jesus ressuscitou dos mortos e confessa ser Jesus o Senhor irá para o céu quando morrer. Mas não pararei aqui. Tal pessoa irá para o céu quando morrer independentemente da obra (ou falta de obra) que acompanhe essa fé”.7 Kendall declarou: “Espero que ninguém entenda isso como um ataque à Confissão de Westminster. Não é isso”.7 8 Mas é precisamente isso! Kendall está argumentando contra a afirmação de Westminster de que a fé não pode falhar. Kendall acredita que a fé é melhor caracterizada como um único olhar: “Para ser salva, a pessoa precisa apenas ver, uma vez, Aquele que levou os pecados”.9 Isso é uma investida severa contra a doutrina da perseverança afirmada na Confissão de Westminster. Pior, isso subverte a própria Escritura. Infelizmente, é uma posição na qual muitos cristãos têm crido hoje.

John Murray, observando essa tendência, há quase quarenta anos, defendeu a expressão “A Perseverança dos Santos”:

Substituir a designação “A Segurança do Crente” não está fundamentado nos melhores interesses da doutrina envolvida. Não porque esta designação seja errada em si mesma, mas porque a outra fórmula de expressão é moldada de maneira mais cuidadosa e inclusiva... Não é verdade que o crente está seguro por mais que caia em pecado e infidelidade. Por que isso não é verdade? Não é verdade porque estabelece uma combinação impossível. É verdade que o crente peca, pode cair em pecado grave e apostatar por períodos prolongados. Mas também é verdade que ele não se entrega ao pecado, não fica sob o domínio do pecado, não é culpado de certos tipos de infidelidade. E, portanto, é completamente errado dizer que um crente está seguro sem restringir sua vida subseqüente de pecado e infidelidade. A verdade é que a fé em Jesus Cristo sempre corresponde a uma vida de santidade e fidelidade. Assim, nunca é apropriado pensar num crente que não considera os frutos da fé e da santidade. Dizer que um crente está seguro em qualquer que seja a extensão de seu apego ao pecado, em sua vida subseqüente, é abstrair a fé em Cristo de sua exata definição e contribui ao abuso que torna a graça de Deus em lascívia. A doutrina da perseverança é o ensino de que os crentes perseveram... Isso não significa que eles serão salvos sem a sua perseverança ou continuidade, e sim que, sem dúvida, perseverarão. Conseqüentemente, a segurança que lhes dia respeito não se separa de sua perseverança. Não foi isso que Jesus disse? “Aquele, porém, que perseverar até ao fim, esse será salvo”.

10. MURRAY, John. Redemption accomplished and applied. Grand Rapids, Mich.: Eer-dmans, 1955. p. 154-155.

Então, não nos refugiemos em nossa indolência, nem nos encorajemos em nossa lascívia com base no abuso da doutrina da segurança do crente. Apreciemos a doutrina da perseverança dos santos e reconheçamos que podemos nutrir a fé de nossa segurança em Cristo apenas enquanto perseveramos na fé e na santidade até ao fim.10

Qualquer ensino sobre a segurança eterna que exclui a perseverança distorce a própria doutrina da salvação. O céu sem santidade ignora todo o propósito para o qual Deus nos escolheu e redimiu:

Deus nos elegeu exatamente com este propósito. “[Deus] nos escolheu, nele [Cristo], antes da fundação do mundo, para sermos santos e irrepreensíveis perante ele" (Ef 1.4). Fomos predestinados para sermos conformes à imagem de Cristo em sua pureza impecável (Rm 8.29). Esta escolha divina deixa claro que seremos como Ele é por ocasião de sua manifestação (1 Jo 3.2). Com base nesse fato, João deduz que todo o que tem essa esperança purifica-se a si mesmo como Ele é puro (1 Jo 3.3). O uso que João faz da palavra “todo" deixa claro que aqueles que não se purificam não verão Cristo, nem serão como Ele. Por sua falta de santidade, eles provam que não eram predestinados. Assim, o apóstolo desfere um golpe esmagador sobre o antinomianismo.11

A própria santidade de Deus requer que perseveremos. “A graça de Deus assegura nossa perseverança — mas isso não torna a perseverança menos nossa"10 11 Não podemos adquirir “o prêmio da soberana vocação de Deus em Cristo Jesus” se não prosseguimos “para o alvo” (Fp 3.14). Mas, enquanto desenvolvemos nossa “salvação com temor e tremor” (Fp 2.12), descobrimos que “Deus é quem efetua em... [nós] tanto o querer como o realizar, segundo a sua boa vontade” (v. 13).

O resultado da sua fé

Talvez nenhum apóstolo tenha compreendido melhor do que Pedro o poder de Deus em guardar a vida de um crente in- consistente. Deus O preservara e O fizera amadurecer por meio de diversos erros e fracassos, incluindo pecado sério e transigência — e repetidas negações do Senhor, acompanhadas de imprecação e juramento (Mt 26.69- 75). No entanto, apesar de suas falhas, Pedro foi guardado em fé pelo poder de Deus. Portanto, era apropriado que ele fosse o instrumento que o Espírito Santo usaria para escrever esta gloriosa promessa:

Bendito o Deus e Pai de nosso Senhor Jesus Cristo, que, segundo a sua muita misericórdia, nos regenerou para uma viva esperança, mediante a ressurreição de Jesus Cristo dentre os mortos, para uma herança incorruptível, sem mácula, imarcescível, reservada nos céus para vós outros que sois guardados pelo poder de Deus, mediante a fé, para a salvação preparada para revelar-se no último tempo. Nisso exultais, embora, no presente, por breve tempo, se necessário, sejais contristados por várias provações, para que, uma vez confirmado o valor da vossa fé, muito mais preciosa do que o ouro perecível, mesmo apurado por fogo, redunde em louvor, glória e honra na revelação de Jesus Cristo; a quem, não havendo visto, amais; no qual, não vendo agora, mas crendo, exultais com alegria indizível e cheia de glória, obtendo o fim da vossa fé: a salvação da vossa alma.

1 Pedro 1.3-9

Pedro estava escrevendo para crentes que haviam sido dispersos e viviam na Ásia Menor. Enfrentavam uma horrível perseguição que começara em Roma e estava se expandindo pelo império romano. Após o incêndio em Roma, Nero culpou os cristãos pelo desastre. De repente, os crentes tornaram-se em toda parte alvos de tremenda perseguição. Essas pessoas temiam por sua vida e temiam o fracasso, caso sua fé fosse colocada à prova.

Pedro escreveu esta epístola para encorajá-los. Lembrou-lhes que todos eram estrangeiros neste mundo, cidadãos do céu, uma aristocracia real, filhos de Deus, habitantes de um reino sobrenatural, pedras vivas, sacerdócio santo e povo de propriedade exclusiva de Deus. Disse-lhes que não deveriam ter medo de ameaças, não deveriam ficar intimidados nem preocupados com a animosidade do mundo e não deveriam ter medo quando sofressem.

Por quê? Porque os cristãos são “guardados pelo poder de Deus, mediante a fé”. Em vez de prover-lhes doses de compaixão e comiseração, Pedro os direcionou à sua segurança absoluta como cristãos. Ele sabia que os cristãos talvez estivessem perdendo todos os seus bens terrenos e até sua vida, mas desejava que soubessem que nunca perderiam o que possuíam em Cristo. Sua herança celestial estava garantida. Estavam sendo guardados pelo poder de Deus. A sua fé suportaria tudo. Eles perseverariam em suas provações e, no fim, seriam achados dignos. Seu amor por Cristo permaneceria intacto. Mesmo em meio de suas dificuldades do momento, Deus providenciaria a libertação espiritual de que precisavam, de acordo com o seu plano eterno. Aqueles seis meios de perseverança resumem como Deus sustenta cada cristão.

Somos regenerados para uma viva esperança.

“Deus... nos regenerou para uma viva esperança, mediante a ressurreição de Jesus Cristo dentre os mortos, para uma herança incorruptível, sem mácula, imarcescível, reservada nos céus para vós outros” (vv. 3-4). Todo cristão é regenerado para uma viva esperança — isto é, uma esperança perpetuamente viva, uma esperança que não morre. Pedro parece estar fazendo um contraste com a mera esperança humana, que é morta ou está sempre morrendo. As esperanças e os sonhos humanos fenecem inevitavelmente e, por fim, decepcionam. Foi por isso que Paulo disse aos cristãos de Co-rinto: “Se a nossa esperança em Cristo se limita apenas a esta vida, somos os mais infelizes de todos os homens” (1 Co 15.19). Essa viva esperança em Cristo não morre. Deus garante que ela chegará a uma gloriosa realização eterna, completa e total. “A qual [a segurança] temos por âncora da alma, segura e firme” (Hb 6.19).

Isso tem implicações claras que vão além do conceito antinomia-no de segurança eterna. Mais uma vez, a questão não é apenas que os cristãos são salvos para sempre e estão livres do inferno “aconteça o que acontecer”. O significado vai além disso: nossa esperança não morre. Nossa fé não fracassará. Isso é o âmago da doutrina da perseverança.

Mas essa passagem também ensina a segurança eterna. É-nos garantida “uma herança incorruptível, sem mácula, imarcescível, reservada nos céus” (v. 4). Diferentemente de qualquer coisa que há nesta vida e pode corromper-se, enfraquecer, envelhecer, enferrujar, ser roubada ou perder seu valor, a nossa herança celeste está reservada para nós onde permanece incorruptível, sem mácula e imarcescível. Toda a nossa herança será, um dia, o clímax de nossa esperança viva. Ela está “reservada nos céus” — “não como um reserva de hotel, que pode ser cancelada inesperadamente, e sim como algo que é permanente e inalterável”.12

Você percebeu que já recebemos parte dessa herança? Efésios 1.13-14 diz: “Tendo nele também crido, fostes selados com o Santo Espírito da promessa; o qual é o penhor da nossa herança, até ao resgate da sua propriedade, em louvor da sua glória” (cf. 2 Co 1.22; 5.5). “Penhor”, no versículo 14, é tradução da palavra grega arrabon, que significa um “pagamento inicial (entrada)”. Quando uma pessoa crê pela primeira vez, o próprio Espírito Santo vem habitar no coração dela. Ele é a caução de nossa salvação eterna, é um adiantamento da herança dos cristãos, é a garantia de que Deus terminará a obra que começou. “E não entristeçais o Espírito de Deus, no qual fostes selados para o dia da redenção” (Ef 4.30, ênfase acrescentada).

Somos guardados pelo próprio poder de Deus.

“SOÍS guardados pelo poder de Deus, mediante a fé, para a salvação preparada para revelar-se no último tempo” (V. 5). Essa é uma declaração rica, garantindo a consumação da salvação eterna de todo crente. A oração

“a salvação preparada para revelar-se no último tempo” fala de nossa salvação plena e final — O livramento da maldição da lei, do poder e da presença do pecado, de toda corrupção, mácula de iniqüidade, tentação, aflição, dor, morte, punição, JUÍZO e de toda ira. Deus já iniciou essa obra em nós e a completará (cf. Fp 1.6).

Examinando cuidadosamente a frase, observamos esta oração: “Sois guardados pelo poder de Deus, mediante a fé”. Somos guardados pelo poder de um Deus supremo, onipotente, soberano, onisciente, poderoso. O tempo verbal se refere a uma ação contínua. Agora mesmo estamos sendo guardados. “Nem a morte, nem a vida, nem OS anjos, nem OS principados, nem as coisas do presente, nem do porvir, nem OS poderes, nem a altura, nem a profundidade, nem qualquer outra criatura poderá separar-nos do amor de Deus, que está em Cristo Jesus, nosso Senhor” (Rm 8.38-39). “Se Deus é por nós, quem será contra nós?” (Rm 8.31). “[Ele] é poderoso para vos guardar de tropeços e para vos apresentar com exultação, imaculados diante da sua glória” (Jd 24).

Além disso, somos guardados “mediante a fé”. Nossa fé incessante em Cristo é O instrumento da obra sustentadora de Deus. Ele não nos salvou sem fé e não nos mantém sem fé. A nossa fé é dom de Deus, e, mediante seu poder de guardar, Ele a preserva e nutre. A manutenção de nossa fé é obra dele, assim como todos OS outros aspectos da salvação. A nossa fé é estimulada, direcionada, mantida e fortalecida pela graça de Deus.

NO entanto, afirmar que a fé é um dom gracioso de Deus, a qual Ele sustenta, não implica que ela age sem a vontade humana. Ela é a nossa fé. NÓS cremos. Permanecemos firmes. Não somos passivos no processo. OS meios pelos quais Deus mantém nossa fé envolvem nossa participação completa. Não perseveramos sem fé, apenas mediante a fé.

Somos fortalecidos pela provação de nossa fé.

“Nisso exultais, embora, no presente, por breve tempo, se necessário, sejais contristados por várias provações, para que, uma vez confirmado o valor da vossa fé, muito mais preciosa do que o ouro perecível, mesmo apurado por fogo, redunde em louvor, glória e honra na revelação de Jesus Cristo” (1 Pe 1.6-7). Nestes versículos, descobrimos o principal meio pelo qual Deus mantém a nossa fé: Ele a submete a provações. A palavra “exultais” pode surpreender o leitor desatento. Lembre que as pessoas que receberam essa epístola enfrentavam perseguições que ameaçavam sua vida. Elas sentiam medo do futuro. Entretanto, Pedro disse: “Exultais”. Como elas poderiam exultar?

AS provações produzem alegria porque fortalecem a nossa fé. Tiago disse exatamente a mesma coisa: “Meus irmãos, tende por motivo de toda alegria o passardes por várias provações, sabendo que a provação da vossa fé, uma vez confirmada, produz perseverança” (Tg 1.2-3). Tribulações (a mesma palavra em grego) e provações não enfraquecem ou abalam a fé genuína — é exatamente o contrário. Elas a fortalecem. Pessoas que perdem sua fé diante de uma provação apenas mostram que nunca tiveram uma fé verdadeira. A fé genuína sai das provações mais forte do que antes.

Em si mesmas, as provações não são alegres. Pedro reconheceu isso, pois disse: “Embora, no presente, por breve tempo, se necessário, sejais contristados por várias provações” (v. 6). Elas vêm como fogo para remover do metal a escória. Mas isso não é a ênfase de Pedro nesta passagem. A fé que sai dessas situações é muito mais gloriosa. Quando O fogo termina sua obra, O que fica é uma fé mais pura, mais brilhante e mais forte.

Por causa de quem Deus prova a nossa fé? Por causa dEle mesmo? Ele está querendo descobrir se a nossa fé é real? É claro que não. Deus já sabe disso. Ele nos prova tendo em vista o nosso próprio benefício, para que saibamos se a nossa fé é genuína. Ele prova a nossa fé para refiná-la, fortalecê-la, desenvolvê-la. O que sai do cadinho é mais precioso “do que o ouro” (v. 7). Diferentemente do ouro, a fé provada tem valor eterno. O ouro pode sobreviver ao fogo do refina-dor, mas não passa no teste da eternidade.

Pedro não estava dizendo a esses cristãos coisas triviais. Ele mesmo provara a alegria resultante de uma provação de perseguição. Atos 5.41 diz que os apóstolos “se retiraram do Sinédrio regozijando-se por terem sido considerados dignos de sofrer afrontas por esse Nome” (ênfase acrescentada). Devo acrescentar que eles devem ter seguido seu caminho com uma fé mais forte? Haviam sofrido, mas sua fé passou no teste. A grande confiança do crente é saber que sua fé é genuína. Assim, as provações produzem aquela fé madura pela qual Deus nos preserva.

Somos preservados por Deus para a glória final.

“O valor da vossa fé... redunde em louvor, glória e honra na revelação de Jesus Cristo” (v. 7). Isso é uma promessa surpreendente. O resultado final de nossa fé provada será louvor, glória e honra na manifestação de Cristo. A direção deste louvor é de Deus para o crente, não vice-versa! Pedro não está falando de nossa atitude de louvar, glorificar e honrar a Deus, e sim da aprovação dEle dirigida a nós.

1 Pedro 2.20 diz: “Se, entretanto, quando praticais o bem, sois igualmente afligidos e o suportais com paciência, isto é grato a Deus”. De modo semelhante ao que disse o senhor do servo fiel, Deus nos dirá: “Muito bem, servo bom e fiel... entra no gozo do teu senhor”

(Mt 25.21, 23). Romanos 2.29 afirma; “Porém judeu é aquele que O é interiormente, e circuncisão, a que é do coração, no espirito, não segundo a letra, e cujo louvor não procede dos homens, mas de Deus” (ênfase acrescentada). A fé verdadeira, testada e provada, recebe louvor de Deus.

Observe 1 Pedro 1.13, que diz; “Por isso, cingindo o vosso entendimento, sede sóbrios e esperai inteiramente na graça que vos está sendo trazida na revelação de Jesus Cristo”. O que é graça? “Louvor, glória e honra.” Em 1 Pedro 4.13, o apóstolo disse; “Alegrai-vos na medida em que sois coparticipantes dos sofrimentos de Cristo, para que também, na revelação de sua glória, vos alegreis exultando”. Paulo disse; “Porque para mim tenho por certo que os sofrimentos do tempo presente não podem ser comparados com a glória a ser revelada em nós” (Rm 8.18).

Algumas pessoas entendem de modo errado 1 Pedro 1.7, pensando que ele está dizendo que, para ser encontrada genuina, a nossa fé tem de esperar a segunda vinda de Cristo. “Para que, uma vez confirmado o valor da vossa fé, muito mais preciosa do que o ouro perecível, mesmo apurado por fogo, redunde em louvor, glória e honra na revelação de Jesus Cristo” — como se o resultado fosse incerto até àquele dia. Mas, na verdade, o versículo diz que a nossa fé, já provada, que comprovou ser genuína, está aguardando sua recompensa eterna. Não há insegurança nisso. De fato, o oposto é verdade. Podemos estar certos do resultado final, porque o próprio Deus está nos preservando mediante a fé até àquele dia.

Somos motivados por amor ao Salvador.

“A quem, não havendo visto, amais; no qual, não vendo agora, mas crendo, exultais com alegria indizivel e cheia de glória” (v. 8). Essa é uma declaração profunda sobre o caráter da fé genuína. Sem nenhuma ambigüidade, estou convicto de que os dois fatores principais do lado humano que garantem nossa perseverança são O amor ao Salvador e a confiança nEle. Pedro sabia disso melhor do que ninguém.

Depois de haver negado a Cristo, Pedro teve de encarar a Jesus Cristo e ser questionado a respeito de seu amor. Jesus lhe perguntou três vezes: “Tu me amas?”; e Pedro entristeceu-se (Jo 21.17). É claro que ele amava a Cristo. Por isso, retornou a Cristo e foi restaurado. A própria fé de Pedro foi purificada por essa provação. Vejo em 1 Pedro uma bela humildade. Pedro elogia esses crentes sofredores e lhes diz: “A quem, não havendo visto, amais; no qual, não vendo agora, mas crendo, exultais” (v. 8). Talvez Pedro lembrou que em sua negação de Cristo, estava tão perto do Senhor que seus olhares puderam encontrar-se (Lc 22.60-61). Certamente, o pesar de seu próprio erro ainda era bastante real em seu coração, mesmo depois de tantos anos.

Um relacionamento normal envolve amor e confiança para com alguém que você conhece pessoalmente. Mas os cristãos amam Alguém a quem não podem ver, ouvir e tocar. É um amor sobrenatural, dado por Deus. “Nós amamos porque ele nos amou primeiro” (1 Jo 4.19).

Não existe tal coisa como um cristão que não tem esse amor. Pedro está dizendo, categoricamente, que amar a Jesus Cristo é a essência do que significa ser um cristão. De fato, não deve haver um modo melhor de descrever a expressão essencial da nova natureza do que dizer que ela é amor contínuo por Cristo. A versão King James, em inglês, traduz assim 1 Pedro 2.7: “Portanto, para vocês, que crêem, ele é precioso”. Observe o que Paulo disse no último versículo de Efésios: “A graça seja com todos os que amam sinceramente a nosso Senhor Jesus Cristo” (6.24). Em Romanos 8.28, uma das passagens mais conhecidas de toda a Escritura, Paulo se refere aos crentes como aqueles “que amam a Deus”. Contudo, ele faz sua declaração mais forte sobre este assunto em 1 Coríntios 16.22: “Se alguém não ama o Senhor, seja anátema”.

A teologia do não-senhorio ignora essa verdade vital. Conseqüentemente, muitas pessoas que não têm qualquer amor pelo Senhor Jesus Cristo recebem uma esperança falsa a respeito do céu. OS verdadeiros cristãos amam a Cristo. Seu amor por nós, produzindo nosso amor por Ele (1 JO 4.19), é uma das garantias de que perseveraremos até ao fim (Rm 8.33-39). Jesus disse: “Se me amais, guardareis os meus mandamentos” (Jo 14.15). “Aquele que tem os meus mandamentos e os guarda, esse é o que me ama” (v. 21). De modo inverso: “Quem não me ama não guarda as minhas palavras” (v. 24).

Aqueles que são dedicados a Cristo anseiam promover a sua glória. Anseiam servi-lo de coração, alma, mente e forças. Eles se deleitam na beleza de Cristo. Amam falar sobre Ele, ler sobre Ele, ter comunhão com Ele. Desejam conhecê-lo mais profundamente. Em seu coração, são compelidos a desejarem ser como Cristo. À semelhança de Pedro, eles podem tropeçar freqüentemente e falhar de maneiras patéticas, quando a carne pecaminosa ataca o anseio santo. Mas, assim como Pedro, todos os crentes verdadeiros perse-verarão até que o alvo seja finalmente alcançado.13 “Amados, agora, somos filhos de Deus, e ainda não se manifestou o que haveremos de ser. Sabemos que, quando ele se manifestar, seremos semelhantes a ele, porque haveremos de vê-lo como ele é” (1 Jo 3.2).

Robert Leighton, escrevendo em 1853 um maravilhoso comentário sobre 1 Pedro, disse:

Creia e você amará; creia muito e você amará muito. Labute por persuasões fortes e profundas acerca das coisas gloriosas que são ditas a respeito de Cristo; e isso exigirá amor. Se os homens cressem verdadeiramente no valor de Cristo, eles o amariam adequadamente, pois a criatura racional não deixa de achar mais prazer do que naquilo que ela crê, firmemente, ser mais digno de afeição. Oh! É essa descrença perniciosa que torna o coração frio e morto para com Deus. Então, busque erer na excelência de Cristo em si mesmo, em seu amor por nós e em nosso interesse nele. Isso incitará tal fervor no coração que o fará elevar-se em sacrifício de amor por ele.14

Portanto, nosso amor por Cristo é outro meio que Deus usa para assegurar a perseverança. Este amor e a fé que o acompanha são a fonte de alegria indizível e cheia de glória (1 Pe 1.8).

Somos salvos mediante uma fé operante.

“Obtendo o fim da vossa fé: a salvação da vossa alma” (1.9). Neste versículo, Pedro está falando de um livramento presente. O tempo verbal dessa passagem está no presente e transmite a idéia de um agente que, ao mesmo tempo, é o objeto da ação. A palavra “obtendo” poderia ser literalmente traduzida como “recebendo agora para vós mesmos”. Esta salvação presente é “o fim” de nossa fé — uma fé operante. Em termos práticos, isso significa uma libertação atual do pecado, culpa, condenação, ira, ignorância, aflição, confusão, desespero — tudo que corrompe. Isso não se refere à perfeita consumação da salvação que Pedro mencionou no versículo 5.

A salvação contemplada no versículo 9 é uma salvação contínua, presente. O pecado não tem mais domínio sobre nós (Rm 6.14). Não podemos deixar de perseverar. Certamente, vacilaremos às vezes. Nem sempre seremos bem-sucedidos. De fato, algumas pessoas talvez pareçam experimentar mais fracasso do que sucesso. Entretanto, nenhum crente verdadeiro cai em descrença ou reprovação permanentes. Tolerar essa possibilidade é uma desastrosa falta de compreensão do poder que Deus em guardar a vida de seus eleitos.

É assim que Pedro inicia a sua primeira epístola. AO final da epístola, ele retorna mais uma vez ao tema da perseverança. Ali, ele escreve: “Ora, o Deus de toda a graça, que em Cristo vos chamou à sua eterna glória, depois de terdes sofrido por um pouco, ele mesmo vos há de aperfeiçoar, firmar, fortificar e fundamentar” (5.10).

Você compreende a magnitude dessa promessa? Deus mesmo aperfeiçoa, firma, fortifica e fundamenta seus filhos. Embora seus propósitos quanto ao futuro envolvam algum sofrimento no presente, Ele nos dará graça para suportar e perseverar. Mesmo quando estamos sendo atacados pelo inimigo, estamos sendo aperfeiçoados por Deus. Ele mesmo está fazendo isso. E cumprirá seus propósitos em nós, trazendo-nos à plenitude, colocando-nos em terreno firme, fazendo-nos fortes, estabelecendo-nos num fundamento firme. Todos esses termos falam de força, de determinação.

MURRAY, John. Redemption accomplished and applied. Grand Rapids, Mich.: Eerd-mans, 1955. p. 151-152.

HOEKEMA, Anthony A. Saved by grace. Grand Rapids, Mich.: Eerdmans, 1989. p. 234.

HODGES, Zane. The gospel under siege. Dallas: Redención Viva, 1981. p. 113.

MURRAY, John. Redemption accomplished and applied. Grand Rapids, Mich.: Eerd-mans, 1955. p. 151.

Ironicamente, Zane Hodges constrói todo o seu sistema sobre as palavras de Jesus dirigidas à mulher no poço de Jacó, registradas em João 4, mas negligencia a verdade da perseverança incluída nessa promessa.

HORNE, Charles. Salvation. Chicago: Moody, 1971. p. 95.

KENDALL, R. T. Once saved, always saved. Chicago: Moody, 1983. p. 19 (ênfase no original). Depois, Kendall ampliou: “Portanto, declaro categoricamente que a pessoa salva — que confessa ser Jesus o Senhor e crê em seu coração que Deus o ressuscitou dos mortos — irá para o céu quando morrer independentemente da obra (ou falta de obra) que acompanhe essa fé. Em outras palavras, independentemente do pecado (ou ausência de obediência cristã) que acompanhe essa fé” (ibid., p. 52-53).

Ibid. p. 22.

Ibid. p. 23. A retórica semelhante de Hodges, neste mesmo assunto, é evidentemente ofensiva: “As pessoas não são salvas por olhar para Cristo. São salvas por olhar para Ele com fé” (AF 107).

ALDERSON, Richard. No holiness, no heaven! Edinburgh: Banner of Truth, 1986. p. 88.

HORNE, Charles. Salvation. Chicago: Moody, 1971. p. 95.

HOEKEMA, Anthony A. Saved by grace. Grand Rapids, Mich.: Eerdmans, 1989. p. 244.

Isso não é sugerir que todos os crentes experimentam o mesmo grau de sucesso espiritual, mas apenas que nenhum deles se desviará de Cristo cedendo a uma descrença estável.

LEIGHTON, Robert. Commentary on First Peter. Grand Rapids, Mich.: Kregel, 1972. p. 55.

O Problema da Quantificação

Inevitavelmente, surge a pergunta: quão fielmente alguém deve perseverar? Charles Ryrie escreveu:

Então, lemos uma declaração como esta: “Um momento de falha não invalida as credenciais de um discípulo”. Minha reação imediata a essa declaração é desejar perguntar se dois momentos de falha invalidariam. Ou uma semana de apostasia, ou um mês, ou um ano. Ou dois? Quão séria deve ser uma falha e quanto tempo ela deve durar antes de concluirmos que determinada pessoa, de fato, não era salva?

A doutrina do senhorio reconhece que “ninguém obedece perfeita-mente”, mas a questão crucial é quão imperfeitamente alguém pode obedecer e, apesar disso, ter certeza de que “crê”...

...Um momento de apostasia, nos disseram, não constitui uma invalidação. Ou “o verdadeiro discípulo nunca se desviará completamente”? Ele pode-se desviar quase completamente? OU 90%? OU 50% e, assim mesmo, ter certeza de que é salvo?...

Francamente, toda essa relatividade me deixaria em confusão e incerteza. Toda apostasia, especialmente se continuada, me deixaria inseguro quanto à minha salvação. Qualquer pecado sério ou relutância implicariam o mesmo. Se chego a uma bifurcação na estrada de minha experiência cristã, e escolho o caminho errado, e continuo nele, isso significa que eu nunca estive na estrada do cristianismo? Por quanto tempo posso ser infrutífero sem que um advogado da teologia do senhorio conclua que eu nunca fui verdadeiramente salvo? (SGS 48-49, ênfase acrescentada).

Ryrie sugere que, se não podemos declarar precisamente quantas falhas são possíveis a um cristão, a verdadeira segurança se torna impossível. Ele quer que os termos sejam quantificados: “Ele pode-se desviar quase completamente? Ou 90%? Ou 50%?” Em outras palavras, Ryrie está sugerindo que as doutrinas da perseverança e da segurança são incompatíveis. Surpreendentemente, ele deseja uma doutrina da segurança que permita aos que apostataram de Cristo sejam confiantes de sua salvação.

Não há respostas quantificáveis para as perguntas que Ryrie levanta. De fato, alguns cristãos persistem no pecado por períodos extensos. Mas aqueles que fazem isso perdem seu direito à segurança genuína. “Pecado sério ou relutância” deveriam, certamente, fazer alguém considerar com atenção se realmente ama o Senhor. Aqueles que se desviam completamente (não quase completamente, ou 90 %, ou 50%) demonstram que nunca tiveram fé verdadeira.

Quantificações também propõe um dilema para a teologia do não-senhorio. Zane Hodges fala sobre a fé como um “momento histórico”. Quão breve ele pode ser? Alguém que ouve um debate entre um cristão e um ateu pode crer por um instante, enquanto o cristão está falando, mas voltar imediatamente à dúvida ou ao gnosticismo, por causa dos argumentos do ateu. Essa pessoa poderia ser classificada como crente? Poderíamos suspeitar que alguns advogados da teologia do não-senhorio responderiam sim, embora essa visão seja contrária a tudo que a Palavra de Deus ensina sobre fé.

Jesus nunca quantificou os termos de suas exigências, Ele sempre as tornou absolutas. “Assim, pois, todo aquele que dentre vós não renuncia a tudo quanto tem não pode ser meu discípulo” (Lc 14.33); “Quem ama seu pai ou sua mãe mais do que a mim não é digno de mim; quem ama seu filho ou sua filha mais do que a mim não é digno de mim” (Mt 10.37); “Quem ama a sua vida perde-a; mas aquele que odeia a sua vida neste mundo preservá-la-á para a vida eterna” (Jo 12.25). Essas condições são impossíveis em termos humanos (Mt 19.26).1 Isso não altera nem abranda a verdade do evangelho; e, certamente, não é uma desculpa para irmos ao outro extremo, deixando de lado qualquer necessidade de compromisso com Cristo.

Os comentários de Ryrie levantam outra questão digna de consideração. É o fato de que a doutrina do senhorio é inerentemente inclinado a julgar: “Por quanto tempo posso ser infrutífero sem que um advogado da teologia do senhorio conclua que eu nunca fui verdadeiramente salvo?” Zane Hodges fez comentários semelhantes: “A doutrina da salvação por senhorio reserva para si mesma o direito de retirar dos cristãos professos as suas reivindicações de fé e de consigná-los à classe dos perdidos” (AF 19).

Certamente, nenhuma pessoa pode julgar o coração de outra. Uma coisa é exortar as pessoas a examinarem a si mesmas (2 Co 13.5); outra coisa totalmente diferente é exaltar-se como um juiz cristão (Rm 14.4, 3; Tg 4.11).

No entanto, embora os cristãos nunca devam julgar, o corpo da igreja como um todo tem a responsabilidade de manter pureza ao expor e excluir aqueles que vivem em pecado contínuo OU apostatam da fé. Nosso Senhor deu instruções explícitas a respeito de como lidar com um crente que cai nesse tipo de pecado. Primeiramente, devemos procurar o irmão (ou a irmã} em particular (Mt 18.15). Se ele (ou ela) se recusar a ouvir, devemos comunicar à igreja (v. 17). Se aquele que está em pecado não se arrepende após essa comunicação, devemos considerá-lo “gentio e publicano” (v. 17). Em outras palavras, buscar aquela pessoa para Cristo, de modo evangelístico, como se ela não fosse salva.

Esse processo de disciplina é meio pelo qual Cristo exerce medianeiramente seu governo na igreja. Ele continuou dizendo: “Em verdade vos digo que tudo o que ligardes na terra terá sido ligado nos céus, e tudo o que desligardes na terra terá sido desligado nos céus. Em verdade também vos digo que, se dois dentre vós, sobre a terra, concordarem a respeito de qualquer coisa que, porventura, pedirem, ser-lhes-á concedida por meu Pai, que está nos céus” (Mt 18.18-19). O contexto mostra que isso não está se referindo a “amarrar Satanás” ou à oração em geral. Nosso Senhor estava lidando com a questão do pecado e do perdão entre os cristãos (v. 21). Os tempos verbais no versículo 18 significam, literalmente, “tudo o que ligais na terra terá sido ligado nos céus; e tudo o que desligais na terra terá sido desligado nos céus”. Nosso Senhor está dizendo que Ele mesmo age, de modo pessoal, no processo de disciplina: “Porque, onde estiverem dois ou três reunidos em meu nome, ali estou no meio deles” (v. 20).

Assim, o processo de disciplina eclesiástica, seguido adequadamente, responde todas as perguntas do Dr. Ryrie. Por quanto tempo uma pessoa pode continuar em pecado, antes de concluirmos que, na verdade, ela nunca foi salva? Durante o tempo do processo de disciplina. Tendo sido revelado o caso à igreja, se a pessoa ainda se recusa a arrepender-se, temos instruções do próprio Senhor para considerarmos “como gentio e publicano” aquele que está em pecado.

O processo de disciplina por parte da igreja que O Senhor esboçou em Mateus 18 é afirmado na doutrina da perseverança. Aqueles que continuam apegados ao pecado apenas demonstram sua falta de fé verdadeira. Aqueles que correspondem à repreensão e retornam ao Senhor evidenciam da melhor maneira possível que sua salvação é genuína. Podem estar certos de que, se a sua fé é verdadeira, ela resistirá até ao fim — porque o próprio Deus garante isso.

“Estou plenamente certo de que aquele que começou boa obra em vós há de completá-la até ao Dia de Cristo Jesus” (Fp 1.6). “Sei em quem tenho crido e estou certo de que ele é poderoso para guardar o meu depósito até aquele Dia” (2 Tm 1.12).

Capítulo 12

Mesmo aqueles que desejam aplicar essas declarações de Cristo a um passo posterior à conversão não resolvem o dilema do caráter absoluto delas.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A aula mostra que Pedro falhou miseravelmente mas a sua fé nunca foi destruída, porque Cristo intercedeu por ele; quando você tropeça, a sua fé volta a Cristo e persevera, ou você teme que um momento de fracasso prove que ela nunca foi real?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor ensina que a perseverança não promete uma vida sempre bem-sucedida, mas garante que o crente verdadeiro jamais cairá em descrença permanente; observando os seus altos e baixos, o que tem sustentado a continuidade da sua fé ao longo do tempo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ele afirma que amar a Cristo a quem não vemos é a essência de ser cristão e uma das garantias de que perseveraremos; ao examinar o seu coração, existe ali um amor vivo por Jesus, ou apenas o desejo de escapar do inferno?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Para Ser Salvo?$t$, 12,
$conteudo$Se alguém sugerisse que chegaria um tempo quando um grupo de cristãos evangélicos defenderia uma salvação sem arrependimento, sem mudança de comportamento ou de estilo de vida, sem uma confissão genuína do senhorio e da autoridade de Cristo, sem perseverança, sem discipulado e uma salvação que não resulta necessariamente em obediência e obras, na qual a regeneração não muda necessariamente a vida de alguém, a maioria dos crentes de décadas passadas teria achado que tal sugestão seria uma impossibilidade total. Mas acredite ou não, o tempo chegou.

RICHARD P. BELCHER1

O que é O evangelho? Aqui chegamos a um ponto prático. A pergunta que estamos fazendo é: como eu devo evangelizar meus amigos, minha família e meus vizinhos? Para os pais, uma pergunta ainda mais importante é: como devo apresentar O evangelho aos meus filhos?

O cristianismo do século XX se mostrou propenso a adotar uma abordagem minimalista do evangelho. Infelizmente, O desejo legítimo de expressar o âmago do evangelho tem dado lugar a um esforço menos proveitoso. É uma campanha para destilar as partes essenciais da mensagem para comunicá-la nos termos mais simples possíveis. O glorioso evangelho de Cristo — que Paulo chamou de “poder de Deus para a salvação de todo aquele que crê” (Rm 1.16) — inclui toda a verdade sobre Cristo. Mas o evangelicalismo de nossos dias tende a se referir ao evangelho como um “plano de salvação”. Temos reduzido a mensagem a uma lista de fatos declarados no menor número possível de palavras — que diminui o tempo todo. Você provavelmente já viu esses “planos de salvação” a serem apresentados: “Seis Passos para a Paz com Deus”, “Cinco Coisas que Deus Quer que Você Saiba”, “Quatro Leis Espirituais”, “Três Verdades sem as quais Você Não Pode Viver”; “Duas Questões que Você Deve Resolver” ou “Um Caminho para o Céu”.

Hoje, os cristãos têm a cautela de não falar demais aos perdidos. Certas questões espirituais são rotuladas como tabu, quando conversam com os não-convertidos: a lei de Deus, o senhorio de Cristo, o abandono do pecado, rendição, obediência, juízo e inferno. Essas coisas não devem ser mencionadas, para “não fazermos acréscimos à oferta do dom gratuito de Deus”. Proponentes da evangelização da teologia do não-senhorio levam a tendência reducionista ao extremo. Aplicando de maneira errada a doutrina reformada sola fide (“pela fé somente”), eles fazem da fé o único tópico admissível quando falam a não-cristãos sobre seu dever diante de Deus. Então, apresentam a fé como algo totalmente inexpressivo, ao despojá-la de tudo, exceto de seus aspectos nocionais.

Alguns acreditam que isso preserva a pureza do evangelho.

O que isso realmente tem feito é enfraquecer a mensagem de salvação. Também tem enchido a igreja de “convertidos” cuja fé é falsa e cuja esperança prende-se a uma promessa adulterada. Dizendo que “aceitaram a Cristo como Salvador”, eles rejeitam descarada-mente a justa reivindicação dEle como Senhor. Prestando-lhe um culto lisonjeiro, mas superficial, com seu coração eles desdenham o Senhor (Mc 7.6). Afirmando-o casualmente com sua boca, eles o negam, de modo deliberado, com suas ações (Tt 1.16). Dirigindo-se a Ele, superficialmente, como “Senhor, Senhor”, eles se recusam obstinadamente a cumprir suas ordens (Lc 6.46). Tais pessoas se encaixam na trágica descrição dos “muitos” que, conforme Mateus 7, um dia ficarão desconcertados ao ouvir o Senhor dizer: “Nunca vos conheci. Apartai-vos de mim, os que praticais a iniqüidade” (ênfase acrescentada).

O evangelho não é, primeiramente, notícias sobre um “plano”, e sim um chamado a confiar numa Pessoa. Não é uma fórmula que deve ser prescrita a pecadores numa série de passos. O evangelho não requer uma mera decisão mental, e sim uma rendição do coração, da mente e da vontade — de toda a pessoa — a Cristo. Não é uma mensagem que pode ser condensada, encapsulada, embalada e depois oferecida como um remédio genérico para cada tipo de pecador. Pecadores ignorantes precisam ser instruídos sobre o caráter de Deus e por que Ele tem o direito de exigir-lhes obediência. Pecadores justos aos seus próprios olhos precisam ter seu pecado exposto pelas exigências da lei de Deus. Pecadores negligentes precisam ser confrontados com a realidade do iminente juízo de Deus. Pecadores temerosos precisam ouvir que Deus, em sua misericórdia, providenciou um meio de livramento. Todos os pecadores devem entender como Deus é completamente santo. Devem compreender as verdades básicas da morte sacrificial de Cristo e o triunfo de sua ressurreição. Precisam sem confrontados com a exigência de Deus de que devem se afastar de seu pecado e seguir a Cristo como Senhor e Salvador.

A forma da mensagem será variada em cada caso. Mas o conteúdo deve sempre deixar bem clara a realidade da santidade de Deus e da incapacidade do pecador. Depois, a mensagem direciona os pecadores a Cristo como um Senhor soberano, porém misericordioso, que comprou a expiação plena para todos que se voltam para Ele em fé.

O evangelicalismo do século XX parece obcecado pela idéia de que nunca se deve dizer a pessoas não-salvas que elas precisam fazer algo mais, além de apenas crer. Lewis Sperry Chafer, por exemplo, sugeriu que “em toda pregação do evangelho toda referência à vida a ser mantida depois da regeneração deve ser evitada enquanto for possível”.2 Ele alegou que dizer aos pecadores que eles devem “arrepender-se e crer”, “crer e confessar a Cristo”, “crer e ser batizado”, “crer e render-se a Deus” ou “crer e confessar o pecado” é uma evangelização errada.3 Contudo, as Escrituras empregam todas essas expressões! O próprio Jesus pregou: “Arrependei-vos e crede no evangelho” (Mc 1.15). Paulo escreveu: “Se, com a tua boca, confessares Jesus como Senhor e, em teu coração, creres que Deus o ressuscitou dentre os mortos, serás salvo” (Rm 10.9). NO dia de Pentecostes, Pedro pregou: “Arrependei-vos, e cada um de vós seja batizado em nome de Jesus Cristo para remissão dos vossos pecados, e recebereis o dom do Espírito Santo” (At 2.38). João escreveu: “O que, todavia, se mantém rebelde contra o Filho não verá a vida, mas sobre ele permanece a ira de Deus” (Jo 3.36). O autor da Epístola aos Hebreus disse que Cristo “tornouse o Autor da salvação eterna para todos os que lhe obedecem” (Hb 5.9). Tiago escreveu: “Sujeitai-vos, portanto, a Deus; mas resisti ao diabo, e ele fugirá de vós. Chegai-vos a Deus, e ele se chegará a vós outros. Purificai as mãos, pecadores; e vós que sois de ânimo dobre, limpai o coração” (Tg 4.7-8, ênfase acrescentada). A um homem que lhe perguntou como poderia obter a vida eterna Jesus respondeu pregando a lei e o senhorio (Mt 19.16- 22).

Devemos acreditar que as Escrituras inspiradas são uma teologia escrita pobremente?

Concordo que a terminologia é importante; e não ousamos confundir a mensagem do evangelho ou acrescentar qualquer coi- sa aos termos bíblicos da salvação. Mas deve ser óbvio que Jesus e os apóstolos não se preocuparam exageradamente com a fraseologia dos convites evangelísticos, como o fazem muitos cristãos contemporâneos. Tampouco evitavam mencionar a lei de Deus. Pelo contrário, eles começavam pela lei (cf. Rm 1.16-3.20). A lei revela nosso pecado (Rm 3.20) e serve de aio para nos conduzir a Cristo (Gl 3.24). É o meio que Deus usa para fazer com que os pecadores vejam sua própria incapacidade. Evidentemente, Paulo viu que a lei tinha um papel importante em contextos evangelísticos. Contudo, hoje muitos acreditam que a lei, em suas inflexíveis exigências por santidade e obediência, é contrária e incompatível com o evangelho.

Por que devemos fazer tais distinções se a Escritura não as faz? Se as Escrituras advertissem contra pregarmos arrependimento, obediência, justiça ou juízo para os incrédulos, isso seria uma coisa. Mas a Escritura não contém tal advertência. O oposto é a verdade. Se desejamos seguir um modelo bíblico, não podemos ignorar essas questões. “Pecado, justiça e juízo” são as verdades exatas das quais o Espírito Santo convence os não-salvos (Jo 16.8). Podemos omitir essas verdades da mensagem e, ainda assim, chamá-la de evangelho? A evangelização apostólica culminava inevitavelmente num chamado ao arrependimento (At 2.38; 3.19; 17.30; 26.20). Podemos dizer aos pecadores que eles não têm de abandonar seus pecados e chamar isso de pregação do evangelho? Paulo ministrou aos incrédulos anunciando-lhes “que se arrependessem e se convertessem a Deus, praticando obras dignas de arrependimento”

(At 26.20). Podemos reduzir a mensagem a apenas “aceite a Cristo” e acreditar que estamos pregando biblicamente?

Além disso, em todas as ocasiões em que Jesus e os apóstolos evangelizaram —ministrando a uma pessoa em particular ou a multidões — não há dois incidentes em que apresentaram a mensagem com a mesma terminologia. Eles sabiam que a salvação é uma obra soberana de Deus. O papel deles era pregar a verdade; o próprio Deus a aplicaria individualmente ao coração de seus eleitos.

O novo nascimento é uma obra soberana do Espirito Santo. “O que é nascido da carne é carne; e o que é nascido do Espirito é espirito” (Jo 3.6). O Espirito escolhe soberanamente onde, como e em quem agirá: “O vento sopra onde quer, ouves a sua voz, mas não sabes donde vem, nem para onde vai; assim é todo o que é nascido do Espirito” (Jo 3.8).

A proclamação clara da verdade — e não a metodologia engenhosa ou o encanto humano (1 Co 1.21; 2.1-5) — é o meio pelo qual o Espirito age.

O decisionismo e a crença fácil

Dois enganos — decisionismo e crença fácil — estragam muito do que é chamado de evangelização no cristianismo contemporâneo. Decisionismo é a idéia de que a salvação eterna pode ser assegurada pelo mover-se do próprio pecador em direção a Cristo. Comumen-te, a “decisão por Cristo” é representada por um ato físico ou verbal — erguer a mão, ir à frente, repetir uma oração, assinar um cartão, recitar um compromisso ou algo parecido. Se o pecador faz a atividade prescrita, ele é geralmente declarado salvo e orientado a alegar que está seguro. O “momento da decisão” torna-se o fundamento da segurança da pessoa.

O decisionismo é, freqüentemente, empregado na evange-lização de crianças. Em grandes grupos, pede-se às crianças que ergam a mão, levantem-se, venham à frente, peçam a Jesus que entre em seu coração ou façam um gesto semelhante. Essas coisas devem indicar uma resposta positiva ao evangelho. No entanto, visto que as crianças são tão suscetiveis a sugestões, tão sensiveis à pressão dos colegas e desejam tanto ganhar a aprovação de seus lideres, é muito fácil conseguir que grandes grupos de crianças professem fé em Cristo usando esses meios, embora elas estejam completamente alheias à mensagem. Infelizmente, muitas pes- soas passam a vida toda sem qualquer interesse por Cristo, mas crendo que são cristãos somente porque, na infância, fizeram uma “decisão”. Sua esperança do céu apega-se apenas à memória daquele acontecimento. Temo que, em muitos casos, esta seja uma esperança vã e condenatória.

Eis uma técnica conhecida para aconselhar pessoas inseguras de sua salvação: “Faça uma decisão por Cristo agora, observe a data, depois finque uma estaca no quintal e escreva a data na estaca. Sempre que você duvidar de sua salvação, saia e olhe para a estaca. Ela será um lembrete da decisão que você fez”. Ora, isso equivale a dizer às pessoas que elas devem ter fé em sua própria decisão. O Dr. Chafer chegou ao ponto de aconselhar isto a pessoas que lutavam com a falta de segurança:

A única cura para esta incerteza é anulá-la com a certeza. Essa pessoa deve confrontar sua total pecaminosidade e falta de mérito com as revelações da cruz e descobrir, como deve, que não há esperança em si mesma e apropriar-se imediatamente das provisões da graça divina para cada necessidade de uma alma amaldiçoada pelo pecado. Se for necessário, observe o dia e a hora exatos em que a decisão foi tomada e, em seguida, creia na própria decisão, de modo tão suficiente que possa agradecer a Deus por sua graça salvífica e fidelidade. E, em cada pensamento, ato e palavra, a partir desse momento, considere a decisão como final e real.4

Ironicamente, Chafer condenou, ao mesmo tempo, na evan-gelização de massa tendências que se baseavam nas mesmas pressuposições decisionistas refletidas nesse parágrafo. Em ou- tro livro, ele criticou OS evangelistas de seus dias por pedirem aos convertidos que “venham à frente”, publicamente, como uma ação visível do recebimento de Cristo. “Esses atos, quando incitados, devem ser apresentados de modo que as pessoas não os considerem como parte integrante da única condição para a salvação”.5 Ele acreditava que tais métodos poderiam levar à falsa segurança: “Se examinada cuidadosamente, a base da segurança de tais convertidos será revelada como nada além da percepção de que agiram segundo o programa prescrito para eles”.6 Esse é precisamente o problema do decisionismo. Ele oferece uma esperança falsa baseada numa premissa errada. A salvação não pode ser obtida mediante a ação de seguir qualquer atitude externa que tenha sido prescrita. “Porque pela graça sois salvos, mediante a fé; e isto não vem de VÓS; é dom de Deus; não de obras, para que ninguém se glorie” (Ef 2.8-9).

O decisionismo e a doutrina do não-senhorio nem sempre andam de mãos dadas. De fato, quase todos os defensores mais agressivos do ensino moderno do não-senhorio reconhecem o engano do decisionismo público. E afirmariam conosco que ninguém é salvo porque levanta a mão, vai à frente, faz uma oração ou qualquer outro ato físico.

Todavia, a maioria deles acredita que a fé salvífica depende da iniciativa humana. Em seu sistema, a fé começa com uma resposta humana, e não com a obra de Deus no crente. Portanto, eles são obrigados a reduzir a definição de fé para tornar a ação de crer em algo que pecadores depravados são capazes de realizar. ISSO é crença fácil.

Mesmo aqueles que estão dispostos a admitir que a fé é um dom de Deus caem às vezes na chamada crença fácil. O Dr. Chafer, por exemplo, parecia confuso nesse ponto. Por um lado, ele condenava severamente aqueles que dizem aos pecadores que estes devem “crer e render-se”. Isso coloca sobre os pecadores uma exigência inadequada, ele argumentava. Se os incrédulos estão mortos em delitos e pecados, como podem render-se a Deus? “Impor uma necessidade de render a vida a Deus como uma condição acrescentada à salvação é irracional”, Chafer escreveu.7

Por outro lado, ele percebeu que, se as pessoas não-salvas estão mortas em delitos e pecados, não podem crer sem a iniciativa de Deus. Curiosamente, Chafer fez a seguinte observação no mesmo parágrafo que contém a afirmação que acabei de citar: “A fé salvifica não é propriedade de todos os homens, mas é concedida especificamente àqueles que crêem (Ef 2.8)”.8 Chafer viu corretamente que somente Deus pode produzir a fé num coração descrente. Mas, por alguma razão, ele não conseguiu aceitar a idéia de que a fé outorgada por Deus traz consigo uma atitude de rendição e abnegação. Por isso, ele definiu a fé em termos que não apresentam desafio à depravação humana.

Em sua essência, a crença fácil é uma compreensão errada da profundeza da pecaminosidade humana. Se pecadores descrentes, depravados e espiritualmente mortos são capazes de crer por iniciativa própria, então a fé deve ser algo que não implica demandas morais ou espirituais. É precisamente por isso que a teologia do não-senhorio deixa de santificar o ato de crer e torna a fé em um exercício sem implicações morais. Isso é crença fácil.

A análise racional da crença fácil é expressa mais claramente num texto que recebi de um ouvinte de uma rádio. Um pastor havia publicado num jornal uma coluna em que me criticava por minha oposição à crença fácil. Ele escreveu: “Penso que Deus pretendia que o ato da salvação fosse fácil... Deus fez com que fosse fácil para nós recebê-lo, porque sabia que, em nosso estado pecaminoso, ter um caminho fácil era a única maneira de sermos salvos”,9 10 11

Mas essa teologia é errada e antibiblica, Crer não é fácil,10 Nem mesmo é difícil,11 É impossível em termos humanos, O próprio Jesus reconheceu isso (Mt 19.26). Ninguém pode vir a Cristo, se isso não for outorgado pelo Pai (Jo 6,65), As pessoas não regeneradas não aceitam as coisas do Espirito de Deus; as coisas espirituais são tolice para elas, que não conseguem sequer começar a entendê-las e, muito menos, crer (1 Co 2,14), Apenas Deus pode abrir o coração e dar inicio à fé (cf, At 13,48; 16,14; 18,27),

A fé que Deus concede treme diante dEle (Lc 18,13), É uma fé que causa obediência de coração e torna o pecador escravo da justiça (Rm 6,17-18), É uma fé que opera mediante o amor (Gl 5,6), Não tem nada a ver com a fé estéril da crença fácil,

Como devemos chamar as pessoas à fé?

Há muitos livros úteis a respeito de como testemunhar de Cristo que oferecem instruções e conselhos práticos,12 Neste capitulo, quero me concentrar em algumas questões cruciais relacionadas ao conteúdo da mensagem que somos chamados a compartilhar com os incrédulos. Especificamente, se desejamos anunciar o evangelho da maneira mais precisa possível, que verdades temos de apresentar com clareza?

Ensine-lhes a santidade de Deus.

“O temor do Senhor é o princípio da sabedoria” (Sl 111.10; cf. Jó 28.28; Pv 1.7; 9.10; 15.33; Mq 6.9). A teologia do não-senhorio falha inteiramente na compreensão desse ponto. De fato, muito do evangelismo contemporâneo visa estimular qualquer coisa, exceto o temor de Deus. “Deus ama você e tem um plano maravilhoso para a sua vida” é a introdução típica do apelo evangelístico moderno. A teologia do não-senhorio dá um passo mais além: Deus ama você e o salvará do inferno, não importando de quem é o plano que você escolhe para a sua vida.

O remédio para esse pensamento é a verdade bíblica da santidade de Deus. Deus é completamente santo, e sua lei exige perfeita santidade. “Eu sou o Senhor, vosso Deus; portanto, vós vos con-sagrareis e sereis santos, porque eu sou santo... vós sereis santos, porque eu sou santo” (Lv 11.44-45). “Não podereis servir ao Senhor, porquanto é Deus santo, Deus zeloso, que não perdoará a vossa transgressão nem os vossos pecados” (Js 24.19). “Não há santo como o Senhor; porque não há outro além de ti; e Rocha não há, nenhuma, como o nosso Deus” (1 Sm 2.2). “Quem poderia estar perante o Senhor, este Deus santo?” (6.20).

O evangelho requer esta santidade. “Sede santos, porque eu sou santo” (1 Pe 1.16). “Segui a... santificação, sem a qual ninguém verá o Senhor” (Hb 12.14).

Porque Deus é santo, Ele odeia o pecado: “Eu sou o Senhor, teu Deus, Deus zeloso, que visito a iniqüidade dos pais nos filhos até à terceira e quarta geração daqueles que me aborrecem” (Ex 20.5).

Os pecadores não prevalecem diante dele: “Por ÍSSO, OS perversos não prevalecerão no JUÍZO, nem os pecadores, na congregação dos justos” (Sl 1.5).

Mostre-lhes o seu pecado.

Evangelho significa “boas novas”. O que verdadeiramente o torna boas novas não é somente o fato de que a entrada no céu é gratuita, mas também que o pecado foi vencido pelo Filho de Deus. É triste que tenha se tornado elegante apresentar o evangelho como algo diferente de um remédio contra o pecado. A “salvação” é oferecida como uma fuga da punição, o plano de Deus para uma vida maravilhosa, um meio de satisfação, uma resposta aos problemas da vida e uma promessa de perdão gratuito. Todas essas coisas são verdadeiras, mas são conseqüência da redenção, e não a questão principal. Quando não lidamos com o pecado, essas promessas de bênçãos divinas depreciam a mensagem.

Alguns mestres da teologia do não-senhorio chegam a dizer que o pecado não é um assunto que integra o convite do evangelho. O pecado, conforme eles crêem, é uma preocupação posterior à salvação. Outros acreditam que confrontar os incrédulos com seu pecado é opcional. Um homem responsável pela edição de um boletim da teologia do não-senhorio respondeu assim à pergunta de um leitor: “Não, não creio que, para ser salvo, alguém deve reconhecer que é pecador. A palavra chave é dever. É concebível que uma pessoa possa ignorar o fato de que é pecadora e, apesar disso, saber que está destinada ao inferno e ser salva apenas por confiar unicamente em Cristo. Algumas crianças pequenas podem ser incluídas nessa categoria”.13

Ele não tentou explicar por que pessoas sem entendimento de sua própria pecaminosidade creriam que estão se dirigindo ao inferno. Entretanto, perguntamos que tipo de salvação está disponível àqueles que nem mesmo reconhecem seu pecado. Jesus não disse: “Os sãos não precisam de médico, e sim os doentes; não vim chamar justos, e sim pecadores” (Mc 2.17)? Oferecer salvação a alguém que nem mesmo compreende a gravidade do pecado é agir como as pessoas descritas em Jeremias 6.14: “Curam superficialmente a ferida do meu povo, dizendo: Paz, paz; quando não há paz”.

O pecado torna impossível para os incrédulos a verdadeira paz. “Mas os perversos são como o mar agitado, que não se pode aquietar, cujas águas lançam de si lama e lodo. Para os perversos, diz o meu Deus, não há paz” (Is 57.20-21).

Todos pecaram:

Não há justo, nem um sequer, não há quem entenda, não há quem busque a Deus; todos se extraviaram, à uma se fizeram inúteis; não há quem faça o bem, não há nem um sequer. A garganta deles é sepulcro aberto; com a língua, urdem engano, veneno de víbora está nos seus lábios, a boca, eles a têm cheia de maldição e de amargura; são os seus pés velozes para derramar sangue, nos seus caminhos, há destruição e miséria; desconheceram o caminho da paz. Não há temor de Deus diante de seus olhos

Romanos 3.10-18, ênfase acrescentada.

O pecado torna o pecador digno de morte: “O pecado, uma vez consumado, gera a morte” (Tg 1.15). “O salário do pecado é a morte” (Rm 6.23).

Os pecadores não podem fazer nada para ganhar a salvação: “Todos nós somos como o imundo, e todas as nossas justiças, como trapo da imundícia; todos nós murchamos como a folha, e as nossas iniqüidades, como um vento, nos arrebatam” (Is 64.6). “Ninguém será justificado diante dele por obras da lei” (Rm 3.20). “O homem não é justificado por obras da lei... por obras da lei, ninguém será justificado” (Gl 2.16).

Portanto, os pecadores estão num estado de incapacidade: “Aos homens está ordenado morrerem uma só vez, vindo, depois disto, o juízo” (Hb 9.27). “Nada há encoberto que não venha a ser revelado; e oculto que não venha a ser conhecido” (Lc 12.2). “Deus, por meio de Cristo Jesus, julgar[á] os segredos dos homens” (Rm 2.16). “Quanto, porém, aos covardes, aos incrédulos, aos abomináveis, aos assassinos, aos impuros, aos feiticeiros, aos idólatras e a todos os mentirosos, a parte que lhes cabe será no lago que arde com fogo e enxofre, a saber, a segunda morte” (Ap 21.8).

Instrua-os sobre Cristo e o que Ele fez.

O evangelho é boas notícias sobre Cristo e o que Ele fez pelos pecadores. A doutrina do não-senhorio tende a enfatizar a obra de Cristo e diminuir a sua pessoa, particularmente, o aspecto de sua autoridade divina. Mas, no que concerne à salvação, as Escrituras nunca apresentam Jesus como menos do que o Senhor. A noção de que seu senhorio é um suplemento ao evangelho é totalmente estranha à Escritura.

Ele é eternamente Deus: “No princípio era o Verbo, e o Verbo estava com Deus, e o Verbo era Deus. Ele estava no princípio com Deus. Todas as coisas foram feitas por intermédio dele, e, sem ele, nada do que foi feito se fez... E o Verbo se fez carne e habitou entre nós, cheio de graça e de verdade, e vimos a sua glória, glória como do unigênito do Pai” (Jo 1.1-3, 14). “Nele, habita, corporalmente, toda a plenitude da Divindade” (Cl 2.9).

Ele é Senhor de todos: “O Cordeiro... é o Senhor dos senhores e o Rei dos reis; vencerão também os chamados, eleitos e fiéis que se acham com ele” (Ap 17.14). “Deus o exaltou sobremaneira e lhe deu

O nome que está acima de todo nome, para que ao nome de Jesus se dobre todo joelho, nos céus, na terra e debaixo da terra, e toda língua confesse que Jesus Cristo é Senhor, para glória de Deus Pai” (Fp 2.911). “Este é O Senhor de todos” (At 10.36).

Ele se tornou homem: “Pois ele, subsistindo em forma de Deus, não julgou como usurpação O ser igual a Deus; antes, a si mesmo se esvaziou, assumindo a forma de servo, tornando-se em semelhança de homens” (Fp 2.6-7).

Ele é completamente puro e impecável: “Foi ele tentado em todas as coisas, à nossa semelhança, mas sem pecado” (Hb 4.15). Ele “não cometeu pecado, nem dolo algum se achou em sua boca; pois ele, quando ultrajado, não revidava com ultraje; quando maltratado, não fazia ameaças, mas entregava-se àquele que julga retamente” (1 Pe 2.22-23). “Ele se manifestou para tirar os pecados, e nele não existe pecado” (1 JO 3.5).

Aquele que não tinha pecado tornou-se um sacrifício em favor de nosso pecado: “Aquele que não conheceu pecado, ele O fez pecado por nós; para que, nele, fôssemos feitos justiça de Deus” (2 CO 5.21). Ele “a si mesmo se deu por nós, a fim de remir-nos de toda iniqüidade e purificar, para si mesmo, um povo exclusivamente seu, zeloso de boas obras” (Tt 2.14).

Ele derramou seu próprio sangue como expiação pelo pecado: “NO qual temos a redenção, pelo seu sangue, a remissão dos pecados, segundo a riqueza da sua graça, que Deus derramou abundantemente sobre nós” (Ef 1.7-8). “Àquele que nos ama, e, pelo seu sangue, nos libertou dos nossos pecados” (Ap 1.5).

Ele morreu na cruz para oferecer um meio de salvação aos pecadores: “Carregando ele mesmo em seu corpo, sobre O madeiro, os nossos pecados, para que nós, mortos para os pecados, vivamos para a justiça; por suas chagas, fostes sarados” (1 Pe 2.24). “Havendo feito a paz pelo sangue da sua cruz, por meio dele, reconciliasse consigo mesmo todas as coisas” (Cl 1.20).

Ele ressuscitou triunfantemente dos mortos: “Foi designado Filho de Deus com poder, segundo o espirito de santidade pela ressurreição dos mortos” (Rm 1.4). “[Ele] foi entregue por causa das nossas transgressões e ressuscitou por causa da nossa justificação” (4.25). “Antes de tudo, vos entreguei o que também recebi: que Cristo morreu pelos nossos pecados, segundo as Escrituras, e que foi sepultado e ressuscitou ao terceiro dia, segundo as Escrituras” (1 Co 15.3-4).

Diga-lhes o que Deus exige deles.

Fé contrita é a exigência. Não é meramente uma “decisão” de confiar em Cristo para ter a vida eterna, e sim um abandono indiscriminado de tudo em que confiamos e uma conversão a Jesus Cristo como Senhor e Salvador.

Arrependa-se: “Convertei-vos e desviai-vos de todas as vossas transgressões” (EZ 18.30). “Porque não tenho prazer na morte de ninguém, diz o SENHOR Deus. Portanto, convertei-vos e vivei” (v. 32). “Deus... agora... notifica aos homens que todos, em toda parte, se arrependam” (At 17.30). “Anunciei... que se arrependessem e se convertessem a Deus, praticando obras dignas de arrependimento” (At 26.20).

Afaste seu coração de tudo que você sabe que desonra a Deus: “Deixando os idolos, vos convertestes a Deus, para servirdes o Deus vivo e verdadeiro” (1 Ts 1.9). Siga a Jesus: “Se alguém quer vir após mim, a si mesmo se negue, dia a dia tome a sua cruz e siga-me” (Lc 9.23). “Ninguém que, tendo posto a mão no arado, olha para trás é apto para o reino de Deus” (v. 62). “Se alguém me serve, siga-me, e, onde eu estou, ali estará também o meu servo. E, se alguém me servir, o Pai o honrará” (Jo 12.26).

Creia em Jesus como Senhor e Salvador: “Crê no Senhor Jesus e serás salvo” (At 16.31). “Se, com a tua boca, confessares Jesus como Senhor e, em teu coração, creres que Deus o ressuscitou dentre os mortos, serás salvo” (Rm 10.9).

Advirta-os a calcular atenciosamente o custo.

A salvação é absolutamente gratuita. VOCÊ não tem de comprar sua entrada. Tudo que você precisará lhe será dado. Mas há um sentido em que seguir a Cristo custará caro. Pode custar liberdade, família, amigos, autonomia e, possivelmente, a sua própria vida. O trabalho do evangelista é contar toda a história aos potenciais convocados. É exatamente por isso que a mensagem de Jesus era freqüentemente tão cheia de exigências árduas:

Se alguém vem a mim e não aborrece a seu pai, e mãe, e mulher, e filhos, e irmãos, e irmãs e ainda a sua própria vida, não pode ser meu discípulo. E qualquer que não tomar a sua cruz e vier após mim não pode ser meu discípulo. Pois qual de vós, pretendendo construir uma torre, não se assenta primeiro para calcular a despesa e verificar se tem os meios para a concluir? Para não suceder que, tendo lançado os alicerces e não a podendo acabar, todos os que a virem zombem dele, dizendo: Este homem começou a construir e não pôde acabar. Ou qual é o rei que, indo para combater outro rei, não se assenta primeiro para calcular se com dez mil homens poderá enfrentar o que vem contra ele com vinte mil? Caso contrário, estando o outro ainda longe, envia-lhe uma embaixada, pedindo condições de paz. Assim, pois, todo aquele que dentre vós não renuncia a tudo quanto tem não pode ser meu discípulo.

Lucas 14.26-33

Não penseis que vim trazer paz à terra; não vim trazer paz, mas espada. Pois vim causar divisão entre o homem e seu pai; entre a filha e sua mãe e entre a nora e sua sogra. Assim, os inimigos do homem serão os da sua própria casa. Quem ama seu pai ou sua mãe mais do que a mim não é digno de mim; quem ama seu filho

OU sua filha mais do que a mim não é digno de mim; e quem não toma a sua cruz e vem após mim não é digno de mim.

Mateus IÜ.34-38

0 enigma do gratuito/caro e da morte/vida é expresso nos termos mais claros possíveis em JOÃO 12.24-25: “Em verdade, em verdade vos digo: se O grão de trigo, caindo na terra, não morrer, fica ele só; mas, se morrer, produz muito fruto. Quem ama a sua vida perde-a; mas aquele que odeia a sua vida neste mundo preservá-la-á para a vida eterna”.

A cruz é central ao evangelho precisamente por causa de sua mensagem vívida, que inclui O horror do pecado, a profundeza da ira de Deus contra O pecado e a eficácia da obra de Jesus na crucificação do velho homem (Rm 6.6). A. W. Tozer escreveu:

A cruz é a coisa mais revolucionária que já apareceu entre os homens. A cruz dos tempos romanos não sabia O que era fazer acordos; nunca fez concessões. Ela vencia todas as suas discussões matando seu oponente e silenciando-o para sempre. Não poupou a Cristo, mas assassinou-o violentamente como O fez aos demais. Ele estava vivo quando O penduraram naquela cruz e completamente morto quando O retiraram dali, seis horas depois. Isso era a cruz na primeira vez em que apareceu na história cristã...

A cruz cumpre sua finalidade destruindo um padrão estabelecido, O da vítima, e criando outro padrão, O seu próprio. Assim, as coisas sempre saem como ela quer. Ela vence ao derrotar seu oponente e impor sua vontade sobre ele. A cruz sempre domina. Nunca entra em acordos, nunca faz trocas nem concessões, nunca cede um ponto a favor da paz. Ela não se importa com a paz; importa-se apenas em terminar mais rapidamente possível a oposição contra ela.

Com perfeito conhecimento de tudo isso, Cristo disse: “Se alguém quer vir após mim, a si mesmo se negue, dia a dia tome a sua cruz e siga-me”. Então, a cruz não somente trouxe um fim à vida de Cristo, mas também à primeira vida, a vida velha, de cada um de seus verdadeiros seguidores. A cruz destrói o padrão antigo, o padrão de Adão, na vida do crente e o traz a um fim. Então, o Deus que ressuscitou Cristo dos mortos ressuscita o crente, e uma nova vida começa.

Isso, e nada menos, é o verdadeiro cristianismo.

Devemos fazer algo em relação à cruz. E só podemos fazer uma de duas coisas — fugir da cruz ou morrer nela.14

“Quem quiser, pois, salvar a sua vida perdê-la-á; e quem perder a vida por causa de mim e do evangelho salvá-la-á. Que aproveita ao homem ganhar o mundo inteiro e perder a sua alma? Que daria um homem em troca de sua alma?” (Mc 8.35-37).

Estimule-os a crer em Cristo.

“Conhecendo o temor do Senhor, persuadimos os homens” (2 Co 5.11). “Tudo provém de Deus, que nos reconciliou consigo mesmo por meio de Cristo e nos deu o ministério da reconciliação, a saber, que Deus estava em Cristo reconciliando consigo o mundo, não imputando aos homens as suas transgressões, e nos confiou a palavra da reconciliação. De sorte que somos embaixadores em nome de Cristo, como se Deus exortasse por nosso intermédio. Em nome de Cristo, pois, rogamos que vos reconcilieis com Deus” (2 Co 5.18-20).

“Buscai o SENHOR enquanto se pode achar, invocai-o enquanto está perto. Deixe o perverso o seu caminho, o iníquo, os seus pensamentos; convertase ao SENHOR, que se compadecerá dele, e volte-se para o nosso Deus, porque é rico em perdoar” (Is 55.6-7). “Se, com a tua boca, confessares Jesus como Senhor e, em teu coração, creres que Deus O ressuscitou dentre os mortos, serás salvo. Porque com o coração se crê para justiça e com a boca se confessa a respeito da salvação”(Rm 10.9-10).

BELCHER, Richard P. A layman’s guide to the lordship controversy. Southbridge, Mass.: Crowne, 1990. p. 71.

CHAFER, Lewis S. Systematic theology, 8 v. Dallas: Seminary Press, 1948. 3:387.

Ibid. 3:371-393.

CHAFER, Lewis S. Salvation. Philadelphia: Sunday School Times, 1917. p. 80. Ênfase acrescentada.

_.    True evangelism. Grand Rapids, Mich.: Zondervan, 1919. p. 13.

Ibid. p. 15.

CHAFER, Lewis S. Systematic theology, 8 v. Dallas: Seminary Press, 1948. 3:385.

Ibid.

KERN, Stephen, It is easy to receive salvation from God, The Idaho Statesman, Boise, 29 June 1991, 3D, Ênfase acrescentada,

Zane Hodges parece estar argumentando que, afinal de contas, crer deve ser fácil, Respondendo à expressão “crença fácil”, ele escreveu: “Presumivelmente, o oposto seria ‘crença difícil'; e, se algum sistema de pensamento ensina a ‘crença difícil', é o sistema de salvação por senhorio que o faz com certeza,,, Mas a salvação é realmente simples e, nesse sentido, fácil! Afinal de contas, o que poderia ser mais simples do que receber ‘de graça a água da vida'?” (AF 30).

Ryrie inclui um capítulo intitulado “Não É Fácil Crer” (SGS 117-123),

Uma fonte particularmente útil é o livro Tell the Ttruth (Downers Grove, Ill,: InterVarsity, 1984), escrito por Will Metzger, Além de apresentar informações muito práticas, Metzger também fala contra a tendência reducionista na evangelização que descrevi e inclui uma seção muito lúcida que contrasta o evangelização centrada em Deus com a evangelização centrada no homem, Um panfleto útil é Who Do You Think I Am? (Valencia, Calif,: Grace to You, 1991),

WILKIN, Bob. Letters to the editor. The Grace Evangelical Society News, Denton, p. 3, Aug. 1990.

TOZER, A. W. The root of the righteous. Harrisburg, Pa.: Christian Publications, 1955. p. 61-63.

Onde se encaixam as boas obras?

Em nenhuma passagem do Antigo ou do Novo Testamento encontramos um convite no sentido de que os pecadores creiam agora e obedeçam mais tarde. O chamado a crer e obedecer é uma convocação única. Às vezes, a palavra obedecer é usada para descrever a experiência de conversão: “Tornou-se o Autor da salvação eterna para todos os que lhe obedecem” (Hb 5.9).

Alguém supõe realmente ser possível crer, sondar tudo que Jesus fez ao sofrer e morrer por causa do pecado, aceitar de suas mãos a oferta do perdão — e, depois, se afastar, deixar de exaltá-lo com a própria vida e passar a desprezá-lo, rejeitá-lo e parar de crer nEle, como aqueles que o mataram? Esse tipo de teologia é grotesca.

A verdade é que nossa rendição a Cristo nunca é mais pura do que no momento em que nascemos de novo. Naquele momento sagrado, estamos completamente sob o controle soberano do Espírito Santo, somos unidos a Cristo e recipientes de um coração novo. Então, mais do que antes, a obediência é inegociável, e nenhum convertido genuíno desejaria que ela fosse negociável (cf. Rm 6.17).

A conversão do apóstolo Paulo é uma ilustração típica. Nessa conversão, a questão era claramente o senhorio de Jesus. Quais foram as primeiras palavras de Paulo como crente? “Que farei, Senhor?” (At 22.10). Anos mais tarde, Paulo escreveu sobre tudo de que desistira na estrada para Damasco:

Bem que eu poderia confiar também na carne. Se qualquer outro pensa que pode confiar na carne, eu ainda mais: circuncidado ao oitavo dia, da linhagem de Israel, da tribo de Benjamim, hebreu de hebreus; quanto à lei, fariseu, quanto ao zelo, perseguidor da igreja; quanto à justiça que há na lei, irrepreensível. Mas o que, para mim, era lucro, isto considerei perda por causa de Cristo. Sim, deveras considero tudo como perda, por causa da sublimidade do conhecimento de Cristo Jesus, meu Senhor; por amor do qual perdi todas as coisas e as considero como refugo, para ganhar a Cristo e ser achado nele, não tendo justiça própria, que procede de lei, senão a que é mediante a fé em Cristo, a justiça que procede de Deus, baseada na fé.

FILIPENSES 3.4-9, Ênfase acrescentada.

Podemos considerar honestamente a conversão, a vida e o ministério de Paulo e, ao mesmo tempo, acreditar que alguma vez ele aderiu a um evangelho que ensinava às pessoas que elas podiam ser salvas sem renderem-se à autoridade de Cristo?

A salvação por senhorio é freqüentemente caricaturada como que ensinando às pessoas que elas devem mudar sua vida para serem salvas.1 Mas não conheço nenhum defensor da salvação por senhorio que já tenha ensinado tal coisa. Não há, em qualquer lugar, um professor legítimo da teologia do senhorio que diria a um descrente que ele precisa “‘provar’ que se qualifica para a salvação”.2 Como temos visto repetidas vezes, em nosso estudo, obras meritórias não têm lugar na salvação.

Entretanto, obras de fé estão plenamente relacionadas ao propósito por que somos salvos. Todo o propósito de Deus em nos escolher foi o de “remirnos de toda iniqüidade e purificar, para si mesmo, um povo exclusivamente seu, zeloso de boas obras” (Tt 2.14, ênfase acrescentada). Este é o propósito de Deus estabelecido desde a eternidade passada; “Somos feitura dele, criados em Cristo Jesus para boas obras, as quais Deus de antemão preparou para que andássemos nelas” (Ef 2.10, ênfase acrescentada).

A primeira ordenança para todo cristão é o batismo. Mencionei anteriormente que os apóstolos incluíam, às vezes, o batismo no chamado à fé (At 2.38; cf. Mc 16.16). O batismo não é uma condição da salvação, e sim um passo inicial de obediência para o cristão. A conversão está completa antes de o batismo ocorrer; o batismo é apenas um sinal externo que dá testemunho do que aconteceu no coração do pecador. O batismo é um ritual; é precisamente o tipo de “obra” que Paulo afirma não pode ser meritória (cf. Rm 4.10-11).3

No entanto, dificilmente alguém lê o Novo Testamento sem perceber a forte ênfase que a igreja primitiva colocava sobre o batismo. Eles compreenderam que todo crente genuíno se envolveria numa vida de obediência e discipulado. Isso era inegociável. Portanto, eles viam o batismo como o ponto decisivo. Apenas aqueles que eram batizados eram considerados cristãos. Foi por isso que o eunuco etíope se mostrou tão ansioso por ser batizado (At 8.36-39).

Infelizmente, a igreja hoje vê o batismo de modo casual. Não é incomum encontrar pessoas que professam o cristianismo há anos e ainda não foram batizadas. Na igreja do Novo Testamento, não se ouvia falar esse tipo de coisa. Infelizmente, temos perdido o foco da obediência inicial.

Spurgeon escreveu; “Se o convertido afirma distinta e delibera-damente que conhece a vontade do Senhor, mas não tem a intenção de cumpri-la, você não deve acostumar mal suas presunções; é seu dever assegurá-lo de que ele não é salvo”.4

Como devemos testemunhar às crianças?

NÓS devemos simplificar OU abreviar a mensagem quando ensinamos o evangelho a crianças? Não há autorização bíblica para isso. Certamente, precisamos usar uma terminologia que as crianças compreendam, ser claros e pacientes ao comunicar a mensagem. Mas, quando a Escritura fala sobre ensinar a verdade espiritual a crianças, a ênfase está em conscientização: “Estas palavras que, hoje, te ordeno estarão no teu coração; tu as inculcarás a teus filhos, e delas falarás assentado em tua casa, e andando pelo caminho, e ao deitar-te, e ao levantar-te” (Dt 6.6-7). Parece que simplificar demais é um perigo maior do que lhes dar muitos detalhes.

AS crianças não são salvas antes de terem idade suficiente para entenderem claramente o evangelho e poderem segui-lo com fé genuína. Portanto, elas devem ser suficientemente crescidas para compreender o bem e o mal, o pecado e a punição, o arrependimento e a fé. Com certeza, elas precisam ter idade suficiente para entender a gravidade do pecado e a natureza da santidade de Deus. Que idade é essa? Sem dúvida isso varia de criança a criança. Crianças amadurecem em períodos diferentes. Parte do nosso trabalho de ensinar é ajudá-las a chegar a uma compreensão desenvolvida desses assuntos.

Não amenize as partes da mensagem que pareçam desagradáveis. O sangue de Cristo, a cruz e a expiação pelos pecados são o âmago da mensagem. Se deixamos esses assuntos de lado, não estamos apresentando o evangelho completo. Não reduza a exigência de rendição. O senhorio de Cristo não é difícil demais para ser entendido pelas crianças. Qualquer criança com idade suficiente para compreender o evangelho básico também é capaz, pela graça de Deus, de confiar nele completamente e responder com o mais puro e mais sincero tipo de rendição. Jesus, “chamando uma criança, colocou-a no meio deles. E disse: Em verdade vos digo que, se não

VOS converterdes e não VOS tornardes como crianças, de modo algum entrareis no reino dos céus. Portanto, aquele que se humilhar como esta criança, esse é O maior no reino dos céus” (Mt 18.2-4).

Lembre que O fator principal na vinda de uma pessoa a Cristo não é quanta doutrina ela sabe. A questão real é a extensão da obra de Deus em seu coração. Até O crente mais maduro não compreende toda a verdade de Deus. Na vida presente, podemos apenas começar a sondar as riquezas da Palavra de Deus. Certamente, a salvação não exige compreensão plena de cada aspecto do evangelho. Afinal de contas, O ladrão na cruz ao lado de Jesus sabia muito bem que ele mesmo era culpado e que Jesus, que era O Senhor e

O verdadeiro Messias, não havia feito nada errado (Lc 23.40-42). Como ele sabia tanto? Como Jesus disse a Pedro, “não foi carne e sangue que to revelaram, mas meu Pai, que está nos céus” (Mt 16.17). O apelo do ladrão foi simples: “Jesus, lembra-te de mim quando vieres no teu reino” (Lc 23.42); mas, apesar da escassa quantidade de doutrina que ele sabia, nosso Senhor assegurou-lhe: “Em verdade te digo que hoje estarás comigo no paraíso” (V. 43).

É tarefa do Espírito Santo, e não nossa, prover segurança (Rm 8.14-15). Então, não enfatize demais a segurança objetiva às crianças. Como observei antes, muitas pessoas cujo coração é completamente frio para as coisas do Senhor acreditam que estão indo para O céu, apenas porque responderam positivamente, quando crianças, a um convite evangelístico. Havendo “pedido a Jesus que entrasse em seu coração”, elas foram ensinadas a nunca examinar a si mesmas e nunca cultivar qualquer dúvida sobre a sua salvação.

Certamente não podemos tomar por certo que toda profissão de fé reflete uma obra genuína de Deus no coração; e isso é particularmente verdade no que diz respeito a crianças. Em geral, elas respondem positivamente aos convites do evangelho, por inúmeras razões. Muitas dessas razões não têm qualquer relação com consciência de pecado e são desprovidas de uma compreensão real da verdade espiritual. Se estimularmos as crianças à “fé”, mediante pressão externa, sua “conversão” se comprovará espúria. Apenas aqueles que entendem e são, pelo Espírito, impelidos a crer são verdadeiramente nascidos de novo (Jo 3.6).

Lembre que uma resposta dada na infância não garante necessariamente que a questão da salvação eterna está resolvida para sempre. Enquanto muitas pessoas fazem um compromisso genuíno com Cristo quando ainda são novas, muitas outras — talvez a maioria — só chegam a uma percepção adequada do significado do evangelho quando são jovens. Outros que professam Cristo na infância se desviam. É exatamente por isso que devemos evitar a resposta rápida e fácil e ensinar as nossas crianças com paciência, consistência e fidelidade durante todos os seus anos de desenvolvimento. Encoraje cada passo de fé à medida que elas crescem.

Devemos ter muito cuidado para não imunizarmos as crianças contra qualquer compromisso genuíno com Cristo, quando chegarem finalmente a uma idade de plena compreensão espiritual. Ensine o evangelho às crianças — todo o evangelho — mas entenda que você pode estar plantando as sementes de uma safra que talvez não amadurecerá por muitos anos. Se você colhe um campo logo que ele brota, nunca terá uma safra completa.

Uma palavra final

O primeiro credo da igreja primitiva foi “Jesus é Senhor” (cf. Rm 10.9-10; 1 Co 12.3). O senhorio de Cristo permeou a pregação apostólica e permeia o Novo Testamento. Este foi o auge do primeiro sermão apostólico, a mensagem de Pedro no dia de Pentecostes:

A este Jesus Deus ressuscitou, do que todos nós somos testemunhas. Exaltado, pois, à destra de Deus, tendo recebido do Pai a promessa do Espírito Santo, derramou isto que vedes e ouvis.

Porque Davi não subiu aos CÉUS, mas ele mesmo declara: Disse o Senhor ao meu Senhor: Assenta-te à minha direita, até que eu ponha os teus inimigos por estrado dos teus pés. Esteja absolutamente certa, pois, toda a casa de Israel de que a este Jesus, que vós crucificastes, Deus o fez Senhor e Cristo.

Atos 2.32-36, ênfase acrescentada.

O contexto não deixa dúvida sobre o que Pedro queria dizer. Era uma mensagem sobre a autoridade absoluta de Cristo como o bendito e único Soberano, o Rei dos reis e Senhor dos senhores (cf. 1 Tm 6.15-16).

Em todo o livro de Atos, o senhorio absoluto de Jesus é um tema recorrente. Quando Pedro iniciou o ministério evangélico aos gentios, na casa de Cornélio, ele declarou novamente: “Este é o Senhor de todos” (At 10.36). Só no livro de Atos, o título “Senhor” é usado cinqüenta vezes para se referir a Jesus, tão freqüente quanto “Salvador”. A verdade do senhorio de Cristo era a chave da pregação apostólica. O senhorio de Cristo é o evangelho segundo os apóstolos.

T. Alan Chrisope, em seu admirável livro Jesus Is Lord (Jesus É Senhor), escreveu: “Não há elemento da pregação apostólica mais notável do que a ressurreição, a exaltação e o senhorio de Jesus”.5 E acrescentou:

A confissão “Jesus é Senhor” é a confissão cristã mais predominante no Novo Testamento. Ela não somente ocorre em várias passagens que enfatizam seu caráter singular como a confissão cristã (ex.: Fp 2.9-11; Rm 10.9; 1 Co 12.3; 8.5-6; cf. Ef 4.5), mas também ocorre inúmeras vezes numa forma variante, a expressão “nosso Senhor”, uma designação de Jesus usada tão amplamente que se tornou a confissão cristã característica e universalmente reconhecida — conhecida e confessada por todos os crentes.6

“Todos os fatos básicos da história do evangelho estão implícitos nesta única e breve confissão: ‘Jesus é Senhor’.”7

O apóstolo Paulo disse: “Não nos pregamos a nós mesmos, mas a Cristo Jesus como Senhor” (2 Co 4.5). O senhorio de Jesus é a mensagem apostólica.

Finalizei meu livro anterior sobre o evangelho com estas palavras, que também constituem uma conclusão adequada para este livro:

[Jesus] é Senhor, e aqueles que O recusam como Senhor não podem “usáLo” como Salvador. Todos os que O recebem têm de render-se à sua autoridade, pois dizer que recebemos a Cristo, quando na verdade rejeitamos o direito que Ele tem de reinar sobre nós, é um completo absurdo. É uma tentativa fútil a de querer segurar o pecado com uma das mãos e receber Jesus com a outra. Que tipo de salvação é essa, se somos deixado na escravidão ao pecado?

É este, portanto, o evangelho que devemos proclamar: que Jesus Cristo, que é Deus encarnado, humilhou a Si mesmo para morrer em nosso benefício. Ele se tornou o sacrifício, sem pecado, que pagou a penalidade da nossa culpa. Ele ressuscitou dos mortos para declarar com poder que é Senhor sobre todos; e Ele oferece gratuitamente a vida eterna a pecadores dispostos a se renderem a Ele em fé humilde e penitente. Este evangelho nada promete ao rebelde insolente; mas, para pecadores quebrantados e arrependidos, oferece tudo o que concerne à vida e à piedade.8

2 Pedro 1.3

Apêndice 1

PENTECOST, J. D. A christian perspective. Kindred Spirit, Winter 1988: 3.

Ibid. Esse é um exemplo primordial de como a salvação por senhorio é freqüentemente abordada com exagero, ironizada e tornada algo fácil de ridicularizar. Infelizmente, isso confunde e prejudica as pessoas, enquanto deixa de abordar a questão real.

Se o batismo fosse necessário à salvação, Paulo não teria escrito; “Dou graças [a Deus] porque a nenhum de vós batizei, exceto Crispo e Gaio... Porque não me enviou Cristo para batizar, mas para pregar o evangelho” (1 Co 1.14, 17).

SPURGEON, Charles H. The soul winner. Grand Rapids, Mich.; Eerdmans, 1963. p. 38.

CHRISOPE, T. Alan. Jesus is Lord. Hertfordshire, England: Evangelical Press, 1982. p. 57.

Ibid. p. 61.

Ibid. p. 63.

MACARTHUR, John, O evangelho segundo Jesus. 2. ed. São José dos Campos, SP: Fiel, 2008. p. 283-284.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O autor critica o evangelho reduzido a "aceitar a Cristo como Salvador" enquanto se rejeita o seu direito de reinar como Senhor; quando você respondeu ao evangelho, houve uma rendição do coração, da mente e da vontade, ou apenas uma decisão mental que não tocou o domínio da sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ele descreve o decisionismo de quem apoia a esperança do céu na lembrança de um gesto feito um dia, e não em Cristo; será que a sua segurança hoje se apega à memória de uma "decisão" passada em vez de uma fé viva e operante?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A aula insiste que seguir Cristo custa caro e que devemos calcular o preço, pois Ele exige rendição incondicional; ao olhar para o que você realmente entregou a Ele, há algo que você ainda segura com uma das mãos enquanto tenta receber Jesus com a outra?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pontos de Vista$t$, 13,
$conteudo$O quadro nas páginas seguintes apresenta uma comparação das posições sobre os principais assuntos da controvérsia do senhorio. Recorra ao capitulo 2 para ver a documentação.

Os leitores interessados em uma análise mais detalhada dos principais assuntos envolvidos na controvérsia do senhorio se beneficiarão muito com o magnífico livro Lordship Salvation: Some Crucial Questions and Answers (A Salvação por Senhorio: Algumas Perguntas e Respostas Cruciais), escrito por Robert Lescelius. Outra fonte muito útil é o livro A Layman’s Guide to the Lordship Controversy (Manual do Leigo sobre a Controvérsia do Senhorio), escrito por Richard P. Belcher.

SENHORIO NÂO-SENHORIO NÂO-SENHORIO RADICAL

A morte de Cristo na cruz pagou toda a penalidade por nossos pecados e comprou a salvação eterna. Seu sacrifício expiatório permite que Deus justifique pecadores gratuitamente, sem comprometer a perfeição da justiça divina. Sua ressurreição dentre os mortos declara sua vitória sobre o pecado e sobre a morte.

A cruz

Concorda. Concorda.

Justificação pela fé

A salvação é pela graça, por meio da fé somente no Senhor Jesus Cristo — nem mais, nem menos.

Concorda. Concorda.

Os pecadores não podem obter a salvação ou o favor de Deus em troca de obras.

Boas obras

Concorda. Concorda.

Deus não exige daqueles que são salvos obras preparatórias ou auto-aperfeiçoa-mento como condição prévia.

Prerrequisitos

Concorda. Concorda.

Vida eterna A vida eterna é um dom de Deus Concorda. Concorda.

Os crentes são salvos e plenamente justificados antes de sua fé produzir uma única obra justa.

Justificação

Concorda. Concorda.

imediata

Os cristãos podem pecar e pecam. Até os cristãos mais fortes travam, na carne, uma luta constante e intensa contra o pecado. Crentes genuínos cometem às vezes pecados abomináveis.

Os crentes e o pecado

Concorda. Concorda.

O arrependimento é uma mudança de mente no tocante a Cristo. No contexto do convite do evangelho, o arrependimento é apenas um sinônimo de fé. Não é exigido abandono do pecado para que aconteça a salvação.

O evangelho chama os pecadores à fé unida com o arrependimento, que consiste em afastar-se do pecado. Não é uma obra, e sim uma graça concedida por Deus. O arrependimento é uma mudança de coração; mas o arrependimento genuíno também produz mudança de comportamento.

O arrependimento não é essencial à mensagem do evangelho. Em nenhum sentido o arrependimento está relacionado à fé salvífica.

Arrependimento

Fé Salvação é totalmente uma obra de Deus. Aqueles que creem são salvos absolutamente sem qualquer esforço de sua própria parte. Até mesmo a fé é um dom de Deus, não uma obra do homem. Portanto, a fé genuína não pode desaparecer ou ser efêmera; ela dura para sempre.

Toda a salvação, incluindo a fé, é um dom de Deus. Entretanto, a fé pode não durar. Um verdadeiro cristão pode parar de crer completamente.

A fé é um ato humano, e não um dom de Deus. Ela ocorre num momento decisivo, mas não continua necessariamente. A verdadeira fé pode ser subvertida, derrotada, desfalecer ou até tornarse incredulidade.

SENHORIO NÂO-SENHORIO NÂO-SENHORIO RADICAL

O objeto da fé é o próprio Cristo, não somente um credo ou uma promessa. A fé, portanto, envolve um compromisso pessoal com Cristo. Em outras palavras, todos os crentes verdadeiros seguem a Jesus.

A fé salvífica é simplesmente estar convicto ou crer na verdade do evangelho. É a confiança de que Cristo pode remover a culpa e dar a vida eterna; não é um compromisso pessoal com Ele.

“Crer" para a salvação é crer nos fatos do evangelho. “Crer em Jesus" significa crer nos “fatos salvíficos" sobre Ele; e crer nesses fatos significa tomar posse do dom da vida eterna. Aqueles que acrescentam qualquer sugestão de compromisso afastam-se do conceito de salvação apresentado no Novo Testamento.

O objeto da fé

A fé genuína produz inevitavelmente uma vida mudada. A salvação inclui uma transformação da pessoa interior. A natureza do cristão é diferente; é nova. O padrão de pecado e de inimizade contínuos contra Deus não prossegue quando uma pessoa é nascida de novo.

Algum fruto espiritual é inevitável na experiência de cada cristão. O fruto, contudo, pode não ser visível a outros. Os cristãos podem até cair num estado de esterilidade espiritual permanente.

Os frutos espirituais não são garantidos na vida cristã. Alguns cristãos passam a vida num ermo estéril, de derrota, confusão e todo tipo de mal.

Os efeitos da fé

A O “dom de Deus" a Apenas os aspectos O céu é garantido aos crentes, mas amplitude da salvação vida eterna, inclui tudo que diz respeito à vida e à piedade, e não somente uma passagem para o céu.

judiciais da salvação — como justificação, adoção, justiça imputada e santificação posicional — são garantidos aos crentes nesta vida. Santificação prática e crescimento na graça exigem um ato de dedicação posterior à conversão.

não a vitória cristã. Podemos até dizer que “os salvos" ainda precisam de salvação. Cristo oferece uma série de experiências de livramento pósconversão para suprir o que falta aos cristãos. Mas todas essas outras “salvações" exigem o acréscimo de obras humanas, como obediência, submissão e confissão de Jesus como Senhor. Assim, Deus depende, em certo grau, do esforço humano para concluir o livramento do pecado nesta vida.

A submissão à suprema autoridade de Cristo como Senhor não é pertinente à transação salvífica. Nem a dedicação, nem a disposição de ser dedicado a Cristo estão envolvidas na salvação. As novas de que Cristo morreu por nossos pecados e ressuscitou dentre os mortos é o evangelho completo. Não devemos crer em nada mais do que isso para sermos salvos.

Jesus é Senhor de todos, e a fé que Ele exige envolve rendição incondicional. Ele não dá a vida eterna àqueles cujo coração permanece contra Ele.

A submissão não é, em nenhum sentido, uma condição para a vida eterna. “Invocar o Senhor"significa fazer uma súplica a Ele, não submeter-se a Ele.

O senhorio de Cristo

Os cristãos podem cair num estado de carnalidade vitalícia. Existe na igreja toda uma categoria de “cristãos carnais" — pessoas nascidas de novo que vivem continuamente como não-salvos.

Aqueles que crêem verdadeiramente amam a Cristo. Portanto, eles desejarão obedecerlhe.

Nada garante que um verdadeiro cristão amará a Deus. A salvação nem mesmo coloca, necessariamente, o pecador num relacionamento correto de comunhão harmoniosa com Deus.

Desejos santos

SENHORIO NÂO-SENHORIO NÂO-SENHORIO RADICAL

Segurança O comportamento é Desobediência e Se as pessoas têm certeza de que uma prova importante da fé. A obediência evidencia que a fé de alguém é genuína. Por outro lado, a pessoa que permanece relutando em obedecer a Cristo não evidencia fé verdadeira.

pecado demorado não são motivos para duvidarmos da realidade da fé de alguém.

crêem, sua fé deve ser genuína. Todos que, pela fé, afirmam que Cristo é o Salvador — até aqueles envolvidos em pecado sério ou demorado — devem ser assegurados de que pertencem a Deus, aconteça o que acontecer. É perigoso e destrutivo questionar a salvação de cristãos professos. Os escritores do Novo Testamento nunca questionaram a realidade da fé de seus leitores.

Um crente pode negar a Cristo terminan-temente e chegar ao ponto de não crer. Deus garantiu que não repudiará aqueles que abandonam a fé deste modo. Aqueles que uma vez creram estão seguros para sempre, ainda que se desviem.

Crentes genuínos podem tropeçar e cair, mas perseverarão na fé. Aqueles que, mais tarde, se afastam completamente do Senhor mostram que nunca foram verdadeiramente nascidos de novo.

É possível experimentar um momento de fé que garante o céu por toda a eternidade e, depois, desviar-se de forma permanente, tendo uma vida inteiramente desprovida de qualquer fruto espiritual. Crentes genuínos podem até parar de mencionar o nome de Cristo ou confessar o cristianismo.

Perseverança

Apêndice 2

0 QUE É DISPENSACIONALISMO

E 0 QUE ELE TEM A VER COM A SALVAÇÃO POR SENHORIO1

Um dos elementos mais desconcertantes de toda a controvérsia do senhorio envolve o dispensacionalismo. Algumas pessoas supõem que a minha crítica à teologia do não-senhorio é uma crítica contra todo o dispensacionalismo. Esse não é o caso. Alguns leitores podem ficar surpresos ao saber que o dispensacionalismo é uma área em que Charles Ryrie, Zane Hodges e eu temos uma base comum. Somos todos dispensacionalistas.

Muitas pessoas não entendem bem o vocábulo dispensacionalismo. Já encontrei seminaristas formados e líderes cristãos que não têm a menor idéia de como definir dispensacionalismo. Como ele difere da teologia da aliança? O que ela tem a ver com a salvação por senhorio? Talvez possamos responder a essas perguntas de modo simples e sem muitos jargões teológicos.

Dispensacionalismo é um sistema de interpretação bíblica que vê uma distinção entre o plano de Deus para Israel e seu procedimento para com a igreja. É realmente simples assim.

Uma dispensação é O plano de Deus pelo qual Ele administra seu governo em determinada época de seu plano eterno. Dispensações não são períodos de tempo, e sim administrações diferentes na realização eterna do propósito de Deus. É especialmente crucial observar que O caminho da salvação — pela graça, mediante a fé — é O mesmo em cada dispensação. O plano de redenção de Deus permanece inalterado, mas a maneira como Deus O administra terá variação de uma dispensação para outra. Dispensacionalistas observam que Israel era O foco do plano de redenção de Deus em uma dispensação. A igreja, que consiste de pessoas redimidas, incluindo judeus e gentios, é O foco em outra dispensação. Todos os dispensacionalistas crêem que ainda acontecerá pelo menos uma dispensação — durante O reino milenar de Cristo na terra, conhecido como O milênio, em que Israel desempenhará, novamente, um papel essencial.

O dispensacionalismo ensina que todas as promessas restantes da aliança com Israel serão cumpridas de modo literal — incluindo as promessas de bênçãos terrenas e de um reino messiânico na terra. Por exemplo, Deus prometeu a Israel que eles possuiriam a terra prometida para sempre (Gn 13.14-17; Ex 32.13). A Escritura declara que O Messias governará de Jerusalém os reinos da terra (Zc 14.9-11). Uma profecia do Antigo Testamento diz que, um dia, todo O Israel será restabelecido na terra prometida (Am 9.14-15), O templo será reconstruído (Ez 37.26-28), e O povo de Israel será redimido (Jr 23.6; Rm 11.26-27). Os dispensacionalistas crêem que todas essas bênçãos prometidas acontecerão de modo tão literal como aconteceram as maldições prometidas.

Por outro lado, a teologia da aliança geralmente vê tais profecias como já cumpridas simbolicamente. A teologia da aliança acredita que a igreja, e não O Israel literal, é a receptora das promessas da aliança. Os teólogos da aliança crêem que a igreja substituiu Israel no plano eterno de Deus. As promessas de Deus para Israel são, portanto, cumpridas em bênçãos espirituais recebidas por cristãos.2 Visto que o sistema deles não permite um cumprimento literal das bênçãos prometidas à nação judaica, os teólogos da aliança ou espiritualizam aquelas passagens proféticas da Palavra de Deus.

Sou dispensacionalista porque o dispensacionalismo entende e aplica as Escrituras — em especial, a Escritura profética — de um modo que me parece mais coerente com a abordagem normal e literal, o qual creio ser o desígnio de Deus para a interpretação das Escrituras.3 Por exemplo, os dispensacionalistas aceitam Zacarias 12-14, Romanos 11.25-29 e Apocalipse 20.1-6 exatamente como aparecem no texto. Os aliancistas, por sua vez, não os aceitam assim.

Portanto, estou convencido de que a distinção dispensaciona-lista entre a igreja e Israel é uma compreensão exata do plano eterno de Deus, conforme revelado nas Escrituras. Não abandonei o dispensacionalismo, nem pretendo abandoná-lo.

A propósito, observe que a descrição do Dr. Ryrie quanto ao dispensacionalismo e seus motivos para seguir esse sistema são semelhantes ao que acabei de escrever. Há alguns anos, ele escreveu: “A essência do dispensacionalismo é a distinção entre Israel e a igreja. Isso resulta do emprego consistente da interpretação normal ou simples por parte do dispensacionalista”.4 Parece que nestas questões, o Dr. Ryrie e eu concordamos fundamentalmente. É na aplicação prática de nosso dispensacionalismo que diferimos. O sistema do Dr. Ryrie se torna algo mais complexo do que sua definição pode sugerir.

O debate em torno da teologia do senhorio tem exercido um efeito devastador sobre o dispensacionalismo. Visto que a teologia do nãosenhorio está associada tão intimamente com o dispensa-cionalismo, muitos têm imaginado uma relação de causa e efeito entre os dois. Em O Evangelho Segundo Jesus, expliquei que alguns dos primeiros dispensacionalistas lançaram os alicerces da doutrina do não-senhorio. Discordei dos dispensacionalistas extremistas que relegaram seções inteiras da Escritura — incluindo o Sermão do Monte e a Oração Dominical — ao reino numa época futura. Critiquei o modo como alguns dispensacionalistas tratam a pregação e o ensino de Jesus, anulando a intenção evangelística de alguns de seus convites mais importantes. Censurei a metodologia dos dispensa-cionalistas que pretendem separar a salvação do arrependimento, a justificação da santificação, a fé das obras e o senhorio de Cristo do seu papel como Salvador, tentando separar aquilo que Deus uniu.

Vários não-dispensacionalistas sinceros aclamaram o livro como uma forte investida contra o dispensacionalismo. Eles queriam declarar morto o sistema e fazer um funeral comemorativo.

Francamente, algumas espécies híbridas de dispensacionalismo devem morrer; e ficarei feliz em unir-me ao cortejo. No entanto, é errado rejeitar o dispensacionalismo como inteiramente inválido. Meu propósito não é atacar as raízes do dispensacionalismo, e sim apelar por uma aplicação mais pura e bíblica do princípio de interpretação literal, histórico-gramatical.

Quem são os dispensacionalistas? No aspecto teológico, quase todos os dispensacionalistas são evangélicos conservadores. Nossa visão das Escrituras é muito elevada; nosso método de interpretação é consistentemente literal, e nosso zelo pelas coisas espirituais é inflamado pela nossa convicção de que estamos vivendo nos últimos dias.

Como o dispensacionalismo influencia a nossa perspectiva teológica? Obviamente, a questão central em qualquer sistema dis-pensacionalista é a escatologia ou o estudo de profecias. Todos os dispensacionalistas são pré-milenistas. OU seja, acreditam num reino futuro de Cristo aqui na terra, que durará mil anos. É isso que uma abordagem literal da profecia determina (cf. Ap 20.1-10). OS dispensacionalistas podem discordar quanto ao tempo do arrebatamento, ao número das dispensações ou outros detalhes, mas sua posição sobre o reino milenar na terra é estabelecida pelo seu modo de interpretar a Bíblia.

O dispensacionalismo também traz implicações à eclesiologia ou a doutrina da igreja, por causa da diferenciação entre a igreja e Israel. Muitos dispensacionalistas, incluindo eu mesmo, concordam que há uma conexão entre as pessoas do Antigo e as do Novo Testamento por compartilharmos uma salvação comum comprada por Jesus Cristo e da qual tomamos posse pela graça, mediante a fé. Mas os dispensacionalistas não aceitam o ensino da teologia da aliança no sentido de que a igreja é o Israel espiritual. A teologia da aliança vê uma conexão entre o ritual judaico e as ordenanças do Novo Testamento, por exemplo. No sistema deles, o batismo e a circuncisão têm a mesma importância. De fato, muitos teólogos da aliança usam a analogia da circuncisão para defender o batismo de crianças. Os dispensacionalistas, por outro lado, tendem a ver o batismo como uma ordenança só para os crentes, distinto do rito judaico.

Portanto, o dispensacionalismo dá forma à escatologia e à eclesiologia de uma pessoa. Essa é a sua amplitude. O dispensacionalismo puro não tem ramificações para as doutrinas de Deus, do homem, do pecado ou da santificação. E, o que é mais importante, o verdadeiro dispensacionalismo não faz contribuições relevantes à soteriologia ou à doutrina da salvação. Em outras palavras, numa legítima abordagem dispensa-cionalista das Escrituras, nada nos ordena definirmos o evangelho de qualquer maneira única ou diferente. De fato, se a mesma preocupação com uma hermenêutica literal que produz uma distinção entre Israel e a igreja fosse seguida consistentemente no assunto da salvação, não haveria coisas como a teologia do não-senhorio.

Qual é a conexão entre o dispensacionalismo e a doutrina do nãosenhorio?

Contudo, permanece O fato de que quase todos OS defensores da doutrina do não-senhorio são dispensacionalistas. Nenhum teólogo da aliança defende o evangelho do não-senhorio. Por quê?

Entenda, antes de tudo, que o dispensacionalismo não foi sempre bem representado por seus advogados mais entusiastas. Como observei, a singularidade do dispensacionalismo é que vemos na Escritura uma distinção entre Israel e a igreja. Essa perspectiva singular, comum a todos os dispensacionalistas, nos separa dos não-dispensacionalistas. Ela é, a propósito, o único elemento do ensino dispensacionalista tradicional que é apresentado como resultado da interpretação literal de textos bíblicos. Também é o único princípio que quase todos os dispensacionalistas têm em comum. É por isso que a escolhi como a característica que define o dispensacionalismo. Quando falo em dispensacionalismo “puro”, refiro-me a este denominador comum — a distinção entre Israel e a igreja.

Reconhecemos, porém, que a maioria dos dispensacionalistas carrega em seu sistema muito mais bagagem do que essa simples característica. Os primeiros dispensacionalistas acondicionavam freqüentemente sua doutrina em sistemas complexos e misteriosos, ilustrados por diagramas intricados. Eles carregavam seu repertório com idéias extrínsecas e ensinos românticos, alguns dos quais permanecem hoje em vários segmentos do dispensacionalismo. Os primeiros porta-vozes influentes do dispensacionalismo incluíam J. N. Darby, fundador do movimento Irmãos de Plymouth, considerado por muitos o pai do dispensacionalismo moderno; Cyris I. Scofield, autor da Bíblia de Estudo Scofield; Clarence Larken, cujo livro de quadros dispensacionalistas tem sido impresso e vendido desde 1918; e Ethelbert W. Bullinger, clérigo anglicano que levou O dispensadonalismo a um extremo sem precedentes, chamado geralmente de ultradispensacionalismo.5 Muitos desses homens eram autodidatas em teologia e profissionais em ocupações seculares. Darby e Scofield, por exemplo, eram advogados; Larkin era desenhista mecânico.

Eram leigos cujos ensinos ganharam enorme popularidade, sobretudo pelo entusiasmo do povo.

Infelizmente, alguns desses primeiros autores do dispensacio-nalismo não eram tão precisos e judiciosos como poderiam ter sido, se houvessem usufruído de uma educação teológica mais completa. Por exemplo, C. I. Scofield incluiu, em sua Bíblia de estudo, uma nota que contrasta a “obediência à lei como a condição para a salvação [no Antigo Testamento]” com a “aceitação... de Cristo” como a condição para a salvação na dispensação atual.6 Os críticos não-dispensacionalistas têm atacado o dispensacionalismo por ensinar que as condições para a salvação diferem de uma dispensação para outra. Nesse ponto, Scofield deu espaço para essa crítica, embora ele tenha reconhecido, em outros contextos, que a lei nunca foi um meio de salvação para os santos do Antigo Testamento.7

O amadurecimento do dispensacionalismo tem sido principalmente um processo de refinação, destilação, clarificação, redução e eliminação do que é estranho ou errado. Dispensacionalistas posteriores, incluindo Donald Grey Barnhouse, Wilbur Smith, Allan MacRae e H. A. Ironside, se mostraram conscientes dos enganos que prejudicaram muito do ensino dispensacionalista inicial. As obras escritas de Ironside mostram sua determinação de confrontar o erro dentro do movimento. Ele atacou o ultradispensacionalismo de Bullinger,8 criticou O ensino que relegava O arrependimento a alguma outra época9 e condenou a teologia do “cristão carnal”, que ajudou a pavimentar o caminho para a doutrina do não-senhorio radical.10 11 Os escritos de Ironside são repletos de advertências contra o antinomianismo.11

Os não-dispensacionalistas tendem a caricaturar o dispensa-cionalismo enfatizando seus excessos; e, francamente, o movimento tem produzido ensinos abomináveis. Com frequência, os dispensa-cionalistas têm sido forçados a reconhecer que algumas críticas são válidas.12 Contudo, a distinção bíblica entre Israel e a igreja permanece incontestável como a essência do dispensacionalismo puro.

Em anos recentes, o dispensacionalismo tem sido atingido por um violento ataque de criticismo, focalizando, principalmente, a paixão do dispensacionalismo pelo evangelho do não-senhorio. Uma evidência disso pode ser vista em Wrongly Dividing the Word of Truth: A Critique of Dispensationalism (Manejando Erroneamente a Palavra da Verdade: Uma Crítica ao Dispensacionalismo), escrito por John Gerstner.13 Gerstner ataca elementos do antinomianismo e da sote-riologia do não-senhorio em alguns ensinos de dispensacionalistas. Entretanto, ele pressupõe incorretamente que esses elementos são inerentes a todo o dispensacionalismo. E repudia todo o movimento por causa da teologia inferior que encontra no ensino de vários dispensacionalistas proeminentes.

Supor que o antinomianismo está no âmago da doutrina dis-pensacionalista é um equívoco grave. Além disso, é injusto retratar todos os dispensacionalistas como teólogos ingênuos ou negligentes. Muitos estudantes das Escrituras hábeis e perspicazes têm abraçado o dispensacionalismo e evitado o antinomianismo, o extremismo e outros erros. Os homens que me ensinaram no seminário eram todos dispensacionalistas. Contudo, nenhum deles defenderia a teologia ensino do não-senhorio.14

No entanto, ninguém pode negar que o dispensacionalismo e o antinomianismo têm sido, com freqüência, defendidos pelas mesmas pessoas. Todos os argumentos recentes que têm sido apresentados em defesa da teologia do não-senhorio estão arraigados em idéias popularizadas por dispensacionalistas. Todos os principais proponentes da teologia contemporânea do não-senhorio são dispensacionalistas. A controvérsia do senhorio é apenas a ponta de um iceberg, comparada às tensões que sempre existiram na comunidade dispensacionalista. Isso é essencial para uma compreensão clara de toda a controvérsia.

Assim, para avaliarmos com precisão alguns dos princípios mais importantes do evangelho do não-senhorio, devemos entender sua relação com a tradição dispensacionalista.

Frivolamente a palavra?

Para alguns dispensacionalistas, a distinção entre Israel e a igreja é apenas o ponto de partida. Sua teologia é carregada de contrastes semelhantes: igreja e reino, crentes e discípulos, velha natureza e nova natureza, fé e arrependimento. Obviamente, há muitas distinções importantes e legitimas encontradas na Escritura e na teologia sã; antiga aliança e nova aliança, lei e graça, fé e obras, justificação e santificação. Mas os dispensacionalistas tendem geralmente a exagerar nos contrastes legítimos. A maioria dos dispensacionalistas que acredita na doutrina do não-senhorio imagina, por exemplo, que lei e graça são mutuamente opostas ou que a fé e as obras são, de algum modo, incompatíveis.

Alguns dispensacionalistas aplicam 2 Timóteo 2.15 (“Procura apresentar-te a Deus aprovado, como obreiro que não tem de que se envergonhar, que maneja bem a palavra da verdade” — ênfase acrescentada) como se a palavra-chave fosse maneja, em vez de bem. A tendência dispensacionalista de manejar e contrastar tem levado alguns a uma exegese engenhosa. Alguns dispensacionalistas ensinam, por exemplo, que “o reino dos céus” e “o reino de Deus” falam de domínios diferentes.15 Contudo, os termos são claramente sinônimos nas Escrituras, conforme mostra uma comparação de Mateus e Lucas (Mt 5.3, Lc 6.20; Mt 10.7, LC 10.9; Mt 11.11, Lc 7.28; Mt 11.12, Lc 16.16; Mt 13.11, Lc 8.10; Mt 13.31-33, Lc 13.18-21; Mt 18.4, Lc 18.17; Mt 19.23, Lc 18.24). Mateus é o único livro em toda a Bíblia que usa a expressão “reino dos céus”. Mateus, escrevendo para um público maiormente judeu, compreendeu a sensibilidade deles quanto ao uso do nome de Deus. Ele empregou o eufemismo comum; céus. Assim, o reino dos céus é o reino de Deus.

A tendência de opor verdades paralelas está no âmago da teologia do nãosenhorio. O senhorio de Jesus e seu papel como Salvador são separados um do outro, tornando possível alegar que Ele é Salvador, enquanto é rejeitado como Senhor. A justificação é separada da santificação, legitimando a noção de salvação sem transformação. Os crentes comuns são segregados como discípulos, criando duas classes de cristãos, OS carnais e OS espirituais. A fé é colocada em oposição à obediência, anulando o aspecto moral do crer. A graça torna-se a antítese da lei, oferecendo a base para um sistema inerentemente antinomiano.

A dicotomia graça-lei merece uma análise melhor. Muitos dos primeiros sistemas dispensacionalistas não eram claros no que diz respeito ao papel da graça na organização mosaica e ao lugar da lei na dispensação atual. Como observei, Scofield deixou uma impressão inadequada de que os santos do Antigo Testamento eram salvos por guardarem a lei. O aluno mais famoso de Scofield foi Lewis Sperry Chafer, co-fundador do Seminário Teológico de Dallas. Chafer, um autor prolífico, escreveu a primeira teologia sistemática integral do dispensacionalismo. O sistema de Chafer se tornou padrão para várias gerações de dispensacionalistas formados em Dallas. Entretanto, Chafer repetiu o erro de Scofield. No sumário sobre a justificação, ele escreveu:

De acordo com o Antigo Testamento, os homens eram justos por serem sinceros e fiéis no cumprimento da lei mosaica. Miquéias define essa vida nos seguintes termos: “Ele te declarou, ó homem, o que é bom e que é o que o SENHOR pede de ti: que pratiques a justiça, e ames a misericórdia, e andes humildemente com o teu Deus" (6.8). Portanto, os homens eram justos por causa de suas próprias obras para Deus, enquanto a justificação no Novo Testamento é a obra de Deus para o homem em resposta à fé (Rm 5.1).16

Embora Chafer tenha negado, em outro trecho de sua obra, que ensinava formas múltiplas de salvação, é evidente que ele criou um grande abismo entre a graça e a lei. Ele acreditava que a lei do Antigo

Testamento impunha “uma obrigação de ganhar mérito” diante de Deus.17 Por outro lado, Chafer acreditava que a graça livra os filhos de Deus “de cada aspecto da lei — como uma lei de vida, como uma obrigação de nos tornarmos aceitáveis a Deus e como uma dependência da carne impotente”.18 “Os ensinos da graça não são leis; são sugestões. Não são exigências, são súplicas”, Chafer escreveu.19

No sistema de Chafer, Deus parece flutuar entre as dispensações da lei e as dispensações da graça. A graça era a regra da vida de Adão até Moisés. A

“lei pura” assumiu o controle quando uma nova dispensação começou no Sinai. Na atual dispensação, a “graça pura” é a regra. O reino no milênio será outra dispensação da “lei pura”. Evidentemente, Chafer acreditava que a graça e a lei não poderiam coexistir e, assim, pareceu eliminar uma ou outra de cada dispensação. Ele escreveu:

Tanto a época anterior à cruz como a época posterior ao retorno de Cristo representam o exercício da lei pura, enquanto o período entre as duas épocas representa o exercício da graça pura. É imperativo, portanto, que não haja uma mistura negligente desses grandes elementos caracterizadores de épocas. Do contrário, perde-se a preservação das distinções mais importantes nos vários relacionamentos entre Deus e o homem; e o reconhecimento da verdadeira força da morte de Cristo e da sua segunda vinda é obscurecido.20

Ninguém nega que as Escrituras contrastam claramente a lei com a graça. João 1.17 diz: “Porque a lei foi dada por intermédio de Moisés; a graça e a verdade vieram por meio de Jesus Cristo”. Romanos 6.14 diz: “Não estais debaixo da lei, e sim da graça”. A distinção entre lei e graça é óbvia na Escritura.

NO entanto, a graça e a lei operam em cada dispensação. A graça é e sempre tem sido O único meio de salvação eterna. O ponto principal de Romanos 4 é que Abraão, Davi e todos os outros santos do Antigo Testamento foram justificados pela graça, mediante a fé, e não porque guardaram a lei.21 O apóstolo Paulo acreditava que podemos anular a lei nesta época de graça pura? A resposta de Paulo a esta pergunta foi inequívoca: “Não, de maneira nenhuma! Antes, confirmamos a lei” (Rm 3.31).

Honestamente, é importante observar que, pressionado a respeito dessa questão, Chafer reconheceu que a graça de Deus e O sangue de Cristo eram O único fundamento sobre O qual pecadores poderiam ser salvos em qualquer época.22 Devemos enfatizar, porém, que Chafer, Scofield e outros que seguiram a orientação deles insistiram muito nas diferenças entre as dispensações do Antigo e do NOVO Testamento. Desejando evitar O que pensava ser “uma mistura negligente” da lei com a graça, Chafer acabou ficando com uma “época da lei” que é legalista e uma “época da graça” que parece antinomianismo.

O próprio Chafer era um homem piedoso, comprometido com a santidade e com os altos padrões do viver cristão. Na prática, ele nunca fecharia os olhos para a carnalidade. Mas seu sistema dispen-sacionalista — com as inflexíveis dicotomias que introduzia, seus “ensinos da graça” que eram “sugestões” e não exigências e seu conceito de graça “pura” que se mantinha em oposição a qualquer tipo de lei prepararam O caminho para uma qualidade de cristianismo que tem legitimado O comportamento negligente e carnal.

Chafer poderia ser chamado corretamente de pai da teologia do nãosenhorio no século XX. Ele alistou o arrependimento e a rendição como dois dos “aspectos mais comuns da responsabilidade humana que, com muita freqüência, são acrescentados erroneamente à única exigência de fé ou crença”.23 Ele escreveu: “Impor uma necessidade de render a vida a Deus como condição adicional à salvação é irracional. O chamado de Deus aos não-salvos nunca é para que eles fiquem sob o senhorio de Cristo, e sim para que fiquem sob a sua graça salvadora”.24 “Além da própria sã doutrina, não há sobre o pregador obrigação mais importante do que pregar o senhorio de Cristo exclusivamente para os cristãos e proclamar para os nãosal-vos a salvação que há em Cristo.”25

É importante observar que, ao escreveu essas coisas, Chafer estava argumentando contra o Movimento de Oxford, uma heresia popular, mas perigosa, que estava levando os protestantes de volta ao legalismo e à justiça do catolicismo romano. Chafer escreveu:

O erro de impor o senhorio de Cristo sobre os não-salvos é desastroso... está em circulação uma heresia destrutiva sob o nome de Movimento de Oxford; essa heresia se especializa nesse erro perigoso, mas é diferente pelo fato de que os promotores do movimento omitem completamente a idéia de crer em Cristo para a salvação e promovem exclusivamente a obrigação de renderse a Deus. Eles substituem conversão por consagração, fé por fidelidade e crer para a vida eterna por beleza da vida cotidiana. Como pode ser facilmente percebido, o plano desse movimento é ignorar a necessidade da morte de Cristo como o fundamento da regeneração e perdão e promover a heresia desprezível de que não importa se uma pessoa erê na salvação que há em Cristo, contanto que sua vida diária seja dedicada ao serviço de Deus... A tragédia é que aqueles que abraçam essa ilusão provavelmente nunca serão libertos por uma fé verdadeira em Cristo como Salvador. Hoje, não existe um exemplo mais completo de “um cego guiando outro" do que o exemplo apresentado por este movimento.26

No entanto, Chafer prescreveu o remédio errado para os ensinos falsos do Movimento de Oxford. Para responder a um movimento que omite “completamente a idéia de crer em Cristo para a salvação" e promove “exclusivamente a obrigação de render-se a Deus", Chafer imaginou uma noção de fé que despoja a crença de qualquer sugestão de rendição. Embora o movimento ao qual ele se opunha fosse um erro pérfido, infelizmente Chafer lançou as bases para o erro oposto, produzindo resultados igualmente devastadores.

A noção de fé sem arrependimento e sem rendição se encaixa bem no conceito de Chafer de uma época de “graça pura". Por isso, tal noção foi absorvida e expandida por aqueles que desenvolveram sua teologia de acordo com o modelo de Chafer. E a noção persiste até hoje como a base de todo o ensino do não-senhorio.

Outro resultado infeliz da divisão rígida que Chafer definiu entre a “época da lei" e a “época da graça" foi o seu efeito na percepção dele quanto às Escrituras. Chafer acreditava que “os ensinos da lei, os ensinos da graça e os ensinos do reino são sistemas separados e completos de governo divino".27 Em harmonia com isso, ele consignava o Sermão do Monte e a Oração Dominical à época do reino futuro, concluindo que as únicas passagens das Escrituras diretamente aplicáveis a esta época da graça são “porções dos evangelhos, porções do livro de Atos e as epístolas do NOVO Testamento”28 — OS “ensinos da graça”. Como alguém sabe que porções dos evangelhos e de Atos são os “ensinos da graça” destinados a esta época? Chafer foi vago:

Os ensinos da graça não são isolados por conveniência no Texto Sagrado. As três ordens aparecem nos quatro evangelhos. Os ensinos da graça devem ser identificados por seu caráter intrínseco onde quer que sejam achados. Grandes porções do Novo Testamento são completamente reveladoras da doutrina da graça. Ao estudante, assim como a Timóteo, é ordenado que se dedique para ser um obreiro aprovado por Deus no assunto de manejar corretamente as Escrituras.28 29

Em outras palavras, há muito ensino sobre a lei e sobre o reino misturado no Novo Testamento. E tal ensino não está identificado explicitamente para nós, mas podemos cair em erro se tentarmos aplicá-lo de modo incorreta à nossa época. Portanto, as Escrituras são como um quebra-cabeça. Devemos discernir e categorizá-las adequadamente. Podemos fazer isso apenas pelo “seu caráter intrínseco”.

Chafer estava certo sobre uma coisa: muitos, senão a maioria, dos ensinos terrenos de Cristo não são aplicáveis ao cristão nesta época:

Há um sentimento perigoso e totalmente infundado em circulação, o qual supõe que cada ensino de Cristo deve ser obrigatório durante esta época simplesmente porque foi Cristo quem disse. Ignora-se o fato de que Cristo, enquanto vivia sob a lei de Moisés, guardando-a e aplicando-a, também ensinou os princípios de seu reino futuro. E, ao fim de seu ministério e em relação a sua cruz, também introduziu os ensinos da graça. Se não reconhecemos essa divisão tripla dos ensinos de Cristo, não haverá nada além de confusão e conseqüente contradição da verdade.30

Os dispensacionalistas que seguem Chafer nesse ponto manejam mal a Palavra da verdade, atribuindo seções completas do Novo Testamento a alguma outra dispensação e anulando a força dos maiores segmentos dos evangelhos, bem como do ensino de nosso Senhor para hoje.31

Nota do Editor: Conquanto não vejamos base bíblica segura para afirmar o dispensacionalismo e entendamos que as Escrituras apontam para a teologia da aliança como a estrutura correta para entendermos a revelação progressiva de Deus, entendemos que este apêndice seria de utilidade para o leitor comprrender melhor a posição do autor e o resumo que este faz do sistema dispensacionalista.

Esta é está a principal inconsistência que vejo na abordagem da aliança: todos reconhecemos que as promessas de juízo sobre Israel cumpriram-se em termos literais. Mas a teologia da aliança torna a igreja o recipiente das bênçãos prometidas a Israel, que devem ser espiritualizadas para serem aplicadas à igreja. Parece-me que a coerência exigiria o seguinte: se as promessas de juízo cumpriram-se em termos literais, as bênçãos também devem cumprir-se em termos literais.

Ver o capítulo “How Shoul We Interpret the Bible?”, em meu livro Charismatic Chaos (Grand Rapids, Mich.: Zondervan, 1991), p. 85-105.

RYRIE, Charles C. Dispensationalism today. Chicago: Moody, 1965. p. 47.

O ultradispensacionalismo é repudiado pela maioria dos dispensacionalistas (cf. ibid., p. 192- 205).

SCOFIELD, C. I. The Scofield reference Bible. New York: Oxford, 1917. p. 1115.

Em uma nota sobre Êxodo 19.3, que descreve a outorga da lei a Moisés, Scofield escreveu: “A lei não é proposta como um meio de vida, e sim como um meio pelo qual Israel pode tornar-se um ‘tesouro peculiar' e um ‘reino de sacerdotes'” (Ibid., p. 93).

IRONSIDE, H. A. Wrongly dividing the word of truth. New York: Loizeaux Brothers, 1938.

_. Except ye repent. Grand Rapids: Mich.: Zondervan, 1937.

_. Eternal security of believers. New York: Loizeaux Brothers, 1934.

Ver, por exemplo:_.    Full    assurance. Chicago: Moody, 1937. p. 64, 77-87.

_.    Holiness: the false and the true. Neptune, N. J.: Loizeaux Brothers, 1912. p.

121-126.

Ryrie, por exemplo, admitiu em Dispensationalism Today que Scofield fizera “afirmações descuidadas” sobre a soteriologia dispensacionalista e que os dispensaciona-listas transmitem geralmente uma impressão errônea sobre o papel da graça na era do Antigo Testamento (112, 117).

Brentwood, Tenn.: Wolgemuth & Hyatt, 1991. Cf. MAYHUE, Richard L. Who is wrong? a review of John Gerstner's wrongly dividing the Word of Truth. Master’s Seminary Journal, Sun Valley, v. 3, n. 1. p. 73-94, Spring 1992.

Além disso, todos os professores no The Master's Seminary são dispensacionalistas. Nenhum de nós defende qualquer uma das visões antinomianas que o Dr. Gerst-ner alega serem comuns a todos os dispensacionalistas.

SCOFIELD, C. I. The Scofield reference Bible. New York; Oxford, 1917. p. 1003.

CHAFER, Lewis S. Systematic Theology, 8 v. Dallas: Seminary Press, 1948. 7:219. Ênfase acrescentada.

Ibid. 7:179.

_. Grace. Wheaton, Ill.: Van Kampen, 1922. p. 344.

Ibid.

Ibid. p. 124. Ênfase acrescentada.

Gálatas 3 também deixa claro que nunca foi a intenção de Deus que a justiça viesse mediante a lei ou que a salvação fosse obtida por meio da obediência (cf., especialmente, vv. 7, 11). A lei serviu como aio para levar as pessoas a Cristo (v. 24). Portanto, mesmo no Antigo Testamento, as pessoas eram salvas por causa da fé, e não por causa da obediência à lei (cf. Rm 3.19-20).

CHAFER, Lewis S. Dispensational distinctions denounced”. Bibliotheca Sacra. Dallas, v. 101, p. 259, July 1944.

_.    Systematic    theology,    8    v.    Dallas:    Seminary    Press,    1948.    3:372.

Ibid. 3:385.

Ibid. 3:387.

Ibid. 3:385-386.

Ibid. 4:225.

Ibid. 4:206.

Ibid. 4:185.

Ibid. 4:224.

Os ultradispensacionalistas levam a metodologia de Chafer ao extremo. Observando que o apóstolo Paulo chamou a igreja de mistério que, “em outras gerações, não foi dado a conhecer aos filhos dos homens, como, agora, foi revelado aos seus santos apóstolos e profetas, no Espírito” (Ef 3.5), eles concluem que a era da igreja não começou até este ponto no ministério de Paulo. Assim, anulam todo o Novo Testamento, exceto as epístolas que Paulo escreveu enquanto estava na prisão.

Que evangelho devemos pregar hoje?

Há pouco tempo recebi um artigo divulgado amplamente por um dispensacionalista bem conhecido. Ele escreveu: “O Dr. MacAr-thur estava correto em intitular seu livro de O Evangelho Segundo Jesus. O evangelho que Jesus ensinou em sua humilhação, anterior à sua crucificação, como o Messias de Israel, para pessoas da aliança que viviam sob a lei era, em todas as intenções e propósitos, a salvação por senhorio”. Mas ele acrescentou: “A salvação por senhorio está baseada no evangelho segundo Jesus, João Batista e os primeiros discípulos. Esse evangelho é direcionado à nação pactual de Israel... O evangelho do reino do Senhor Jesus não tem absolutamente nada a ver com os cristãos ou com a igreja”.

O artigo cita muitos trechos dos escritos do Dr. Chafer, tentando mostrar que o evangelho de Jesus “estava no nível da lei e do reino terreno” e não tem nada a ver com a graça ou a dispensação atual. O autor do artigo observou que eu escrevi: “Num preocupan- te número de frontes, a mensagem que está sendo proclamada hoje não é o evangelho segundo Jesus”; ao que ele respondeu: “Como isso é verdade! Hoje devemos ministrar o evangelho de Paulo: ‘Pela graça sois salvos, mediante a fé’... não o evangelho do Senhor Jesus relacionado ao reino teocrático orientado pela lei”.

O autor do artigo continuou: “A pessoa convertida mediante o evangelho segundo Jesus tornou-se um filho do reino [e não um cristão]. E a autoridade divina sempre será a força motriz em seu coração — o Espírito que habita nele escreve a lei em seu coração para capacitá-lo a render-se ao reino teocrático, a permanecer sob o governo do seu Rei... [Mas o cristão] não está sob autoridade, ele não está buscando obedecer — a menos que esteja sob a lei, conforme descrito em Romanos 7. Para ele, viver é Cristo, e esta vida não é uma vida sob autoridade... Paulo oferecia uma salvação completamente diferente”.

Nesse artigo se acham, tão claras quanto pode ser afirmadas, todas as loucuras que corromperam o dispensacionalismo, sintetizadas num único sistema. Pode-se ver um antinomianismo ostensivo: “O cristão... não está sob autoridade, ele não está buscando obedecer”; maneiras múltiplas de salvação: “Paulo oferecia uma salvação completamente diferente”; uma abordagem fragmentada das Escrituras: “O evangelho do reino do Senhor Jesus não tem absolutamente nada a ver com os cristãos ou com a igreja”; e a tendência de dividir e desconectar idéias relacionadas: “Hoje devemos ministrar o evangelho de Paulo... não o evangelho do Senhor Jesus”.

Observe com cuidado: esse homem reconhece que o evangelho de Jesus exigia rendição ao seu senhorio. O objetivo dele é dizer que a mensagem de Jesus não tem relevância para a nossa época. Ele acredita que os cristãos de hoje devem proclamar um evangelho diferente do que Jesus pregou. Imagina que o convite de Jesus era de natureza diferente da mensagem que a igreja é chamada a proclamar; e acredita que devemos pregar um evangelho diferente.

Nenhuma dessas idéias é nova OU incomum na comunidade dispensacionalista. Podemos seguir o rasto delas até chegarmos a um ou mais dos primeiros porta-vozes dispensacionalistas. Contudo, está na hora de serem abandonadas.

Honestamente, devemos observar que o artigo citado expressa posições um tanto extremas. A maioria dos principais defensores da evangelizaçâo do nâo-senhorio talvez não concorde com a qualidade de dispensacionalismo desse homem. Mas a teologia do não-se-nhorio que eles defendem é precisamente o resultado desse tipo de ensino. Não basta abandonarmos as formas rígidas de dispensa-cionalismo extremo; precisamos abandonar também as tendências antinomianas.

A disciplina cautelosa que tem caracterizado tanto de nossa tradição teológica posterior à Reforma tem de ser guardada com cuidado. Os defensores da salvação sem senhorio apóiam-se muito nas suposições de um sistema teológico predeterminado. Eles acham freqüentemente apoio em supostas distinções dispensacionalistas (salvação/discipulado, crentes carnais/crentes espirituais, evangelho do reino/evangelho da graça, fé/arrependimento). Ficam enredados com pensamentos “e se” e com ilustrações. Tendem a ceder a análises racionais, em vez de cederem a análises bíblicas. Quando lidam com as Escrituras, são muito inclinados a permitir que seu sistema teológico dite seu entendimento do texto. Como resultado, adotam regularmente interpretações incomuns das Escrituras para fazê-las conformar-se à sua teologia.

É apropriado lembrar isto: nossa teologia deve ser bíblica, antes de ser sistemática. Devemos começar com uma interpretação correta da Escritura e, a partir dessa interpretação, formular a nossa teologia. Não devemos ler na Palavra de Deus pressuposições infundadas. A Escritura é o único padrão correto pelo qual podemos medir a exatidão de nossa doutrina.

O dispensacionalismo está numa encruzilhada. A controvérsia da salvação por senhorio representa O sinal em que a estrada se divide. Uma seta aponta para a ortodoxia bíblica. A outra seta, intitulada “não-senhorio”, aponta o caminho do antinomianismo sub-cristão. Os dispensacionalistas que estão considerando esse caminho fariam bem se parassem e examinassem o mapa de novo.

O único mapa confiável é a Escritura, e não os diagramas dispensacionalistas de alguém. O dispensacionalismo, como movimento, deve chegar a um consenso baseado unicamente na Palavra de Deus. Não podemos continuar pregando evangelhos diferentes para um mundo que já está confuso.

www.gty.org

Apêndice 3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O quadro comparativo desta aula coloca lado a lado a fé que envolve compromisso pessoal com Cristo e a fé que é apenas crer em fatos sobre Ele; ao se enxergar nessas colunas, qual delas descreve com mais honestidade a fé que você de fato exerce?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A comparação afirma que a fé genuína produz inevitavelmente uma vida mudada, enquanto outras posições admitem o cristão sem nenhum fruto visível; quando você examina a sua vida, há transformação real que comprove a sua fé ou você esperaria estar entre os que não mudaram?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O quadro contrasta a rendição incondicional ao senhorio de Cristo com a ideia de que a submissão não é necessária para a vida eterna; em quais áreas concretas você ainda mantém o seu coração contra a autoridade Dele, mesmo professando ser cristão?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Vozes do passado$t$, 14,
$conteudo$Zane Hodges alega que a salvação por senhorio está impelindo a igreja para trás, à Idade das Trevas. Ele faz a seguinte alegação:

Pode até ser dito que a salvação por senhorio lança um véu de obscuridade sobre toda a revelação do Novo Testamento. No processo, a maravilhosa verdade da justificação pela fé, sem as obras, retrocede em sombras não diferentes daquelas que entenebreceram os dias anteriores aos da Reforma.

O que substitui essa doutrina é um tipo de combinação de fé e obras que não difere significativamente do dogma oficial dos católicos romanos (AF 19-20).

Em outro lugar, Hodges escreveu: “Digamos com clareza: a salvação por senhorio defende uma doutrina de fé salvífica que está em conflito com a de Lutero, Calvino e, mais importante ainda, com a doutrina da Palavra de Deus” (AF 209, ênfase no original).

Os professores da doutrina do não-senhorio alegam geralmente que são os verdadeiros herdeiros da Reforma. Muitos têm repetido a acusação corriqueira de que a salvação por senhorio está “pavimentando o caminho de volta a Roma”. Eles citam os grandes reformadores de modo seletivo em assuntos de fé e segurança, depois fazem a sugestão absurda de que a teologia do não-senhorio se “alinha confortavelmente com Calvino, com Lu-tero e muitos de seus sucessores”.1

É extremamente difícil entender como alguém que, de algum modo, conhece a literatura da Reforma pode fazer tal alegação. Os escritos de Lutero e Calvino são repletos de materiais que argumentam explicitamente contra muitos dos erros que a teologia do não-senhorio adota. Em nenhum trecho de seus escritos, encontramos qualquer apoio para a idéia de que a pessoa justificada pode permanecer sem santificação. Esse é um tópico sobre o qual os reformadores tinham muito a dizer.

Por que não deixar que eles falem por si mesmos?

Lutero, sobre a justificação pela fé

A descoberta de Martinho Lutero quanto à verdade bíblica da justificação pela fé iniciou a Reforma. Observe como Lutero lutou contra a noção de que a fé verdadeira pode coexistir com um padrão permanente de vida profana:

A fé verdadeira, sobre a qual falamos, não pode ser produzida pelos nossos próprios pensamentos, pois ela é uma obra exclusiva de Deus em nós, sem qualquer assistência de nossa parte. Como Paulo diz aos Romanos, é o dom e a graça de Deus, obtida por um homem, Cristo. Portanto, fé é algo muito poderoso, ativo, que não pára, eficaz, que renova, de uma vez, uma pessoa e regenera-a novamente, conduzindo-a a uma nova forma e natureza de vida, de modo que é impossível não fazer o bem sem cessar.

Assim como para a árvore é natural produzir fruto, assim também é natural para a fé produzir boas obras. E, como é desnecessário mandar que uma árvore produza frutos, também não há necessidade de ordenar os crentes, como Paulo diz [1 TS 4.9], nem de incitá-los a fazer o bem, porque eles o fazem por si mesmos, livre e naturalmente; assim como, sem receber ordens, eles dormem, comem, bebem, vestem-se, ouvem, falam, vão e vêm.

Quem não tem esta fé fala somente coisas inúteis a respeito dela e das obras e não sabe o que diz ou para onde se inclina o que diz. Ele não a recebeu. Joga com mentiras e, quanto aos trechos das Escrituras que falam de fé e obras, aplica-os aos seus próprios sonhos e pensamentos falsos, os quais são puramente obra humana, enquanto as Escrituras atribuem tanto a fé quanto as boas obras não a nós mesmos, mas somente a Deus.

Essas não são pessoas desvirtuadas e cegas? Ensinam que não podemos fazer uma boa obra por nós mesmos e, em sua presunção, vão à obra e arrogam para si mesmos a mais elevada de todas as obras de Deus, ou seja, a fé, a fim de produzi-la, ele mesmos, a partir de seus próprios pensamentos pervertidos. Por isso, eu disse que devemos deixar de confiar em nós mesmos e orar a Deus por fé, como os apóstolos o fizeram em Lucas 17.5. Quando temos fé, não precisamos de nada mais, pois ela traz consigo o Espírito Santo, que não somente nos ensina todas as coisas, mas também nos estabelece firmemente na fé e nos conduz da morte e do inferno para o céu.

Agora observe, temos dado essas respostas, que as Escrituras possuem tais passagens concernentes a obras, por causa desses sonhadores e da fé forjada, não para ensinar que o homem deve tornar-se bom mediante as obras, mas que, por elas, o homem deve provar e ver a diferença entre a fé falsa e a verdadeira. Onde quer que a fé seja correta, ela faz o bem. Se ela não o faz, certamente é um sonho e uma idéia falsa de fé. Então, embora o fruto na árvore não torne a árvore boa, ele prova e testifica externamente que ela é boa, como

Cristo disse: “Pelos seus frutos OS eonheeereis”. Assim, devemos também conhecer a fé por seus frutos.

A partir disso você percebe que há grande diferença entre ser bom e ser conhecido como bom ou tornar-se bom e provar e mostrar que você é bom. A fé faz o bem, mas as obras provam que a fé e a bondade estão corretas. Assim as Escrituras falam, de modo simples, o que prevalece entre as pessoas comuns, como um pai diz ao filho: “Vá, seja misericordioso, bom e amável para com esta ou aquela pessoa pobre". Ele não manda que o filho seja misericordioso, bom e amável; mas, porque o filho já é bom e misericordioso, exige que ele também mostre e prove, de modo visível, ao pobre, mediante esse ato, a fim de que a bondade que ele possui em si mesmo também seja conhecida pelos outros e lhes seja útil.

Você deve explicar que em todas as passagens da Escritura referentes às obras Deus deseja, por meio delas, que a bondade recebida em fé se expresse, prove a si mesma e se torne um benefício para os outros, de modo que a falsa fé se torne conhecida e seja desarraigada do coração. Deus não concede sua graça ao homem para que ela permaneça inativa, sem nada realizar, mas para que produza frutos e que, ao ser conhecida de público e provada externamente, conduza todos a Deus, como Cristo disse: “Assim brilhe também a vossa luz diante dos homens, para que vejam as vossas boas obras e glorifiquem a vosso Pai que está nos céus" (Mt 5.16). Do contrário, a luz seria um tesouro enterrado e uma luz escondida. Que proveito há em qualquer dessas coisas? Sim, não somente a luz se torna conhecida pelos outros, mas também nos certificamos de que somos sinceros, como Pedro diz: “Por isso, irmãos, procurai, com diligência cada vez maior, confirmar a vossa vocação e eleição" (2 Pe 1.10). Quando as obras não vêm em seguida, um homem não pode saber se a sua fé está correta; sim, ele pode estar certo de que sua fé é um sonho e não correta como deveria ser. Assim, Abraão teve certeza de sua fé e de que temia a Deus quando ofereceu seu filho em sacrifício e Deus, por intermédio do anjo, lhe disse: “Agora sei que temes a Deus, porquanto não me negaste o filho, o teu único filho” (Gn 22.12).

Então, fiel à verdade, esse homem é, internamente, em espírito, diante de Deus, justificado pela fé somente, sem obras; mas, externa e publicamente, diante dos homens e de si mesmo, é justificado por obras, é de coração um crente honesto e piedoso. Uma você pode chamar de justificação pública ou exterior; a outra, de justificação interior, no sentido de que a justificação pública ou exterior é apenas o fruto, o resultado e a prova da justificação no coração, e no sentido de que um homem não se torna justo diante de Deus por causa desse fruto, mas tem de ser, antes, justo diante dEle. Assim, você pode chamar o fruto da árvore de boa obra pública ou externa da árvore; e isso é apenas o resultado e a prova de sua bondade interior e natural.

Era isso que Tiago queria dizer quando escreveu em sua epístola: “A fé sem obras é morta” (2.26). Ou seja, quando as obras não seguem a fé, isto é um sinal indubitável de que não existe fé, mas apenas um pensamento e um sonho vazios, que são chamados falsamente de fé...

...Visto que as obras seguem naturalmente a fé, conforme disse, não é necessário ordenarmos que elas aconteçam (pois é impossível à fé não realizá-las, mesmo que não haja ordem), a fim de aprendermos a distinguir a fé falsa da verdadeira.2

Calvino, sobre a natureza da fé

João Calvino defendia-se vigorosamente daqueles que “incitavam ódio” quanto à doutrina da justificação pela fé, por afirmarem que aqueles que a ensinam “destroem as boas obras e estimulam

O pecado”.3 Ele escreveu; “Reconhecemos que a fé e as obras estão necessariamente conectadas”.4 Calvino debateu com um cardeal católico sobre este assunto;

Se você quer entender devidamente quão inseparáveis são a fé e as obras, olhe para Cristo... Onde não há O zelo pela integridade e pela santidade, ali não há nem O Espírito de Cristo nem O próprio Cristo. E, onde quer que Cristo não esteja, ali não há justiça e, também, não há fé, pois esta não pode assimilar a Cristo como justiça sem O Espírito de santificação.5

Calvino criticou O movimento escolástico da Igreja de Roma por causa de sua definição de fé. Os escolásticos ensinavam que há um tipo de “fé” que não possui efeito transformador nas afeições ou no comportamento dos que “crêem”. Essa “fé”, ensinavam eles, existe em pessoas que não desejam a santidade e O amor por Deus. Calvino ficou escandalizado com essa sugestão. Veja sua crítica violenta contra esse erro;

Devo refutar a distinção fútil dos escolásticos quanto à fé formada e a fé não formada. Eles imaginam que pessoas sem o temor de Deus e sem senso de piedade podem crer em tudo que é necessário alguém saber para ter a salvação; como se O Espírito Santo não fosse a testemunha de nossa adoção pela iluminação de nosso coração para a fé. Contudo, embora toda a Escritura esteja contra eles, eles dão dogmaticamente o nome de fé a uma persuasão destituída do temor de Deus. Na refutação da definição deles, não é necessário ir mais além do que apenas afirmar a natureza da fé tal como é declarada na Palavra de Deus. Com base nisso, ficará evidente o modo inexperiente e absurdo como eles balbuciam sobre o assunto, em vez de discorrerem-no. Já fiz isso em parte, mas acrescentarei posteriormente o que resta, em seu devido lugar. No presente, digo que não pode ser imaginado nada mais absurdo do que a ficção deles. Eles insistem em que a fé é uma aceitação pela qual qualquer desdenhador de Deus pode receber o que é ensinado na Escritura. Mas primeiro devemos comprovar se alguém pode, por suas próprias forças, adquirir a fé ou se o Espírito Santo, por meio dela, se torna a testemunha da adoção. Conseqüentemente, é uma trivialidade neles indagar se a fé formada pelo amor subseqüente é a mesma ou uma fé nova e diferente. Ao falarem assim, eles mostram claramente que nunca pensaram no dom especial do Espírito, visto que um dos primeiros elementos da fé é a reconciliação implícita no aproximar-se o homem de Deus. Se ponderassem devidamente a afirmação de Paulo: “Com o coração se crê para justiça” (Rm 10.10), eles parariam de sonhar com esta condição frígida. Há uma consideração que deve acabar, de uma vez por todas, o debate — essa aceitação (como já observei e ilustrarei depois mais completamente) é, em si mesma, mais uma questão do coração do que da cabeça, da afeição do que do intelecto... A aceitação em si mesma, pelo menos como a Escritura a descreve, consiste em afeição piedosa. Mas temos um argumento ainda mais claro. Visto que a fé aceita a Cristo como Ele é oferecido pelo Pai — e Ele é oferecido não somente para a justificação, o perdão dos pecados e a paz, mas também para a santificação, como a fonte de águas vivas — é certo que nenhum homem jamais o conhecerá corretamente sem, ao mesmo tempo, receber a santificação do Espírito; ou, explicando a questão em forma mais simples, a fé consiste no conhecimento de Cristo. Cristo não pode ser conhecido sem a santificação de seu Espírito. Portanto, a fé não pode ser separada da afeição piedosa.

...Embora, ao discorrer sobre a fé, admitamos que ela possui uma variedade de formas, quando nosso objeto é mostrar que tipo de conhecimento de Deus o perverso possui, defendemos e mantemos, de acordo com a Escritura, que apenas o piedoso tem fé.

...Foi dito que Simão, o mago, creu, embora logo depois tenha dado provas de sua incredulidade (At 8.13-18). A respeito da fé atribuída a ele, não concordamos com algumas pessoas a respeito de haver ter meramente fingido uma fé que não existia em seu coração. Em vez disso, pensamos que, dominado pela majestade do evangelho, ele produziu algum tipo de aceitação e chegou ao ponto de reconhecer a Cristo como autor da vida e da salvação e de apropriar-se prontamente do nome dEle. De maneira semelhante, no Evangelho de Lucas, lemos que acreditam por algum tempo aqueles em quem a semente da Palavra é sufocada, antes de produzir frutos, ou em quem, por não haver profundidade de terra, ela logo seca. Tais pessoas, não duvidamos, recebem a Palavra com ansiedade, com um tipo de prazer, e sentem um pouco de seu poder divino, de modo que não somente me enganam, com uma falsa semelhança de fé, mas enganam também a si mesmas. Imaginam que a reverência que prestam à Palavra é piedade genuína, pois não têm idéia de qualquer outra piedade além da que consiste em desprezo aberto e declarado. Mas, qualquer que seja essa aceitação, ela não penetra, de modo nenhum o coração, para ter ali um lugar fixo. Embora, às vezes, ela pareça ter fincado suas raízes, essas raízes não têm vida em si. O coração humano tem muitos recessos para a vaidade, tantos lugares secretos para a falsidade; é tão encoberto de fraude e hipocrisia, que freqüentemente engana a si mesmo. Aqueles que se gloriam em tais aparências de fé saibam que, neste aspecto, não são nem um pouco superiores aos demônios.

...Enquanto isso, os crentes são instruídos a que examinem a si mesmos cuidadosa e humildemente, a fim de que nenhuma segurança carnal se arraste para o íntimo deles e tome o lugar da segurança da fé. Podemos acrescentar que OS réprobos têm um senso confuso da graça, apegando-se às sombras e não às substâncias, porque o Espírito sela adequadamente o perdão dos pecados somente nos eleitos, aplicando-o ao uso deles mediante fé especial. Também é correto afirmar que os réprobos crêem que Deus lhes é propício, pois aceitam o dom da reconciliação, embora de forma confusa e sem o devido discernimento. Não estamos dizendo que eles são co-participantes da mesma fé ou da regeneração dos filhos de Deus, mas, por causa de sua hipocrisia, parecem ter com estes, uma fé em comum. Não nego que Deus ilumina a mente dos réprobos até ao ponto que reconheçam sua graça; mas a convicção que Ele distingue do testemunho peculiar que dá a seus eleitos, esta o réprobo nunca obtém até à ultima conseqüência ou em pleno proveito. Quando Deus se mostra propício aos ré-probos, isso não acontece como se Ele os houvesse resgatado verdadeiramente da morte, tomando-os sob sua proteção. Deus apenas lhes dá uma manifestação de sua misericórdia presente. É somente nos eleitos que Ele implanta a raiz viva da fé, para que perseverem até ao fim.6

Os Puritanos e a Teologia da Reforma

Zane Hodges acredita que os reformadores ingleses alteraram e corromperam a doutrina da justificação pela fé. Fizeram isso, ele diz, ao expandir a definição de fé dos primeiros reformadores. Ele chama o ensino puritano sobre a fé e a segurança de “uma mancha trágica na história da igreja cristã” (AF 32) . O ensino puritano, ele diz, é a base da “salvação por senhorio”. “No mundo de língua inglesa, esse conceito de fé salvífica radicalmente alterado pode, com considerável probidade, ser descrito como teologia puritana. A salvação por senhorio, em sua forma contemporânea mais conhecida, populariza o puritanismo do qual é herdeira” (AF 33).

Em uma observação sobre este ponto, Hodges destaca que uma lista de citações que incluí como apêndice em O Evangelho Segundo Jesus cita muitas fontes puritanas. Ele repete sua acusação de que “a teologia puritana na área de fé e segurança não reflete, de modo algum, a doutrina de João Calvino; é um afastamento distinto do pensamento reformado” (AF 208).

Mas, como já sugeri (ver capítulo 10, nota 6), Hodges faz uma diferenciação excessiva entre Calvino e os puritanos. Nenhum outro grupo de teólogos jamais defendeu a justificação pela fé tão obstinadamente como os reformadores ingleses. Como provam os textos recém-citados, ninguém mais do que Lutero e Calvino tinha convicção de que a fé genuína é operante.

Embora Lutero, Calvino e os puritanos tivessem diferenças a respeito de como descrever a fé e de como obter a segurança, todos concordavam que a santificação acompanha inevitavelmente a justificação. Nenhum deles toleraria a noção de que verdadeiros crentes podem deixar de perseverar em retidão ou de que a fé genuína pode decair em inatividade ou em permanente incredulidade. Neste ponto, os proponentes da teologia moderna do não-senhorio estão seriamente enganados.

J. C. Ryle, sobre a Justificação e Santificação

O bispo J. C. Ryle era um clérigo anglicano de tradição puritana (embora tenha vivido no século XIX). Em seus dias, ele reconheceu todas as tendências incipientes que têm resultado na teologia do não-senhorio em nossa época. Sua obra clássica Santidade sem a qual Ninguém Verá o Senhor, publicada em 1879, é a sua resposta a essas tendências. Permanece até hoje como uma resposta eficaz ao erro da teologia do não-senhorio, sendo, em muitos aspectos, uma obra esclarecedora sobre este assunto.

Ryle, em harmonia com toda a teologia puritana e reformada, desprezava a noção de que a justificação e a santificação podem ser separadas ou a idéia de que a santificação pode ser opcional na experiência de um crente verdadeiro. Ele entendia a justificação e a santificação como distintas, mas inseparáveis. Ele escreveu:

Portanto, no que a justificação e a santificação são semelhantes?

a.    Ambas procedem originalmente da graça gratuita de Deus. É somente por motivo de seu dom que os crentes chegam a ser justificados e santificados.

b.    Ambas fazem parte da grandiosa obra de salvação que Jesus Cristo, dentro do pacto eterno, resolveu realizar em favor do seu povo. Cristo é a fonte da vida, de onde fluem tanto o perdão dos pecados quanto a santificação. A raiz de cada uma dessas realidades é Jesus Cristo.

c.    Ambas podem ser encontradas nas mesmas pessoas. Aqueles que são justificados também sempre são santificados; aqueles que são santificados sempre são justificados. Deus uniu essas duas realidades espirituais e elas não podem ser separadas uma da outra.

d.    Ambas começam ao mesmo tempo. No momento em que uma pessoa começa a ser um crente justificado, também começa a ser um crente santificado. Talvez ela não perceba, mas isso é um fato.

e.    Ambas são igualmente necessárias à salvação. Ninguém jamais chegou ao céu sem um coração renovado acompanhado pelo perdão, sem a graça do Espírito Santo acompanhada pelo sangue de Cristo, sem estar devidamente preparado para a glória eterna e ao, mesmo tempo, sendo possuidor do título que lhe dá direito a ela. Uma coisa é tão necessária quanto a outra.

Esses são OS pontos em torno dos quais a justificação e a santificação concordam entre si. Agora, vamos reverter o quadro, verificando no que essas duas verdades diferem.

a.    A justificação é quando Deus declara que um homem é justo, com base nos méritos de um outro homem, a saber, o Senhor Jesus Cristo. A santificação é o desenvolver progressivo da justiça no interior do homem, mesmo que ocorra muito lentamente.

b.    A retidão que recebemos, mediante a nossa justificação, não é nossa própria, mas é a perfeita e eterna retidão do nosso grande Mediador, Jesus Cristo, imputada a nós e tornada nossa somente através da fé. Porém, a retidão que temos, por meio da santificação, é a nossa própria retidão, concedida, inerente e operada em nós pelo Espírito Santo, embora misturada com grande debilidade e imperfeição.

c.    Na justificação, as nossas próprias obras não desempenham qualquer papel, e a simples confiança em Cristo é a única coisa que se faz mister. Na santificação, as nossas próprias obras revestem-se de vasta importância; Deus ordena que lutemos, vigiemos, creia-mos, nos esforcemos e labutemos.

d.    A justificação é uma obra terminada e completa, e um crente está perfeitamente justificado a partir do instante em que crê. No entanto, a santificação é uma obra imperfeita, comparativamente falando; jamais será aperfeiçoada enquanto não chegarmos ao céu.

e.    A justificação não admite qualquer desenvolvimento ou crescimento; um homem está tão justificado na hora em que vem a Cristo, mediante a fé, como o será por toda a eternidade. A santificação, contudo, tem natureza eminentemente progressiva, admitindo um crescimento e uma ampliação contínuos, enquanto o crente estiver vivo.

f.    A justificação tem uma referência especial à nossa pessoa, à nossa posição diante de Deus e a à nossa libertação da culpa. A santifi- cação, porém, está especialmente relacionada à nossa natureza e à renovação moral do nosso coração.

g.    A justificação nos confere o direito de ir para o céu, bem como a ousadia de ali ingressar. A santificação nos torna adequados para habitar no céu, capacitando-nos a usufruir dele quando ali estivermos habitando.

h.    A justificação é um ato de Deus a nosso respeito, não podendo ser facilmente percebido por outras pessoas. A santificação é uma obra de Deus dentro de nós, não podendo ser ocultada em suas manifestações externas aos olhos dos homens.

Destaco essas distinções diante da atenção de todos os meus leitores, rogando-lhes que ponderem detidamente sobre elas. Estou persuadido de que uma das grandes causas das trevas e dos sentimentos de desconforto de muitas pessoas bem intencionadas, nessa questão da religião cristã, é o hábito que elas têm de confundir, em vez de distinguir a justificação da santificação. Jamais poderá ser salientado em demasia, diante de nossa mente, que essas são duas realidades distintas. Não há dúvida de que elas não podem ser separadas uma da outra. Aquele que participa de uma participa também da outra. Entretanto, jamais deveriam ser confundidas entre si, e a distinção que há entre elas jamais deveria ser esquecida.7

Charles Spurgeon, sobre a santidade

Charles Spurgeon era um batista inglês de tradição puritana. Ninguém pregou mais poderosamente do que ele contra a idéia de “aceitar Cristo como Salvador” e, ao mesmo tempo, rejeitar seu senhorio, “Em verdade lhes digo que VOCÊS não podem ter Cristo com Salvador, a menos que o tenham como Senhor”, Spurgeon disse,8 Poderíamos citar páginas de pregações de Spurgeon que visavam desiludir a doutrina do não-senhorio,

Spurgeon concorda com todos os puritanos e reformadores na questão de que a santificação prática é uma evidência essencial da justificação, Por exemplo, pregando sobre Mateus 22,11-14, Spurgeon disse:

A santidade está sempre presente naqueles que são convidados leais do grande Rei, pois sem santidade “ninguém verá o Senhor”, Muitos que professam a fé tranqüilizam a si mesmos com a idéia de que possuem justiça imputada, enquanto se mostram indiferentes à obra santificadora do Espírito, Eles se recusam a vestir o traje da obediência, rejeitam o linho branco que é a justiça dos santos, Assim, revelam sua própria vontade, sua inimizade contra Deus e sua falta de submissão a seu Filho, Esses homens podem falar o que quiserem sobre justificação pela fé e salvação pela graça, mas são rebeldes no coração, não estão usando o traje de casamento, e sim a justiça própria, que tão prontamente condenam, A verdade é que, se desejamos as bênçãos da graça, devemos, em nosso coração, submeter-nos às regras da graça, sem fazermos separações ou escolhas,9

Em outro contexto, Spurgeon disse:

Cristo não veio para que você continuasse em pecado e escapasse de sua punição, Ele não veio para evitar que a doença seja mortal, mas para lançar fora a própria doença, Muitas pessoas pensam que, ao pregar a salvação, queremos dizer O livramento do inferno. Não queremos dizer [apenas] isso; temos muito mais em mente. Pregamos a salvação do pecado. Dizemos que Cristo é capaz de salvar um homem e, com isso, queremos dizer que Ele é capaz de salvá-lo do pecado e torná-lo santo, torná-lo um novo homem. Nenhuma pessoa tem direito de dizer: “Sou salvo", enquanto continua em pecado como o fazia antes. Como você pode ser salvo do pecado, enquanto vive nele? Um homem que está se afogando não pode dizer que está salvo da água, enquanto está afundando nela. Um homem que está congelando não pode dizer, com sinceridade, que está salvo do frio, enquanto está endurecido na forte rajada de vento invernoso. Não, Cristo não veio para salvar você em seus pecados, mas para salvar você de seus pecados. Ele não veio para impedir que a doença mate você, mas para permitir que ela continue, em si mesma, mortal e, apesar disso, tirá-la de você e você, dela. Portanto, Cristo Jesus veio para nos sarar da praga do pecado, para nos tocar com sua mão e dizer: “Quero, fica limpo!"10

Em um sermão de 1872, Spurgeon criticou uma variedade incipiente de doutrina do não-senhorio:

Existem alguns que parecem dispostos a aceitar a Cristo como Salvador, mas não querem recebê-lo como Senhor. Geralmente, eles não falam nesse caso de maneira simples, mas, como ações falam mais alto que as palavras, isso é o que a sua conduta diz. Como é triste que alguns falem de sua fé em Cristo e não a comprovem por suas obras! Alguns até falam como se compreendessem o que queremos dizer com aliança da graça. Entretanto, infelizmente, não há evidência de graça na vida deles; há provas muito claras de pecado (e não de graça) abundante. Não consigo imaginar a possibilidade de alguém receber verdadeira- mente a Cristo como Salvador e não recebê-lo como Senhor. Um dos primeiros instintos de uma alma redimida é cair aos pés do Salvador e clamar, em agradecimento e adoração: “Bendito Senhor, comprado por teu precioso sangue, reconheço que sou teu — teu somente, teu inteiramente, teu para sempre. Senhor, o que tu queres que eu faça?” Não precisamos dizer a um homem realmente salvo pela graça que ele está sob obrigações solenes de servir a Cristo; a nova vida que está nele lhe diz isso. Em vez de considerar o servir a Cristo como um fardo, esse homem se rende alegremente — corpo, alma e espírito — ao Senhor que o redimiu, reconhecendo ser este o seu culto racional. Falando por mim mesmo, posso dizer verdadeiramente que, no momento em que soube que Cristo era meu Salvador, estava pronto a dizer-lhe:

Sou teu, e somente teu,

Reconheço alegre e plenamente;

Todas as minhas obras e caminhos Vejam agora somente o teu louvor.

Ajuda-me a confessar o teu nome,

Levar, com gozo, tua cruz e opróbrio,

Buscando unicamente seguir a ti,

Embora desonra seja a minha porção.

11._._.    Pasadena,    v.    56,    p.    617,    1979.    Reimpressão.

Não é possível aceitarmos a Cristo como Salvador, sem que Ele se torne, igualmente, nosso Rei, pois grande parte da salvação consiste em sermos salvos do domínio do pecado sobre nós. E tornar-nos sujeitos à autoridade de Cristo é a única maneira de podermos ser libertos da autoridade de

Satanás... Se fosse possível o pecado ser perdoado e o pecador viver exatamente como vivia antes, ele não seria realmente salvo.11

LLEWELLEN, Thomas G. Has lordship salvation been taught throughout church history? Bibliotheca Sacra, Dallas, v. 147, n. 585, p. 59, Jan.-Mar. 1990.

LUTHER, Martin. Justification by faith. In: WIERSBE, Warren (Ed.). Classic sermons on faith and doubt. Grand Rapids, Mich.: Kregel, 1985. p. 78-83. Ênfase acrescentada.

CALVIN, John. Institutes of the christian religion. Trans. Henry Beveridge. Grand Rapids, Mich.; Eerdmans, 1966. 3:16:1.

4 Ibid.

OLIN, John C. (Ed.). A Reformation debate. Grand Rapids, Mich.; Baker, 1966. p. 68.

CALVIN, John. Institutes of the christian religion. Trans. Henry Beveridge. Grand Rapids, Mich.: Eerdmans, 1966. 3:2:8-11.

RYLE, J. C. Santidade sem a qual ninguém verá o Senhor. 2. Ed. São José dos Campos, SP: Fiel, 2009. p. 60-62.

SPURGEON, C, H, The Metropolitan Tabernacle Pulpit, Pasadena, v, 74, p, 570, 1986, Reimpressão,

_,_.    London,    v,    17,    p,    99,    1894,

_._.    Pasadena,    v.    11,    p.    138,    1979.    Reimpressão.

O evangelicalismo americano e a teologia do não-senhorio

NO capitulo 2, afirmei minha convicção de que O movimento contemporâneo do não-senhorio é principalmente um fenômeno americano. Contudo, também acrescentaria que a teologia do não-senhorio é um afastamento radical da crença fundamentalista e evangélica nos Estados Unidos. A crença protestante americana tem raizes no movimento puritano inglês. Os grandes avivamentos evangélicos dos séculos XVIII e XIX, O movimento metodista e O avivalismo no começo do século XX, todos esses movimentos apresentavam O senhorio de Cristo no âmago do evangelho que eles proclamavam. Jonathan Edwards, talvez a maior mente teológica que os Estados Unidos produziram, escreveu:

Quanto à pergunta: “Unir-se com Cristo em seu oficio como Rei é a essência da fé justificadora?”, eu diria: 1) aceitar a Cristo em seu oficio como Rei é, sem dúvida, a condição própria de ter um interesse em seu oficio real e, portanto, a condição da salvação que Ele concede na execução desse oficio; assim como aceitar O perdão dos pecados é a condição própria do perdão dos pecados. Cristo, em seu oficio como Rei outorga salvação; portanto, aceitá-lo em seu oficio real, mediante uma disposição de perder tudo e sofrer tudo por causa de Cristo, e dar-lhe O devido respeito e honra é a condição da salvação. Isso é manifesto por Hebreus 5.9: “Tendo sido aperfeiçoado, tornou-se O Autor da salvação eterna para todos os que lhe obedecem”.1

É claro que a forte tradição reformada do Seminário de Princeton, que formou Charles Hodge, B. B. Warfield e J. Gresham Machen expressava uma clara mensagem de senhorio. Hodge escreveu:

Está incluído na doutrina de que somos santificados pela fé: as boas obras são os efeitos infalíveis da fé. Pois é impossível que haja santidade interior, amor, espiritualidade, amor fraternal e zelo sem uma manifestação externa dessas graças em toda a vida prática. Portanto, a fé sem obras é morta. Somos salvos pela fé. Mas a salvação inclui libertação do pecado. Se a nossa fé não nos livra do pecado, ela não nos salva. O antinomianismo envolve uma contradição nos termos.2

Apenas um segmento do evangelicalismo americano seguiu e propagou a teologia do não-senhorio; e esse segmento é um ramo do dispensacionalismo.

D. L. Moody, sobre o arrependimento

D. L. Moody, evangelista e fundador do Instituto Bíblico Moody, definiu com clareza o chamado ao arrependimento:

Há bastante confusão entre as pessoas sobre o que realmente é o arrependimento. Se você perguntar-lhes o que é o arrependimento, elas lhe dirão: “É lamentar". Se você perguntar a um homem se ele se arrepende, ele dirá: “Ah! sim, geralmente lamento os meus pecados". Isso não é o arrependimento. Arrepender-se é algo mais do que lamentar; é dar meiavolta e rejeitar o pecado. Domingo, queria falar sobre aquele versículos em Isaías que diz: “Deixe o perverso o seu caminho, o iníquo, os seus pensamentos". Isso é o arrependimento. Se um homem não deixar seus pecados, não será aceito por Deus; e, se a justiça não produz conversão — um afastar-se do mal para voltar-se ao bem —, não é justiça verdadeira.3

Moody afirmou:

Não vivemos como vivíamos antes de sermos convertidos. Um homem ou uma mulher que professa o cristianismo e ainda vive nos caminhos antigos não nasceu de novo. Quando nascemos de novo, nascemos em um novo caminho; e Cristo mesmo é este novo caminho. Desistimos de nosso velho caminho e tomamos este novo caminho. O caminho antigo conduz à morte; o caminho novo, à vida eterna. No caminho antigo, Satanás nos conduzia; no caminho novo, o Filho de Deus nos conduz. Somos conduzidos por Ele, não em escravidão e trevas, e sim no caminho de paz e alegria.4

R. A. Torrey, sobre o Senhorio

R. A. Torrey, o primeiro presidente do Instituto Bíblico Moody, instruiu os alunos a respeito de como levar pessoas a Cristo:

Mostre-lhes Jesus como Senhor.

Não é suficiente conhecer a Jesus como Salvador; devemos conhecê-lo como Senhor também. Um bom versículo para cumprir este propósito é Atos 2.36: “Esteja absolutamente certa, pois, toda a casa de Israel de que a este Jesus, que vós crucificastes, Deus o fez Senhor e Cristo".

Quando a pessoa tiver lido o versículo, pergunte-lhe: o que Deus fez de Jesus? E deixe a pessoa pensar sobre isso até que responda: “Senhor e Cristo". Então, diga: “Você está disposto a aceitá-lo como seu divino Senhor, aquele a quem você renderá seu coração, cada pensamento, cada palavra e ação?"

Outro versículo bom para satisfazer este propósito é Romanos 10.9: “Se, com a tua boca, confessares Jesus como Senhor e, em teu coração, creres que Deus o ressuscitou dentre os mortos, serás salvo".

Quando a pessoa tiver lido o versículo, pergunte-lhe: devemos confessar Jesus como o quê? Ela deve responder: “Senhor". Se ela não responder isso, faça outras perguntas, até que ela dê essa resposta. Então pergunte-lhe: você crê realmente que Jesus é Senhor, que Ele é Senhor de todos, que é legalmente o Senhor e Mestre absoluto de sua vida e pessoa? Talvez seja bom usar Atos 10.36 para tornar mais claro este ponto: “Esta é a palavra que Deus enviou aos filhos de Israel, anunciando-lhes o evangelho da paz, por meio de Jesus Cristo. Este é o Senhor de todos”.5

James M. Gray, sobre a salvação

James M. Gray, o segundo presidente do Instituto Bíblico Moody, escreveu:

O desígnio da expiação é afirmado nas palavras “para que nós, mortos para os pecados, vivamos para a justiça” — um desígnio duplo, conforme vemos. O pensamento de Deus não era apenas punitivo, mas corretivo. Ele deu seu Filho não só para tirar nossa culpa, mas para mudar nossa vida...

No momento em que, pela fé, recebemos a Cristo, também recebemos o Espírito Santo para habitar em nós, nos regenerar, criar em nós um coração limpo e refazer dentro de nós um espírito correto, de modo que nos tornemos “mortos para os pecados" não apenas no sentido judicial ou imputado... mas no sentido real e, também, experiencial. Isso não significa dizer que O pecado é erradicado de nosso coração e não mais habita em nós, nem mesmo de modo latente (1 JO 1.8); significa que os poderes dele sobre nós foram interrompidos. Passamos realmente a odiar os pecados que costumávamos amar e a amar a santidade que costumávamos odiar.

...Cristo morreu não somente para que morrêssemos para os pecados judicial e experiencialmente, mas também para que “vivamos para a justiça”. Como nosso substituto e representante, Ele morreu e ressuscitou...

Paulo também nos diz em Romanos 6, que já citei: se estamos unidos com Cristo na semelhança de sua morte, também estamos unidos com Ele na semelhança de sua ressurreição. Se morremos com Ele, também viveremos com Ele.

A verdade não é apenas que viveremos com Ele depois num estado físico de glória da ressurreição, e sim que vivemos com Ele agora num estado espiritual de glória da ressurreição. A morte de Cristo aconteceu uma única vez para O pecado, mas a vida que Ele tem é para Deus. Ele vive para Deus agora. De modo semelhante, devemos reconhecer a nós mesmos não somente como realmente mortos para O pecado, como já consideramos, mas também vivos para Deus em Cristo Jesus (6.11), vivos agora...

Isso não é verdade apenas no sentido da imputação, mas, como na outra metade desta afirmação, no sentido experiencial também. Como acabamos de ver, O Espírito Santo, habitando O homem regenerado, não somente O capacita a odiar O pecado, mas também a amar a santidade e segui-la. Esse homem não oferece mais seus “membros para a escravidão da impureza e da maldade para a maldade", e sim para servirem à “justiça para a santificação". Ele crucifica a carne com suas paixões e lascívia. Ele não somente se despoja de “ira, indignação, maldade, maledicência, linguagem obscena", mas também se reveste, como eleito de Deus, “de ternos afetos de misericórdia, de bondade, de humildade, de mansidão, de longanimidade” e, acima de tudo ÍSSO, reveste-se de “amor, que é o vínculo da perfeição”.

Assim, “pelas suas pisaduras fomos sarados”. Perfeitamente sarados. Deus, havendo começado a boa obra em nós, a aperfeiçoa até ao dia de Jesus Cristo (Fp 1.6). O homem que recebe a Cristo como seu Salvador e confessa-o como seu Senhor não precisa temer a possibilidade de não “conseguir preservar-se”.6

W. H. Griffith Thomas, sobre a rendição

W. H. Griffith Thomas, co-fundador do Seminário Teológico de Dallas, escreveu:

Deus diz para o homem: “Aqui estou”; então, o homem recebe isso com agrado e responde a Deus: “Eis-me aqui”.

Essas palavras indicam rendição. Quando o crente diz para Deus: “Eis-me aqui”, ele se coloca à disposição de Deus. A resposta sincera é o resultado natural do recebimento da revelação de Deus à alma. Podemos ver esta verdade em cada página do Novo Testamento. Deus vem à alma, entra no coração e na vida, e, depois, o homem se oferece inteiramente a Deus como pertencente a Ele. “Não sois de vós mesmos... fostes comprados” - este é o significado da grande palavra de Paulo traduzida como “oferecer” em Romanos 6.13 e 19 e de “apresentar” em Romanos 12.1. Nesta última passagem, o apóstolo baseia sua exortação nas “misericórdias de Deus”, na revelação de Deus em que Ele diz ao homem: “Aqui estou”. E, depois de exortar seus leitores a “apresentarem” seu corpo como um sacrifício a Deus, Paulo fala desta rendição como o “culto racional” do cren- te, O resultado racional, lógico e necessário de sua aceitação das “misericórdias de Deus". O evangelho não vem à alma simplesmente visando ao prazer pessoal; ele vem para despertar na alma um senso da verdadeira vida e de suas maravilhosas possibilidades. Conseqüentemente, quando Deus fala ao crente: “Sou teu", O crente responde: “Sou teu" (Sl 119.94); “EU sou do SENHOR" (IS 44.5). Isto era uma parte do propósito da obra de redenção de nosso Senhor: “para ser Senhor" e, agora, “somos do Senhor" (Rm 14.8-9). Essa resposta sincera deve ser dada desde O primeiro momento de aceitação em e de Cristo. “Cristo é tudo" para nós desde O início, e devemos ser “tudo para Ele". Não deve existir um hiato, vácuo, intervalo entre a aceitação de Cristo como Salvador e a rendição a Ele como Senhor. O título completo dele é “Jesus Cristo, nosso Senhor"; e a plena extensão do significado disso (embora, é claro, não toda a sua profundidade) deve ser percebida desde a primeira experiência de sua presença e seu poder salvíficos...

Este ato inicial de rendição não é nada além do começo de uma vida de rendição. O ato deve se desenvolver numa atitude. Isso tem sido reconhecido pelos verdadeiros filhos de Deus em todas as idades como seu “dever e culto sagrado".7

H. A. Ironside, sobre a segurança

H. A. Ironside, pastor da Moody Memorial Church, em Chicago, escreveu:

Talvez alguém pergunte: “Mas, não faz diferença para Deus quem eu sou? Posso continuar vivendo em meus pecados e, assim mesmo, ser salvo?” Não, certamente não! ISSO traz à IUZ outra verdade. No momento em que alguém crê no evangelho, é nascido de novo e recebe uma vida nova e uma natureza nova — uma natureza que odeia o pecado e ama a santidade. Se você já veio a Jesus e confiou nele, não percebe a verdade disso? Agora, você não odeia e detesta as coisas perversas que uma vez lhe deram certo grau de deleite? Não acha em si mesmo um novo anseio pela bondade, um desejo por santidade e uma sede de justiça? Tudo isso é evidência de uma nova natureza. E, à medida que você caminha com Deus, descobre que o poder diário do Espírito Santo dá o livramento prático do domínio do pecado.19

Sobre 1 João 3.9-10, Ironside escreveu:

Veja como as duas famílias, a não-regenerada e a regenerada, são descritas aqui. Homens não-salvos vivem na prática do pecado. Independentemente das coisas boas que hajam no caráter deles, julgadas pelos padrões do mundo, eles se deleitam em viver como querem. Isso é a essência do pecado. “O pecado é iniqüidade.” Todos os estudiosos concordam que essa é uma tradução mais correta do que “o pecado é a transgressão da lei”. Ouvimos que “até ao regime da lei havia pecado no mundo”; e, embora o pecado não fosse imputado como transgressão, porque nenhum padrão escrito havia sido dado, o pecado se manifestou como vontade pessoal ou iniqüidade, sendo visto em todos os lugares onde estivesse a humanidade caída. Iniqüidade é a recusa de uma pessoa em submeter sua vontade a Outro, o próprio Deus, que tem o direito de reivindicar plena obediência. Nisso, os filhos do demônio mostram claramente a família à qual pertencem.

19. IRONSIDE, H. A. Full assurance. Chicago: Moody, 1937. p. 33.

Entretanto, no crente acontece algo diferente. Voltando-se para Cristo, o crente nasce do céu, conforme vimos, e assim possui uma nova natureza. Essa nova natureza abomina o pecado e, a partir de então, domina seus desejos e seus pensamentos. O pecado torna-se detestável. O crente detesta a si mesmo pelas loucuras e iniqüidades do passado, ansiando por santidade. Fortalecido pelo Espírito Santo, a direção de sua vida é mudada. O crente pratica a justiça. Embora muitas vezes tenha consciência de erro, todo o curso de sua vida é alterado. A sua alegria e prazer é a vontade de Deus. À medida que aprende mais e mais acerca do precioso permanecer em Cristo, ele cresce em graça e conhecimento, percebendo que o poder divino lhe é dado para andar no caminho da obediência. Sua nova natureza encontra alegria em render-se a Jesus como Senhor. Assim, o pecado deixa de ser característico de sua vida e caráter.8

A. W. Tozer, sobre seguir a Cristo

A. W. Tozer escreveu muito sobre a questão do senhorio. Ele começou a ver os perigos de um evangelho do não-senhorio mais de meio século e fez muitos alertas à igreja. Eis alguns trechos de seus alertas:

Permitindo que a expressão “aceitar a Cristo" permaneça como um esforço honesto de expressar, em resumo, o que poderia muito bem ser dito de outra maneira, vejamos o que queremos dizer ou qual deve ser a nossa intenção ao usá-la.

Aceitar a Cristo é formar uma ligação com a Pessoa de nosso Senhor Jesus, uma ligação totalmente única na experiência humana. A ligação é intelectual, volitiva e emocional. O crente é intelectualmente convicto de que Jesus é Senhor e Cristo; estabeleceu seu desejo de segui-lo a qualquer custo e, por isso, seu coração desfruta da extraordinária doçura da comunhão com Cristo.

Esta ligação é totalmente inclusiva, visto que aceita com alegria a Cristo como tudo que Ele é. Não existe uma divisão horrível dos ofícios de Cristo, pela qual hoje reconhecemos seu ofício como Salvador e retemos até amanhã a decisão quanto ao seu ofício como Senhor. O verdadeiro crente reconhece a Cristo como “tudo em todos", sem reservas. Ele também inclui tudo de si mesmo, não deixando parte alguma de seu ser sem a influência da transição revolucionária.

Além disso, sua ligação com Cristo é exclusiva. O Senhor torna-se para ele não um de vários interesses rivais, mas a única e exclusiva fascinação, para sempre. O crente orbita ao redor de Cristo como a terra, ao redor do sol, mantido em servidão pelo magnetismo do amor de Cristo, obtendo dele toda a sua vida, luz e calor. Nesse estado feliz, o crente recebe outros interesses, é verdade, mas todos eles são determinados pelo relacionamento com seu Senhor.

Aceitar a Cristo desta maneira inclusiva e exclusiva é um imperativo divino. Nesse imperativo, a fé chega a Deus mediante a Pessoa e obra de Cristo, mas nunca separa a obra da pessoa. Nunca tenta acreditar no sangue sem o próprio Cristo, ou sem a cruz, ou sem a “obra consumada". Ela crê no Senhor Jesus Cristo, em todo o Cristo, sem modificação ou reservas, e, assim, recebe e desfruta de tudo que Ele fez em sua obra de redenção, de tudo que Ele faz agora no céu pelos que são dEle e de tudo que Ele faz neles e por meio deles.

Aceitar a Cristo é saber o significado das palavras “segundo ele é, também nós somos neste mundo" (1 Jo 4.17). Aceitamos seus amigos como nossos amigos, seus caminhos como nossos caminhos, sua rejeição como nossa rejeição, sua cruz como a nossa cruz, sua vida como a nossa vida e seu futuro como nosso futuro.

Se isso é o que pretendemos dizer quando aconselhamos o que busca a Deus a aceitar a Cristo, é melhor que lhe expliquemos isso. Ele pode ter profundos problemas espirituais se não o fizermos.9

Tozer escreveu: “O cristão é salvo de seus pecados passados. O cristão não tem mais qualquer relação com tais pecados; eles estão entre as coisas que devem ser esquecidas, como a noite é esquecida no amanhecer do dia”.10

Este ensaio aborda vários temas que Tozer enfatizou repetidas vezes:

Nestes dias, estamos sob constante tentação de substituir o Cristo do Novo Testamento por outro Cristo. Todo o curso do cristianismo moderno está-se encaminhando para essa substituição.

Para evitar isso, devemos apegar-nos firmemente ao conceito de Cristo demonstrado com clareza e simplicidade nas Escrituras da verdade. Ainda que um anjo vindo do céu pregue qualquer coisa aquém do Cristo dos apóstolos, seja tal anjo rejeitado franca e ousadamente.

A poderosa e revolucionária mensagem da igreja primitiva era que um homem chamado Jesus, que fora crucificado, havia ressuscitado dos mortos e agora estava exaltado à destra de Deus. “Esteja absolutamente certa, pois, toda a casa de Israel de que a este Jesus, que vós crucificastes, Deus o fez Senhor e Cristo”...

A salvação vem não por “aceitarmos a obra consumada” OU por “fazermos uma decisão por Cristo”. Ela vem por crermos no Senhor Jesus Cristo, o completo, vivo e vitorioso Senhor que, como Deus e homem, lutou a nossa luta e venceu, aceitou o nosso débito como seu e o quitou, levou nossos pecados, morreu sob eles e ressuscitou para nos tornar livres. Este é o verdadeiro Cristo; e nada menos do que isso basta.

Contudo, existe algo aquém disso entre nós. Faremos bem em identificá-lo a fim de que o repudiemos. Esse algo é uma ficção poética, um produto da imaginação romântica e de fantasia religiosa alucinada. É um Jesus gentil, sonhador, tímido, doce, quase efeminado e maravilhosamente adaptável a qualquer sociedade em que se encontre. Ele é admirado por mulheres desapontadas no amor; é bajulado por celebridades efêmeras e recomendado por psiquiatras como um modelo de personalidade integral. É usado como um instrumento para atingir quase todas as finalidades carnais, mas nunca é reconhecido como Senhor. Esses quase cristãos seguem um “quase Cristo”. Querem ajuda dEle, mas não querem sua interferência. Eles o lisonjeiam, mas nunca lhe obedecem.11

Tozer chamou a teologia do não-senhorio de “doutrina desacreditada” que divide Cristo. E descreveu o ensino ao qual se opunha:

Funciona assim: Cristo é Salvador e Senhor. Um pecador pode ser salvo aceitando-o como Salvador sem render-se a Ele como Senhor. O efeito prático dessa doutrina é que o evangelista o apresenta, e a pessoa que busca a Deus aceita um Cristo dividido...

Agora, parece estranho que nenhum desses mestres jamais percebeu que o único objeto verdadeiro da fé salvifica é o próprio Cristo, e não o ministério de salvação de Cristo, nem o “senhorio" de Cristo — é o próprio Cristo. Deus não oferece salvação àquele que crê em um dos ofícios de Cristo; e jamais um desses ofícios foi apresentado como objeto de fé. Também não somos exortados a crer na expiação, na cruz ou no sacerdócio do Salvador. Todas essas coisas estão personificadas em Cristo, porém jamais são separadas, e qualquer delas, isolada das restantes. Tampouco temos permissão de aceitar um dos ofícios de Cristo e rejeitar outro. A noção de que temos tal permissão é uma heresia dos tempos modernos, eu repito, e, como qualquer heresia, jamais deve ser entretida com impunidade. Pagamos com fracassos práticos os nossos erros teóricos.

É completamente duvidoso que algum homem seja salvo por vir a Cristo e buscar sua ajuda sem a intenção de obedecer-lhe. O ministério de salvação de Cristo está para sempre unido ao seu senhorio. Veja as Escrituras: “Se, com a tua boca, confessares Jesus como Senhor e, em teu coração, creres que Deus o ressuscitou dentre os mortos, serás salvo... o mesmo é o Senhor de todos, rico para com todos os que o invocam. Porque: Todo aquele que invocar o nome do Senhor será salvo" (Rm 10.9, 1213). Nesta passagem, o Senhor é o objeto da fé para a salvação. E, quando o carcereiro de Filipos perguntou o que devia fazer para ser salvo, Paulo respondeu: “Crê no Senhor Jesus e serás salvo" (At 16.31). Ele não disse ao carcereiro que cresse no Salvador com o pensamento de que, mais tarde, poderia considerar a questão de seu senhorio e resolvê-la de acordo com sua conveniência. Para o apóstolo Paulo, não podia haver divisão de ofícios. Cristo deve ser Senhor ou não será Salvador.24

24._.    The    root    of    the    righteous. Harrisburg, Pa.: Christian Publications, 1955.

p. 84-86.

Essa análise intensa da fé mostra quão profundamente Tozer havia pensado nos perigos da doutrina do não-senhorio.

Por alguns anos, meu coração tem estado preocupado com o modo como está sendo recebida e ensinada a doutrina da fé entre os cristãos evangélicos em todos os lugares. Nos círculos ortodoxos, coloca-se grande ênfase sobre a fé (e isto é bom), mas ainda estou preocupado. Especificamente, meu medo é que o conceito moderno de fé não seja bíblico. Tenho medo de que os mestres de nossos dias, ao usarem a palavra “fé", não tenham em mente o que os escritores da Bíblia tinham em mente quando a usaram.

Estas são as causas de minha inquietação:

1    - A falta de fruto espiritual na vida de tantos que alegam ter fé.

2    - A raridade de mudança radical na conduta e na perspectiva geral de pessoas que professam a nova fé em Cristo como seu Salvador pessoal.

3    - A falha de nossos mestres em definir ou descrever aquilo que a palavra fé deve significar.

4    - A decepcionante falha de multidões que buscam a Deus — em bora sejam sempre tão sinceras — em não tornar esta doutrina um grande achado ou não receber dela qualquer experiência satisfatória.

5    - O perigo real de que uma doutrina tão amplamente divulgada e recebida sem questionamentos, por tantas pessoas, seja compreendida de modo falso.

6    - O fato de que a fé tem sido apresentada como um substituto da obe diência, uma fuga da realidade, um refúgio da necessidade de pensar bem e um esconderijo para um caráter fraco. Conheço pessoas que erram por confundirem a fé com uma vivacidade ou um otimismo natural, com entusiasmo emocional e ímpetos nervosos.

7 - O senso comum deve nos dizer que tudo aquilo que não causa mudança no homem que professa a fé não tem valor para Deus. E podemos observar com facilidade que, no caso de inúmeras pessoas, a transição da falta de fé para a fé não produz diferença genuína na vida...

Qualquer profissão de fé em Cristo como Salvador pessoal que não submete a vida à plena obediência a Cristo como Senhor é inadequada e, ao final, trai sua vítima.

O homem que crê, obedece. O fracasso em obedecer é uma prova convincente da inexistência da fé verdadeira. Para atingir o impossível, Deus deve dar fé, ou não haverá fé; e Ele outorga fé somente ao coração obediente. Onde existe arrependimento genuíno, existe obediência; pois o arrependimento não é apenas tristeza pelos erros e pecados passados, é uma determinação de começar a fazer agora a vontade de Deus como Ele a revela para nós.12

Arthur Pink, sobre a evangelização do não-senhorio

Arthur W. Pink era um teólogo reformado, autodidata. Ele escreveu e distribuiu pequenos estudos sobre assuntos teológicos e bíblicos numa revista mensal intitulada Studies in the Scriptures (Estudos nas Escrituras). Seu entendimento das Escrituras e sua habilidade de se expressar na forma escrita são célebres.

Freqüentemente, Pink escrevia com muito rigor e reservava parte de sua crítica mais severa àqueles que ele percebia estarem corrompendo a mensagem do evangelho, por ensinarem uma crença fácil. É correto dizer que ele considerava a doutrina do não-senhorio com total despre-

ZO. “A evangelização de hoje é não somente superficial ao extremo, mas também radicalmente defeituosa”, Pink escreveu.13

Por volta de 1930, décadas antes de O debate sobre O senhorio tornar-se um assunto conhecido, Pink viu com clareza grandes problemas na emergente doutrina do não-senhorio:

A fé salvífica consiste na completa rendição de todo O meu ser e de toda a minha vida às reivindicações de Deus quanto a mim: “Deram-se a si mesmos primeiro ao Senhor” (2 CO 8.5).

É a aceitação irrestrita de Cristo como meu absoluto Senhor, curvando-me à sua vontade e recebendo O seu jugo. Alguém pode objetar: então, por que os cristãos são exortados como em Romanos 12.1? Respondemos: todas as exortações como essa pedem que eles continuem como começaram: “Ora, como recebestes Cristo Jesus, O Senhor, assim andai nele” (Cl 2.6). Sim, lembre que Cristo é “recebido” como Senhor. Oh! quão distante, quão abaixo do padrão do NOVO Testamento está a maneira moderna de rogar aos pecadores que recebam a Cristo como seu “Salvador” pessoal. Se O leitor consultar uma concordância bíblica, descobrirá que, em cada passagem onde os dois títulos são encontrados juntos, sempre lemos “Senhor e Salvador”, e nunca vice-versa. Veja, por exemplo, Lucas 1.46-47 e 2 Pedro 1.11, 2.20, 3.18.14

Pink falou contra O desastre que via acontecer enquanto a evangelização da teologia do não-senhorio se tornava mais e mais popular:

O terrível é que hoje muitos pregadores, sob O pretexto de mag-nificar a graça de Deus, têm representado Cristo como ministro de pecado, como alguém que, mediante seu sacrifício expiatório, obteve uma indulgência para OS homens continuarem satisfazendo sua concupiscência carnal e mundana. Hoje, um homem que professa crer no nascimento virginal, na morte vicária de Cristo e alega confiar somente nEle para a salvação pode ser considerado um cristão verdadeiro em quase todos os lugares, embora sua vida não seja diferente da pessoa mundana que não professa o cristianismo. O Diabo está levando milhares ao inferno por meio dessa ilusão. O Senhor Jesus pergunta: “Por que me chamais Senhor, Senhor, e não fazeis o que vos mando?" (Lc 6.46); e insiste: “Nem todo o que me diz: Senhor, Senhor! entrará no reino dos céus, mas aquele que faz a vontade de meu Pai, que está nos céus" 15

Mateus 7.21

Pink deu este conselho a respeito de como lidar com os que disseminavam a doutrina que ele percebia estar corrompendo a igreja:

É dever sagrado de todo cristão não se envolver com a monstruosidade “evangelística" do dia; recusar-lhe todo apoio moral e financeiro, não participar de nenhum de seus encontros, não distribuir nenhum de seus folhetos. Aqueles pregadores que dizem aos pecadores que eles podem ser salvos sem abandonar seus ídolos, sem arrepender-se, sem render-se ao senhorio de Cristo são tão errados e perigosos como aqueles que insistem na salvação pelas obras e ensinam que o céu pode ser ganho por nossos próprios esforços.16

Palavras surpreendentes. Mas Pink sentiu que a seriedade do erro da doutrina do não-senhorio exigia a advertência mais forte possível. Alguém poderia perguntar qual teria sido a reação de Pink se ele visse a doutrina radical do não-senhorio que surgiu em anos recentes.

Sumário

A soteriologia da teologia do não-senhorio se afasta da ortodoxia evangélica. Permanece o fato de que, antes deste século e do dispensacionalismo de Chafer e Scotfield, nenhum teólogo ou pastor proeminente jamais seguiu os princípios da teologia do não-senhorio.17

A igreja como um todo precisa estudar este assunto com muito atenção. Nenhum de nós aprecia controvérsia, mas os assuntos com os quais estamos lidando são mais importantes do que meras questões de preferência. É o evangelho que está em jogo. Devemos entender corretamente a sua mensagem. Isso não é mera questão acadêmica. Estes são os assuntos pelos quais muitos grandes homens de Deus deram sua vida no passado.

Não podemos continuar a comprometer-nos, a tolerar e a minimizar o erro. Esse tipo de reação à controvérsia têm contribuído para o declínio do evangelho bíblico. Tem arruinado a igreja de nossa geração.

O cristianismo contemporâneo encontra-se em desordem e decadência; e a situação se deteriora ano após ano. A verdade da Palavra de Deus tem sido reduzida e comprometida para se alcançar um denominador comum que atrairá e acomodará o maior número de participantes. O resultado é um cristianismo híbrido essencialmente centrado no homem, materialista, mundano, que desonra vergonhosamente o Senhor Jesus Cristo. Esta degenera-ção deve-se, em grande parte, ao evangelho errôneo apresentado por muitos ao redor do mundo.18

Examinemos as Escrituras, façamos perguntas difíceis e cheguemos a um acordo sobre o evangelho www.gty.org www.gty.org www.gty.org www.gty.org

Esta obra foi composta em Chaparral Pro (11,8/14,7-90%) e impressa por Imprensa da Fé sobre o papel Lux Cream 70g/m2, para Editora Fiel, em janeiro de 2011.

Citado em: GERSTNER, John. The rational biblical theology of Jonathan Edwards. Orlando: Ligonier, 1991. p. 301.

HODGE, Charles. Systematic theology. Grand Rapids, Mich.: Eerdamns, 1989. 3:110. Reimpressão.

MOODY, D. L. True repentance. In:_.    The    gospel awakening. Chicago: Fair banks, Palmer, 1883. p. 417.

_.    Signs    of    the    New    Birth.    In:_.    gospel awakening. Chicago: Fair banks, Palmer, 1883. p. 658.

TORREY, R. A. How to work for Christ. Old Tappan, N. J.: Revell, 1901. p. 37-38.

GRAY, James M. Salvation from start to finish. Chicago: Moody, 1911. p. 39-44.

THOMAS, W. H. G. The Christian life and how to live it. Chicago: Moody, 1919. p. 46-49.

Ibid. p. 82-83.

TOZER, A. W. That incredible Christian. Harribusg, Pa.: Christian Publications,

1964. p. 18-19.

Ibid. p. 44.

_.    Man:    the    dwelling    place    of    God.    Camp    Hill,    Pa.:    Christian    Publications,

1966. p. 140-143.

_.    Man:    the    dwelling    place    of    God.    Camp    Hill,    Pa.:    Christian    Publications,

1966. p. 30-33.

PINK, Arthur. Studies on saving faith. Swengel, Pa.: Reiner, [19--]. p. 5.

_. Practical christianity. Grand Rapids, Mich.: Baker, 1974. p. 20.

Ibid. p. 24-25.

_. Studies on saving faith. Swengel, Pa.: Reiner, [19—]. p. 14.

Talvez seja possível, em citações seletivas, achar comentários de teólogos confiáveis que parecem apoiar algumas das idéias desenvolvidas por mestres da teologia do não-senhorio. No entanto, você descobrirá que nenhum das principais figuras da Reforma, ou da época posterior à Reforma, ou de algum dos mais importantes momentos evangélicos endossou o sistema de soteriologia do não-senhorio que o Dr. Ryrie defende e, muito menos, a variedade mais extrema que o professor Zene Hodges adota.

Os verdadeiros precursores históricos da teologia do não-senhorio incluem os antinomianos sandemanianos (também conhecidos como “glassitas”), na Escócia, no século XVIII. Esse movimento foi severamente condenado pelos puritanos. D. Mar-tyn Lloyd-Jones faz um resumo sobre a seita e a doutrina dos sandemanianos em Os Puritanos: Suas Origens e Seus Sucessores (São Paulo, SP: Editora PES).

WILSON, Jeffrey E. The authentic gospel. Edinburgh: Banner of Truth, 1990. p. 1.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Lutero afirma que a fé verdadeira é tão viva e ativa que é impossível não fazer o bem sem cessar, como a árvore que naturalmente produz fruto; ao olhar para a sua vida, as boas obras têm brotado de você livre e naturalmente, ou você precisa ser forçado a elas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Calvino diz que onde não há zelo pela integridade e pela santidade não está nem o Espírito de Cristo nem o próprio Cristo; examinando o seu coração, existe em você esse desejo real de santidade, ou apenas uma persuasão sem o temor de Deus que ele chama de fé falsa?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Ryle ensina que justificação e santificação começam ao mesmo tempo e são igualmente necessárias para a salvação; será que você tem buscado o perdão de Cristo enquanto trata a santidade como opcional, separando o que Deus uniu para sempre?$p$, 'reflexao', null);
  end if;

end $migration$;
