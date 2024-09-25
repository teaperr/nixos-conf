{ pkgs, ... }:

let
  # Helper function to recursively get all .nix files in a directory
  getNixFiles = dir: builtins.filter (file: builtins.match ".*\\.nix$" file != null) (builtins.pathRecurse dir);
  
  # Automatically import all .nix files in the current directory
  nixFiles = getNixFiles ./.;
in
{
  # Dynamically import all .nix files
  imports = nixFiles;

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
  ];

  # Home Manager version and other configurations
  home.stateVersion = "24.05";
}
