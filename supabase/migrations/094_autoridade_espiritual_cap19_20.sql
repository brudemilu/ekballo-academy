-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 19 e 20 (fecham o livro)
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
  -- Capítulo 19 — As autoridades delegadas devem santificar-se
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 19 — As autoridades delegadas devem santificar-se', 19,
$conteudo$"E a favor deles eu me santifico a mim mesmo, para que eles também sejam santificados na verdade" (Jo 17.19).

Já vimos que a autoridade espiritual se baseia na espiritualidade. Não é algo concedido por homens nem simplesmente designado por Deus. De um lado, baseia-se na espiritualidade e, de outro, na condição humilde e obediente do homem diante de Deus. Vamos agora acrescentar mais um ponto: aquele que deve ser colocado em posição de autoridade precisa ser santificado da multidão. Embora nosso Senhor fosse enviado de Deus e tivesse comunhão ininterrupta com Deus, ainda assim declarou: "E a favor deles eu me santifico a mim mesmo."

O QUE SIGNIFICA QUE O SENHOR SE SANTIFICOU A SI MESMO

"O Senhor santificando-se a si mesmo" significa que, por amor aos seus discípulos, o Senhor deixou de fazer muitas coisas que lhe eram perfeitamente legítimas, de falar muitas palavras que poderia ter falado licitamente, de assumir muitas atitudes que poderia justificavelmente assumir. Sendo o Filho de Deus que não conheceu o pecado, sua liberdade excedia qualquer outra sobre a terra. Muitas coisas não podemos fazer porque temos defeitos; muitas palavras não podemos falar porque somos pessoas impuras. Mas não havia tal dificuldade na vida de nosso Senhor, uma vez que era santíssimo. Apesar de tudo isto, ele disse: "E a favor deles eu me santifico a mim mesmo." Por nossa causa, ele aceita as restrições que vêm dos homens. Deixamos de agir por causa do pecado; mas ele se coloca sob restrições devido à santidade. Não fazemos porque não devemos; mas ele não faz aquilo que poderia fazer. Por causa da autoridade de Deus, ele se restringe de fazer muitas coisas a fim de manifestar sua separação do mundo.

ESTAR EM AUTORIDADE GERALMENTE SIGNIFICA SOLIDÃO

Quando aprendemos a ficar em posição de autoridade, devemos nos santificar diante de irmãos e irmãs. Muitas coisas legítimas não podemos fazer e muitas palavras lícitas não devemos enunciar. Até mesmo a nossa comunhão com irmãos e irmãs deve ter um limite além do qual não seremos nem descuidados nem frívolos. Antes devemos perder a nossa liberdade, ficar sós. A solidão é o sinal da autoridade. Não é devida ao orgulho, mas por causa da autoridade de Deus que representamos. Aqui não está envolvida a questão do pecado, só uma questão de santificação. O oposto à santidade é o que é comum, não o pecado. Ser santificado é ser diferente dos outros. Os pardais voam em bandos, enquanto que as águias voam sozinhas. Se só podemos voar baixo porque não aguentamos a solidão das alturas, não estamos capacitados a ficar em autoridade. Você talvez se sinta abandonado e sinta falta do fervor da multidão; não obstante, você não se atreve a misturar-se com os irmãos e irmãs nas brincadeiras e gracejos. Este é o preço da autoridade.

Mesmo assim, no que se refere a sermos membros uns dos outros, qualquer um que esteja em posição de autoridade deve ser perfeitamente normal, mantendo a comunhão do corpo com todos os irmãos e irmãs, jamais assumindo a falsa posição de ser de uma categoria especial.

ESTAR EM POSIÇÃO DE AUTORIDADE EXIGE RESTRIÇÃO NAS AFEIÇÕES

Levítico 10 registra o julgamento de Nadabe e Abiú porque não se sujeitaram à autoridade de seu pai Arão. O que Arão deveria fazer quando dois de seus quatro filhos morreram no mesmo dia? De acordo com o costume, quando havia uma morte na família, os membros deveriam soltar os cabelos e rasgar suas roupas. Mas Moisés proibiu Arão e seus dois filhos remanescentes de seguir o costume daquele tempo. O pranto é um sentimento humano normal e perfeitamente legítimo. Mas para aqueles que serviam a Deus, era proibido para que não morressem. O que todos os outros israelitas podiam fazer, eles não podiam. Até mesmo os afetos lícitos precisam ser colocados sob controle. Todos aqueles que desejam manter a autoridade de Deus devem saber como se opor a seus próprios sentimentos, como deixar de lado os mais profundos afetos para com seus parentes, amigos e amados. Aquele que é santificado é servo de Deus; aquele que não é santificado é uma pessoa comum.

SANTIFICADO NA VIDA E NO PRAZER

Lemos que, depois do que aconteceu, Deus disse a Arão: "Vinho nem bebida forte tu e teus filhos não bebereis, quando entrardes na tenda da congregação" (Lv 10.9). O povo de Israel tinha permissão de beber, mas os sacerdotes de Deus estavam absolutamente proibidos enquanto serviam. Eis, portanto, uma questão de prazer. Outros podem desfrutar, mas nós não. As pessoas que servem a Deus estão sob disciplina e devem ser capazes de fazer distinção entre o que é santo e o que é comum. Quanto ao sumo sacerdote, as exigências de Deus eram ainda mais severas. Quanto mais alta a posição, mais severa a exigência. Daquele a quem Deus mais confia, mais ele exige.

AUTORIDADE SE BASEIA NA SANTIFICAÇÃO

A autoridade tem seus fundamentos na santificação. Sem santificação não pode haver autoridade. Se você deseja viver com a multidão, não pode ocupar posição de autoridade. Você não pode representar a Deus se mantiver uma comunicação muito liberal e frouxa com as pessoas. Quanto mais alta a autoridade, maior a separação. Deus é a autoridade máxima; consequentemente está acima de todos. O Senhor Jesus podia fazer o que bem quisesse, mas por amor aos seus discípulos santificou-se a si mesmo. Quanto mais nos santificamos e nos sujeitamos à autoridade de Deus, mais autoridade recebemos. Aquele que está em posição de autoridade não se apossa dela; serve a Deus, está pronto a pagar o preço e não procura nenhum excitamento. Estar em posição de autoridade requer que se suba alto, que não se tema a solidão, e que haja santificação. Que nós sejamos aqueles que colocam tudo o que têm sobre o altar, para que a autoridade de Deus seja restaurada. Este é o caminho do Senhor em sua igreja.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee diz que santificar-se não é questão de pecado, mas de abrir mão até do que é lícito: "outros podem, mas você não". Há algo legítimo que Deus tem pedido que você deixe de fazer ou falar, por causa da posição que ele lhe confiou?', 'reflexao', null),
    (v_aula_id, 2, '"A solidão é o sinal da autoridade" — não por orgulho, mas pela separação que ela exige. Você tem disposição de pagar esse preço, ou tende a buscar sempre "o fervor da multidão"? Onde isso aparece na sua vida?', 'reflexao', null),
    (v_aula_id, 3, 'Os sacerdotes não podiam nem chorar publicamente seus mortos enquanto serviam: "até os afetos lícitos precisam ser colocados sob controle". Que afeto, lazer ou liberdade Deus pode estar pedindo que você submeta a ele para representá-lo bem?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 20 — As condições para a delegação de autoridade
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 20 — As condições para a delegação de autoridade', 20,
$conteudo$"Maridos, amai vossas mulheres, como também Cristo amou a igreja, e a si mesmo se entregou por ela" (Ef 5.25). "E vós, pais, não provoqueis vossos filhos à ira, mas criai-os na disciplina e na admoestação do Senhor" (Ef 6.4). "Dize estas cousas; exorta e repreende também com toda a autoridade. Ninguém te despreze" (Tito 2.15).

As autoridades que Deus estabeleceu na família são os pais em relação aos filhos, os maridos em relação às esposas, e os senhores em relação aos servos. No mundo, as autoridades são os reis em relação aos súditos e os governantes em relação aos que lhes estão sujeitos. Na igreja, são os anciãos em relação ao povo de Deus e os obreiros em relação ao seu trabalho. Toda autoridade delegada tem condições a cumprir.

1. MARIDOS. A Bíblia ensina que as esposas devem estar sujeitas a seus maridos; mas os maridos devem exercer autoridade com uma condição. Três vezes em Efésios 5 os maridos são convocados a amar suas esposas como amam a si mesmos. O amor de Cristo pela igreja estabelece o exemplo. Se os maridos quiserem representar a autoridade de Deus, devem amar suas próprias esposas.

2. PAIS. Sem dúvida os filhos devem obedecer aos pais; mesmo assim, a autoridade dos pais tem responsabilidade e condições. As Escrituras dizem: "Pais, não provoqueis vossos filhos à ira." Apesar de terem autoridade, os pais devem aprender a se controlar diante de Deus. Não devem tratar seus filhos de acordo com seus caprichos. O objetivo de toda a autoridade que os pais têm é instruí-los e criá-los na disciplina e admoestação do Senhor. Nenhuma ideia de dominação ou castigo está envolvida; a intenção é a educação e proteção amorosa.

3. SENHORES. Os servos devem ser obedientes aos seus senhores, mas ser senhor também envolve condições. Os senhores não devem ameaçar nem provocar seus servos. Devem saber que aquele que é o Senhor deles e dos seus servos está no céu, e que ele não é parcial (Ef 6.9). Os senhores também estão sob autoridade — a autoridade de Deus. Quanto mais uma pessoa reconhece a autoridade, menos arrogante e intimidante se torna. Atitudes indispensáveis daqueles que se encontram em posição de autoridade são a gentileza e o amor.

4. GOVERNANTES. Devemos nos sujeitar às autoridades governantes. As exigências básicas para as autoridades governantes são a justiça, a imparcialidade, a honestidade e o cuidado para com os pobres. Não devem procurar seu próprio bem-estar, mas manter justiça absoluta.

5. ANCIÃOS. Os anciãos são as autoridades na assembleia local. Uma qualidade essencial, conforme citada em Tito 1, é o autocontrole. Considerando que os anciãos são escolhidos a fim de cuidar da igreja, eles mesmos devem, em primeiro lugar, saber como obedecer e ficar sob controle, para que possam ser exemplo para todos os outros. Outra qualidade essencial: devem governar bem a sua própria casa. Aquele que sabe ser um bom pai pode ser escolhido como ancião. Um ancião não deve ser uma pessoa convencida. Aquele que abusa da autoridade não serve para ser ancião. Por isso, um crente novo não deve ser escolhido para ancião, para que não fique convencido e não caia na condenação do diabo.

6. OBREIROS. Em Tito 2.15, a condição para os obreiros é específica. Paulo exortou Tito: "Dize estas cousas; exorta e repreende também com toda a autoridade. Ninguém te despreze." Para não ser desprezada, a pessoa tem de se santificar. Se não for diferente dos outros na vida e conduta, se vive relaxadamente e sem disciplina, não pode deixar de ser desprezada. É preciso autodisciplina para que outros nos respeitem e para sermos qualificados como representantes de Deus. Embora um obreiro não procure a glória e a honra dos homens, não pode permitir-se ser desprezado por causa de sua falta de santificação. Em ambas as cartas a jovens obreiros, Paulo exorta para que não se deixem desprezar por causa de sua mocidade; pelo contrário, devem estabelecer um exemplo para os outros crentes. Ficar em posição de autoridade custa caro: essas pessoas necessitam santificar-se dentre os demais e ficar preparadas para uma vida solitária. Mas ninguém deve ficar convencido, embora não deva também permitir que o desprezem. Quando uma pessoa se torna muito igual às outras, perde o seu ministério; sua utilidade desaparece, e sua autoridade se perde.

É extremamente importante que a autoridade de Deus seja mantida. Representar autoridade é representar a Deus; estar em posição de autoridade é ser um exemplo para todos.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Toda autoridade delegada tem uma condição: o marido ama, o pai não provoca, o senhor não ameaça. Na relação em que você exerce mais autoridade hoje, você tem cumprido a condição que Deus liga a ela? Onde precisa mudar?', 'reflexao', null),
    (v_aula_id, 2, 'Nee diz que "quanto mais uma pessoa reconhece a autoridade, menos arrogante e intimidante se torna". A forma como você exerce autoridade revela alguém que vive sob autoridade, ou alguém que ainda intimida e impõe?', 'reflexao', null),
    (v_aula_id, 3, 'Sobre os obreiros: "ninguém deve ficar convencido, mas também não deve permitir que o desprezem; quando se torna muito igual aos outros, perde o ministério". Onde você está mais perto do risco — da arrogância ou da falta de santificação que leva ao desprezo?', 'reflexao', null);
  end if;
end
$migration$;
