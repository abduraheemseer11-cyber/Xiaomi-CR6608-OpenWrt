#!/usr/bin/env bash
# Run before the build: validates branding files, generates missing favicon/background,
# and fixes executable bits (GitHub web upload drops them).
set -euo pipefail
cd "$(dirname "$0")/.."

IMG=files/www/luci-static/argon/img
RES=files/www/luci-static/resources
mkdir -p "$IMG" "$RES" files/www/luci-static/argon/background

[ -f "$IMG/logo.png" ] || { [ -f "$RES/logo.png" ] && cp "$RES/logo.png" "$IMG/logo.png"; } || true
[ -f "$IMG/logo.png" ] || { echo "::error::Missing $IMG/logo.png - upload your logo first"; exit 1; }
[ -f "$RES/logo.png" ] || cp "$IMG/logo.png" "$RES/logo.png"

if [ ! -f "$IMG/favicon.ico" ]; then
  echo "Generating favicon.ico from logo.png"
  convert "$IMG/logo.png" -background none -gravity center -extent "%[fx:max(w,h)]x%[fx:max(w,h)]" \
          -define icon:auto-resize=64,48,32,16 "$IMG/favicon.ico"
fi
cp -f "$IMG/favicon.ico" "$RES/favicon.ico"

if [ ! -f "$IMG/bg1.jpg" ]; then
  echo "Generating bg1.jpg"
  convert -size 1920x1080 gradient:'#5a0a12-#120406' \
          \( "$IMG/logo.png" -resize 760x -alpha set -channel A -evaluate multiply 0.10 +channel \) \
          -gravity center -composite -quality 88 "$IMG/bg1.jpg"
fi

chmod +x files/etc/rc.local files/etc/uci-defaults/* scripts/*.sh
echo "Assets OK"
