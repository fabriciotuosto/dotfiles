local lspconfig = require('lspconfig')

-- local capabilities = vim.tbl_deep_extend(
--     'force',
--     vim.lsp.protocol.make_client_capabilities()
-- require("cmp_nvim_lsp").default_capabilities()
-- )
local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = { capabilities = capabilities }
return {
    function(server_name)
        lspconfig[server_name].setup(opts)
    end,
    ["gopls"] = lspconfig["gopls"].setup(opts),
    ["elixirls"] = lspconfig["elixirls"].setup(opts),
    ["ts_ls"] = lspconfig["ts_ls"].setup(opts),
    ["lua_ls"] = lspconfig["lua_ls"].setup(opts),
    ["mojo"] = lspconfig["mojo"].setup(opts),
}
