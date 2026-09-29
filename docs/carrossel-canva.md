# Carrossel de Instagram no Canva

Como montar os carrosséis da Ekballo usando os modelos-mestre do Canva, em vez
da rota OG/Satori (`app/api/og/instagram/route.tsx`).

**Por que existe:** o template `papel` do Satori (`lib/instagram-render.tsx`) chegou
no teto do que a biblioteca faz — Satori não estica SVG, ignora `text-decoration`
e não tem máscara nem blend, então a peça sai sempre "papel creme + navy +
dourado + pincelada PNG". O Canva entrega o acabamento que faltava. O gerador
antigo continua no ar e funcionando; este é o caminho para as peças caprichadas.

## A regra que não pode ser quebrada

**Nunca gere um slide com `generate-design`.** Testado em 10 chamadas (set/2026):
7 saíram inutilizáveis. Modos de falha observados:

- traduziu o texto pro inglês, mesmo com o texto exato em PT-BR no prompt (3x)
- inventou frase de propaganda que não estava no briefing ("Junte-se ao
  ministério Ekballo", "DESCUBRA MAIS SOBRE NÓS")
- repetiu a mesma linha em dois lugares do slide
- ignorou o briefing inteiro e devolveu sans-serif preta com badge
- escala quebrada (texto minúsculo no canto)

E, mesmo quando um slide sai bom, **dois slides gerados na sequência não
combinam entre si** — que é justamente o que um carrossel precisa.

O `generate-design` serve só pra criar um modelo NOVO do zero, uma vez, quando
a gente quiser mudar a estética base. Aí sim: gera 4 candidatos, escolhe o bom,
e ele vira modelo-mestre.

## Como montar um carrossel (o fluxo que funciona)

1. Escolha o modelo pela emoção do texto (tabela de paletas abaixo).
2. `copy-design` do modelo, **uma cópia por slide**.
3. `read-design` com `open_transaction: true` em cada cópia.
4. `edit-design` com três `replace_text`, nos locators da tabela abaixo.
5. `edit-design` com `finalize: "commit"` (chamada separada — o Canva recusa
   operações junto do commit).
6. `export-design` em PNG 1080x1350.

Os `locator_id` **sobrevivem à cópia** — são os mesmos em todos os modelos, o
que é o que faz esse fluxo ser previsível.

## Estrutura do slide

Três blocos de texto, sempre nesta gramática:

| Papel | locator_id | Tamanho | Limite prático |
|---|---|---|---|
| Frase de cima | `PBcYd2V9g2Fh2ssc-LBYGVx5hWdJvbQlx` | 171 px | até ~34 caracteres (quebra em 2 linhas, tudo bem) |
| Conector do meio | `PBcYd2V9g2Fh2ssc-LBDVQm2wzdfzJvtj` | 139 px | **máximo ~11 caracteres** |
| Palavra de baixo | `PBcYd2V9g2Fh2ssc-LBgw5cDrgCGmfdQX` | 249 px | até ~10 caracteres |

**A pegadinha do conector:** passando de ~11 caracteres ele quebra em duas
linhas, cresce pra baixo (a caixa é ancorada no topo) e colide com a palavra
grande, deixando as duas ilegíveis. Aconteceu com "Ele escolhe os" (14) e
"o preparo vem" (13); resolvido cortando pra "Ele escolhe" e "o preparo".

O id da página é `PBcYd2V9g2Fh2ssc` em todos os modelos.

## Paletas por momento

| Momento | Modelo | design_id | Papel | Tinta |
|---|---|---|---|---|
| Graça, consolo, descanso | Petróleo/rosa (mestre) | `DAHUQDV1G3Y` | original, sem camada | `#e8b09f` |
| Chamado, envio, coragem | Terra/âmbar | `DAHUQIPAmsg` | `#A85A28` a 55% | `#F5DCAE` |
| Lamento, espera, escuridão | Azul-noite/creme | `DAHUQHEXErg` | `#1B2A4A` a 48% | `#F2E8D5` |
| Esperança, promessa, colheita | Verde/dourado | `DAHUQNMMiNw` | `#4A5A2B` a 55% | `#EFD9A0` |

Pasta no Canva: <https://www.canva.com/folder/FAHUQD8YNRM>

### Como uma paleta nova é feita

Não se gera: **deriva-se do mestre**, para o papel amassado, a foto colada e a
tipografia continuarem idênticos. Numa transação só:

1. `insert_shape` full-bleed — `path: "M 0 0 H 1080 V 1350 H 0 Z"`,
   `view_box` 1080x1350, a cor do papel, `opacity` da tabela, `stroke_weight: 0`.
2. `layer_element` `position: "front"` nos três textos, nesta ordem: frase de
   cima, conector, palavra de baixo. Sem isso a camada de cor cobre o texto —
   `layer_element` só aceita `front`/`back`, então é preciso subir os textos em
   vez de descer a camada.
3. `format_text` com a cor da tinta nos três.

A camada tinge o papel **e** a foto colada junto, o que é bom: unifica a
colagem. Mas cuidado com opacidade alta em cor escura — a 62% o azul-noite
engoliu a figura da foto; 48% ficou certo.

## Limitação atual

O app **não** fala com o Canva — quem chama é o Claude, pela sessão. Para o
`/admin/instagram` gerar sozinho, seria preciso a Canva Connect API com OAuth
próprio, e o autofill de brand template normalmente exige plano Enterprise
(não verificado na conta do Bruno). Enquanto isso, o caminho é: Claude monta e
exporta os PNGs, e a publicação segue pelo fluxo que já existe
(`lib/instagram-publish.ts`).
