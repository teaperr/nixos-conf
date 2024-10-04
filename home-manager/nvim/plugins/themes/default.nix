{
  programs.nixvim = {
		colorschemes = {
			catppuccin = {
				enable = true;
				settings = {
					background = {
						dark = "mocha";
					};
					flavour = "mocha";
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
						
					};
				};
			};
		};
  };
}
