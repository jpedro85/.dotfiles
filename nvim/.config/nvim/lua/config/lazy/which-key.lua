return {                -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').register {
            ['<leader>v'] = { name = '[V]iew', _ = 'which_key_ignore' },
            ['<leader>vw'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            ['<leader>p'] = { name = '[P]Search', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = '[T]rouble', _ = 'which_key_ignore' },
        }
    end,
}
