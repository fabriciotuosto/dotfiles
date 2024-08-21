return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
        end
    },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({})
        end
    },
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
}
