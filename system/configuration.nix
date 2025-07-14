{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./services
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	security.polkit.enable = true;

	services.cloudflare-warp.enable = true;

	services.printing = {
		enable = true;
		drivers = [ pkgs.hplip pkgs.gutenprint ];
	};

  # Bootloader.
	# UNCOMMENT THIS LINE, AND DISABLE GRUB TO SWITCH TO SYSTEMD BOOT
  # boot.loader.systemd-boot.enable = true;
	boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.grub = {
    default = "saved";
    enable = true;
    efiSupport = true;
    useOSProber = true;
    copyKernels = false;
    devices = [ "nodev" ];
    efiInstallAsRemovable = true;
    extraConfig = ''
menuentry 'Arch Linux (rolling) (on /dev/nvme0n1p1)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-2134f490-b35b-4d68-a850-e126953c75db' {
    savedefault
    insmod part_gpt
    insmod ext2
    search --no-floppy --fs-uuid --set=root 2134f490-b35b-4d68-a850-e126953c75db
    linux /vmlinuz-linux root=/dev/nvme0n1p1
    initrd /initramfs-linux.img
}
    '';
 };
  boot.loader.efi.canTouchEfiVariables = false;

	# boot.kernelParams = [
	# 	"intel_pstate=performance"
	# ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_US.UTF-8";
  #   LC_IDENTIFICATION = "en_US.UTF-8";
  #   LC_MEASUREMENT = "en_US.UTF-8";
  #   LC_MONETARY = "en_US.UTF-8";
  #   LC_NAME = "en_US.UTF-8";
  #   LC_NUMERIC = "en_US.UTF-8";
  #   LC_PAPER = "en_US.UTF-8";
  #   LC_TELEPHONE = "en_US.UTF-8";
  #   LC_TIME = "en_US.UTF-8";
  # };

  services.displayManager = {
    ly.enable = true;
    defaultSession = "none+openbox";
		sddm.settings = {
			# Autologin = {
			# 	Session = "none+openbox";
			# 	User = "lotus";
			# };
		};
  };

	programs.labwc.enable = true;
	programs.sway.enable = true;
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};


  environment.etc."xdg/wayland-sessions/sway.desktop".text = ''
    [Desktop Entry]
    Name=Sway
    Exec=sway
    Type=Application
    DesktopNames=sway
  '';

	#  services.greetd = {
	#    enable = true;
	#    settings = {
	#      default_session = {
	#        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd openbox";
	# user = "lotus";
	#      };
	#    };
	#  };

  services.xserver = {
    desktopManager = {
      plasma6.enable = true;
      xfce.enable = true;
    };
    windowManager = {
      openbox.enable = true;
    };
  };

  # Configure X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
		config = ''
Section "InputClass"
	Identifier "Disable Emulate3Buttons"
	MatchIsPointer "on"
	Option "Emulate3Buttons" "false"
EndSection

		'';
  };

	services.thermald.enable = true;
	powerManagement.cpuFreqGovernor = "performance";

  security = {
    sudo = {
      enable = true;
      extraConfig = ''
        Defaults timestamp_timeout=15
				Defaults timestamp_type=global
      '';
		};
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.defaultUserShell = pkgs.zsh;

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lotus = {
    isNormalUser = true;
    description = "lotus";
    extraGroups = [ "networkmanager" "wheel" "dialout" "adbusers" "docker" ];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

	programs.adb.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # package list
  environment.systemPackages = with pkgs; [
		distrobox
		sway
		swaylock
		swayidle
    home-manager
    wget
    git
    alacritty
    zsh
    unzip
    gcc
    os-prober
    grub2
    grub2_efi
    efibootmgr
    arch-install-scripts
    i3lock-fancy-rapid
		killall
  ];
	
	environment.variables = {
  };

  # font list
  fonts.packages = with pkgs; [
		nerd-fonts.hack
  ];

  # List services that you want to enable:

  services = {
    openssh.enable = true;
  };

  networking.firewall.enable = false;

  system.stateVersion = "24.05";

	programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

	services.seatd.enable = true;

	# set up swap file 
	swapDevices = [{
		device = "/swapfile";
		size = 8 * 1024;
	}];

	nixpkgs.config.permittedInsecurePackages = [
		"dotnet-runtime-wrapped-7.0.20"
		"dotnet-runtime-7.0.20"
	];
}

