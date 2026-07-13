#!/usr/bin/env bash

# Delete NixOS system generations older than 3 days
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
sudo nix-collect-garbage --delete-older-than 3d

# Delete home-manager generations older than 3 days
nix-env --profile ~/.local/state/nix/profiles/home-manager --delete-generations old
nix-collect-garbage --delete-older-than 3d
