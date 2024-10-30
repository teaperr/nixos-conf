{pkgs, ...}:

{
	programs.nixvim.extraPlugins = [

		(pkgs.vimUtils.buildVimPlugin {
			name = "nvim-platformio";
			src = pkgs.fetchFromGitHub {
				owner = "anurag3301";
				repo = "nvim-platformio.lua";
				rev = "main";
         sha256 = "1jz6cn50yqs2valh7mwjacwxvlldjnblv1527bb9rg71in85lk70";
			};
		})
		pkgs.vimPlugins.nvim-web-devicons
  ];
	programs.nixvim = {
		plugins = {
			toggleterm.enable = true;
			rustaceanvim.enable = true;
		};
	};
}
