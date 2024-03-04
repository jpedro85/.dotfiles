return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Show Source Control" })

        local personalFugitive = vim.api.nvim_create_augroup("personalFugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = personalFugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, { buffer = bufnr, remap = false, desc = "Push Commits to Origin" })

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({ 'pull' })
                end, { buffer = bufnr, remap = false, desc = "Pull From Remote" })

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ",
                    { buffer = bufnr, remap = false, desc = "Push to Origin (branch not properly setup)" });
            end,
        })
    end
}
