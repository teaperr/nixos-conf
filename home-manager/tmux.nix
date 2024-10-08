{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    secureSocket =  false;
    terminal = "screen-256color";

    plugins = with pkgs; [
    	tmuxPlugins.better-mouse-mode
    ];

    catppuccin = {
			enable = true;
			extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # keep directory on new session
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # catppuccin config
      set -g @catppuccin_flavor 'macchiato'
      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator ""
      set -g @catppuccin_window_middle_separator " █"
      set -g @catppuccin_window_number_position "right"

      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_color "#D8F9FD"
      set -g @catppuccin_window_default_text "#W"

      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_color "#8DD4F7"
      set -g @catppuccin_window_current_text "#W"

      set -g @catppuccin_status_modules_right "gitmux session date_time"
      set -g @catppuccin_status_modules_left ""
      set -g @catppuccin_status_justify "left"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "yes"

      set -g @catppuccin_gitmux_color "#E4C1F9"
      set -g @catppuccin_session_color "#9CE7B9"
      set -g @catppuccin_date_time_color "#A9DEF9"
			'';
		};
  };
}
