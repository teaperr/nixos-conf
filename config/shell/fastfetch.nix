{ config, pkgs, ... }:
let
  asciiDir = ../../assets/ascii-art;
  minWidth = 20;
  minHeight = 10;

  pink = "\\033[38;2;245;194;231m";
  reset = "\\033[0m";

  fastfetch-random = pkgs.writeShellScriptBin "fastfetch" ''
    art_dir="${asciiDir}"

    noctalia_lua="$HOME/.config/hypr/noctalia.lua"
    primary=$(grep 'local primary' "$noctalia_lua" | grep -oP '(?<=rgb\()[^)]+')
    [ -z "$primary" ] && primary="f5c2e7"

    r=$((16#''${primary:0:2}))
    g=$((16#''${primary:2:2}))
    b=$((16#''${primary:4:2}))
    color="\033[38;2;''${r};''${g};''${b}m"
    reset="\033[0m"

    random_art=$(find "$art_dir" -type f | shuf -n 1)
    art_height=$(wc -l < "$random_art")
    art_width=$(awk '{ print length }' "$random_art" | sort -rn | head -1)
    [ -z "$art_width" ] && art_width=0
    pad_top=$(( (${toString minHeight} - art_height) / 2 ))
    pad_left=$(( (${toString minWidth} - art_width) / 2 ))
    [ "$pad_top" -lt 0 ] && pad_top=0
    [ "$pad_left" -lt 0 ] && pad_left=0
    tmp_art=$(mktemp)
    trap 'rm -f "$tmp_art"' EXIT
    : > "$tmp_art"
    for _ in $(seq 1 "$pad_top"); do echo "" >> "$tmp_art"; done
    while IFS= read -r line || [ -n "$line" ]; do
      printf "%*s$color%s$reset\n" "$pad_left" "" "$line" >> "$tmp_art"
    done < "$random_art"
    ${pkgs.fastfetch}/bin/fastfetch --logo-type file --logo "$tmp_art" "$@" | \
      sed -e 's/Intel(R) Core(TM) //' \
          -e 's/(R)//g' -e 's/(TM)//g' \
          -e 's/NVIDIA GeForce //' \
          -e 's/ \[Discrete\]//' | \
      tr '[:upper:]' '[:lower:]'
  '';
in
{
  home.packages = [ fastfetch-random ];

  xdg.configFile."fastfetch/config.jsonc".text = builtins.toJSON {
    logo = {
      type = "file";
      source = "/tmp/placeholder";
    };
    display = {
      separator = "";
      color = {
        keys = "#f5c2e7";
        title = "#f5c2e7";
      };
    };
    modules = [
      {
        type = "custom";
        format = "╭─────────────────╮";
      }
      {
        type = "title";
        key = "│ ";
        format = "{user-name}@{host-name}";
      }
      {
        type = "os";
        key = "│ os     ";
        keyWidth = 0;
        format = "nixos {version}";
      }
      {
        type = "kernel";
        key = "│ krnl   ";
        keyWidth = 0;
        format = "{release}";
      }
      {
        type = "packages";
        key = "│ pkgs   ";
        keyWidth = 0;
      }
      {
        type = "cpu";
        key = "│ cpu    ";
        keyWidth = 0;
        format = "{name}";
      }
      {
        type = "gpu";
        key = "│ gpu    ";
        keyWidth = 0;
        format = "{name}";
      }
      {
        type = "memory";
        key = "│ mem    ";
        keyWidth = 0;
        format = "{used} / {total}";
      }
      {
        type = "uptime";
        key = "│ uptime ";
        keyWidth = 0;
        format = "{hours}h {minutes}m";
      }
      {
        type = "custom";
        format = "╰─────────────────╯";
      }
    ];
  };
}
