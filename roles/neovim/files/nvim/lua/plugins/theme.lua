return {
    -- {
    --     "catppuccin/nvim",
    --     priority = 1000,
    --     config = function()
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
    {
        "Mofiqul/dracula.nvim",
        config = function()
            require('dracula').setup({
                transparent_bg = true, -- default false
            })
        end
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
}
