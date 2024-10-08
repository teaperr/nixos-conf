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
      # ZSH_TMUX_FIXTERM_WITH_256COLOR = "TRUE";
      ZSH_TMUX_AUTOSTART = "TRUE";
      CASE_SENSITIVE = "TRUE";
      ENABLE_CORRECTION = "TRUE";
      COMPLETION_WAITING_DOTS = "...";
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
			ff = "fastfetch";
			t = "tmux";
			y = "yazi";
      vi = "nvim";
      v = "nvim";
      e = "nvim .";
      dv = "nvim .";
      sv = "sudoedit";
      nmux = "tmux new -d -s";
      setmux = "tmux new -d -s nvim && tmux new -d -s dir && tmux new -d -s proc";
      colourtest = "bash ~/system_bullshit/scripts/colourtest.sh";
      fixmouse = "xinput set-prop '13' 'libinput Accel Speed' -1 && xinput set-button-map 13 1 2 3 4 5 6 7 8 3";
      copyfile = "xclip -selection clipboard -i";
			copy = "xclip -selection clipboard";
    };
    initExtra = ''
if [ "$XDG_CURRENT_DESKTOP" != "Openbox" ]; then
  xinput set-prop '13' 'libinput Accel Speed' -1
  xinput set-button-map 13 1 2 3 4 5 6 7 8 3
fi
      '';
  };
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
