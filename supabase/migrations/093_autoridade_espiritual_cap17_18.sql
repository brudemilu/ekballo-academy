-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 17 e 18
-- Idempotente. Localiza o curso pelo slug 'autoridade-espiritual'.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'autoridade-espiritual';
  if v_curso_id is null then
    raise exception 'Curso autoridade-espiritual não encontrado. Aplique a migration 086 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 17 — As autoridades delegadas têm de permanecer sob autoridade
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 17 — As autoridades delegadas têm de permanecer sob autoridade', 17,
$conteudo$"Davi, porém, respondeu a Abisai: Não o mates, pois quem haverá que estenda a mão contra o ungido do Senhor, e fique inocente?... O Senhor me guarde de que eu estenda a mão contra o seu ungido" (1Sm 26.9,11).

Nos tempos do Velho Testamento, Davi foi o segundo a quem Deus fez rei; o primeiro rei, Saul, também foi estabelecido por ele. Davi era a nova autoridade estabelecida por Deus, o novo ungido do Senhor; enquanto Saul era a autoridade rejeitada, aquele cuja unção era coisa do passado, pois o Espírito de Deus já o tinha deixado. Vamos observar como Davi estava sujeito à autoridade, não se esforçando em estabelecer a sua própria autoridade.

ESPERANDO QUE DEUS GARANTISSE A AUTORIDADE

Em En-Gedi, Davi cortou um pedaço do manto de Saul e o seu coração o acusou, porque sua consciência era extremamente sensível. Mais tarde, tomou a lança e o cantil de Saul. Provavelmente pensava que, tirando essas coisas que pertenciam a Saul, daria provas de sua presença. Isto, entretanto, é o modo de agir de um advogado, não de um cristão. Um cristão se preocupa com os sentimentos, não com o raciocínio; lida com fatos, não com evidências. Davi era capaz de se sujeitar à autoridade. Jamais anulou a autoridade de Saul; simplesmente aguardava que Deus garantisse a sua autoridade. Não ajudaria Deus a fazê-lo; pelo contrário, prontamente aguardaria que Deus agisse. Qualquer pessoa, para ser autoridade delegada por Deus, tem de aprender a não tentar estabelecer sua própria autoridade.

AS AUTORIDADES PRECISAM SER ESCOLHIDAS POR DEUS E PELA IGREJA

Depois da morte de Saul, Davi perguntou a Deus a que cidade devia ir. Humanamente falando, Davi com o seu exército deveria descer rapidamente a Jerusalém, pois ali estava o palácio. Mas ele perguntou a Deus, e Deus lhe disse que fosse a Hebrom — apenas uma cidade pequena e sem importância. A ida de Davi para lá provou que ele não estava tentando usurpar a autoridade por sua própria iniciativa. Esperou para ser ungido pelo povo de Deus. Samuel já o tinha ungido porque era o escolhido por Deus. Agora Judá o ungiu, porque era o escolhido do povo. É preciso que haja a escolha da igreja e a escolha de Deus. Ninguém pode se impor aos outros. Davi permaneceu em Hebrom por sete anos, mas não ficou impaciente. Por sua própria natureza, a autoridade não pode promover-se nem impor-se aos outros; deve ser estabelecida por Deus e ungida pelos homens. Todos aqueles que conhecem a Deus podem esperar.

NENHUMA AUTORIDADE DIANTE DE DEUS

Quando Davi dançou diante da arca, Mical, sua esposa, viu-o e desprezou-o em seu coração. Mical achava que, sendo rei, ele deveria manter sua dignidade, exatamente como seu pai Saul fizera. Davi entendia a coisa de maneira diferente: na presença de Deus não tinha autoridade nenhuma, pois era vil e desprezível. O resultado foi que Deus aceitou Davi, mas julgou Mical, fechando o seu ventre. Qualquer um que representa autoridade deveria ser manso e humilde diante de Deus e do seu povo. Não deveria procurar manter a sua própria autoridade entre os homens. Embora Davi fosse o rei sobre o trono, diante da arca de Deus era igual ao seu povo. Embora alguns sejam escolhidos para ficar em posição de autoridade na igreja, todos são iguais diante de Deus. Eis aí a base e o segredo da autoridade.

SEM CONSCIÊNCIA DE AUTORIDADE

Antes de se tornar rei, Davi foi um poderoso guerreiro; ninguém podia enfrentá-lo. Agora que era rei, assentou-se humildemente sobre o chão diante do Senhor. Continuou sendo um homem humilde. Sair é falar e agir em nome de Deus com autoridade, mas entrar é prostrar-se aos pés do Senhor, reconhecendo sua própria indignidade. Qualquer um que pensa e sente que é uma autoridade não é digno dessa autoridade. Quanto mais autoridade alguém possui, menos consciência tem dela. Aquele que representa a autoridade de Deus deve ter em si esta bendita tolice: ter autoridade, mas não ter consciência de ser uma autoridade.

A AUTORIDADE NÃO PRECISA SER AUTOMANTIDA

A rebelião de Absalão foi dupla: como filho rebelou-se contra o seu pai, e como cidadão revoltou-se contra o seu soberano. Quando Davi fugiu da cidade, tinha terrível necessidade de seguidores. Mesmo assim pôde dizer a Itai: "Volta, e fica-te com quem vier a ser o rei." Mesmo em seu desespero não queria levar homens consigo. Então os sacerdotes vieram com a arca. Se a arca fosse com Davi, muitos o teriam seguido. Mas Davi elevou-se acima de sua aflição: "Se achar eu graça aos olhos do Senhor, ele me fará voltar... Se, porém, disser: Não tenho prazer em ti; eis-me aqui, faça de mim como melhor lhe parecer." Sua atitude foi de absoluta sujeição sob a poderosa mão de Deus. Deus é que decide se uma pessoa é rei ou não; não depende das multidões de seguidores, nem mesmo da presença da arca.

A AUTORIDADE SUPORTA A PROVOCAÇÃO

Pelo caminho, apareceu Simei, que amaldiçoava Davi sem parar e atirava pedras nele, acusando-o falsamente. Não obstante, Davi nem argumentou nem procurou vingar-se ou resistir. Tinha poder para matar aquele homem, mas impediu seus soldados, dizendo: "Deixai-o, que amaldiçoe, pois o Senhor lhe ordenou." Que homem quebrantado e manso era Davi! O homem de autoridade que Deus estabelece é capaz de suportar provocação. Se a autoridade que você possui é incapaz de ofender-se, você está qualificado para ficar em autoridade. Não imagine que você pode exercer autoridade livremente porque foi escolhido por Deus. Só os obedientes têm capacidade para ficar em autoridade.

APRENDA A HUMILHAR-SE SOB A PODEROSA MÃO DE DEUS

Davi não retornou ao palácio imediatamente após a morte de Absalão, porque Absalão também já fora ungido rei pelo povo. Portanto Davi tinha de aguardar que todo o seu povo lhe pedisse para voltar. É verdade que Davi foi originalmente estabelecido por Deus; não obstante, quando surgiram as provações, ele aprendeu a humilhar-se sob a poderosa mão de Deus. Não se sentia ansioso, nem lutou por si mesmo. Todas as suas batalhas foram pelo povo de Deus. Que ninguém se defenda nem fale por si mesmo. Aquele que sabe como obedecer melhor é aquele que é melhor qualificado para ficar em posição de autoridade. Quanto mais alguém se prostra diante de Deus, mais depressa o Senhor o vinga.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Davi esperou sete anos em Hebrom, sem forçar a própria coroação, porque "a autoridade deve ser estabelecida por Deus e ungida pelos homens". Há algo legítimo que você tem tentado forçar em vez de esperar a confirmação de Deus e do seu povo?', 'reflexao', null),
    (v_aula_id, 2, 'Diante das pedras e maldições de Simei, Davi não revidou. Nee diz: "se a autoridade que você possui é incapaz de ofender-se, você está qualificado para ficar em autoridade". Como você reage quando é provocado ou difamado injustamente?', 'reflexao', null),
    (v_aula_id, 3, 'Davi tinha autoridade "mas não tinha consciência de ser uma autoridade". Examine seu coração: você tende a lembrar os outros (e a si mesmo) da posição que ocupa? O que seria entrar "prostrado, reconhecendo sua própria indignidade"?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 18 — A vida diária e a motivação interior das autoridades delegadas
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 18 — A vida diária e a motivação interior das autoridades delegadas', 18,
$conteudo$"Mas entre vós não é assim; pelo contrário, quem quiser tornar-se grande entre vós, será esse o que vos sirva; e quem quiser ser o primeiro entre vós, será servo de todos. Pois o próprio Filho do homem não veio para ser servido, mas para servir e dar a sua vida em resgate por muitos" (Mc 10.43-45).

BEBER O CÁLICE DO SENHOR E SER BATIZADO COM O BATISMO DO SENHOR

Quando esteve sobre a face da terra, nosso Senhor raramente ensinou às pessoas como exercer autoridade. A passagem mais clara está em Marcos 10. Tudo começou com Tiago e João, que desejavam assentar-se um de cada lado do Senhor em sua glória. Tal pedido encerrava dois significados: ficar perto do Senhor e ter mais autoridade. O Senhor não rejeitou o desejo deles, mas respondeu que teriam de beber o seu cálice e ser batizados com o seu batismo antes que pudessem assentar-se à sua direita ou esquerda. Fica evidente que, se os homens não beberem o cálice do Senhor e não receberem o seu batismo, não podem se aproximar dele nem possuir autoridade.

O QUE É O CÁLICE E O BATISMO DO SENHOR

Qual é o significado do cálice do Senhor? No Jardim do Getsêmani, ele orou: "Meu Pai: Se possível, passa de mim este cálice! Todavia, não seja como eu quero, e, sim, como tu queres" (Mt 26.39). O Senhor não se preocupou principalmente com a cruz; estava ocupado, em vez disso, em fazer a vontade de Deus. Sua escolha era a vontade de Deus, não a cruz. Por isso, o beber o cálice significava sua sujeição à enorme autoridade de Deus em obedecer à vontade deste. Muitos são capazes de se relacionar à consagração, ao sofrimento ou ao trabalho, mas devemos manter relacionamento direto só com a vontade de Deus. Algumas pessoas, quando ocupadas no trabalho, se afogam naquilo e não conseguem mais aceitar a vontade de Deus, porque não estão trabalhando por causa da vontade de Deus, mas por amor ao trabalho. Não é o trabalho, nem o sofrimento, nem mesmo a cruz, mas a vontade de Deus!

Qual é, então, o significado do batismo do Senhor? Não se refere ao batismo no rio Jordão, mas aponta para a sua morte na cruz: "Tenho, porém, um batismo com o qual hei de ser batizado, e quanto me angustio até que o mesmo se realize!" (Lc 12.50). A cruz é a libertação da vida, além da expiação pelo pecado. Logo que a vida de Deus é liberada, acende-se como um fogo lançado sobre a terra. Onde há vida, há luta, não paz. Temos de quebrantar o homem exterior para que a vida interior possa fluir. Quando a casca de um homem se quebra, ele se aproxima muito dos outros e a vida pode fluir facilmente. É quando o grão de trigo cai sobre a terra e sua casca se rompe que a vida começa a fluir. O Senhor parecia dizer a Tiago e João: "O batismo que receberei arrebentará minha casca e libertará vida. Vocês estão prontos a serem assim batizados?" Um homem não quebrantado mantém uma grande distância entre si e os outros.

AUTORIDADE NÃO É MANDAR, MAS SERVIR HUMILDEMENTE

O Senhor reuniu seus discípulos e os instruiu sobre as coisas futuras na glória. Disse que, entre os gentios, os homens buscam autoridade a fim de poder governar sobre os outros. Exercer autoridade e governar são desejos dos gentios. Um espírito assim deve ser expulso da igreja. Aqueles a quem o Senhor usa são os que conhecem o cálice do Senhor e o seu batismo. Quando bebemos o cálice e recebemos o batismo, naturalmente teremos autoridade. Aqueles que procuram exercer autoridade não devem ser postos em posições de autoridade, pois Deus jamais concede autoridade a tais pessoas. Mas aquele que sente sua incompetência é aquele a quem Deus concede autoridade. Jamais deveríamos ser como os políticos ocupados na arte da diplomacia. O caminho na casa de Deus deve ser espiritual e não político. Que diferença enorme da autoridade entre os gentios e a igreja! Os primeiros governam por posição, mas a segunda governa pelo ministério da vida espiritual.

PARA SER GRANDE, É PRECISO SER SERVO

A autoridade que Deus designa precisa de antecedentes espirituais: deve beber o cálice (obedecer de maneira absoluta à vontade de Deus) e receber o batismo (aceitar a morte para que a vida seja liberada). Também não deve ter nenhuma intenção de exercer autoridade; pelo contrário, deve estar preparada para servir como servo e escravo de todos. Porque não procura ser autoridade, Deus pode usá-lo como tal. A condição para a autoridade é, consequentemente, um senso de incompetência e indignidade. Da Bíblia podemos concluir que Deus nunca usa uma alma orgulhosa. No momento em que uma pessoa fica orgulhosa, Deus a deixa de lado. Devemos sentir nossa incompetência, porque Deus só usa os inúteis. Embora tenhamos cuidado do rebanho e cultivado o solo, ao voltar ainda nos reconhecemos como servos inúteis.

O Senhor não veio para exercer autoridade; veio para servir. Quanto menos convencida e mais humilde for uma pessoa, mais útil será. Nosso Senhor assumiu a forma de escravo, nascendo em semelhança de homens. Ele jamais estendeu a mão em busca de autoridade, pois recebeu-a de Deus. O Senhor Jesus foi exaltado da humildade para as maiores alturas; este foi o seu princípio de vida. Não vamos estender nossas mãos carnais para agarrar autoridade carnal. Sejamos escravos de todos até que um dia Deus nos confie uma responsabilidade particular. O ministério é a base da autoridade. O ministério vem da ressurreição, o serviço vem do ministério, e a autoridade, do serviço. O caminho para nós é a obediência, não a autoridade; é sermos servos, não cabeças; sermos escravos, não governadores. Deveria sempre haver temor e tremor nesta questão de exercer autoridade.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'O cálice é "manter relacionamento direto só com a vontade de Deus" — não com o trabalho, o sofrimento ou a consagração em si. Você corre o risco de se "afogar no trabalho" a ponto de não conseguir mais aceitar a vontade de Deus? Onde?', 'reflexao', null),
    (v_aula_id, 2, 'O batismo do Senhor fala de quebrantamento: "um homem não quebrantado mantém uma grande distância entre si e os outros". Em que ponto a sua casca exterior ainda impede a vida de Cristo de fluir para as pessoas ao seu redor?', 'reflexao', null),
    (v_aula_id, 3, 'Nee diz que "aqueles que procuram exercer autoridade não devem ser postos em autoridade; Deus a concede a quem sente sua incompetência". Sua motivação ao desejar liderar se parece mais com a dos gentios (governar) ou com a de Cristo (servir)?', 'reflexao', null);
  end if;
end
$migration$;
