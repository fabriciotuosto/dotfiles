return function(opts)
    opts = opts or {}
    local capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
    )
    opts["capabilities"] = capabilities
    require('lspconfig')['gleam'].setup(opts)
end
