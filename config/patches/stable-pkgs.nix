{
  inputs,
  pkgs,
  config,
  ...
}:
let
  stablePkgs = import inputs.nixpkgs-stable {

    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  home.packages = with stablePkgs; [
    bottles
    freecad
  ];
}
