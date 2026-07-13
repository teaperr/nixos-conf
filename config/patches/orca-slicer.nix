{ config, pkgs, ... }:

{
  home.packages = [
    # (pkgs.symlinkJoin {
    #   name = "orca-slicer-wrapped";
    #   paths = [ pkgs.orca-slicer ];
    #   buildInputs = [ pkgs.makeWrapper ];
    #   postBuild = ''
    #     wrapProgram $out/bin/orca-slicer \
    #       --unset GBM_BACKEND \
    #       --unset __EGL_EXTERNAL_PLATFORM_CONFIG_DIRS \
    #       --unset DRI_PRIME \
    #       --set __GLX_VENDOR_LIBRARY_NAME mesa \
    #       --set __EGL_VENDOR_LIBRARY_FILENAMES ${pkgs.mesa}/share/glvnd/egl_vendor.d/50_mesa.json \
    #       --set MESA_LOADER_DRIVER_OVERRIDE zink \
    #       --set GALLIUM_DRIVER zink
    #   '';
    # })
    pkgs.orca-slicer
  ];
}
