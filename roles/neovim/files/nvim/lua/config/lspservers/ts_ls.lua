return function(opts)
    require('lspconfig').ts_ls.setup({
        capabilities = opts.capabilities,
        root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        init_options = {
            preferences = {
                disableSuggestions = true,
            }
        },
        commands = {
            OrganizeImports = {
                function()
                    vim.lsp.buf.execute_command({
                        command = "_typescript.organizeImports",
                        arguments = { vim.api.nvim_buf_get_name(0) }
                    })
                end,
                description = "Organize Imports"
            }
        },
    })
end
