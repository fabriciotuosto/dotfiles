return function(opts)
    local elixirls = require('mason-registry').get_package('elixir-ls')
    require('lspconfig').elixirls.setup({
        capabilities = opts.capabilities,
        -- capabilities = capabilities,
        cmd = { elixirls:get_install_path() .. "/language_server.sh" },
        settings = {
            elixirLS = {
                dialyzerEnabled = true,
                fetchDeps = false,
                enableTestLenses = false,
                suggestSpecs = false,
            }
        }
    })
end
