set -e 
sudo nixos-rebuild switch --flake /home/lotus/nixos-config#my-nixos
sudo nix-collect-garbage --delete-older-than 15d
sudo nix-collect-garbage -d
home-manager switch --flake /home/lotus/nixos-config#lotus
# home-manager expire-generations -t 30d
home-manager generations
