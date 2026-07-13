{
  config,
  pkgs,
  lib,
  ...
}:
{
  _module.args.colors = { };

  imports = [
    ./theme.nix
    ./packages.nix
    ./noctalia
  ];

  catppuccin.hyprland = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  services.playerctld.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = ''
      			require("config.main")
      		'';
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "nemo.desktop";
    };
  };

  home.file.".config/hypr/config".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/hm/config/wm/hyprland/lua";
}
