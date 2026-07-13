#!/usr/bin/env bash
sleep 0.5
hyprctl reload

#!/usr/bin/env bash
sleep 0.5
hyprctl reload

NOCTALIA_LUA="$HOME/.config/hypr/noctalia.lua"
MATUGEN_LUA="$HOME/.config/nvim/lua/matugen.lua"

# from noctalia.lua (for hyprland/wofi/vesktop)
primary=$(grep 'local primary' "$NOCTALIA_LUA" | grep -oP '(?<=rgb\()[^)]+')
surface=$(grep 'local surface' "$NOCTALIA_LUA" | grep -oP '(?<=rgb\()[^)]+')
secondary=$(grep 'local secondary' "$NOCTALIA_LUA" | grep -oP '(?<=rgb\()[^)]+')
error=$(grep 'local error' "$NOCTALIA_LUA" | grep -oP '(?<=rgb\()[^)]+')

# from matugen.lua (richer palette for terminal theming)
base00=$(grep "base00" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # background
base01=$(grep "base01" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # alt background
base02=$(grep "base02" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # selection
base03=$(grep "base03" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # comments
base04=$(grep "base04" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # dark foreground
base05=$(grep "base05" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # foreground
base08=$(grep "base08" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # red/error
base09=$(grep "base09" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # orange/teal
base0A=$(grep "base0A" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # yellow
base0B=$(grep "base0B" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # green
base0C=$(grep "base0C" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # cyan
base0D=$(grep "base0D" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # blue/accent
base0E=$(grep "base0E" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # purple
base0F=$(grep "base0F" "$MATUGEN_LUA" | grep -oP '(?<=#)[0-9a-f]{6}')  # dark red

echo \#$base00
echo \#$base01
echo \#$base02
echo \#$base03
echo \#$base04
echo \#$base05
echo \#$base08
echo \#$base09
echo \#$base0A
echo \#$base0B
echo \#$base0C
echo \#$base0D
echo \#$base0E
echo \#$base0F

# ── wofi ──────────────────────────────────────────────────────────────
mkdir -p "$HOME/.config/wofi"
cat > "$HOME/.config/wofi/style.css" << EOF
* {
  font-family: "JetBrainsMono Nerd Font";
  font-size: 13px;
}

window {
  background-color: #${surface};
  border: 2px solid #${primary};
  border-radius: 8px;
}

#input {
  background-color: #${surface};
  color: #${secondary};
  border: none;
  border-bottom: 2px solid #${primary};
  border-radius: 8px 8px 0 0;
  padding: 8px 12px;
  margin: 0;
}

#input:focus {
  border-bottom-color: #${primary};
  box-shadow: none;
}

#inner-box {
  background-color: #${surface};
}

#outer-box {
  background-color: #${surface};
  padding: 4px;
}

#scroll {
  background-color: #${surface};
}

#text {
  color: #${secondary};
  padding: 4px 8px;
}

#entry {
  border-radius: 4px;
  padding: 2px;
}

#entry:selected {
  background-color: #${primary};
}

#entry:selected #text {
  color: #${surface};
}
EOF

# ── vesktop ────────────────────────────────────────────────────────────
mkdir -p "$HOME/.config/vesktop/themes"
cat > "$HOME/.config/vesktop/themes/noctalia.css" << EOF
/**
 * @name Noctalia Dynamic
 * @description Dynamic theme synced to Noctalia wallpaper colors
 * @author noctalia-hook
 */

:root {
  --brand-experiment: #${primary};
  --brand-experiment-560: #${primary};
  --background-primary: #${surface};
  --background-secondary: #${surface};
  --background-secondary-alt: #${surface};
  --background-tertiary: #${surface};
  --background-accent: #${primary};
  --background-floating: #${surface};
  --background-modifier-selected: #${primary}33;
  --background-modifier-hover: #${primary}1a;
  --background-modifier-active: #${primary}26;
  --channeltextarea-background: #${surface};
  --text-normal: #${secondary};
  --text-muted: #${secondary}99;
  --text-link: #${primary};
  --interactive-normal: #${secondary};
  --interactive-hover: #${primary};
  --interactive-active: #${primary};
  --interactive-muted: #${secondary}66;
  --header-primary: #${secondary};
  --header-secondary: #${secondary}99;
  --scrollbar-thin-thumb: #${primary}66;
  --scrollbar-thin-track: transparent;
  --focus-primary: #${primary};
}
EOF

# ── Tmux ──────────────────────────────────────────────────────────────
cat > "$HOME/.config/tmux/noctalia-colors.conf" << EOF
set -g @thm_bg "#${base00}"
set -g @thm_fg "#${base05}"
set -g @thm_pink "#${base0E}"
set -g @thm_mauve "#${base0E}"
set -g @thm_blue "#${base0D}"
set -g @thm_lavender "#${base0D}"
set -g @thm_sapphire "#${base0C}"
set -g @thm_sky "#${base0C}"
set -g @thm_teal "#${base09}"
set -g @thm_green "#${base0B}"
set -g @thm_yellow "#${base0A}"
set -g @thm_peach "#${base09}"
set -g @thm_red "#${base08}"
set -g @thm_maroon "#${base0F}"
set -g @thm_mantle "#${base01}"
set -g @thm_crust "#${base00}"
set -g @thm_surface_0 "#${base01}"
set -g @thm_surface_1 "#${base02}"
set -g @thm_surface_2 "#${base03}"
set -g @thm_overlay_0 "#${base03}"
set -g @thm_overlay_1 "#${base04}"
set -g @thm_overlay_2 "#${base04}"
set -g @thm_subtext_0 "#${base04}"
set -g @thm_subtext_1 "#${base05}"

set -g pane-border-style "fg=#${base02}"
set -g pane-active-border-style "fg=#${base0D}"
set -g message-style "bg=#${base01},fg=#${base0D}"
set -g message-command-style "bg=#${base01},fg=#${base05}"
EOF

tmux list-sessions -F '#S' 2>/dev/null | while read -r session; do
  tmux source-file "$HOME/.config/tmux/noctalia-colors.conf" -t "$session" 2>/dev/null
done

# ── Starship ──────────────────────────────────────────────────────────
rm -f "$HOME/.config/starship.toml"
cat > "$HOME/.config/starship.toml" << EOF
format = """
[](fg:#${base0D})\
[ \$username ](bg:#${base0D} fg:#${base00})\
[](fg:#${base0D} bg:#${base02})\
[ 󰏩 ](bg:#${base02} fg:#${base0D})\
[](fg:#${base02} bg:#${base01})\
[ \$directory ](bg:#${base01} fg:#${base0D})\
[](fg:#${base01})\
 """

[username]
show_always = true
style_user = "bg:#${base0D} fg:#${base00}"
style_root = "bg:#${base08} fg:#${base00}"
format = "[\$user](\$style)"
disabled = false

[hostname]
ssh_only = false
style = "bg:#${base0D} fg:#${base00}"
format = "[\$hostname](\$style)"
disabled = false

[directory]
style = "bg:#${base01} fg:#${base0D}"
format = "[\$path](\$style)"
truncation_length = 3
truncation_symbol = "…/"

[character]
success_symbol = ""
error_symbol = ""

[git_branch]
disabled = true
[git_status]
disabled = true
[cmd_duration]
disabled = true
[python]
disabled = true
[nodejs]
disabled = true
[rust]
disabled = true
EOF

# ── Zsh ───────────────────────────────────────────────────────────────
mkdir -p "$HOME/.config/zsh"
cat > "$HOME/.config/zsh/noctalia-colors.zsh" << EOF
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${base03}"

ZSH_HIGHLIGHT_STYLES[default]="fg=#${base05}"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#${base08}"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=#${base0E}"
ZSH_HIGHLIGHT_STYLES[alias]="fg=#${base0D}"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#${base0D}"
ZSH_HIGHLIGHT_STYLES[function]="fg=#${base0D}"
ZSH_HIGHLIGHT_STYLES[command]="fg=#${base0B}"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=#${base0B}"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=#${base0C}"
ZSH_HIGHLIGHT_STYLES[path]="fg=#${base09}"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=#${base0A}"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=#${base0A}"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=#${base0A}"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=#${base0E}"
ZSH_HIGHLIGHT_STYLES[assign]="fg=#${base0C}"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=#${base0C}"
ZSH_HIGHLIGHT_STYLES[comment]="fg=#${base03}"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=#${base09}"
EOF

echo "Noctalia theme applied."
