local gs = require("gitsigns")

vim.keymap.set('n', '<leader>gb', function() gs.blame_line { full = true } end)
vim.keymap.set("n", "<leader>G", vim.cmd.Neogit)
