{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    catppuccin.enable = true;
    extraConfig = ''
vim.o.termguicolors = true
    '';
  };
}
