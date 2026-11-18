{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.yazi = {
    enable = true;

    package = pkgs.yazi.override { _7zz = pkgs._7zz-rar; };

    plugins = {
      chmod = pkgs.yaziPlugins.chmod;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      jump-to-char = pkgs.yaziPlugins.jump-to-char;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      relative-motions = pkgs.yaziPlugins.relative-motions;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
      require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })
    '';
  };
}
