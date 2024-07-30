return function(opts)
    local util = require("lspconfig/util")
    require('lspconfig').gleam.setup({
        capabilities = opts.capabilities,
        root_dir = util.find_git_ancestor,
    })
end
