vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<", ":< <CR>gv")
vim.keymap.set("v", ">", ":> <CR>gv")
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set('n', "J", "mzJ`z")

vim.keymap.set('x', "<leader>p", "\"_dP")

vim.keymap.set('n', "<C-s>", ":w<CR>", { desc = "[S]ave Buffer" })

vim.keymap.set('n', '<A-n>', ":bnext<CR>", { desc = "[N]ext Buffer" })
vim.keymap.set('n', '<A-p>', ":bprev<CR>", { desc = "[P]revious Buffer" })
vim.keymap.set('n', '<A-x>', ":bw<CR>", { desc =  "[X] close Buffer"  })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
