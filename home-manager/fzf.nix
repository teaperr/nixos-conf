{ pkgs, config, ... }:

{
	programs.fzf = {
		enable = true;
		catppuccin.enable = false;
		enableZshIntegration = true;
		tmux.enableShellIntegration = true;
		defaultOptions = [
			"--preview 'cat {}'"
			"--color bg+:#313244,fg:#cdd6f4,fg+:#cdd6f4,header:#f5c2e7,hl:#f5c2e7,hl+:#f5c2e7,info:#f5c2e7,marker:#f5c2e7,pointer:#f5c2e7,prompt:#f5c2e7,spinner:#f5e0dc"

		];
	};
}
