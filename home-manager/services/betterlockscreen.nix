{ config, pkgs, ... }:

{
  # install betterlockscreen
  home.packages = with pkgs; [
    betterlockscreen
  ];

  # define the lockscreen image path
  home.sessionVariables = {
    BETTERLOCKSCREEN_IMAGE = "/path/to/your/image.jpg"; # Set your image path
  };

  # cache the lockscreen image at login
  systemd.user.services.cache-betterlockscreen = {
    enable = true;
    description = "Cache betterlockscreen image";
    script = ''
      betterlockscreen -u ${config.home.sessionVariables.BETTERLOCKSCREEN_IMAGE}
    '';
    wantedBy = [ "default.target" ];
  };

  # lock the screen with betterlockscreen
  systemd.user.services.lock-screen = {
    enable = true;
    description = "Lock the screen using betterlockscreen";
    script = ''
      betterlockscreen -l --span
    '';
    wantedBy = [ "default.target" ];
  };
}

