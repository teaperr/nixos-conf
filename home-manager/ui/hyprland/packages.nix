{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		waybar
		rofi-wayland
	];
}
