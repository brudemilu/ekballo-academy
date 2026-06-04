import { redirect } from "next/navigation";

// A tela de WhatsApp foi unificada com a de Mensagens (mesma função).
// Mantém a rota antiga funcionando, redirecionando para o novo lugar.
export default function AdminWhatsAppPage() {
  redirect("/admin/mensagens");
}
