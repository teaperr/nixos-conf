{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    dpi = 100;
    xkbOptions = "terminate:ctrl_alt_bksp";
  };
}
