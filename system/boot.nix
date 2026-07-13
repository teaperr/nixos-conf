{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = [ pkgs.sbctl ];
  boot = {
    initrd.systemd.enable = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
      systemd-boot = {
        enable = lib.mkForce false;
        xbootldrMountPoint = lib.mkForce "/boot";
      };
    };
    lanzaboote = {
      enable = true;
      configurationLimit = 2;
      pkiBundle = "/etc/secureboot";
    };
    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
    ];
  };
}
