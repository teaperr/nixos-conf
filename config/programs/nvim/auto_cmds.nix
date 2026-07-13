{ config, pkgs, ... }:

{
  programs.nixvim = {
		autoGroups = {
			highlight_yank = {};
		};

		autoCmd = [
			{
				event = "FileType";
				pattern = "netrw";
				command = "setlocal number relativenumber";
			}
			{
				group = "highlight_yank";
				event = ["TextYankPost"];
				pattern = "*";
				callback = {
					__raw = ''
						function()
							vim.highlight.on_yank()
						end
					'';
				};
			}
		];
  };
}
