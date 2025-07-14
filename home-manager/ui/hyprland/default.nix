{ config, pkgs, ... }:

{
	imports = [
		./packages.nix
		./hyprland.nix
		./waybar.nix
	];
}
