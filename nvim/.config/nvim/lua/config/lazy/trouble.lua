return
{
    "folke/trouble.nvim",
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
    config = function()
        require("trouble").setup({
            icons = {},
        })


        -- vim.keymap.set("n", "[", function()
        --     require("trouble").next({ skip_groups = true, jump = true });
        -- end)
        --
        -- vim.keymap.set("n", "]", function()
        --     require("trouble").previous({ skip_groups = true, jump = true });
        -- end)
    end
}
