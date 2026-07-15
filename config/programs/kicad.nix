{
  config,
  pkgs,
  lib,
  ...
}:
# let
  # Adwaita-dark, recoloured to Catppuccin Mocha, used only for KiCad
  # kicadGtkTheme = pkgs.runCommand "adwaita-catppuccin-mocha-kicad" { } ''
        # mkdir -p $out/share/themes/Adwaita-Catppuccin-KiCad/gtk-3.0
        # mkdir -p $out/share/themes/Adwaita-Catppuccin-KiCad/gtk-4.0
# 
        # # Pull in real Adwaita-dark as the structural base
        # cp -r ${pkgs.gnome-themes-extra}/share/themes/Adwaita-dark/gtk-3.0/* \
          # $out/share/themes/Adwaita-Catppuccin-KiCad/gtk-3.0/
# 
        # # Override just the named colors Adwaita's gtk-3.0 css consumes
        # cat > $out/share/themes/Adwaita-Catppuccin-KiCad/gtk-3.0/gtk-mocha-overrides.css <<'EOF'
    		# @define-color theme_bg_color rgba(30, 30, 46, 0.85);
    		# @define-color theme_base_color rgba(24, 24, 37, 0.85);
        # @define-color theme_base_color #181825;
        # @define-color theme_text_color #cdd6f4;
        # @define-color theme_selected_bg_color #cba6f7;
        # @define-color theme_selected_fg_color #1e1e2e;
        # @define-color insensitive_bg_color #313244;
        # @define-color insensitive_fg_color #6c7086;
        # @define-color borders #585b70;
        # @define-color warning_color #f9e2af;
        # @define-color error_color #f38ba8;
        # @define-color success_color #a6e3a1;
        # EOF

        # Import the override after Adwaita's own gtk.css so it wins
        # echo '@import url("gtk-mocha-overrides.css");' >> \
          # $out/share/themes/Adwaita-Catppuccin-KiCad/gtk-3.0/gtk-dark.css
  # '';

  # kicadWrapped = pkgs.symlinkJoin {
    # name = "kicad-themed";
    # paths = [ pkgs.kicad ];
    # buildInputs = [ pkgs.makeWrapper ];
    # postBuild = ''
      # wrapProgram $out/bin/kicad \
        # --set GTK_THEME "Adwaita-Catppuccin-KiCad:dark" \
        # --set GTK_DATA_PREFIX "${kicadGtkTheme}" \
        # --prefix XDG_DATA_DIRS : "${kicadGtkTheme}/share"
    # '';
  # };
# in
{
 # home.packages = [ kicadWrapped ];
}
