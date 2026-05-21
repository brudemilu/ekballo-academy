export function MockBanner() {
  if (process.env.NEXT_PUBLIC_MOCK_MODE !== "true") return null;
  return (
    <div className="border-b border-laranja-200 bg-laranja-50 px-6 py-2 text-center text-xs font-medium text-laranja-800">
      Modo demonstração ativo · Dados fictícios e não persistentes · Para o real, configure o Supabase no <code className="rounded bg-laranja-200 px-1.5 py-0.5">.env.local</code>
    </div>
  );
}
