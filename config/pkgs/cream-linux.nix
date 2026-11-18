let
  creamlinux = import (builtins.fetchTarball {
    url = "https://github.com/Novattz/creamlinux-installer/archive/main.tar.gz";
    sha256 = ""; # See above
  }) { inherit pkgs; };
in
{
  home.packages = [ creamlinux ];
}
