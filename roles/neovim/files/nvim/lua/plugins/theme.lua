return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    mini = false,
                    dap = {
                        enabled = true,
                        enable_ui = true,
                    }
                }
            })
            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    },
}
