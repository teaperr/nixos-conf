{ pkgs, ... }:
{
  imports = [
    ./orca-slicer.nix
    ./stable-pkgs.nix
  ];
}
