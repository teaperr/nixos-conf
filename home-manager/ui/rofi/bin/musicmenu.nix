{
	home.file.".config/rofi/bin/musicmenu".text = ''#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/musicmenu.rasi -no-click-to-exit"

# Define the buttons (icons)
previous="󰒮"
playpause="󰐎"
next="󰒭"

# Variable passed to rofi
options="$previous\n$playpause\n$next"

echo $options

while true; do
  chosen="$(echo -e "$options" | $rofi_command -p "Music Controls" -dmenu -selected-row 1)"
	echo $chosen
  case $chosen in
	$previous)
		rmpc prev
		;;
	$playpause)
		rmpc togglepause
		;;
	$next)
		rmpc next
		;;
	*)
		break
		;;
  esac
done

'';

}
