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
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup({})
    --         -- vim.cmd("colorscheme rose-pine-main")
    --     end
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require('kanagawa').setup({})
    --         -- vim.cmd([[colorscheme kanagawa-dragon]])
    --     end
    -- },
    -- {
    --     'embark-theme/vim',
    --     config = function()
    --         -- vim.cmd([[colorscheme embark]])
    --     end
    -- },
    -- {
    --     "rmehri01/onenord.nvim",
    --     config = function()
    --         require('onenord').setup({
    --             theme = "dark"
    --         })
    --     end
    --
    -- }
    -- {
    --     'ribru17/bamboo.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('bamboo').setup({})
    --         require('bamboo').load()
    --     end
    -- }
}
