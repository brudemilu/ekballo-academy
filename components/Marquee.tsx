export function Marquee({ items }: { items: string[] }) {
  // Repeat content twice for seamless loop
  const repeated = [...items, ...items];
  return (
    <div className="overflow-hidden border-y border-bege-200 bg-bege-100/60 py-4">
      <div className="marquee-track gap-12 px-6">
        {repeated.map((item, i) => (
          <span
            key={i}
            className="flex items-center gap-12 text-sm font-medium uppercase tracking-[0.25em] text-bege-700"
          >
            {item}
            <span className="text-laranja-500">●</span>
          </span>
        ))}
      </div>
    </div>
  );
}
