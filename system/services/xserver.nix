{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    dpi = 120;
    displayManager.auto = {
      enable = true;
    };
  };
}
