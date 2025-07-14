{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "tmux" ];
    };

    sessionVariables = {
      EDITOR = "nvim";
			MANPAGER = "nvim +Man!";
      # ZSH_TMUX_FIXTERM_WITH_256COLOR = "TRUE";
      ZSH_TMUX_AUTOSTART = "TRUE";
      CASE_SENSITIVE = "TRUE";
      ENABLE_CORRECTION = "TRUE";
      COMPLETION_WAITING_DOTS = "...";
			ZSH_COMPDUMP = "$ZSH/cache/.zcompdump-$HOST";
      # COLORTERM = "truecolor";
      # TERM = "xterm-256color";
    };

    shellAliases = {
      rsrc = "source ~/.zshrc";
      please = "sudo $(fc -ln -1)";
      grep = "grep --color=auto";
      kys = "rm -rf";
      update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
      tma = "tmux attach";
      autoremove = "sudo pacman -R $(pacman -Qdtq)";
			unfuck="git reset HEAD~1 --soft";
			ff = "fastfetch";
			t = "tmux new-session -t 0";
      vi = "nvim";
      v = "nvim";
      e = "nvim .";
      dv = "nvim .";
      sv = "sudoedit";
      nmux = "tmux new -d -s";
      setmux = "tmux new -d -s nvim && tmux new -d -s dir && tmux new -d -s proc";
      colourtest = "bash ~/system_bullshit/scripts/colourtest.sh";
      copyfile = "xclip -selection clipboard -i";
			copy = "xclip -selection clipboard";
    };
    initExtra = ''
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

PATH=~/.cargo/bin:$PATH

bindkey '^Y' autosuggest-accept
bindkey '^X' kill-whole-line
      '';
  };
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
