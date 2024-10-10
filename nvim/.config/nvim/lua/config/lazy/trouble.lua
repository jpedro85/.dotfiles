return
{
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({
            icons = {},
        })

        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle()
        end, { desc = "Toggle Trouble" })

        vim.keymap.set("n", "[", function()
            require("trouble").next({ skip_groups = true, jump = true });
        end)

        vim.keymap.set("n", "]", function()
            require("trouble").previous({ skip_groups = true, jump = true });
        end)
    end
}
