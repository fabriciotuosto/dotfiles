local gs = require("gitsigns")

vim.keymap.set('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "[G]it [B]lame" })
vim.keymap.set("n", "<leader>G", vim.cmd.Neogit, { desc = "[G]it client" })
