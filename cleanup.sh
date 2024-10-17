#!/usr/bin/env bash
nix-collect-garbage --delete-older-than 10d
nix-store --optimise
sudo nix-collect-garbage -d
