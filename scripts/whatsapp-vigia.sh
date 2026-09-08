#!/usr/bin/env bash
# =============================================================
# VIGIA DA CONEXÃO DO WHATSAPP · roda no cron do box, de 3 em 3 minutos
#
# Por que existe: em 04/set/2026 o socket do WhatsApp morreu e a plataforma
# ficou QUATRO DIAS muda — devocional dos grupos, lembrete da agenda,
# boas-vindas, recuperação de senha — sem ninguém perceber, porque nada
# olhava a conexão. A queda só apareceu quando notaram que o devocional não
# chegava.
#
# POR QUE NO HOST, E NÃO NO APP: o único conserto que funciona é recriar o
# container da Evolution. Dar ao container do Next — que está exposto à
# internet — acesso ao socket do Docker seria trocar uma queda de WhatsApp
# por um risco de root na máquina. O app detecta e mostra; o host conserta.
#
# DUAS ARMADILHAS QUE DEFINEM ESTE SCRIPT:
#
#  1. Quase tudo na API da Evolution MENTE quando o socket morre. Medido em
#     07/set/2026, com o socket comprovadamente morto:
#        connectionState        -> "open"           (mentira)
#        chat/whatsappNumbers   -> 200, exists:true (mentira, vem do cache)
#        fetchProfilePictureUrl -> 200              (mentira, vem do cache)
#        group/findGroupInfos   -> "Connection Closed"  <- a única verdade
#     Por isso a sonda pede metadado de GRUPO (via edge function): é uma
#     consulta que atravessa o socket e que a Evolution não responde de cache.
#
#  2. `POST /instance/restart` NÃO conserta esse tipo de morte. Testado em
#     07/set: devolveu 200 com state "open" e o socket seguiu morto por 60s.
#     Recriar a task do Swarm resolveu em menos de 10 segundos. É por isso
#     que o reparo aqui é `docker service update --force`, e não a API.
#
# As credenciais sobrevivem à recriação (DATABASE_SAVE_DATA_INSTANCE=true e
# o volume ekb_evo_instances), então o reparo não pede QR.
# =============================================================
set -uo pipefail

APP_ENV=/opt/ekballo-app/.env
SERVICO_EVOLUTION=ekballo-evolution_evolution
APP_URL=https://ekballo.escoladodiscipuloimw.com.br
ESTADO_DIR=/var/lib/ekballo-vigia
LOG=/var/log/ekballo-vigia.log

# Não insistir num reparo que acabou de acontecer: se recriar o container não
# resolveu, refazer isso a cada 3 minutos só castiga a Evolution.
COOLDOWN_REPARO=$((10 * 60))
INTERVALO_ALERTA=$((60 * 60))

mkdir -p "$ESTADO_DIR"
registrar_log() { echo "$(date -Is) $*" >> "$LOG"; }

# O reparo leva ~40s; o cron chama de 3 em 3 min. Sem trava, uma rodada lenta
# se atropelaria com a seguinte e recriaria o container duas vezes.
exec 9>"${ESTADO_DIR}/lock" 2>/dev/null || true
flock -n 9 || exit 0

# --- configuração (nunca ecoar: são segredos) ---------------------------
[ -r "$APP_ENV" ] || { registrar_log "ERRO: $APP_ENV ilegível"; exit 1; }
set -a; . "$APP_ENV"; set +a
GRUPO=$(printf '%s' "${DEVOCIONAL_GRUPO_JID:-}" | tr ', ' '\n' | grep '@g.us' | head -1)
if [ -z "${INTERNAL_SECRET:-}" ] || [ -z "${SUPABASE_FUNCTIONS_URL:-}" ] || [ -z "$GRUPO" ]; then
  registrar_log "ERRO: falta INTERNAL_SECRET, SUPABASE_FUNCTIONS_URL ou grupo de referência"
  exit 1
fi

container_db() { docker ps -qf name=ekballo-supabase_db | head -1; }

# Histórico é conveniência, não requisito: se a tabela não existir, o vigia
# continua consertando. Nunca deixar o log derrubar o reparo.
anotar() { # status, estado, detalhe
  local db; db=$(container_db); [ -n "$db" ] || return 0
  local st="${1//\'/}" es="${2//\'/}" de="${3//\'/}"
  docker exec -i "$db" psql -U postgres -d postgres -v ON_ERROR_STOP=0 -q -c \
    "insert into public.whatsapp_vigia (status, estado, detalhe) values ('$st','$es','$de');" \
    >/dev/null 2>&1 || true
}

# --- sonda: a única pergunta que a Evolution não responde de cache -------
# Devolve 0 (vivo), 1 (socket morto CONFIRMADO), 2 (inconclusivo).
sondar() {
  local resp
  resp=$(curl -s --max-time 25 -X POST "${SUPABASE_FUNCTIONS_URL}/whatsapp-instancia" \
    -H 'Content-Type: application/json' -H "x-internal-secret: ${INTERNAL_SECRET}" \
    -d "{\"acao\":\"sonda\",\"grupo\":\"${GRUPO}\"}") || return 2
  SONDA_ESTADO=$(printf '%s' "$resp" | sed -n 's/.*"estado":"\([^"]*\)".*/\1/p')
  case "$resp" in
    *'"vivo":true'*)         return 0 ;;
    *'"socket_morto":true'*) return 1 ;;
    # Falha sem "Connection Closed" (JID errado, edge fora) NÃO é morte de
    # socket. Recriar container por causa disso trocaria um erro de
    # configuração por um loop de restart.
    *)                       return 2 ;;
  esac
}

agora=$(date +%s)
leia_marca() { [ -f "$1" ] && cat "$1" || echo 0; }

sondar; veredito=$?
SONDA_ESTADO=${SONDA_ESTADO:-desconhecido}

# --- socket vivo ---------------------------------------------------------
if [ $veredito -eq 0 ]; then
  # Silêncio quando está tudo bem: só a VOLTA vira registro.
  if [ -f "$ESTADO_DIR/caido" ]; then
    desde=$(leia_marca "$ESTADO_DIR/caido")
    rm -f "$ESTADO_DIR/caido"
    anotar ok "$SONDA_ESTADO" "conexão restabelecida (ficou ~$(( (agora - desde) / 60 )) min fora)"
    registrar_log "VOLTOU (fora por ~$(( (agora - desde) / 60 )) min)"
  fi
  exit 0
fi

# --- sonda inconclusiva: não culpar o socket ----------------------------
if [ $veredito -eq 2 ]; then
  registrar_log "sonda inconclusiva (estado=$SONDA_ESTADO) — sem reparo"
  exit 0
fi

# --- socket morto CONFIRMADO --------------------------------------------
[ -f "$ESTADO_DIR/caido" ] || echo "$agora" > "$ESTADO_DIR/caido"
registrar_log "SOCKET MORTO (estado=$SONDA_ESTADO)"

ultimo_reparo=$(leia_marca "$ESTADO_DIR/ultimo_reparo")
if [ $((agora - ultimo_reparo)) -lt $COOLDOWN_REPARO ]; then
  registrar_log "reparo recente — aguardando janela"
  exit 0
fi

echo "$agora" > "$ESTADO_DIR/ultimo_reparo"
registrar_log "reparando: recriando $SERVICO_EVOLUTION"
docker service update --force --quiet "$SERVICO_EVOLUTION" >/dev/null 2>&1

# O Baileys volta em ~10s; damos até 60s antes de desistir.
voltou=1
for _ in 1 2 3 4 5 6; do
  sleep 10
  if sondar; then voltou=0; break; fi
done

if [ $voltou -eq 0 ]; then
  # O webhook de recebimento NÃO sobrevive à recriação. Sem re-registrar, a
  # plataforma volta a falar e para de escutar: "agendar pelo WhatsApp"
  # morreria calado — exatamente o tipo de falha que este vigia existe para
  # impedir.
  wh=$(curl -s --max-time 25 -o /dev/null -w '%{http_code}' -X POST "${APP_URL}/api/admin/whatsapp" \
        -H 'Content-Type: application/json' -H "x-internal-secret: ${INTERNAL_SECRET}" \
        -d '{"acao":"webhook"}')
  rm -f "$ESTADO_DIR/caido"
  anotar reparado "$SONDA_ESTADO" "container recriado; socket voltou; webhook re-registrado (HTTP $wh)"
  registrar_log "REPARADO (webhook HTTP $wh)"
  exit 0
fi

# --- não voltou: avisar gente de verdade ---------------------------------
# Por e-mail, não por WhatsApp: o canal natural de aviso é justamente o que
# está fora. Push não serve — não há assinatura de push de admin cadastrada.
registrar_log "REPARO FALHOU — socket segue morto"
ultimo_alerta=$(leia_marca "$ESTADO_DIR/ultimo_alerta")
if [ $((agora - ultimo_alerta)) -ge $INTERVALO_ALERTA ]; then
  echo "$agora" > "$ESTADO_DIR/ultimo_alerta"
  db=$(container_db)
  emails=$(docker exec -i "$db" psql -U postgres -d postgres -tAc \
            "select email from public.profiles where is_admin and coalesce(email,'') <> '';" 2>/dev/null)
  for e in $emails; do
    curl -s --max-time 25 -o /dev/null -X POST "${SUPABASE_FUNCTIONS_URL}/enviar-email" \
      -H 'Content-Type: application/json' -H "x-internal-secret: ${INTERNAL_SECRET}" \
      -d "{\"destinatario\":\"${e}\",\"assunto\":\"⚠️ WhatsApp da plataforma fora do ar\",\"html\":\"<p>O vigia detectou o socket do WhatsApp morto e recriar o container <b>não</b> resolveu.</p><p>Enquanto isso <b>nada sai</b>: devocional dos grupos, lembrete da agenda, boas-vindas e recuperação de senha ficam parados.</p><p>Abra <a href='${APP_URL}/admin/mensagens'>/admin/mensagens</a>. Se estiver pedindo QR, o número foi desvinculado e precisa ser pareado de novo.</p>\"}"
  done
  anotar alerta "$SONDA_ESTADO" "reparo não resolveu — admins avisados por e-mail"
  registrar_log "alerta enviado"
fi
exit 0
