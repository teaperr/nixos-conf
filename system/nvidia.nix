{ pkgs, config, ... }:

{
	# Enable NVIDIA proprietary drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Optionally enable modesetting (recommended)
  hardware.nvidia.modesetting.enable = true;

  # Enable the NVIDIA kernel module
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  # Enable hardware acceleration in your system
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau
    ];
  };
}
