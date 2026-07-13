{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    librewolf
    unrar
    ffmpeg
    prismlauncher
    speedcrunch
    git
    ungoogled-chromium
    btop
    (discord.override { withVencord = true; })
    intiface-central
    krita
    vlc
    wheelwizard
    dolphin-emu
    kdePackages.kdenlive
    mesa-demos
    bottles
    freecad
    wineWow64Packages.staging
    audacity
    openvpn

    (python3.withPackages (ps: with ps; [ pygobject3 ]))
    gtk4
    gtk4-layer-shell
  ];

  programs.home-manager.enable = true;
}
