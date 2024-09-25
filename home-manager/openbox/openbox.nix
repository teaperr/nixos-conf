{ config, pkgs, ... }:

{
  imports = [
    ./autostart.nix
    ./environment.nix
    ./rc.nix
  ];
  programs.openbox.enable = true;
}
