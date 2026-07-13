{ config, pkgs, ... }:

{
  imports = [
    ./programs
    ./shell
    ./theming
    ./wm
    ./environment.nix
    ./packages.nix
    ./patches
    ./pkgs
  ];
  nixpkgs.config.allowUnfree = true;
}
