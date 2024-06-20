return {
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        config = function()
            require('fidget').setup({})
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            require('trouble').setup({})
            require('keymaps.ui-utils')
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require("todo-comments").setup({})
        end
    }
}
