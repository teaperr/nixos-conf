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

  # auto mount secondary drive
  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-partuuid/66f2df75-5b23-4d25-9137-96f4497555b7";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

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
  };

  users.users.lotus = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "ydotool"
      "plugdev"
      "dialout"
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

  environment.systemPackages = with pkgs; [
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
  ];

  # services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
