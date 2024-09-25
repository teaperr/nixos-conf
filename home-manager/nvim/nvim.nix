{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    catppuccin.enable = true;
    extraConfig = ''
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors
colorscheme catppuccin-mocha
    '';
  };
}
