"use client";

import { useEffect, useRef, useState } from "react";

type Props = {
  children: React.ReactNode;
  delay?: 0 | 1 | 2 | 3 | 4;
  className?: string;
  as?: "div" | "section" | "article" | "li";
};

export function RevealOnScroll({ children, delay = 0, className = "", as: Tag = "div" }: Props) {
  const ref = useRef<HTMLDivElement>(null);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (typeof window === "undefined") return;
    if (window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      setVisible(true);
      return;
    }
    const node = ref.current;
    if (!node) return;
    const obs = new IntersectionObserver(
      (entries) => {
        entries.forEach((e) => {
          if (e.isIntersecting) {
            setVisible(true);
            obs.unobserve(e.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: "0px 0px -60px 0px" }
    );
    obs.observe(node);
    return () => obs.disconnect();
  }, []);

  const delayClass = delay > 0 ? `reveal-delay-${delay}` : "";

  // We need a generic wrapper element
  const wrapperClass = `reveal ${delayClass} ${visible ? "is-visible" : ""} ${className}`.trim();

  if (Tag === "section") return <section ref={ref as never} className={wrapperClass}>{children}</section>;
  if (Tag === "article") return <article ref={ref as never} className={wrapperClass}>{children}</article>;
  if (Tag === "li") return <li ref={ref as never} className={wrapperClass}>{children}</li>;
  return <div ref={ref} className={wrapperClass}>{children}</div>;
}
