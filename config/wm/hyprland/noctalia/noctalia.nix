{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  home.file.".local/state/noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/hm/config/wm/hyprland/noctalia/noctalia-local/noctalia/";

  programs.noctalia = {
    enable = true;

    # Optional: systemd user service
    # systemd.enable = true;

    settings = {
      # ── Bar ────────────────────────────────────────────────────────────
      bar = {
        barType = "simple"; # "simple" | "frame"
        position = "top"; # "top" | "bottom" | "left" | "right"
        monitors = [ ];
        density = "default"; # "default" | "compact"
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 1;
        capsuleColorKey = "none";
        widgetSpacing = 6;
        contentPadding = 2;
        fontScale = 1;
        enableExclusionZoneInset = true;
        backgroundOpacity = 0.93;
        useSeparateOpacity = false;
        marginVertical = 4;
        marginHorizontal = 4;
        frameThickness = 8;
        frameRadius = 12;
        outerCorners = true;
        hideOnOverview = false;
        displayMode = "always_visible"; # "always_visible" | "auto_hide" | "never_visible"
        autoHideDelay = 500;
        autoShowDelay = 150;
        showOnWorkspaceSwitch = true;
        mouseWheelAction = "none";
        reverseScroll = false;
        mouseWheelWrap = true;
        middleClickAction = "none";
        middleClickFollowMouse = false;
        middleClickCommand = "";
        rightClickAction = "controlCenter";
        rightClickFollowMouse = true;
        rightClickCommand = "";
        screenOverrides = [ ];

        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "Clock"; }
            { id = "SystemMonitor"; }
            { id = "ActiveWindow"; }
            { id = "MediaMini"; }
          ];
          center = [
            { id = "Workspace"; }
          ];
          right = [
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            { id = "Battery"; }
            { id = "Volume"; }
            { id = "Brightness"; }
            { id = "ControlCenter"; }
          ];
        };
      };

      # ── General ────────────────────────────────────────────────────────
      general = {
        avatarImage = "";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockScreenAnimations = false;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableLockScreenMediaControls = false;
        enableShadows = true;
        enableBlurBehind = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        clockStyle = "custom";
        clockFormat = "hh\\nmm";
        passwordChars = false;
        lockScreenMonitors = [ ];
        lockScreenBlur = 0;
        lockScreenTint = 0;
        reverseScroll = false;
        smoothScrollEnabled = true;

        keybinds = {
          keyUp = [ "Up" ];
          keyDown = [ "Down" ];
          keyLeft = [ "Left" ];
          keyRight = [ "Right" ];
          keyEnter = [
            "Return"
            "Enter"
          ];
          keyEscape = [ "Esc" ];
          keyRemove = [ "Del" ];
        };
      };

      # ── UI ─────────────────────────────────────────────────────────────
      ui = {
        fontDefault = "";
        fontFixed = "";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        tooltipsEnabled = true;
        scrollbarAlwaysVisible = true;
        boxBorderEnabled = false;
        panelBackgroundOpacity = 0.93;
        translucentWidgets = false;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        settingsPanelSideBarCardStyle = false;
      };

      # ── Location / clock / weather ─────────────────────────────────────
      location = {
        name = ""; # e.g. "London, UK"
        weatherEnabled = true;
        weatherShowEffects = true;
        weatherTaliaMascotAlways = false;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1; # -1 = locale default, 0 = Sun, 1 = Mon
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
        autoLocate = true;
      };

      # ── Wallpaper ──────────────────────────────────────────────────────
      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single"; # "single" | "grid"
        setWallpaperOnAllMonitors = true;
        linkLightAndDarkWallpapers = true;
        fillMode = "crop"; # "crop" | "fit" | "stretch" | "tile"
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "pixelate"
          "honeycomb"
        ];
        skipStartupTransition = false;
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        useOriginalImages = false;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        sortOrder = "name";
        favorites = [ ];
      };

      # ── App Launcher ───────────────────────────────────────────────────
      appLauncher = {
        enableClipboardHistory = false;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        enableClipboardSmartIcons = true;
        enableClipboardChips = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center"; # "center" | "top" | "top_left" | "top_right"
        pinnedApps = [ ];
        sortByMostUsed = true;
        terminalCommand = "alacritty -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list"; # "list" | "grid"
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        enableSessionSearch = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
        overviewLayer = false;
        density = "default";
      };

      # ── Control Center ─────────────────────────────────────────────────
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            { id = "Network"; }
            { id = "Bluetooth"; }
            { id = "WallpaperSelector"; }
            { id = "NoctaliaPerformance"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "PowerProfile"; }
            { id = "KeepAwake"; }
            { id = "NightLight"; }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };

      # ── System Monitor ─────────────────────────────────────────────────
      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        diskAvailWarningThreshold = 20;
        diskAvailCriticalThreshold = 10;
        batteryWarningThreshold = 20;
        batteryCriticalThreshold = 5;
        enableDgpuMonitoring = false;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
      };

      # ── Dock ───────────────────────────────────────────────────────────
      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide"; # "always_visible" | "auto_hide" | "never_visible"
        dockType = "floating"; # "floating" | "panel"
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        showLauncherIcon = false;
        launcherPosition = "end";
        launcherUseDistroLogo = false;
        launcherIcon = "";
        launcherIconColor = "none";
        pinnedStatic = false;
        inactiveIndicators = false;
        groupApps = false;
        groupContextMenuMode = "extended";
        groupClickAction = "cycle";
        groupIndicatorStyle = "dots";
        deadOpacity = 0.6;
        animationSpeed = 1;
        sitOnFrame = false;
        showDockIndicator = false;
        indicatorThickness = 3;
        indicatorColor = "primary";
        indicatorOpacity = 0.6;
      };

      # ── Notifications ──────────────────────────────────────────────────
      notifications = {
        enabled = true;
        enableMarkdown = false;
        density = "default";
        monitors = [ ];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        clearDismissed = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = true;
        enableBatteryToast = true;
      };

      # ── OSD ────────────────────────────────────────────────────────────
      osd = {
        enabled = true;
        location = "top_right";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          0
          1
          2
        ]; # 0=volume, 1=brightness, 2=keyboard
        monitors = [ ];
      };

      # ── Audio ──────────────────────────────────────────────────────────
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        spectrumFrameRate = 30;
        visualizerType = "linear";
        spectrumMirrored = true;
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
        volumeFeedbackSoundFile = "";
      };

      # ── Brightness ─────────────────────────────────────────────────────
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
        backlightDeviceMappings = [ ];
      };

      # ── Color Schemes ──────────────────────────────────────────────────
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Noctalia (default)";
        # Other built-ins: "Catppuccin", "Monochrome", "Nord", "Dracula", etc.
        darkMode = true;
        schedulingMode = "off"; # "off" | "auto" | "manual"
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "tonal-spot";
        monitorForColors = "";
        syncGsettings = true;
      };

      # ── Night Light ────────────────────────────────────────────────────
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      # ── Idle ───────────────────────────────────────────────────────────
      idle = {
        enabled = false;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
        fadeDuration = 5;
        screenOffCommand = "";
        lockCommand = "";
        suspendCommand = "";
        resumeScreenOffCommand = "";
        resumeLockCommand = "";
        resumeSuspendCommand = "";
        customCommands = "[]";
      };

      # ── Hooks ──────────────────────────────────────────────────────────
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
        colorGeneration = "";
      };

      # ── Desktop Widgets ────────────────────────────────────────────────
      desktopWidgets = {
        enabled = false;
        overviewEnabled = true;
        gridSnap = false;
        gridSnapScale = false;
        monitorWidgets = [ ];
      };

      # ── Templates ─────────────────────────────────────────────────────
      templates = {
        activeTemplates = [ ];
        enableUserTheming = false;
      };
    };

    # ── Material 3 Colors (set ALL of them or none) ────────────────────
    # colors = {
    #   mPrimary = "#f5c2e7"; # pink for Catppuccin Mocha
    #   mOnPrimary = "#1e1e2e";
    #   mSecondary = "#cba6f7";
    #   mOnSecondary = "#1e1e2e";
    #   mTertiary = "#89b4fa";
    #   mOnTertiary = "#1e1e2e";
    #   mError = "#f38ba8";
    #   mOnError = "#1e1e2e";
    #   mSurface = "#1e1e2e";
    #   mSurfaceVariant = "#313244";
    #   mHover = "#45475a";
    #   mOnSurface = "#cdd6f4";
    #   mOnSurfaceVariant = "#bac2de";
    #   mOnHover = "#cdd6f4";
    #   mOutline = "#6c7086";
    #   mShadow = "#000000";
    # };

    # ── Plugins ────────────────────────────────────────────────────────
    # plugins = {
    #   sources = [
    #     {
    #       enabled = true;
    #       name = "Official";
    #       url = "https://github.com/noctalia-dev/noctalia-plugins";
    #     }
    #   ];
    #   states = {
    #     catwalk = {
    #       enabled = true;
    #       sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
    #     };
    #   };
    #   version = 2;
    # };

    # ── User Templates ─────────────────────────────────────────────────
    # user-templates = { ... }; # attrset, string, or path to .toml
  };
}
