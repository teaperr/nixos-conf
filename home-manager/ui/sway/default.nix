{pkgs, config, ...}:
{
	imports = [
	];

	home.packages = [
  ];

	wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "alacritty"; 
			menu = "rofi -show drun";
      startup = [
        {command = "vesktop";}
        {command = "flameshot";}
        {command = "greenclip daemon";}
      ];
			keybindings = {
        # **Basic Window Management**
        "Mod4+Return" = "exec alacritty"; # Open terminal
        "Mod4+q" = "kill"; # Close focused window
        "Mod4+f" = "fullscreen toggle"; # Toggle fullscreen

        # **Workspaces**
        "Mod4+1" = "workspace 1";
        "Mod4+2" = "workspace 2";
        "Mod4+3" = "workspace 3";
        "Mod4+4" = "workspace 4";
        "Mod4+Shift+1" = "move container to workspace 1";
        "Mod4+Shift+2" = "move container to workspace 2";
        "Mod4+Shift+3" = "move container to workspace 3";
        "Mod4+Shift+4" = "move container to workspace 4";

        # **Move Windows Between Displays**
        "Mod4+Left" = "move workspace to output left";
        "Mod4+Right" = "move workspace to output right";

        # **Media Keys**
        "XF86AudioRaiseVolume" = "exec pamixer -i 5";
        "XF86AudioLowerVolume" = "exec pamixer -d 5";
        "XF86AudioMute" = "exec pamixer -t";

        # **Screenshots**
        "Print" = "exec flameshot gui";
        "Shift+Print" = "exec flameshot full --clipboard";

        # **Lock Screen**
        "Mod4+l" = "exec swaylock -f -c 000000";

        # **Rofi Menus**
        "Mod4+m" = "exec rofi -show music";
        "Mod4+b" = "exec rofi -show window";
        "Mod4+r" = "exec rofi -show run";
        "Mod4+p" = "exec rofi -show power-menu";
        "Mod4+s" = "exec rofi -show screenshot";
        "Mod4+space" = "exec rofi -show drun";
        "Mod4+v" = "exec rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command 'print'";
      };
    };
  };
}
