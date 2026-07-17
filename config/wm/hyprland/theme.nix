{
  config,
  pkgs,
  lib,
  ...
}:

# ── Catppuccin Mocha — GTK / Qt / cursor / font theming ──────────────────────
{
  # ── GTK ───────────────────────────────────────────────────────────────────
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = lib.mkForce (
        pkgs.catppuccin-papirus-folders.override {
          accent = "pink";
          flavor = "mocha";
        }
      );
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4 = {
      theme = config.gtk.theme;
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };

  # ── Qt (mirrors GTK) ──────────────────────────────────────────────────────
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "gtk";
    # style = {
    #   name = "kvantum";
    #   package = pkgs.catppuccin-kvantum.override {
    #     accent = "mauve";
    #     variant = "mocha";
    #   };
    # };
  };

  # ── Cursor (X11 + Wayland) ────────────────────────────────────────────────
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;
  };

  # ── Fonts ─────────────────────────────────────────────────────────────────
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome # waybar icons
    waybar
    hyprpaper
    hypridle
    libnotify
  ];
}
