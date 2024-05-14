return function(opts)
    require('lspconfig').pyright.setup({
        capabilities = opts.capabilities,
        settings = {
            pyright = {
                autoImportCompletion = true,
            },
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic"
                }
            }
        }
    })
end
