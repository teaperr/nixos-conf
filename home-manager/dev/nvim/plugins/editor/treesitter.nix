{ config, pkgs, ... }:
{
  programs.nixvim = {
		plugins.treesitter = {
			enable = true;
		};
  };
}
