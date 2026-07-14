import json
import re
import subprocess


DATA_PATH = "/opt/ekballo-supabase/source-backup/current/data.sql"

container_id = subprocess.check_output(
    "docker ps -q --filter name=ekballo-supabase_db | head -1",
    shell=True,
    text=True,
).strip()

query = """
select coalesce(
  json_agg(
    json_build_object(
      'schema', table_schema,
      'table', table_name,
      'column', column_name
    ) order by table_schema, table_name, ordinal_position
  ),
  '[]'::json
)
from information_schema.columns
"""

raw_columns = subprocess.check_output(
    [
        "docker",
        "exec",
        container_id,
        "psql",
        "-U",
        "postgres",
        "-d",
        "postgres",
        "-Atc",
        query,
    ],
    text=True,
)

target: dict[tuple[str, str], list[str]] = {}
for item in json.loads(raw_columns):
    target.setdefault((item["schema"], item["table"]), []).append(item["column"])

with open(DATA_PATH, encoding="utf-8") as data_file:
    lines = data_file.readlines()

copy_header = re.compile(r"^COPY ([^.]+)\.([^ ]+) \((.*)\) FROM stdin;$")
issues = []
index = 0

while index < len(lines):
    match = copy_header.match(lines[index].rstrip("\n"))
    if not match:
        index += 1
        continue

    schema, table, raw_source_columns = match.groups()
    schema = schema.strip('"')
    table = table.strip('"')
    source_columns = [
        column.strip().strip('"') for column in raw_source_columns.split(",")
    ]
    end = index + 1
    while end < len(lines) and lines[end].rstrip("\n") != r"\.":
        end += 1

    target_columns = target.get((schema, table))
    missing_table = target_columns is None
    missing_columns = (
        []
        if missing_table
        else [column for column in source_columns if column not in target_columns]
    )

    if missing_table or missing_columns:
        issues.append(
            {
                "table": f"{schema}.{table}",
                "rows": end - index - 1,
                "missing_table": missing_table,
                "missing_columns": missing_columns,
            }
        )

    index = end + 1

print(json.dumps(issues, indent=2))
