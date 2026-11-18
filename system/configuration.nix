{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.download-buffer-size = 1073741824; # 1GB

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      mpv-unwrapped
    ];
  };

  imports = [
    # <home-manager/nixos>
    ./hardware-configuration.nix
    ./boot.nix
    ./hyprland.nix
    ./nvidia.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=-1
     	'';

  networking.hostName = "nixos";

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  time.timeZone = "Europe/London";

  # set internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true;
  };

  services.flatpak.enable = true;

  xdg.systemDirs.data = [
    "/var/lib/flatpak/exports/share"
    "${config.home.homeDirectory}/.local/share/flatpak/exports/share"
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };
    desktopManager = {
      xfce.enable = true;
      gnome.enable = true;
    };
  };

  environment.xfce.excludePackages = with pkgs.xfce; [
    xfce4-notifyd
  ];

  boot.extraModprobeConfig = ''
      	options hid_apple fnmode=2
    	'';

  # services.desktopManager.plasma6.enable = true;
  # services.desktopManager.openbox.enable = true;

  services.displayManager = {
    ly.enable = true;
    autoLogin = {
      enable = true;
      user = "lotus";
    };
    defaultSession = "hyprland";
  };

  # services.printing.enable = true;

  # enable audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    extraLadspaPackages = [ pkgs.rnnoise-plugin ];
  };

  users.users.lotus = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "ydotool"
      "plugdev"
      "dialout"
      "libvirtd"
      "adbusers"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      vencord
    ];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="3367", GROUP="plugdev", MODE="0660", TAG+="uaccess"
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3367", GROUP="plugdev", MODE="0660", TAG+="uaccess"
  '';

  programs.ydotool.enable = true;

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamescope.enable = true;

  programs.gamemode.enable = true;
  programs.gamemode.settings = {
    general = {
      renice = 10;
    };
    custom = {
      start = "${pkgs.libnotify}/bin/notify-send 'GameMode Started'";
      end = "${pkgs.libnotify}/bin/notify-send 'GameMode Ended'";
    };
  };

  environment.systemPackages = with pkgs; [
    android-tools
    git
    limine
    vim
    librewolf
    tmux
    wget
    tree
    yazi
    wl-clipboard
    wayland-utils
    libinput
    xinit
    openbox
    appimage-run
    webkitgtk_4_1
    pulseaudio
    linuxPackages.cpupower
    networkmanager-openvpn

    virtio-win
  ];

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "26.05";

  # qemu
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;
}
