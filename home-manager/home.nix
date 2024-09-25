{ pkgs, ... }:

{
  # Import additional configs
  imports = [
    ./alacritty.nix
    ./git.nix
    ./nvim/nvim.nix
    ./openbox/openbox.nix
    ./theming.nix
    ./tint2.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home = {
    username = "lotus";
    homeDirectory = "/home/lotus";
  };

  # Define home directory packages
  home.packages = with pkgs; [
    zsh
    git
    tmux
    librewolf
    xclip
    zsh-autosuggestions
    zsh-syntax-highlighting
    tree
    librewolf
    tmux
    vesktop
    xorg.xinput
    xclip
    btop
    htop
    catppuccin
    rofi
    tint2
    picom
    spaceFM
    gnome-settings-daemon
    volumeicon
    dunst
    obs-studio
    xterm
    betterlockscreen
    imagemagick
    cmake
    gnumake
    nitrogen
    picom
  ];

  # Home Manager version and other configurations
  home.stateVersion = "24.05";
}

