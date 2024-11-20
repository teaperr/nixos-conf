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
		(pkgs.vimUtils.buildVimPlugin {
			name = "tldr";
			src = pkgs.fetchFromGitHub {
				owner = "mrjones2014";
				repo = "tldr.nvim";
				rev = "master";
        sha256 = "1ypabfm4nb5a08146218qpjqgymbcacl1c4k6ypnvsa723yshl9v";
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
