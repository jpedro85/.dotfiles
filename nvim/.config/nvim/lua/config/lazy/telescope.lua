return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("telescope").setup({
            defaults = {
                preview = false,
                file_ignore_patterns = {
                    "node_modules",
                    "docs",
                    "build"
                }
            }
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search Files in Dir" })
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Search string in the project" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search Files in Repo" })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Search References" })
    end
}
