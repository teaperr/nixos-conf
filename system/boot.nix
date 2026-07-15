{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = [ pkgs.sbctl ];
  # boot = {
  #   initrd.systemd.enable = true;
  #   loader = {
  #     efi = {
  #      canTouchEfiVariables = true;
  #    };
  #    systemd-boot = {
  #      enable = lib.mkForce false;
  #    };
  #  };
  #  lanzaboote = {
  #    enable = true;
  #    configurationLimit = 2;
  #    pkiBundle = "/etc/secureboot";
  #  };
  #  kernelParams = [
  #    "nvidia-drm.modeset=1"
  #    "nvidia-drm.fbdev=1"
  #  ];
  # };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
