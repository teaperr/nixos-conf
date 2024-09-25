{ pkgs, ... }:

{
  # Import additional configs
  imports = [
    ./nvim/nvim.nix
    ./tmux.nix
    ./git.nix
    ./zsh.nix
    ./openbox.nix
    ./alacritty.nix
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
    neovim
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
  ];

  # Home Manager version and other configurations
  home.stateVersion = "24.05";
}

