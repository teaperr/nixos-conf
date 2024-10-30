{ config, pkgs, ... }:

{
  programs.nixvim = {
		globals.mapleader = " ";
		keymaps = [
			{
				# edit misc notes on F1
				mode = [ "i" "n" "v" ];
				key = "<F1>";
				action = "<Esc>:e ~/vaults/misc/random.md<Enter>";
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
				mode = [ "n" "v" ];
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
				key = "<leader>n";
				action = ":ToggleTerm<Enter>";
			}
		];
  };
}
