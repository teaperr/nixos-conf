export QT_SCREEN_SCALE_FACTORS="1;1"
export GBM_BACKEND="nvidia-drm"
export __GLX_VENDOR_LIBRARY_NAME="nvidia"
export _JAVA_AWT_WM_NONREPARENTING="1"
export ANV_QUEUE_THREAD_DISABLE="1"
export QT_QPA_PLATFORM="wayland"
export CLUTTER_BACKEND="wayland"
export SDL_VIDEODRIVER="wayland"
export XDG_SESSION_TYPE="wayland"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

t() {
	tmux set-environment WAYLAND_DISPLAY "$WAYLAND_DISPLAY"
	tmux set-environment HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"
	tmux set-environment XDG_RUNTIME_DIR "$XDG_RUNTIME_DIR"
	tmux new-session -t 0
}

function copy() {
	if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
		wl-copy
	else
		xclip -selection clipboard
	fi
}

function copyfile() {
if [ -z "$1" ] || [ ! -f "$1" ]; then
	echo "Error: Please provide a valid file." >&2
	return 1
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	wl-copy < "$1"
else
	xclip -selection clipboard < "$1"
fi
}

PATH=~/.cargo/bin:$PATH

bindkey '^Y' autosuggest-accept
bindkey '^X' kill-whole-line

eval "$(starship init zsh)"

# starts the prompt at the bottom of the screen
tput cup 9999 0
