{
  programs.nixvim = {
		plugins.markdown-preview = {
			enable = true;
			settings = {
				browser = "librewolf";
				echo_preview_url = 1;
				port = "1312";
				preview_options = {
					disable_filename = 1;
				};
				theme = "dark";
			};
		};
		keymaps = [
			{
				mode = "n";
				key = "<leader>mp";
				action = "<cmd>MarkdownPreview<cr>";
				options.desc = "Toggle markdown preview";
			}
		];
  };
}
