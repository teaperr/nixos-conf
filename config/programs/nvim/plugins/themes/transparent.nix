{ lib, ... }:
{
  programs.nixvim.nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) [ "transparent.nvim" ];

  programs.nixvim.plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [
        "Normal"
        "NormalNC"
        "TelescopeNormal"
        "TelescopeBorder"
      ];
    };
  };
}
