return {
    {
        "j-hui/fidget.nvim",
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
            vim.keymap.set("n", "<leader>xw", function()
                require("trouble").toggle("workspace_diagnostics")
            end, { desc = "Workspace Diagnostics" })
            vim.keymap.set("n", "<leader>xq", function()
                require("trouble").toggle("quickfix")
            end, { desc = "Quickfix" })
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            local todo_comments = require("todo-comments")
            todo_comments.setup({})
            vim.keymap.set("n", "<leader>xt", "<cmd> TodoTrouble <cr>", { desc = "Todo Quick fix view" })
            vim.keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Previous todo comment" })
        end
    }
}
