return {
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy"
                            }
                        },
                    },
                },
                tools = {
                    runnables = {
                        use_telescope = true,
                    },
                    hover_actions = {
                        auto_focus = true
                    },
                    inlay_hints = {
                        auto = true,
                    },
                },
            })
        end
    },
    {
        "saecki/crates.nvim",
        ft = "rust",

        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end
    }
}
