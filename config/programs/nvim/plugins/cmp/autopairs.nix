{
  programs.nixvim = {
    plugins.nvim-autopairs = {
			enable = true;
      settings = {
        check_ts = true;
        custom_rules = ''
          local npairs = require('nvim-autopairs')
          local Rule = require('nvim-autopairs.rule')

          npairs.add_rules({
            Rule("{", "}", "lua")
              :with_pair(function(opts)
                return opts.line:sub(opts.col, opts.col) == "{"
              end)
              :with_move(function(opts) return opts.prev_char:match(".%}") ~= nil end)
              :use_key("}")
              :with_cr(true)
          })
        '';
			};
    };
  };
}
