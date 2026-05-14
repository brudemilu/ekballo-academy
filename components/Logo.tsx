export function Logo({ className = "" }: { className?: string }) {
  return (
    <div className={`flex items-center gap-2 ${className}`}>
      <svg
        width="28"
        height="28"
        viewBox="0 0 32 32"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        aria-hidden
      >
        <circle cx="16" cy="16" r="14" stroke="#5C3A2E" strokeWidth="1.5" />
        <path
          d="M9 18 L16 11 L23 18"
          stroke="#C8A876"
          strokeWidth="1.5"
          fill="none"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
        <line x1="9" y1="22" x2="23" y2="22" stroke="#5C3A2E" strokeWidth="1.5" strokeLinecap="round" />
      </svg>
      <div className="leading-none">
        <div className="font-serif text-base font-semibold tracking-wide text-mesa-700">
          Ekballo
        </div>
        <div className="text-[10px] uppercase tracking-[0.2em] text-mesa-500">
          Academy
        </div>
      </div>
    </div>
  );
}
