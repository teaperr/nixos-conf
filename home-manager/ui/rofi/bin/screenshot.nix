{
	home.file.".config/rofi/bin/screenshot".text = ''#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/screenshot.rasi"

time=`date +%Y-%m-%d-%I-%M-%S`
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="`xdg-user-dir PICTURES`/Screenshots"
file="Screenshot_$\{time}_$\{geometry}.png"

# Icons
icon1="$HOME/.config/dunst/icons/collections.svg"
icon2="$HOME/.config/dunst/icons/timer.svg"

# Buttons
layout=`cat $HOME/.config/rofi/config/screenshot.rasi | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
if [[ "$layout" == "TRUE" ]]; then
	screen="󰍹"
	area="󰆞"
	window="󰖲"
	inthree="󰬼󱎤"
	infive="󰬾󱎤"
else
	screen="󰍹 Capture Desktop"
	area="󰆞 Capture Area"
	window="󰖲 Capture Monitor"
	inthree="󰬼󱎤 Take in 3s"
	infive="󰬾󱎤 Take in 5s"
fi

# take shots
shotnow () {
	flameshot full --clipboard --delay 500
}

shot3 () {
	flameshot gui --delay 3000 --clipboard
}

shot5 () {
	flameshot gui --delay 5000 --clipboard
}

shotwin () {
	flameshot screen --clipboard --delay 500
}

shotarea () {
	flameshot gui --delay 500
}

# Variable passed to rofi
options="$screen\n$area\n$window\n$inthree\n$infive"

chosen="$(echo -e "$options" | $rofi_command -p 'Take Screenshot' -dmenu -selected-row 0)"
case $chosen in
	  $screen)
		shotnow
	      ;;
	  $area)
		shotarea
	      ;;
	  $window)
		shotwin
		;;
	  $inthree)
		shot3
		;;
	  $infive)
		shot5
	      ;;
esac

'';
}
