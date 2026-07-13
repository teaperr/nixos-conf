{
  pkgs,
  config,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    gitmux
    curl
    gnused
  ];
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-a";
    baseIndex = 1;
    secureSocket = false;
    terminal = "screen-256color";
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.cpu
      tmuxPlugins.weather
    ];
    extraConfig = ''
      setw synchronize-panes off
      setw -g mode-keys vi
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"
      set-option -g update-environment "WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_RUNTIME_DIR DISPLAY XAUTHORITY"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      set -g allow-rename on
      set-window-option -g automatic-rename on
      set-window-option -g automatic-rename-format "#{?#{==:#{pane_current_command},zsh},#{b:pane_current_path},#{pane_current_command}}"
      source-file -q ~/.config/tmux/noctalia-colors.conf
    '';
  };
}
