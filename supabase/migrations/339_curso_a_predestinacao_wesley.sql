-- Curso: A Predestinação (John Wesley) — transcrição sem perguntas. Issue #230.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'a-predestinacao-wesley';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, autor, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'a-predestinacao-wesley',
      $titulo$A Predestinação$titulo$,
      $titulo$John Wesley$titulo$,
      $desc$Leitura de A Predestinação, de John Wesley, numa única aula. No sermão 58, sobre Romanos 8.29-30 ("os que dantes conheceu"), John Wesley explica presciência, predestinação, chamado, justificação e glorificação. A aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      '/capas/a-predestinacao-wesley.jpg',
      false,
      0,
      'espiritual',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$A Predestinação$titulo$,
        autor = $titulo$John Wesley$titulo$,
        descricao = $desc$Leitura de A Predestinação, de John Wesley, numa única aula. No sermão 58, sobre Romanos 8.29-30 ("os que dantes conheceu"), John Wesley explica presciência, predestinação, chamado, justificação e glorificação. A aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = '/capas/a-predestinacao-wesley.jpg',
        categoria = 'espiritual',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Predestinação$t$, 1,
$conteudo$INTRODUÇÃO

“Nosso amado irmão Paulo“, diz Pedro, “de acordo com a sabedoria que é dada a ele, tem escrito a vocês; assim também em todas as suas Epístolas, falando nelas dessas coisas; nas quais estão algumas coisas difíceis de serem entendidas, e que eles que são incultos ou inseguros interpretam mal, como fazem também com as outras Escrituras, para a própria destruição deles“. (II Pedro 3:15, 16).

Em meio a essas coisas faladas por Paulo, que são difíceis de serem entendidas, não é improvável que o Apóstolo Pedro situasse o que ele fala sobre este assunto no oitavo e nono capítulos de sua Epistolas aos Romanos. E é certo que não apenas o inculto, mas muitos da maioria dos homens letrados do mundo, e não apenas o 'inseguro', mas muitos que pareceram bem alicerçados nas verdades do Evangelho, têm, por diversos séculos, “interpretado mal“ essas passagens “para a própria destruição deles“.

Nós podemos aceitar que elas sejam “difíceis de serem entendidas“, quando consideramos quanto os homens de um entendimento melhor, aperfeiçoado por todas as vantagens da educação, têm continuamente diferido no julgamento concernente a elas. E da própria consideração, de que existe tão ampla diferença, sobre o assunto, entre os homens de um maior aprendizado, consciência, e piedade; o que alguém poderia imaginar fosse fazer com que todos falassem sobre o assunto, com excessiva cautela e reserva. Mas eu não sei como, justamente o contrário é observado em toda parte do mundo cristão. Nenhum escritor sobre a terra parece mais experiente que esses que escrevem sobre este assunto difícil. Mais do que isto, os mesmos homens que, escrevendo sobre qualquer outro assunto, são notavelmente modestos e humildes, com respeito a este, colocam de lado toda a dúvida sobre si mesmo, e falam de uma cátedra infalível.

Isto é particularmente observável, em quase todos aqueles que afirmam as leis absolutas de Deus. Mas certamente é possível evitar isto: o que quer que seja que propomos, pode ser proposto com moderação, e com deferência àqueles homens bons e sábios que são de opinião contrária; e o preferível, porque tanto tem sido dito já, em todas as partes da questão; tanto volumes têm sido escritos, que é raramente possível afirmar algo que não foi falado antes. Tudo que eu puder oferecer no momento, não aos amantes da contenda, mas aos homens de piedade e simplicidade, são algumas poucas dicas, que, talvez, possa lançar alguma luz no texto acima citado.

Quanto mais freqüentemente e cuidadosamente, eu tenho considerado isto, mais eu estou inclinado a pensar que o Apóstolo não está descrevendo aqui (como muitos têm suposto), uma série de causas e efeitos; (isto não parece ter entrado no seu coração); mas simplesmente mostrar o método como Deus opera; a ordem na qual os diversos ramos da salvação constantemente seguem um ao outro. E isto, eu compreendo, irá trazer esclarecimentos a algum inquiridor sério e imparcial, examinando a obra de Deus, de um lado ao outro; do começo ao fim, ou do fim ao começo.

A PRESCIÊNCIA DE DEUS

Em Primeiro Lugar, vamos olhar adiante em toda a obra de Deus, na salvação do homem; considerando-a, do começo, o primeiro ponto, até terminar na glória. O Primeiro passo é a presciência de Deus. Deus "pré-viu" aqueles em todas as nações; aqueles que iriam crer, desde o começo do mundo até a consumação de todas as coisas. Mas, com o objetivo de lançar uma luz sobre esta questão obscura, dever-se-ia observar que, quando nós falamos da presciência de Deus, nós não falamos de acordo com a natureza das coisas, mas segundo a maneira de homens. Porque, se nós falarmos propriamente, não existe tal coisa como presciência, ou pós-ciência em Deus. Todo o tempo, ou preferivelmente, toda a eternidade (para os filhos dos homens), é o momento presente para Ele; Ele não conhece uma coisa em um ponto de vista, mas do eterno para o eterno. Como todo o tempo, com tudo que existe nele, é o momento presente para Ele, então, Ele vê, de imediato, o que quer que foi ou será até o fim dos tempos.

Mas observe: Nós não devemos pensar que eles existem, porque Ele os conhece. Não: Ele os conhece, porque eles existem. Justamente como (se é permitido a alguém comparar as coisas de homens com as coisas profundas de Deus) eu sei que o sol brilha: Ainda assim, o sol não brilha, porque eu o conheço, mas eu sei disto, porque ele brilha. Meu conhecimento supõe que o sol brilhe. Mas de maneira alguma, causa isto. De igual maneira, Deus sabe que aquele homem peca; porque ele conhece todas as coisas: Ainda assim, nós não pecamos porque ele sabe disto, mas ele sabe disto, porque nós pecamos; e seu conhecimento supõe nosso pecado; mas, de maneira alguma, é a sua causa. Em uma palavra, Deus, olhando para todas as épocas, da criação à consumação, como sendo um momento, e vendo, de imediato, o que está nos corações de todos os filhos dos homens, sabe cada um que crê e que não crê, em todas as eras e nações. Ainda assim, o que ele sabe, quer seja fé ou descrença, não é, de forma alguma, causada por seu conhecimento. Os homens são livres para crerem ou não, como se Ele não soubesse disto, afinal.

De fato, se o homem não fosse livre, ele não seria responsável, quer pelos seus pensamentos, palavras ou ações. Se ele não fosse livre, ele não seria capaz, quer da recompensa ou punição; ele seria incapaz da virtude ou do vício; de ser tanto moralmente bom quanto mal. Se ele não tivesse mais liberdade que o sol, a lua, ou as estrelas, ele não seria mais responsável do que eles. Na suposição de que ele não teria mais liberdade do que eles, as pedras da terra seriam tão capazes da recompensa, ou sujeitas à punição quanto o homem: Um seria tão responsável quanto o outro. Ainda assim, seria tanto um absurdo afirmar a virtude ou o vício dele, quanto afirmar isto à um tronco de árvore.

Mas, prosseguindo: “Aquele que Ele conheceu com antecipação, é quem Ele predestinou ser conforme a imagem de seu Filho”. Este é o Segundo passo (para falar, segundo a maneira dos homens: Porque, em efeito, não existe antes ou depois em Deus): Em outras palavras, Deus decreta, da eternidade para a eternidade, para que todos os que crêem no Filho de seu amor sejam conforme a sua imagem; sejam salvo de todo pecado interior e exterior, na santidade interior e exterior. Assim sendo, é fato claro e inegável que todos os que verdadeiramente crêem no nome do Filho de Deus 'recebem' agora 'a finalidade de sua fé, a salvação de suas almas'; e isto na virtude do imutável, irreversível e irresistível decreto de Deus, - “O que crê deverá ser salvo”; ”O que nao crê, deverá ser condenado”.

O CHAMADO DE DEUS, A JUSTIFICAÇÃO E A GLORIFICAÇÃO.

”Aos quepredestinou, a estes, Ele também chamou”. Este é o Terceiro passo (ainda lembrando que falamos, segundo a maneira de homens). Vamos expressar isto um pouco mais largamente: De acordo com o Seu decreto fixo, de que os que crêem deverão ser salvos, estes a quem Ele previu, como tal, Ele chamou exteriormente e interiormente, exteriormente, através da palavra de Sua graça; e interiormente, através do Seu Espírito. Esta aplicação interior de Sua palavra no coração parece ser o que alguns denominam de 'chamado eficaz'. E ele implica, o chamado dos filhos de Deus; a aceitação deles “no Amado”; a justificação deles “livremente pela sua graça, através da redenção que está em Jesus Cristo”.

“Aos que chamou, a eles Ele justificou“. Este é o Quarto passo. Geralmente se permite que a palavra, 'justificado', seja compreendida em seu sentido especifico; o que significa que Ele os tornou justos ou retos. Ele executou seu decreto, ajustando-os “à imagem de seu Filho“; ou, como falamos usualmente, os santificou.

“Aos que justificou, Ele também glorificou“. Este é o Último passo. Tendo feito deles “parceiros na herança dos santos na luz”, Ele deu a eles “o reino que lhes foi preparado, antes da criação do mundo”. Este é o mandamento, em que “de acordo com a deliberação de Sua vontade“, o plano que Ele estabeleceu da eternidade, Ele salva aqueles a quem ele pré-conheceu; os verdadeiros crentes, em todos os lugares e gerações.

A mesma grande obra de salvação pela fé, de acordo com a presciência e decreto de Deus, pode aparecer, sob uma luz ainda mais clara, se nós a virmos de trás para frente, do fim para o começo.

Suponha, então, que você esteja com “a grande multidão que nenhum homem pode contar, de toda a nação, e língua, e família, e pessoas“; que “louvam ao que está sentado no trono, e junto ao Cordeiro, para sempre e sempre“, você não encontraria um entre eles todos que tivessem entrado na glória, que não fosse testemunha daquela grande verdade, “Sem santidade, homem algum verá ao Senhor“; ninguém daquela companhia incomensurável foi santificado, antes que tivesse sido glorificado. Através da santidade, ele foi preparado para a glória; de acordo com a vontade invariável do Senhor, aquela coroa, adquirida, por meio do sangue de seu Filho, poderá ser dada a ninguém, a não ser àqueles que são nascidos de novo, através de seu Espírito. Ele se torna “o autor da salvação eterna“, apenas “para aqueles que lhe obedecem”; e obedecem a Ele, interior e exteriormente; que são santos no coração, e santos em todos os seus modos de vida.

E, se você pudesse dar uma olhada naqueles que estão agora justificados, você não encontraria um deles que tenha sido santificado, até que tivesse sido chamado. Ele primeiro foi chamado, não apenas com um chamado externo, através da palavra e dos mensageiros de Deus, mas, igualmente, com um chamado interior, através de Seu Espírito, aplicando Sua palavra, capacitando-o a crer no Unigênito Filho de Deus, e testemunhando com seu espírito que ele é um filho de Deus. E foi, através deste mesmo meio que eles todos foram santificados. Foi, através da consciência do amor de Deus, espalhado em seu coração, que cada um deles foi capacitado a amar a Deus. Amando a Deus, ele amou seu próximo, como a si mesmo; e tem o poder de caminhar em todos os seus mandamentos, imaculado. Esta é a regra que admite nenhuma exceção. Deus chama um pecador, por sua iniciativa, ou seja, o justifica, antes de santificar. E, por meio disto, a consciência de Seu favor, Ele opera nele aquela gratidão e afeição de filho, do qual brota todo temperamento bom, e palavra e obra.

E quem são eles que são assim chamados por Deus, a não ser aqueles que Ele antes predestinou, ou decretou, “a serem conforme a imagem de seu Filho?”. Este decreto (ainda falando, segundo a maneira dos homens) precede todo o chamado dos homens. Cada crente foi predestinado, antes que ele tivesse sido chamado. Porque Deus não chama alguém, a não ser “de acordo com a deliberação de Sua vontade“; de acordo o plano de acção que Ele estabeleceu antes da fundação do mundo.

Uma vez mais: Já que todos que são chamados foram predestinados, então, todos a quem Deus tem predestinado, Ele pré-conheceu. Ele conheceu; Ele os viu como crentes, e como tais, os predestinou à salvação, de acordo com seu decreto eterno, “Quem crer será salvo“.

Assim, nós vemos todo o processo da obra de Deus, do fim ao começo. Quem está glorificado? Ninguém, a não ser aqueles que foram antes santificados. Quem está santificado? Ninguém, a não ser quem foi antes justificado. Quem está justificado? Ninguém, a não ser aqueles que foram primeiro predestinados. Que está predestinado? Ninguém, a não ser aqueles a quem Deus pré-conheceu como crentes. Assim, o propósito e palavra de Deus se mantêm inabaláveis, como os pilares dos céus: - “Quem crer será salvo; e quem não crer será condenado“. E, assim, Deus está limpo do sangue de todos os homens; uma vez que, quem quer que pereça, perece por seus próprios atos e façanhas. “Eles não virão comigo“, diz o Salvador de homens; e “não existe salvação em nenhum outro“...E não existe outro caminho; quer para a salvação presente ou eterna. Portanto, o sangue deles está sobre suas próprias cabeças; e Deus ainda está “justificado em dizer“ que ele “deseja que todos os homens sejam salvos, e venham ao conhecimento de Sua verdade“.

CONCLUSÃO!

A soma de tudo isto é: o Altíssimo, Todo sábio, Deus, vê e conhece, da eternidade para a eternidade, tudo que é, foi e será, através de um eterno agora. Com Ele nada é passado ou futuro, mas todas as coisas igualmente presentes. Ele tem, portanto, se falarmos, de acordo com a verdade das coisas, nenhuma presciência; nenhuma pós-ciência. Isto seria nada consistente com as palavras do Apóstolo, “Com Ele, não existe inconstância ou sombra de desvio“; e com o relato que Ele dá de Si mesmo, através do Profeta, “Eu, o Senhor, não mudo“. Ainda assim, quando Ele nos fala, sabendo onde fomos feitos; sabendo a insuficiência de nosso entendimento, Ele se permite descer até a nossa capacidade, e fala de Si mesmo, segundo a maneira de homens. Assim, em condescendência à nossa fraqueza, Ele fala de seu propósito, deliberação, plano, presciência. Não que Deus tenha alguma necessidade de recomendar, de propor, ou de planejar Sua obra antecipadamente. Que esteja muito longe de nós imputarmos isto ao Altíssimo; mensurá-lo por nós mesmos! É meramente em compaixão a nós que Ele fala assim, de si mesmo; como prevendo as coisas no céu ou terra, e como as predestinando ou pré-ordenando. Mas nós podemos imaginar possível que essas expressões devam ser tomadas literalmente? Para alguém que fosse tão grosseiro em suas concepções, Ele não poderia dizer: “Pensas que eu sou tal como tu és? Não, mesmo! Assim como os céus são mais excelentes que a terra, então meus caminhos são mais excelentes que os teus. Eu conheço, decreto, trabalho, de tal maneira, como se não fosse possível a ti compreender: mas para dar a ti algum conhecimento tênue, e luzente dos meus caminhos, eu uso a linguagem dos homens, e me ajusto à tua compreensão neste teu estado pueril de existência“.

O que é isto, então, que nós aprendemos de todo este relato? Trata-se disto e não mais: (1) Deus conhece todos os que crêem; (2)deseja que eles sejam salvos do pecado; (3) com esta finalidade, justificá-los, (4) santificá-los e (5) conduzilos até a glória.

Ó, que os homens possam louvar ao Senhor por esta sua bondade; e que eles possam estar contentes com este claro relato disto, e não se esforcem para atacarem aqueles mistérios que são tão profundos, até mesmo para os anjos sondarem!$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
