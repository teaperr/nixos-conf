{
	home.file.".config/rofi/bin/window".text = ''#!/usr/bin/env bash
rofi \
	-show window \
	-modi run,drun,ssh \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal alacritty \
	-kb-cancel Escape \
	-theme "$HOMEk/.config/rofi/config/launcher.rasi
'';
}
