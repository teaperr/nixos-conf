set -e 
sudo nixos-rebuild switch --flake .#my-nixos
# sudo nix-collect-garbage --delete-older-than 15d
home-manager switch --flake .#lotus
home-manager generations
