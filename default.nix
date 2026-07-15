{
  config,
  pkgs,
  lib,
  ...
}:

{
  news.display = "silent";
  imports = [
    ./config
  ];
}
