return function(opts)
    local util = require("lspconfig/util")
    require('lspconfig').mojo.setup({
        capabilities = opts.capabilities,
        cmd = { "mojo-lsp-server" },
        filetypes = { "mojo" },
        root_dir = util.find_git_ancestor,
        single_file_support = true,
    })
end
