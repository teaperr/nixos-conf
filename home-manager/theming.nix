{ config, pkgs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  gtk = {
    enable = true;
  };

  qt = {
    enable = true;
    style = {
      name = "kvantum";
    };
    platformTheme.name = "kvantum";
  };
}

