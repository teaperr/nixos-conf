{ config, pkgs, ... }:

{
  home.file = {
    ".config/openbox" = {
      source = ./files/openbox;
    };
  };
}
