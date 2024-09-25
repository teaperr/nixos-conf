{ config, pkgs, ... }:

{
  imports = [
    ./autostart.nix
    ./environment.nix
    ./rc.nix
  ];
}
