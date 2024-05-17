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
        lazy = false,
        config = function()
            require("neogit").setup({})
            require('keymaps.vcs')
        end
    }
}
