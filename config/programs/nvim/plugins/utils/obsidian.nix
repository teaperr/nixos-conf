{ config, pkgs, ... }:
{
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;
      settings = {
        legacy_commands = false;
        workspaces = [
          {
            name = "Misc";
            path = "~/vaults/misc";
          }
        ];
      };
    };
  };
}
