#!/bin/zsh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Removing large local video files from git tracking."
echo "Use this only after Cloudinary URLs are filled in and verified."

git -C "$ROOT_DIR" rm --cached -f \
  "docs/web.mp4" \
  "docs/assets/videos/vision.mp4" \
  "docs/assets/videos/planning.mp4" \
  "docs/assets/videos/hardware.mp4" \
  "docs/assets/videos/hw.mp4" \
  "동아리 홈페이지 만들기/web.mp4" \
  "동아리 홈페이지 만들기/assets/videos/vision.mp4" \
  "동아리 홈페이지 만들기/assets/videos/planning.mp4" \
  "동아리 홈페이지 만들기/assets/videos/hardware.mp4" \
  "동아리 홈페이지 만들기/assets/videos/hw.mp4"

echo "Done. The files remain on your computer, but will no longer be tracked by git."
echo "Next: git commit -m 'Move videos to Cloudinary' && git push"
