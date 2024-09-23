set -e 
sudo nixos-rebuild switch --flake /home/lotus/nixos-config#my-nixos
home-manager switch --flake /home/lotus/nixos-config#lotus
