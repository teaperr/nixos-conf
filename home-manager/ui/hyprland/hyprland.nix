{ config, pkgs, ... }:

{
	home.sessionVariables = {
		# hints electron apps to use wayland
		NIXOS_OZONE_WL = "1";
	};

	home.file.".config/hypr".source = ./hypr;
	home.file.".config/hypr".recursive = true;
}
