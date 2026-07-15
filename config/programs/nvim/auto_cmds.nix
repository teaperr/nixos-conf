{ config, pkgs, ... }:

{
  programs.nixvim = {
    autoGroups = {
      highlight_yank = { };
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "netrw";
        command = "setlocal number relativenumber";
      }
      {
        event = [ "VimEnter" ];
        pattern = [ "*" ];
        command = "ASToggle";
      }
      {
        group = "highlight_yank";
        event = [ "TextYankPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
            vim.highlight.on_yank()
            end
          '';
        };
      }
    ];
  };
}
