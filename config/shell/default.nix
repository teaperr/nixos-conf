{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./ghostty.nix
    ./fastfetch.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
