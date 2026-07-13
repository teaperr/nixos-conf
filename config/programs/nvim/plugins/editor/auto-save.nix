{ pkgs, config, ... }:
{
  programs.nixvim = {
    plugins.auto-save = {
      enable = true;

      settings = {
        noautocmd = true;

        triggerEvents = [
          "InsertLeave"
          "TextChanged"
        ];
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>as";
        action = "<cmd>ASToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle Auto-Save";
        };
      }
    ];
  };
}
