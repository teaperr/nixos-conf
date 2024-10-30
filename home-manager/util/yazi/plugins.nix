{ config, lib, ... }:
let
  yaziPlugins = builtins.fetchGit {
    url = "https://github.com/yazi-rs/plugins";
    rev = "4f1d0ae0862f464e08f208f1807fcafcd8778e16";
  };

  enabledPlugins = [
    "chmod"
    "full-border"
    "git"
    "jump-to-char"
    "max-preview"
  ];

  githubPlugins = [
    # "https://github.com/dedukun/relative-motions.yazi"
  ];

  pluginPaths = map (plugin: {
    name = plugin;
    path = "${yaziPlugins}/${plugin}.yazi";
  }) enabledPlugins;

	githubPluginPaths = map (url: {
    name = builtins.replaceStrings [".yazi"] [""] (lib.last (lib.splitString "/" url));
    path = "${builtins.fetchGit { url = url; }}";
  }) githubPlugins;

in {
  programs.yazi = {
    enable = true;

    plugins = builtins.listToAttrs (map (plugin: {
      name = plugin.name;
      value = plugin.path;
    }) (pluginPaths ++ githubPluginPaths));
  };

  home.file.".config/yazi/init.lua".text = ''
    require("full-border"):setup()
    require("git"):setup()
		-- require("relative-motions"):setup({})
  '';
}

