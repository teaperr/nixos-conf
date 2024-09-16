{ pkgs, ... }:

{
  # Import additional configs
  imports = [
    ./nvim.nix
    ./tmux.nix
    ./git.nix
    ./zsh.nix
    ./openbox.nix
  ];

  home = {
    username = "lotus";
    homeDirectory = "/home/lotus";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    oh-my-zsh.plugins = [ "git" "zsh-syntax-highlighting" "zsh-autosuggestions" "tmux" ];
    
    shellAliases = {
      rsrc = "source ~/.zshrc";
      please = "sudo $(fc -ln -1)";
      grep = "grep --color=auto";
      kys = "rm -rf";
      update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
      tma = "tmux attach";
      autoremove = "sudo pacman -R $(pacman -Qdtq)";
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
    };
  };

  # Define home directory packages
  home.packages = with pkgs; [
    neovim
    zsh
    git
    tmux
    librewolf
    xclip
  ];

  # Home Manager version and other configurations
  home.stateVersion = "24.05";
}

