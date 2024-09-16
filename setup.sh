set -e 
sudo nixos-rebuild switch --flake ~/nixos-config#my-nixos
home-manager switch --flake ~/nixos-config#lotus
