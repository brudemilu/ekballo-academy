# Perspectivas — carga das lições

Pipeline do curso `perspectivas`. Cada lição vira várias aulas: o guia de
estudo e as leituras que ele indica, na ordem em que o guia as chama
(`Lição N · Guia de estudo — …`, `Lição N · Leitura — Autor: Título`).

**A transcrição é literal.** Só se desfaz o que a EXTRAÇÃO quebrou: espaço
perdido entre palavras, ligadura devolvida como glifo + espaço, hifenização de
fim de linha e ordem das colunas. Caixa, pontuação, prefixos de subseção e até
erro de digitação do original ficam como estão. Sai de propósito só a mobília
de página: cabeçalho corrido, número de página e marca da gráfica.

## 1. Guia de estudo (PDF em ~/Downloads)

```bash
python3 montar-guia.py "Licao 02.pdf" 2 guia02.txt
```

A abertura é em duas colunas (objetivos à esquerda, prosa à direita) e o
`pdftotext` normal embaralha as duas — por isso a página 1 é extraída por
recorte (`-x/-W`). Da página 2 em diante é coluna única com boxes recuados.

## 2. Leituras (links do Dropbox)

O link vem com **download desabilitado**: `curl` só recebe a página de erro. O
que funciona é ler o stream do visualizador.

```bash
npm i playwright-core
CHROME_BIN="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  node pegar-dropbox.mjs "<link>" haw1
```

`pegar-dropbox.mjs` abre num navegador de verdade e guarda `-texto.json` (uma
posição por trecho) e `-pagNN.png`. **Espera o stream chegar antes de rolar** —
rolar às cegas devolve captura vazia. O preview é instável; uma leitura chegou
a precisar de três tentativas. Se falhar, repita.

Depois, conforme a diagramação:

- **Coletânea Perspectivas** (496×694, duas colunas, ACaslon + Calibri) →
  `montar-stott.py` sobre `remontar_stott.py`. Trata a abertura de capítulo,
  onde assinatura e número do capítulo dividem a MESMA linha em lados opostos
  (pela coluna, o número cairia no texto e a assinatura na caixa de bio), a
  letra capitular solta no meio da primeira linha, a caixa de bio na lateral, a
  caixa "Perguntas para estudo" atravessando as colunas e as notas de rodapé.
  Capítulo partido em vários PDFs: só o primeiro tem `abertura=True`.
- **Qualquer outra** (A4 em Arial, A5 em Calibri…) → `montar-leitura.py` sobre
  `remontar_generico.py`, que descobre colunas, cabeçalho corrido e recuo a
  partir do próprio documento. Alguns PDFs mandam **cada letra como um trecho
  separado, sem espaço**: o espaço sai do vão horizontal, com corte adaptativo
  por linha (o tracking do título é diferente do corpo).

## 3. Conferir antes de subir

```bash
python3 -c "from auditar2 import auditar; ..."
```

`auditar2.py` compara o CONJUNTO de caracteres da fonte com o do texto montado.
É insensível à ordem de propósito: a remontagem reordena (coluna esquerda antes
da direita, caixa de perguntas por último) e um diff sequencial acusaria isso
como perda. O resultado tem de fechar em **zero letras faltando** — sobram só
hífens de fim de linha e números de página.

## 4. Subir

Gerar `NNN_*.sql` (DO block idempotente, dollar-quoting) e aplicar no box; ver
`reference-subir-livro` na memória. Conteúdo é DB-driven e aparece na hora;
capa e figuras dependem de rebuild da imagem.
