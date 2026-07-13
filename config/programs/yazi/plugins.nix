{
  config,
  lib,
  pkgs,
  ...
}:
# let
#   yaziPlugins = builtins.fetchGit {
#     url = "https://github.com/yazi-rs/plugins";
#     rev = "598cdb671401574ac27aeee257e2f3b0c80610a1";
#   };
#
#   relativeMotions = builtins.fetchGit {
#     url = "https://github.com/dedukun/relative-motions.yazi";
#   };
#
#   enabledPlugins = [
#     "chmod"
#     "full-border"
#     "git"
#     "jump-to-char"
#     "max-preview"
#     "wl-clipboard"
#   ];
#
# in
{
  programs.yazi = {
    enable = true;

    package = pkgs.yazi.override { _7zz = pkgs._7zz-rar; };

    # plugins =
    #   builtins.listToAttrs (
    #     map (name: {
    #       inherit name;
    #       value = "${yaziPlugins}/${name}.yazi";
    #     }) enabledPlugins
    #   )
    #   // {
    #     relative-motions = "${relativeMotions}";
    #   };
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
