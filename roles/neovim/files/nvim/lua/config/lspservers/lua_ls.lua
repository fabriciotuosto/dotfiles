return function(opts)
    require("lspconfig").lua_ls.setup({
        capabilities = opts.capabilities,
        settings = {
            Lua = {
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
