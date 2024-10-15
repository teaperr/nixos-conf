{
	home.file.".config/rofi/bin/musicmenu".text = ''#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/musicmenu.rasi -no-click-to-exit"

song_info=$(rmpc song)

artist=$(echo "$song_info" | jq -r '.metadata.artist')
title=$(echo "$song_info" | jq -r '.metadata.title')

rofi_prompt="$artist - $title"

previous="󰒮"
playpause="󰐎"
next="󰒭"

options="$previous\n$playpause\n$next"

echo $options

while true; do
  chosen="$(echo -e "$options" | $rofi_command -p "$rofi_prompt" -dmenu -selected-row 1)"
  echo $chosen
  case $chosen in
    $previous)
      rmpc prev
			sh ~/.config/rmpc/scripts/notify
      ;;
    $playpause)
      rmpc togglepause
      ;;
    $next)
      rmpc next
			sh ~/.config/rmpc/scripts/notify
      ;;
    *)
      break
      ;;
  esac
done
'';

}
