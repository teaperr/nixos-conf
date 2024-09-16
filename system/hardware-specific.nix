{ config, pkgs, ... }:

let
  # Check if the system is a laptop or has NVIDIA GPU
  isLaptop = builtins.elem "laptop" (builtins.attrValues (config.hardware.system.hwdb or {}));
  hasNvidiaGPU = builtins.elem "nvidia" (builtins.attrValues (config.hardware.system.hwdb or {}));
in {
  # Conditional settings based on hardware

  # Enable NVIDIA drivers only if not on a laptop
  services.xserver.videoDrivers = if isLaptop then [] else [ "nvidia" ];

  # Example: Enable TLP on laptops
  services.tlp.enable = isLaptop;

  # Example: Enable power management settings for laptops
  powerManagement = if isLaptop then {
    services.tlp.enable = true;
  } else {};

  # Example: Set hardware options for NVIDIA GPUs
  hardware.nvidia.modesetting.enable = if hasNvidiaGPU then true else false;

  # Example: Additional hardware-specific packages
  environment.systemPackages = with pkgs; [
    # Conditionally include packages
    (if isLaptop then pkgs.tlp else pkgs.vim) # Replace pkgs.vim with a valid package or leave it as an empty list if no package is needed
  ];
}

