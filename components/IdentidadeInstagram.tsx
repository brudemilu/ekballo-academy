"use client";

import { createContext, type ReactNode, useContext } from "react";
import type { Identidade } from "@/lib/instagram-identidade";

/**
 * A identidade da conta em uso (assinatura e @), para as prévias das artes
 * saírem com a assinatura da conta certa (issue #264). Fora do painel não há
 * provedor: vale a identidade padrão.
 */
const Contexto = createContext<Identidade>({});

export function IdentidadeInstagram({
  identidade,
  children,
}: {
  identidade: Identidade;
  children: ReactNode;
}) {
  return <Contexto.Provider value={identidade}>{children}</Contexto.Provider>;
}

export function useIdentidadeInstagram(): Identidade {
  return useContext(Contexto);
}
