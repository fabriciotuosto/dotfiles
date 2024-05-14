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
            vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle("workspace_diagnostics") end,
                { desc = "Toggle Trouble" })
            vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end,
                { desc = "Trouble Quickfix" })
            vim.keymap.set("n", "]t", function() require("trouble").next({ skip_groups = true, jump = true }) end,
                { desc = "Trouble Next" })
            vim.keymap.set("n", "[t", function() require("trouble").previous({ skip_groups = true, jump = true }) end,
                { desc = "Trouble Prev" })
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            local todo_comments = require("todo-comments")
            todo_comments.setup({})
            vim.keymap.set("n", "<leader>td", "<cmd> TodoTrouble <cr>", { desc = "Todo Quick fix view" })
        end
    }
}
