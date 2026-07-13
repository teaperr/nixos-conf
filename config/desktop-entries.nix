{ config, pkgs, ... }:

{
  xdg.desktopEntries = {
    noctalia = {
      name = "Noctalia Shell";
      exec = "noctalia";
      terminal = false;
    };
  };
}
