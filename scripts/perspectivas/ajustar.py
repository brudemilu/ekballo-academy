# -*- coding: utf-8 -*-
"""Ajustes finos no conteudo montado: diagrama, salmo, cabecalhos coladados."""
import io, re

ps = io.open("licao01-conteudo.txt", encoding="utf-8").read().strip().split("\n\n")

SALMO = """Salmo 67
1 Que Deus tenha misericórdia de nós e nos abençoe, e faça resplandecer o seu rosto sobre nós, Pausa
2 para que sejam conhecidos na terra os teus caminhos, a tua salvação entre todas as nações.
3 Louvem-te os povos, ó Deus; louvem-te todos os povos.
4 Exultem e cantem de alegria as nações, pois governas os povos com justiça e guias as nações na terra. Pausa
5 Louvem-te os povos, ó Deus; louvem-te todos os povos.
6 Que a terra dê a sua colheita, e Deus, o nosso Deus, nos abençoe!
7 Que Deus nos abençoe, e o temam todos os confins da terra."""

FIGURA = ("[figura] /figuras/perspectivas/cumprimento-progressivo.png | "
          "O Cumprimento Progressivo da Promessa de Deus")

# O diagrama é uma imagem, mas os rótulos dele são texto no PDF. Vão logo
# abaixo da figura, na ordem da linha do tempo, pra que nenhuma palavra do
# original fique existindo só dentro da imagem.
ROTULOS_FIGURA = (
    "[cite] Primeiro cumprimento: A vida de Abraão (e a nação hebraica que o seguiu)\n"
    "2000 a.C.\n"
    "Segundo cumprimento: A vinda de Cristo (e a família de fé que o seguiu)\n"
    "33 d.C.\n"
    "Terceiro e completo cumprimento: O fim dos tempos\n"
    "2000 d.C."
)

LIXO_DIAGRAMA = ("Primeiro cumprimento", "33 d.C.", "2000 a.C.",
                 "Segundo cumprimento", "O Cumprimento Progressivo")

CABECALHOS_COLADOS = ["Para os Povos: Bênção", "A Deus: A Glória na Adoração",
                      "Contra o Mal: Seu Reino"]

out, i, figura_posta, salmo_posto = [], 0, False, False
while i < len(ps):
    p = ps[i].strip()
    corpo = p[7:] if p.startswith("[cite] ") else p

    # diagrama da linha do tempo -> uma figura so
    if any(corpo.startswith(x) for x in LIXO_DIAGRAMA):
        if not figura_posta:
            out.append(FIGURA)
            out.append(ROTULOS_FIGURA)
            figura_posta = True
        i += 1
        continue

    # o salmo veio picado pelas colunas do poema -> um bloco de citacao
    if corpo.startswith("Salmo 67 1 Que Deus"):
        out.append("[cite] " + SALMO)
        salmo_posto = True
        while i < len(ps) and "temam todos os confins" not in ps[i]:
            i += 1
        i += 1
        continue

    # cabecalho colado no inicio do paragrafo
    achou = next((c for c in CABECALHOS_COLADOS if corpo.startswith(c + " ")), None)
    if achou:
        out.append(achou)
        out.append(corpo[len(achou):].strip())
        i += 1
        continue

    # divisorias do guia sao secao, nao box
    # divisórias do guia são seção, não box — texto como está no original
    if corpo in ("CONLUSÃO DO NÍVEL BÁSICO",
                 "CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO"):
        out.append(corpo); i += 1; continue

    out.append(p)
    i += 1

assert figura_posta and salmo_posto, "diagrama ou salmo nao encontrados"
io.open("licao01-conteudo.txt", "w", encoding="utf-8").write("\n\n".join(out) + "\n")
print("paragrafos:", len(out))
