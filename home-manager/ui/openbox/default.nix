{ config, pkgs, ... }:

{
  imports = [
    ./autostart.nix
		./catppuccin.nix
    ./environment.nix
    ./rc.nix
		./scripts/toggleMute.nix
		./scripts/lowerVolume.nix
		./scripts/raiseVolume.nix
  ];
}
