return function(opts)
    require("lspconfig").lua_ls.setup({
        capabilities = opts.capabilities,
        settings = {
            Lua = {
                hint = {
                    enable = true,
                },
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        "${3rd}/luv/library",
                    }
                }
            }
        }
    })
end
