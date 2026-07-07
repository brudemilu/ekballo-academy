// Seções da vitrine de cursos (categoria simples em `cursos.categoria`).
// Esta é a fonte única da ordem e dos rótulos — dashboard e admin importam daqui.
// O valor guardado no banco é o `slug`; o `label` é o que aparece na tela.
import type { Curso } from "./types";

export type CategoriaSlug =
  | "lideranca"
  | "pastoral"
  | "discipulado"
  | "ensino"
  | "espiritual"
  | "leitura"
  | "infantil";

export type Categoria = { slug: CategoriaSlug; label: string };

// Ordem de exibição das seções na vitrine.
export const CATEGORIAS: Categoria[] = [
  { slug: "lideranca", label: "Liderança" },
  { slug: "pastoral", label: "Pastoral & Cuidado" },
  { slug: "discipulado", label: "Discipulado" },
  { slug: "ensino", label: "Ensino & Doutrina" },
  { slug: "espiritual", label: "Espiritual" },
  { slug: "leitura", label: "Leitura" },
  { slug: "infantil", label: "Infantil" },
];

// Rótulo da "seção" pra cursos ainda sem categoria definida (cai no fim).
export const SEM_CATEGORIA_LABEL = "Outros";

export function labelDaCategoria(slug?: string | null): string {
  return CATEGORIAS.find((c) => c.slug === slug)?.label ?? SEM_CATEGORIA_LABEL;
}

// Agrupa uma lista de cursos por seção, respeitando a ordem de CATEGORIAS e,
// dentro de cada seção, a `ordem` original. Cursos sem categoria (ou com valor
// desconhecido) vão pra uma seção "Outros" no fim. Seções vazias são omitidas.
export function agruparPorCategoria<T extends Pick<Curso, "categoria" | "ordem">>(
  cursos: T[],
): { label: string; cursos: T[] }[] {
  const grupos: { label: string; cursos: T[] }[] = [];
  for (const { slug, label } of CATEGORIAS) {
    const doGrupo = cursos.filter((c) => c.categoria === slug);
    if (doGrupo.length > 0) grupos.push({ label, cursos: doGrupo });
  }
  const conhecidas = new Set(CATEGORIAS.map((c) => c.slug as string));
  const outros = cursos.filter((c) => !c.categoria || !conhecidas.has(c.categoria));
  if (outros.length > 0) grupos.push({ label: SEM_CATEGORIA_LABEL, cursos: outros });
  return grupos;
}
