{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    catppuccin.enable = true;
    extraConfig = ''
set termguicolors
    '';
  };
}
