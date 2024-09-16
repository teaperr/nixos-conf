{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Thea Blake";
    userEmail = "teablake2006@gmail.com";
  }
}
