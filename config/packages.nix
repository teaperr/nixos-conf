{ pkgs, inputs, ... }:
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
    # (discord.override { withVencord = true; })
    intiface-central
    krita
    vlc
    wheelwizard
    dolphin-emu
    kdePackages.kdenlive
    mesa-demos
    wineWow64Packages.staging
    audacity
    openvpn
    kicad
    easyeffects
    annotator

    (python3.withPackages (ps: with ps; [ pygobject3 ]))

    gtk4
    gtk4-layer-shell
    intiface-central
  ];

  imports = [ inputs.funplayer.homeManagerModules.default ];
  programs.funplayer.enable = true;
  programs.tailor.enable = true;

  programs.home-manager.enable = true;
}
