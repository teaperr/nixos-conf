{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins.dial.enable = true;

    extraConfigLua = ''
      local augend = require("dial.augend")

      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.constant.new {
            elements = { "yes", "no" },
            word = true,
            cyclic = true,
          },
          augend.constant.new {
            elements = { "on", "off" },
            word = true,
            cyclic = true,
          },
        },
      }

      vim.keymap.set("n", "c=",  require("dial.map").inc_normal(),  { noremap = true })
      vim.keymap.set("n", "c-",  require("dial.map").dec_normal(),  { noremap = true })
      vim.keymap.set("v", "c=",  require("dial.map").inc_visual(),  { noremap = true })
      vim.keymap.set("v", "c-",  require("dial.map").dec_visual(),  { noremap = true })
      vim.keymap.set("v", "c=", require("dial.map").inc_gvisual(), { noremap = true })
      vim.keymap.set("v", "c-", require("dial.map").dec_gvisual(), { noremap = true })
    '';
  };
}
