{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./file_types.nix
  ]
  ++ lib.fileset.toList (lib.fileset.fileFilter (file: file.hasExt "nix") ./plugins);
}
