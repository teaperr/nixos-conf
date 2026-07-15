{ pkgs, inputs, ... }:

{
  # discord launch options for best performance
  xdg.desktopEntries.discord = {
    name = "Discord";
    exec = "env LIBVA_DRIVER_NAME=i915 discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy %U";
    icon = "discord";
    categories = [
      "Network"
      "InstantMessaging"
    ];
  };
  programs.nixcord = {
    enable = false;
    # discord = {
    #   enable = true;
    #   vencord.enable = false;
    # };
    vesktop.enable = true;
  };
  home.packages = with pkgs; [ vesktop ];
}
