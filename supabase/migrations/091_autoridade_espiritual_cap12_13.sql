-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- SEGUNDA PARTE — Autoridades Delegadas. CAPÍTULOS 12 e 13.
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
  -- Capítulo 12 — Aqueles a quem Deus delega autoridade
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 12 — Aqueles a quem Deus delega autoridade', 12,
$conteudo$SEGUNDA PARTE — AUTORIDADES DELEGADAS

Os filhos de Deus não deveriam apenas aprender a reconhecer a autoridade, mas também estar à procura daqueles a quem deveriam obedecer. O centurião falou ao Senhor Jesus, dizendo: "Pois também eu sou homem sujeito à autoridade, tenho soldados às minhas ordens" (Mt 8.9). Ele era realmente um homem que reconhecia a autoridade. Se algum dos filhos de Deus é independente e autoconfiante, não sujeito à autoridade delegada por Deus, então jamais pode realizar a obra de Deus na terra. Como podemos crer se não sabemos em quem crer; como podemos amar se não sabemos a quem amar; ou como podemos obedecer se não sabemos a quem obedecer? Não temos de escolher a quem obedecer, mas aprender a sujeitar-nos a todas as autoridades governantes.

Não existe ninguém apto a ser autoridade delegada por Deus se ele mesmo não aprender primeiro como sujeitar-se à autoridade. Ninguém pode saber como exercer autoridade até que sua própria rebeldia tenha sido resolvida. É essencial que aprendamos a ficar sujeitos uns aos outros e sujeitos às autoridades delegadas.

TRÊS REQUISITOS PARA UMA AUTORIDADE DELEGADA

Além de um conhecimento pessoal de autoridade e uma vida vivida sob autoridade, a autoridade delegada por Deus necessita preencher estes três requisitos principais:

1. DEVE RECONHECER QUE TODA AUTORIDADE PROCEDE DE DEUS. Cada pessoa que é chamada para ser uma autoridade delegada deveria se lembrar que "não há autoridade que não proceda de Deus" (Rm 13.1). Ela mesma não é autoridade, nem ninguém pode constituir-se uma autoridade. Suas opiniões, ideias e pensamentos não são melhores do que os dos outros. Só aquilo que vem de Deus constitui autoridade e merece a obediência do homem. Uma autoridade delegada deve representar a autoridade de Deus, jamais presumir que também tenha autoridade. O guarda e o juiz executam autoridade e aplicam a lei, mas não devem eles mesmos escrever a lei. Estar em posição de autoridade não depende de ter ideias ou pensamentos; antes, depende de conhecer a vontade de Deus. A medida do conhecimento que uma pessoa tem da vontade de Deus é a medida de sua autoridade delegada. Na verdade, tais pessoas que são fortes em si mesmas devem ser grandemente temidas na igreja. Aquele que age como autoridade delegada por Deus precisa primeiro conhecer a vontade e o caminho de Deus antes de ter capacidade de pôr em efeito a autoridade. Jamais deve dar aos irmãos e irmãs uma ordem que Deus não tenha dado. Só o julgamento reconhecido por Deus tem autoridade.

2. DEVE NEGAR-SE A SI MESMO. Até que uma pessoa saiba qual é a vontade de Deus, deve manter sua boca fechada. Não deve exercer a autoridade levianamente. Pessoas com muitas opiniões, ideias e pensamentos subjetivos devem ser temidas; gostam de dar conselhos a todo mundo. Deus não pode jamais usar uma pessoa tão cheia de opiniões para representar a sua autoridade. Se não formos totalmente quebrantados pelo Senhor, não estaremos qualificados como autoridade delegada por Deus. Deus nos convoca para representarmos sua autoridade, não para a substituirmos. Isto não implica dizer que, para ser usado por Deus, deva reduzir-se a não ter nenhuma opinião, nenhum pensamento e nenhum julgamento. Significa simplesmente que o homem deve ser verdadeiramente quebrantado. Aqueles que são naturalmente comunicativos, dogmáticos e presunçosos precisam de um tratamento radical, um amansamento básico. Só depois que uma pessoa é açoitada por Deus começa a viver em temor e tremor diante dele. A exigência básica para ser autoridade delegada por Deus é não abrigar nenhum pensamento ou opinião que seja sua própria.

3. DEVE CONSTANTEMENTE ESTAR EM COMUNHÃO COM O SENHOR. Aqueles que são autoridades delegadas por Deus precisam manter íntima comunhão com Deus. Qualquer um que oferece opiniões apressadamente e fala em nome do Senhor levianamente está muito longe de Deus. Quanto mais perto uma pessoa se encontra do Senhor, mais claramente vê suas próprias faltas. A autoridade é representativa em natureza, não inerente. Só Deus tem autoridade; ninguém mais a possui. Quando a autoridade de Deus flui para mim, flui então através de mim para os outros; o que me torna diferente dos outros é Deus, não eu mesmo. Por que usamos a palavra "comunhão"? Porque devemos viver na presença do Senhor continuamente, não só de vez em quando. Sempre que nos afastamos de Deus, o caráter de nossa autoridade se modifica. Se a comunhão for interrompida, a autoridade também cessa.

JAMAIS TENTE ESTABELECER SUA PRÓPRIA AUTORIDADE

A autoridade é estabelecida por Deus; portanto nenhuma autoridade delegada precisa tentar assegurar-se de sua autoridade. Não insista em que outros lhe deem ouvidos. Se erram, deixe que errem; se não se submetem, que fiquem insubordinados. Uma autoridade delegada não deve lutar com os homens. Por que deveria eu exigir que me ouçam, se não sou autoridade estabelecida por Deus? Por outro lado, se sou estabelecido por Deus, preciso ter medo de que os homens não se me submetam? Deus é meu apoio, por que então eu deveria temer? Quanto mais Deus nos confia, mais liberdade garantimos às pessoas. É muitíssimo desonroso falar em benefício de nossa própria autoridade ou tentar estabelecer nossa própria autoridade. Embora Davi fosse ungido por Deus e escolhido para ser rei, durante muitos anos permaneceu sob a mão de Saul. Não estendeu sua mão para instituir sua própria autoridade.

Não gosto de ouvir alguns maridos dizendo a suas esposas: "Eu sou autoridade estabelecida por Deus; por isso você tem de me ouvir"; nem tenho qualquer prazer em ouvir os anciãos da igreja dizer aos irmãos e irmãs: "Sou autoridade designada por Deus". Amados, jamais tentem estabelecer sua própria autoridade. Se Deus o escolher, receba-a com humildade; se Deus não o chamar, por que você deveria lutar por isso? Quando a autoridade que lhe foi delegada for testada, não faça nada. Não se apresse, não lute, não fale por si mesmo. As pessoas não estão se rebelando contra você, mas contra Deus. Se a sua autoridade é realmente de Deus, aqueles que se opõem encontrarão bloqueado seu caminho espiritual; não receberão mais revelação. O governo de Deus é um assunto seríssimo! Que Deus nos conceda a graça de reconhecer o que é autoridade, temendo a Deus e não confiando em nós mesmos.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee diz que "a medida do conhecimento que uma pessoa tem da vontade de Deus é a medida de sua autoridade delegada". Quando você lidera ou orienta alguém, você fala a partir do que ouviu de Deus, ou a partir das suas próprias ideias? Como saber a diferença?', 'reflexao', null),
    (v_aula_id, 2, 'O segundo requisito é negar-se a si mesmo — ser quebrantado a ponto de "não abrigar nenhum pensamento ou opinião que seja sua própria" como base da autoridade. Em que área você ainda confia demais nas suas próprias opiniões?', 'reflexao', null),
    (v_aula_id, 3, 'O autor adverte: "jamais tente estabelecer sua própria autoridade... não se apresse, não lute, não fale por si mesmo". Você já se pegou tentando se afirmar como autoridade (no lar, na igreja, no trabalho)? Como Davi, sob Saul, o instrui?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 13 — A principal credencial para delegação de autoridade: Revelação
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 13 — A principal credencial para delegação de autoridade: Revelação', 13,
$conteudo$"Não é assim com o meu servo Moisés, que é fiel em toda a minha casa. Boca a boca falo com ele, claramente, e não por enigmas; pois ele vê a forma do Senhor; como, pois, não temestes falar contra o meu servo, contra Moisés?" (Nm 12.7-8).

Nenhuma autoridade delegada por Deus no Velho Testamento foi maior do que a de Moisés; consequentemente podemos usá-lo como exemplo. Antes do período em que Deus lhe concedeu autoridade, Moisés matou um egípcio e repreendeu os hebreus porque brigavam. Quando foi desafiado por um hebreu ("Quem te pôs por príncipe e juiz sobre nós?"), Moisés perturbou-se e fugiu. Nessa ocasião ainda não experimentara a cruz e a ressurreição; tudo fazia através de suas forças naturais. Embora fosse rápido em repreender e ainda mais corajoso para matar, por dentro era fraco e vazio. Quando provado, ficou com medo e fugiu para o deserto de Midiã. Ali, durante quarenta anos, aprendeu lições. Depois desse longo período de provações, Deus lhe deu certo dia uma visão da sarça ardente. Com esta visão, Deus lhe concedeu autoridade.

NÃO DÊ OUVIDOS A PALAVRAS CALUNIOSAS

Quando Arão e Miriã falaram contra Moisés e rejeitaram sua autoridade delegada, a Bíblia simplesmente registra: "O Senhor o ouviu." Foi como se Moisés não tivesse tomado conhecimento. Encontramos aqui um homem que não se perturbava com as palavras dos homens, pois estava além do alcance de suas palavras caluniosas. Todos aqueles que desejam ser porta-vozes de Deus e desejam ajudar seus irmãos e irmãs devem aprender a não dar ouvidos a calúnias. Que Deus se encarregue disso. De sua parte, não dê a menor atenção às críticas das pessoas; não se zangue por causa das palavras dos outros. Aqueles que se perturbam e se sentem esmagados por palavras caluniosas provam que não têm capacidade para receber autoridade delegada.

NÃO SE DEFENDA

Vingança ou defesa ou qualquer outra reação deve proceder de Deus, não do homem. Aquele que se vinga não conhece a Deus. Ninguém sobre a face da terra jamais poderia ter mais autoridade do que Cristo, mas ele jamais se defendeu. A autoridade e a autodefesa são incompatíveis. Aquele contra o qual você se defende torna-se o seu juiz. Aquele que fala de si mesmo está sob julgamento; portanto não tem autoridade. Sempre que uma pessoa tenta se justificar, perde a sua autoridade. No momento em que você se justifica diante de uma pessoa, ela se torna o seu juiz.

MUITO MANSO

O versículo de Números 12 declara, como um parêntese: "Era o varão Moisés mui manso, mais do que todos os homens que havia sobre a terra." Moisés não argumentou porque percebeu que tinha errado. Deus não pode conceder autoridade a uma pessoa teimosa. Aqueles que ele estabelece como autoridades são os mansos e sensíveis — e não se trata de uma mansidão comum, é a mansidão divina. Não são os violentos ou os fortes, mas um homem como Paulo — cuja presença física é fraca e cujas palavras não impressionam — que Deus coloca em posição de autoridade. Autoridade obtida através de lutas não é concedida por Deus. As pessoas geralmente presumem que estas coisas são requisitos necessários para ter-se autoridade: esplendor, força de personalidade, boa aparência e poder. Mas não são estes que representam a autoridade; pelo contrário, são carnais. A pessoa menos provável de receber autoridade é geralmente aquela que se considera uma autoridade. Quanto mais autoridade uma pessoa pensa que tem, menos a possui na realidade.

REVELAÇÃO: UMA CREDENCIAL DE AUTORIDADE

Quando Deus convocou abruptamente os três à tenda da congregação, disse a Arão e Miriã: "Ouvi agora as minhas palavras." Isto revelou o fato de que eles nunca tinham ouvido antes as palavras divinas. Disto concluímos claramente que as pessoas que falam muito não podem ouvir a palavra de Deus; só os mansos podem. Embora Arão e Miriã fossem profetas, o Senhor só se lhes revelava em sonhos e visões. Com Moisés era diferente, porque Deus falava com ele boca a boca, claramente, e não por meio de enigmas. Moisés recebeu revelação, não Arão e Miriã; pois são aqueles que se encontram face a face com Deus que ele estabelece como autoridades.

O valor de um homem diante de Deus não se decide pelo julgamento dos outros ou do próprio homem. Ele é medido pela revelação que recebe de Deus. A revelação é a avaliação e a medida divinas. A autoridade se estabelece sobre a revelação de Deus. Se Deus concede revelação, estabelece-se autoridade; mas quando sua revelação é retirada, o homem é rejeitado. Se quisermos aprender a ter autoridade, temos de prestar atenção ao nosso estado diante de Deus. Se Deus está pronto a nos conceder revelação e a nos falar claramente, se temos com ele comunhão face a face, então ninguém pode nos eliminar. O céu aberto é o selo de Deus e o testemunho da filiação.

A revelação, portanto, é evidência de autoridade. Precisamos aprender a não lutar e falar por nós mesmos. Não devemos nos alistar nas fileiras de Arão e Miriã na luta pela autoridade. Na verdade, se lutarmos, só provaremos que nossa autoridade é totalmente carnal, das trevas, e desprovida de visão celestial. Se a nossa autoridade for de Deus, não necessitamos fortalecê-la; a revelação será a prova. Qualquer um que ofenda as autoridades delegadas por Deus ofende àquele que representam.

NENHUM SENTIMENTO PESSOAL

"Como, pois, não temestes falar contra o meu servo, contra Moisés?", perguntou Deus. É assim que Deus manteve sua autoridade, não a autoridade de Moisés. Ele não permite que alguém prejudique sua autoridade. A tenda recusou-se a dar revelação e Miriã ficou leprosa. Mas quando Arão rogou a Moisés, este clamou ao Senhor: "Ó Deus, rogo-te que a cures." Durante todo o caso Moisés agiu como se não fosse mais que um espectador. Não tinha interesse pessoal; não murmurou nem reprovou. Não tinha intenções de julgar ou punir. Mas tão logo o propósito de Deus se realizou, rapidamente perdoou. Autoridade se estabelece para executar ordens de Deus, não para edificação pessoal. Vamos nós também nos libertar de sentimentos pessoais, pois sua presença prejudica os negócios divinos e impede a mão de Deus. Ser autoridade delegada não é de modo nenhum uma coisa fácil, porque exige um esvaziamento do ego.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Diante da calúnia de Arão e Miriã, "Moisés não se defendeu". Nee diz que "aquele contra o qual você se defende torna-se o seu juiz". Quando alguém o critica injustamente, sua reação imediata é defender-se? O que mudaria se você confiasse a defesa a Deus?', 'reflexao', null),
    (v_aula_id, 2, 'A credencial da autoridade não é dom, força ou eloquência, mas revelação — "a comunhão face a face com Deus". Como está, hoje, a sua comunhão com Deus? Você tem recebido dele algo para falar, ou tem falado a partir de si mesmo?', 'reflexao', null),
    (v_aula_id, 3, 'Moisés agiu "como um espectador, sem sentimento pessoal", e logo intercedeu pela irmã que o atacou. Há alguém que o feriu por quem você teria dificuldade de orar com sinceridade? O que o esvaziamento do ego mudaria aí?', 'reflexao', null);
  end if;
end
$migration$;
