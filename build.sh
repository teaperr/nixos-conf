rm -rf ~/.config/ghostty/config*
NIXPKGS_ALLOW_UNFREE=1 home-manager switch --flake .#lotus --impure -b backup
