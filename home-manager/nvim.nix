{ config, pkgs, ... }:

{
  home.file = {
    ".config/nvim" = {
      source = ./files/nvim;
    };
  };
}
