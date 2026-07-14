#!/bin/bash
cd /Users/brunofernandes/Projects/ekballo-academy
for slug in a-obra-consumada-de-cristo qual-a-missao-da-igreja cosmovisoes-em-conflito reflexoes-cristas-lewis a-lideranca-pastoral maturidade-espiritual-do-lider ate-que-sejamos-um esperanca-em-tempos-de-medo chega-de-regras nao-apagueis-o-espirito para-que-todos-sejam-um o-espirito-santo-consolador surpreendido-por-deus ate-que-nada-mais-importe como-orar-lewis paixao-pelas-almas cristao-contagiante plantar-igrejas pastoreando-coracao-crianca os-clas-da-lua as-cronicas-de-narnia; do
  echo "########## $slug ##########"
  node scripts/gerar-leituras.mjs --slug=$slug
done
echo "########## FIM ##########"
