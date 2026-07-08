#!/bin/bash
cd "$(dirname "$0")/.."
SLUGS=(fogo-no-parquinho nascimento-casamento-morte como-flechas a-cultura-do-jejum 99-nao-e-100 \
 manso-e-humilde meu-amigo-espirito-santo o-que-cristo-pensa-da-igreja temperamentos-transformados \
 temperamento-controlado-espirito o-evangelho-stott o-discipulo-stott a-biblia-stott a-igreja-stott \
 o-mundo-stott o-problema-da-dor o-grande-abismo prefacio-ao-paraiso-perdido perdoar \
 uma-vida-com-propositos a-divina-revelacao-do-ceu a-divina-revelacao-do-inferno a-anatomia-de-uma-dor \
 entendes-o-que-les cansei o-jonas-que-vive-em-mim nada-mais-importa)
for s in "${SLUGS[@]}"; do
  echo "===== $s ====="
  node scripts/gerar-leituras.mjs --slug="$s"
done
echo "=== LOTE 27 NOVOS CONCLUÍDO ==="
