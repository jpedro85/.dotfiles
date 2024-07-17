return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
        local null_ls = require('null-ls')
        opts.sources = {
            null_ls.builtins.formatting.prettierd,
        }
        opts.on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({
                    buffer = bufnr,
                })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end
        return opts
    end,
}

