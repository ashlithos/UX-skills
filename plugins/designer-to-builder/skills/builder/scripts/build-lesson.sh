#!/usr/bin/env bash
# Build a Builder lesson page: wraps lesson content in the shared shell (styles, navigation, progress).
# Usage: build-lesson.sh <content.html> <output.html> "<Lesson title>" [minutes] [--artifact]
#   --artifact  omit the <!doctype html> line (for publishing as a claude.ai Artifact)
set -euo pipefail
dir="$(cd "$(dirname "$0")/.." && pwd)"
content="$1"; out="$2"; title="$3"; minutes="${4:-5}"; mode="${5:-}"
[ -f "$content" ] || { echo "content file not found: $content" >&2; exit 1; }
mkdir -p "$(dirname "$out")"
{
  [ "$mode" = "--artifact" ] || echo '<!doctype html>'
  awk -v t="$title" -v m="$minutes" -v c="$content" '
    BEGIN { gsub(/&/, "\\&amp;", t); gsub(/</, "\\&lt;", t); gsub(/&/, "\\\\&", t) }
    /<!-- LESSON CONTENT -->/ { while ((getline line < c) > 0) print line; next }
    { gsub(/\{\{TITLE\}\}/, t); gsub(/\{\{MINUTES\}\}/, m); print }
  ' "$dir/templates/lesson-shell.html"
} > "$out"
echo "Built $out"
