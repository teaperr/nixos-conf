{ config, pkgs, ... }:

{
  programs.rofi.catppuccin.enable = true;
  home.file.".config/rofi/rofi.rasi".text = ''
configuration{
    modi: "run,drun,window";
    icon-theme: "Oranchelo";
    show-icons: true;
    terminal: "alacritty";
    drun-display-format: "{icon} {name}";
    location: 0;
    disable-history: false;
    hide-scrollbar: true;
    display-drun: "   Apps ";
    display-run: "   Run ";
    display-window: " 󰕰  Window";
    display-Network: " 󰤨  Network";
    sidebar-mode: true;
    dpi: 70;
}

@theme "catppuccin-mocha"

window {
    width: 40%;
    height: 40%;
}
  '';

  home.file.".config/rofi/userconfig/config.rasi".text = ''
configuration{
    modi: "run,drun,window";
    icon-theme: "Oranchelo";
    show-icons: true;
    terminal: "alacritty";
    drun-display-format: "{icon} {name}";
    location: 0;
    disable-history: false;
    hide-scrollbar: true;
    display-drun: "   Apps ";
    display-run: "   Run ";
    display-window: " 󰕰  Window";
    display-Network: " 󰤨  Network";
    sidebar-mode: true;
}

@theme "catppuccin-mocha"
  '';
}
