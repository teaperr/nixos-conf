{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    catppuccin.enable = true;
  };
  home.file.".config/nvim/init.lua".text = ''
vim.o.termguicolors = true
  '';
}
