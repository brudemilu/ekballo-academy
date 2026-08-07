import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";
import { permissaoDaRota, rotaSoMaster, podeVerAgenda } from "@/lib/permissoes";

export async function updateSession(request: NextRequest) {
  // Em modo mock, libera tudo (sem bater no Supabase)
  if (process.env.NEXT_PUBLIC_MOCK_MODE === "true") {
    return NextResponse.next({ request });
  }

  let supabaseResponse = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet: { name: string; value: string; options?: Record<string, unknown> }[]) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          );
          supabaseResponse = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  const {
    data: { user },
  } = await supabase.auth.getUser();

  const path = request.nextUrl.pathname;
  const pendingRedirect = (targetPath: string) => {
    const url = request.nextUrl.clone();
    url.pathname = "/login";
    url.searchParams.set("next", targetPath);
    url.searchParams.set("pendente", "1");
    return NextResponse.redirect(url);
  };
  const isProtectedAluno =
    path.startsWith("/dashboard") ||
    path.startsWith("/cursos") ||
    path.startsWith("/perfil");
  const isProtectedAdmin = path.startsWith("/admin");
  const isAuthPage = path === "/login" || path === "/cadastro";

  if (!user && (isProtectedAluno || isProtectedAdmin)) {
    const url = request.nextUrl.clone();
    url.pathname = "/login";
    url.searchParams.set("next", path);
    return NextResponse.redirect(url);
  }

  if (user && isProtectedAluno) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_admin, acesso_liberado")
      .eq("id", user.id)
      .single();

    if (!profile?.is_admin && profile?.acesso_liberado !== true) {
      return pendingRedirect(path);
    }
  }

  if (user && isAuthPage) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_admin, acesso_liberado")
      .eq("id", user.id)
      .single();

    if (profile?.is_admin || profile?.acesso_liberado === true) {
      const url = request.nextUrl.clone();
      url.pathname = "/dashboard";
      return NextResponse.redirect(url);
    }
  }

  if (user && isProtectedAdmin) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_admin, papel, acesso_liberado")
      .eq("id", user.id)
      .single();

    // Agenda pessoal: master + e-mails liberados (ex.: Débora) — mesmo sem ser
    // admin. Tratado ANTES do gate geral; só vale para /admin/agenda.
    if (path.startsWith("/admin/agenda")) {
      if (podeVerAgenda(profile?.papel, profile?.is_admin, user.email)) {
        return supabaseResponse;
      }
      const url = request.nextUrl.clone();
      url.pathname = profile?.is_admin ? "/admin" : "/dashboard";
      return NextResponse.redirect(url);
    }

    if (!profile?.is_admin) {
      const url = request.nextUrl.clone();
      url.pathname = "/dashboard";
      return NextResponse.redirect(url);
    }

    // Gating granular por papel. Registros antigos sem papel = master (legado).
    const papel = (profile.papel as string) || "master";
    if (papel !== "master") {
      const negar = () => {
        const url = request.nextUrl.clone();
        url.pathname = "/admin";
        return NextResponse.redirect(url);
      };
      if (rotaSoMaster(path)) return negar();
      const perm = permissaoDaRota(path);
      if (perm) {
        const { data: temPerm } = await supabase
          .from("papel_permissoes")
          .select("permissao")
          .eq("papel", papel)
          .eq("permissao", perm)
          .maybeSingle();
        if (!temPerm) return negar();
      }
    }
  }

  // Admin entrando na home de aluno: redireciona pro painel admin (porta única).
  if (user && path === "/dashboard") {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_admin")
      .eq("id", user.id)
      .single();
    if (profile?.is_admin) {
      const url = request.nextUrl.clone();
      url.pathname = "/admin";
      return NextResponse.redirect(url);
    }
  }

  return supabaseResponse;
}
