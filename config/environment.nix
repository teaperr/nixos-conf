{ config, pkgs, ... }:

{
  home.sessionVariables = {
    # cursor fix for NVIDIA on Hyprland
    WLR_NO_HARDWARE_CURSORS = "1";

    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_PATH = "/home/lotus/.cache/nvidia/shaders";
    __GL_SHADER_DISK_CACHE_SIZE = "10737418240";
    PROTON_ENABLE_NVAPI = "1";
  };
}
