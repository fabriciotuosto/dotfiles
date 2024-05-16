-- Open Netrw
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)
-- Clear highlighted searches
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Indent selected block and reselect block
vim.keymap.set("v", "<", ":< <CR>gv")
vim.keymap.set("v", ">", ":> <CR>gv")
-- Move blocks of text up and down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- Join with line below and keep cursor on position
vim.keymap.set('n', "J", "mzJ`z")
-- Paste and keep in * register previous yank
vim.keymap.set('x', "<leader>p", "\"_dP")
-- Save
vim.keymap.set('n', "<C-s>", ":w<CR>", { desc = "[S]ave Buffer" })
-- Move through buffers
vim.keymap.set('n', '<A-n>', ":bnext<CR>", { desc = "[N]ext Buffer" })
vim.keymap.set('n', '<A-p>', ":bprev<CR>", { desc = "[P]revious Buffer" })
vim.keymap.set('n', '<A-x>', ":bw<CR>", { desc = "[X] close Buffer" })
-- QuickFix
vim.keymap.set('n', '<leader>qn', ":cnext", { desc = "[N]ext Item [Q]uickfix list" })
vim.keymap.set('n', '<leader>qp', ":cprev", { desc = "[P]rev Item [Q]uickfix list" })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Moving splits
vim.keymap.set('n', '<M-,>', "<C-w>5>")
vim.keymap.set('n', '<M-.>', "<C-w>5<")
vim.keymap.set('n', '<M-t>', "<C-w>+")
vim.keymap.set('n', '<M-s>', "<C-w>-")
-- UndoTree
vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)
-- Launch a new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux/new-tmux-session.sh<CR>")
