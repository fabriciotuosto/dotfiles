return {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local elixir = require("elixir")
        local elixirls = require("elixir.elixirls")

        elixir.setup {
            nextls = { enable = true },
            credo = {},
            elixirls = {
                enable = true,
                settings = elixirls.settings {
                    dialyzerEnabled = true,
                    enableTestLenses = false,
                },
            }
        }
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
