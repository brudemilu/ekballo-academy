-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 6 — Como a igreja deve influenciar o líder (aula ordem = 6)
--
-- Localiza o curso já criado pela migration 058 (slug
-- 'o-desafio-de-todo-lider') e insere a aula no ordem do
-- capítulo, com as perguntas do Desafio Prático como reflexões.
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
  -- Capítulo 6 — Como a igreja deve influenciar o líder
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 6;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 6 — Como a igreja deve influenciar o líder',
      6,
$conteudo$Vimos até aqui que a melhor forma de conciliar a visão de um novo líder com a estrutura antiga da instituição é permitindo que Deus revitalize a instituição estagnada por meio da visão pioneira de líderes chamados por Deus. Logo, a responsabilidade entre líder e liderados é uma via de mão dupla na qual ambos se comprometem a permitir que a visão de Deus transforme de forma eficiente a instituição.

Nos capítulos anteriores, observamos que, após a revelação do chamado de Deus para o líder há uma fase de confirmação desse chamado. Observamos também que isso pode ocorrer por ação direta de Deus (como em sua conversa com Moisés na sarça), por interpretação das circunstâncias (como na oportunidade de José decifrar o sonho do faraó e se tornar governador) e pela participação do Corpo de Cristo, a Igreja (como no caso de Paulo sendo separado pela igreja de Antioquia para evangelizar os gentios).

Portanto, a Igreja está envolvida na confirmação do chamado de seus líderes.

A comunidade dos liderados, ao confirmar o chamado de uma pessoa, também se transforma na sua plataforma de autoridade, conferindo a ela a competência para agir como líder. É uma forma que Deus utiliza para dirimir qualquer dúvida a respeito do chamado interno de uma pessoa. É o reconhecimento da autoridade do líder por parte da igreja, que assim exerce o seu discernimento em relação ao chamado dele.

Em geral, as igrejas têm alguns critérios básicos para avaliar as credenciais de liderança e ministério dos seus membros. Tais critérios incluem as evidências do potencial que a própria pessoa dá a respeito da sua vocação, como seu serviço e os resultados produzidos por seu ministério.

Eu, contudo, sugiro que o núcleo das credenciais de ministério de um líder cristão repousa em três pilares centrais, que, por sua vez, tornam-se os alicerces básicos da aceitação por parte da igreja. Os pilares são: a integridade pessoal, a profundidade de sua educação junto ao conhecimento prático dos assuntos envolvidos em sua tarefa particular de liderança, e os resultados alcançados. Estes três pilares confirmam a eficiência ministerial do líder e são fundamentais para que ele gere resultados exponenciais ao longo da jornada.

A integridade é reconhecida pela igreja pelo fato de ser inseparável da pessoa do líder, estando presente em todos os seus atos e relacionamentos. Há mais de dois mil anos, o filósofo grego Aristóteles mostrou a importância da integridade: "Você nunca saberá se uma linha é curva até colocar uma linha reta ao seu lado". Note como esse é um dos fatores cruciais da liderança cristã: o líder eficaz, segundo o coração de Deus, é esse parâmetro de retidão que não somente conduz o seu povo no caminho do progresso e da verdade, mas também, pela sua atitude e integridade, revela as obras distorcidas de outros.

O conhecimento e preparo do líder tornam-se óbvios aos liderados com o passar do tempo. Já a questão dos resultados, apesar de muito importante, tem uma certa relatividade em alguns casos, pois existem determinadas situações no ministério onde os resultados não são tão expressivos, embora isso não signifique, necessariamente, que o líder não está se dedicando ao desempenho da sua função. É importante compreender que um líder eficiente que percorre sua jornada com excelência se destaca não apenas pelos resultados visíveis, mas pela capacidade de inspirar transformação contínua.

O ponto a destacar, dentro do aspecto de confirmação pela igreja, é o de que esta precisa estar plenamente envolvida neste processo confirmatório. A igreja que você foi chamado a liderar pelo serviço é uma comunidade hermenêutica com a função quádrupla de discernir, autorizar, avaliar e impulsionar o seu ministério. Observe:

• A igreja discerne as qualidades esperadas de um líder — Isso pode ser notado com certa facilidade, já que, quando há na igreja uma pessoa com potencial de liderança, normalmente os membros da comunidade a ouvem, valorizam sua opinião nas decisões a serem tomadas e se agrupam ao redor dela, mesmo que a pessoa ainda não ocupe nenhuma posição formal na instituição. O discernimento reside no fato de que boa parcela do grupo é persuadida a seguir a posição que essa pessoa adota, já que ela já exerce e manifesta valores de liderança natural que são percebidos pelos demais.

• A igreja confere autoridade ao líder — Após discernir essas qualidades de liderança em alguém, há critérios a serem cumpridos para conferir autoridade a ele, os quais variam de acordo com a tradição da igreja. Os mais comuns são a conclusão de um curso de teologia e/ou a imposição de mãos pelos que já ocupam uma posição de liderança e os critérios formais de efetivação são responsabilidade da igreja que autoriza a pessoa a liderá-la.

• A igreja reage positiva ou negativamente ao líder — De maneira informal e constante, a igreja inevitavelmente avalia o líder, aprovando-o ou desaprovando-o por meio de encorajamentos ou críticas, bem como por sua submissão ou não a ele, o que reflete que o líder está ou não suprindo suas necessidades espirituais.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — A Influência da Igreja sobre o Líder
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Reflita sobre como a sua igreja tem confirmado seu chamado como líder. Como a comunidade tem reconhecido suas qualidades de liderança?',
     'reflexao', null),
    (v_aula_id, 2,
     'Faça uma lista de três ações que sua igreja pode tomar para apoiar melhor o seu crescimento como líder. Quais são as áreas em que sua igreja poderia se envolver mais ativamente no seu desenvolvimento?',
     'reflexao', null),
    (v_aula_id, 3,
     'Avalie o nível de confiança e engajamento que você tem com sua igreja. A igreja está reagindo positivamente ao seu ministério?',
     'reflexao', null);
  end if;
end
$migration$;
