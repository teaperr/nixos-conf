{
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
      };
      cmp-nvim-lsp = {
        enable = true;
      };
      cmp-path = {
        enable = true;
      };
      friendly-snippets = {
        enable = true;
      };
    };

    extraLuaPackages = ps: [
      ps.jsregexp
    ];

    plugins.cmp = {
      enable = true;
      settings = {
        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };

        completion = {
          completeopt = "menu,menuone,noinsert";
        };

        # Key bindings for nvim-cmp
        mapping = {
          # Navigate to next item in the completion menu
          "<Tab>" = "cmp.mapping.select_next_item()";
          # Navigate to previous item in the completion menu
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          # Scroll documentation
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          # Confirm the completion item
          "<Enter>" = "cmp.mapping.confirm { select = true }";
          # Manually trigger completion
          "<C-Space>" = "cmp.mapping.complete()";
          
          # Snippet navigation for Luasnip
          "<C-l>" = ''
            cmp.mapping(function()
              if require('luasnip').expand_or_locally_jumpable() then
                require('luasnip').expand_or_jump()
              end
            end, { 'i', 's' })
          '';
          "<C-h>" = ''
            cmp.mapping(function()
              if require('luasnip').locally_jumpable(-1) then
                require('luasnip').jump(-1)
              end
            end, { 'i', 's' })
          '';
        };

        # Define the sources for autocompletion
        sources = [
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
        ];
      };
    };
  };
}

