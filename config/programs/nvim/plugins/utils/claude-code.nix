{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    claude-code
  ];

  programs.nixvim = {
    plugins.claude-code = {
      enable = true;
      autoLoad = true;
      settings = {
        window = {
          split_ratio = 0.4;
          position = "vertical";
          enter_insert = true;
        };
        refresh = {
          enable = true;
          updatetime = 100;
          timer_interval = 1000;
          show_notifications = true;
        };
        keymaps = {
          toggle = {
            normal = "<C-,>";
            variants = {
              continue = "<leader>cC";
              verbose = "<leader>cV";
            };
          };
          window_navigation = true;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>b";
        action = ":ClaudeCode<Enter>";
      }
    ];
  };
}
