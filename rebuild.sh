set -e 
sudo nixos-rebuild switch --flake .#my-nixos --impure --fast
# sudo nix-collect-garbage --delete-older-than 15d
home-manager switch --flake .#lotus --impure
home-manager generations
