local capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
)
local opts = { capabilities = capabilities }

return {
    function(server_name)
        local ok, custom_setup = pcall(require, 'config.lspservers.' .. server_name)
        if ok then
            custom_setup(opts)
        else
            require('lspconfig')[server_name].setup(opts)
        end
    end,
    ["mojo"] = require('lspconfig')["mojo"].setup(opts),
    ["gleam"] = require('lspconfig')["gleam"].setup(opts),
}
