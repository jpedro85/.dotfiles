--  Setting the leader bind in this case its <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Open File Explorer
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)

-- Enabling tmux sessionineer inside neovim in case I want to search a dir
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format File according to the lsp ?
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
