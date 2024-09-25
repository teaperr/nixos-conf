{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window.decorations = "none";
      font = {
        normal = {
          family = "Hack Nerd Font";
          style = "Regular";

        };
        bold = {
          family = "Hack Nerd Font";
          style = "Bold";

        };
        italic = {
          family = "Hack Nerd Font";
          style = "Italic";

        };
        bold_italic = {
          family = "Hack Nerd Font";
          style = "Bold Italic";

        };
        size = 10;
      };
    };
  };
}
