#!/bin/zsh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$ROOT_DIR/동아리 홈페이지 만들기"
DOCS_DIR="$ROOT_DIR/docs"

mkdir -p "$DOCS_DIR"
find "$DOCS_DIR" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
cp -R "$SOURCE_DIR/." "$DOCS_DIR/"

# GitHub Pages-safe aliases
cp "$DOCS_DIR/macaron.png" "$DOCS_DIR/macaron-clean.png"
cp "$DOCS_DIR/동국대공학.png" "$DOCS_DIR/dongguk-engineering.png"

python3 - <<'PY'
from pathlib import Path

index_path = Path("docs/index.html")
text = index_path.read_text(encoding="utf-8")
text = text.replace('src="동국대공학.png"', 'src="dongguk-engineering.png"')
text = text.replace('src="macaron_clean.png"', 'src="macaron-clean.png"')
index_path.write_text(text, encoding="utf-8")
PY

touch "$DOCS_DIR/.nojekyll"
echo "Synced source into docs/ for GitHub Pages."
