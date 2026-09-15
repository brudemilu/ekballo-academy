-- Curso: A Busca da Santidade (Jerry Bridges) — transcrição sem perguntas.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'a-busca-da-santidade';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'a-busca-da-santidade',
      $titulo$A Busca da Santidade$titulo$,
      $desc$Leitura guiada de A Busca da Santidade, de Jerry Bridges. Em vinte aulas, incluindo prólogo, prefácio e uma nota adicional, o autor trata da responsabilidade do cristão na santificação: a santidade de Deus, a batalha diária contra o pecado, obediência, disciplina pessoal, hábitos, fé e a alegria de viver para Deus. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      'capas/a-busca-da-santidade.jpg',
      false,
      0,
      'ensino',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$A Busca da Santidade$titulo$,
        descricao = $desc$Leitura guiada de A Busca da Santidade, de Jerry Bridges. Em vinte aulas, incluindo prólogo, prefácio e uma nota adicional, o autor trata da responsabilidade do cristão na santificação: a santidade de Deus, a batalha diária contra o pecado, obediência, disciplina pessoal, hábitos, fé e a alegria de viver para Deus. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = 'capas/a-busca-da-santidade.jpg',
        categoria = 'ensino',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prólogo$t$, 1,
$conteudo$Jerry Bridges deu ao mundo uma das obras mais incisivas, mais atraentes e estimulantes da consciência sobre a santidade bíblica que jamais foi escrita. Não há dúvida de que o Senhor capacitou o seu servo para preparar um livro que terá um impacto importante nas vidas das numerosas pessoas que o leiam.

O tema dominante deste estudo comovente é a necessidade de que os crentes intensifiquem a sua busca de santidade de vida, que só Deus, cuja santidade é sempre recordada com gratidão, pode tornar possível. Busca é a palavra-chave que o autor, cuja busca pessoal tem sido longa e forte, repete constantemente.

Na Declaração de Independência dos Estados Unidos da América, Thomas Jefferson declarou que um dos direitos inerentes e inalienáveis dos homens é “a busca de felicidade”. Os cristãos professos têm de ser levados a reconhecer que o desejo e exigência primordiais de Deus em relação a nós são a contínua busca de santidade de vida e o reflexo da sua própria santidade. “Sede santos, porque eu sou santo.”

Há mais de 100 anos, William Blake insistia com os seus leitores no sentido de “porem de lado a santidade e usarem o intelecto”. Mas, divorciado da santidade divina, o intelecto é como um barco sem capitão, condenado à tragédia. Na nossa busca de santidade deve sempre brotar do nosso coração esta prece: “Toma o meu intelecto e usa-o como preferires.”

É esta a razão porque calorosamente recomendamos este impressionante estudo, da santidade prática, em que o autor mostra perfeitamente que toda a nossa vida deve ser permeada com a santidade que um Deus três vezes santo pode comunicar-nos.

Dr. Herbert Lockyer$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prefácio$t$, 2,
$conteudo$Um lavrador lavra o seu campo, espalha a semente e fertiliza e cultiva a terra — sempre consciente de que, em última análise, está em absoluto dependente de forças externas. Ele sabe que não pode fazer a semente germinar, não pode produzir chuva e sol para que as culturas se desenvolvam e amadureçam. Para uma colheita abundante ele depende de Deus em todas essas coisas.

No entanto, o lavrador sabe que se não cumprir diligentemente as suas responsabilidades de lavrar, plantar, fertilizar e cultivar, não pode esperar uma colheita no fim da estação. Num certo sentido, ele entrou numa sociedade com Deus e só colherá os seus benefícios quando tiver cumprido as suas próprias responsabilidades.

O cultivo da terra é uma aventura conjunta entre Deus e o lavrador. Este não pode fazer o que Deus tem de fazer, e Deus não fará o que o lavrador deve fazer.

Com a mesma exatidão podemos dizer que a busca de santidade é uma aventura conjunta entre Deus e o cristão. Ninguém pode atingir qualquer grau de santidade se Deus não trabalhar na sua vida, mas também é absolutamente certo que ninguém a atingirá sem esforço da sua parte. Deus fez com que pudéssemos andar em santidade. Contudo, ele deu-nos a responsabilidade de andarmos; não fará isso por nós.

Nós, cristãos, gostamos muito de falar a respeito da provisão de Deus, da maneira como Cristo venceu o pecado na cruz e nos deu o seu Espírito Santo para nos capacitar a ganhar a vitória sobre o pecado. Mas, em geral, não somos tão prontos a falar da nossa própria responsabilidade de andar em santidade. Podemos apresentar duas importantes razões para esse fato.

Primeira, temos simplesmente relutância em encarar a nossa responsabilidade. Preferimos deixar isso com Deus. Pedimos-lhe vitória, quando sabemos que devíamos agir em obediência.

A segunda razão é que não compreendemos a distinção correta entre a provisão de Deus e a nossa própria responsabilidade no tocante à santidade. Eu mesmo me debati durante vários anos com a pergunta “Que é que eu devo fazer e o que eu devo esperar que Deus faça?”. Só quando compreendi o que a Bíblia ensina sobre essa questão e encarei então a minha própria responsabilidade, é que vi algum progresso na “busca de santidade”.

O título deste livro decorre da ordem bíblica: “Buscai a santificação, sem a qual ninguém verá o Senhor” (Hebreus 12.14; paráfrase do autor). A palavra busca sugere dois pensamentos: primeiro, que se requer diligência e esforço; segundo, que é uma tarefa para toda a vida. Estes dois pensamentos formam um duplo tema ao longo do livro. Ao mesmo tempo em que busquei apresentar, clara e precisamente, a provisão de Deus para a nossa santidade, salientei deliberadamente a nossa responsabilidade, pois sinto que esta é uma ênfase muito necessária entre os cristãos do nosso tempo. Simultaneamente, procurei enfatizar que a santidade é um processo, algo que nós nunca atingiremos por completo nesta vida. Na verdade, quando começamos a identificar-nos com a vontade de Deus numa área da vida, ele revela-nos a nossa necessidade noutro setor. É por isso que sempre estaremos empenhados na busca — sem a atingirmos completamente — de santidade nesta vida.

Além do meu próprio estudo bíblico pessoal sobre o tema da santidade, fui muito ajudado pelos escritos dos Puritanos — e dos que seguiram a sua escola de pensamento — sobre a questão da santidade. Em numerosas ocasiões, citei-os diretamente e indiquei esse fato nas notas de rodapé. Noutros casos, a sua fraseologia entrou na minha própria forma de expressão. Isto se verifica particularmente em relação aos escritos de John Owen e do Dr. D. Martyn Lloyd-Jones, de Londres. Os seus escritos sobre esse assunto têm constituído uma bênção valiosíssima para mim.

Não posso dizer que sei tudo sobre esse assunto, nem posso afirmar que tenha conseguido muito progresso pessoal. Frequentemente, enquanto escrevia este livro, tive de fazer primeiro

a aplicação à minha própria vida; mas o que eu descobri tem sido uma ajuda preciosa na minha própria busca de santidade e creio que o será também para todos os que o lerem.

Finalmente, quero expressar os meus agradecimentos à senhora Peggy Sharp e à senhorita Linda Dicks que, paciente e repetidamente, datilografaram os diversos rascunhos do manuscrito.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 - A santidade é para você$t$, 3,
$conteudo$Pois o pecado não os dominará, porque vocês não estão

debaixo da Lei, mas debaixo da graça.

R 6.14

A campainha do telefone abalou o sossego da bela e fresca manhã no Colorado. No outro lado da linha, estava um daqueles indivíduos absolutamente impossíveis, que Deus parece ter espalhado pela terra para provar a graça e paciência dos seus filhos.

Ele estava no melhor da sua forma nessa manhã — arrogante, impaciente, exigente. Desliguei o telefone, cheio de revolta, ressentimento e, talvez mesmo, ódio. Agarrei o meu casaco e saí para o ar fresco, tentando recompor-me. A serenidade da minha alma, tão cuidadosamente cultivada na minha “hora silenciosa” com Deus, nessa manhã, tinha ficado em farrapos e tinha sido substituída por um vulcão emocional volátil e fumegante.

Quando as minhas emoções acalmaram, a minha ira transformou-se em absoluto desânimo. Eram só 8h30 da manhã e o meu dia estava arruinado. Não me sentia só desanimado; sentia-me confuso. Apenas duas horas antes tinha lido a declaração enfática de Paulo: “Pois o pecado não os dominará, porque vocês não estão debaixo da Lei, mas debaixo da graça”. No entanto, apesar dessa linda promessa de vitória sobre o pecado, ali estava eu bem preso pela ira e ressentimento.

“Será que a Bíblia tem mesmo respostas para a vida real?” — perguntei a mim mesmo nessa manhã. Com todo o meu coração desejava viver uma vida obediente e santa; contudo, ali estava eu totalmente vencido por uma chamada telefônica.

Talvez este incidente lhe seja muito familiar. As circunstâncias talvez tenham sido diferentes, mas a sua reação foi semelhante. Talvez o seu problema fosse irritação com os filhos, uma crise temperamental no trabalho, um hábito imoral que não consegue vencer, ou mesmo alguns daqueles pecados que o assediam constantemente.

Qualquer que seja o seu problema específico de pecado (ou problemas), a Bíblia tem realmente a resposta para você. Há esperança. Cada um de nós pode andar em obediência à Palavra de Deus e viver uma vida de santidade. De fato, como veremos no próximo capítulo, Deus espera que cada cristão viva uma vida santa. A santidade, contudo, não é só esperada; é um direito de nascença prometido a cada cristão. A afirmação de Paulo é verdadeira. O pecado não nos dominará.

O conceito de santidade pode parecer um tanto arcaico para a nossa geração atual. Para algumas mentes, o próprio termo santidade evoca imagens de cabelo preso atrás, saias compridas e meias pretas. Para outras, a ideia aparece associada com a atitude repugnante do que diz, “sou mais santo que você”. No entanto, santidade é uma ideia muito bíblica. O termo santo aparece, em diversas formas, mais de 600 vezes na Bíblia. Um livro inteiro, Levítico, é dedicado ao assunto, e a ideia de santidade está entretecida em todo o texto das Escrituras. Mais importante ainda é vermos que Deus ordena especificamente que sejamos santos (veja Levítico 11.44).

A ideia exata de como se pode ser santo tem sofrido, em virtude de muitos conceitos falsos. Em alguns círculos, a santidade é identificada com uma série de proibições específicas — geralmente em áreas tais como fumar, beber e dançar. A lista de proibições varia de acordo com o grupo. Quando seguimos essa via para a santidade, corremos o risco de nos tornarmos como os fariseus, com as suas listas triviais e intermináveis de “faças e não faças”, e a sua atitude de autojustiça. Para outros, santidade significa certo estilo de vestuário e maneirismos. Para outros ainda significa perfeição inatingível, uma ideia que fomenta o engano ou desencorajamento em relação ao pecado pessoal.

Todas essas ideias, embora exatas em certa medida, não transmitem o verdadeiro conceito de santidade. Ser santo é ser moralmente irrepreensível.[1] É ser separado do pecado e, portanto, consagrado a Deus. O termo significa “separação para Deus e a conduta apropriada aos que são separados”.[2]

Talvez a melhor maneira de se entender o conceito de santidade seja notar como é que os escritores do Novo Testamento usaram a palavra. Em 1 Tessalonicenses 4.3-7, Paulo empregou o termo em contraste com uma vida de imoralidade e impureza. Pedro usou-o também em oposição a uma vida voltada para os desejos ímpios que alimentávamos quando vivíamos desligados de Cristo (1 Pedro 1.14-16). João contrastou aquele que é santo com os que fazem o mal e são perversos (Apocalipse 22.11). Viver uma vida santa é, pois, viver uma vida em conformidade com os preceitos morais da Bíblia e em oposição aos caminhos pecaminosos do mundo. É viver uma vida caracterizada pelo “despir-se do velho homem, que se corrompe por desejos enganosos… [e] revestir-se do novo homem, criado para ser semelhante a Deus em justiça e santidade provenientes da verdade” (Efésios 4.22, 24).

Se a santidade é, pois, tão básica para a vida cristã, por que não a experimentamos mais no dia-a-dia? Por que é que tantos cristãos se sentem constantemente derrotados na sua luta com o pecado? Por que é que a igreja de Jesus Cristo parece tantas vezes estar mais em conformidade com o mundo que a rodeia do que com Deus?

Com risco de simplificarmos demasiadamente, as respostas a estas questões podem agrupar-se em três áreas básicas de problemas.

O nosso primeiro problema é que a atitude que assumimos em relação ao pecado se centra mais em nós do que em Deus. Estamos mais preocupados com a nossa “vitória” sobre o pecado do que com o fato de que os nossos pecados entristecem o coração de Deus. Não podemos tolerar o fracasso na nossa luta com o pecado, principalmente porque estamos mentalizados para o sucesso, e não por sabermos que esse pecado constitui uma ofensa a Deus.

W. S. Plumer disse: “Nunca teremos uma visão correta do pecado, enquanto não o encararmos como praticado contra Deus… Todo pecado é contra Deus neste sentido: é a sua Lei que é transgredida, a sua autoridade que é desprezada, o seu governo que é considerado sem valor algum… Faraó e Balaão, Saul e Judas, todos disseram: ‘Eu pequei’; mas o filho pródigo que voltou disse: ‘Eu pequei contra o céu e perante ti’; e Davi afirmou: ‘Contra ti, contra ti somente pequei’”.[3]

Deus quer que andemos em obediência — não em vitória. A obediência é orientada para Deus; a vitória é orientada para nós mesmos. Isso pode parecer de pouca importância, mas há uma atitude sutil e egocêntrica na raiz de muitas das nossas dificuldades com o pecado. Enquanto não enfrentarmos essa atitude e acabarmos com ela, não iremos andar consistentemente em santidade.

Não quero dizer com isso que Deus não deseja que experimentemos vitória; pretendo sim enfatizar que a vitória é um resultado natural da obediência. Quando nos concentramos em viver uma vida obediente e santa experimentamos certamente a alegria da vitória sobre o pecado.

O nosso segundo problema é que temos entendido erradamente que “viver pela fé” (Gálatas 2.20) significa que não se exige qualquer esforço da nossa parte em relação à santidade. De fato, temos mesmo apresentado a ideia de que qualquer esforço da nossa parte é “da carne”.

As palavras de J. C. Ryle, Bispo de Liverpool, de 1880 a 1900, podem elucidar-nos bastante neste ponto:

“Será sábio proclamar de forma tão direta, crua e sem

qualificação, como muitos estão fazendo, que a

santidade de pessoas convertidas se dá pela fé

somente, e de maneira alguma pelo esforço pessoal?

Ela se torna uma realidade segundo a proporção da

Palavra de Deus? Duvido disso. Que a fé em Cristo é a

raiz de toda a santidade, que o primeiro passo em uma

vida santa é confiar em Cristo, que enquanto não cremos

não temos o menor sinal de santidade, que a união com

Cristo mediante a fé é o segredo tanto do início como da

continuação na santidade, que a vida que vivemos na

carne deve ser vivida pela fé no Filho de Deus, que a fé

purifica o coração, que a fé é a vitória que vence o

mundo, que pela fé os antigos obtiveram bom nome —

são verdades que nenhum crente bem-instruído jamais

pensaria em negar. Mas, as Escrituras certamente nos

ensinam que para seguir a santidade o verdadeiro crente

precisa exercer esforço pessoal e trabalhar tanto quanto

ter fé”.[4]

Temos de encarar o fato de que somos responsáveis, pessoalmente, pela nossa vida de santidade. Num certo domingo, o nosso pastor afirmou, no seu sermão, algo sobre esse assunto: “Você pode acabar com esse hábito que tem te dominado, se realmente o desejares”. Como ele estava referindo-se a um determinado hábito que não constituía problema para mim, concordei imediatamente com ele, em pensamento. Mas então o Espírito Santo disseme: “E você pode acabar com os hábitos pecaminosos que te escravizam, se aceitares a tua responsabilidade pessoal em relação a eles”. O fato de reconhecer que tinha mesmo essa responsabilidade, tornou-se um marco importante na minha própria busca de santidade.

O nosso terceiro problema é que não levamos a sério alguns pecados. Temos, naturalmente, classificado os pecados em duas categorias: aqueles que são inaceitáveis e aqueles que se podem tolerar um pouco. Um incidente que ocorreu, precisamente quando este livro estava quase terminado, ilustra o problema. O nosso escritório estava utilizando uma casa móvel como extensão do escritório, até que estivessem prontas as novas instalações. Como a nossa propriedade não estava classificada para alojar casas móveis, tivemos de pedir uma licença especial para ocupar essa casa. Tivemos de renovar diversas vezes essa licença. A última expirou precisamente na altura em que as novas instalações ficaram prontas, mas antes de termos tempo de fazermos devidamente a mudança. Isso precipitou uma crise para o departamento que se encontrava funcionando na casa móvel.

Numa reunião em que esse problema foi discutido, levantou-se a questão: “Que diferença faria se só mudássemos esse departamento dali a uns dias?”. Bem, que diferença faria, realmente? Afinal de contas, a casa estava situada atrás de alguns montes onde ninguém a veria e, legalmente, nós não precisávamos mudar a casa; apenas esvaziá-la. Então, que diferença faria se excedêssemos a licença em poucos dias? Não será a insistência em obedecer à letra da lei um legalismo exagerado?

Mas as Escrituras dizem que são “as raposinhas que estragam as vinhas” (Cantares de Salomão 2.15). É um compromisso nas coisas pequenas que conduz a maiores quedas. E quem é que pode dizer que uma pequena desobediência à lei civil não é um pecado sério aos olhos de Deus?

Comentando algumas das mais minuciosas leis dietéticas do Antigo Testamento, que Deus deu aos filhos de Israel, Andrew Bonar disse:

Não é a importância da coisa em si, mas a majestade do

Legislador que deve constituir o padrão de obediência…

Alguns, na verdade, talvez classifiquem regras

minuciosas e arbitrárias desse gênero como

insignificantes; mas o princípio envolvido na obediência

ou desobediência não era senão o mesmo princípio que

foi posto à prova no Éden, aos pés da árvore proibida. É

este: deverá o Senhor ser obedecido em todas as

coisas, qualquer que seja a sua ordem? Será ele um

Legislador santo? Serão as suas criaturas obrigadas a

concordar implicitamente com a sua vontade?[5]

Estaremos nós dispostos a chamar “pecado” ao pecado, não por ele ser grande ou pequeno, mas porque a Lei de Deus o proíbe? Nós não podemos classificar o pecado por categorias se quisermos viver uma vida de santidade. Deus não nos deixará ir longe com esse tipo de atitude.

Estes três problemas serão tratados em mais pormenor em capítulos posteriores deste livro. No entanto, antes de prosseguir, dedique algum tempo a ordenar devidamente estes assuntos no seu coração, agora mesmo. Irá começar a olhar para o pecado como

uma ofensa contra um Deus santo, em vez de ver nele apenas um defeito pessoal? Irá começar a assumir a responsabilidade pessoal pelo seu pecado, reconhecendo que, ao fazê-lo, tem de depender da graça de Deus? Irá decidir obedecer a Deus em todas as áreas da vida, por mais insignificante que possa parecer o assunto?

Ao avançarmos, iremos considerar em primeiro lugar a santidade de Deus. É aí que realmente começa a santidade — não em nós mesmos, mas em Deus. É só quando vemos a sua santidade, a sua absoluta pureza e ódio moral ao pecado, que ganhamos consciência da gravidade do pecado contra o Deus santo. Ficar profundamente consciente desse fato é o primeiro passo na nossa busca de santidade.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 - A santidade de Deus$t$, 4,
$conteudo$Mas, assim como é santo aquele que os chamou, sejam santos vocês

também

em tudo o que fizerem, pois está escrito: “Sejam santos, porque eu sou

santo”.

1P 1.15-16

Deus chama todo o cristão a uma vida santa. Não há quaisquer exceções a esse chamado. Não se trata de um chamado apenas para pastores, missionários e alguns dedicados professores da Escola Dominical. Cada cristão de cada nação, seja rico ou pobre, culto ou inculto, influente ou totalmente desconhecido, é chamado a ser santo. O encanador cristão e o banqueiro cristão, a ignorada dona de casa e o poderoso chefe de Estado são igualmente chamados a serem santos.

Esse chamado para uma vida santa baseia-se no fato de que o próprio Deus é santo. Como Deus é santo, requer que sejamos santos. Muitos cristãos têm o que poderíamos chamar “santidade cultural”. Adaptam-se ao caráter e ao padrão de comportamento dos cristãos que os rodeiam. Como a cultura cristã à sua volta é mais ou menos santa, também esses cristãos são mais ou menos santos. Mas Deus não nos chamou para sermos como os que nos rodeiam. Chamou-nos para sermos como ele é. Santidade não é senão conformidade com o caráter de Deus.[6]

Tal como é usada na Escritura, santidade descreve a majestade de Deus e a sua pureza e perfeição moral. Santidade é um dos seus atributos;[7] isto é, a santidade é uma parte essencial

da natureza de Deus. A sua santidade é tão necessária como a sua existência, ou tão necessária, por exemplo, como a sua sabedoria ou onisciência. Precisamente como Deus não pode deixar de saber o que está certo, assim ele não pode deixar de fazer o que está certo.

Nós nem sempre sabemos o que está certo, o que é justo e correto. Por vezes, angustiamo-nos perante decisões com implicações morais. “Que devo realmente fazer?” — perguntamos. É claro que Deus nunca se defronta com uma situação desse gênero. O seu conhecimento perfeito impede qualquer indecisão quanto ao que é certo ou errado.

Às vezes, porém, mesmo quando sabemos o que está certo, existe uma certa relutância da nossa parte em fazê-lo. A ação correta pode envolver sacrifício, ou ser um golpe para o nosso orgulho (por exemplo, quando sabemos que devemos confessar um pecado a alguém), ou qualquer outro obstáculo. Mas também aqui está algo que nunca se verifica com Deus. Ele nunca vacila. Sempre faz o que é justo e reto, sem a menor hesitação. É impossível à própria natureza de Deus agir de modo diferente.

A santidade de Deus é, portanto, perfeita liberdade de todo o mal. Dizemos que uma peça de vestuário está limpa, quando está livre de qualquer mancha; que o ouro é puro, quando foi liberto de toda a escória. Desta maneira, podemos pensar na santidade de Deus como a ausência absoluta de qualquer mal nele. João afirmou: “Deus é luz, e não há nele trevas nenhumas” (1 João 1.5). Luz e trevas, quando usadas neste sentido nas Escrituras, têm significação moral. João está nos dizendo que Deus é absolutamente livre de qualquer mal moral e que é a essência da pureza moral.

A santidade de Deus inclui também a sua perfeita conformidade com o seu caráter divino. Isso quer dizer que todos os seus pensamentos e ações são consistentes com o seu caráter santo. Por contraste, consideremos as nossas próprias vidas. Com o tempo, quando amadurecemos na vida cristã, desenvolvemos certo grau de caráter cristão. Crescemos em áreas tais como verdade, pureza e humildade. No entanto, nem sempre agimos de modo

consistente com o nosso caráter. Dizemos uma mentira, ou deixamo-nos apanhar por uma série de pensamentos impuros. Ficamos então decepcionados conosco por essas ações, pois não estão em harmonia com o nosso caráter. Isso nunca acontece com Deus. Ele sempre age em harmonia com o seu caráter santo. É para esse padrão de santidade que Deus nos chama, quando diz: “Sede santos, porque eu sou santo”.

A absoluta santidade de Deus deve constituir um grande conforto e segurança para nós. Se Deus é plenamente santo, então podemos estar certos de que as suas ações para conosco são sempre perfeitas e justas. Somos muitas vezes tentados a questionar as ações de Deus e a queixar-nos de que ele é injusto na forma como nos trata. Essa é a mentira do diabo, a mesma que utilizou com Eva. Essencialmente, ele disselhe: “Deus está sendo injusto contigo” (Gênesis 3.4-5). Mas a própria natureza de Deus impede que ele, alguma vez, possa ser injusto. E, porque é santo, todas as suas ações são santas.

Temos de aceitar pela fé o fato de que Deus é santo, mesmo quando circunstâncias difíceis nos dão a impressão do contrário. Queixarmo-nos contra Deus é, com efeito, negar a sua santidade e dizer que ele não é justo. No século 17, Stephen Charnock disse: “É menos injurioso para Deus a negação do seu ser, que a negação da pureza do mesmo; um afirma que ele não existe como Deus, o outro apresenta um Deus deformado, desagradável e detestável… Aquele que diz que Deus não é santo diz algo muito pior que aquele que afirma que não há Deus”.[8]

Lembro-me ainda muito bem da maneira como Deus lidou pela primeira vez comigo, há mais de 25 anos, em relação às minhas queixas contra ele. Em resposta à sua vontade, eu tinha-me fixado em San Diego, Califórnia, e tinha começado a procurar trabalho. Algumas semanas passaram sem que nada tivesse conseguido. Comecei então a acusar mentalmente Deus. “Afinal de contas, abandonei os meus planos para fazer a sua vontade e agora ele abandona-me.” Deus, pela sua graça, dirigiu a minha atenção para Jó 34.18-19: “Não é ele que diz aos reis: 'Vocês nada valem', e aos nobres: 'Vocês são ímpios'? Não é verdade que ele não mostra

parcialidade a favor dos príncipes, e não favorece o rico em detrimento do pobre, uma vez que todos são obra de suas mãos?”. Logo que li esta passagem ajoelhei-me, confessando ao Senhor o meu terrível pecado de me queixar e questionar a sua santidade. Deus perdoou-me pela sua misericórdia e no dia seguinte recebi duas ofertas de trabalho.

O fato de reconhecermos a sua santidade é uma das razões porque devemos louvar a Deus. Conforme a visão que João teve do céu, e que vemos descrita em Apocalipse 4, as quatro criaturas viventes que estavam em torno do trono de Deus, nunca cessavam de dizer: “Santo, santo, santo é o Senhor, o Deus todo-poderoso, que era, que é e que há de vir" (Apocalipse 4.8). Os serafins da visão que Isaías teve da glória de Deus declararam também essa tripla atribuição de santidade a Deus (Isaías 6.3). Quando Moisés louvou a Deus pelo livramento dos israelitas, dos exércitos de Faraó, cantou igualmente a santidade de Deus:

“Quem entre os deuses é semelhante a ti, Senhor?

Quem é semelhante a ti? Majestoso em santidade,

terrível em feitos gloriosos, autor de maravilhas?”

(Êxodo 15.11)

Deus é muitas vezes designado nas Escrituras por nomes tais como O Santo. O Santo de Israel.[9] De acordo com Stephen Charnock,[10] o termo santo é usado mais vezes como prefixo do seu nome do que qualquer outro atributo. A santidade é a coroa de Deus. Imagine por um momento que Deus possua onipotência (poder infinito), onisciência (perfeito e completo conhecimento) e onipresença (presente em toda a parte), mas sem perfeita santidade. Tal ser já não poderia ser descrito como Deus. A santidade é a perfeição de todos os seus atributos: o seu poder é poder santo; a sua misericórdia é misericórdia santa; a sua sabedoria é sabedoria santa. É a santidade de Deus, mais do que qualquer outro atributo, que o torna verdadeiramente digno do nosso louvor.

Deus, todavia, requer mais de nós do que simplesmente reconhecermos a sua santidade. Ele diz-nos: “Sede santos, porque eu sou santo”. Deus tem realmente direito a exigir santidade perfeita de todas as suas criaturas morais. Não pode ser doutra maneira. Não é possível que ele ignore ou aprove qualquer mal cometido. Deus não pode, nem por um só momento, diminuir o seu padrão perfeito de santidade. Pelo contrário, tem de dizer, como de fato diz: “Sede santos em tudo o que fizerem”. O profeta Habacuque declarou: “Teus olhos são tão puros que não suportam ver o mal; não podes tolerar a maldade” (Habacuque 1.13). É por Deus ser santo que nunca pode desculpar ou passar por alto qualquer pecado que cometamos, por menor que nos pareça.

Às vezes, tentamos justificar diante de Deus alguma ação que a nossa própria consciência contesta, mas se realmente aprendermos o significado da santidade perfeita de Deus, tanto nele próprio como naquilo que nos ordena, veremos prontamente que jamais poderemos nos justificar, mesmo pelo mais leve desvio da sua perfeita vontade. Deus não aceita a desculpa, “Bem, eu sou assim mesmo”, ou mesmo a afirmação mais esperançosa, “Bem, eu estou crescendo nesta área da minha vida”.

Não. A santidade de Deus não deixa lugar para faltas leves ou fraquezas no nosso caráter pessoal. Fazemos bem, nós, os cristãos, embora sendo justificados unicamente pela justiça de Cristo, em ponderar atentamente as palavras do escritor da Epístola aos Hebreus: “Esforcem-se… para serem santos; sem santidade ninguém verá o Senhor” (Hebreus 12.14).

É por Deus ser santo que nunca pode tentar-nos a pecar. “Quando alguém for tentado, jamais deverá dizer: ‘Estou sendo tentado por Deus’. Pois Deus não pode ser tentado pelo mal, e a ninguém tenta” (Tiago 1.13). Provavelmente, jamais algum de nós imaginou que Deus esteja ativamente a solicitar-nos para fazermos o mal, mas podemos sentir que Deus nos colocou numa situação em que não temos alternativa.

O rei Saul sentiu isso mesmo na sua primeira grande campanha contra os filisteus (1 Samuel 13). Antes de ir para a batalha, Saul devia esperar sete dias até que o profeta Samuel

chegasse, oferecesse holocaustos e pedisse o favor do Senhor. Saul esperou os sete dias por Samuel. Ao ver que ele não aparecia, começou a ficar preocupado e resolveu ele mesmo oferecer os holocaustos. Saul sentiu que não tinha alternativa. As pessoas estavam com medo e começavam a dispersar-se; os filisteus estavam a reunir-se para a batalha; Samuel estava atrasado. Alguma coisa tinha de ser feita! Deus tinha-o colocado numa situação em que não tinha hipótese de escolha, pensava ele, senão desobedecer às instruções explícitas de Deus.

Mas, por ter desobedecido à vontade expressa de Deus, Saul perdeu o seu reino (1 Samuel 13.13-14). E nós? Será que nos convencemos também, por vezes, de que não temos alternativa senão escurecer um pouco a verdade, ou cometer só um ato levemente desonesto? Quando sentimos isso, estamos na realidade dizendo que Deus nos tenta a pecar, que nos colocou numa posição onde não temos alternativa.

As pessoas sujeitas à autoridade são particularmente vulneráveis a essa tentação. Os supervisores pressionam muitas vezes os seus subordinados no sentido de cometerem atos desonestos ou contrários à ética. Como jovem oficial da Marinha, eu enfrentei essa tentação. Por alguns quilos de café oferecidos às pessoas certas, o nosso barco poderia conseguir “de graça” toda a sorte de valioso equipamento de que precisávamos para fazer o trabalho. “E, afinal de contas” — argumentavam — “tudo pertence à Marinha.” Eu tive, finalmente, de me levantar diante do meu Comandante e, pondo em risco a minha carreira na Marinha, dizerlhe que não podia participar numa coisa daquelas.

É por Deus ser santo que odeia o pecado. Ódio é uma palavra tão forte que não gostamos de usá-la. Repreendemos os nossos filhos por dizerem que odeiam alguém. Contudo, quando se trata da atitude de Deus para com o pecado, só uma palavra tão forte como esta nos transmite a devida profundidade do seu significado. Referindo-se a vários pecados em Israel, Deus declara: “Porque eu odeio todas essas coisas” (Zacarias 8.17). O ódio é uma emoção legítima quando se trata de pecado. Na verdade, quanto mais crescemos em santidade, mais odiamos o pecado. Davi afirmou:

“Ganho entendimento por meio dos teus preceitos; por isso odeio todo caminho de falsidade” (Salmo 119.104). Ora, se isso é verdade em relação ao homem, pensemos no que é em relação a Deus. À medida que crescemos em santidade, crescemos no ódio ao pecado; e Deus, que é infinitamente santo, tem um ódio infinito pelo pecado.

Dizemos muitas vezes: “Deus odeia o pecado, mas ama o pecador”. Isso é, felizmente, verdade, mas muitas vezes passamos rapidamente por cima da primeira parte dessa afirmação, para chegarmos à segunda. Não podemos escapar do fato que Deus odeia os nossos pecados. Podemos considerar os nossos pecados insignificantes ou mesmo desculpá-los, mas Deus odeia-os.

Por essa razão, cada vez que pecamos estamos fazendo algo que Deus odeia. Ele odeia os nossos pensamentos sensuais, o nosso orgulho e ciúme, as nossas explosões de ira, a nossa racionalização de que os fins justificam os meios. Precisamos ganhar uma profunda consciência do fato que Deus odeia todas essas coisas. Acostumamo-nos de tal maneira aos nossos pecados que, por vezes, caímos num estado de pacífica coexistência com eles; mas Deus nunca cessa de odiá-los ou aborrecê-los.

Precisamos cultivar nos nossos corações ódio idêntico pelo pecado. O ódio do pecado como pecado, não apenas como algo que nos deixa inquietos ou vencidos, mas como algo que desagrada a Deus, está na raiz de toda a verdadeira santidade. Temos de cultivar a atitude de Josué, que disse ao ser tentado: “Como poderia eu, então, cometer algo tão perverso e pecar contra Deus?” (Gênesis 39.9).

Deus odeia o pecado onde quer que o encontre, esteja ele no santo ou no pecador. Deus não odeia o pecado numa pessoa e o passa por alto noutra. Ele julga as obras de cada ser humano imparcialmente (1 Pedro 1.17). De fato, a Bíblia mostra claramente que Deus pode julgar os pecados dos seus santos com maior severidade do que os do mundo. Davi era um homem segundo o próprio coração de Deus (Atos 13.22) e, no entanto, depois do seu pecado contra Urias foi-lhe dito: “Por isso, a espada nunca se afastará de sua família” (2 Samuel 12.10). Moisés, por um ato de

incredulidade, foi excluído da terra de Canaã, apesar de muitos anos de serviço fiel. Jonas, pela sua desobediência, foi lançado numa horrível prisão, no estômago dum peixe gigante, durante três dias e três noites, para aprender a não fugir das ordens de Deus.

No engano dos nossos corações, brincamos por vezes com a tentação, alimentando o pensamento de que podemos sempre confessar e, mais tarde, pedir perdão. Esse pensamento é terrivelmente perigoso. O juízo de Deus é imparcial. Ele nunca passa por alto o nosso pecado. Nunca resolve não se importar por achar que se trata dum pecado sem importância. Não. Deus odeia intensamente o pecado, sempre que, e onde quer que, o encontra.

A contemplação frequente da santidade de Deus e do seu consequente ódio pelo pecado é uma razão forte contra uma atitude leviana em relação ao pecado. Somos exortados a viver a nossa vida aqui na terra, como estrangeiros, em reverência e temor (1 Pedro 1.17). É evidente que o amor de Deus para conosco através de Jesus Cristo deve constituir a nossa principal motivação para a santidade. Mas uma motivação fortalecida pelo ódio de Deus ao pecado, e seu consequente juízo do mesmo, não é menos bíblica.

A santidade de Deus é um padrão muitíssimo elevado, um padrão perfeito; mas é, no entanto, um padrão que ele exige de nós. Deus não pode fazer menos que isso. Embora seja verdade que ele nos aceita unicamente através dos méritos de Cristo, o padrão divino para o nosso caráter, nossas atitudes, afetos e atos é: “Sede santos, porque eu sou santo”. Devemos levar isto muito a sério, se queremos realmente crescer em santidade.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 - A santidade não é uma opção$t$, 5,
$conteudo$Esforcem-se para viver em paz com todos e para serem santos; sem

santidade ninguém verá o Senhor.

H 12.14

Que significam realmente estas palavras “sem santidade ninguém verá o Senhor”? Será que, em última análise, a nossa salvação depende em certa medida de atingirmos algum nível de santidade pessoal?

Sobre esta questão, as Escrituras são claras em dois pontos. Primeiro, mesmo os melhores cristãos jamais poderão merecer a salvação através da sua santidade pessoal. As nossas obras de justiça são como trapos imundos à luz da Lei santa de Deus (Isaías 64.6). As nossas melhores obras estão manchadas e poluídas com imperfeição e pecado. Como um dos santos de há vários séculos afirmou, “mesmo as nossas lágrimas de arrependimento precisam ser lavadas no sangue do Cordeiro”.

Segundo, as Escrituras referem-se repetidamente à obediência e justiça de Cristo a nosso favor. “Logo, assim como por meio da desobediência de um só homem muitos foram feitos pecadores, assim também, por meio da obediência de um único homem muitos serão feitos justos” (Romanos 5.19). “Pois também Cristo sofreu pelos pecados uma vez por todas, o justo pelos injustos, para conduzir-nos a Deus” (1 Pedro 3.18). Essas duas passagens ensinam um duplo aspecto da obra de Cristo a nosso favor. São muitas vezes referidas como se aplicando à sua obediência ativa e à sua obediência passiva.

Obediência ativa significa a vida imaculada de Cristo aqui na terra, a sua perfeita obediência e absoluta santidade. Essa vida

perfeita é creditada aos que confiam nele para a sua salvação. A sua obediência passiva tem a ver com a sua morte na cruz, através da qual ele pagou plenamente o castigo dos nossos pecados e aplacou a ira de Deus para conosco. Em Hebreus 10.5-9 lemos que Cristo veio para fazer a vontade do Pai. Depois, o escritor diz: “Pelo cumprimento dessa vontade fomos santificados, por meio do sacrifício do corpo de Jesus Cristo, oferecido uma vez por todas” (Hebreus 10.10). Vemos, assim, que a nossa santidade diante de Deus depende inteiramente da obra de Jesus Cristo por nós, pela vontade de Deus.

Será que Hebreus 12.14 se refere então a essa santidade que temos em Cristo? Não, pois nesse ponto o autor fala duma santidade que devemos buscar; que devemos nos esforçar: “esforcem-se… para serem santos”. E sem essa santidade, diz o autor, ninguém verá o Senhor.

As Escrituras falam tanto da santidade que temos em Cristo diante de Deus, como duma santidade que nós devemos buscar. Esses dois aspectos da santidade complementam-se mutuamente, pois a nossa salvação é uma salvação para a santidade: “Porque Deus não nos chamou para a impureza, mas para a santidade” (1 Tessalonicenses 4.7). Aos coríntios, Paulo escreveu: “À igreja de Deus que está em Corinto, aos santificados em Cristo Jesus e chamados para serem santos” (1 Coríntios 1.2). O termo santificados aqui significa “feitos santos”. Isto quer dizer que, por Cristo, somos feitos santos, quando nos apresentamos diante de Deus, e chamados a ser santos na nossa vida diária.

O escritor de Hebreus está, portanto, dizendo-nos que devemos considerar seriamente a necessidade de santidade prática e pessoal. Quando o Espírito Santo entra nas nossas vidas no momento da nossa salvação, vem para nos fazer santos na prática. Se não existe, pelo menos, um desejo ardente no nosso coração de vivermos uma vida santa que agrade a Deus, temos de nos interrogar seriamente se a nossa fé em Cristo é genuína.

É verdade que esse desejo de santidade pode ser uma mera centelha ao princípio, mas essa centelha deve crescer até se transformar numa chama — um desejo de viver uma vida

plenamente agradável a Deus. A verdadeira salvação traz consigo um anseio de ser santo. Quando Deus nos salva por Cristo, não só nos salva do castigo do pecado, como também do seu domínio. O Bispo Ryle disse: “Realmente, duvido que tenhamos qualquer base para dizer que um homem pode converter-se sem que se consagre a Deus! Mais consagrado sem dúvida ele pode ser, e assim sucederá à medida em que a graça divina opere nele. Mas, se ele não se consagrou a Deus no dia em que se converteu e nasceu de novo, então, já não sei o que significa a conversão”.[11]

Todo o objetivo da nossa salvação é que sejamos “santos e irrepreensíveis em sua presença” (Efésios 1.4). Continuar a viver em pecado, como cristãos, é ir contra o propósito de Deus para a nossa salvação. Um dos escritores de há três séculos exprimiu-se nestes termos: “Que estranho tipo de salvação desejam aqueles que não se importam com a santidade!… Querem ser salvos por Cristo e, ao mesmo tempo, estarem sem Cristo, num estado carnal… Querem os seus pecados perdoados, não para poderem andar com Deus em amor, no futuro, mas para poderem praticar a sua inimizade contra ele, sem qualquer receio de castigo”.[12]

A santidade não é, portanto, necessária como condição da salvação — pois isso seria salvação pelas obras — mas como uma parte da salvação que é recebida pela fé em Cristo. O anjo disse a José: “Você deverá dar-lhe o nome de Jesus [que significa o Senhor salva], porque ele salvará o seu povo dos seus pecados” (Mateus 1.21).

Podemos, pois, dizer que ninguém pode confiar em Cristo para uma verdadeira salvação, a não ser que confie nele para a santificação. Isso não quer dizer que o desejo de santidade tenha de ser um desejo consciente no momento em que a pessoa vem a Cristo; quer dizer, sim, que o Espírito Santo que cria em nós uma fé salvadora também cria em nós um desejo de santidade. Ele, simplesmente, não faz uma coisa sem a outra.

Paulo afirmou: “Porque a graça de Deus se manifestou salvadora a todos os homens. Ela nos ensina a renunciar à impiedade e às paixões mundanas e a viver de maneira sensata, justa e piedosa nesta era presente” (Tito 2.11-12). A mesma graça

que traz salvação ensina-nos a renunciar a uma vida ímpia. Não podemos receber metade da graça de Deus. Se de fato a experimentamos, receberemos não só o perdão dos nossos pecados, mas também liberdade do domínio do pecado.

É essa a verdade que Tiago salienta no seu texto de difícil compreensão sobre a fé e as obras (veja Tiago 2.14-26). Ele está, simplesmente, a dizer-nos que uma “fé” que não resulta em obras — numa vida santa, em outras palavras — não é uma fé viva, mas morta, em nada superior à que os demônios possuem.

A natureza de Deus exige santidade na vida dum cristão. Quando ele nos chama para a salvação, chama-nos para a comunhão com ele e com seu Filho Jesus Cristo (1 João 1.3). Mas Deus é luz; nele não há trevas nenhuma (1 João 1.5). Como é que então podemos ter comunhão com ele se continuamos a andar em trevas?

A santidade é, pois, requerida para a comunhão com Deus. Davi fez a pergunta: “Se eu acalentasse o pecado no coração, o Senhor não me ouviria” (Salmos 66.18). Atender à iniquidade é acalentar algum pecado, amá-lo ao ponto de não estar disposto a separar-me dele. Sei que está lá, mas arranjo maneira de justificálo, como a criança que diz: “Bem, ele bateu-me primeiro”. Quando nos agarramos assim a algum pecado, não estamos buscando a santidade e não podemos ter comunhão com Deus.

Deus não exige uma vida perfeita e imaculada para termos comunhão com ele, mas requer, de fato, que encaremos seriamente a santidade, que nos entristeçamos com o pecado que existe nas nossas vidas, em vez de tentarmos justificá-lo, e que, fervorosamente, busquemos a santidade como uma maneira de viver.

A santidade é também exigida para o nosso próprio bem-estar. As Escrituras dizem: “O Senhor disciplina a quem ama, e castiga todo aquele a quem aceita como filho” (Hebreus 12.6). Essa afirmação pressupõe a nossa necessidade de disciplina, pois Deus não é levado por um capricho ao aplicá-la. Ele disciplina-nos, porque nós precisamos de disciplina.

Persistir na desobediência é aumentar a nossa necessidade de correção e disciplina. Alguns dos cristãos de Corinto persistiam na desobediência, ao ponto de Deus ter de lhes tirar a vida (1 Coríntios 11.30).

Davi descreveu deste modo a disciplina do Senhor: “Enquanto eu mantinha escondidos os meus pecados, o meu corpo definhava de tanto gemer. Pois dia e noite a tua mão pesava sobre mim; minhas forças foram-se esgotando como em tempo de seca” (Salmos 32.3-4).

Quando Deus nos fala acerca de algum pecado, temos de dar atenção e agir. Não resolver o problema desse pecado é arriscarmonos a ser salvo da correção do Senhor. Numa manhã gelada, quando eu entrava com o carro para o recinto da sede do The Navigators, onde trabalhava, o carro escapou-me do controle e foi bater num poste da vedação. Outra pessoa, em situação semelhante, já tinha entortado esse poste e eu apenas aumentei a curva. Não disse nada ao administrador da propriedade, a despeito de diversos impulsos suaves que Deus me deu nesse sentido. Duas semanas mais tarde, tive outro ligeiro acidente. Depois de mais de quinze anos sem qualquer acidente ao volante, senti que Deus estava tentando despertar a minha atenção. Chamei, portanto, o administrador, comuniquei-lhe o meu primeiro acidente e ofereci-me para pagar um novo poste. Como Pedro disse: “Portem-se com temor durante a jornada terrena de vocês” (1 Pedro 1.17). Deus leva a sério o problema da santidade na vida dos seus filhos e irá corrigir-nos até a alcançarmos.

A santidade é igualmente necessária para um serviço eficaz a Deus. Paulo escreveu a Timóteo: “Se alguém se purificar dessas coisas, será vaso para honra, santificado, útil para o Senhor e preparado para toda boa obra” (2 Timóteo 2.21). Santidade e utilidade andam juntas. Não podemos oferecer o nosso serviço a Deus num vaso impuro.

Aquele que torna o nosso serviço eficaz e que nos dá poder para o serviço é o Espírito Santo. Repare bem que ele é chamado Espírito Santo, ou Espírito de Santidade. Quando cedemos à nossa natureza pecadora e permanecemos na impiedade, o Espírito de

Deus é entristecido (Efésios 4.30) e não fará prosperar o nosso serviço. Não se trata aqui de momentos em que caímos em tentação mas logo buscamos o perdão e a purificação de Deus. Trata-se, sim, de vidas que são caracterizadas por um viver ímpio.

A santidade é também necessária para a nossa segurança da salvação — não no momento da salvação, mas no decurso da nossa vida. A verdadeira fé revelar-se-á sempre pelos seus frutos. “Portanto, se alguém está em Cristo, é nova criação. As coisas antigas já passaram; eis que tudo se fez novo!” (2 Coríntios 5.17).

Lembro-me dum jovem, cristão há pouco tempo, que foi visitado pelo pai. Já não o via há vários anos, mesmo antes de ter se convertido. Estava, portanto, ansioso por falar com ele da sua nova fé e nós orávamos juntos para que o jovem pudesse ser uma testemunha eficiente para o pai.

Alguns dias mais tarde, perguntei-lhe como é que tinha decorrido esse seu testemunho. Disseme então que o pai explicou que tinha confiado em Cristo como seu Salvador quando, um dia, foi “à frente”, com 10 anos de idade, num culto de evangelização. Perguntei então a esse rapaz: “Em todos esses anos, notaste alguma evidência de que ele era cristão?”. A sua resposta foi: “Não”. Que razão teremos para confiar na salvação desse homem? Ele já tinha quase 60 anos e nunca dera ao seu filho qualquer evidência de que era cristão.

A única evidência segura de que estamos em Cristo é uma vida santa. João afirmou que todo aquele que tem em si a esperança da vida eterna purifica-se a si mesmo como Cristo é puro (1 João 3.3). Paulo declarou: “Porque todos os que são guiados pelo Espírito de Deus são filhos de Deus” (Romanos 8.14). Se não sabemos nada dessa santidade, talvez nos convençamos a nós mesmos que somos cristãos, mas não temos o Espírito Santo em nós.

Assim, todo aquele que professa ser um cristão deve perguntar a si mesmo: “Haverá evidências de santidade prática na minha vida? Será que desejo e busco a santidade? Será que sinto tristeza com a falta dela e, fervorosamente, procuro a ajuda de Deus para ser santo?”.

Não são os que afirmam conhecer Cristo que entrarão no céu, mas aqueles cujas vidas são santas. Mesmo os que fazem “grandes obras cristãs” não entrarão no céu, a não ser que também façam a vontade de Deus. Jesus disse:

“Nem todo aquele que me diz: ‘Senhor, Senhor’, entrará no

Reino dos céus, mas apenas aquele que faz a vontade de

meu Pai que está nos céus.

Muitos me dirão naquele dia: ‘Senhor, Senhor, não

profetizamos em teu nome? Em teu nome não expulsamos

demônios e não realizamos muitos milagres?’ Então eu lhes

direi claramente: Nunca os conheci. Afastem-se de mim vocês,

que praticam o mal!” (Mateus 7.21-23).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 - A santidade de Cristo$t$, 6,
$conteudo$Deus tornou pecado por nós aquele que não tinha pecado, para que nele nos

tornássemos justiça de Deus.

2C 5.21

Antes de falar mais da santidade em nós próprios, é bom que consideremos também a santidade de Cristo. Precisamos dela, primeiro que tudo, para termos bases bem firmes para a nossa segurança em Cristo. À medida que formos estudando mais plenamente as implicações do mandamento “Sede santos, porque eu sou santo”, iremos ver mais da nossa própria pecaminosidade. Veremos a impiedade e engano do nosso coração e o quanto ficamos aquém da perfeita santidade de Deus. Quando isto acontece, o verdadeiro cristão corre, em seu coração, a buscar refúgio em Cristo. É importante, pois, que compreendamos a justiça de Cristo e o fato de que a sua justiça nos é creditada.

Em numerosas ocasiões, as Escrituras testificam que Jesus, durante a sua vida na terra, viveu uma vida perfeitamente santa. Ele é descrito como “sem pecado” (Hebreus 4.15); como aquele que “não cometeu pecado” (1 Pedro 2.22); e como “aquele que não tinha pecado” (2 Coríntios 5.21). O apóstolo João declarou: “Nele não há pecado” (1 João 3.5). O Antigo Testamento descreveu-o profeticamente como “o Justo” (Isaías 53.11) e como um que “ama a justiça e odeia a iniquidade” (Salmo 45.7). Estas afirmações, extraídas de seis diferentes escritores bíblicos, mostram que o ensino universal da Bíblia é que Jesus Cristo não pecou.

Ainda mais forte, contudo, é o próprio testemunho de Jesus a respeito de si mesmo. Em certa ocasião, ele fixou os fariseus bem nos olhos e perguntou: “Qual de vocês pode me acusar de algum

pecado?” (João 8.46). Como alguém observou, o mais importante não foi o fato de eles não terem respondido a esta pergunta, mas o fato de Jesus ousar fazê-la. Ali estava Jesus, em direto confronto com pessoas que o odiavam. Tinha acabado de lhes dizer que eles tinham por pai o diabo e que realizavam os desejos dele. Sem dúvida que, se havia pessoas ansiosas por apontar a Jesus algum pecado, ou falta no seu caráter, essas pessoas seriam os fariseus. Além do mais, Jesus fez esta pergunta na presença dos seus discípulos que viviam sempre com ele e tinham constantemente oportunidade de observar qualquer falta. No entanto, Jesus ousou fazer tal pergunta, porque estava certo de que só havia uma resposta: ele não tinha pecado.

A santidade de Jesus era, no entanto, mais do que a simples ausência de pecado. Era também uma identificação perfeita com a vontade de seu Pai. Ele declarou que veio do céu — “não para fazer a minha vontade, mas para fazer a vontade daquele que me enviou” (João 6.38). Noutra ocasião, disse: “A minha comida é fazer a vontade daquele que me enviou” (João 4.34). Talvez o maior testemunho que Jesus deu de sua santidade positiva seja esta afirmação: “Eu sempre faço o que lhe (a Deus) agrada” (João 8.29).

Uma declaração tão positiva tem de incluir, não só as suas ações, mas, igualmente, as suas atitudes e motivos. Nós podemos fazer a ação correta, levados por um motivo errado, o que não agrada a Deus. A santidade implica mais do que meros atos. Os nossos motivos têm de ser santos, isto é, brotar dum desejo sincero de fazer algo, simplesmente, por ser da vontade de Deus. Os nossos pensamentos devem ser santos, porque são conhecidos por Deus, mesmo antes de se formarem na nossa mente. Jesus Cristo satisfez perfeitamente estes padrões, e fê-lo por nós. Ele nasceu neste mundo sujeito à Lei de Deus para poder cumpri-la em nosso favor (Gálatas 4.4-5).

Sempre que seriamente contemplamos a santidade de Deus, a nossa reação natural é dizer como Isaías: “Ai de mim! Estou perdido! Pois sou um homem de lábios impuros e vivo no meio de um povo de lábios impuros; os meus olhos viram o Rei, o S dos Exércitos” (Isaías 6.5).

Uma séria visão da santidade de Deus — a sua própria perfeição moral e infinito ódio ao pecado — deixar-nos-á, como deixou Isaías, profundamente convictos da nossa própria carência de santidade. A sua pureza moral contribui para ressaltar a nossa impureza.

É, pois, importante que recebamos a mesma segurança que Isaías recebeu: “Veja… a sua culpa será removida, e o seu pecado será perdoado” (Isaías 6.7). Não é só no ponto inicial da salvação que precisamos desta segurança. De fato, quanto mais crescemos em santidade, mais precisamos da certeza de que a justiça perfeita de Cristo nos é creditada. Isto é verdade, porque uma parte do crescimento em santidade é que o Espírito Santo nos faz sentir profundamente que precisamos de santidade. Quando sentimos essa carência, é bom que tenhamos sempre em mente a justiça de Jesus Cristo a nosso favor e o fato de que Deus “tornou pecado por nós aquele que não tinha pecado, para que nele nos tornássemos justiça de Deus” (2 Coríntios 5.21).

A verdade da nossa aceitação por Deus, através da justiça de Cristo, pode parecer tão elementar que talvez você se pergunte por que ela é tão realçada aqui. A razão é que precisamos estar bem firmes nela para resistirmos aos ataques de Satanás. O Espírito Santo torna-nos mais conscientes da nossa falta de santidade para nos estimular a um anseio mais profundo e a uma busca constante de santidade. Mas Satanás procurará usar a obra do Espírito Santo para nos desencorajar.

Um dos ataques de Satanás consiste em tentar convencer-nos de que, afinal de contas, não somos um cristão genuíno. Ele dirá algo, mais ou menos assim: “Um verdadeiro cristão não teria os maus pensamentos que tu tens tido hoje”. Ou talvez há seis meses Satanás não tivesse vindo com tal argumento, por não o ver preocupado com esse assunto. Mas agora que o Espírito Santo começou a mostrar-lhe quão pecaminoso eram os seus pensamentos de sensualidade, ressentimento e orgulho, você poderá começar a duvidar da sua salvação.

Há alguns anos, Deus estava permitindo que eu atravessasse algumas lutas profundas para me ensinar algo sobre o pecado do

meu coração. Durante esse período, eu dirigia um estudo bíblico semanal numa base militar, a cerca duma hora de distância, de carro, do local onde eu vivia. Todas as segundas-feiras à noite, quando deixava a comunhão do grupo de estudo bíblico e começava a viagem solitária de regresso a casa, Satanás começava a atacar-me: “Como é que uma pessoa que está enfrentando as lutas que você enfrenta pode ser um cristão?” — perguntava ele. Eu comecei a combatê-lo, recorrendo a um velho hino que começava com estas palavras:

“Tal qual estou, eis-me, Senhor,

Pois o teu sangue remidor,

Verteste pelo pecador;

Ó Salvador, me achego a ti.”

Eu cantava esse hino e, quando chegava ao fim, já estava louvando a Deus pela sua salvação, que me havia oferecido de graça através de Jesus Cristo.

Também o leitor, se diligentemente buscar a santidade, terá muitas vezes de fugir para a Rocha da sua salvação. Fugirá para lá, não para ser salvo de novo, mas para confirmar no seu coração que está salvo, unicamente através da justiça de Cristo. Começará a identificar-se com Paulo quando afirmou: “Esta afirmação é fiel e digna de toda aceitação: Cristo Jesus veio ao mundo para salvar os pecadores, dos quais eu sou o pior” (1 Timóteo 1.15). É neste ponto que a vida santa que Cristo viveu a nosso favor se torna tão importante para cada um de nós.

Uma segunda razão porque precisamos considerar a santidade de Cristo é que a sua vida deve constituir um exemplo de santidade para nós. Pedro diz: “Cristo sofreu no lugar de vocês, deixando-lhes exemplo, para que sigam os seus passos” (1 Pedro 2.21). Pedro referia-se, particularmente, ao sofrimento de Cristo, sem espírito de vingança, mas no versículo seguinte afirmou também que Cristo não cometeu pecado. Paulo exortou-nos a

sermos imitadores de Deus (Efésios 5.1) e afirmou ainda: “Tornemse meus imitadores, como eu o sou de Cristo” (1 Coríntios 11.1).

Veremos pois, claramente, que a vida santa e irrepreensível de Jesus Cristo deve constituir um exemplo para nós. Consideremos então a sua afirmação: “Faço sempre o que lhe agrada”. Será que ousamos aceitar isto como nosso alvo pessoal na vida? Estaremos sinceramente dispostos a examinar todas as nossas atividades, todos os nossos alvos e planos e todas as nossas ações impulsivas à luz desta afirmação: “Eu estou fazendo tudo para agradar a Deus”?

Se fizermos honestamente essa pergunta, começaremos a mudar. Sabemos que fazemos algumas coisas, boas em si, com o objetivo de ganhar admiração em relação a nós próprios, e não para a glória de Deus. Fazemos outras coisas claramente para nosso próprio prazer, sem qualquer preocupação com a glória de Deus.

Qual é a minha reação quando o valentão da vizinhança importuna o meu menino? Em geral, a minha primeira reação brota dum espírito de vingança, até que o Espírito Santo me lembra o exemplo de Jesus. Como é que encaramos os que não revelam qualquer amor para conosco? Vemo-los como pessoas por quem Cristo morreu? Ou como pessoas que nos dificultam a vida?

Lembro-me dum desagradável encontro de negócios que tive um dia com um indivíduo, que mais tarde se tornou cristão através do testemunho de alguém. Quando tive conhecimento do fato, fiquei mortificado por verificar que nunca tinha pensado nele como alguém por quem Cristo morreu, mas apenas como um indivíduo com quem tivera uma experiência desagradável. Precisamos aprender a seguir o exemplo de Cristo, que era movido por uma profunda compaixão pelos pecadores, e que conseguia orar por elas, mesmo enquanto o pregavam na cruz do Calvário.

Nas palavras do teólogo escocês do século XIX, John Brown, “a santidade não consiste em especulações místicas, fervores exaltados ou austeridades sem base bíblica; consiste, sim, em pensarmos como Deus pensa e queremos como Deus quer”.[13] A santidade também não significa, como tantas vezes se pensa, aderir a uma lista de “Faças e não faças”, predominantemente com “Não

faças”. Quando Cristo veio ao mundo, disse: “Aqui estou… para fazer a tua vontade, ó Deus” (Hebreus 10.7). Esse é o exemplo que devemos seguir. Em todos os nossos pensamentos, todas as nossas ações, em cada parte do nosso caráter, o princípio governante que nos motiva e guia deveria ser o desejo de seguir a Cristo em fazer a vontade do Pai. Essa é a estrada que devemos seguir na busca da santidade.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 - Uma mudança de reinos$t$, 7,
$conteudo$Pois sabemos que o velho homem foi crucificado com ele, para que o corpo

do pecado seja destruído, e não mais sejamos escravos do pecado; pois

quem morreu, foi justificado do pecado.

R 6.6-7

Muitos cristãos têm o desejo básico de viver uma vida santa, mas acabaram por se convencer que simplesmente não conseguem. Têm lutado ao longo dos anos com pecados específicos ou defeitos de caráter. Embora não vivam em pecado flagrante, desistiram mais ou menos de alguma vez atingir uma vida de santidade e acomodaram-se a uma vida de mediocridade moral, em que nem eles, nem Deus têm prazer. A promessa de Romanos 6.6-7 parece totalmente para além das suas possibilidades. As fortes exortações das Escrituras para viver uma vida sempre santa só contribuem para deixá-los frustrados.

Muitos têm procurado viver uma vida santa pela sua própria força de vontade; outros tentaram consegui-lo unicamente pela fé. Muitos têm agonizado em oração sobre certos pecados, aparentemente sem qualquer resultado. Inúmeros livros têm sido escritos para nos ajudarem a descobrir o “segredo” da “vida vitoriosa”.

Na nossa busca de respostas para os nossos problemas do pecado, surge uma questão perturbadora: “Que devo eu esperar de Deus, e qual é a minha responsabilidade?”. Muitos se sentem confusos neste ponto. Quando começamos pela primeira vez a viver a vida cristã, assumimos confiadamente que descobriremos, simplesmente, na Bíblia o que Deus quer que façamos e então

começaremos a fazê-lo. Não levamos em conta a nossa tendência de nos agarrarmos à nossa velha vida de pecado.

Depois de experimentarmos muitos fracassos com a nossa natureza pecadora, dizem-nos que estamos tentando viver a vida cristã na energia da carne. Precisamos “parar de tentar e começar a confiar” ou “desistir e deixar Deus agir”. Dizem-nos também que se, simplesmente, entregarmos o problema do nosso pecado a Cristo e descansarmos na obra que consumou no Calvário, ele viverá então a sua vida em nós, e nós experimentaremos uma vida de vitória sobre o pecado.

Depois de termos experimentado fracasso e frustração com o problema do nosso pecado, ficamos maravilhados ao ouvir que Deus já fez tudo e nós só precisamos confiar na sua obra perfeita em Jesus Cristo. Depois de nos termos debatido com os nossos pecados, a ponto de desesperar, esta nova ideia é como uma boia salvadora lançada a um náufrago. É quase como ouvir o evangelho pela primeira vez.

Mas passado algum tempo, se quisermos ser realmente honestos, descobrimos que continuamos a experimentar derrotas às mãos da nossa natureza pecadora. A vitória que nos foi garantida continua a escapar-nos. Ainda nos debatemos com o orgulho, o ciúme, o materialismo, a impaciência e a sensualidade. Continuamos a comer demais, a desperdiçar o tempo, a criticar os outros, a encobrir um pouco a verdade e a ceder a uma porção doutros pecados, odiando-nos sempre por os termos cometido.

Perguntamos, então, o que está errado. “Por que é que eu não posso” — perguntamos a nós próprios — “experimentar a vitória descrita em todos os livros e que os outros parecem ter experimentado?” Começamos a sentir que algo está particularmente errado conosco, que, de algum modo, a nossa natureza pecaminosa deve ser pior que a dos outros. Entramos então em desespero.

Há alguns anos, um amigo cristão alertou-me para o fato que Satanás tentaria confundir-nos sobre a questão do que Deus tem feito por nós e do que nós devemos fazer por nós próprios. Vim a compreender a sua razão com essas palavras. Falta de compreensão nesse assunto tem levado a grande confusão na

nossa busca de santidade. É muito importante que façamos esta distinção; Deus fez de fato provisão para nós vivermos uma vida santa, mas deu-nos também responsabilidades definidas.

Vamos considerar em primeiro lugar a provisão de Deus para nós.

Na Bíblia, lemos: “Portanto, não permitam que o pecado continue dominando os seus corpos mortais, fazendo que vocês obedeçam aos seus desejos” (Romanos 6.12).[14] A primeira coisa que devemos notar nessa passagem é que a busca de santidade — este não consentir que o pecado reine no nosso corpo mortal — é algo que nós temos de fazer. As palavras de Paulo constituem uma exortação. Ele dirigiu-se à nossa vontade, ao afirmar: “Portanto, não permitam que o pecado”, deixando implícito que somos responsáveis por isso. A experiência de santidade não é um dom que recebemos, como a justificação, mas algo que somos claramente exortados a conseguir com esforço.

A segunda coisa a notar na exortação de Paulo é que ela se baseia no que ele acabara de fazer. Repare na palavra de ligação, portanto. É evidente que ele queria dizer algo como isto: “Em vista do que acabei de dizer, não deixem que o pecado reine no vosso corpo mortal”. Por outras palavras, devemos buscar santidade porque certos fatos são verdadeiros.

Quais são esses fatos?

Atentemos em Romanos 6. Em resposta à pergunta “Continuaremos pecando para que a graça aumente?”, Paulo disse: “Nós, os que morremos para o pecado, como podemos continuar vivendo nele?” (vs. 1-2). Depois, o apóstolo Paulo desenvolveu essa ideia (vs. 3-11). É evidente que a palavra portanto (v. 12) se refere a esse mesmo fato de que nós morremos para o pecado. É exatamente por morrermos para o pecado que não devemos consentir que ele reine em nosso corpo mortal.

Se realmente desejamos obedecer à exortação do versículo 12, é fundamental que entendamos o que Paulo pretendia dizer com a expressão, mortos para o pecado. Ao lermos essa passagem, a primeira coisa que notamos é que a nossa morte para o pecado resulta da nossa união com Cristo (vs. 2-11). É porque ele morreu

para o pecado, que nós morremos para o pecado. Assim, torna-se evidente que a nossa morte para o pecado não é algo que nós fazemos, mas algo que Cristo fez e cujo valor se estende a todos os que se encontram unidos a ele.

A segunda observação que podemos fazer é que a nossa morte para o pecado é um fato, quer nós o reconheçamos, quer não. Porque Cristo morreu para o pecado, todos os que estão unidos a ele morreram também para o pecado. A nossa morte para o pecado não é algo que nós fazemos, ou que podemos tornar realidade na nossa experiência por considerarmos que seja assim. Alguns têm entendido mal este ponto. Adquirimos a ideia de que ter morrido para o pecado significa estar, de certo modo, afastado da possibilidade de o pecado nos tocar. Contudo, para experimentarmos isso na nossa vida diária lemos que temos de nos considerar a nós próprios mortos para o pecado (v. 11). Lemos ainda mais adiante que, se não estamos experimentando vitória sobre pecados que nos assediam, é porque não estamos considerando o fato de que morremos para o pecado. Nós temos, sem dúvida, considerar — ou ter em conta — que estamos mortos para o pecado, mas essa nossa consideração não torna isso realidade, mesmo na nossa experiência. Os versículos 11 e 12 têm de ser encarados em conjunto. É por estarmos mortos para o pecado, através da nossa união com Cristo, que não devemos deixar que o pecado reine no nosso corpo mortal. A nossa experiência diária no tocante ao pecado é determinada — não pela nossa consideração, mas pela nossa vontade — pelo fato de consentirmos, ou não, em que o pecado reine no nosso corpo. Todavia, a nossa vontade tem de ser influenciada pelo fato de que morremos para o pecado.

Que quer dizer, então, Paulo com a sua expressão mortos para o pecado? Quer dizer que nós morremos para o domínio do pecado, ou para o reinado do pecado. Antes de confiarmos em Jesus Cristo para a nossa salvação, estávamos no reino de Satanás e do pecado. “… quando seguiam a presente ordem deste mundo e o príncipe do poder do ar (o diabo)” (Efésios 2.2). Estávamos sob o poder de Satanás (Atos 26.18) e do domínio das trevas (Colossenses 1.13). Paulo afirmou que éramos escravos do pecado (Romanos 6.17), que nascemos neste reino de pecado, escravidão

e morte. Todo aquele que viveu depois de Adão, exceto o Filho de Deus encarnado, nasceu escravo no reino do pecado e de Satanás.

Contudo, através da nossa união com Cristo, nós morremos para esta esfera do pecado. Somos libertos do pecado (Romanos 6.18), resgatados do domínio das trevas (Colossenses 1.13) e tirados do poder de Satanás para Deus (Atos 26.18). Antes da nossa salvação, estávamos presos ao pecado, sob o reinado e governo do pecado. Independentemente de sermos pessoas decentes e morais, vivíamos no reino do pecado. Mas agora, através da nossa união com Cristo na sua morte para o pecado, fomos libertos do reino do pecado e colocados no reino e esfera da justiça.[15]

Comentando a expressão mortos para o pecado, o Professor John Murray disse: “Se encararmos o pecado como um reino ou esfera, então teremos de afirmar que o crente não mais vive neste reino ou esfera. E, assim como é verdade que, no tocante à vida física neste mundo, a pessoa morta desapareceu — ‘… procurei-o, e já não foi encontrado’ (Sl 37.36; cf. 103.16) — assim também acontece no tocando ao âmbito do pecado; o crente não se acha mais ali, portanto morreu para o pecado… O crente morreu para o pecado de uma vez por todas e foi transferido para outro reino”.[16]

Por nós estarmos nesse reino de pecado, sob o seu reinado e governo, é que começamos a pecar desde a infância. Por sermos escravos, agíamos como escravos. Formamos hábitos pecaminosos e um caráter pecaminoso. Mesmo que fôssemos o que o mundo considera “bons”, vivíamos para nós próprios, não para Deus. A nossa atitude para com Cristo expressava-se pelas palavras dos seus inimigos: “Não queremos que este reine sobre nós” (Lucas 19.14, ARA).

Contudo, se já fomos libertos deste reino, por que é que ainda pecamos? Embora Deus nos tenha libertado do reino do pecado, a nossa natureza pecaminosa ainda reside em nós. Embora o domínio e governo do pecado tenham sido vencidos, o pecado que ainda permanece nos crentes exerce um tremendo poder, trabalhando incessantemente para o mal.

Uma ilustração da Guerra pode ajudar-nos a ver a verdade deste fato. Numa certa nação, duas facções lutavam entre si pelo controle do país. A certa altura, com a ajuda dum exército externo, uma das facções ganhou a guerra e assumiu o controle do governo da nação. Mudou, simplesmente, a sua tática para luta de guerrilha e continuou a combater. De fato, foram tão bem sucedidos que o país que dava essa ajuda externa não conseguia retirar as suas tropas.

Assim acontece com o cristão. Satanás foi vencido e o reino do pecado derrubado; mas a nossa natureza pecaminosa recorreu a um tipo de guerrilha para nos conduzir ao pecado. Isto resulta num combate entre o Espírito e a nossa natureza pecaminosa a que Paulo se referiu: “Pois a carne deseja o que é contrário ao Espírito; e o Espírito, o que é contrário à carne. Eles estão em conflito um com o outro, de modo que vocês não fazem o que desejam” (Gálatas 5.17).

Além disso, como nascemos pecadores, formamos, desde o nascimento, hábitos de pecado. Como Jay Adams diz, “nascemos pecadores, mas foi preciso prática para formarmos os nossos estilos próprios de pecado. A velha vida foi disciplinada (treinada) para a impiedade”.[17] Todos tendemos a agir de acordo com estes hábitos pecaminosos que ficaram gravados em nós pela longa prática.

Imagine, por exemplo, que eu era coxo duma perna e que, por causa disso, comecei a manquejar. Se através duma operação o meu problema ficasse resolvido, eu continuaria com tendência para coxear, por força do hábito. Ou pensa que quando os escravos americanos foram libertos pela Proclamação de Emancipação do Presidente Lincoln, começaram imediatamente a pensar como homens livres? Sem dúvida que eles ainda tinham tendência a agir como escravos, porque tinham formado padrões de hábitos de escravatura.

Do mesmo modo, os cristãos tendem a pecar por hábito. É um hábito nosso preocuparmo-nos conosco próprios em vez de com os outros, vingarmo-nos quando alguém nos prejudique e cedermos aos apetites do nosso corpo. É hábito nosso vivermos para nós mesmos e não para Deus. Quando nos tornamos cristãos, não

deixamos isto da noite para o dia. De fato, passaremos o resto da vida a livrar-nos de tais hábitos e a revestir-nos de hábitos de santidade.

Nós não só temos sido escravos do pecado, como ainda vivemos num mundo povoado por escravos do pecado. Os valores convencionais à nossa volta refletem essa escravatura, e o mundo tenta fazer com que nos ajustemos ao seu molde pecaminoso.

Deste modo, embora o pecado já não reine em nós, tentará continuamente apanhar-nos. Embora tenhamos sido libertos do reino do pecado e do seu governo, não fomos libertos dos seus ataques. Como o Dr. Martyn Lloyd-Jones diz, na sua exposição de Romanos 6, apesar de o pecado não poder reinar em nós, na nossa personalidade essencial, pode, se o deixarmos, reinar no nosso corpo mortal.[18] Ele transformará os instintos naturais do nosso corpo em sensualidade; transformará os nossos apetites naturais em indulgência, a nossa necessidade de roupa e agasalho em materialismo e o nosso interesse sexual em imoralidade.

É por isso que Paulo nos exortou a vigiar de maneira que não consintamos que o pecado reine em nosso corpo. Antes da nossa salvação, antes da nossa morte para o reino do pecado, tal exortação teria sido fútil. Não se pode dizer a um escravo: “Viva como um homem livre”; mas pode-se dizer isso a alguém que foi liberto da escravatura. Agora que estamos de fato mortos para o pecado — para o seu governo e reino — temos de considerar isso como uma verdade. Temos de manter diante de nós esta realidade de que já não somos escravos. Podemos agora erguer-nos diante do pecado e dizer-lhe não. Antes, não tínhamos hipótese, agora podemos escolher. Quando pecamos como cristãos, não o fazemos como escravos, mas como indivíduos com liberdade de escolha. Pecamos porque escolhemos pecar.

Resumindo, então, fomos libertos do reino e governo do pecado, do reino da injustiça. A nossa libertação resulta da nossa união com Cristo, na sua morte. Quando Cristo entrou neste mundo, entrou voluntariamente no reino do pecado, embora nunca tenha pecado. Quando morreu, morreu para este mundo do pecado (Romanos 6.10) e, através da nossa união com ele, nós morremos

igualmente para esse reino. Temos de reconhecer o fato de que estamos mortos para o governo do pecado, de que podemos nos erguer e dizer não ao pecado. Devemos, portanto, guardar o nosso corpo, de modo que o pecado não reine em nós.

Vemos assim, que Deus fez provisão para a nossa santidade. Por meio de Cristo, libertou-nos do reino do pecado, de maneira que agora podemos resistir-lhe. Mas essa responsabilidade de resistir ao pecado é nossa. Deus não vai fazer isso por nós. Confundir o potencial para resistir (que Deus providenciou) com a responsabilidade de resistir (que é nossa) é concorrer para a tragédia da nossa busca de santidade.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 - A batalha por santidade$t$, 8,
$conteudo$Assim, encontro esta lei que atua em mim: Quando quero fazer o bem, o mal

está junto a mim.

R 7.21

Através da nossa união com Cristo, na sua morte, somos libertos do domínio do pecado. Contudo, ainda notamos que o pecado procura ganhar domínio sobre nós, como Paulo tão vividamente descreveu: “Quando quero fazer o bem, o mal está junto a mim” (Romanos 7.21). Podemos não gostar do fato que temos esta luta com o pecado ao longo da nossa vida, mas quanto mais reconhecermos e aceitarmos esta realidade, mais equipados estaremos para enfrentar o problema. Quanto mais descobrirmos a força do pecado que habita em nós, menos sentiremos os seus efeitos. Na medida em que descobrirmos esta lei do pecado dentro de nós, iremos detestá-lo e combatê-lo.

No entanto, embora os crentes ainda tenham esta propensão íntima para pecar, o Espírito Santo mantém dentro de nós um desejo prevalecente de santidade (1 João 3.9). O crente debate-se com o pecado que Deus lhe permite ver em si próprio. É este o quadro que vemos em Romanos 7.21 e que distingue os crentes dos que não são e vivem satisfeitos nas suas trevas.

As interpretações de Romanos 7.14-25 enquadram-se em três grupos básicos. Não é propósito deste livro tratar dessas interpretações ou escolher uma delas. Qualquer que seja a nossa interpretação de Romanos 7, todos os cristãos reconhecem a aplicação universal da afirmação de Paulo: “Quando quero fazer o bem, o mal está junto a mim”.

Como indicamos no capítulo anterior, o pecado interno permanece em nós, embora tenha sido destronado. Não obstante ter sido derrotado e enfraquecido, a sua natureza não mudou. O pecado continua a ser hostil a Deus e não pode submeter-se à sua lei (Romanos 8.7). Temos assim um implacável inimigo da justiça no nosso próprio coração. Que diligência e vigilância se não requer de nós quando este inimigo das nossas almas está pronto a opor-se a todo o esforço para fazer o bem!

Se quisermos ganhar a guerra contra este inimigo interno, é importante conhecermos algo da sua natureza e táticas. Primeiro que tudo, a Escritura indica que a habitação do pecado em nós é o coração. “Pois do interior do coração dos homens vêm os maus pensamentos, as imoralidades sexuais, os roubos, os homicídios, os adultérios, as cobiças, as maldades, o engano, a devassidão, a inveja, a calúnia, a arrogância e a insensatez. Todos esses males vêm de dentro e tornam o homem ‘impuro’” (Marcos 7.21-23; ver também Gênesis 6.5 e Lucas 6.45).

Coração, nas Escrituras, é usado de várias maneiras. Às vezes significa a nossa razão ou compreensão. Outras vezes, os nossos afetos e emoções; noutras ocasiões, a nossa vontade. Em geral, indica toda a alma do homem e todas as suas faculdades, não individualmente, mas como trabalhando juntas para fazer o bem ou o mal: a mente, quando raciocina, discerne e julga; as emoções, quando gostam ou desgostam; a consciência, quando determina e avisa; e a vontade, quando escolhe ou recusa — a tudo isso junto se chama coração.[19]

A Bíblia diz-nos que o coração é enganoso e insondável para qualquer pessoa, menos para Deus (Jeremias 17.9-10). Mesmo como crentes, nós não conhecemos o nosso próprio coração (1 Coríntios 4.3-5). Nenhum de nós pode discernir perfeitamente os motivos ocultos, as intrigas secretas, as variações e mudanças do coração. E neste coração insondável habita a lei do pecado. Muita da força do pecado reside precisamente nisto, que nós lutamos com um inimigo que não conseguimos descobrir plenamente.

O coração também é enganoso. Desculpa, racionaliza, justifica as nossas ações. Cega-nos para áreas inteiras de pecado na nossa

vida. Leva-nos a lidar com o pecado servindo-nos apenas de meias medidas, ou a pensar que o assentimento mental à Palavra de Deus é a mesma coisa que obediência (Tiago 1.22).

O fato de sabermos que o pecado que reside em nós ocupa o coração que é enganoso e insondável deveria tornar-nos vigilantes e alertas. Precisamos pedir diariamente a Deus que sonde os nossos corações para descobrir algum pecado que nós não consigamos, ou não queiramos ver. Era esta a oração de Davi: “Sonda-me, ó Deus, e conhece o meu coração; prova-me, e conhece as minhas inquietações. Vê se em minha conduta algo te ofende, e dirige-me pelo caminho eterno” (Salmo 139.23-24). O principal meio pelo qual Deus sonda o nosso coração é a sua Palavra, quando a lemos sob o poder do Espírito Santo. “Pois a palavra de Deus é viva e eficaz, e mais afiada que qualquer espada de dois gumes; ela penetra até o ponto de dividir alma e espírito, juntas e medulas, e julga os pensamentos e intenções do coração” (Hebreus 4.12). Quando pedimos ao Senhor que sonde os nossos corações devemos expornos continuamente à sondagem da sua Palavra.

Devemos ter o cuidado de deixar que o Espírito Santo faça esta investigação. Se tentarmos sondar o nosso próprio coração, somos capazes de cair numa ou duas armadilhas. A primeira é a armadilha da introspecção mórbida. A introspecção pode facilmente torna-se um instrumento de Satanás, que é chamado o “acusador” (Apocalipse 12.10). Uma das suas principais armas é o desânimo. Ele sabe que se nos conseguir desanimar e desencorajar, não travaremos a batalha pela santidade.

A segunda armadilha é a de não atingirmos as verdadeiras questões da vida. O engano de Satanás e do nosso próprio coração levar-nos-á a focar a nossa atenção em assuntos secundários. Lembro-me dum jovem que veio falar comigo sobre um pecado da sua vida que não conseguia controlar. No entanto, embora este problema tomasse tais proporções na sua mente, havia outras áreas de necessidade na sua vida às quais ele permanecia cego. O pecado que via feria só a ele, mas os problemas que não detectava

estavam ferindo diariamente outras pessoas. Só o Espírito Santo pode habilitar-nos a ver tais áreas às quais permanecemos cegos.

A habitação do pecado interno é, portanto, o nosso coração enganador e insondável. Uma segunda coisa que devemos reconhecer é que o pecado interno se revela, em grande parte, através dos nossos desejos. Desde a sua queda no Jardim do Éden, o homem tem dado mais ouvidos aos seus desejos do que à sua razão. O desejo veio a tornar-se a faculdade mais forte do coração humano.[20] Na próxima vez que se defrontar com uma das suas tentações típicas, repare na luta que se trava entre os seus desejos e a sua razão. Se ceder à tentação, será porque o desejo venceu a razão na luta para influenciar a vontade. O mundo reconhece este fato e apela aos nossos desejos através do que o autor de Hebreus chama os prazeres do pecado (Hebreus 11.25).

É claro que nem todo o desejo é mau. Paulo fala do seu desejo de conhecer Cristo (Filipenses 3.10), do seu desejo pela salvação dos seus amigos judeus (Romanos 10.1) e do desejo que os seus filhos espirituais atinjam a maturidade (Gálatas 4.19).

Aqui, contudo, estamos falando dos desejos perversos que nos levam a pecar. Tiago afirmou que somos tentados quando arrastados e engodados pelos nossos desejos perversos (Tiago 1.14). Se queremos ganhar a batalha pela santidade, temos de reconhecer que o problema básico está dentro de nós. São os nossos próprios desejos ímpios que nos levam a cair em tentação. Podemos pensar que respondemos simplesmente às tentações externas que nos são apresentadas, mas a verdade é que os nossos maus desejos estão constantemente em busca de tentações para satisfazer as suas paixões insaciáveis. Pense em determinadas tentações a que é particularmente vulnerável, e repare no número de vezes que procura encontrar ocasiões para satisfazer esses maus desejos.

Mesmo quando estamos empenhados, dum modo ou de outro, na batalha contra um determinado pecado, o nosso desejo perverso, ou pecado interno, irá levar-nos a brincar com esse mesmo pecado. Às vezes, ao mesmo tempo em que confessamos um pecado, encontramo-nos a começar de novo a alimentar maus pensamentos

relacionados com esse pecado e podemos ser tentados mais uma vez.

É claro que há também muitas ocasiões em que nos deparamos inesperadamente com a tentação. Quando tal acontece, os nossos desejos perversos estão prontos e são rápidos em recebê-las e abraçá-las. Precisamente como o fogo queima qualquer material combustível que lhe esteja próximo, assim os nossos desejos perversos respondem imediatamente à tentação. John Owen disse que o pecado mantém a sua guerra, pondo em confusão os nossos afetos (aquilo a que chamei aqui desejo) e levando-os para longe. Por essa razão, diz Owen, a negação do pecado deve ser dirigida principalmente para os afetos. Temos de nos certificar que os nossos desejos são orientados para a glória de Deus, disse ele, e não para a satisfação das paixões do nosso corpo.[21]

A terceira coisa que devemos entender a respeito do pecado íntimo é que ele tende a enganar a nossa compreensão ou raciocínio. A nossa razão, iluminada pelo Espírito Santo através da Palavra de Deus, opõe-se a que o pecado nos domine através dos nossos desejos. Por isso, a grande estratégia de Satanás consiste em orientar a nossa mente. Paulo referiu-se às “concupiscências do engano” do velho homem (Efésios 4.22, ARA). Ele afirmou que nós fomos noutro tempo “insensatos e desobedientes, vivíamos enganados e escravizados por toda espécie de paixões e prazeres” (Tito 3.3). Essas passagens falam da nossa velha vida, mas temos de reconhecer que este engano ainda luta contra nós, embora já não nos domine.

O engano da mente é conseguido pouco a pouco. Primeiro, somos afastados duma atitude de vigilância; depois da obediência. Tornamo-nos como Efrain, de quem Deus disse: “Estrangeiros sugam sua força, mas ele não o percebe. Seu cabelo vai ficando grisalho, mas ele nem repara nisso” (Oseias 7.9). Somos afastados duma posição de vigilância por demasiada confiança. Convencemonos de que estamos fora do alcance de qualquer tentação. Olhamos para a queda de qualquer outra pessoa e dizemos: “Eu nunca seria capaz de fazer aquilo”. Mas Paulo avisou-nos: “Assim, aquele que

julga estar firme, cuide-se para que não caia!” (1 Coríntios 10.12). Mesmo quando estamos ajudando um irmão caído, devemos estar alertas em relação a nós próprios, para não sermos também tentados (Gálatas 6.1).

Somos muitas vezes desviados da obediência pelo abuso da graça. Judas fala de certos homens que “transformam a graça de nosso Deus em libertinagem” (Judas 4). Abusamos da graça quando pensamos que podemos pecar e receber depois o perdão, pela reivindicação de 1 João 1.9. Abusamos da graça quando, depois de pecarmos, nos atemos à compaixão e misericórdia de Deus, sem termos em conta a sua santidade e ódio pelo pecado.

Afastamo-nos da obediência quando começamos a questionar o que Deus afirma na sua Palavra. Foi essa a primeira tática usada por Satanás com Eva (Gênesis 3.1-5). Precisamente como disse a Eva “Certamente não morrerás!”, assim nos garante: “É uma coisa insignificante!” ou “Deus não vai condenar esse pecado”.

Vemos, portanto, que embora o pecado não tenha mais domínio sobre nós, mantém a sua luta de guerrilha contra nós. Se não o combatermos, irá derrotar-nos. O nosso recurso contra este combate é sermos rápidos e firmes contra as primeiras manifestações de qualquer pecado íntimo. Se a tentação encontrar algum abrigo na alma, aproveitar-se-á dele para nos levar a pecar: “Quando os crimes não são castigados logo, o coração do homem se enche de planos para fazer o mal” (Eclesiastes 8.11).

Além do mais, nunca devemos convencer-nos de que a nossa luta contra o pecado chegou ao fim. O coração é insondável, os nossos desejos perversos são insaciáveis, e a nossa razão está constantemente em perigo de ser enganada. Bem disse Jesus: “Vigiem e orem para que não caiam em tentação.” (Mateus 26.41). E Salomão avisou-nos: “Acima de tudo, guarde o seu coração, pois dele depende toda a sua vida” (Provérbios 4.23).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 - Ajuda na batalha diária$t$, 9,
$conteudo$Da mesma forma, considerem-se mortos para o pecado, mas vivos

para Deus em Cristo Jesus.

R 6.11

No capítulo 5, vimos como Deus nos libertou da esfera do reino do pecado através da nossa união com Cristo, na sua morte. Éramos escravos do pecado e, nessa situação, cometíamos pecados. Adquirimos hábitos pecaminosos, a despeito de quão “bons” fôssemos. Mas Jesus Cristo veio a este mundo pecador e tomou o nosso lugar no Calvário. Ele morreu para o pecado e, através da nossa união com ele, morremos nós também para o pecado. Agora estamos livres do reino do pecado, já não somos seus escravos. Temos de ter em conta este fato e resistir ao pecado, para que ele não possa reinar no nosso corpo mortal.

No capítulo 6, vimos como o pecado ainda vive dentro de nós, travando a sua “luta de guerrilha” através dos desejos perversos e do engano da nossa mente. Talvez pareça que qualquer esperança de santidade apresentada no capítulo 5 foi efetivamente retirada no capítulo 6. “Que vantagem há”, alguém poderá perguntar, “em ouvir dizer que a guerra com o pecado foi ganha por Cristo em sua morte na cruz, se eu continuo a ser mortificado e muitas vezes derrotado pelo pecado no meu coração?”.

Para experimentar santidade prática e diária, temos de aceitar o fato de que Deus, na sua infinita sabedoria, achou por bem permitir essa batalha diária com o pecado íntimo. Mas Deus não nos deixa sozinhos no combate. Precisamente como nos livrou do reino global do pecado, também tomou todas as providências para que ganhássemos os conflitos diários contra o pecado.

Isso leva-nos ao segundo ponto em Romanos 6.11, que devemos ter em conta e manter perante nós. Nós não estamos só mortos para o pecado, como vimos no capítulo 5; estamos também vivos para Deus. Não fomos só libertos do domínio das trevas, fomos também introduzidos no reino de Cristo. Paulo disse que nos tornamos escravos da justiça (Romanos 6.18). Deus não nos deixa suspensos num estado de neutralidade. Ele liberta-nos do reino do pecado para o reino de seu Filho.

Qual é o sentido de se estar vivo para Deus? Em que é que isso nos ajuda na nossa busca de santidade? Primeiro, significa que nós estamos unidos com Cristo em todo o seu poder. Não há dúvida de que não podemos viver uma vida santa na nossa própria força. O cristianismo não é um sistema de “Faça você mesmo”. Repare na atitude do apóstolo Paulo em Filipenses 4.11-13. Ele está falando sobre a maneira como aprendeu a contentar-se com as circunstâncias, fossem elas de abundância ou carência, estivesse ele bem alimentado ou com fome. Paulo afirma que pode reagir assim por meio de Cristo que lhe dá força. Como isso se aplica à santidade? As nossas reações às circunstâncias são parte do nosso andar em santidade. Como já vimos, santidade não é uma série de “Faças — não faças”; é, sim, conformidade ao caráter de Deus e obediência à sua vontade. O fato de aceitar alegremente qualquer circunstância que Deus permite na minha vida já é uma boa parte dum viver santo.

Repare, no entanto, que Paulo disse que podia reagir com contentamento porque Cristo lhe dava força para tal. Vemos isso de novo quando Paulo afirma que orou para que os colossenses fossem “fortalecidos com todo o poder, de acordo com a força da sua glória, para que tenham toda a perseverança e paciência com alegria” (Colossenses 1.11). Donde vêm a perseverança e paciência? Elas surgem quando somos revigorados com o poder de Deus.

Considere agora outra oração que Paulo descreveu na sua carta aos Efésios. Ele afirmou que orava por eles “para que, com as suas gloriosas riquezas, ele os fortaleça no íntimo do seu ser com poder, por meio do seu Espírito” (Efésios 3.16, ênfase adicionada).

Ele concluiu a sua oração, reconhecendo que Deus “é capaz de fazer infinitamente mais do que tudo o que pedimos ou pensamos, de acordo com o seu poder que atua em nós” (3.20, ênfase adicionada).

Essa é a primeira implicação que devemos apreender do sentido de estar “vivo para Deus”. Nós estamos unidos com aquele que está trabalhando em nós para nos fortalecer com o seu grande poder. Todos temos conhecido a terrível sensação de desespero causado pelo poder do pecado. Já resolvemos inúmeras vezes nunca ceder de novo a uma determinada tentação e, todavia, continuamos a ceder. Então, Satanás vem ter conosco e diz: “É melhor desistires de vez. Nunca poderás vencer esse pecado”. É verdade que em nós mesmos não conseguiremos, mas nós estamos vivos para Deus, unidos àquele que nos fortalece. Reconhecendo esse fato — considerando-o como verdadeiro — iremos experimentar a força que precisamos para combater essa tentação.

Só quando considero estes dois fatos gêmeos — que estou morto para o pecado e seu domínio sobre mim, e que estou vivo para Deus, unido àquele que me fortalece — é que posso impedir que o pecado reine no meu corpo mortal.

O Dr. Martyn Lloyd-Jones diz: “Compreender isso tira de nós aquele velho sentimento de desamparo que todos nós conhecemos e temos por causa do terrível poder do pecado… Como funciona? Funciona da maneira como exponho a seguir. Perdi meu sentimento de desamparo porque pude dizer a mim mesmo que, não somente não estou mais sob o domínio do pecado, mas também estou sob o domínio de um outro poder, que nada pode frustrar”.[22]

Não se trata de ensino teórico, de algo que se deva colocar nas prateleiras da biblioteca da nossa mente e ser admirado, mas que não tem valor algum prático na batalha pela santidade. Reconhecer o fato de que estamos mortos para o pecado e vivos para Deus é algo que devemos fazer ativamente.

Para tal, devemos formar o hábito de, continuamente, reconhecer que estamos mortos para o pecado e vivos para Deus. Em termos práticos, fazemos isso quando, pela fé na Palavra de

Deus, resistimos aos avanços e tentações do pecado. Reconhecemos que estamos vivos para Deus quando, pela fé, buscamos em Cristo o poder que precisamos para resistir. A fé, todavia, deve também basear-se no fato, e Romanos 6.11 constitui um fato para nós.

Uma segunda implicação de estar vivo para Deus é que ele nos deu o seu Espírito Santo para viver em nós. Na realidade, isto não é um segundo resultado, mas outra maneira de olhar para a nossa união com Cristo, pois o Espírito Santo é o agente dessa união. É ele que dá vida espiritual e força para viver essa vida (Romanos 8.9-11). É o Espírito de Deus que trabalha em nós para podermos decidir e agir de acordo com os bons propósitos de Deus (Filipenses 2.13).

Paulo afirmou: “Porque Deus não nos chamou para a impureza, mas para a santidade. Portanto, aquele que rejeita estas coisas não está rejeitando o homem, mas a Deus, que lhes dá o seu Espírito Santo” (1 Tessalonicenses 4.7-8). Aqui, Paulo relaciona a dádiva do Espírito Santo com a nossa vida santa. Ele é chamado Espírito Santo e é enviado principalmente para nos fazer santos — para nos ajustar ao caráter de Deus. A ligação destes dois pensamentos, o Espírito Santo e uma vida santa, encontra-se igualmente noutros textos bíblicos. Por exemplo, somos exortados a fugir da imoralidade sexual porque o nosso corpo é o templo do Espírito Santo (1 Coríntios 6.18-19). Lemos também que somos controlados não pela nossa natureza pecadora, mas pelo Espírito, se realmente o Espírito de Deus vive em nós (Romanos 8.9). Lemos: “Vivam pelo Espírito, e de modo nenhum satisfarão os desejos da carne” (Gálatas 5.16).

Por que é que temos o Espírito Santo em nós para nos fortalecer no sentido da santidade? É porque estamos vivos para Deus. Vivemos agora sob o reinado de Deus que nos une a Cristo e nos dá o seu Espírito Santo para habitar em nós.[23]

O Espírito Santo fortalece-nos para a santidade, primeiro porque nos permite ver a nossa necessidade de santidade. Ele ilumina o nosso entendimento de modo que começamos a ver o padrão de santidade de Deus. Depois, leva-nos a tomar consciência

das nossas áreas específicas de pecado. Uma das armas mais poderosas de Satanás é tornar-nos espiritualmente cegos — incapazes de ver o nosso caráter pecaminoso. A Bíblia diz: “O coração é mais enganoso que qualquer outra coisa e sua doença é incurável. Quem é capaz de compreendê-lo?” (Jeremias 17.9). Ninguém o pode entender e expor, exceto o Espírito Santo.

Mesmo cristãos que compreendem o ensino da Bíblia podem ser enganados em relação ao seu próprio pecado. Sentimos de certo modo que o nosso assentimento ao ensino das Escrituras equivale à obediência. Podemos ouvir um ponto de aplicação num sermão, ou, talvez, descobri-lo na nossa própria leitura ou estudo pessoal da Bíblia. Dizemos então: “Sim, isso é verdade; é algo em que tenho de agir”. Mas deixamos as coisas nesse ponto. Tiago diz que quando procedemos assim nos enganamos a nós mesmos (Tiago 1.22).

À medida que avançamos na vida cristã, defrontamo-nos com o crescente perigo do orgulho espiritual. Conhecemos as doutrinas corretas, os métodos certos e os respectivos “Faças — Não faças”. Podemos, contudo, não chegar a ver a pobreza do nosso próprio caráter espiritual. Podemos não ver o nosso espírito crítico e incapaz de perdoar, o nosso hábito de caluniar, a nossa tendência para julgar os outros. Podemos tornar-nos como os laodicenses, de quem o nosso Senhor disse: “Você diz: ‘Estou rico, adquiri riquezas e não preciso de nada’. Não reconhece, porém, que é miserável, digno de compaixão, pobre, cego, e que está nu” (Apocalipse 3.17).

Davi era assim quando cometeu adultério com Bate-Seba e depois mandou matar o marido para encobrir o seu primeiro pecado (2 Samuel 12.1-13). Estaria ele arrependido e humilhado por causa dos seus atos miseráveis? De modo nenhum. Na verdade, estava pronto a julgar outro homem por um crime muito menor, e a condená-lo à morte (v. 5). Como é que ele podia fazer uma coisa destas? Simplesmente porque estava espiritualmente cego. Só quando o profeta Natã disse a Davi: “Você é esse homem!”, é que ele conseguiu ver a terrível hediondez do seu crime.

É ministério do Espírito Santo levar-nos a ver que somos realmente miseráveis devido aos nossos pecados. Ele vem ter

conosco e diz: “Você é esse homem!”. Mesmo que tal mensagem venha dos lábios carinhosos e amigos dum irmão em Cristo, é o Espírito Santo quem nos habilita a aceitá-la e a dizer como Davi: “Pequei contra o S ”. O Espírito Santo abre os íntimos recessos do nosso coração e permite-nos ver as fossas morais que ali se escondem. É aí que ele começa o seu ministério de nos tornar santos.

O resultado natural de vermos o padrão de Deus e o nosso pecado é o despertar em nós o desejo de sermos santos. Também isto é ministério do Espírito Santo, quando trabalha para nos tornar santos. Sentimo-nos tristes pelos nossos pecados, com uma tristeza segundo Deus, que conduz ao arrependimento (2 Coríntios 7.10). Dizemos como Davi: “Lava-me de toda a minha culpa e purifica-me do meu pecado… Purifica-me com hissopo, e ficarei puro; lava-me, e mais branco do que a neve serei” (Salmo 51.2, 7).

Paulo afirmou: “Pois é Deus quem efetua em vocês tanto o querer quanto o realizar, de acordo com a boa vontade dele” (Filipenses 2.13). Antes de podermos agir, precisamos querer. Querer significa desejar e resolver. Quando o Espírito Santo nos revela o nosso pecado, não o faz para nos levar ao desespero, mas para nos levar à santidade. Ele faz isso criando em nós ódio pelos nossos pecados e um desejo de santidade.

O Espírito Santo cria esse desejo não só mostrando-nos os nossos pecados, mas também mostrando-nos o padrão de santidade de Deus. Faz esse trabalho através das Escrituras. Quando lemos e estudamos a Bíblia, ou a ouvimos ensinada, somos cativados pela beleza moral do padrão de santidade de Deus. Embora o seu padrão possa parecer muito além de nós, reconhecemos e respondemos àquilo que é “santo, justo e bom” (Romanos 7.12). Embora fraquejemos tantas vezes, no nosso ser interior “temos prazer na Lei de Deus” (Romanos 7.22).

Aqui está então outra distinção que temos de estabelecer entre o que Deus faz e o que nós temos de fazer. Se o Espírito Santo usa as Escrituras para nos mostrar a nossa necessidade e estimular em nós um desejo de santidade, então não será natural que nós estejamos na Palavra de Deus sobre uma base

consistente? Não deveremos ir à Palavra, quer seja para ouvi-la pregada ou para fazermos o nosso próprio estudo, com oração, para que o Espírito Santo sonde os nossos corações para descobrir qualquer pecado em nós? (Salmos 139.23-24).

Depois de o Espírito Santo nos ter capacitado para ver a nossa necessidade e ter criado em nós um desejo de santidade, resta ainda algo que Deus tem de fazer. Tem de nos dar a força espiritual para vivermos uma vida santa. Paulo disse: “Vivam pelo Espírito, e de modo nenhum satisfarão os desejos da carne” (Gálatas 5.16). Viver pelo Espírito é viver na obediência e dependência do Espírito Santo. Há um equilíbrio, então, entre a nossa vontade (expressa pela obediência) e a nossa fé (expressa pela nossa dependência). Neste ponto, contudo, estamos considerando o aspecto da nossa dependência do Espírito Santo.

Ninguém vence a corrupção do seu coração a não ser pelo poder do Espírito de Deus. Pedro disse que Deus “nos deu as suas grandiosas e preciosas promessas, para que por elas vocês se tornassem participantes da natureza divina e fugissem da corrupção que há no mundo, causada pela cobiça” (2 Pedro 1.4). Pela participação na natureza divina escapamos à corrupção — e esta participação faz-se através do Espírito Sano que habita em nós.

Expressamos a nossa dependência do Espírito Santo para uma vida santa, de duas maneiras. A primeira é através dum influxo ou assimilação das Escrituras. Se verdadeiramente desejamos viver no reino do Espírito, temos de alimentar sempre as nossas mentes com a sua verdade. É uma hipocrisia orarmos para que Deus nos dê vitória sobre o pecado se, ao mesmo tempo, nos descuidamos em receber a Palavra de Deus.

É possível, no entanto, ser consistente na nossa recepção da Palavra de Deus, sem uma atitude de dependência do Espírito Santo. Deus diz: “A este eu estimo: ao humilde e contrito de espírito, que treme diante da minha palavra” (Isaías 66.2). Nós devemos ir à Palavra num espírito de humildade e contrição, porque reconhecemos que somos pecadores, que estamos muitas vezes cegos ao nosso pecado e que precisamos do poder e luz do Espírito Santo no nosso coração.

A segunda maneira de expressarmos a nossa dependência do Espírito é orar por santidade. O apóstolo Paulo orava continuamente pela obra do Espírito de Deus nas vidas daqueles a quem escrevia. Ele disse aos Efésios que orou para que Deus “os fortaleça no íntimo do seu ser com poder, por meio do seu Espírito” (Efésios 3.16). Orou também para que Deus enchesse os colossenses: “Que sejam cheios do pleno conhecimento da vontade de Deus, com toda a sabedoria e entendimento espiritual. E isso para que vocês vivam de maneira digna do Senhor e em tudo possam agradá-lo” (Colossenses 1.9-10).

Paulo escreveu ainda aos tessalonicenses: “Que o próprio Deus da paz os santifique [faça santos] inteiramente” (1 Tessalonicenses 5.23); e “que o Senhor faça crescer e transbordar o amor que vocês têm uns para com os outros e para com todos… Que ele fortaleça o coração de vocês para serem irrepreensíveis em santidade diante de nosso Deus e Pai” (1 Tessalonicenses 3.12-13). É evidente que o apóstolo Paulo sabia que dependemos do Espírito Santo, e ele expressou esta dependência através da oração.

Como jovem cristão, eu tinha a ideia de que tudo o que precisava fazer para viver uma vida santa era descobrir na Bíblia o que Deus queria que eu fizesse e, então, fazê-lo. Cristãos amadurecidos irão sorrir perante essa ideia ingênua, mas eu vejo cristãos mais novos começando com o mesmo ar de autoconfiança. Nós temos de aprender que dependemos do poder do Espírito Santo que dá capacidade, se quisermos atingir qualquer grau de santidade. Então, quando olharmos para ele, vê-lo-emos trabalhando em nós — revelando o nosso pecado, criando em nós um desejo de santidade e dando-nos a força para lhe respondermos em obediência.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 - Obediência — não vitória$t$, 10,
$conteudo$Pois se vocês vivem de acordo com a carne, morrerão; mas, se pelo Espírito

fizerem morrer os atos do corpo, viverão.

R 8.13

Deus providenciou o que era necessário para a nossa santidade, e deu-nos também certa responsabilidade em relação a ela. Como já vimos nos capítulos 5 e 7, a provisão de Deus para nós consiste em libertar-nos do reino do pecado, unir-nos a Cristo e darnos o Espírito Santo, que habita em nós para revelar o pecado, criar um desejo de santidade e fortalecer-nos na nossa busca de santidade. Através do poder do Espírito Santo, e de acordo com a nova natureza que ele dá, nós devemos mortificar as obras más do corpo (Romanos 8.13).

Embora seja o Espírito que nos habilita a matar as nossas corrupções, Paulo diz que isso também pertence a nós. O mesmo trabalho é, dum ponto de vista, trabalho do Espírito e, de outro, trabalho do homem. No capítulo anterior enfatizamos deste versículo a expressão “pelo Espírito”. Neste capítulo, queremos considerar a nossa responsabilidade — “mortificardes as obras do corpo”.

Vê-se bem nesta passagem que Deus coloca diretamente sobre nós a responsabilidade de vivermos uma vida santa. Nós temos de fazer alguma coisa. Não devemos “deixar de tentar e começar a confiar”; devemos mortificar as obras do corpo. Repetidamente, nas Escrituras — não só nas de Paulo, mas também nas dos outros apóstolos — somos exortados a assumir a nossa responsabilidade por um viver santo. Paulo exortou: “Assim, façam morrer tudo o que pertence à natureza terrena de vocês:

imoralidade sexual, impureza, paixão, desejos maus e a ganância, que é idolatria” (Colossenses 3.5). Isto é algo que nós devemos fazer.

O autor de Hebreus escreveu: “Portanto, também nós, uma vez que estamos rodeados por tão grande nuvem de testemunhas, livremo-nos de tudo o que nos atrapalha e do pecado que nos envolve, e corramos com perseverança a corrida que nos é proposta” (Hebreus 12.1). Ele diz: livremo-nos do pecado e corramos com perseverança. É evidente que ele espera que assumamos a responsabilidade de correr a vida cristã. Tiago afirmou: “Portanto, submetam-se a Deus. Resistam ao Diabo, e ele fugirá de vocês” (Tiago 4.7). Somos nós que devemos nos submeter a Deus e resistir ao diabo. Essa é a nossa responsabilidade. Pedro afirmou: “Portanto, amados, enquanto esperam estas coisas, empenhem-se para serem encontrados por ele em paz, imaculados e inculpáveis” (2 Pedro 3.14). O verbo empenhem-se (fazei todo o esforço, NIV) dirige-se à nossa vontade. É algo que devemos decidir fazer.

Durante certo período da minha vida cristã, pensei que qualquer esforço que eu fizesse para viver uma vida santa era “da carne”, e que “a carne para nada aproveita”. Pensava que Deus não iria abençoar qualquer esforço da minha parte para viver a vida cristã, assim como não abençoaria qualquer esforço da minha parte para me tornar um cristão por meio de boas obras. Como recebi Cristo Jesus pela fé, também devia procurar uma vida santa apenas pela fé. Qualquer esforço da minha parte seria simplesmente um obstáculo no caminho de Deus. Aplicava erradamente a afirmação: “Vocês não precisarão lutar nessa batalha. Tomem suas posições, permaneçam firmes e vejam o livramento que o S lhes dará” (2 Crônicas 20.17), interpretando-a como querendo dizer que eu devia, simplesmente, deixar tudo com o Senhor, que combateria o pecado na minha vida. De fato, na margem da Bíblia que usava nessa altura, escrevi, junto do versículo, estas palavras: “ilustração do andar no Espírito”.

Que louco eu era! Interpretei a dependência do Espírito Santo como querendo dizer que eu não deveria fazer qualquer esforço,

que eu não tinha qualquer responsabilidade. Pensei erradamente que, se entregasse tudo ao Senhor, ele faria as minhas escolhas e preferiria a obediência à desobediência. A única coisa que eu precisava era buscar nele a santidade. Mas não é assim que Deus faz as coisas. Ele providencia o necessário para a nossa santidade, mas dá-nos a responsabilidade de utilizarmos as suas provisões.

O Espírito Santo foi dado a todos os cristãos. O Dr. Martyn Lloyd-Jones diz:

O Espírito Santo está em nós; Ele está operando em nós,

dando-nos poder e capacidade; Ele reside em nós… Este é o

ensino do Novo Testamento — “Operai a vossa salvação com

temor e tremor”. Mas notem o acompanhamento: “Porque

Deus é o que opera em vós tanto o querer como o efetuar,

segundo a sua boa vontade”. O Espírito Santo opera em nós

“tanto o querer como o efetuar”. É porque não sou deixado

entregue a mim mesmo, é porque não estou “em total

desespero”, visto que o Espírito está em mim, que eu sou

exortado a operar a minha “salvação com temor e tremor”. O

Espírito está operando em mim para me fazer “tanto querer

como efetuar”.[24]

Devemos depender do Espírito para a mortificação das obras do corpo. Como Lloyd-Jones observa, na sua exposição de Romanos 8.13, é o Espírito Santo que “diferencia o cristianismo do moralismo, do 'legalismo' e do falso puritanismo”.[25] Mas a nossa dependência do Espírito não visa encorajar uma atitude de “eu não posso fazer isto”, mas a atitude: “Eu posso fazer isso através daquele que me fortalece”. Os cristãos nunca devem se queixar da falta de capacidade e poder. Se pecamos é porque escolhemos pecar, não por nos faltar capacidade para dizer não à tentação.

Já é tempo de nós, cristãos, enfrentarmos a nossa responsabilidade em relação à santidade. Dizemos com demasiada frequência que somos “derrotados” por este ou aquele pecado. Não. Não somos derrotados; somos, simplesmente, desobedientes! Seria bom que deixássemos de usar os termos “vitória” e “derrota” para

descrever o nosso progresso em santidade. Devemos antes usar os termos “obediência” e “desobediência”. Quando digo que fui derrotado por algum pecado, estou inconscientemente fugindo da minha responsabilidade. Estou afirmando que algo fora de mim me derrotou. Mas quando digo que sou desobediente, estou colocando a responsabilidade pelo meu pecado diretamente sobre mim. Podemos de fato ser derrotados, mas a razão dessa derrota é que escolhemos desobedecer. Escolhemos dar guarida a pensamentos sensuais, alojar ressentimentos, ou encobrir um pouco a verdade.

Precisamos despertar e reconhecer que somos responsáveis pelos nossos pensamentos, atitudes e ações. Precisamos ter em conta o fato de que morremos para o reino do pecado, que jamais tem qualquer domínio sobre nós, que Deus nos uniu com o Cristo ressuscitado, em todo o seu poder, e nos deu o Espírito Santo para atuar em nós. Só quando aceitamos a nossa responsabilidade e a adequada provisão de Deus é que conseguimos fazer algum progresso na nossa busca de santidade.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 9 - Mortificando o pecado$t$, 11,
$conteudo$Assim, façam morrer tudo o que pertence à natureza terrena de vocês:

imoralidade sexual, impureza, paixão, desejos maus e ganância, que é

idolatria.

C 3.5

O Novo Testamento não deixa qualquer dúvida de que a santidade é da nossa responsabilidade. Se desejamos de fato buscar santidade, temos de agir decididamente. Falei um dia dum determinado problema de pecado com uma pessoa que disse: “Tenho estado orando para que Deus me motive a parar”. Motivá-la a parar? O que ela, com efeito, estava dizendo era que Deus não tinha feito o suficiente. É muito fácil pedir a Deus que faça algo mais, porque isso adia a necessidade que temos de nos defrontarmos com a nossa própria responsabilidade.

Aquilo que devemos fazer é mortificar as obras do corpo (Romanos 8.13). Paulo serve-se da mesma expressão noutro livro: “Assim, façam morrer tudo o que pertence à natureza terrena de você” (Colossenses 3.5). O que significa a expressão “façam morrer”? A King James Version usa o termo mortificar. De acordo com o dicionário, fazer morrer ou mortificar significa “destruir a força, a vitalidade ou funcionamento; dominar ou amortecer”.[26] Fazer morrer as obras do corpo é, portanto, destruir a força e a vitalidade do pecado quando ele tenta reinar no nosso corpo.

Devemos entender claramente que a mortificação, embora seja algo que nós fazemos, não pode ser levada a cabo na nossa própria força. Bem disse o puritano John Owen: “A mortificação pela força própria, conseguida por meios de invenção própria, com o fim duma justiça própria, é a alma e a sustância de toda a falsa religião”.

[27] A mortificação deve ser realizada pela força e a direção do Espírito Santo.

Owen diz noutro ponto: “Só o Espírito é suficiente para essa obra. Todas as vias e meios sem ele são inúteis. Ele é o grande Eficiente. Ele é quem dá vida e força aos nossos esforços”.[28]

Mas embora a mortificação deva ser efetuada pela força e sob a direção do Espírito Santo, ela é, todavia, uma obra que nós devemos fazer. Sem a força do Espírito Santo não haverá mortificação, mas sem o nosso trabalho na sua força também não haverá mortificação.

A pergunta crucial então é esta: “Como é que destruímos a força e vitalidade do pecado?”. Se realmente queremos realizar essa difícil tarefa temos que primeiramente ter convicção. Precisamos estar persuadidos que a vontade de Deus duma vida santa para cada cristão é importante. Devemos acreditar que a busca de santidade é digna do esforço e dor que são necessários para mortificar as obras do corpo. Precisamos estar convencidos que “sem santidade (santificação) ninguém verá o Senhor” (Hebreus 12.14).

Não só devemos desenvolver uma convicção por viver uma vida santa em geral, mas precisamos igualmente desenvolver convicções em áreas específicas de obediência.

Estas convicções formam-se e desenvolvem-se quando nos expomos à Palavra de Deus. A nossa mente está há muito acostumada aos valores do mundo. Mesmo depois de nos convertermos, o mundo à nossa volta procura constantemente levarnos a ajustar-nos ao seu sistema de valores. Somos bombardeados de todos os lados por tentações no sentido de condescendermos com a nossa natureza pecadora. Por isso, Paulo diz: “Não deixem que o mundo ao seu redor vos modele em seu próprio molde, mas deixem que Deus os refaça, de maneira que toda a atitude da vossa mente se transforme” (Romanos 12.2, PH).

Somente pela Palavra de Deus é que as nossas mentes são moldadas de novo e os nossos valores renovados. Quando dava instruções para os futuros reis de Israel, Deus disse: “Trará sempre

essa cópia consigo e terá que lê-la todos os dias da sua vida, para que aprenda a temer o S, o seu Deus, e a cumprir fielmente todas as palavras desta lei, e todos estes decretos” (Deuteronômio 17.19). O rei devia ler a lei de Deus todos os dias da sua vida para aprender a temer ao Senhor. Dessa maneira, ele poderia aprender a sua necessidade de santidade e como poderia conhecer a vontade específica de Deus em diversas situações.

Jesus disse: “Quem tem os meus mandamentos e lhes obedece, esse é o que me ama” (João 14.21). A obediência é o caminho para a santidade, mas é só na medida em que temos os seus mandamentos que podemos obedecer-lhes. A Palavra de Deus deve ser tão fortemente fixada em nossas mentes, que se torne a influência dominante em nossos pensamentos, atitudes e ações. Uma das maneiras mais eficazes de influenciar as nossas mentes é através da memorização das Escrituras. Davi disse: “Guardei no coração a tua palavra para não pecar contra ti” (Salmos 119.11).

Para memorizar as Escrituras eficazmente, você deve ter um plano. Esse plano deve incluir uma seleção de versículos bem escolhidos, um sistema prático para aprendê-los, um meio sistemático de revê-los a fim de conservá-los vivos na memória, e regras simples para continuar a memorização das Escrituras sozinho.

Sei por experiência quão importante é um plano. Instintivamente percebi a importância da Palavra de Deus para a minha vida quando era jovem ainda, na universidade, mas não sabia exatamente o que fazer. Decorei alguns versículos, casual e esporadicamente, mas eles foram de pouco proveito pra mim. Então um dia fui apresentado ao Sistema de Memorização por Tópicos da editora The Navigators e comecei um plano de memorização regular das Escrituras. Vinte e oito anos mais tarde ainda continuo a sentir o benefício desse simples mas eficiente plano para guardar a Palavra de Deus no meu coração.[29]

É claro que o objetivo da memorização é a aplicação da Bíblia à nossa vida diária. É através da aplicação das Escrituras às situações específicas da vida que desenvolvemos o tipo de

convicção que nos ajuda a vencer as tentações que tão facilmente nos levam a tropeçar.

Há alguns anos, minha esposa e eu vivíamos em Kansas City, Missouri, enquanto eu trabalhava do outro lado do rio, já no estado de Kansas. Como empregado trabalhando em Kansas, eu estava sujeito ao imposto de renda desse estado, mas como residente no estado de Missouri, não precisava pagar esse imposto senão no fim do ano. Mudamos para o Colorado em julho dum certo ano, e no fim desse ano percebi que devia ao estado de Kansas sete meses de imposto. O meu primeiro pensamento foi esquecer o caso. Afinal de contas, a quantia era bastante pequena e eles não iriam até ao Colorado para recolher. Mas o Espírito Santo trouxe-me então à mente um versículo que havia decorado anteriormente: “Dêem a cada um o que lhe é devido: se imposto, imposto; se tributo, tributo; se temor, temor; se honra, honra” (Romanos 13.7). Deus trouxe ao meu coração a convicção de que devia pagar ao estado de Kansas o imposto que lhe devia, em obediência a Deus. O Senhor deu-me convicção nesse dia em relação ao pagamento dos impostos e essa convicção tem influenciado e governado as minhas ações desde então.

É desse modo que desenvolvemos a convicção — trazendo a Palavra de Deus às situações específicas que surgem na nossa vida, e determinando pela Palavra a vontade de Deus nessa situação.

Muitas questões da vida são claramente abordadas na Bíblia, e faríamos bem em decorar versículos que falam dessas questões. Por exemplo, a vontade de Deus em relação à honestidade é bem clara: “Portanto, cada um de vocês deve abandonar a mentira e falar a verdade ao seu próximo, pois todos somos membros de um mesmo corpo… O que furtava não furte mais; antes trabalhe, fazendo algo de útil com as mãos, para que tenha o que repartir com quem estiver em necessidade” (Efésios 4.25, 28). A vontade de Deus em relação à abstinência da imoralidade sexual é igualmente descrita com muita clareza: “A vontade de Deus é que vocês sejam santificados: abstenham-se da imoralidade sexual” (1 Tessalonicenses 4.3). Essas são questões claramente declaradas,

onde não devemos ter qualquer dificuldade em formar convicções em harmonia com a vontade de Deus, se realmente estamos dispostos a obedecer sua Palavra.

Mas o que fazer com os temas que não são especificamente mencionados nas Escrituras? Como é que determinamos a vontade de Deus e desenvolvemos uma convicção nessas áreas?

Há alguns anos, um amigo deu-me o que designava como sua “Fórmula: Como distinguir o certo do errado”. Essa fórmula contém quatro perguntas baseadas em três versículos de 1 Coríntios:

“‘Tudo me é permitido’, mas nem tudo convém” (1

Coríntios 6:12). Pergunta 1: É benéfico — física, espiritual

e mentalmente?

“‘Tudo me é permitido’, mas eu não deixarei que nada me

domine” (1 Coríntios 6.12). Pergunta 2: Será que isso vai

me dominar?

“Portanto, se aquilo que eu como leva o meu irmão a

pecar, nunca mais comerei carne, para não fazer meu

irmão tropeçar” (1 Coríntios 8.13). Pergunta 3: Será que

isso vai ferir os outros?

“Assim, quer vocês comam, bebam ou façam qualquer

outra coisa, façam tudo para a glória de Deus” (1 Coríntios

10.31). Pergunta 4: Será que isso glorifica a Deus?

Embora possa parecer muito simples, essa fórmula é poderosa para o desenvolvimento duma convicção — se estivermos dispostos a usá-la. Essas perguntas podem tornar-se bastante perscrutadoras. Mas devem ser feitas, se realmente queremos buscar santidade como um caminho total de vida.

Vamos aplicar esses princípios a algumas situações típicas. Pense, por exemplo, nos programas de televisão que vê. São benéficos — física, espiritual e mentalmente? Para alguns programas a resposta pode ser “sim”; mas em relação àqueles que você deve responder honestamente “não”, você deveria considerar não vê-los.

Quanto à pergunta “Será que isso vai me dominar?”, você pode aplicar imediatamente essa pergunta a hábitos tais como

beber, tomar drogas ou fumar, e achar que não se aplica ao seu caso. Mas voltemos ao ponto. Que dizer da televisão? Será que alguns programas o “prendem” tanto que não é capaz de perdê-los? Se isso acontece, então eles estão dominando você. Conheço uma senhora crente que, quando adolescente, foi campeã nacional de tênis, na categoria de juniores. Estava tão agarrada ao tênis, que ele constituía de fato toda a sua vida, embora ela fosse cristã. Quando começou a refletir seriamente sobre as exigências do discipulado cristão, percebeu que o tênis exercia certo poder sobre ela que estava impedindo-a de seguir plenamente a Cristo. Tomou então a decisão de pôr de lado a sua raquete de tênis para acabar com esse domínio. Só vários anos mais tarde, quando essa força tinha desaparecido por completo, é que ela recomeçou a jogar tênis, apenas para recreio e com liberdade de consciência.

Essa ilustração do tênis enfatiza um fato importante. Pode não ser a atividade em si que determina se algo é pecaminoso para nós, mas antes a nossa resposta a essa atividade. Certamente, o tênis é moralmente neutro e sob condições corretas é fisicamente benéfico. Mas porque esta jovem tinha feito dele um ídolo na vida, essa atividade tinha-se tornado pecaminosa para ela.

Examinemos agora a próxima pergunta: “Será que isso vai ferir os outros?” com a mesma história da minha amiga tenista. Imagine que outro cristão, que gostava de jogar tênis puramente pelo seu valor recreativo, tinha insistido com essa senhora, afirmando-lhe que não havia nada de errado no tênis. Tecnicamente, essa pessoa estaria correta, mas estaria insistindo num ponto que muito naturalmente iria prejudicar a vida espiritual da jovem senhora. Muitas atividades, estritamente falando, são moralmente neutras, mas devido a algumas associações imorais no passado duma pessoa, podem ser-lhe prejudiciais, pelo menos durante algum tempo. Aqueles de nós que não têm essa associação imoral devem ter em consideração essas pessoas, pois doutro modo poderemos fazê-los cair de novo numa atividade que é pecaminosa para elas.

E que dizer daquelas áreas em que os cristãos diferem nas suas convicções sobre o que é realmente a vontade de Deus? Paulo

fala desse problema em Romanos 14, onde apresenta a questão de se comer certos alimentos. Ele estabelece três princípios gerais para nos guiar. O primeiro é que não devemos julgar aqueles cujas convicções diferem das nossas (vs. 1-4). O segundo princípio é que quaisquer que sejam as nossas convicções, elas devem ser “para o Senhor”, isto é, desenvolvidas por um senso de obediência a ele (vs. 5-8). O terceiro princípio é que quaisquer que sejam as convicções que desenvolvamos como “para o Senhor”, devemos ser fiéis a elas (v. 23). Se agirmos contra as nossas convicções, estaremos pecando, embora outros possam ter perfeita liberdade nesse ponto em particular.

Durante vários anos, lutei com a questão de como é que eu e minha família deveríamos observar o domingo como o Dia do Senhor. No princípio da minha vida cristã ensinaram-me que o domingo era um dia sagrado e que as suas atividades deveriam ser realizadas em harmonia com esse fato. Em breve vim a reconhecer que há, no entanto, genuíno desacordo entre cristãos sinceros sobre a maneira como se deve guardar o domingo. Aplicando os princípios de Romanos 14 a essa questão, devo, portanto, em primeiro lugar, não julgar os que observam o domingo de maneira diferente da minha. Segundo, quaisquer que sejam as minhas convicções, elas devem resultar duma sincera resposta de obediência à maneira como Deus está me guiando. E então, depois de ter desenvolvido as minhas próprias convicções, devo ter o cuidado de não as violar, independentemente do que os outros cristãos possam fazer.

A pergunta que devemos fazer numa busca séria de santidade é esta: “Estou disposto a desenvolver convicções a partir das Escrituras e a viver de acordo com elas?”. É muitas vezes aqui que surge o problema. Hesitamos em enfrentar o padrão de santidade de Deus numa área específica da vida. Sabemos que fazê-lo irá exigir obediência que não estamos dispostos a dar.

Isso leva-nos à segunda qualidade que devemos desenvolver, se queremos mortificar as obras do corpo. Essa qualidade é compromisso. Jesus disse: “Qualquer de vocês que não renunciar a tudo o que possui não pode ser meu discípulo” (Lucas 14.33). Temos de enfrentar honestamente a questão: “Estou disposto a

renunciar certa prática ou hábito que me mantém afastado da santidade?”. É nesse ponto de compromisso que muitos de nós falhamos. Preferimos flertar com o pecado, tentar brincar um pouco com ele, sem nos envolvermos demasiadamente.

Temos a síndrome do “só mais uma vez”. Daremos só mais um olhar sensual, comeremos só mais uma sobremesa bem doce antes de começarmos a dieta, veremos só mais um programa de televisão antes de nos sentarmos para estudar a Bíblia. Em tudo isso estamos adiando o dia do compromisso, o momento em que diremos “Basta!” ao pecado.

Lembro-me bem do dia em que Deus me falou a respeito do meu “fraco” por doces. Não é que eu estava com sobrepeso; o problema é que eu não conseguia resistir a qualquer sobremesa que aparecesse. Era daqueles que repetia sempre o bolo nos eventos sociais da igreja! Então numa manhã, precisamente no meio das festividades do Natal, quando todos os doces e guloseimas eram tão abundantes, Deus falou ao meu coração sobre esse problema. A minha resposta inicial foi: “Senhor, espere até passar o Natal e, então, acabarei com isto”. Eu não estava disposto a fazer naquele dia um compromisso.

Salomão diz-nos que os olhos do homem nunca se satisfazem (Provérbios 27.20). Mais um olhar sensual, ou mais uma fatia de bolo nunca satisfaz. Na verdade, acontece exatamente o contrário. Toda vez que dizemos “sim” à tentação, tornamos mais difícil dizer “não” na próxima vez.

Devemos reconhecer que temos desenvolvido padrões de hábitos pecaminosos. Desenvolvemos o hábito de encobrir um pouco os fatos, quando isso pode nos favorecer. Desenvolvemos o hábito de ceder à inércia que recusa deixar-nos levantar de manhã. Esses hábitos precisam ser destruídos, mas jamais o serão enquanto não fizermos um compromisso básico a uma vida de santidade, sem exceções.

O apóstolo João escreveu: “Meus filhinhos, escrevo-lhes estas coisas para que vocês não pequem” (1 João 2.1). Todo o propósito da Epístola de João, diz ele, é para que não pequemos. Um dia, quando estava estudando esse capítulo, reconheci que o objetivo da

minha vida pessoal em relação à santidade era inferior ao de João. Ele estava dizendo, com efeito: “Façam do não pecar o vosso alvo”. Enquanto refletia sobre isso, reconheci que no íntimo do meu coração o meu alvo real era não pecar muito. Achava difícil dizer “Sim, Senhor, de agora em diante o meu alvo será não pecar”. Percebi que Deus estava me chamando nesse dia para um nível mais profundo de compromisso com a santidade, maior do que aquele que eu antes desejara manter.

Você pode imaginar um soldado indo para a guerra com o alvo/objetivo de “não ser muito ferido”? A própria ideia é ridícula. O seu alvo é não ser ferido de forma alguma! No entanto, se não tivermos feito um verdadeiro compromisso com a santidade, sem exceção, somos como o soldado que vai para a batalha com o objetivo de não ser muito ferido. Podemos estar certos de que se é esse o nosso alvo, seremos mesmo feridos — não com balas, mas com repetidas tentações.

Jonathan Edwards, um dos grandes pregadores do princípio da história americana, costumava tomar resoluções. Uma delas foi: “Resolvi nunca fazer qualquer coisa da qual eu devesse ter medo, caso esteja vivendo a última hora de minha vida”.[30] Ousaremos nós, cristãos do século XXI, tomar tal resolução? Estaremos dispostos a entregar-nos a uma prática de santidade sem exceções? Não adianta pedirmos a Deus que nos dê vitória sobre a tentação, se não estivermos dispostos a comprometer-nos a dizer não à tentação.

É só aprendendo a negar a tentação que alguma vez poderemos mortificar as obras do corpo. Aprender isso é geralmente um processo lento e doloroso, sobrecarregado de muito fracasso. Os nossos velhos desejos e os nossos hábitos pecaminosos não se desalojam facilmente. Para acabar com eles é preciso persistência, muitas vezes em face de pouco resultado, mas esse é o caminho que devemos trilhar, não importa quão doloroso seja.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 10 - O lugar da disciplina pessoal$t$, 12,
$conteudo$Rejeite, porém, as fábulas profanas e tolas, e exercite-se na piedade.

1T 4.7

É possível estabelecer convicções em relação a uma vida de santidade e até mesmo fazer um compromisso definitivo a essa finalidade sem, no entanto, atingir o alvo. A vida está cheia de resoluções falhadas. Podemos determinar, pela graça de Deus, acabar com certo hábito pecaminoso — abrigar pensamentos sensuais, criticar o nosso irmão, ou qualquer outro. Contudo, verificamos com demasiada frequência que não conseguimos. Não atingimos esse progresso em santidade que tanto desejávamos.

Jay Adams põe o dedo sobre o problema, ao dizer: “Você pode ter procurado e tentado obter santidade instantânea. Não existe tal coisa… Queremos alguém que nos dê três passos fáceis para a santidade, e nós iremos consegui-los na próxima sexta-feira e então seremos piedosos. O problema é que a santidade não se adquire dessa maneira”.[31]

Adams continua, mostrando que o caminho para se obter a santidade passa pela disciplina cristã.[32] O conceito de disciplina é, no entanto, suspeito na nossa sociedade atual. Parece contrariar a nossa ênfase sobre a liberdade em Cristo e, muitas vezes, cheira a legalismo e dureza.

Paulo diz, entretanto, que devemos treinar-nos ou disciplinar-nos para sermos santos (1 Timóteo 4.7). A figura de linguagem que ele usa aqui vem da preparação física pela qual os atletas gregos passavam. Paulo disse ainda: “Todos os que competem nos jogos se submetem a um treinamento rigoroso” (1 Coríntios 9.25). Ele afirma que essa era uma atitude da sua vida, atitude essa que cada cristão deveria ter (1 Coríntios 9.24-27). Se um atleta se disciplina para obter um prêmio temporal, disse Paulo, quanto mais devemos nós, cristãos, disciplinar-nos para obtermos uma coroa que dura eternamente.

Como esses versículos indicam, a disciplina é treinamento estruturado. O New Collegiate Dictionary de Webster apresenta como definição de disciplina o seguinte: “Treinamento que corrige, molda ou aperfeiçoa as faculdades mentais ou o carácter moral”.[33] É isso que devemos fazer, se queremos buscar santidade: precisamos corrigir, moldar e treinar o nosso carácter moral.

A disciplina em relação à santidade começa com a Palavra de Deus. Paulo afirmou: “Toda a Escritura é inspirada por Deus e útil para o ensino, para a repreensão, para a correção e para a instrução na justiça” (1 Timóteo 3.16). O último item que ele menciona é treinar (NIV) ou disciplinar na justiça. É isso o que as Escrituras farão por nós, se a usarmos. Jay Adams diz: “É por uma obediência pronta, em oração e persistência, às exigências das Escrituras, que se desenvolvem padrões santos e esses se tornam uma parte de nós”.[34]

Lemos nas Escrituras: “Quanto à antiga maneira de viver, vocês foram ensinados a despir-se do velho homem, que se corrompe por desejos enganosos, a serem renovados no modo de pensar e a revestirse do novo homem, criado para ser semelhante a Deus em justiça e em santidade provenientes da verdade” (Efésios 4.22-24). Onde nos são ensinadas essas coisas? Só na Palavra de Deus. A disciplina em relação à santidade começa então com as Escrituras — com um plano disciplinado para a recepção regular das Escrituras e um plano disciplinado para aplicá-las à nossa vida diária.

Aqui, a nossa cooperação com o Espírito Santo é muito clara. Um diagrama da nossa interação com o Espírito poderia se parecer com isso:

O Espírito escreveu as Escrituras Nós aprendemos a Escritura

O Espírito traz à nossa mente o que aprendemos

Nós aplicamos o que ele nos traz à mente

O Espírito Santo já fez boa parte do seu trabalho ao dar-nos as Escrituras para nos disciplinar. E à medida que a aprendemos, ele fielmente traz as Escrituras às nossas mentes quando precisamos delas para enfrentar tentações. Quando procuramos aplicar a sua Palavra às situações do dia-a-dia, o Espírito atua em nós com vista a fortalecer-nos. No entanto, devemos responder ao que o Espírito Santo já fez, se esperamos que ele faça mais.

Vemos, pois, que devemos disciplinar as nossas vidas para uma dieta regular e saudável da Palavra de Deus. Precisamos dum período definido em cada dia para leitura e estudo da Bíblia. Todo cristão que progride em santidade é uma pessoa que tem a sua vida disciplinada de tal maneira que passa tempo regular com a Bíblia. Simplesmente não há outra maneira.

Satanás atacar-nos-á sempre neste ponto. Tentará persuadir-nos de que temos muito sono de manhã, estamos muito ocupados durante o dia e muito cansados à noite. Parece que nunca há tempo adequado para dedicar à Palavra de Deus. Isso significa que temos de nos disciplinar para arranjar esse tempo no nosso horário diário. Eu acho que logo cedo de manhã, antes do café da manhã, é a melhor ocasião para eu ler a Bíblia e orar sobre áreas de preocupação e necessidade. Essa é também a única hora do dia em que posso ser consistente no meu principal meio de exercício físico — o jogging. Fazer tudo isso antes do café da manhã requer que eu levante às cinco da manhã. E, como necessito de cerca de sete horas de sono, isso significa que devo deitar — luzes apagadas — por volta das dez da noite. Isso é difícil de fazer. E só pode ser feito disciplinando minhas horas noturnas.

Algumas donas de casa podem achar que esse período antes do café da manhã não é prático, especialmente se têm filhos muito pequenos ou precisam preparar tudo para a família sair para o trabalho ou escola, bem cedo. Nesse caso, talvez concluam que o período imediatamente após o café da manhã é mais adequado para os seus momentos a sós com Deus. Isso, também, requer disciplina; tirar um tempo quando as responsabilidades do dia estão exigindo atenção.

Quer seja antes ou depois do café da manhã, de manhã ou à noite, o ponto importante é que todos nós devemos ordenar o nosso horário de modo a providenciar esse tempo de assimilação da Palavra de Deus.

Uma meditação disciplinada da Palavra de Deus não envolve apenas um tempo planejado. Envolve igualmente um método planeado.

Em geral, pensamos nos métodos de assimilação da Bíblia como cabendo em quatro categorias — ouvir a Palavra ensinada pelos nossos pastores e professores (Jeremias 3.15), ler a Bíblia por nós próprios (Deuteronômio 17.19), estudar atentamente as Escrituras (Provérbios 2.1-5) e memorizar passagens-chaves (Salmos 119.11). Todos esses métodos são necessários para uma recepção balanceada da Palavra. Os pastores são dotados por Deus e preparados para ensinar “todo o conselho de Deus”. A leitura das Escrituras dá-nos a perspectiva global da verdade divina, enquanto que o estudo duma passagem ou tópico nos habilita a aprofundar mais determinada verdade. A memorização ajudanos a reter verdades importantes, de modo a podermos aplicá-las em nossa vida.

Contudo, se realmente queremos buscar santidade com disciplina, precisamos fazer mais do que ouvir, ler, estudar ou memorizar as Escrituras. Precisamos meditar nelas. Deus disse a Josué, quando este assumiu a liderança de Israel: “Não deixe de falar as palavras deste Livro da Lei e de meditar nelas de dia e de noite, para que você cumpra fielmente tudo o que nele está escrito” (Josué 1.8). Meditar nas Escrituras é pensar profundamente nelas, revolvê-las na nossa mente, e aplica-las às situações da nossa vida. Poucos de nós praticam a meditação nas Escrituras. De alguma forma, a ideia de meditação soa a qualquer coisa parecida com o que os monges medievais faziam nos mosteiros. Contudo, Josué, ocupadíssimo comandante-em-chefe do exército de Israel, foi exortado a meditar na Lei do Senhor dia e noite.

A prática da meditação na Palavra de Deus — simplesmente pensar nela e na sua aplicação à vida — é uma prática que desenvolvemos por meio de disciplina. Muitos de nós pensamos que não têm tempo para isso, mas há sempre alguns minutos durante o dia em que poderemos meditar, se realmente desenvolvermos esse hábito.

Eu sou como um “besouro” em relação a notícias e gosto de ouvilas no rádio, enquanto vou de carro para o trabalho ou para qualquer outro lugar. Um dia, fui desafiado pelo exemplo dum amigo a utilizar esse tempo para meditar em versículos bíblicos. Agora fico surpreendido ao ver quantos minutos consigo aproveitar para pensar em textos da Bíblia e na sua aplicação à minha vida. Talvez o leitor não tenha a mesma oportunidade que eu tenho de meditar enquanto dirijo o carro, mas, se em oração pensar nisso, irá, certamente, encontrar outra oportunidade no seu horário.[35]

O objetivo da nossa meditação é a aplicação — obediência às Escrituras. Isso também requer disciplina. A obediência às Escrituras requer geralmente mudanças nos nossos padrões de vida.

Como somos pecadores por natureza, desenvolvemos padrões pecaminosos, a que chamamos hábitos. É preciso disciplina para acabar com qualquer hábito. Se um rapaz desenvolveu um estilo errado de jogar basebol não poderá simplesmente decidir mudar dum momento para o outro. Ele desenvolveu certo hábito e precisa de muita disciplina — muita correção e treinamento — para acabar com esse mau hábito e desenvolver um hábito novo.

Do mesmo modo, os nossos padrões de desobediência a Deus foram se desenvolvendo ao longo de anos e não se destroem facilmente, ou sem disciplina. Disciplina não significa ranger os dentes e dizer: “Nunca mais volto a fazer”. Não! Significa treinamento estruturado e planejado. Assim como você precisa dum plano para a leitura ou estudo regular da Bíblia, assim também você precisa dum plano para aplicar a Palavra à sua vida.

Enquanto lê ou estuda as Escrituras e medita nelas durante o dia, faça a si mesmo essas três perguntas:

1. O que esse texto ensina com respeito à vontade de Deus

para uma vida santa?

2. Como é que a minha vida corresponde a esse texto das

Escrituras? Especificamente, onde e como eu falho? (Seja

realmente específico; não generalize.)

3. Que passos definidos de ação preciso tomar para

obedecer?

A parte mais importante deste processo é a aplicação específica das Escrituras às situações específicas da vida. Temos tendência de sermos vagos nesse ponto, porque o compromisso a ações específicas nos deixa inconfortáveis. Contudo, precisamos evitar compromissos gerais à obediência. Em vez disso, devemos aspirar a uma obediência específica em casos específicos. Enganamos as nossas almas quando crescemos no conhecimento da verdade sem, concretamente, lhe respondermos (Tiago 1.22). Isso pode levar ao orgulho espiritual (1 Coríntios 8.1).

Suponha que você esteja meditando em 1 Coríntios 13, o grande capítulo do amor. Enquanto pensa no capítulo, você percebe a importância do amor e vê também as expressões práticas do amor: o amor é paciente e amável e não tem inveja. Pergunta então a si mesmo: “Sou impaciente, pouco amável, ou invejoso para com alguém?”. À medida que pensa sobre isso, percebe que sente inveja do José, no trabalho, pois ele parece conseguir sempre tudo. Você confessa esse pecado a Deus, sendo muito específico em mencionar o José e a sua reação pecaminosa ao bom êxito dele. Você pede a Deus que abençoe ainda mais José e dê a você um espírito de contentamento, de maneira que não continue a invejá-lo, mas, pelo contrário, a amá-lo. Você poderia memorizar então 1 Coríntios 13.4 e pensar nesse versículo quando vê o José no trabalho. Você até mesmo procura maneiras de ajudá-lo. Faz então a mesma coisa nos dias seguintes, até que, finalmente, vê que Deus está trabalhando um espírito de amor no seu coração para com o José.

Isso é disciplina com vista à santidade. Você nunca mortificará esse espírito de inveja em relação ao José sem um plano bem estruturado para conseguir isso. Esse plano é aquilo a que chamamos disciplina.

Você pode ver rapidamente que esse treinamento estruturado em santidade é um processo que durará a vida inteira. Assim, um ingrediente necessário da disciplina é a perseverança.

Qualquer treinamento — físico, mental ou espiritual — é caracterizado, ao princípio, pelo fracasso. Falhamos mais vezes do que vencemos. Mas, se perseverarmos, veremos gradualmente progresso, até que passamos a vencer mais vezes do que falhamos. Isso é verdadeiro quando mortificamos determinados pecados. A princípio, parece que não estamos fazendo nenhum progresso; ficamos, portanto, desanimados e pensamos: Que adianta? Nunca conseguirei vencer esse pecado. É exatamente isso que Satanás quer que pensemos.

É nesse ponto que precisamos exercer a perseverança. Continuamos a querer um êxito instantâneo, mas a santidade não surge dessa maneira. Os nossos hábitos pecaminosos não se desfazem da noite para o dia. É preciso persistir para se obter qualquer mudança nas nossas vidas; e isso exige perseverança.

Jonathan Edwards, que resolveu nunca fazer qualquer coisa que não faria se estivesse na última hora da sua vida, tomou também esta resolução: “Resolvi nunca ceder, o mínimo que seja, para diminuir minha

luta contra minhas corrupções, por mais malsucedido que eu venha a ser”.[36] À primeira vista essas duas resoluções parecem de algum modo contraditórias. Se Edwards tinha decidido nunca fazer algo que não devia, então por que falar de nunca desistir da luta independentemente do insucesso que nela tivesse? Será que ele não tinha sido sincero ao tomar a primeira resolução? Sim, ele era sincero, mas sabia também que haveria muito fracasso e que era necessário perseverança. Assim, ele resolveu primeiro procurar viver uma vida santa, e então perseverar a despeito dos fracassos que ele sabia que viriam.

Um versículo das Escrituras que muitas vezes utilizo perante uma situação de fracasso com os meus próprios pecados é Provérbios 24.16. “Pois ainda que o justo caia sete vezes, tornará a erguer-se, mas os ímpios são arrastados pela calamidade”. A pessoa que se disciplina com vista à santidade cai muitas vezes, mas não desiste. Depois de cada queda levanta-se e continua a luta. Não acontece o mesmo com o ímpio. Esse tropeça no seu pecado e desiste. Não tem poder para vencer porque não tem o Espírito de Deus operando nele.

Um dos capítulos da Bíblia com que temos mais problemas é Romanos 7. Os cristãos estão sempre tentando “sair de Romanos 7 e entrar em Romanos 8”. A razão porque não gostamos de Romanos 7 é que ele reflete com muita exatidão a nossa própria luta com o pecado. Não gostamos da ideia de termos que lutar com o pecado. Queremos uma vitória instantânea. Queremos “andar no Espírito e deixá-lo conseguir a vitória para nós”. Mas Deus quer que perseveremos em disciplina com vista à santidade.

Alguns acham que afirmações de Paulo tais como “pois não faço o que desejo, mas o que odeio” (Romanos 7.15) são muito fortes para um cristão que anda no Espírito. Mas que cristão poderá negar que essa é muitas vezes a sua própria experiência? A verdade é que quanto mais vemos a santidade de Deus e a sua lei revelada para nós nas Escrituras, mais reconhecemos quão imperfeitos somos. Isaías era um profeta de Deus que andava na justiça dos mandamentos de Deus. Contudo, ao ver o Senhor Deus na sua santidade, foi obrigado a gritar: “Ai de mim! Estou perdido! Pois sou um homem de lábios impuros e vivo no meio de um povo de lábios impuros; os meus olhos viram o Rei, o S dos Exércitos!” (Isaías 6.5).

À medida que crescemos no conhecimento da santidade de Deus, mesmo que estejamos crescendo também na prática da santidade,

parece que a lacuna entre o nosso conhecimento e a nossa prática se torna cada vez maior. E essa é a maneira de o Espírito Santo nos atrair cada vez mais para a santidade. Isso se ilustra com o gráfico seguinte:

Progresso em santidade

Conhecimento da santidade

Prática da santidade

TEMPO

Romanos 7

À medida que progredimos em santidade, chegamos a odiar o pecado (Salmos 119.104) e a deleitar-nos na Lei de Deus (Romanos 7.22). Vemos a perfeição da Lei de Deus e a justiça de tudo o que ele requer de nós. Concordamos que “os seus mandamentos não são pesados” (1 João 5.3), mas são “santos, justos e bons” (Romanos 7.12). No entanto, durante todo esse tempo, vemos igualmente a nossa corrupção interior e as nossas frequentes quedas no pecado. Clamamos como Paulo: “Miserável homem que eu sou!” (Romanos 7.24) e queremos desistir. Isso não ousamos fazer! Se quisermos ser bem sucedidos na nossa luta de santidade, temos de perseverar, apesar dos fracassos.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 11 - Santidade no corpo$t$, 13,
$conteudo$Mas esmurro o meu corpo e faço dele meu escravo, para que, depois de ter

pregado aos outros, eu mesmo não venha a ser reprovado.

1C 9.27

A verdadeira santidade inclui o domínio sobre o nosso corpo e apetites físicos. Se quisermos seguir a santidade, precisamos reconhecer que o nosso corpo é o templo do Espírito Santo e que devemos glorificar a Deus com ele.

Os cristãos modernos, particularmente os do mundo ocidental, são em geral encontrados em falta na área da santidade do corpo. Glutonaria e preguiça, por exemplo, eram consideradas, pelos cristãos primitivos, como pecados. Hoje podemos considerá-las como fraquezas da vontade, mas não, certamente, pecados. Gracejamos mesmo sobre o problema de comer demais, e outros exageros da nossa parte, em vez de clamarmos a Deus em confissão e arrependimento.

O nosso corpo físico e apetites naturais foram criados por Deus e não são pecaminosos em si. Contudo, se os deixarmos sem controle, verificaremos que os nossos corpos se tornam “instrumentos de injustiça” em vez de “instrumentos de justiça” (Romanos 6.13). Estaremos seguindo a “cobiça da carne” (1 João 2.16), em vez de a santidade. Se nos examinarmos atentamente, podemos verificar quantas vezes comemos e bebemos só para satisfazer o desejo físico; quantas vezes ficamos na cama de manhã, simplesmente porque não nos apetece levantar quando devíamos; quantas vezes cedemos a olhares e pensamentos imorais, simplesmente para satisfazer o instinto sexual pecaminoso que se desenvolveu em nós.

Em seu livro The Christian Response, Michel Quoist diz: “Se o teu corpo fizer todas as decisões e der todas as ordens, e tu obedeceres, o físico poderá efetivamente destruir todas as outras dimensões da tua personalidade. A tua vida emocional será embotada e a tua vida espiritual será sufocada e acabará por ficar anêmica”.[37] Há mais de 200 anos, Susannah Wesley escreveu: “O que quer que aumente a força e a autoridade do seu corpo sobre a sua mente — essa coisa é pecado para você”.[38]

O apóstolo Paulo enfatizou a necessidade de mantermos os nossos apetites e desejos naturais sob controle. Ele referiu-se ao seu corpo como adversário, como o instrumento através do qual os apetites e as paixões, se deixados à vontade, lutariam contra a sua alma (1 Coríntios 9.27). Paulo estava resolvido a transformar o seu corpo, com esses apetites, em seu escravo, não em seu senhor.

Noutro ponto, Paulo insistiu no sentido de que apresentássemos os nossos corpos em sacrifício vivo e santo, agradável a Deus, e que não nos conformássemos com este mundo (Romanos 12.1-2). É muito possível que não haja maior conformidade com o mundo, entre os cristãos evangélicos de hoje, do que na maneira em que nós, em vez de apresentarmos os nossos corpos como sacrifício santo, os mimamos e entretemos, em desafio ao nosso melhor julgamento e nosso propósito cristão na vida.

Não estou pensando aqui naqueles que têm o chamado “problema do peso”. Aqueles que podem comer o que lhes apetece sem aumentar o peso poderão ser mais culpados de glutonaria e de ceder aos apetites do corpo, do que aquele que luta — muitas vezes sem êxito — para controlar o seu apetite. Por outro lado, a pessoa com peso a mais não deve desculpar o seu fracasso. Todos nós devemos examinar a nós mesmos e ver se comemos e bebemos de fato para a glória de Deus, reconhecendo que os nossos corpos são templos do Espírito Santo.

Os mórmons são conhecidos pela sua abstinência do tabaco, bebidas alcoólicas e todas as bebidas que contêm cafeína. Nós, cristãos, podemos desprezar a sua abstinência como legalista e como mais uma lista de proibições de determinado grupo. Mas não

devemos deixar de ver a verdade que as suas ações são uma resposta prática à crença que defendem de que os seus corpos são o templo de Deus. Para o cristão, o seu corpo é verdadeiramente o templo de Deus. É, pois, muito triste que uma falsa religião seja mais diligente nessa área do que nós cristãos. Deixem-me ser bem enfático: não estou aprovando nem desaprovando a lista de proibições dos mórmons. O que precisamos é perguntar a nós mesmos se o consumo que fazemos de comida e bebida é controlado pela consciência de que o nosso corpo é o templo do Espírito Santo.

Outra razão para controlarmos de perto o nosso exagero na comida e bebida é que a pessoa que se torna desregrada em relação ao corpo neste ponto achará cada vez mais difícil mortificar as outras obras pecaminosas do corpo. O hábito de ceder sempre ao desejo de comida ou bebida estender-se-á a outras áreas. Se não conseguimos dizer não a um apetite exagerado, teremos dificuldade em dizer não a pensamentos sensuais. Deve haver uma atitude de diligente obediência em todas as áreas da vida, se realmente queremos mortificar qualquer expressão de pecado. Thomas Boston escreveu: “Aqueles que querem manterem-se puros precisam conservar os seus corpos em sujeição e isso pode exigir, em alguns casos, uma santa violência”.[39]

Juntamente com pecados do corpo tais como imoralidade sexual, impureza, lascívia e desejos perversos, Paulo menciona também a avareza, que, afirma ele, é idolatria (Colossenses 3.5). Embora a avareza se manifeste muitas vezes na sua forma básica — o puro amor ao dinheiro pelo dinheiro — mais frequentemente pode ver-se naquilo a que chamamos materialismo. Não muitos de nós queremos ser extremamente ricos; desejamos simplesmente todas as coisas boas que o mundo à nossa volta considera importantes.

O materialismo luta contra as nossas almas, de uma forma dupla. Primeiro, torna-nos descontentes e invejosos em relação aos outros. Segundo, leva-nos a mimarmos e a cedermos ao nosso corpo, de modo que ficamos moles e preguiçosos. Quando ficamos moles e preguiçosos em nossos corpos, tendemos a tornar-nos

igualmente moles e preguiçosos espiritualmente. Quando Paulo falou sobre reduzir o seu corpo a escravo, de maneira que, depois de ter pregado aos outros, ele próprio não viesse a ser desqualificado, ele não estava pensando em desqualificação física, mas espiritual. Ele sabia bem que a moleza física leva, inevitavelmente, à moleza espiritual. Quando o corpo é mimado e levado ao exagero, os instintos e paixões do corpo tendem a crescer e a dominar os nossos pensamentos e ações. A nossa propensão é, portanto, não fazer o que deveríamos, mas o que queremos, quando obedecemos aos desejos da nossa natureza pecaminosa.

Não há lugar para preguiça e indulgência do corpo numa busca disciplinada de santidade. Precisamos aprender a dizer não ao corpo, em vez de continuamente cedermos aos seus desejos momentâneos. Temos a tendência de agir de acordo com os nossos sentimentos. O problema é que raras vezes “sentimos” vontade de fazer o que devíamos. Não sentimos vontade de sair da cama para termos a nossa hora a sós com Deus, de manhã, ou de fazer estudo bíblico ou orar, ou de qualquer coisa que devíamos fazer. É por isso que temos de controlar o nosso corpo e transformá-lo em servo, em vez de senhor.

O segredo para começar a controlar a força dos nossos apetites físicos é reduzir as oportunidades de tentação. As nossas concupiscências são fortalecidas pela tentação. Quando uma tentação razoável se nos apresenta, as nossas concupiscências parecem receber novo vigor e poder. Paulo teve palavras definidas de instrução para nós, sobre este assunto. Diz-nos ele: “Fuja dos desejos malignos da juventude” (2 Timóteo 2.22). Algumas tentações vencem-se melhor pela fuga. Paulo disse também: “Não fiquem premeditando como satisfazer os desejos da carne” (Romanos 13.14). Não planeje de antemão, nem faça provisões quanto à maneira de ceder aos apetites do seu corpo.

Há alguns anos, verifiquei que tinha criado um verdadeiro vício por sorvetes. Ora, não há nada de mal no sorvete em si; o problema é que eu tinha-me apegado tanto a ele, que isso se transformara num autêntico vício. Quando compartilhei esse problema à minha esposa, ela deixou de guardar sorvete no congelador. Ajudou-me

assim a não ter com que satisfazer esse desejo específico que, pelo exagero, se transformara num pecado para mim. Também há alguns anos cancelei a minha assinatura duma revista popular, porque notei que muitos dos artigos tendiam a estimular pensamentos impuros na minha mente.

Precisamos fugir à tentação e dar passos positivos para evitála; e devemos evitar pensar em satisfazer os nossos desejos pecaminosos. “O prudente percebe o perigo e busca refúgio; o inexperiente segue adiante e sofre as consequências” (Provérbios 27.12).

Deveríamos estudar também os nossos desejos pecaminosos e ver como é que eles se levantam contra nós. John Owen disse: “Trabalhar para conhecer bem os caminhos, os ardis, os métodos, as vantagens e ocasiões de êxito de pecado é o princípio para este combate”.[40] Medite antecipadamente. É espantoso o número de vezes em que avançamos para áreas conhecidas de tentação, sem qualquer plano ou resolução sobre a maneira como iremos reagir. Se você tem um fraco por coisas doces, como eu, e tem de ir ao convívio na igreja, planeje antecipadamente o que vai fazer. Há diversos anos, um amigo que era crente novo foi convidado para uma festa de patinagem, com um grupo de jovens cristãos. Ele resolveu não ir, porque antes de se tornar crente tinha feito frequentes “investidas” nas pistas de patinagem. Sentiu, portanto, que nessa altura do seu crescimento o voltar ao mesmo ambiente tenderia a estimular os seus velhos desejos sensuais. Decidiu então “fugir”, e não premeditar “como satisfazer os desejos da carne”. Conseguiu fazer isso, porque considerou de antemão as consequências possíveis da sua ida a uma festa de patinagem, aparentemente inocente.

Deus espera que assumamos a nossa responsabilidade em manter sob controle os desejos pecaminosos do corpo. É verdade que não o podemos fazer na nossa própria força. Os nossos desejos pecaminosos, estimulados por todas as tentações que nos rodeiam, são demasiado fortes para nós. No entanto, embora não possamos fazer isso sozinhos, podemos fazê-lo. Quando nos propomos a realizar essa tarefa na dependência do Espírito Santo,

vemos que ele trabalha em nós. Falharemos muitas vezes, mas, com perseverança, seremos capazes de dizer como Paulo: “Tudo posso naquele que me fortalece” (Filipenses 4.13).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 12 - Santidade no espírito$t$, 14,
$conteudo$Amados, visto que temos essas promessas, purifiquemo-nos de tudo o que contamina o corpo e o espírito, aperfeiçoando a santidade no temor de Deus.

2C 7.11

Há vários anos, no trabalho de evangelização nas universidades, usávamos uma ilustração, calculada para tornar os nossos auditórios de estudantes devidamente conscientes de que eram pecadores, individualmente. Dizíamos-lhes assim: “Se eu pudesse projetar rapidamente numa tela diante de nós, esta noite, todos os vossos pensamentos da semana passada, vocês teriam de abandonar a cidade”. Esse comentário não só os ajudava a entender o ponto, mas provocava uma gargalhada. Para o cristão, todavia, essa acusação não é caso de rir. Os nossos pensamentos são tão importantes para Deus como são nossas ações, e são tão conhecidos por Deus como as nossas ações (Salmos 139.1-4; 1 Samuel 16.7).

Jesus ensinou-nos no Sermão da Montanha que os mandamentos de Deus visam não só regular a conduta externa, mas também a disposição interna. Não basta não matarmos; é preciso que também não odiemos. Não basta que não cometamos adultério; é preciso que nem mesmo abriguemos olhares e pensamentos sensuais.

Da mesma maneira que devemos aprender a controlar os nossos apetites, também precisamos aprender a trazer o nosso pensamento em obediência a Jesus Cristo. De fato, Paulo alerta-nos contra tentativas mal orientadas, e erradamente motivadas, de controlar o corpo, que deixam o nosso pensamento sem freio

(Colossenses 2.23). É possível refrear os apetites naturais do corpo, externamente, e continuar cheio de todo o tipo de poluição interna.

A Bíblia indica que o nosso pensamento determina, em última análise, o nosso carácter. Salomão disse: “Porque, como imagina em sua alma, assim ele é” (Provérbios 23.7, ARA). Um provérbio bem conhecido diz: Semeia um pensamento, colherás um ato;

Semeia um ato, colherás um hábito;

Semeia um hábito, colherás um carácter.

É devido à importância do nosso pensamento que Paulo afirma: “Finalmente, irmãos, tudo o que for verdadeiro, tudo o que for nobre, tudo o que for correto, tudo o que for puro, tudo o que for amável, tudo o que for de boa fama, se houver algo de excelente ou digno de louvor, pensem nessas coisas” (Filipenses 4.8).

Como cristãos, não devemos nos conformar mais com o padrão deste mundo, mas antes renovar a nossa mente (Romanos 12.1-2; Efésios 4.23; 1 Pedro 1.14). A santidade começa na nossa mente e se expressa nas nossas ações. Como isso é um fato, aquilo que nós deixamos entrar na nossa mente é muitíssimo importante.

Os programas de televisão que vemos, os filmes que assistimos, os livros e revistas que lemos, a música que ouvimos, as conversas que travamos, tudo isso afeta a nossa mente. Precisamos avaliar honestamente os efeitos dessas vias de comunicação, servindo-nos de Filipenses 4.8 como padrão. Serão verdadeiros os pensamentos estimulados por essas diversas vias? Serão eles puros, amáveis, de boa fama, excelentes ou dignos de louvor?

O mundo que nos rodeia procura constantemente conformar as nossas mentes com os seus caminhos pecaminosos. Não se cansa jamais nos seus esforços. Quer iludir-nos e convencer-nos (Provérbios 1.10-14). Quando resistimos, ridiculariza-nos e insultanos como sendo antiquados e “puritanos” (1 Pedro 4.4).

Em vez de resistirem, muitos cristãos estão cada vez mais cedendo terreno à pressão constante do mundo. Há alguns anos, os

cristãos sinceros eram bastante seletivos em relação aos filmes que iam ver no cinema, se é que viam. Hoje em dia, os mesmos filmes que eram evitados estão sendo mostrados na televisão das salas de estar dos cristãos, por todo o país. Um amigo meu falou-me dum jovem casal envolvido em trabalho cristão em tempo integral que o interrogou sobre se seria errado assistir a filmes pornográficos! O fato dessa pergunta sequer ser cogitada ilustra bem o grau a que o mundo já contaminou a nossa mente.

A música que ouvimos traz consigo muitas vezes a mensagem do mundo, e esse se serve da música para nos ajustar ao seu molde. O cristão não pode deixar de, gradualmente, ser influenciado, se ouvir constantemente a música do mundo.

Talvez nem seja necessário dizer que os cristãos devem se abster de tolerar ou ouvir histórias e anedotas picantes. Paulo, no entanto, não poderia assumir isso como certo no seio das igrejas primitivas, e nem nós podemos fazê-lo neste século. Ouçamos a clara exortação de Paulo sobre o assunto: “Entre vocês não deve haver nem sequer menção de imoralidade sexual como também de nenhuma espécie de impureza e de cobiça; pois essas coisas não são próprias para os santos. Não haja obscenidade, nem conversas tolas, nem gracejos imorais, que são inconvenientes, mas, ao invés disso, ações de graças” (Efésios 5.3-4). “Entre vocês não deve haver nem sequer menção” é uma expressão que coloca qualquer história picante fora dos limites duma vida santa.

Outro estímulo a pensamentos impuros aos quais devemos estar alertas é o que os nossos olhos veem. Jesus alertou-nos contra o olhar sensual (Mateus 5.28). Jó fez um concerto com os seus olhos (Jó 31.1). O olhar sensual de Davi foi quase fatal à sua vida espiritual (2 Samuel 11.2). Não devemos guardar apenas os nossos olhos; precisamos velar para que nós não sejamos fonte de tentação para outros. Por essa razão, exige-se modéstia de vestuário e ações, tanto a homens como a mulheres (1 Timóteo 2.9; 5.2).

Filipenses 4.8, todavia, não fala de pensamentos imorais e impuros, apenas. Os nossos pensamentos não devem ser só puros — devem ser também verdadeiros, amáveis e dignos de louvor.

Precisamente como podemos cometer adultério no nosso coração (Mateus 5.28), também podemos cometer homicídios no nosso coração (Mateus 5.21-22).

Numa das suas epístolas, Paulo enumerou alguns atos da natureza pecaminosa. Essa lista incluía a poluição do corpo — imoralidade sexual, impureza, dissolução, bebedeira, orgias e coisas do gênero. Outros elementos constantes da lista poluem o espírito: ódio, discórdia, ciúme, acessos de raiva, ambição egoísta, etc. Precisamos nos purificar não só dos pecados grosseiros do corpo, mas também dos pecados mais “aceitáveis” do espírito.

Eis de novo um ponto onde nós, cristãos, temos falhado muitas vezes, e terrivelmente. Focando a nossa atenção sobre a lista específica dos “Faças — Não faças” do grupo, negligenciamos a vida interior, onde a inveja, o orgulho, a amargura e um espírito crítico e ressentido podem reinar sem impedimentos.

O irmão mais velho da história do filho pródigo (Lucas 15) é um exemplo clássico de alguém que levava uma vida exterior exemplar, mas que vivia consumido por um espírito de inveja e justiça própria. Ele podia afirmar que nunca havia desobedecido às ordens do pai; contudo, o seu ciúme e ira em face da alegria do pai pelo regresso do pródigo marca-o até ao nosso tempo como um exemplo a ser evitado, em vez de seguido.

O espírito de inveja foi a raiz da guerra incessante que o rei Saul moveu contra Davi. A princípio, Saul estava muito contente com Davi e o colocou sobre os seus exércitos. Um dia, porém, Saul ouviu as mulheres de Israel cantar: “Saul matou milhares, e Davi, dezenas de milhares" (1 Samuel 18.7). Saul ficou enraivecido por elas atribuírem dezenas de milhares a Davi e só milhares a ele. A Bíblia diz então: “Daí em diante Saul olhava com inveja para Davi” (1 Samuel 18.9). Deus colocou cada um de nós no corpo de Cristo, conforme lhe agradou (1 Coríntios 12.8) e atribuiu a cada um de nós um lugar na vida (1 Coríntios 7.17). A alguns Deus destinou um lugar de proeminência, a outros um lugar obscuro; a alguns designou um lugar de riqueza, a outros um lugar de luta diária para a satisfação das necessidades. No entanto, independentemente da nossa posição na vida, ou do nosso lugar no corpo, há sempre a

tentação de invejar outra pessoa. O irmão mais velho da parábola herdaria um dia todos os bens do pai; contudo, ele sentia ciúme por se fazer um banquete para festejar o regresso do irmão. Saul era rei de todo o Israel, mas não pôde suportar que outra pessoa recebesse mais louvor que ele.

A cura para o pecado da inveja e ciúme está em encontrarmos o nosso contentamento em Deus. No Salmo 73, Asafe sentia inveja dos ímpios ao ver a sua aparente prosperidade (v. 3). Achava que a sua busca duma vida santa era vã (v. 13). Só quando conseguiu dizer ao Senhor “E na terra, nada mais desejo além de estar junto a ti” (v. 25) é que foi liberto do pecado da inveja.

Outra poluição do espírito que tem arruinado muitos cristãos é a amargura. Ela surge no nosso coração quando não confiamos no governo soberano de Deus nas nossas vidas. Se alguma vez houve quem tivesse razões para ficar amargurado, esse alguém foi José. Vendido como escravo pelos irmãos ciumentos, falsamente acusado pela esposa imoral do patrão, esquecido por um homem que ele tinha ajudado na prisão, José nunca perdeu de vista o fato de que Deus estava no controle de tudo o que lhe acontecia. No fim, ele pôde dizer aos seus irmãos: “Vocês planejaram o mal contra mim, mas Deus o tornou em bem, para que hoje fosse preservada a vida de muitos” (Gênesis 50.20).

Nós podemos ficar ressentidos contra Deus ou contra outras pessoas. Asafe estava ressentido contra Deus, porque achava que ele não lhe estava dando a devida atenção na vida (Salmos 73.21). Jó estava amargurado porque achava que Deus não estava reconhecendo a sua justiça. Chegou mesmo a um ponto em que a sua atitude foi descrita como “De nada aproveita ao homem o comprazer-se em Deus” (Jó 34.9, ARA).

A amargura em relação às pessoas é o resultado dum espírito que não perdoa. Alguém nos prejudicou, aparentemente ou de fato, e nós recusamo-nos a perdoar. Em contrapartida, abrigamos sentimentos de amargura para com essa pessoa. Recusamo-nos a perdoar porque não queremos reconhecer que Deus nos tenha perdoado faltas muito, muito maiores. Somos como o servo que, depois de ter sido perdoado duma dívida de diversos milhões,

lançou um companheiro na prisão por lhe dever uns poucos dólares (Mateus 18.21-35).

Muito ligado à amargura está o espírito de retaliação. Quando nos ofendem, a tendência natural é vingarmo-nos — muitas vezes na nossa mente, se não chegamos à ação. Quando Davi fugiu da insurreição do seu filho Absalão, em Jerusalém, Simei, da família de Saul, saiu a amaldiçoar Davi e a atirar-lhe pedras. Um dos homens de Davi quis vingar-se, matando Simei, mas Davi impediu-o de fazer tal coisa, com estas palavras: “Deixem-no em paz! Que amaldiçoe, pois foi o S que mandou fazer isso. Talvez o S considere a minha aflição e me retribua com o bem a maldição que hoje recebo” (2 Samuel 16.11-12).

Paulo escreveu: “Amados, nunca procurem vingar-se, mas deixem com Deus a ira, pois está escrito: ‘Minha é a vingança; eu retribuirei’, diz o Senhor” (Romanos 12.19). Pedro diz a respeito do nosso Senhor: “Quando insultado, não revidava; quando sofria, não fazia ameaças, mas entregava-se àquele que julga com justiça” (1 Pedro 2.23). Essa é a maneira de nos limparmos da poluição do espírito de vingança: confiarmo-nos àquele que julga justamente e que disse: “Minha é a vingança, eu retribuirei”.

Uma das mais difíceis poluições do espírito com que temos de acabar é o espírito de crítica. Um espírito de crítica tem a sua raiz no orgulho. Devido à viga de orgulho no nosso próprio olho, somos incapazes de tirar o “cisco” de necessidade no olho doutra pessoa. Somos muitas vezes como o fariseu que, totalmente inconsciente da sua própria necessidade, orou: “Deus, eu te agradeço porque não sou como os outros homens” (Lucas 18.11). Somos muito rápidos em ver — e em mencionar — as faltas dos outros, mas lentos em ver as nossas próprias necessidades. Com que prazer aproveitamos a oportunidade de criticar alguém — mesmo quando não temos a certeza dos nossos fatos! Esquecemo-nos de que “aquele que provoca discórdia entre irmãos” é uma das “seis coisas que o S odeia” (Provérbios 6.16-19).

Todas essas atitudes — inveja, ciúme, amargura, um espírito vingativo e incapaz de perdoar, e um espírito de crítica e maledicência — maculam-nos e impedem-nos de sermos santos

diante de Deus. São tão perversos como a imoralidade, a bebedeira e a dissolução. Por isso, precisamos nos esforçar com diligência no sentido de arrancarmos da nossa mente essas atitudes pecaminosas. Muitas vezes não temos consciência de que as nossas atitudes são perversas. Encobrimos esses pensamentos poluídos, sob o disfarce de justiça e indignação correta. Mas precisamos pedir diretamente ao Senhor que nos dê humildade e honestidade para ver essas atitudes pecaminosas como elas realmente são e, depois, a graça e disciplina necessárias para as arrancarmos da nossa mente e as substituirmos por pensamentos que agradem a Deus.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 13 - A santidade e a nossa vontade$t$, 15,
$conteudo$Pois é Deus quem efetua em vocês tanto o querer quanto o realizar, de

acordo com a boa vontade dele.

F 2.13

Em tudo o que já dissemos até agora sobre a nossa responsabilidade na santificação — a necessidade de convicção, compromisso, perseverança, disciplina e santidade no corpo e no espírito —, a atividade da nossa vontade está sempre implícita. É a vontade que, em última análise, decide se quer pecar ou obedecer. É a vontade que escolhe ceder à tentação ou dizer não. A nossa vontade determina, pois, em última análise, o nosso destino moral, se queremos ser santos ou impuros no nosso caráter e conduta.

Como isto é um fato, torna-se muitíssimo importante que entendamos a maneira como funciona a nossa vontade — o que a leva a seguir numa direção ou noutra, por que faz determinadas escolhas. Acima de tudo o mais, devemos aprender a levar a nossa vontade à submissão e obediência à vontade de Deus, numa base prática, diária e constante.

Para compreendermos melhor como funciona a nossa vontade, vamos rever a definição de coração, apresentada já no capítulo 6. Nessa definição, Owen dizia que o coração, no sentido em que esse termo é aplicado na Bíblia, indica geralmente todas as faculdades da alma, no seu trabalho conjunto, para fazer o bem ou o mal — a mente, as emoções, a consciência e a vontade.

Todas essas faculdades foram implantadas por Deus na alma humana, mas foram todas corrompidas através da queda do homem no Jardim do Éden. A nossa razão (ou compreensão) foi obscurecida (Efésios 4.18) os nossos desejos emaranharam-se

(Efésios 2.3) e a nossa vontade foi pervertida (João 5.40). Com o novo nascimento, a nossa razão volta a ser iluminada, os nossos afetos e desejos são voltados numa nova direção e a nossa vontade dominada. Contudo, embora isso seja verdade, não se verifica tudo imediatamente. Na experiência real é um processo gradual. Fomos exortados a renovar a nossa mente (Romanos 12.2), a pôr o nosso afeto nas coisas de cima (Colossenses 3.1),[41] e a submeter a nossa vontade a Deus (Tiago 4.7).

Além disso, quando Deus criou originalmente o homem, a razão, as emoções e a vontade trabalhavam em perfeita harmonia. A razão ia à frente na compreensão da vontade de Deus, a vontade consentia em fazer a vontade de Deus, e as emoções deleitavam-se em fazê-la. No entanto, com a entrada do pecado na alma humana, essas três faculdades começaram a trabalhar com objetivos que se opunham entre si e também a Deus. A vontade tornou-se teimosa e rebelde e não quer concordar com o que a razão sabe ser a vontade de Deus. Ou então, o que é mais comum, as emoções tornam-se dominantes e afastam a razão e a vontade da obediência a Deus.

O objetivo de tudo isso é enfatizar e permitir-nos entender a íntima relação entre a mente, as emoções e a vontade. Embora a vontade seja a suprema determinante de todas as escolhas, é influenciada nessas escolhas pelas forças mais poderosas que atuam sobre ela.

Essas forças poderosas vêm de diversas fontes. Podem ser sutis sugestões de Satanás e do seu sistema mundano (Efésios 2.2), ou seduções perversas da nossa própria natureza pecaminosa (Tiago 1.14); pode ser a voz urgente da consciência, o argumento sincero dum amigo querido, ou o sereno impulso do Espírito Santo. Mas, venham elas donde vierem, a verdade é que estas forças atingem a nossa vontade através da razão ou das emoções.

Devemos, portanto, estar alerta quanto ao que entra na nossa mente e influencia as nossas emoções. Salomão disse: “Acima de tudo que se deve guardar, guarda o teu coração, porque dele procedem as fontes da vida” (Provérbios 4.23, ARA). Se guardarmos diligentemente a nossa mente e emoções, veremos o Espírito Santo trabalhando em nós, para conformar a nossa vontade

com a sua (Filipenses 2.12-13). Como é que então podemos guardar a mente e as emoções?

Davi declarou: “Como pode o jovem manter pura a sua conduta? Vivendo de acordo com a tua palavra” (Salmos 119.9). Davi guardava o seu caminho com a Palavra de Deus. A Bíblia falanos primeiramente através da nossa razão; por isso é tão importante que a nossa mente esteja sempre sob a sua influência. Não há absolutamente nenhum atalho para a santidade que passe de lado, ou dê pouca importância a uma assimilação constante da vida.

Salomão disse-nos que a sabedoria, a compreensão e a discrição nos guardarão do mau caminho (Provérbios 2.10-12). Trata-se de qualidades da nossa mente. Como poderemos adquirir essas qualidades? “Pois o S é quem dá sabedoria; de sua boca procedem o conhecimento e o discernimento” (Provérbios 2.6). Mas a quem dá o Senhor tais qualidades? Àquele que recebe as suas palavras, que intimamente valoriza os seus mandamentos, que mantém o seu ouvido atento à sabedoria e o seu coração pronto para a compreensão, que ora por discernimento e entendimento e que procura a compreensão, como se se tratasse dum tesouro escondido (Provérbios 2.1-5).

Torna-se evidente, mesmo numa leitura casual de Provérbios 2.1-12, que a influência protetora da Palavra de Deus vem como resultado duma assimilação diligente, em oração e determinada, das Escrituras. Para guardarmos a mente devemos dar prioridade à Bíblia na nossa vida — não apenas pela informação espiritual que transmite, mas também para aplicação diária da mesma às situações concretas da nossa vida.

Nós não devemos guardar apenas a nossa mente; devemos guardar também as nossas emoções. Para isso, é útil que reconheçamos primeiro que, embora Deus apele muitas vezes à nossa vontade através da razão, o pecado e Satanás apelam em geral através dos nossos desejos. É verdade que Satanás irá atacar a nossa razão para confundir e enevoar as questões, mas isso é só para nos poder vencer através dos nossos desejos. Foi essa a estratégia que utilizou com Eva (Gênesis 3.1-6). Atacou a sua razão questionando a integridade de Deus, mas a sua principal tentação

dirigiu-se ao desejo de Eva. Lemos que ela viu que a árvore era boa para se comer, agradável aos olhos e desejável para dar sabedoria (Génesis 3.6).

Sabendo que Satanás ataca, acima de tudo, através dos nossos desejos, devemos vigiá-los com diligência e usar a Palavra de Deus para controlá-los constantemente. Não se trata de ascetismo; trata-se de prudência espiritual. Cada um de nós deve procurar estar consciente da maneira como o pecado nos ataca, através dos nossos desejos, e prevenir-se. É isso que Paulo aconselhou a Timóteo quando o instruiu: “Foge também das paixões da juventude” (2 Timóteo 2.22, A21).

Guardar os nossos desejos implica, contudo, mais do que lutar na defensiva contra as tentações do mundo, da carne e do diabo. Temos de passar à ofensiva. Paulo aconselha-nos a colocarmos o coração nas coisas que são de cima, isto é, nos valores espirituais (Colossenses 3.1). O salmista exorta-nos a deleitarmo-nos na lei de Deus (Salmos 1.2), e acerca de Jesus estava profetizado: “Deleitome em fazer a tua vontade, ó Deus meu” (Salmos 40.8, ACF). Vemos, então, que devemos colocar os nossos desejos nas coisas espirituais e deleitar-nos na lei e vontade de Deus.

Chegamos assim ao fim da disciplina — a um plano estruturado. Normalmente, a nossa razão, vontade e emoções deveriam trabalhar nessa ordem, mas, como tantas vezes nós invertemos a ordem, dando atenção aos nossos desejos, temos de trabalhar no sentido de dirigir de novo esses desejos para a vontade de Deus.

Quando comecei pela primeira vez a fazer jogging, como exercício, não estava muito motivado e, portanto, não era persistente. Sabia que o devia fazer, que o meu corpo precisava de condições físicas e que, provavelmente, eu ficaria mais saudável como resultado da prática desse exercício. O problema é que eu não tinha condições, pensava. Isso exigia tempo de que eu não dispunha e, acima de tudo, era difícil. Assim, comecei, parei, comecei, parei, sem nunca fazer qualquer progresso significativo. Foi então que li o livro do Dr. Kenneth Cooper, Aerobics, que documenta a importância das atividades que exigem esforço, tais

como o jogging, que exercita o coração. O Dr. Cooper explicava porque é que o jogging era importante, dava algumas linhas de orientação simples para o praticar e permeava os seus fatos e instruções com muitos exemplos de pessoas cuja vida física foi dramaticamente mudada em consequência do jogging.

Dei comigo a ler esse livro, talvez meia dúzia de vezes. Eu não precisava ser convencido da importância do jogging; já estava convencido. Não precisava voltar a ler as poucas regras simples; entendi-as perfeitamente logo à primeira vez. Era de motivação que eu precisava. Todas aquelas histórias de “sucesso” — aquilo a que chamo histórias do “antes e depois” — motivaram-me a praticar o jogging. A leitura repetida desses exemplos conseguiu finalmente tornar-me persistente. Influenciei a minha vontade através das minhas emoções (pela motivação), quando não o podia fazer pela razão (pela compreensão da importância do jogging).

Ora, além de nos dar instruções e linhas de orientação para a vida, a Bíblia está cheia de histórias de “sucesso” de pessoas reais que confiaram em Deus e lhe obedeceram, e cujas vidas foram radicalmente transformadas, ou influenciaram de modo significativo o curso da história. O capítulo 11 de Hebreus apresenta-nos uma lista breve e incompleta de algumas dessas histórias. Há, contudo, muitos mais que não foram mencionados (como o próprio autor de Hebreus reconhece em 11.32). As proezas de homens tais como Daniel, Ananias e Elias, bem como de Abraão, Noé e Davi podem motivar-nos a avançar e a agir como eles. Seria, portanto, útil que incluíssemos constantemente os relatos de alguns destes homens na nossa leitura bíblica para nos motivarem em áreas de santidade.

Além das Escrituras, podemos estar alerta em relação a alguns livros clássicos que de fato nos motivam para uma vida santa e piedosa. O seu número talvez não exceda uma meia dezena que satisfaz de modo singular as nossas necessidades.[42] Esses livros devem ser lidos diversas vezes e com frequência, da mesma maneira que eu li o Aerobics. A ideia básica é que se deve ter um plano — uma abordagem disciplinada — que nos permita estar motivados para a santidade.

Em última análise, é Deus quem opera em nós tanto o querer como o efetuar, segundo a sua boa vontade. Contudo, Paulo exortanos expressamente a que trabalhemos nós mesmos para conseguir isso (Filipenses 2.12). A nossa responsabilidade no tocante à nossa vontade, consiste em guardarmos a nossa mente e emoções, conscientes do que influencia a nossa mente e estimula os nossos desejos. Quando fizermos a nossa parte, veremos o Espírito de Deus fazendo a sua, tornando-nos mais santos.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 14 - Hábitos de santidade$t$, 16,
$conteudo$Assim como vocês ofereceram os membros do seu corpo em escravidão à

impureza e à maldade que leva à maldade, ofereçam-nos agora em

escravidão à justiça que leva à santidade.

R 6.19

Quanto mais pecamos, mais somos inclinados a pecar. John Owen expressou-se desse modo, no seu estilo excêntrico do século XVII: “Atos repetidos do consentimento da vontade em pecar podem gerar uma disposição e inclinação da vontade para uma propensão e prontidão em consentir no pecado a partir de uma solicitação fácil”.[43]

Cada pecado que cometemos reforça o hábito de pecar e torna mais fácil pecar. No capítulo anterior vimos a importância de guardarmos a mente e as emoções, uma vez que essas faculdades constituem os canais através dos quais as várias forças impulsionadoras chegam à nossa vontade. É, no entanto, igualmente importante que entendamos como é que os nossos hábitos influenciam a nossa vontade.

O hábito é definido como “disposição ou caráter dominante dos pensamentos e sentimentos de uma pessoa”.[44] Os hábitos são os padrões de pensamento e emoções gravados na nossa mente. Esses padrões internos de hábitos exercem tanta pressão nas nossas ações como as influências externas — de fato, talvez ainda mais. Owen disse: “Toda paixão é um hábito depravado ou uma disposição que continuamente inclina o nosso coração a fazer o mal”.[45]

Quando éramos incrédulos, entregávamo-nos à formação de hábitos de impiedade — aquilo a que Paulo chamou “maldade que leva à maldade” (Romanos 6.19). Cada vez que pecamos — cada vez que fomos sensuais, que cobiçamos, que odiamos, que enganamos ou mentimos — estávamos desenvolvendo hábitos mais ímpios. Esses atos repetidos de injustiça tornaram-se hábitos que nos fizeram, de fato, escravos do pecado.

Agora, porém, declarou Paulo, assim como antes nos entregávamos a esses hábitos perversos, devemos entregar-nos à formação de hábitos de santidade (Romanos 6.19). Devemos despojar-nos do nosso velho homem — da nossa disposição pecaminosa e seus hábitos — e revestir-nos do novo homem — com o seu carácter e hábitos de santidade. Treinarmo-nos em santidade (1 Timóteo 4.7) é disciplinarmos e estruturarmos a nossa vida de modo a desenvolvermos hábitos piedosos. O abandono desses hábitos pecaminosos é aquilo a que Paulo chama mortificação, ou morte, das obras do corpo (Romanos 8.13).

Embora tenhamos de acabar com esses hábitos de impiedade, não devemos tentar fazê-lo na nossa própria força. A destruição de hábitos pecaminosos deve ser levada a cabo em cooperação com o Espírito Santo, e em dependência dele. A determinação de que “nunca mais farei isso” baseada na simples resolução humana, jamais quebrou os grilhões do pecado. Há, contudo, princípios práticos que podemos seguir para nos disciplinarmos em santidade.

O primeiro princípio é que os hábitos são adquiridos e reforçados por repetição frequente. Outra definição de hábito é um “padrão de conduta adquirido por repetição frequente”.[46] Esse é um princípio que está na base de que quanto mais pecamos mais somos inclinados a pecar. Mas o oposto também é verdade. Quanto mais dizemos não ao pecado, mais somos inclinados a dizer-lhe não.

Assim, na dependência do Espírito Santo, devemos trabalhar sistematicamente no sentido de adquirir o hábito de dizer não aos pecados que tão facilmente nos dominam. Todos sabemos quais são esses pecados: aqueles pecados a que somos particularmente vulneráveis. Começamos por nos concentrar em dizer-lhes não.

Deus levar-nos-á então a trabalhar sobre outros pecados, de que talvez não estejamos conscientes nesse momento. Quanto mais conseguimos dizer não aos nossos desejos pecaminosos, mais fácil se torna dizer não.

Da mesma maneira, podemos desenvolver hábitos positivos de santidade. Podemos desenvolver o hábito de alimentar pensamentos puros, verdadeiros e bons. Podemos desenvolver os hábitos de oração e meditação nas Escrituras. Contudo, esses hábitos só serão adquiridos através de repetição frequente.

O segundo princípio para acabar com hábitos pecaminosos e adquirir outros novos é nunca permitir exceções. Quando consentimos exceções, estamos reforçando os velhos hábitos, ou falhando em reforçar o novo. Nesse ponto devemos nos alertar contra o tipo de pensamento “só mais uma vez”, que constitui uma armadilha sutil e perigosa. Como não estamos dispostos a pagar o preço de dizer não aos nossos desejos, dizemos a nós próprios que só cederemos uma vez mais, e amanhã será diferente. No íntimo do coração sabemos perfeitamente que amanhã será ainda mais difícil dizer não, mas não queremos pensar nisso.

O terceiro princípio é que é preciso diligência em todas as áreas para assegurar êxito numa certa área. Owen disse: “Sem um esforço sincero e diligente em cada área de obediência, não haverá mortificação autêntica de qualquer pecado que nos assedie”.[47] Poderemos achar que um determinado hábito “não é assim tão mau”, mas se continuamente cedermos a esse hábito, enfraqueceremos a nossa vontade contra os assaltos da tentação vindos doutras direções. É por isso que se torna tão importante que formemos hábitos de autodomínio sobre os nossos apetites físicos. Podemos pensar que não é assim tão mau ceder a esses apetites, mas essa atitude enfraquece a vontade em todos os outros aspectos da nossa vida.

Finalmente, não fique desanimado com o fracasso. Há uma grande diferença entre falhar e tornar-se um fracassado. Tornamonos fracassados quando desistimos — quando deixamos de tentar. Mas enquanto estivermos trabalhando no sentido de vencer esses hábitos pecaminosos, independentemente do número de vezes em

que falhemos, não nos tornaremos fracassados e poderemos esperar ver progresso.

É inútil guardarmos a mente e as emoções contra aquilo que vem de fora, se ao mesmo tempo não combatermos hábitos de pecado que estão dentro de nós. A batalha pela santidade precisa ser travada em duas frentes — fora e dentro. Só então veremos progresso em direção à santidade.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 15 - Santidade e fé$t$, 17,
$conteudo$Pela fé Abraão, quando chamado, obedeceu e dirigiu-se a um lugar que mais tarde receberia como herança, embora não soubesse para onde estava indo.

H 11.8

Na busca de santidade, os cristãos são muitas vezes chamados a realizar tarefas que parecem insensatas, mesmo absurdas, num mundo incrédulo. Um lavrador cristão, em Kansas (EUA), frisa bem este caso. Quando o trigo está exatamente no ponto de ser colhido é importante que o trabalho se faça depressa para que o mau tempo não venha prejudicar a colheita ou reduzir a sua qualidade. Por esse motivo, a colheita é muitas vezes feita num regime de sete dias por semana. Esse lavrador em quem estamos pensando, no entanto, convicto de que o domingo devia ser respeitado como Dia do Senhor, nunca trabalhava na colheita do domingo, mesmo quando estava iminente uma tempestade. Para os seus vizinhos lavradores, esta atitude parecia estranha e insensata. É interessante notar, todavia, que, ao longo dos anos, esse lavrador cristão foi sempre o mais próspero da sua região. Como Abraão, ele obedeceu pela fé àquilo que acreditava ser a vontade de Deus, embora tal obediência fosse, sem dúvida, difícil em certas ocasiões. [48]

Não obstante pensarmos muitas vezes na santidade num sentido mais restrito de separação da impureza e do mal moral, no seu sentido mais amplo santidade é obediência à vontade de Deus em tudo o que ele manda. É dizer como Jesus: “Aqui estou… vim para fazer a tua vontade, ó Deus” (Hebreus 10.7). Ninguém pode buscar santidade se não está preparado para obedecer a Deus em cada setor da sua vida. A santidade descrita na Bíblia chama-nos a

fazer mais do que simplesmente separarmo-nos da poluição moral do mundo que nos rodeia. Chama-nos a obedecer a Deus, mesmo quando essa obediência é difícil, quando requer deliberado sacrifício e mesmo exposição ao perigo.

Durante o meu serviço na Marinha, fui um dia encarregado duma operação onde ocorreu um acidente em que se perdeu um valioso barco e uma dezena ou mais de vidas ficaram em perigo. Foi uma situação que podia ter prejudicado seriamente o meu futuro serviço na Marinha. Embora a causa do acidente fosse uma avaria mecânica, também era verdade que nós não estávamos conduzindo a operação exatamente de acordo com as regras. Durante a investigação que se seguiu, a tentação de me proteger, encobrindo esse fato, foi extremamente forte, mas eu sabia que tinha de ser totalmente verdadeiro e confiar em Deus quanto às consequências. Deus abençoou essa obediência — a investigação concentrou-se totalmente na avaria mecânica e a minha carreira não foi prejudicada.

A obediência à vontade revelada de Deus é muitas vezes um passo tão importante de fé, como a afirmação duma promessa de Deus. De fato, um dos pensamentos mais intrigantes do livro de Hebreus é a maneira como o autor parece usar a obediência e a fé, alternadamente. Por exemplo, ele fala de homens do Antigo Testamento que nunca entraram no repouso de Deus por terem desobedecido (3.18). Contudo, eles não puderam entrar por causa da sua incredulidade (3.19). Essa permuta de incredulidade e desobediência ocorre noutro ponto do livro (4.2, 6).

Os heróis da fé descritos em Hebreus 11 foram apresentados como “ainda vivendo pela fé quando morreram” (v. 13, NIV), mas neste capítulo vemos que o elemento da obediência — a resposta à vontade de Deus — era tão importante nas suas vidas, como a reivindicação das promessas de Deus. O ponto importante, contudo, é que eles obedeceram pela fé. E uma vez que a obediência é o caminho para a santidade — uma vida santa é essencialmente uma vida obediente — podemos dizer que ninguém se tornará santo a não ser por uma vida de fé.

A fé não é só necessária para a salvação, é também necessária para viver uma vida que agrade a Deus. A fé permite-nos reivindicar as promessas de Deus — mas também nos habilita a obedecer às ordens de Deus. A fé dá-nos a capacidade de obedecer quando a obediência é difícil ou parece irracional para a mente natural.

Diversas ilustrações de Hebreus 11, o grande capítulo da “fé”, salientam essa verdade. Por exemplo, pela fé Abel ofereceu a Deus maior sacrifício que Caim, e por isso recebeu a aprovação de Deus (v. 4). Podemos assumir que Deus revelou a Caim e Abel o dever de oferecerem sacrifícios e a maneira aceitável de cumprir tal dever. Torna-se claro pelo restante das Escrituras que a forma agradável a Deus era por meio do sacrifício de um cordeiro — através do derramamento de sangue. Ora, pela fé, Abel acreditou no que Deus disse. Respeitou a sua palavra e obedeceu, embora é provável que nem entendesse a razão porque o sacrifício do cordeiro era o único sacrifício aceitável. Por outro lado, Caim não acreditou na revelação de Deus em relação ao sacrifício aceitável — talvez por não lhe parecer razoável — portanto, não obedeceu; assim, não obteve a bênção de Deus.

Os valores do mundo circundam-nos. A fama, a fortuna e a felicidade presente são consideradas os alvos mais desejáveis na vida. Todavia, a Bíblia contradiz redondamente o valor de tais alvos: “Quem quiser tornar-se importante entre vocês deverá ser servo, e quem quiser ser o primeiro deverá ser escravo” (Mateus 20.26-27). Os ricos não devem pôr “sua esperança na incerteza da riqueza”, mas são exortados a que “sejam ricos em boas obras, generosos e prontos a repartir” (1 Timóteo 6.17-18). É preciso fé para seguir tais valores bíblicos, quando a sociedade que nos rodeia busca alvos totalmente opostos. Essa fé concentra-se em crer que Deus, em última análise, sustenta e abençoa os que lhe obedecem e confiam nele quanto às consequências da obediência.

A vida de Noé é um exemplo desse tipo de fé: “Pela fé Noé, quando avisado a respeito de coisas que ainda não se viam, movido por santo temor, construiu uma arca para salvar sua família. Por meio da fé ele condenou o mundo e tornou-se herdeiro da justiça

que é segundo a fé” (Hebreus 11.7). A revelação de Deus a Noé em relação ao juízo iminente sobre o mundo era, acima de tudo, um aviso. Pela fé, Noé acreditou nesse aviso. Ele teve a convicção das coisas que ainda se não viam, baseado unicamente na Palavra de Deus, revelada. Noé teve também a confiança de que o caminho da salvação desse juízo iminente era pelo meio apontado por Deus — a arca. Ele respondeu a essa promessa e, desse modo, salvou a si mesmo e à sua família.

A construção da arca por Noé bem pode ser considerado um dos maiores exemplos que o mundo jamais presenciou de perseverança num dever difícil de obediência. Durante cento e quarenta anos, ele trabalhou, porque deu atenção ao aviso do Senhor e acreditou na promessa de Deus.

A vida de Abraão ilustra também o elemento de obediência na fé. A chamada de Abraão consistiu em duas partes — uma ordem e uma promessa. A ordem era de deixar a casa do pai e seguir para uma terra que o Senhor lhe mostraria. A promessa era que Deus faria dele uma grande nação, e que, através dele, abençoaria todas as famílias da terra. Abraão acreditou na ordem e na promessa vindas de Deus, portanto obedeceu à ordem e esperou o cumprimento da promessa. A Bíblia diz a respeito dele: “Pela fé Abraão… obedeceu” (Hebreus 11.8).

A Bíblia relata a história da fé e obediência de Abraão duma maneira tão natural, que facilmente nos pode passar despercebida a dificuldade da sua obediência e a fé que ela exigia. John Brown compara o caso de Abraão a “uma pessoa, antes da descoberta da América, que deixa as costas da Europa e se entrega com a sua família à mercê das ondas, em consequência duma ordem de Deus e duma promessa de que deveria seguir para um país onde se tornasse o fundador duma grande nação e fonte de bênção para muitas nações”.[49]

O caminho da obediência na busca de santidade é muitas vezes contrário à razão humana. Se não tivermos a convicção da necessidade de obedecer à vontade de Deus revelada, bem como confiança nas promessas de Deus, nunca persistiremos nesta busca difícil. Temos de estar convictos de que é da vontade de Deus que

busquemos santidade — independentemente de quão árdua e penosa possa ser essa busca. E precisamos estar confiantes que a busca de santidade resulta na aprovação e bênção de Deus, mesmo quando as circunstâncias dão a impressão do contrário.

Muitas vezes, na nossa vida, um ato específico de obediência exigirá convicção e confiança. Os mandamentos de Deus a Israel para guardarem o ano sabático era um desses casos. Deus ordenou que de sete em sete anos a terra tivesse um ano de descanso para o Senhor, durante o qual se não fizesse qualquer sementeira ou poda (Levítico 25.3-4). Juntamente com essa ordem, o Senhor prometeu que abençoaria as colheitas do sexto ano, de modo que tivessem o suficiente para comer até receberem as colheitas do oitavo ano (Levítico 25.20-26). Só na medida em que os israelitas tivessem confiança na promessa de Deus é que ousariam obedecer à sua ordem. Infelizmente, o relato do Antigo Testamento parece indicar que eles nem tinham confiança na promessa de Deus nem a convicção de que a sua vontade revelada sobre tal assunto era importante para a sua prosperidade nacional e espiritual.

Uma aplicação do Novo Testamento deste mesmo princípio espiritual encontra-se nas palavras de Jesus: “Busquem, pois, em primeiro lugar o Reino de Deus e a sua justiça, e todas essas coisas lhes serão acrescentadas” (Mateus 6.33). A ordem é buscar primeiro o Reino de Deus. A promessa é que, fazendo isso, Deus satisfará as nossas necessidades temporais. Como somos muito tímidos em relação à promessa de Deus, achamos difícil obedecer à sua ordem. Como resultado, damos muitas vezes às questões desta vida prioridade máxima nas nossas decisões básicas.

Jeroboão, o primeiro rei do Reino do Norte de Israel, ilustra também como a falta de fé leva à desobediência. Deus prometeu: “Se você fizer tudo o que eu lhe ordenar e andar nos meus caminhos e fizer o que eu aprovo, obedecendo aos meus decretos e aos meus mandamentos, como fez o meu servo Davi, estarei com você. Edificarei para você uma dinastia tão permanente quanto a que edifiquei para Davi, e darei Israel a você” (1 Reis 11.38).

Será que Jeroboão creu em Deus e lhe obedeceu? Lemos que tal não aconteceu:

Jeroboão pensou: “O reino agora provavelmente voltará

para a dinastia de Davi. Se este povo subir a Jerusalém

para oferecer sacrifícios no templo do S,

novamente dedicarão sua lealdade ao senhor deles,

Roboão, rei de Judá. Eles vão me matar e vão voltar

para o rei Roboão”. Depois de aconselhar-se, o rei fez

dois bezerros de ouro e disse ao povo: “Vocês já

subiram muito a Jerusalém. Aqui estão os seus deuses,

ó Israel, que tiraram vocês do Egito” (1 Reis 12.26-28).

Podemos muito bem pensar que Jeroboão nem sequer ouviu a ordem e promessa de Deus, tão flagrante foi o desrespeito que revelou por elas. Ele, sem dúvida, ouviu-as, mas a mensagem que ouviu não tinha qualquer valor para si, porque não estava combinada com a fé (Hebreus 4.2). Antes, porém, de condenarmos Jeroboão, consideremos o que se passa na nossa própria vida. Quantas vezes nós deixamos de obedecer à vontade de Deus, claramente revelada, por não exercermos a fé?

Porque não cremos que a humildade seja o caminho de Deus para a exaltação (1 Pedro 5.6), lutamos por conseguir um lugar de posição e poder nas nossas relações uns com os outros. Porque não cremos que Deus toma nota e vingará um dia todo o mal que nos fizeram (Romanos 12.19), estudamos na nossa mente a maneira de podermos “vingar-nos” de alguém que pensamos ter-nos prejudicado. Por não estarmos convencidos do engano do pecado (Hebreus 3.13) divertimo-nos com ele, pensando que, desse modo, encontraremos satisfação. Por não termos uma convicção firme de que “sem santidade ninguém verá o Senhor” (Hebreus 12.14), não buscamos seriamente a santidade como uma prioridade na nossa vida.

A fé e a santidade estão intimamente ligadas. A obediência às ordens de Deus envolve geralmente a fé nas promessas de Deus. Uma definição de fé pode ser “obedecer à vontade revelada de Deus e confiar nele quanto aos resultados”.

“Sem fé é impossível agradar a Deus” (Hebreus 11.6). Se quisermos realmente buscar santidade, precisamos ter fé suficiente

para obedecer à vontade de Deus revelada nas Escrituras, e fé para acreditar que as promessas de Deus serão então nossas.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 16 - Santidade num mundo ímpio$t$, 18,
$conteudo$Não rogo que os tire do mundo, mas que os protejas do Maligno.

J 17.15

Todos os crentes devem viver a sua vida cristã no contexto de um mundo ímpio. Alguns enfrentam tentações tremendas, quando vivem no meio duma atmosfera abertamente pecaminosa. O estudante no dormitório da universidade, o homem ou mulher numa base militar, ou a bordo dum navio, precisa muitas vezes viver num ambiente poluído com sensualidade, dissolução e lascívia. O homem ou mulher de negócios está muitas vezes sujeito a tremendas pressões para comprometer os padrões éticos e legais, com vista a satisfazer a avareza e desonestidade doutros sócios. A não ser que o cristão esteja preparado para tais assaltos do mal à sua mente e coração, terá grande dificuldade em manter sua santidade pessoal.

Tiago disse que parte da verdadeira religião consiste em “não se deixar corromper pelo mundo” (Tiago 1.27), e Paulo exortou-nos: “saiam do meio deles e separem-se” (2 Coríntios 6.17). Como o crente deve responder quando se encontra rodeado pelas incessantes pressões dum mundo pecaminoso?

Vemos claramente na oração do Senhor que ele não pretende nos retirar do contato com o mundo de não cristãos (João 17.15). Pelo contrário, ele disse que devemos ser “sal da terra” e “luz do mundo” (Mateus 5.13-14). Os autores do Novo Testamento partem do princípio que os cristãos viveriam no meio dum mundo ímpio (veja passagens como 1 Coríntios 5.9-10; Filipenses 2.14-15; 1 Pedro 2.12 e 3.15-16). E a Bíblia nunca nos diz que será fácil viver num ambiente ímpio. Pelo contrário, avisa-nos que devemos

esperar o ridículo e as ofensas (1 Pedro 4.3-4; 2 Timóteo 3.12; João 15.19).

Em vez de nos retirar do contato com o mundo, devemos procurar resistir à sua influência. Para isso, precisamos, em primeiro lugar, resolver viver de acordo com as convicções que Deus nos tem dado pela sua Palavra. Não podemos ser como o Sr. Loquaz do livro O Progresso do Peregrino, que se orgulhava de se adaptar a qualquer tipo de companhia e a qualquer tipo de conversa. Ele era como um camaleão que muda de cor, sempre que muda de ambiente. Alguns de nós conhecemos pessoas que empregam dois tipos de vocabulário — um entre os cristãos e outro entre os colegas do mundo.

As convicções que desenvolvemos sobre a vontade de Deus para uma vida santa devem ser suficientemente sólidas para aguentarem o ridículo dos ímpios e as pressões que põem sobre nós para que nos identifiquemos com os seus caminhos perversos. Lembro-me ainda das provocações dos meus colegas oficiais a bordo do navio, que me ridicularizavam impiedosamente sobre um grande quadro obsceno que tinham colocado em lugar de destaque, no refeitório dos oficiais.

Um bom reforço para vivermos de acordo com as nossas convicções é o de nos identificarmos abertamente com Cristo, onde quer que nos encontremos. Isso deve ser feito de forma delicada, mas definida. Quando ia a bordo dum novo barco, procurava identificar-me como cristão pelo simples e silencioso fato de levar comigo a Bíblia, sem qualquer acanhamento, quando saía “em liberdade”. Um estudante em um dormitório numa universidade pode fazer o mesmo, pondo a sua Bíblia onde possa ser vista por todos os que entram no quarto. Essa identificação franca com Cristo contribui para nos poupar da tentação de nos ajustarmos ao ambiente pecaminoso, como aconteceu com o Sr. Loquaz.

No entanto, embora resolvamos viver no mundo em harmonia com as convicções que Deus nos tem dado pela sua Palavra, e abertamente nos identifiquemos com Cristo, mesmo assim continuamos muitas vezes sujeitos à poluição dum ambiente ímpio. Os quadros impudicos por toda a parte, as anedotas obscenas em

nossa presença, e a interminável descrição e vaidade de atividades imorais por parte dos que as praticam, tudo contribui para puxar as nossas mentes para a corrupção deste mundo. A essa lista poderíamos acrescentar as medidas desonestas tomadas por sócios num negócio, a constante maledicência dos nossos vizinhos e companheiros de trabalho, e as mentiras e meias verdades que ouvimos à nossa volta.

A Bíblia é a nossa melhor defesa contra essa poluição. Davi disse: “Como o jovem guardará puro o seu caminho? Vivendo de acordo com a tua palavra” (Salmos 119.9, A21). A Bíblia purificará a nossa mente da poluição do mundo, se meditarmos nos seus ensinos. Servirá também como exortação contínua para que não sucumbamos às frequentes tentações no sentido de tolerarmos que os nossos olhos e pensamentos partilhem da imoralidade que nos rodeia. Conheço um indivíduo que frequentou uma universidade ímpia e humanista. Para guardar a sua mente das influências corruptas desse ambiente, resolveu passar todo o tempo possível com a Palavra de Deus, como fazia nos seus estudos. Hoje, esse senhor é um líder missionário que tem tido um impacto profundo em centenas de vidas. Passagens das Escrituras tais como: “O Sheol e a Destruição são insaciáveis, como insaciáveis são os olhos do homem” (Provérbios 27.20) e “Não haja obscenidade, nem conversas tolas, nem gracejos imorais, que são inconvenientes, mas, ao invés disso, ações de graças” (Efésios 5.4) são versículos que podemos memorizar, e neles meditar, quando nos encontramos em ambientes corruptos.

A nossa reação ao mundo pecaminoso que nos rodeia deve, contudo, ser mais do que simplesmente defensiva. Precisamos nos preocupar não somente com a nossa pureza de mente e coração, mas também com o destino eterno daqueles que desejam poluirnos. Deus deixou-nos no mundo para sermos sal e luz (Mateus 5.13-14). O uso do sal como uma metáfora para descrever a nossa relação com o mundo ensina-nos que os cristãos devem constituir um poder preservativo, um antisséptico, um agente que impeça e retarde a decomposição. O Dr. William Hendriksen diz: “O sal… combate a deterioração. De forma semelhante, os cristãos, mostrando ser cristãos verdadeiros, estão constantemente

combatendo a corrupção moral e espiritual… É certamente notório que o mundo é ímpio. Todavia, só Deus sabe quão mais corrupto seria ele sem o exemplo, a vida e as orações dos santos”.[50]

Como “luz do mundo” nós somos os portadores das boas novas de salvação. O próprio Jesus é a verdadeira luz e, como se disse a respeito de João Batista, nós devemos também ser “como testemunha, para testificar acerca da luz” (João 1.7-9). Um cristão que dá testemunho num espírito de genuína preocupação pelos outros não será facilmente corrompido pela imoralidade dessa pessoa. E, através dum interesse generoso e carinhoso, talvez consiga ganhar essa pessoa para o Salvador.

Não precisamos necessariamente denunciar os pecados dos nossos colegas mundanos para agirmos como sal da terra, ou brilharmos como luz do mundo. A nossa própria vida santa servirá como suficiente repreensão, e a razão do nosso interesse pelos outros nesse ponto não é tanto a sua conduta, mas a sua necessidade de Jesus Cristo como seu Salvador. Henry Clay Trumbull foi, entre outras coisas, um grande evangelista pessoal. Um dia, encontrou-se sentado num comboio ao pé dum jovem que estava a beber bastante. Cada vez que o rapaz abria a garrafa, oferecia-a ao Sr. Trumbull que recusava, com uma palavra de agradecimento. Finalmente, o jovem disse ao Sr. Trumbull: “Deve pensar que eu sou um indivíduo muito grosseiro”. A resposta amável do Sr. Trumbull, “Acho que é um jovem com um coração muito generoso”, abriu o caminho para uma boa conversa entre os dois sobre a necessidade de compromisso com Cristo.[51]

Depois de Jesus ter chamado Mateus, o cobrador de impostos, para o seguir, e quando se encontrava comendo na casa dele com diversos dos seus amigos, os fariseus queixaram-se aos discípulos de Jesus: “Por que vocês comem e bebem com publicanos e ‘pecadores’?”. Jesus lhes respondeu: “Não são os que têm saúde que precisam de médico, mas sim os doentes. Eu não vim chamar justos, mas pecadores ao arrependimento” (Lucas 5.30- 32). Certamente é isso mesmo que Deus quer que façamos quando brilhamos como luzes no mundo.

Finalmente, a despeito de todas as sugestões deste capítulo, pode haver uma ocasião em que o ambiente corrupto se torne intolerável; onde nós, como Ló, nos sintamos atormentados pelas obras ímpias que vemos e ouvimos (2 Pedro 2.7-8; Gênesis 19). Tal situação pode ocorrer, por exemplo, num dormitório misto onde pares não casados vivem em aberta imoralidade, ou numa situação de negócio onde existe uma pressão constante para transgredir a lei ou comprometer os princípios cristãos. Nestas circunstâncias, devemos considerar em oração a necessidade de sair dessa situação de impiedade (eu reconheço que isso pode não ser humanamente possível numa situação militar, mas podemos recorrer à oração, pois para Deus todas as coisas são possíveis).

Manter uma santidade pessoal num mundo perverso é, sem dúvida, difícil. As sugestões anteriores não pretendem fazer parecer fácil este problema, mas sim dar alguma ajuda prática para um problema difícil. Acima de tudo, devemos olhar para Jesus que, embora comesse com publicanos e pecadores, era “santo, inculpável, puro, separado dos pecadores, exaltado acima dos céus” (Hebreus 7.26). E devemos nos agarrar à sua promessa que “não sobreveio a vocês tentação que não fosse comum aos homens. E Deus é fiel; ele não permitirá que vocês sejam tentados além do que podem suportar. Mas, quando forem tentados, ele mesmo lhes providenciará um escape, para que o possam suportar” (1 Coríntios 10. 13).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 17 - A alegria da santidade$t$, 19,
$conteudo$Pois o Reino de Deus não é comida nem bebida, mas justiça, paz e alegria no

Espírito Santo.

R 14.17

Deus pretende que a vida cristã seja uma vida de alegria — não de tédio. A ideia de que a santidade anda associada a uma disposição sombria é uma caricatura do pior tipo. De fato, acontece exatamente o contrário. Só aqueles que andam em santidade experimentam verdadeira alegria.

Jesus disse: “Se vocês obedecerem aos meus mandamentos, permanecerão no meu amor, assim como tenho obedecido aos mandamentos de meu Pai e em seu amor permaneço. Tenho lhes dito estas palavras para que a minha alegria esteja em vocês e a alegria de vocês seja completa” (João.15.10-11). Nesta afirmação, Jesus liga obediência com alegria, numa relação de causa e efeito; isto é, a alegria resulta da obediência. Só os que são obedientes — os que buscam a santidade como um estilo de vida — conhecerão a alegria que vem de Deus.

De que maneira a santidade produz alegria? Por um lado há a alegria da comunhão com Deus. Davi disse: “Na tua presença há plenitude de alegria; à tua direita há eterno prazer” (Salmo 16.11, A21). A verdadeira alegria só vem de Deus e ele partilha dessa alegria com os que andam em comunhão com ele. Quando Davi cometeu os terríveis pecados de adultério e assassinato, perdeu o seu senso da alegria de Deus, por ter perdido a comunhão com Deus. Depois disso, na sua oração de penitência, pediu a Deus: “Restitui-me a alegria da tua salvação” (Salmo 51.12, A21). Uma vida de desobediência não pode ser uma vida de alegria.

A experiência diária do amor de Cristo está ligada à nossa obediência a ele. Isto não significa que o seu amor seja condicionado pela nossa obediência. Isso seria legalismo. Mas a nossa experiência do seu amor depende da nossa obediência.

O Dr. William Hendriksen observou que o amor de Deus precede e segue a nossa obediência. O amor de Deus, diz ele, “ao preceder o nosso amor… cria em nós um desejo ardente de guardar os preceitos de Cristo; depois, ao seguir nosso amor, ele nos recompensa por guardá-los!”.[52]

Outra causa de alegria é saber que estou obedecendo a Deus — que já não estou resistindo-lhe em alguma área específica da minha vida. Essa alegria torna-se particularmente evidente quando, após uma longa luta entre o Espírito e a nossa natureza pecaminosa, resolvemos final e radicalmente, pela sua graça, o problema dum pecado que nos assediava e nos dominava. Podemos chamar-lhe a alegria da vitória; eu prefiro chamar-lhe a alegria da obediência.

Além da alegria da comunhão com o Deus Santo, uma vida santa produz também a alegria da recompensa antecipada. O autor de Hebreus disse: “Portanto, também nós, uma vez que estamos rodeados por tão grande nuvem de testemunhas, livremo-nos de tudo o que nos atrapalha e do pecado que nos envolve, e corramos com perseverança a corrida que nos é proposta, tendo os olhos fitos em Jesus, autor e consumador da nossa fé. Ele, pela alegria que lhe fora proposta, suportou a cruz, desprezando a vergonha, e assentou-se à direita do trono de Deus” (Hebreus 12.1-2). Jesus foi motivado a suportar todas as coisas pela antecipação do gozo da recompensa. Por maior que fosse a tribulação e a luta, elas não puderam privá-lo dessa antecipação.

Na parábola dos talentos, o senhor disse aos dois servos que investiram os seus: “Muito bem, servo bom e fiel… Venha e participe da alegria do seu senhor!” (Mateus 25.21,23). Um dos “talentos” que Deus tem dado a cada cristão é a possibilidade de andar em santidade, ser livre do domínio do pecado. Também nós podemos ansiar por entrar no gozo do Senhor quando andamos em santidade até ao fim da nossa vida.

A alegria não somente resulta duma vida santa, mas há também um sentido em que a alegria ajuda a produzir uma vida santa. Neemias disse aos desanimados exilados que tinham voltado a Jerusalém: “A alegria do S é a vossa força” (Neemias 8.10). O cristão que vive em desobediência vive também privado de alegria e esperança, mas quando começa a entender que Cristo o libertou do reino do pecado, quando começa a ver que está unido àquele que tem todo o poder e autoridade, e que é possível andar em obediência, então começa a ter esperança. E, na medida em que espera em Cristo, começa a ter alegria. Na força desta alegria começa a vencer os pecados que tão facilmente o perturbavam. Descobre então que a alegria duma vida santa satisfaz infinitamente mais que os fugazes prazeres do pecado.

Para experimentar esta alegria temos, contudo, de fazer algumas opções. Temos de escolher abandonar o pecado, não só porque nos derrota, mas porque entristece o coração de Deus. Temos de escolher ter em conta o fato de que morremos para o pecado, estamos livres do seu reino e domínio e podemos realmente agora dizer-lhe não. Temos de escolher aceitar a nossa responsabilidade, disciplinar as nossas vidas para a obediência.

Deus tem providenciado tudo o que precisamos para essa busca de santidade. Ele libertou-nos do reino do pecado e deu-nos o seu Espírito Santo para viver em nós. Ele revelou a sua vontade duma vida santa, na sua Palavra, e opera em nós tanto o querer como o efetuar, segundo a sua boa vontade. Ele tem mandado pastores e mestres para nos exortarem e encorajarem no caminho da santidade; e responde às nossas orações quando clamamos a ele em busca de força contra a tentação.

Sem dúvida que a opção é nossa. Que iremos escolher? Aceitaremos a nossa responsabilidade, disciplinando-nos com vista a viver numa obediência constante à vontade de Deus? Iremos perseverar em face dos frequentes fracassos, resolvendo nunca desistir? Iremos decidir que a santidade pessoal é digna do preço de dizer não às exigências do nosso corpo para satisfazermos os seus apetites?

No prefácio deste livro pensamos no lavrador que, na dependência de Deus, cumpre a sua responsabilidade na cultura. Ele não se senta à espera que Deus faça tudo; em vez disso, trabalha esforçadamente, confiando que Deus fará a sua parte. Se quisermos atingir qualquer medida de santidade, devemos adotar uma atitude semelhante. O Senhor disse claramente: “Sede santos, porque eu sou santo”.

É evidente que ele não nos mandou ser santos sem providenciar os meios para tal. O privilégio de sermos santos é nosso, e a decisão e responsabilidade de sermos santos são nossas. Se fizermos essa decisão, experimentaremos a plenitude de gozo que Cristo prometeu àqueles que vivem em obediência a ele.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Uma nota adicional$t$, 20,
$conteudo$Em Efésios 4.20-24,[53] Paulo insiste que devemos nos despir do velho homem e nos revestir do novo homem. Despir-nos do velho homem é lidar com os padrões de pecado em nossas vidas. Revestir-nos do novo homem é desenvolver traços de caráter semelhantes a Cristo, como amor, compaixão, generosidade e perdão.

A Busca da Santidade lida grandemente com o despir do velho homem — lidar com os pecados em nossas vidas. Existe uma sequência para este livro, cujo foco é o revestir-se do novo homem — o desenvolvimento do caráter cristão. É tão importante nos revestirmos do novo homem como o é o despir-se do velho homem.

Portanto, encorajo você a considerar o livro seguinte, A Prática da Piedade. Ele está disponível em www.editoramonergismo.com.br.$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
