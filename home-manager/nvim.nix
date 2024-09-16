{ config, pkgs, ... }:

{
  # example
  home.file.".config/nvim/init.lua".text = ''
    export PATH=$PATH:/custom/path
    alias ll="ls -la"
  '';
}

