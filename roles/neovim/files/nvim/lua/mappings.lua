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

vim.keymap.set('n', "<C-s>", ":w<CR>")

vim.keymap.set('n', '<A-n>', ":bnext<CR>")
vim.keymap.set('n', '<A-p>', ":bprev<CR>")
vim.keymap.set('n', '<A-x>', ":bw<CR>")
