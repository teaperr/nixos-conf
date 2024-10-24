{ pkgs, ... }:

{
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		arduino-ide
		github-desktop
		orca-slicer
		jq
		nicotine-plus
		vlc
		platformio
		avrdude
		xorg.xauth
		xorg.xhost
		alsa-utils
		texliveFull
		tectonic
		flameshot
		nodePackages.live-server
		feh
		exiftool
		gdu
		fzf
		rmpc
		mpd
		mpdscribble
		lutris
		wineWowPackages.full
		winetricks
		protonplus
		steam
		speedcrunch
		libreoffice-qt6-fresh
		haskellPackages.doctemplates
		pandoc
		obconf
		pavucontrol
		catimg
		haskellPackages.greenclip
		ripgrep
		ueberzugpp
		arandr
    fastfetch
    zsh
    git
		github-cli
    tmux
    librewolf
    xclip
    zsh-autosuggestions
    zsh-syntax-highlighting
    tree
    librewolf
    tmux
    vesktop
    xorg.xinput
    btop
    htop
    catppuccin
    rofi
    tint2
    spaceFM
    volumeicon
    dunst
    obs-studio
    xterm
    betterlockscreen
    imagemagick
    cmake
    gnumake
    picom
    krita
	];

}
