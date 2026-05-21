-- =============================================================
-- Curso 04: Ego Transformado (Timothy Keller)
-- 4 aulas + 10 atividades de múltipla escolha + 40 alternativas
-- Conteúdo migrado de lib/mock-data.ts (curso-4, k-aula-1..4, k-atv-1..10).
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula1 uuid; v_aula2 uuid; v_aula3 uuid; v_aula4 uuid;
  v_atv1 uuid; v_atv2 uuid; v_atv3 uuid; v_atv4 uuid; v_atv5 uuid;
  v_atv6 uuid; v_atv7 uuid; v_atv8 uuid; v_atv9 uuid; v_atv10 uuid;
  v_next_ordem int;
begin
  -- Próxima ordem disponível na vitrine de cursos
  select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;

  -- Curso
  insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
  values (
    'ego-transformado-keller',
    'Ego Transformado',
    'Estudo guiado a partir do livro de Timothy Keller (Vida Nova). Quatro aulas curtas sobre identidade, autoesquecimento e a humildade que brota do evangelho. Cada aula libera a próxima quando todas as questões são respondidas corretamente.',
    null,
    false,
    0,
    v_next_ordem,
    true
  )
  returning id into v_curso_id;

  -- Aulas
  insert into public.aulas (curso_id, titulo, ordem, video_url, conteudo) values
  (v_curso_id, 'Introdução: A liberdade resultante do autoesquecimento', 1, null,
$conteudo$Keller começa com uma pergunta que vai atravessar o livro inteiro: o que distingue um coração radicalmente transformado pela graça de Deus? Ele esclarece de saída que não está falando de comportamento moral — é perfeitamente possível fazer ações virtuosas com o coração cheio de medo, orgulho ou sede de poder. A questão é o que acontece dentro, na raiz.

A resposta vem do texto de 1Coríntios 3.21–4.7. Em Corinto, a igreja estava fragmentada por facções — "eu sou de Paulo", "eu sou de Apolo". Para Paulo, a raiz da divisão era uma só: orgulho e vanglória. E aqui Keller faz um movimento brilhante. Mostra que toda cultura humana tem dois grandes diagnósticos para o mau comportamento — e que ambos erram o alvo.

A cultura tradicional dizia: o problema é hubris, autoestima alta demais. As pessoas agem mal porque se acham importantes. A solução era humilhar, repreender, expor o erro.

A cultura moderna inverteu: o problema é baixa autoestima. As pessoas agem mal porque não se valorizam. A solução é elogiar, encorajar, aumentar a autoimagem. Keller cita o New York Times e a psicóloga Lauren Slater para mostrar que essa segunda tese — apesar de dominante — não tem evidência empírica nenhuma.

E então Paulo entra com uma terceira via, completamente diferente. Ele não está nem do lado tradicional, nem do moderno. Está dizendo algo que não cabe em nenhuma dessas categorias. O que ele está dizendo é o que o livro inteiro vai destrinchar.$conteudo$),
  (v_curso_id, 'A condição natural do ego humano', 2, null,
$conteudo$Paulo usa uma palavra grega muito específica: physioō. Não é a palavra comum para orgulho (hubris), é uma palavra rara que significa literalmente "superinflado, inchado, distendido além do tamanho normal". A imagem é de um órgão humano que recebeu tanto ar que está prestes a explodir. Essa, segundo Paulo, é a condição natural do ego humano — não em algumas pessoas piores, mas em todos.

Keller decompõe essa imagem em quatro marcas: o ego natural é vazio, dolorido, atarefado e frágil.

Vazio, primeiro. Não há nada no centro do ego — ele é oco. Citando Kierkegaard, Keller mostra que o ego natural é fundamentado em algo que não é Deus. Ele busca em outras coisas — sucesso, beleza, aprovação, romance, ministério — o senso de valor que só Deus pode dar. E como nada disso enche o espaço de Deus, tudo "chacoalha lá dentro".

Dolorido, segundo. Quando o corpo está saudável, você não pensa nele. Mas o ego dói o tempo todo — vive chamando atenção para si, vive sendo ferido. Quando alguém "feriu seus sentimentos", os sentimentos não foram feridos. Foi o ego que se machucou.

Atarefado, terceiro. O ego vive ocupado preenchendo o vazio. Faz isso de duas formas: comparação e vanglória. Citando C.S. Lewis em Cristianismo puro e simples, Keller mostra que orgulho é, por definição, competitivo — ninguém se orgulha de ser rico, mas de ser mais rico. Tudo vira currículo.

Frágil, quarto. Qualquer coisa superinflada está prestes a estourar. Por isso, complexo de superioridade e complexo de inferioridade são, no fundo, a mesma coisa — um está superinflado e teme ser desinflado, o outro já foi desinflado.

Keller fecha citando Madonna: "o que me impulsiona é o medo de ser medíocre... minha luta não terminou e nunca terminará". Isso é o ego insaciável, em estado puro.$conteudo$),
  (v_curso_id, 'A visão transformada do eu', 3, null,
$conteudo$Aqui Keller mostra Paulo dizendo algo que sai completamente das nossas categorias. Em 1Coríntios 4.3-4, Paulo afirma: "pouco me importa se sou julgado por vós, ou por qualquer tribunal humano; de fato, nem eu julgo a mim mesmo". Leia essa frase de novo. Paulo não está dizendo "não me importo com vocês — só comigo". Está dizendo: "não me importo nem com vocês, nem comigo". Ele saiu do tribunal por inteiro.

O conselho moderno sobre baixa autoestima é claro: "esqueça os outros, defina seus próprios padrões, viva por eles". Keller mostra por que isso não funciona — os próprios padrões viram outra prisão. Trocar o tribunal externo pelo tribunal interno não liberta — só muda o juiz.

Paulo não cai nessa armadilha. Não se julga porque saiu do jogo. E a beleza disso aparece quando ele diz, em 1Timóteo 1.15: "sou o principal dos pecadores". Não "era". "Sou". Como alguém que se confessa o pior dos pecadores tem ao mesmo tempo tanta confiança e estabilidade? Porque ele não conecta seus pecados — nem suas realizações — à sua identidade.

Aqui entra a famosa citação de C.S. Lewis. Quando você conversa com uma pessoa verdadeiramente humilde, você não sai dizendo "que humilde". Você sai pensando: "essa pessoa pareceu interessada em mim". Porque a humildade do evangelho não é pensar em si como mais (orgulho) nem como menos (falsa humildade). É simplesmente pensar menos em si mesmo.

E aí Keller dá um teste prático: a pessoa que se esqueceu de si não fica devastada por críticas. Mas — atenção — também não as ignora. Ela ouve a crítica sem ser destruída e ainda assim a entende como oportunidade real de mudança. Esse é o sinal.$conteudo$),
  (v_curso_id, 'Como alcançar uma visão transformada do eu', 4, null,
$conteudo$Esta é a aula mais curta e a mais importante. Como Paulo chegou ao ponto de não se importar nem com a opinião dos outros nem com a própria? Não foi por força de vontade. Foi porque alguém — o único cuja opinião realmente importa — já tinha se pronunciado sobre ele.

Keller introduz aqui a ideia que sintetiza o livro inteiro: o evangelho cristão é a única forma de identidade onde o veredicto vem antes do desempenho. Em todo outro sistema — religioso, filosófico, secular — o desempenho leva ao veredicto. Você atua para descobrir quem você é. Você performa para conquistar aprovação. E como Madonna confessou, esse veredicto definitivo nunca chega.

No evangelho a ordem se inverte. Antes que eu faça qualquer coisa, antes que eu prove qualquer mérito, Deus já me declarou: "tu és o meu filho amado, em ti me agrado" (Marcos 1.11). Esse veredicto não vem do meu desempenho — vem do desempenho perfeito de Cristo, imputado a mim na cruz. Jesus foi julgado em meu lugar. O tribunal está encerrado. "Agora já não há condenação alguma para os que estão em Cristo Jesus" (Romanos 8.1).

E então o desempenho aparece — mas de outro lugar. Eu ajudo as pessoas não para me sentir bem, não para preencher o vazio. Eu ajudo porque já sou amado. O veredicto garante o desempenho, em vez de o desempenho garantir o veredicto.

Keller fecha com uma palavra prática para quem já crê mas continua sendo "arrastado de volta para o tribunal" todos os dias. A solução não é tentar se sentir mais valorizado. A solução é reviver o evangelho. Cada vez que você ora. Cada vez que vai à igreja. A todo instante, perguntando-se: "por que estou de novo no tribunal? Ali não é mais o meu lugar".$conteudo$);

  select id into v_aula1 from public.aulas where curso_id = v_curso_id and ordem = 1;
  select id into v_aula2 from public.aulas where curso_id = v_curso_id and ordem = 2;
  select id into v_aula3 from public.aulas where curso_id = v_curso_id and ordem = 3;
  select id into v_aula4 from public.aulas where curso_id = v_curso_id and ordem = 4;

  -- Atividades (todas múltipla escolha)
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 1, 'Qual é a pergunta central que abre o livro de Keller, ao analisar 1Coríntios 3.21–4.7?', 'multipla_escolha',
   'Keller abre o livro perguntando: "Quais são as marcas de um coração radicalmente transformado pela graça de Deus?". Tudo o que vem depois é resposta a essa pergunta.'),
  (v_aula1, 2, 'Qual o problema comum tanto da abordagem tradicional (autoestima alta = causa do mal) quanto da moderna (baixa autoestima = causa do mal)?', 'multipla_escolha',
   'Keller diz literalmente que Paulo apresenta uma forma de enxergar o eu "completamente diferente da abordagem das culturas tradicionais e modernas/pós-modernas".'),
  (v_aula2, 1, 'A palavra grega physioō, que Paulo usa para descrever o ego natural, significa literalmente:', 'multipla_escolha',
   'A palavra grega physioō, usada por Paulo, está relacionada ao termo "fole" — a imagem é de um órgão humano superinflado, prestes a explodir.'),
  (v_aula2, 2, 'Quais são as quatro marcas do ego humano natural, segundo Keller?', 'multipla_escolha',
   'Keller lista exatamente essas quatro: vazio (não tem nada no centro), dolorido (vive ferido), atarefado (vive se comparando) e frágil (qualquer coisa superinflada está prestes a estourar).'),
  (v_aula2, 3, 'O exemplo da Madonna ("o que me impulsiona é o medo de ser medíocre... minha luta nunca terminará") ilustra qual verdade sobre o ego?', 'multipla_escolha',
   'Keller usa Madonna como exemplo de alguém autoconsciente o suficiente para confessar que mesmo no auge do sucesso o ego permanece um "buraco negro" que nunca se enche.'),
  (v_aula3, 1, 'Em 1Coríntios 4.3-4, Paulo diz: "pouco me importa se sou julgado por vós... nem eu julgo a mim mesmo". O que ele está dizendo, segundo Keller?', 'multipla_escolha',
   'Paulo recusa o jogo da autoestima por inteiro: nem busca veredicto nos outros, nem em si mesmo. Saiu do tribunal humano e do tribunal interno.'),
  (v_aula3, 2, 'Segundo a famosa citação de C.S. Lewis em "Cristianismo puro e simples", o que é a verdadeira humildade do evangelho?', 'multipla_escolha',
   'C.S. Lewis: "a essência da humildade resultante do evangelho não é pensar em mim mesmo como se eu fosse mais nem pensar em mim mesmo como se eu fosse menos; é pensar menos em mim mesmo".'),
  (v_aula3, 3, 'Qual o "teste simples" que Keller apresenta para identificar uma pessoa que se esqueceu de si mesma?', 'multipla_escolha',
   'Keller: a pessoa esquecida de si "não se sente ferida, não fica mal quando criticada" — mas, diferente de quem só ignora, ainda "a entende como oportunidade de mudança".'),
  (v_aula4, 1, 'O que torna o evangelho cristão radicalmente diferente de toda outra forma de identidade, segundo Keller?', 'multipla_escolha',
   'Keller: "é somente no evangelho de Jesus Cristo que o veredicto é dado antes de desempenharmos nossas ações". Em todas as outras formas de identidade, é o desempenho que leva ao veredicto.'),
  (v_aula4, 2, 'Para alguém que já crê mas todos os dias se vê "arrastado de volta para o tribunal", qual a orientação prática de Keller?', 'multipla_escolha',
   'Keller: "temos de reviver o evangelho cada vez que orarmos. Temos de revivê-lo sempre que vamos à igreja. Temos de reviver o evangelho a todo instante e perguntar a nós mesmos por que estamos no tribunal. Ali não é mais o nosso lugar."');

  select id into v_atv1  from public.atividades where aula_id = v_aula1 and ordem = 1;
  select id into v_atv2  from public.atividades where aula_id = v_aula1 and ordem = 2;
  select id into v_atv3  from public.atividades where aula_id = v_aula2 and ordem = 1;
  select id into v_atv4  from public.atividades where aula_id = v_aula2 and ordem = 2;
  select id into v_atv5  from public.atividades where aula_id = v_aula2 and ordem = 3;
  select id into v_atv6  from public.atividades where aula_id = v_aula3 and ordem = 1;
  select id into v_atv7  from public.atividades where aula_id = v_aula3 and ordem = 2;
  select id into v_atv8  from public.atividades where aula_id = v_aula3 and ordem = 3;
  select id into v_atv9  from public.atividades where aula_id = v_aula4 and ordem = 1;
  select id into v_atv10 from public.atividades where aula_id = v_aula4 and ordem = 2;

  -- Alternativas (40)
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  -- K1 questão 1
  (v_atv1, 1, 'Como ter mais sucesso na vida cristã?', false),
  (v_atv1, 2, 'Quais são as marcas de um coração radicalmente transformado pela graça de Deus?', true),
  (v_atv1, 3, 'Como aumentar a autoestima do crente moderno?', false),
  (v_atv1, 4, 'Como vencer os adversários da igreja?', false),
  -- K1 questão 2
  (v_atv2, 1, 'A tradicional está totalmente certa, a moderna está errada.', false),
  (v_atv2, 2, 'A moderna está totalmente certa, a tradicional está errada.', false),
  (v_atv2, 3, 'Ambas tratam o ego como o centro do problema, mas Paulo aponta para algo completamente diferente.', true),
  (v_atv2, 4, 'Ambas são complementares e podem ser combinadas.', false),
  -- K2 questão 3
  (v_atv3, 1, 'Vazio e quieto.', false),
  (v_atv3, 2, 'Inflado, inchado, distendido além do tamanho normal (relacionada a "fole").', true),
  (v_atv3, 3, 'Sólido e bem formado.', false),
  (v_atv3, 4, 'Pequeno e insignificante.', false),
  -- K2 questão 4
  (v_atv4, 1, 'Forte, sólido, alegre e satisfeito.', false),
  (v_atv4, 2, 'Inflado, contente, atarefado e seguro.', false),
  (v_atv4, 3, 'Vazio, dolorido, atarefado e frágil.', true),
  (v_atv4, 4, 'Vazio, sereno, livre e leve.', false),
  -- K2 questão 5
  (v_atv5, 1, 'Que apenas pessoas famosas têm crise de ego.', false),
  (v_atv5, 2, 'Que o sucesso, eventualmente, resolve a insegurança.', false),
  (v_atv5, 3, 'Que o ego é insaciável — todo desempenho exige outro desempenho, e a despensa nunca enche.', true),
  (v_atv5, 4, 'Que humildade é uma qualidade só dos pobres.', false),
  -- K3 questão 6
  (v_atv6, 1, 'Que devemos seguir nossos próprios padrões em vez dos padrões dos outros.', false),
  (v_atv6, 2, 'Que sua consciência está limpa e por isso ele se sente inocente.', false),
  (v_atv6, 3, 'Que ele saiu do tribunal — sua identidade não depende nem da opinião dos outros nem da própria opinião sobre si.', true),
  (v_atv6, 4, 'Que ele desistiu de tentar ser uma pessoa boa.', false),
  -- K3 questão 7
  (v_atv7, 1, 'Pensar em si mesmo como inferior aos outros.', false),
  (v_atv7, 2, 'Pensar em si mesmo como superior, mas sem demonstrar.', false),
  (v_atv7, 3, 'Pensar menos em si mesmo (não "mais" nem "menos", simplesmente menos).', true),
  (v_atv7, 4, 'Não pensar em mais nada além de si mesmo.', false),
  -- K3 questão 8
  (v_atv8, 1, 'Ela se sente arrasada por toda crítica.', false),
  (v_atv8, 2, 'Ela ignora completamente toda crítica para se proteger.', false),
  (v_atv8, 3, 'Ela ouve a crítica sem ser destruída por ela e a entende como oportunidade de mudança.', true),
  (v_atv8, 4, 'Ela nunca recebe críticas porque é perfeita.', false),
  -- K4 questão 9
  (v_atv9, 1, 'O cristão não precisa de nenhum veredicto sobre si.', false),
  (v_atv9, 2, 'O veredicto é dado antes do desempenho — não depois.', true),
  (v_atv9, 3, 'Deus avalia apenas as boas obras, ignorando as más.', false),
  (v_atv9, 4, 'O desempenho cristão é maior que o de outras religiões.', false),
  -- K4 questão 10
  (v_atv10, 1, 'Tentar ter mais pensamentos positivos sobre si mesmo.', false),
  (v_atv10, 2, 'Estabelecer padrões pessoais mais altos para conquistar autoestima.', false),
  (v_atv10, 3, 'Reviver o evangelho cada vez que orar, for à igreja, e a todo instante — lembrando que o julgamento já terminou em Cristo.', true),
  (v_atv10, 4, 'Parar de ir à igreja para evitar a comparação com outros crentes.', false);
end
$migration$;
