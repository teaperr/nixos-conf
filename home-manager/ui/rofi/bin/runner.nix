{
	home.file.".config/rofi/bin/runner".text = ''#!/usr/bin/env bash
rofi \
	-show run \
	-scroll-method 0 \
	-terminal alacritty \
	-theme "$HOME"/.config/rofi/config/runner.rasi
'';
}