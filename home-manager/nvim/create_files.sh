#!/bin/bash

# Create main Nix files
files=(
    "settings.nix"
    "keymaps.nix"
    "auto_cmds.nix"
    "file_types.nix"
)

# Create plugin directories and files
declare -A plugins=(
    ["./plugins/themes/default.nix"]=""
    ["./plugins/cmp/cmp.nix"]=""
    ["./plugins/cmp/cmp-copilot.nix"]=""
    ["./plugins/cmp/lspkind.nix"]=""
    ["./plugins/cmp/autopairs.nix"]=""
    ["./plugins/cmp/schemastore.nix"]=""
    ["./plugins/snippets/luasnip.nix"]=""
    ["./plugins/editor/neo-tree.nix"]=""
    ["./plugins/editor/treesitter.nix"]=""
    ["./plugins/editor/undotree.nix"]=""
    ["./plugins/editor/illuminate.nix"]=""
    ["./plugins/editor/indent-blankline.nix"]=""
    ["./plugins/editor/todo-comments.nix"]=""
    ["./plugins/editor/copilot-chat.nix"]=""
    ["./plugins/editor/navic.nix"]=""
    ["./plugins/ui/bufferline.nix"]=""
    ["./plugins/ui/lualine.nix"]=""
    ["./plugins/ui/startup.nix"]=""
    ["./plugins/lsp/lsp.nix"]=""
    ["./plugins/lsp/conform.nix"]=""
    ["./plugins/lsp/fidget.nix"]=""
    ["./plugins/git/lazygit.nix"]=""
    ["./plugins/git/gitsigns.nix"]=""
    ["./plugins/utils/telescope.nix"]=""
    ["./plugins/utils/whichkey.nix"]=""
    ["./plugins/utils/extra_plugins.nix"]=""
    ["./plugins/utils/mini.nix"]=""
    ["./plugins/utils/markdown-preview.nix"]=""
    ["./plugins/utils/obsidian.nix"]=""
    ["./plugins/utils/toggleterm.nix"]=""
)

# Create main files with the template
for file in "${files[@]}"; do
    touch "$file"
    echo "{ config, pkgs, ... }:" > "$file"
    echo "" >> "$file"
    echo "{" >> "$file"
    echo "  programs.nixvim = {" >> "$file"
    echo "  };" >> "$file"
    echo "}" >> "$file"
done

# Create plugin directories and files with the template
for plugin in "${!plugins[@]}"; do
    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$plugin")"
    touch "$plugin"
    echo "{ config, pkgs, ... }:" > "$plugin"
    echo "{" >> "$plugin"
    echo "  programs.nixvim = {" >> "$plugin"
    echo "  };" >> "$plugin"
    echo "}" >> "$plugin"
done

echo "Nix files have been created with the specified template."

