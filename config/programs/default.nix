{ config, pkgs, ... }:

{
  imports = [
    ./cs2
    ./discord.nix
    ./steam.nix
    ./spicetify.nix
    ./kicad.nix
    ./nvim
    ./obs-studio.nix
    ./yazi
    ./zen-browser.nix
  ];
}
