return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
        config = function()
            require("neogit").setup({})
            require('keymaps.vcs')
        end
    }
}
