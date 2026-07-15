{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  stablePkgs = import inputs.nixpkgs-stable {

    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      keyboardShortcut
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    spotifyPackage = stablePkgs.spotify;
    spicetifyPackage = stablePkgs.spicetify-cli;
  };
}
