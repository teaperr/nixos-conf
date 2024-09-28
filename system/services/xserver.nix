{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    xorg = {
      dpi = 120;
    };
    displayManager.auto = {
      enable = true;
    };
  };
}
