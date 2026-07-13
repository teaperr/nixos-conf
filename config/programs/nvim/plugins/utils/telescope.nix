{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      settings = {
        defaults = {
          path_display = [ "truncate" ];
        };
      };
      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
        media-files = {
          enable = true;
          settings.find_cmd = "rg";
        };
      };
      keymaps = {
        "<leader><space>" = {
          action = "buffers";
          options.desc = "Open list of buffers";
        };
        "<leader>L" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>f" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>e" = {
          action = "file_browser";
          options.desc = "File Browser";
        };
      };
    };
    dependencies = {
      poppler-utils.enable = true;
      imagemagick.enable = true;
      fontpreview.enable = true;
      ffmpegthumbnailer.enable = true;
      epub-thumbnailer.enable = true;
      chafa.enable = true;
    };
  };
  home.packages = with pkgs; [
    ripgrep
  ];
}
