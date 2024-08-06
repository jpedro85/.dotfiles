function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })

            -- vim.cmd("colorscheme tokyonight")
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

            -- vim.cmd("colorscheme rose-pine")
            --
            -- ColorMyPencils()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",             -- latte, frappe, macchiato, mocha
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = true,     -- shows the '~' characters after the end of buffers
                term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
                no_italic = true,              -- Force no italic
                no_bold = false,               -- Force no bold
                no_underline = false,          -- Force no underline
                default_integrations = true,
                integrations = {
                    cmp = true,
                    treesitter = true,
                    mini = {
                        enabled = true,
                    },
                },
            })

            -- setup must be called before loading
            vim.cmd.colorscheme("catppuccin")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
}
