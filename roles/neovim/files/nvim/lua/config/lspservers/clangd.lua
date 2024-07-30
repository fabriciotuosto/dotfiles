return function(opts)
    local util = require("lspconfig/util")
    require('lspconfig').clangd.setup({
        capabilities = opts.capabilities,
        root_dir = util.root_pattern(".clangd"),
    })
end
