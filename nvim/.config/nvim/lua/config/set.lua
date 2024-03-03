-- Setting the neovim options
-- display line number
-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Identing Stuff
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable wrapping text if it goes over the window width
vim.opt.wrap = false

-- Syncing the clipboard buffer of neovim with the OS
vim.opt.clipboard = 'unnamedplus'

-- Search
-- This one highlights the search results
vim.opt.hlsearch = true
-- This one shows what the pattern matches
vim.opt.incsearch = true

-- Enabling undo history
-- Disabling backup and swapfile
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.termguicolors = true

-- Sign column is the thing near the number line
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

