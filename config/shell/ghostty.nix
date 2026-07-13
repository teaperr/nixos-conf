{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      gtk-titlebar = false;
      window-colorspace = "srgb";
      font-size = 10;
      background-opacity = 0.7;
      keybind = "ctrl+enter=unbind";
      app-notifications = false;
    };
  };

  # home.file.".config/ghostty/config.ghostty".text = ''
  #   gtk-titlebar = false
  #   window-colorspace = "srgb"
  #   font-size = 10
  #   background-opacity = 0.7
  #   keybind = "ctrl+enter=unbind"
  #   app-notifications = false
  # '';
}
