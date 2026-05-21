export function Logo({ className = "", variant = "default" }: { className?: string; variant?: "default" | "light" }) {
  const text = variant === "light" ? "#FFFFFF" : "#5E3D17";       // chocolate quente
  const sub = variant === "light" ? "#FBDDC0" : "#B57E2F";        // creme / tostado
  const stroke = variant === "light" ? "#FFFFFF" : "#D55416";     // terracota
  const accent = variant === "light" ? "#FBDDC0" : "#D55416";     // terracota

  return (
    <div className={`flex items-center gap-2.5 ${className}`}>
      <svg
        width="32"
        height="32"
        viewBox="0 0 32 32"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        aria-hidden
      >
        <circle cx="16" cy="16" r="14" stroke={stroke} strokeWidth="1.6" />
        <path
          d="M9 19 L16 11 L23 19"
          stroke={accent}
          strokeWidth="1.8"
          fill="none"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
        <line x1="9" y1="22.5" x2="23" y2="22.5" stroke={text} strokeWidth="1.6" strokeLinecap="round" />
      </svg>
      <div className="leading-none">
        <div className="font-serif text-base font-semibold tracking-wide" style={{ color: text }}>
          Ekballo
        </div>
        <div className="text-[10px] uppercase tracking-[0.22em]" style={{ color: sub }}>
          Academy
        </div>
      </div>
    </div>
  );
}
