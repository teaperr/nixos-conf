{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "teaperr";
    userEmail = "teablake2006@gmail.com";
  };
}
