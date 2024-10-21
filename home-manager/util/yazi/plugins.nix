let
  # Fetch the yazi-plugins repository
  yaziPlugins = builtins.fetchGit {
    url = "https://github.com/yazi-rs/plugins";
    rev = "4f1d0ae0862f464e08f208f1807fcafcd8778e16";  # Specify the commit hash you want
  };

  enabledPlugins = [
    "chmod"
    # "diff"
    "full-border"
    "git"
    # "hide-preview"
    # "jump-to-char"
    # "lsar"
    # "mactag"
    "max-preview"
    # "mime-ext"
    # "no-status"
    # "smart-filter"
  ];

  # Map selected plugins to their full paths in the Git repository
  pluginPaths = map (plugin: {
    name = plugin;
    path = "${yaziPlugins}/${plugin}.yazi";  # Targeting pluginname.yazi directory in the repo
  }) enabledPlugins;

in {
  programs.yazi = {
    enable = true;

    # Use the selected plugins without the `.yazi` suffix
    plugins = builtins.listToAttrs (map (plugin: {
      name = plugin.name;  # No `.yazi` suffix here
      value = plugin.path;
    }) pluginPaths);
  };

	home.file.".config/yazi/init.lua".text = ''
	require("full-border"):setup()
	require("git"):setup()
	'';
}

