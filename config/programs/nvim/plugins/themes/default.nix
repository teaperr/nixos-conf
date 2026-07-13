{
  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          accent = "pink";
          background = {
            dark = "mocha";
          };
          flavour = "mocha";
          highlight_overrides.mocha = {
            FloatBorder = {
              fg = "#f5c2e7";
            };
            NormalFloat = {
              bg = "NONE";
            };
            LineNr = {
              fg = "#f5c2e7";
            };
            LineNrAbove = {
              fg = "#f5c2e7";
            };
            LineNrBelow = {
              fg = "#f5c2e7";
            };
          };
          no_bold = false;
          no_italic = false;
          no_underline = false;
          integrations = {
            cmp = true;
            notify = true;
            gitsigns = true;
            which_key = true;
            illuminate = {
              enabled = true;
              lsp = true;
            };
            treesitter = true;
            telescope.enabled = true;
            indent_blankline = {
              enabled = true;
              scope_color = "pink";
              colored_indent_levels = false;
            };
            nvimtree = true;
            lualine = true;
          };
        };
      };
    };
  };
}
