import re


SOURCE = "/opt/ekballo-supabase/source-backup/current/data.sql"
TARGET = "/opt/ekballo-supabase/source-backup/current/data.compat.sql"
SKIP_TABLES = {
    ("auth", "custom_oauth_providers"),
    ("storage", "buckets_vectors"),
    ("storage", "vector_indexes"),
}

copy_header = re.compile(r'^COPY "?([^"]+)"?\."?([^" ]+)"? \(.*\) FROM stdin;$')

with open(SOURCE, encoding="utf-8") as source, open(
    TARGET, "w", encoding="utf-8"
) as target:
    skipping = False
    for line in source:
        if not skipping:
            match = copy_header.match(line.rstrip("\n"))
            if match and match.groups() in SKIP_TABLES:
                skipping = True
                target.write(
                    f"-- Skipped empty incompatible COPY block for "
                    f"{match.group(1)}.{match.group(2)}\n"
                )
                continue
            target.write(line)
            continue

        if line.rstrip("\n") == r"\.":
            skipping = False

if skipping:
    raise RuntimeError("unterminated COPY block")
