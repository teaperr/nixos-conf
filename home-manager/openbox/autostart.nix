{ config, pkgs, ... }:

{
  home.file.".config/openbox/autostart".text = ''
if test -x /usr/lib/openbox/gnome-settings-daemon >/dev/null; then
 /usr/lib/openbox/gnome-settings-daemon &
elif which gnome-settings-daemon >/dev/null 2>&1; then
 gnome-settings-daemon &
fi

# picom renderer
# try xrender, glx, and xr_glx_hybrid to see which runs best on your hardware
# picom &
picom --backend glx &

# initialize desktop
# exec spacefm --desktop &
nitrogen ~/nixos-config/home-manager/common/assets/wallpaper.* &

#config section
xinput set-prop "pointer:Razer Razer DeathAdder Essential" "libinput Accel Speed" -1 &
xinput set-button-map "pointer:Razer Razer DeathAdder Essential" 1 2 3 4 5 6 7 8 3 &

G_SLICE=always-malloc
tint2 &
volumeicon &
kdeconnect-indicator &
alacritty &
kdeconnect-cli --refresh &

# delay to make sure desktop is properly loaded
delay 2
# monitor layout
bash ~/nixos-config/home-manager/scripts/openbox2.sh

dunst &
  '';
}
