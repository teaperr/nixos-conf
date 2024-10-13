{
	home.file.".config/openbox/scripts/toggleMute.sh".text = ''#!/usr/bin/env bash
# Decrease volume
/usr/bin/env amixer -D pipewire set Master 1+ toggle

# Send notification with the current volume
/usr/bin/env dunstify -r 2593 -u low -h int:value:"$(amixer get Master | grep -o '[0-9]*%' | head -n1 | tr -d '%')" "Volume: $(amixer get Master | grep -o '[0-9]*%' | head -n1)"

	'';
}
