#!/usr/bin/env bash
nix-store --optimise
sudo nix-collect-garbage -d
