#!/bin/bash
cd /Users/brunofernandes/Projects/ekballo-academy
for slug in grande-divorcio milagres peso-da-gloria o-deus-que-destroi-sonhos cristao-inutil; do
  echo "########## $slug ##########"
  node scripts/gerar-leituras.mjs --slug=$slug
done
echo "########## FIM ##########"
