return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                "node_modules","docs"
                }
            }
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search Files in Dir" })
        vim.keymap.set('n', '<leader>ps', builtin.grep_string, {desc = "Search string in the project"})
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search Files in Repo" })
        vim.keymap.set('n', 'gr', builtin.lsp_references, {desc = "Search References"})
    end
}
