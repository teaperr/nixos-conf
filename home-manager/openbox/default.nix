{ config, pkgs, ... }:

{
  imports = [
    ./autostart.nix
		./catppuccin.nix
    ./environment.nix
    ./rc.nix
  ];
}
