{ config, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      opener = {
        play = [
          {
            run = "vlc \"$@\"";
            orphan = true;
            for = "unix";
          }
        ];
      };
      manager = {
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = false;
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        # ── Goto binds ────────────────────────────────────────────────
        {
          on = [
            "g"
            "n"
          ];
          run = "cd ~/hm";
          desc = "go to nix config";
        }
        {
          on = [
            "g"
            "v"
          ];
          run = "cd ~/vaults";
          desc = "go to vaults";
        }
        {
          on = [
            "g"
            "D"
          ];
          run = "cd ~/Documents";
          desc = "go to documents";
        }
        {
          on = [
            "g"
            "l"
          ];
          run = "cd ~/.local";
          desc = "go to ~/.local";
        }
        {
          on = [
            "g"
            "s"
          ];
          run = "cd ~/.steam";
          desc = "go to ~/.steam";
        }
        {
          on = [
            "g"
            "S"
          ];
          run = "cd ~/.steam/steam/steamapps/common";
          desc = "go to steamapps";
        }

        # ── Plugins ───────────────────────────────────────────────────
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "chmod selected file";
        }
        {
          on = [ "T" ];
          run = "plugin --sync max-preview";
          desc = "toggle max preview";
        }
        {
          on = "<C-y>";
          run = [ "plugin wl-clipboard" ];
        }
      ];
    };
  };
}
