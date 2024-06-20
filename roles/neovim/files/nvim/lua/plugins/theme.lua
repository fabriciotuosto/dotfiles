return {
    -- {
    --     "catppuccin/nvim",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             integrations = {
    --                 cmp = true,
    --                 gitsigns = true,
    --                 nvimtree = true,
    --                 treesitter = true,
    --                 notify = false,
    --                 mini = false,
    --                 dap = {
    --                     enabled = true,
    --                     enable_ui = true,
    --                 }
    --             }
    --         })
    --     end
    -- },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('nordic').load()
    --     end
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function()
    --         require('gruvbox').setup({})
    --     end,
    -- },
    -- {
    --     "Mofiqul/dracula.nvim",
    --     config = function()
    --         require('dracula').setup({})
    --     end
    -- },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({})
        end
    }

}
