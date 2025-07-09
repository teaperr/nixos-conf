{ config, lib, pkgs, ... }:
{
  boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.opengl = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

	hardware.graphics = {
		enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      libvdpau
      vaapiVdpau
    ];
  };
	hardware.pulseaudio.support32Bit = true;
}
