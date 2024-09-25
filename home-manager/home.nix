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
  ];

  # Home Manager version and other configurations
  home.stateVersion = "24.05";
}

