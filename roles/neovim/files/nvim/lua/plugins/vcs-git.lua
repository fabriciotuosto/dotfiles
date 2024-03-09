return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gs = require("gitsigns")
            gs.setup({})
            vim.keymap.set('n', '<leader>gb', function() gs.blame_line { full = true } end)
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = false,
        config = function()
            require("neogit").setup({})
            vim.keymap.set("n", "<leader>G", vim.cmd.Neogit)
        end
    }
}
