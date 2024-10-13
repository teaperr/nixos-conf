{
	home.file = {
		".config/rmpc/config.ron".text = ''#![enable(implicit_some)]
#![enable(unwrap_newtypes)]
#![enable(unwrap_variant_newtypes)]
(
    address: "127.0.0.1:6600",
    theme: None,
    cache_dir: None,
    on_song_change: ["~/.config/rmpc/scripts/notify"],
    volume_step: 5,
    status_update_interval_ms: 1000,
    select_current_song_on_change: true,
    album_art: (
        method: Auto,
        max_size_px: (width: 600, height: 600),
    ),
    keybinds: (
        global: {
            ":":       CommandMode,
            "3":       ArtistsTab,
            ",":       VolumeDown,
            "s":       Stop,
            ".":       VolumeUp,
            "c":       ToggleSingle,
            "1":       QueueTab,
            "6":       SearchTab,
            "<Right>": NextTab,
            "<Tab>":   NextTab,
            "5":       PlaylistsTab,
            "<Left>":  PreviousTab,
            "<S-Tab>": PreviousTab,
            "q":       Quit,
            "4":       AlbumsTab,
            "x":       ToggleRandom,
            ">":       NextTrack,
            "<":       PreviousTrack,
            "f":       SeekForward,
            "v":       ToggleConsume,
            "2":       DirectoriesTab,
            "p":       TogglePause,
            "z":       ToggleRepeat,
            "b":       SeekBack,
            "~":       ShowHelp,
            "O":       ShowOutputs,
        },
        navigation: {
            "<C-u>":   UpHalf,
            "N":       PreviousResult,
            "a":       Add,
            "A":       AddAll,
            "r":       Rename,
            "n":       NextResult,
            "g":       Top,
            "<Space>": Select,
            "G":       Bottom,
            "h":       Left,
            "<CR>":    Confirm,
            "i":       FocusInput,
            "J":       MoveDown,
            "j":       Down,
            "<C-d>":   DownHalf,
            "/":       EnterSearch,
            "<C-c>":   Close,
            "<Esc>":   Close,
            "K":       MoveUp,
            "l":       Right,
            "D":       Delete,
            "k":       Up,
        },
        queue: {
            "D":       DeleteAll,
            "<CR>":    Play,
            "<C-s>":   Save,
            "a":       AddToPlaylist,
            "d":       Delete,
        },
    ),
)

'';
		".config/rmpc/scripts/notify" = {
			text = ''
#!/usr/bin/env sh

# Directory where to store temporary data
TMP_DIR="/tmp/rmpc"

# Ensure the directory is created
mkdir -p "$TMP_DIR"

# Where to temporarily store the album art received from rmpc
ALBUM_ART_PATH="$TMP_DIR/notification_cover"

# Path to fallback album art if no album art is found by rmpc/mpd
# Change this to your needs
DEFAULT_ALBUM_ART_PATH="$TMP_DIR/default_album_art.jpg"

# Save album art of the currently playing song to a file
if ! rmpc albumart --output "$ALBUM_ART_PATH"; then
    # Use default album art if rmpc returns non-zero exit code
    ALBUM_ART_PATH="$\{DEFAULT_ALBUM_ART_PATH}"
fi

# Send the notification
dunstify -i "$\{ALBUM_ART_PATH}" "Now Playing" "$ARTIST - $TITLE"
		'';
		executable = true;
		};
	};
}
