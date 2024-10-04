{ config, pkgs, ... }:
{
  programs.nixvim = {
		plugins = {
			lsp-lines.enable = true;
			lsp-format.enable = true;
			helm.enable = true;
			lsp = {
				enable = true;
				# inlayHints = true;
				servers = {
					html.enable = true;
					cssls.enable = true;
					lua-ls.enable = true;
					yamlls.enable = true;
					pyright.enable = true;
					gopls.enable = true;
					tsserver.enable = true;
					helm-ls.enable = true;
					jsonls.enable = true;
					clangd.enable = true;
					nil-ls.enable = true;
					# jdt-language-server.enable = true;
					bashls.enable = true;
				};

				keymaps = {
					silent = true;
					lspBuf = {
						gd = {
							action = "definition";
							desc = "Goto Definition";
						};
						gr = {
							action = "references";
							desc = "Goto References";
						};
						gD = {
							action = "declaration";
							desc = "Goto Declaration";
						};
						gI = {
							action = "implementation";
							desc = "Goto Implementation";
						};
						gT = {
							action = "type_definition";
							desc = "Type Definition";
						};
						K = {
							action = "hover";
							desc = "Hover";
						};
						"<leader>cw" = {
							action = "workspace_symbol";
							desc = "Workspace Symbol";
						};
						"<leader>cr" = {
							action = "rename";
							desc = "Rename";
						};
					};
					diagnostic = {
						"<leader>cd" = {
							action = "open_float";
							desc = "Line Diagnostics";
						};
						"[d" = {
							action = "goto_next";
							desc = "Next Diagnostic";
						};
						"]d" = {
							action = "goto_prev";
							desc = "Previous Diagnostic";
						};
					};
				};
			};
		};
  };
}
