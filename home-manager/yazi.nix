{ config, pkgs, ... }:

{
	programs.yazi = {
		enable = true;
		catppuccin.enable = true;
	};
}
