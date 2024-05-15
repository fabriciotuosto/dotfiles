vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle("workspace_diagnostics") end,
    { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end,
    { desc = "Trouble Quickfix" })
vim.keymap.set("n", "]t", function() require("trouble").next({ skip_groups = true, jump = true }) end,
    { desc = "Trouble Next" })
vim.keymap.set("n", "[t", function() require("trouble").previous({ skip_groups = true, jump = true }) end,
    { desc = "Trouble Prev" })

vim.keymap.set("n", "<leader>td", "<cmd> TodoTrouble <cr>", { desc = "Todo Quick fix view" })