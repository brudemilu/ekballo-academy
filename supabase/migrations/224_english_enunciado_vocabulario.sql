-- =============================================================
-- EKBALLO ENGLISH · O enunciado do vocabulário dizia o que não fazia
--
-- Os cartões de vocabulário traziam "Ouça e repita". Mas ali o app
-- só toca o áudio e segue — não há microfone, não há avaliação, e
-- portanto ninguém diz ao aluno se a pronúncia saiu certa. Enunciado
-- que promete correção e não corrige mina a confiança no curso
-- inteiro.
--
-- Quem escuta e corrige é o exercício do tipo `falar`, que continua
-- dizendo "Fale em voz alta" — e ali a promessa se cumpre.
-- =============================================================

update english_exercicios
   set enunciado = 'Ouça a pronúncia'
 where tipo = 'vocabulario' and enunciado = 'Ouça e repita';
