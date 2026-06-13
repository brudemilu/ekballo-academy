-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 2 e 3 — Exemplos de rebeldia no Antigo Testamento
-- Localiza o curso pelo slug 'autoridade-espiritual' (migration 086).
-- Idempotente: pode ser reaplicada sem duplicar aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos
  where slug = 'autoridade-espiritual';

  if v_curso_id is null then
    raise exception 'Curso autoridade-espiritual não encontrado. Aplique a migration 086 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 2 — Exemplos de rebeldia no Antigo Testamento  (ordem = 2)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 2 — Exemplos de rebeldia no Antigo Testamento',
      2,
$conteudo$1. A QUEDA DE ADÃO E EVA

"E lhe deu esta ordem: De toda árvore do jardim comerás livremente, mas da árvore do conhecimento do bem e do mal não comerás; porque no dia em que dela comeres, certamente morrerás" (Gn 2.16-17). "Então a serpente disse à mulher: É certo que não morrereis. Porque Deus sabe que no dia em que dele comerdes se vos abrirão os olhos e, como Deus, sereis conhecedores do bem e do mal. Vendo a mulher que a árvore era boa para se comer, agradável aos olhos, e árvore desejável para dar entendimento, tomou-lhe do fruto e comeu, e deu também ao marido, e ele comeu" (Gn 3.5-6). "Porque, como pela desobediência de um só homem muitos se tornaram pecadores" (Rm 5.19).

A QUEDA DO HOMEM DEVIDO À DESOBEDIÊNCIA

Vamos recapitular a história de Adão e Eva conforme registrada em Gênesis, capítulos 2 e 3. Depois que Deus criou Adão, encarregou-o de algumas coisas; entre estas estava a ordem de não comer do fruto da árvore do conhecimento do bem e do mal. O ponto crucial dessa recomendação foi mais do que a proibição de comer certo fruto; antes, significava que Deus estava colocando Adão sob autoridade para que aprendesse a obedecer. De um lado, Deus colocou todas as coisas criadas na terra sob a autoridade de Adão para que ele as dominasse; mas, por outro lado, Deus colocou o próprio Adão debaixo de sua autoridade para que ele pudesse obedecer à autoridade. Só aquele que está debaixo de autoridade pode constituir uma autoridade.

De acordo com a ordem da criação divina, Deus criou Adão antes de criar Eva. Colocou Adão em posição de autoridade e Eva sob a autoridade de Adão. Estabeleceu os dois: um como autoridade e o outro em submissão. Tanto na velha como na nova criação, esta ordem de prioridades constitui a base da autoridade. Todo aquele que for criado primeiro é a autoridade; todo aquele que for salvo primeiro será a autoridade. Portanto, onde quer que vamos, nosso primeiro pensamento deve ser o de descobrir quem são aqueles aos quais Deus quer que nos sujeitemos. Podemos encontrar a autoridade em qualquer lugar e aprender a obedecer à autoridade a qualquer hora.

A queda do homem deve-se à desobediência à autoridade de Deus. Em lugar de obedecer a Adão, Eva tomou sua própria decisão ao verificar se o fruto era bom e agradável à vista. Ela descobriu a cabeça. Ao comer o fruto, não o fez em sujeição, mas de sua própria vontade. Além de transgredir a ordem de Deus, também desobedeceu a Adão. Rebelar-se contra a autoridade representativa de Deus é o mesmo que rebelar-se contra Deus. Ao dar ouvidos a Eva e comer do fruto proibido, Adão pecou contra a vontade direta de Deus; portanto ele também desobedeceu à autoridade de Deus. Isto também foi rebeldia.

TODO TRABALHO DEVE SER PRESTADO EM OBEDIÊNCIA

Eva não foi colocada só sob a autoridade de Deus, mas também, na ordem divina, sob a autoridade de Adão. Ela tinha de obedecer a uma autoridade dupla. E a nossa posição hoje em dia não difere disso. Eva, vendo que o fruto era bom para se comer, comeu-o sem perguntar a quem estava obedecendo. Mas, desde o princípio, Deus ordenara ao homem que obedecesse e que não fizesse a sua própria vontade. A atitude de Eva, entretanto, não foi governada pela obediência; foi iniciativa de sua própria vontade. Ela não se sujeitou à ordem divina, nem obedeceu à autoridade de Deus. Pelo contrário, tomou sua própria decisão. Rebelou-se contra Deus e caiu. Toda atitude que implica desobediência constitui uma queda, e qualquer atitude de desobediência é rebeldia. Conforme a obediência de um homem vai crescendo, suas ações decrescem. Quando começamos a seguir o Senhor ficamos cheios de atividade, mas bastante falhos na obediência. Mas, conforme avançamos em espiritualidade, nossas ações gradualmente diminuem até que ficamos cheios de obediência. Muitos, entretanto, fazem o que gostam e recusam-se a fazer o que não gostam. Jamais meditam sobre se estão agindo em obediência. Por isso muito trabalho passa a ser executado pelo ego e não em obediência a Deus.

CERTO OU ERRADO, ESTÁ NA MÃO DE DEUS

A ação do homem não deve ser governada pelo conhecimento do bem ou do mal; deve ser motivada pelo senso de obediência. O princípio do bem e do mal é viver de acordo com o que é certo ou errado. Antes de Adão e Eva comerem do fruto proibido, o que era certo e errado para eles estava na mão de Deus. Se não vivessem diante de Deus, não saberiam nada, pois o que era certo e errado para eles se encontrava realmente no próprio Deus. Consequentemente, depois da queda, os homens não precisaram mais descobrir em Deus o senso do certo e do errado. Já o tinham neles mesmos. Este foi o resultado da queda. A obra da redenção é levar-nos de volta ao lugar onde encontramos o que é certo ou errado para nós em Deus.

OS CRISTÃOS DEVEM OBEDECER À AUTORIDADE

Não existe nenhuma autoridade que não proceda de Deus; todas as autoridades foram instituídas por ele. Quando procuramos encontrar a fonte de toda autoridade, encontramo-la invariavelmente em Deus. Deus está acima de toda autoridade, e todas as autoridades estão debaixo dele. Quando entramos em contato com a autoridade de Deus, entramos em contato com o próprio Deus. A obra de Deus se efetua basicamente não pelo poder, mas pela autoridade. Ele mantém todas as coisas pela poderosa palavra de sua autoridade, exatamente como as criou pela mesma palavra. Sua palavra de ordem é autoridade. Nós não sabemos como a autoridade de Deus opera; não obstante, sabemos que ele realiza tudo através dela.

O amado servo de um centurião estava doente. O centurião sabia que se encontrava sob autoridade e em autoridade sobre outros. Por isso pediu ao Senhor que apenas dissesse uma palavra, crendo que a cura se efetuaria — pois toda a autoridade não se encontra na mão do Senhor? Ele creu na autoridade do Senhor. Não nos causa admiração que o Senhor elogiasse a sua grande fé: "Em verdade vos afirmo que nem mesmo em Israel achei fé como esta" (Mt 8.10). Entrar em contato com a autoridade de Deus é o mesmo que entrar em contato com Deus. Hoje em dia o universo está cheio de autoridades estabelecidas por Deus. Tudo se encontra sob sua autoridade. Sempre que uma pessoa peca contra a autoridade de Deus, peca contra Deus. Todos os cristãos devem, portanto, aprender a obedecer à autoridade.

A PRIMEIRA LIÇÃO QUE UM OBREIRO TEM DE APRENDER É OBEDIÊNCIA À AUTORIDADE

Estamos sob a autoridade dos homens como também temos homens sob nossa autoridade. Esta é a nossa posição. Até mesmo o Senhor Jesus na terra não só se encontrava sob a autoridade de Deus, mas também sob a autoridade de outros. A autoridade se encontra em toda parte. Há autoridade na escola, há autoridade no lar. O guarda na rua, embora talvez tenha menos instrução que você, foi estabelecido por Deus como autoridade sobre você. Sempre que alguns irmãos em Cristo se reúnem, imediatamente estabelece-se uma ordem espiritual. Um obreiro cristão deveria saber quem está acima dele. Alguns não sabem quais são as autoridades que estão acima deles, por isso não obedecem. Não deveríamos nos preocupar com o certo e o errado, com o bem ou o mal; antes, deveríamos saber quem é a autoridade sobre nós. Quando ficamos sabendo a quem devemos estar sujeitos, naturalmente encontramos nosso lugar no corpo. Quantos cristãos hoje em dia não têm a menor ideia do que seja submissão. É por isso que existe tanta confusão e desordem. Por causa disto, a obediência à autoridade é a primeira lição que um obreiro deveria aprender; e também ocupa um grande lugar no trabalho propriamente dito.

A OBEDIÊNCIA DEVE SER RECUPERADA

Desde a queda de Adão prevalece a desordem no universo. Cada um pensa que é capaz de distinguir o bem do mal e julgar o que é certo e o que é errado. Pensam saber melhor do que Deus. Isto é a loucura da queda. Temos de ser libertos de tal engano, porque nada mais é que rebeldia.

Nosso conceito de obediência é tristemente inadequado. Alguns parecem pensar que sua obediência é perfeita e total quando obedecem ao Senhor no batismo. Muitos jovens estudantes consideram injustiça a ordem divina de obedecer aos professores. Muitas esposas consideram uma crueldade total a ordem divina de ficarem sujeitas a maridos difíceis. Inúmeros cristãos estão vivendo hoje em dia em um estado de rebeldia; não aprenderam nem a primeira lição de obediência.

A sujeição que a Bíblia ensina relaciona-se com a sujeição às autoridades estabelecidas por Deus. Como era superficial a antiga apresentação da obediência! A obediência é um princípio fundamental. Se esta questão da autoridade permanecer sem solução, nada pode ser resolvido. Assim como a fé é o princípio pelo qual obtemos vida, a obediência é o princípio pelo qual a vida é vivida. As divisões e desentendimentos frequentes dentro da igreja brotam da rebeldia. A fim de recuperar a autoridade, a obediência tem de ser primeiramente restaurada. Muitos têm cultivado o hábito de assumir o papel de cabeça, mas nem sequer aprenderam a obedecer. Por isso temos de aprender uma lição. Que a obediência seja a nossa primeira reação. Deus não nos tem privado de nada no que se refere à autoridade. Ele já nos demonstrou como ficar sujeitos a ambas, a autoridade direta e a indireta. Muitos declaram que sabem como obedecer a Deus, mas na realidade nada sabem sobre a obediência à autoridade delegada. Considerando que todas as autoridades vêm de Deus, temos de aprender a obedecer a todas elas. Os problemas que enfrentamos nos dias de hoje devem-se ao fato de viverem os homens fora da autoridade de Deus.

NENHUMA UNIDADE NO CORPO SEM A AUTORIDADE DA CABEÇA

Deus está operando na recuperação da unidade do corpo. Mas para que isto se realize é preciso que primeiro receba a vida da Cabeça, seguida da autoridade da mesma. Sem a vida da Cabeça não pode haver corpo. Sem a autoridade da Cabeça não pode haver unidade do corpo. Para manter a unidade do corpo temos de permitir que a vida da Cabeça governe.

Deus quer que obedeçamos às autoridades delegadas por ele assim como a ele. Todos os membros do corpo deveriam se sujeitar uns aos outros. Quando isto acontece, o corpo é unido em si mesmo e com a Cabeça. Quando a autoridade da Cabeça prevalece, a vontade de Deus se realiza. Assim a igreja se torna o reino de Deus.

ALGUMAS LIÇÕES SOBRE OBEDIÊNCIA

Mais cedo ou mais tarde, aqueles que servem a Deus tomam consciência da autoridade no universo, na sociedade, no lar, na igreja. Como alguém pode servir e obedecer a Deus, se jamais entrou em contato com a autoridade de Deus? Isto é mais do que uma questão de ensino ou doutrina, pois o ensino pode ser abstrato. Alguns acham que é muito difícil saber como obedecer à autoridade, mas se conhecemos a Deus a dificuldade se evapora. Não existe ninguém que possa obedecer à autoridade divina sem que a misericórdia de Deus esteja sobre ele. Vamos, portanto, aprender algumas lições:

• Tenha um espírito de obediência.

• Pratique a obediência. Alguns indivíduos são como os selvagens que simplesmente não conseguem obedecer. Mas aqueles que são educados não se sentem embaraçados onde quer que sejam colocados. Naturalmente vivem a obediência.

• Aprenda a exercer a autoridade concedida. Aquele que trabalha para Deus não só precisa aprender a obedecer à autoridade, mas também deve aprender a exercer a autoridade que lhe foi concedida por Deus na igreja e no lar. Quando você aprende a ficar sob a autoridade de Deus, você não se considera mais nada, mesmo que Deus lhe confie muito.

Alguns só aprendem a obedecer e fracassam no que se refere ao exercício da autoridade quando são enviados a algum lugar a fim de trabalhar. É preciso aprender a ficar sob a autoridade e também em posição de autoridade. A igreja sofre porque muitos não sabem obedecer, mas também é igualmente prejudicada através de alguns que não aprenderam a ficar em posição de autoridade.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'O autor diz que "só aquele que está debaixo de autoridade pode constituir uma autoridade". Antes de exercer qualquer liderança, sob quais autoridades Deus o colocou hoje (no lar, na igreja, no trabalho)? Você as reconhece de verdade?',
     'reflexao', null),
    (v_aula_id, 2,
     'A queda introduziu no homem o desejo de julgar por si mesmo o que é certo e errado. Em que decisões você tem confiado mais no seu próprio senso de "certo ou errado" do que em buscar a vontade de Deus?',
     'reflexao', null),
    (v_aula_id, 3,
     'Nee ensina que "a obediência deve ser a nossa primeira reação". Pense numa ordem ou orientação recente que custou obedecer: qual foi sua primeira reação interna — submissão ou resistência?',
     'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 3 — Exemplos de rebeldia no AT (continuação)  (ordem = 3)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 3 — Exemplos de rebeldia no Antigo Testamento (continuação)',
      3,
$conteudo$2. A REBELDIA DE CÃO

"Sendo Noé lavrador, passou a plantar uma vinha. Bebendo do vinho, embriagou-se, e se pôs nu dentro de sua tenda. Cão, pai de Canaã, vendo a nudez do pai, fê-lo saber, fora, a seus dois irmãos. Então Sem e Jafé tomaram uma capa, puseram-na sobre os próprios ombros de ambos e, andando de costas, rostos desviados, cobriram a nudez do pai, sem que a vissem" (Gn 9.20-23).

FRACASSO NA AUTORIDADE CONCEDIDA É UM TESTE PARA A OBEDIÊNCIA

No Jardim do Éden, Adão fracassou. Na vinha, Noé também foi derrotado, mas por causa de sua justiça Deus salvou a família de Noé. No plano de Deus, Noé era o cabeça da família. Deus colocou toda a família sob a autoridade de Noé; ele também colocou Noé como cabeça do mundo daquele tempo.

Mas um dia Noé se embebedou em sua vinha e descobriu-se em sua tenda. Cão, seu filho mais jovem, viu a nudez de seu pai e comentou o incidente com seus dois irmãos lá fora. No que se refere à conduta de Noé, é claro que estava errado; ele não deveria ter-se embriagado. Mas Cão fracassou não reconhecendo a dignidade da autoridade. O pai é autoridade constituída por Deus no lar, mas a carne se deleita em ver defeitos na autoridade para poder se desembaraçar de todas as restrições. Quando Cão viu a conduta imprópria de seu pai, não teve o menor sentimento de vergonha ou tristeza, nem tentou encobrir a falta de seu pai. Isto revela que tinha um espírito rebelde. Pelo contrário, saiu e contou a seus irmãos, destacando a feiura de seu pai, acrescentando aos seus erros o pecado da injúria. Observe, entretanto, como Sem e Jafé resolveram a situação. Entraram na tenda, de costas — evitando, assim, ver a nudez de seu pai — e cobriram seu pai com a capa que tinham colocado sobre os ombros.

Vê-se, então, que o fracasso de Noé tornou-se uma prova para Sem, Cão, Jafé e Canaã, o filho de Cão. Revelou quem era obediente e quem era rebelde. A queda de Noé descobriu a rebeldia de Cão. Depois que Noé despertou do vinho, profetizou que os descendentes de Cão seriam amaldiçoados e se tornariam escravos dos escravos de seus irmãos. O primeiro escravo na Bíblia foi Cão. Três vezes pronunciou-se a sentença de que Canaã seria escravo. Isto é o mesmo que dizer que aquele que não se sujeita à autoridade vem a ser escravo daquele que obedece à autoridade. Sem seria abençoado: o Senhor Jesus veio através de Sem. Jafé foi destinado a pregar Cristo, e assim as nações que propagam o evangelho hoje em dia pertencem aos descendentes de Jafé. O primeiro a ser amaldiçoado depois do dilúvio foi Cão. Não reconhecendo a autoridade, foi colocado sob a autoridade nas gerações futuras. Todo aquele que deseja servir ao Senhor precisa reconhecer a autoridade. Ninguém pode servir em espírito de transgressão.

3. FOGO ESTRANHO OFERECIDO POR NADABE E ABIÚ

"Nadabe e Abiú, filhos de Arão, tomaram cada um o seu incensário, e puseram neles fogo, e sobre este, incenso, e trouxeram fogo estranho perante a face do Senhor, o que lhes não ordenara. Então saiu fogo de diante do Senhor, e os consumiu; e morreram perante o Senhor" (Lv 10.1-2).

POR QUE NADABE E ABIÚ FORAM CONSUMIDOS

Como a história de Nadabe e Abiú é solene! Serviram como sacerdotes, não porque fossem pessoalmente justos, mas porque pertenciam à família que Deus tinha escolhido. Deus estabeleceu Arão como sacerdote e ele foi ungido. Em todas as questões relacionadas com o culto, Arão era o chefe; seus filhos eram simples ajudantes, servindo no altar em obediência a Arão. Deus jamais teve a intenção de permitir que os filhos de Arão servissem independentemente; ele os colocou sob a autoridade de Arão. Se Arão nada fizesse, seus filhos também nada deveriam fazer. Tudo começou com Arão, não com seus filhos. Se os filhos se aventurassem a oferecer sacrifícios, estariam oferecendo fogo estranho. Isto, entretanto, foi exatamente o que Nadabe e Abiú, os filhos de Arão, fizeram. Acharam que podiam oferecer sacrifícios por si mesmos e os ofereceram sem a ordem de Arão. O significado do fogo estranho é servir sem uma ordem, é servir sem obedecer à autoridade. Tinham visto seu pai oferecendo; era mais do que simples para eles. E assim presumiram que podiam fazer a mesma coisa. Nadabe e Abiú só pensaram em se eram ou não capazes de fazer o mesmo. Fracassaram em perceber quem representava a autoridade de Deus.

O CULTO É INICIADO POR DEUS

Enfrentamos aqui um problema seríssimo: servir a Deus e oferecer fogo estranho parecem-se muito, mas estão separados por um mundo de coisas. O verdadeiro culto é iniciado por Deus. Quando o homem serve sob a autoridade de Deus, é aceito por causa disso. O fogo estranho origina-se no homem. Não exige conhecimento da vontade de Deus ou obediência à sua autoridade. É totalmente feito através do próprio zelo humano, e termina com a morte. Se acontece que nosso culto ou serviço se torna cada vez mais sem vida, é tempo de pedirmos a Deus que nos ilumine para vermos se estamos servindo no verdadeiro princípio do serviço ou de acordo com o princípio do fogo estranho.

A OBRA DE DEUS É A COORDENAÇÃO DA AUTORIDADE

Nadabe e Abiú trabalharam separados de Arão; por isso trabalharam independentemente de Deus. O trabalho de Deus tem de ser coordenado sob autoridade: Deus queria que Nadabe e Abiú servissem sob a autoridade de Arão. Observe, no Novo Testamento, como Barnabé e Paulo, Paulo e Timóteo, Pedro e Marcos trabalharam juntos. Alguns eram os responsáveis, enquanto os outros ajudaram. No trabalho de Deus, ele coloca alguns em autoridade e outros sob autoridade. Deus nos chamou para sermos sacerdotes segundo a ordem de Melquizedeque; portanto, temos de servir a Deus de acordo com a ordem da autoridade coordenada. Aquele que desordenadamente levanta a sua cabeça e age independentemente está sendo rebelde, o que resulta em morte. Todo aquele que tenta servir sem primeiro entrar em contato com a autoridade está oferecendo fogo estranho. Qualquer um que diz "Se ele pode, eu também posso" está em estado de rebeldia. A rebeldia muda a natureza do fogo. Deus não se preocupa com a questão do sacrifício, mas com a manutenção da autoridade. Consequentemente, os homens deveriam aprender a seguir, a sempre desempenhar um papel de menor importância. Não há lugar para serviço individual isolado. No trabalho espiritual todos devem servir em coordenação. A coordenação é a regra; o indivíduo não é a unidade. Hoje em dia muitos estão tentando servir a Deus independentemente. Jamais se colocaram sob autoridade; inconscientemente pecam contra a autoridade de Deus.

4. O ULTRAJE DE ARÃO E MIRIÃ

"Falaram Miriã e Arão contra Moisés, por causa da mulher etíope, que tomara... E disseram: Porventura tem falado o Senhor somente por Moisés? não tem falado também por nós? O Senhor o ouviu. Era o varão Moisés mui manso, mais do que todos os homens que havia sobre a terra" (Nm 12.1-3).

FALAR CONTRA A AUTORIDADE REPRESENTATIVA PROVOCA A IRA DIVINA

Arão e Miriã eram os irmãos mais velhos de Moisés. Portanto, em casa, Moisés deveria se sujeitar à autoridade deles. Mas na vocação e no trabalho de Deus eles deveriam se sujeitar à autoridade de Moisés. Eles não gostaram da mulher etíope com quem Moisés se casou, por isso murmuraram contra Moisés. Na posição de irmã mais velha, Miriã poderia ter repreendido seu irmão com base em seu relacionamento familiar. Mas quando ela abriu a boca para difamar, tocou na obra de Deus, pondo em dúvida a posição de Moisés.

Deus tinha concedido a Moisés sua autoridade delegada para o trabalho. Como erraram Arão e Miriã em atacar a posição de Moisés, com base numa questão familiar! Fora Deus quem escolhera Moisés para dirigir o povo de Israel, tirando-o do Egito, mas apesar disso Miriã desprezou Moisés. Por causa disto Deus se aborreceu grandemente com ela. Ela podia avir-se com o irmão, mas não injuriar a autoridade de Deus. O problema foi que nem Arão nem Miriã reconheceram a autoridade de Deus. Permanecendo no terreno natural, exibiram um coração rebelde.

Mas Moisés não revidou. Ele sabia que, tendo sido estabelecido por Deus como autoridade, não precisava defender-se. Um leão não precisa de proteção, uma vez que tem em si autoridade total. Moisés podia representar Deus com autoridade porque antes ele mesmo se sujeitou à autoridade divina, pois ele era muito manso, mais do que todos os homens que habitavam a face da terra. A autoridade que Moisés representava era a própria autoridade de Deus. E ninguém pode tirar a autoridade concedida por Deus. Palavras rebeldes sobem ao céu e são ouvidas por Deus. Quando Arão e Miriã pecaram contra Moisés, pecaram contra Deus que se encontrava em Moisés. Sempre que o homem entra em contato com autoridade delegada por Deus, entra em contato com o próprio Deus que se encontra nessa pessoa; pecar contra autoridade delegada é pecar contra Deus.

A AUTORIDADE É OPÇÃO DIVINA, NÃO MÉRITO HUMANO

Deus convocou os três à tenda da congregação. Arão e Miriã foram sem nenhuma hesitação, porque pensaram que Deus estaria do lado deles. Mas Deus proclamou que Moisés era seu servo fiel em toda a sua casa. Como se atreviam a falar contra o seu servo? Autoridade espiritual não é algo que se obtém através de esforços. É concedida por Deus a quem quer que ele escolha. Como o espiritual difere do natural! O próprio Deus é autoridade. É preciso tomar cuidado para que não se cometa ofensa. Qualquer um que falasse contra Moisés falava contra o escolhido de Deus. Não desprezemos jamais os vasos escolhidos por Deus.

A REBELDIA SE MANIFESTOU NA LEPRA

A ira do Senhor se acendeu contra eles e a nuvem se afastou da tenda. A presença de Deus desapareceu e imediatamente Miriã ficou branca de lepra. Sua lepra não surgiu devido à contaminação; foi claramente um castigo de Deus. Ser leprosa não era de maneira nenhuma coisa melhor do que ser uma mulher etíope. E ela, que assim ficou leprosa, teve de ficar isolada, perdendo todo privilégio de se comunicar com os outros.

Quando Arão viu que Miriã estava leprosa, rogou que Moisés agisse como mediador e orasse pedindo cura. Deus disse: "Se seu pai lhe cuspira no rosto, não seria envergonhada por sete dias? Seja detida sete dias fora do arraial, e depois recolhida." E, em resultado disto, a viagem da tenda ficou atrasada por sete dias. Sempre que há rebeldia e ofensa entre nós, perdemos o contato com Deus, e a tenda terrena permanece irremovível. A coluna da nuvem divina não descerá até que aquelas palavras ofensivas tenham sido esclarecidas. Se esta questão da autoridade não for resolvida, tudo mais se torna vazio e inútil.

ALÉM DA AUTORIDADE DIRETA, SEJA SUBMISSO À AUTORIDADE REPRESENTATIVA

Muitos se consideram obedientes a Deus quando na realidade nada sabem sobre a sujeição à autoridade delegada por Deus. Aquele que é verdadeiramente obediente descobrirá que a autoridade de Deus se encontra em todas as circunstâncias, no lar, e em outras instituições. Deus perguntou: "Como, pois, não temeste falar contra o meu servo?" É preciso prestar atenção especial sempre que palavras injuriosas forem enunciadas. Palavras tais não devem ser pronunciadas levianamente. A injúria é prova de que há um espírito rebelde dentro da pessoa; é o germe da rebeldia. Temos de temer a Deus e não devemos falar levianamente. Mas existem hoje em dia aqueles que falam dos anciãos da igreja e daqueles que estão acima deles; não percebem a gravidade de tais palavras. Que Deus nos conceda a graça de compreender que isto não se refere aos nossos irmãos, mas à autoridade instituída por Deus. Depois de reconhecermos a autoridade, perceberemos como pecamos contra Deus. Nosso conceito de pecado passará por uma transformação drástica. Olharemos para o pecado como Deus olha. Veremos que o pecado que Deus condena é o da rebeldia do homem.

5. A REBELIÃO DE CORÉ, DATÃ E ABIRÃO

REBELIÃO COLETIVA

Um exemplo de rebelião coletiva encontra-se no capítulo 16 de Números. Coré e seus companheiros pertenciam aos levitas; portanto, representavam os espirituais. Por outro lado, Datã e Abirão eram filhos de Rúben e, portanto, representavam os líderes. Todos estes, junto com duzentos e cinquenta líderes da congregação, resolveram rebelar-se contra Moisés e Arão. Arbitrariamente atacaram os dois, dizendo: "Basta! pois que toda a congregação é santa, cada um deles é santo, e o Senhor está no meio deles; por que, pois, vos exaltais sobre a congregação do Senhor?" Foram desrespeitosos para com Moisés e Arão. Talvez fossem bastante honestos no que disseram, mas falharam em ver a autoridade do Senhor. Consideraram o assunto como problema pessoal, como se não houvesse autoridade entre o povo de Deus.

Não obstante, mesmo debaixo dessas sérias acusações, Moisés não se zangou nem perdeu o controle de si mesmo. Simplesmente caiu sobre o seu rosto diante do Senhor. Considerando que a autoridade pertence ao Senhor, ele não usou de nenhuma autoridade nem fez nada ele mesmo. Disse a Coré e ao seu grupo que esperassem até a manhã seguinte, quando o Senhor mostraria quem era dele e quem era santo. O povo pensava que estava simplesmente se opondo a Moisés e Arão; não tinha a menor intenção de se rebelar contra Deus, pois ainda desejava servi-lo. Apenas desprezou Moisés e Arão. Mas Deus e sua autoridade delegada são inseparáveis. Não é possível manter uma atitude para com Deus e outra atitude para com Moisés e Arão. Ninguém pode rejeitar a autoridade delegada por Deus com uma mão e receber Deus com a outra. Se eles se submetessem à autoridade de Moisés e Arão, estariam sujeitos a Deus.

Datã e Abirão recusaram-se a vir quando Moisés mandou chamá-los, e resmungaram: "Porventura é cousa de somenos que nos fizeste subir de uma terra que mana leite e mel (Egito), para fazer-nos morrer neste deserto, senão que também queres fazer-te príncipe sobre nós?" Sua atitude foi de muita rebeldia. Não criam na promessa de Deus; o que esperavam eram bênçãos terrenas. Esqueceram-se de que foi devido às suas próprias faltas que não entraram em Canaã; pelo contrário, falaram asperamente contra Moisés.

DEUS ELIMINOU A REBELDIA DO SEU POVO

A esta altura a ira de Moisés despertou. Em lugar de falar com eles, orou a Deus. Quantas vezes a rebeldia do homem força a mão do juízo de Deus! Dez vezes os israelitas tentaram a Deus e cinco vezes deixaram de crer nele, e Deus se controlou e lhes perdoou; mas por causa desta rebeldia Deus resolveu julgar. Mas Moisés e Arão caíram com o rosto em terra e oraram: "Acaso por pecar um só homem, indignar-te-ás contra toda esta congregação?" Deus atendeu às orações deles, mas julgou Coré e o seu grupo. A terra abriu a sua boca e engoliu todos os homens que pertenciam a Coré, Datã e Abirão e todos os seus bens. As portas do inferno não prevalecerão contra a igreja, mas um espírito rebelde abre suas portas. Um dos motivos por que a igreja às vezes não prevalece é a presença da rebeldia. Todos os pecados libertam o poder da morte, mas o pecado da rebeldia é o principal. Só os obedientes podem fechar as portas do inferno e produzir vida.

OS OBEDIENTES SEGUEM A FÉ, NÃO A RAZÃO

Para os israelitas, a queixa de que Moisés não os tinha levado para uma terra que mana leite e mel não era sem motivos. Continuavam no deserto e ainda não tinham entrado na terra do leite e mel. Mas, por favor, observe: aquele que anda segundo a razão e a vista segue o caminho da razão; só aquele que obedece à autoridade entra em Canaã pela fé. Ninguém que segue a razão pode andar pelo caminho espiritual, porque está além e acima do raciocínio humano. Os olhos dos desobedientes são bastante vivos, mas, que pena! tudo o que veem é a esterilidade do deserto. Embora os que prosseguem pela fé possam parecer cegos, pois não percebem a esterilidade diante deles, os olhos de sua fé veem a promessa melhor que jaz adiante. E assim entram em Canaã. Resumindo, então, a autoridade não é um assunto de instrução externa, mas uma revelação interna.

A REBELDIA É CONTAGIOSA

Há dois exemplos de rebeldia em Números 16. Do versículo 1 ao 40 os líderes se rebelaram; do versículo 41 ao 50 toda a congregação se rebelou. O espírito de rebeldia é muito contagioso. O julgamento dos duzentos e cinquenta líderes não deteve toda a congregação. Continuou rebelde, declarando que Moisés matara seus líderes. Mas Moisés e Arão não podiam ordenar à terra que abrisse a sua boca! Fora ordem de Deus. Os olhos humanos só veem os homens; não sabem que a autoridade vem de Deus. Quando toda a congregação se reuniu contra Moisés e Arão, a glória do Senhor apareceu. Começou uma praga e quatorze mil e setecentas pessoas morreram. No meio disso, a percepção espiritual de Moisés tornou-se mais aguda; imediatamente pediu a Arão que tomasse o seu incensário, o acendesse e colocasse incenso nele, levando-o rapidamente à congregação para fazer expiação pelo povo. E enquanto Arão se colocou entre os mortos e os vivos, a praga foi interrompida.

Deus ignorou as murmurações do povo no deserto dez vezes, mas não permitiria que resistissem à sua autoridade. Muitos pecados Deus pode suportar e ignorar, mas a rebeldia ele não permite, porque a rebeldia é o princípio da morte, o princípio de Satanás. Portanto, o pecado da rebeldia é mais sério do que qualquer outro pecado. Sempre que o homem resiste à autoridade, Deus julga imediatamente. Que coisa solene!$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'A carne "se deleita em ver defeitos na autoridade para poder se desembaraçar de todas as restrições" (caso de Cão). Quando você descobre uma falha em quem está acima de você, sua reação se parece mais com a de Cão ou com a de Sem e Jafé?',
     'reflexao', null),
    (v_aula_id, 2,
     'Nadabe e Abiú ofereceram "fogo estranho" — serviram a Deus por iniciativa própria, sem ordem. Há algo no seu serviço a Deus hoje que nasce do seu zelo, mas que você nunca submeteu a nenhuma autoridade?',
     'reflexao', null),
    (v_aula_id, 3,
     'Coré disse uma coisa aparentemente verdadeira ("toda a congregação é santa") para rejeitar a autoridade de Moisés. Examine seu coração: você já usou um argumento espiritual correto para, no fundo, não se submeter a uma autoridade?',
     'reflexao', null);
  end if;
end
$migration$;
