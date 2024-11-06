{
  home.file.".config/openbox/autostart" = {
		text = ''
	if test -x /usr/lib/openbox/gnome-settings-daemon >/dev/null; then
	 /usr/lib/openbox/gnome-settings-daemon &
	elif which gnome-settings-daemon >/dev/null 2>&1; then
	 gnome-settings-daemon &
	fi

	# picom renderer
	# try xrender, glx, and xr_glx_hybrid to see which runs best on your hardware
	# picom &
	picom --backend glx &

	# initialize wallpaper
	feh --bg-scale ~/nixos-conf/home-manager/common/assets/wallpaper.jpg &

	# config section
	xinput set-prop "pointer:Razer Razer DeathAdder Essential" "libinput Accel Speed" -1 &
	xinput set-button-map "pointer:Razer Razer DeathAdder Essential" 1 2 3 4 5 6 7 8 3 &

	G_SLICE=always-malloc
	tint2 &
	volumeicon &
	greenclip daemon &
	kdeconnect-indicator &
	alacritty &
	kdeconnect-cli --refresh &

	# delay to make sure desktop is properly loaded
	delay 2
	# monitor layout
	xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1366x768 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --mode 1920x1080 --pos 1440x0 --rotate normal
	xrandr --output HDMI-0 --gamma 1.1:1:1

	dunst &
	mpdscribble &
		'';
	};
}
