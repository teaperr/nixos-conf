# { config, pkgs, ... }:
#
# let
#   libratbag_0_17 = pkgs.stdenv.mkDerivation rec {
#     pname = "libratbag";
#     version = "0.17";
#
#     src = pkgs.fetchFromGitHub {
#       owner = "libratbag";
#       repo = "libratbag";
#       rev = "v${version}";
#       sha256 = "sha256-TQ8DVj4yqq3IA0oGnLDz+QNTyNRmGqspEjkPeBmXNew=";
#     };
#
#     nativeBuildInputs = [
#       pkgs.meson pkgs.ninja pkgs.pkg-config pkgs.gitMinimal pkgs.swig pkgs.check pkgs.valgrind
#       pkgs.wrapGAppsNoGuiHook pkgs.gobject-introspection
#     ];
#
#     buildInputs = [
#       pkgs.glib pkgs.systemd pkgs.udev pkgs.libevdev pkgs.json-glib pkgs.libunistring
#       (pkgs.python3.withPackages (ps: with ps; [ evdev pygobject3 ]))
#     ];
#
#     mesonFlags = [
#       "-Dsystemd-unit-dir=./lib/systemd/system/"
#     ];
#
#     meta = with pkgs.lib; {
#       description = "Configuration library for gaming mice";
#       homepage    = "https://github.com/libratbag/libratbag";
#       license     = licenses.mit;
#       maintainers = with maintainers; [ mvnetbiz ];
#       platforms   = platforms.linux;
#     };
#   };
# in {
#   environment.systemPackages = [
#     libratbag_0_17
#   ];
# }
#
{}
