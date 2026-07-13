{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg/".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/hm/config/programs/cs2/cfg";
}
