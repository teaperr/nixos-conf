{ pkgs, ... }:

{
  # Import additional configs
  imports = [
    ./nvim.nix
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
    neovim
    zsh
    git
    tmux
    librewolf
    xclip
  ];

  # Home Manager version and other configurations
  home.stateVersion = "24.05";
}

