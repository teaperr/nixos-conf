{ config, pkgs, ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>C";
        action = ''"+y'';
        options.desc = "Copy to system clipoard";
      }
      {
        # edit misc notes on F1
        mode = [
          "i"
          "n"
          "v"
        ];
        key = "<F1>";
        action = "<Esc>:e ~/todo.md<Enter>";
      }
      {
        # edit project todo list with f2
        mode = [
          "i"
          "n"
          "v"
        ];
        key = "<F2>";
        action = "<Esc>:e ./todo.md<Enter>";
      }
      {
        # make an undo point every time ; is typed
        mode = "i";
        key = ";";
        action = ";<c-g>u";
      }
      {
        # indent with ctrl+t
        mode = "n";
        key = "<C-t>";
        action = ">>";
      }
      {
        # indent selected lines and keep selection
        mode = "v";
        key = "<C-t>";
        action = ">gv";
      }
      {
        # escape with jj
        mode = "i";
        key = "jj";
        action = "<Esc>";
      }
      {
        # hh to newline
        mode = "i";
        key = "hh";
        action = "<Esc>o";
      }
      {
        # map ; to : for ease of use
        mode = [
          "n"
          "v"
        ];
        key = ";";
        action = ":";
      }
      {
        # map ctrl+o to kk
        mode = "i";
        key = "kk";
        action = "<C-o>";
      }
      {
        mode = "n";
        key = "<leader>t";
        action = ":TransparentToggle<Enter>";
      }
      {
        mode = "n";
        key = "<leader>y";
        action = ":Yazi<Enter>";
      }
      {
        mode = "n";
        key = "<leader>l";
        action = ":BufferLineCycleNext<Enter>";
      }
      {
        mode = "n";
        key = "<leader>h";
        action = ":BufferLineCyclePrev<Enter>";
      }
      {
        mode = "n";
        key = "<leader>p";
        action = ":BufferLinePick<Enter>";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = ":BufferLinePickClose<Enter>";
      }
      {
        mode = "n";
        key = "<leader>X";
        action = ":BufferLineCloseOthers<Enter>";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = ":bprevious | bdelete #<Enter>";
        options.desc = "Close current buffer";
      }
      {
        mode = "n";
        key = "<leader>W";
        action = ":%bd<Enter>";
        options.desc = "Close all buffer";
      }
    ];
  };
}
