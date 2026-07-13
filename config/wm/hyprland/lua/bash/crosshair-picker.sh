#!/usr/bin/env bash
set -euo pipefail

dir="$HOME/.steam/steam/steamapps/common/FPSAimTrainer/FPSAimTrainer/crosshairs"
cache="$HOME/.cache/crosshair-thumbs"
mkdir -p "$cache"

# generate nearest-neighbor upscaled thumbnails, skip if already cached
for f in "$dir"/*; do
	name="$(basename "$f")"
	thumb="$cache/$name"
	if [ ! -f "$thumb" ] || [ "$f" -nt "$thumb" ]; then
		magick "$f" -filter point -resize 128x128 "$thumb"
	fi
done

selection=$(
	find "$cache" -maxdepth 1 -type f -printf 'img:%p:text:%f\n' \
		| wofi --dmenu \
			--allow-images \
			--matching fuzzy \
			--insensitive \
			-p 'Crosshair'
)

filename="${selection##*:text:}"
[ -n "$filename" ] || exit 0

pkill wl-crosshair || wl-crosshair "$dir/$filename"
