{ config, pkgs, ... }:

{
  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "pink";

    yazi.enable = false;

    tmux = {
      enable = true;
      extraConfig = ''
        set -g @catppuccin_flavor "mocha"
        set -g @catppuccin_window_status_style "rounded"
        set -g @catppuccin_date_time_text " %H:%M"
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -agF status-right "#{E:@catppuccin_status_cpu}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -agF status-right "#{E:@catppuccin_status_weather}"
        set -agF status-right "#{E:@catppuccin_status_gitmux}"
        set -ag status-right "#{E:@catppuccin_status_date_time}"
        source-file ~/.config/tmux/tmux.conf
      '';
    };
  };
}
