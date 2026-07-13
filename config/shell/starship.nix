{
  config,
  pkgs,
  lib,
  ...
}:

{
  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     format = lib.concatStrings [
  #       "[](fg:#f5c2e7)"
  #       "[ $username ](bg:#f5c2e7 fg:#1e1e2e)"
  #       "[](fg:#f5c2e7 bg:#45475a)"
  #       "[ 󰏩 ](bg:#45475a fg:#f5c2e7)"
  #       "[](fg:#45475a bg:#313244)"
  #       "[ $directory ](bg:#313244 fg:#f5c2e7)"
  #       "[](fg:#313244)"
  #       " "
  #     ];
  #
  #     username = {
  #       show_always = true;
  #       style_user = "bg:#f5c2e7 fg:#1e1e2e";
  #       style_root = "bg:#f5c2e7 fg:#1e1e2e";
  #       format = "[$user]($style)";
  #       disabled = false;
  #     };
  #
  #     hostname = {
  #       ssh_only = false;
  #       style = "bg:#f5c2e7 fg:#1e1e2e";
  #       format = "[$hostname]($style)";
  #       disabled = false;
  #     };
  #
  #     directory = {
  #       style = "bg:#313244 fg:#f5c2e7";
  #       format = "[$path]($style)";
  #       truncation_length = 3;
  #       truncation_symbol = "…/";
  #     };
  #
  #     character = {
  #       success_symbol = "";
  #       error_symbol = "";
  #     };
  #
  #     # disable everything else for a minimal look
  #     git_branch.disabled = true;
  #     git_status.disabled = true;
  #     cmd_duration.disabled = true;
  #     python.disabled = true;
  #     nodejs.disabled = true;
  #     rust.disabled = true;
  #   };
  # };
  home.packages = [ pkgs.starship ];
}
#  
