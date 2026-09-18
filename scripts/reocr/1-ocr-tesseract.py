import sys, fitz, subprocess, os, tempfile
pdf, out = sys.argv[1], sys.argv[2]
doc = fitz.open(pdf)
parts = []
for i, page in enumerate(doc):
    pix = page.get_pixmap(dpi=300, colorspace=fitz.csGRAY)
    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as fh:
        fh.write(pix.tobytes("png")); tmp = fh.name
    try:
        r = subprocess.run(["tesseract", tmp, "stdout", "-l", "por", "--psm", "6"],
                           capture_output=True, text=True)
        parts.append(r.stdout)
    finally:
        os.unlink(tmp)
    if (i+1) % 20 == 0:
        print(f"{os.path.basename(out)}: {i+1}/{len(doc)}", flush=True)
open(out, "w", encoding="utf-8").write("\f".join(parts))
print(f"PRONTO {os.path.basename(out)}: {len(doc)} páginas, {sum(len(p) for p in parts)} chars", flush=True)
