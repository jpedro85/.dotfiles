--  Setting the leader bind in this case its <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Open File Explorer
vim.keymap.set("n", "<leader>b", vim.cmd.Ex, { desc = "Open File Explorer" })

-- Enabling tmux sessionineer inside neovim in case I want to search a dir
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux Sessionizer" })

-- Format File according to the lsp ?
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format File with LSP" })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
