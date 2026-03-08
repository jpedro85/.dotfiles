return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.config').setup({
            ensure_installed = {
                'bash', 'c', 'html', 'typescript',
                'lua', 'markdown', 'vim',
                'vimdoc', 'jsdoc', 'javascript' },
            -- Autoinstall languages that are not installed
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { enable = true },
        })


        -- NOTE: This is the syntax highlight for hyprland config
        vim.filetype.add({
            pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
        })
    end
}
