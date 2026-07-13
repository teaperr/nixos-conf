{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
      ZSH_TMUX_AUTOSTART = "TRUE";
      CASE_SENSITIVE = "FALSE";
      COMPLETION_WAITING_DOTS = "...";
      ZSH_COMPDUMP = "$HOME/.cache/zsh/.zcompdump-$HOST";
    };

    shellAliases = {
      rsrc = "source ~/.zshrc";
      please = "sudo $(fc -ln -1)";
      grep = "grep --color=auto";
      kys = "rm -rf";
      update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
      tma = "tmux attach";
      autoremove = "sudo pacman -R $(pacman -Qdtq)";
      unfuck = "git reset HEAD~1 --soft";
      ff = "fastfetch";
      vi = "nvim";
      v = "nvim";
      e = "nvim .";
      dv = "nvim .";
      sv = "sudoedit";
      nmux = "tmux new -d -s";
      setmux = "tmux new -d -s nvim && tmux new -d -s dir && tmux new -d -s proc";
      colourtest = "bash ~/system_bullshit/scripts/colourtest.sh";
    };

    initContent = ''
      setopt CORRECT
      setopt CORRECT_ALL
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

      ${builtins.readFile ./zshrc.bash}
    '';
  };
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
