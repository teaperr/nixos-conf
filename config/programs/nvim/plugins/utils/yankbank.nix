{
  config,
  pkgs,
  lib,
  ...
}:
let
  yankbank-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "yankbank-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ptdewey";
      repo = "yankbank-nvim";
      rev = "main";
      sha256 = "1512y4d1m52xav1ia9wp2dyq7gf3j8gfrp5lg0xn90diamwp88px";
    };
    # tell the build check that sqlite-lua provides the missing module
    dependencies = [ pkgs.vimPlugins.sqlite-lua ];
  };
in
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.sqlite-lua
      yankbank-nvim
    ];

    globals = {
      sqlite_clib_path = "${pkgs.sqlite.out}/lib/libsqlite3${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}";
    };

    extraConfigLua = ''
      require('yankbank').setup({
        persist_type = nil,
        focus_gain_poll = true,
        num_behavior = "jump",
        max_entries = 10,
      })
      vim.keymap.set("n", "<leader>r", "<cmd>YankBank<CR>", { noremap = true })
    '';
  };
}
# 157wz9nka7g66ywyrqrni64g3a45k60v49l18ym6ipk0g3xji8xv
# 1512y4d1m52xav1ia9wp2dyq7gf3j8gfrp5lg0xn90diamwp88px
