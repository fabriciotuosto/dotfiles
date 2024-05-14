return function(opts)
    local util = require("lspconfig/util")
    require('lspconfig').gopls.setup({
        capabilities = opts.capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl", "tmpl" },
        root_dir = util.root_pattern("go.work", "go.mod"),
        settings = {
            gopls = {
                staticcheck = true,
                completeUnimported = true,
                analyses = {
                    unusedparams = true,
                }
            },
        },

    })
end
