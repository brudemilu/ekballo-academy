-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 4, 5 e 6
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
  -- Capítulo 4 — O conhecimento que Davi tinha da autoridade
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 4 — O conhecimento que Davi tinha da autoridade', 4,
$conteudo$"Então os homens de Davi lhe disseram: Hoje é o dia, do qual o Senhor te disse: Eis que te entrego nas mãos o teu inimigo, e far-lhe-ás o que bem te parecer. Levantou-se Davi, e furtivamente cortou a orla do manto de Saul. Sucedeu, porém, que, depois, sentiu Davi bater-lhe o coração, por ter cortado a orla do manto de Saul; e disse aos seus homens: O Senhor me guarde de que eu faça tal cousa ao meu senhor, isto é, que eu estenda a mão contra ele, pois é o ungido do Senhor" (1Sm 24.4-6).

DAVI NÃO BUSCOU O TRONO AO PREÇO DA REBELDIA

Quando o reino de Israel foi estabelecido, Deus inaugurou formalmente a sua autoridade sobre a terra. Os israelitas, tendo entrado em Canaã, pediram um rei a Deus. Por causa disso Deus comissionou Samuel para ungir Saul como o primeiro rei. Saul foi escolhido e estabelecido por Deus para constituir sua autoridade delegada. Infelizmente, depois de se tornar rei, desobedeceu à autoridade de Deus até o ponto de tentar destruí-la. Poupou o rei dos amalequitas e o que havia de melhor entre as ovelhas, os bois, os animais cevados, os cordeiros e tudo o que era bom. Uma vez que isto foi feito em desobediência à palavra de Deus, Deus rejeitou Saul e ungiu Davi. Não obstante, Davi continuou um homem sob a autoridade de Saul. Pertencia ao povo de Saul, estava alistado no seu exército e foi, mais tarde, escolhido para ser genro de Saul. Portanto os dois eram ungidos. Mas Saul procurou, muitas vezes, matar Davi. Israel tinha dois reis! O rejeitado permanecia no trono; o escolhido ainda não subira. Davi se encontrava em posição dificílima.

Saul saiu à procura de Davi no deserto de En-Gedi. No trajeto, entrou numa caverna em cujo interior se encontravam assentados Davi e os seus homens. Os homens de Davi sugeriram que Davi poderia matar Saul, mas Davi resistiu à tentação, pois não se atrevia a levantar sua mão contra a autoridade. No que dizia respeito ao trono, não era Davi o ungido de Deus? E, considerando que se encontrava diretamente no plano e vontade de Deus, poderia alguém proibi-lo de ser o rei? Por que, então, Davi não fez nenhum movimento nesse sentido? Mas Davi sentiu que não deveria matar Saul. Fazê-lo seria rebelar-se contra a autoridade de Deus, uma vez que a unção do Senhor permanecia sobre Saul. Embora Saul fosse rejeitado, ainda era o ungido de Deus — alguém estabelecido por Deus. Se Saul fosse morto naquele momento, Davi subiria imediatamente ao trono e a vontade de Deus não teria sido atrasada em tantos anos. Mas Davi era um homem que sabia como negar-se a si mesmo. Ele preferia atrasar a sua subida ao trono a ser uma pessoa rebelde. Eis por que finalmente veio a ser a autoridade delegada por Deus.

Tendo Deus empossado Saul como rei e colocado Davi sob a autoridade de Saul, Davi teria de pagar o preço da rebeldia para obter o trono, matando Saul. Teria de se tornar um rebelde. Ele não se atrevia a tanto. O princípio envolvido é semelhante à reserva de Miguel em pronunciar um juízo injurioso contra Satanás (Judas 9). A autoridade, vemos assim, é uma questão de implicações extremamente profundas.

A OBEDIÊNCIA É MAIS IMPORTANTE QUE O TRABALHO

Para que se sirva a Deus, a sujeição à autoridade é uma necessidade absoluta. A obediência transcende nosso trabalho. Se Davi reinasse, mas fracassasse em sujeitar-se à autoridade de Deus, teria sido tão inútil quanto Saul. O mesmo princípio de rebeldia opera no Saul do Antigo Testamento e no Judas do Novo Testamento: o primeiro poupou o melhor que havia entre os bois e as ovelhas, ao passo que o segundo cobiçou as trinta moedas de prata. Consagração não esconde o pecado da rebeldia. Davi não se atreveu a matar Saul com suas próprias mãos a fim de executar o plano e a vontade de Deus. Ele aguardou que Deus operasse; seu coração permaneceu silenciosamente obediente. Mesmo naquela ocasião em que cortou um pedaço da capa de Saul, seu coração o acusou.

A percepção espiritual de Davi era tão aguda quanto a dos crentes do Novo Testamento. Hoje não deveríamos simplesmente condenar o homicídio; inclusive uma ação menor como a de cortar um pedaço da capa de outrem com uma faquinha deveria ser condenada, pois também é rebeldia. Falar mal, comportar-se mal ou resistir internamente não podem se classificar como homicídios, mas certamente constituem o mesmo que cortar um pedaço da capa de alguém. Tudo se origina de um espírito rebelde.

Davi conhecia a autoridade divina em seu coração. Embora repetidas vezes fosse caçado por Saul, submeteu-se à autoridade de Deus. Até mesmo chamava Saul de "meu senhor" ou "o ungido do Senhor". Isto revela um fato importante: sujeição à autoridade não se limita a estar sujeito a uma pessoa, mas é estar sujeito à unção que vem a ela quando Deus lhe ordena que seja uma autoridade. Davi reconhecia a unção que havia sobre Saul e sabia que ele era o ungido do Senhor. Por isso preferia fugir para salvar a vida a estender a mão para matar Saul. É verdade que Saul desobedeceu à ordem divina e foi rejeitado por Deus; isto, entretanto, era coisa entre Saul e Deus. A responsabilidade de Davi diante de Deus era a de sujeitar-se ao ungido do Senhor.

DAVI SUSTENTOU A AUTORIDADE DE DEUS

Davi defendia de maneira absoluta a autoridade de Deus. É exatamente esta qualidade que Deus deseja restaurar. Uma vez no deserto de Zife, surgiu uma ocasião parecida. A tentação de matar Saul veio pela segunda vez: Saul dormia e Davi conseguiu entrar no acampamento. Abisai queria matar Saul, mas Davi lho proibiu, respondendo com um juramento: "Quem haverá que estenda a mão contra o ungido do Senhor, e fique inocente?" (1Sm 26.9). Pela segunda vez Davi poupou Saul. Simplesmente retirou a lança e o jarro de água que estavam junto à cabeça de Saul. Foi um progresso em relação ao primeiro exemplo, porque desta vez ele apenas tocou em coisas fora do corpo de Saul. Davi preferia obedecer a Deus e manter a autoridade divina a salvar a sua própria vida.

Em 1 Samuel 31 e 2 Samuel 1, lemos que Saul cometeu suicídio com a ajuda de um jovem amalequita. O jovem veio correndo a Davi em busca de uma recompensa, dizendo que tinha matado Saul. Mas a atitude de Davi continuou sendo a de completa negação do ego e submissão à autoridade de Deus. Disse ao jovem: "Como não temeste estender a mão para matares o ungido do Senhor?" E imediatamente ordenou que o jovem fosse morto. Deus chamou Davi de homem segundo o seu próprio coração, porque Davi sustentou a autoridade divina. O reino de Davi continua até o dia de hoje. O Senhor Jesus é um descendente de Davi. Só aqueles que se sujeitam à autoridade podem exercer autoridade. Este assunto é terrivelmente sério. Temos de arrancar todas as raízes da rebeldia em nós.

É absolutamente essencial que sejamos sujeitos à autoridade antes de exercermos autoridade. A igreja existe por causa da obediência. Ela não teme os fracos, mas teme os rebeldes. Temos de nos sujeitar à autoridade de Deus em nosso coração para que a igreja possa ser abençoada. O futuro da igreja depende de nós. Estamos atravessando dias solenes.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Davi preferiu "atrasar a sua subida ao trono a ser uma pessoa rebelde". Existe algo legítimo que você deseja (uma posição, um reconhecimento, uma mudança) que você estaria tentado a alcançar por um caminho de rebeldia? O que seria esperar em Deus aqui?', 'reflexao', null),
    (v_aula_id, 2, 'O coração de Davi o acusou só por ter cortado a orla do manto de Saul. Sua consciência é sensível a "rebeldias menores" — falar mal pelas costas, resistir internamente, ironizar uma autoridade? Onde ela tem ficado dura?', 'reflexao', null),
    (v_aula_id, 3, 'Que Saul fosse rejeitado "era coisa entre Saul e Deus; a responsabilidade de Davi era sujeitar-se ao ungido do Senhor". Você tende a usar as falhas de uma autoridade como justificativa para não se submeter? Como Davi o corrige nesse ponto?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 5 — A obediência do Filho
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 5 — A obediência do Filho', 5,
$conteudo$"Tende em vós o mesmo sentimento que houve também em Cristo Jesus, pois ele, subsistindo em forma de Deus, não julgou como usurpação o ser igual a Deus; antes a si mesmo se esvaziou, assumindo a forma de servo, tornando-se em semelhança de homens; e, reconhecido em figura humana, a si mesmo se humilhou, tornando-se obediente até à morte, e morte de cruz. Pelo que também Deus o exaltou sobremaneira e lhe deu o nome que está acima de todo nome" (Fp 2.5-9). "Embora sendo Filho, aprendeu a obediência pelas cousas que sofreu e, tendo sido aperfeiçoado, tornou-se o Autor da salvação eterna para todos os que lhe obedecem" (Hb 5.8-9).

O SENHOR INICIA A OBEDIÊNCIA

A Bíblia nos diz que o Senhor Jesus e o Pai são um. No começo era o Verbo, e o Verbo era Deus. Os céus e a terra foram criados pela Palavra. O Pai e o Filho existem igualmente e são iguais em poder e propriedade. Só em Pessoa há uma diferença entre o Pai e o Filho. Não é uma diferença essencial; é apenas um arranjo dentro da Divindade. Portanto, as Escrituras dizem que o Senhor "não julgou como usurpação o ser igual a Deus" — isto é, não era uma coisa a ser tomada. Sua igualdade com Deus não é uma coisa tomada nem adquirida, pois inerentemente ele é a imagem de Deus.

Quando veio a este mundo, o Senhor tinha se esvaziado de tal maneira da glória, do poder, do "status" e da forma de sua divindade, que ninguém naquele tempo, a não ser por revelação, reconheceu-o como Deus. Trataram-no como homem, uma pessoa comum neste mundo. Como Filho, de boa vontade submeteu-se à autoridade do Pai e declarou "o Pai é maior do que eu" (Jo 14.28). Portanto há perfeita harmonia na Divindade. Alegremente o Pai assume o lugar de Cabeça, e o Filho reage com obediência. Deus torna-se o emblema da autoridade, enquanto Cristo assume a posição de símbolo da obediência.

Para nós, os homens, obedecer deveria ser simples, porque tudo de que precisamos é um pouco de humildade. Para Cristo, entretanto, ser obediente não foi uma questão simples. Foi muito mais difícil para ele ser obediente do que criar os céus e a terra. Por quê? Porque teve de esvaziar-se de toda a glória e poder de sua divindade e assumir a forma de escravo para poder obedecer. Portanto a obediência foi iniciada pelo Filho de Deus.

O Filho originalmente partilhou a mesma glória e autoridade com o Pai. Mas quando veio ao mundo, de um lado abandonou a autoridade e, de outro, assumiu a obediência. De boa vontade assumiu o lugar de escravo, aceitando as limitações humanas de tempo e espaço. Ele se humilhou ainda mais e foi obediente até à morte. Obediência dentro da Divindade é a coisa mais admirável em todo o universo. Sendo Cristo obediente até à morte — sofrendo uma morte muitíssimo dolorosa e vergonhosa na cruz — Deus o exaltou sobremaneira. Deus exalta todo aquele que se humilha. Este é um princípio divino.

ESTAR CHEIO DE CRISTO É ESTAR CHEIO DE OBEDIÊNCIA

Uma vez que o Senhor deu início à obediência, o Pai tornou-se o Cabeça de Cristo. Portanto, uma vez que a autoridade e a obediência foram instituídas por Deus, é natural que aqueles que conhecem Deus e Cristo obedeçam. Mas aqueles que não conhecem Deus nem Cristo, não conhecem também a autoridade e a obediência. Cristo é o princípio da obediência. Portanto, uma pessoa que está cheia de Cristo deve ser uma pessoa que também está cheia de obediência.

Hoje em dia, as pessoas costumam perguntar: "Por que eu tenho de obedecer? Considerando que ambos somos irmãos, por que eu tenho de obedecer a você?" Mas os homens não têm qualificações para fazer tais perguntas. Só o Senhor tem esta qualificação; contudo ele jamais enunciou tais palavras nem um tal pensamento jamais penetrou em sua mente. Cristo representa obediência, que é tão perfeita quanto a autoridade de Deus. Que Deus seja misericordioso com aqueles que proclamam conhecer a autoridade quando a obediência falta em suas vidas.

O CAMINHO DO SENHOR

No que se refere à Divindade, o Filho e o Pai são co-iguais; mas, sendo ele o Senhor, foi recompensado por Deus. O Senhor Jesus Cristo foi feito Senhor só depois que se esvaziou. Sua divindade deriva do que ele é, por ser Deus em sua natureza inerente. Ser Senhor, entretanto, é um resultado do que fez. Foi exaltado e recompensado por Deus para ser Senhor só depois que abandonou sua glória e manteve-se no papel perfeito da obediência.

Parece que no princípio houve um conselho da Divindade. Deus idealizou um plano para a criação do universo. Nesse plano, a Divindade concordou que a autoridade fosse representada pelo Pai. Mas a autoridade não pode ser estabelecida no universo sem a obediência, pois não pode existir sozinha. Portanto, Deus tem de encontrar a obediência no universo. Seriam criados dois tipos de seres vivos: os anjos (espíritos) e os homens (almas viventes). De acordo com sua onisciência, Deus previu a rebelião dos anjos e a queda dos homens; por isso não lhe foi possível estabelecer sua autoridade nos anjos ou na raça adâmica. Consequentemente, dentro do acordo perfeito da Divindade, essa autoridade seria atendida pela obediência no Filho. Um dia Deus Filho se esvaziou e, tendo nascido em semelhança de homem, tornou-se o símbolo da obediência. O homem pecou e se rebelou; por isso a autoridade de Deus tem de ser estabelecida na obediência do homem. Isto explica por que o Senhor veio ao mundo e foi feito igual ao homem criado.

Havia duas formas de o Senhor retornar: uma era obedecendo absolutamente e sem reservas como homem, estabelecendo a autoridade de Deus em todas as coisas, em todas as ocasiões, sem o menor toque de rebeldia; assim, passo a passo, através da obediência a Deus, tornar-se-ia o Senhor de tudo. A outra seria forçando o seu caminho de volta, reclamando e usando a autoridade, o poder e a glória de sua divindade. Mas o Senhor ignorou o segundo caminho e trilhou humildemente o caminho da obediência — até a morte. Só através da obediência como homem é que ele retornou. Consequentemente, Deus o exaltou grandemente e o fez Senhor quando retornou à glória. Por isso o nome de Jesus é preciosíssimo; não há ninguém no universo igual a ele.

Que nós também tenhamos esta mente que havia em Cristo Jesus. Vamos todos trilhar o caminho do Senhor e nos apegar à obediência, tornando muito nosso este princípio da obediência. Sujeitemo-nos uns aos outros. Tendo uma vez entendido este princípio, não teremos dificuldade em discernir que nenhum pecado é mais sério do que a rebeldia e nada é mais importante do que a obediência. Só no princípio da obediência podemos servir a Deus; só obedecendo como Cristo obedeceu podemos reafirmar o princípio divino da autoridade, pois a rebeldia é a operação do princípio de Satanás.

APRENDENDO A OBEDIÊNCIA ATRAVÉS DO SOFRIMENTO

Em Hebreus 5.8 somos informados que Cristo "aprendeu a obediência pelas coisas que sofreu". O sofrimento exigiu obediência do Senhor. Por favor, observe que ele não trouxe obediência a esta terra; ele a aprendeu — e o fez através do sofrimento. Quando encontramos o sofrimento, aprendemos a obediência. Tal obediência é verdadeira. Nossa utilidade não fica determinada através do nosso sofrimento, mas pelo tanto de obediência que aprendemos por meio desse sofrimento. Só os obedientes são úteis para Deus. Enquanto o nosso coração não for amolecido, o sofrimento não nos abandonará. Vamos, portanto, aprender a obedecer no sofrimento.

A salvação torna as pessoas obedientes e também alegres. Se nós só buscamos a alegria, nossas propriedades espirituais não serão abundantes; mas aqueles que são obedientes experimentarão a abundância da salvação. Vamos obedecer — pois nosso Senhor Jesus, tendo sido aperfeiçoado pela obediência, tornou-se a fonte de nossa salvação eterna. Deus nos salva para que possamos obedecer à sua vontade. Se travamos conhecimento com a autoridade de Deus, descobrimos que a obediência é fácil e que a vontade de Deus é simples, porque o próprio Senhor sempre foi obediente e nos transmitiu esta vida de obediência.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Para Cristo, "foi muito mais difícil ser obediente do que criar os céus e a terra", porque obedecer exigiu esvaziar-se da glória. Em que situação obedecer tem sido, para você, mais difícil do que "fazer grandes coisas" por Deus?', 'reflexao', null),
    (v_aula_id, 2, 'Nee diz que "estar cheio de Cristo é estar cheio de obediência". Se alguém medisse o quanto você está cheio de Cristo pela sua obediência (e não pelo seu conhecimento ou atividade), o que veria?', 'reflexao', null),
    (v_aula_id, 3, 'Cristo "aprendeu a obediência pelas coisas que sofreu". Olhando para um sofrimento atual ou recente: que medida de obediência Deus tem querido produzir em você através dele?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 6 — Como Deus estabelece o seu Reino
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 6 — Como Deus estabelece o seu Reino', 6,
$conteudo$"Ora, nós somos testemunhas destes fatos, e bem assim o Espírito Santo, que Deus outorgou aos que lhe obedecem" (At 5.32). "Tendo purificado as vossas almas, pela vossa obediência à verdade, tendo em vista o amor fraternal não fingido, amai-vos de coração uns aos outros ardentemente" (1Pe 1.22).

O SENHOR APRENDEU A OBEDIÊNCIA ATRAVÉS DO SOFRIMENTO

Assim como Deus garantiu o princípio da obediência através da vida de nosso Senhor, Deus também estabeleceu sua autoridade através do Senhor. Vamos ver agora como Deus estabelece hoje em dia o seu reino com base nessa autoridade. O Senhor veio a este mundo de mãos vazias; não trouxe consigo a obediência. Aprendeu a obediência através do que sofreu e, assim, tornou-se a fonte da salvação eterna a todos os que lhe obedecem. Passando por sofrimento após sofrimento, aprendeu a obedecer até à morte, e morte de cruz. Quando o Senhor deixou a Divindade para se tornar homem, verdadeiramente tornou-se um homem — fraco e sofredor. Cada sofrimento pelo qual passou amadureceu num fruto de obediência. Nenhum sofrimento foi capaz de incitá-lo à murmuração ou à impaciência.

Como diferem disto muitos cristãos que não conseguem aprender a obedecer mesmo depois de muitos anos. Embora seu sofrimento aumente, sua obediência não. Quando surge o sofrimento, geralmente murmuram zangados, indicando novamente que não aprenderam a obedecer. Mas nosso Senhor, ao passar por toda espécie de sofrimentos, continuamente exibiu o espírito da obediência; e assim se tornou a fonte de nossa salvação eterna. A obediência de nosso Senhor foi por amor do reino de Deus. O alvo da redenção é promover o reino de Deus.

DEUS ESTABELECERÁ O SEU REINO

Você já notou até que ponto a queda dos anjos e do homem afetou o universo? Era intenção divina que os seres por ele criados aceitassem sua autoridade, mas ambos os tipos de seres criados a rejeitaram. Deus não pôde estabelecer sua autoridade nos seres criados; mesmo assim, não a retirou. Ele poderia retirar sua presença, mas jamais desistirá da autoridade que iniciou. Por isso, de um lado, Deus afirmará sua autoridade e, de outro, estabelecerá o seu reino. Por que a Bíblia chama o reino de Deus de "o reino dos céus"? Porque a rebeldia não se restringiu simplesmente a esta terra, mas, além dela, alcançou os céus, onde os anjos se rebelaram. Como, então, o Senhor Jesus estabelece o reino de Deus? Ele o estabelece através de sua obediência. Nunca foi desobediente a Deus; nunca resistiu à autoridade de Deus enquanto esteve na terra. Obedecendo perfeitamente e permitindo que a autoridade reinasse absolutamente, estabeleceu o reino de Deus dentro do reino de sua própria obediência. Agora, exatamente como fez nosso Senhor, a igreja deveria obedecer hoje em dia a fim de que a autoridade de Deus pudesse prosperar e o reino de Deus se manifestar.

DEUS ORDENA QUE A IGREJA SEJA A VANGUARDA DO SEU REINO

Depois da queda de Adão, Deus escolheu Noé e sua família. Contudo, eles também falharam — depois do dilúvio. Então Deus chamou Abraão para ser o pai de uma multidão de nações. Os descendentes de Jacó multiplicaram-se grandemente sob a opressão egípcia e, por isso, Deus enviou Moisés para livrá-los do Egito a fim de que pudessem estabelecer uma nova nação. Mas como havia desobedientes entre eles, Deus levou os israelitas através do deserto a fim de ensinar-lhes a obediência. Não obstante, persistiram em sua rebeldia contra Deus, resultando que toda a geração morreu pelo caminho. Saul tornou-se o primeiro rei, mas devido à sua rebeldia o reino não pôde ser estabelecido. Só depois que Davi foi escolhido, Deus encontrou nele o rei que foi segundo o seu próprio coração, pois Davi obedeceu totalmente à autoridade de Deus.

O Senhor veio a este mundo para estabelecer o reino de Deus. Seu evangelho é duplo em natureza: o pessoal e o geral. No que se refere ao pessoal, o evangelho chama homens para receber vida eterna através da fé; quanto ao geral, convida homens para entrar no reino de Deus através do arrependimento. Os olhos de Deus estão sobre o reino: o "Pai Nosso", por exemplo, começa e termina com o reino. Começa com "Venha o teu reino, faça-se a tua vontade, assim na terra como no céu" e termina com "Pois teu é o reino, o poder e a glória para sempre. Amém" (Mt 6.13). O reino de Deus é aquele reino dentro do qual a vontade de Deus é executada sem nenhuma interferência. "O reino de Deus está entre vós", diz o Senhor. O próprio Senhor é, finalmente, o reino de Deus. Pois exatamente como o reino de Deus está no Senhor, deve também ser encontrado na igreja — porque a vida do Senhor é liberada para a igreja, e assim o reino de Deus também se estende à igreja.

Deus tem o propósito de que sejamos o seu reino e a sua igreja, uma vez que a igreja tem ordens de constituir o terreno onde a autoridade de Deus é exercida. Ele deseja que toda a igreja lhe conceda preeminência absoluta a fim de que sua autoridade prevaleça e não haja rebeldia. Quer que sejamos obedientes não apenas à autoridade direta que ele mesmo exerce, mas também às autoridades delegadas que ele estabelece. O que ele espera é obediência total, não parcial.

O EVANGELHO NÃO SÓ CONVOCA O POVO A CRER, MAS TAMBÉM A OBEDECER

A Bíblia menciona a obediência além da fé, pois não somos apenas pecadores, mas também filhos da desobediência. A natureza da crença no evangelho é a obediência. "Tomando vingança contra os que não conhecem a Deus e contra os que não obedecem ao evangelho de nosso Senhor Jesus" (2Ts 1.8). Aqueles que não obedecem são os rebeldes. A fé é obediência. Os crentes deveriam ser antes chamados de "obedecedores", pois devem ficar sujeitos à autoridade do Senhor além de crer nele. Depois que Paulo foi iluminado, perguntou: "Que farei, Senhor?" (At 22.10). Não só creu, mas também se submeteu ao Senhor.

Deus não nos chama só para receber sua vida através da fé, mas também para manter sua autoridade através da obediência. Ele aconselha-nos, aos que estamos na igreja, a obedecer às autoridades que ele estabeleceu — no lar, na escola, na sociedade e na igreja — como também a obedecer à sua autoridade direta. Muitos são capazes de dar ouvidos e obedecer somente a uma determinada pessoa. Isto indica que ainda não descobriram a autoridade. De nada adianta obedecer ao homem; é à autoridade que devemos obedecer. Para aqueles que conhecem a autoridade, até a mais leve desobediência fá-los sentir que foram rebeldes. Como é fácil obedecer quando se reconhece a autoridade!

A IGREJA TEM DE OBEDECER À AUTORIDADE DE DEUS

A maneira de Deus obter o seu reino é, em primeiro lugar, no Senhor Jesus, depois na igreja e, finalmente, em todo o mundo. Um dia se fará uma proclamação anunciando que "o reino do mundo se tornou de nosso Senhor e do seu Cristo" (Ap 11.15). O reino tem de ser encontrado no Senhor Jesus antes que seja estabelecido na igreja; tem de ser implantado na igreja antes que seja assegurado entre as nações. Quando se encontrava na terra, o Senhor obedeceu em todos os menores detalhes. Por exemplo, pagou o imposto devido ao templo. E ensinou aos homens a dar "a César o que é de César, e a Deus o que é de Deus" (Mt 22.21). Embora César fosse uma pessoa rebelde, fora estabelecido por Deus; consequentemente, tinha de ser obedecido.

Através de nossa obediência o reino será estendido por toda a terra. Hoje, entretanto, muitos têm consciência de pecado, mas não de rebeldia. Os homens precisam de um senso de autoridade, além do senso do pecado. Não ser sensível ao pecado prejudica a vida cristã; falta de sensibilidade diante da autoridade desqualifica a pessoa. Como pode o reino de Deus se manifestar se não somos capazes de nos sujeitar a pequenas dificuldades dentro da igreja? Como pode o reino de Deus prevalecer se sempre discutimos e argumentamos entre nós? Quando a igreja obedecer verdadeiramente, todas as nações lhe seguirão. A responsabilidade da igreja é imensa. Quando a vontade e a ordem de Deus encontrarem livre acesso na igreja, seu reino certamente virá.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee distingue ter "consciência de pecado" de ter "consciência de rebeldia". Onde você é sensível ao pecado, mas pouco sensível à rebeldia (à insubmissão à autoridade)?', 'reflexao', null),
    (v_aula_id, 2, 'O reino de Deus avança quando a igreja se sujeita até "em pequenas dificuldades". Que pequena dificuldade na sua comunidade você tem transformado em discussão em vez de em submissão?', 'reflexao', null),
    (v_aula_id, 3, 'Jesus pagou imposto a César, ainda que César fosse rebelde, "porque fora estabelecido por Deus". Há uma autoridade civil, institucional ou eclesiástica que você só obedece quando concorda? Como este capítulo o desafia?', 'reflexao', null);
  end if;
end
$migration$;
