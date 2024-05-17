local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff",
    function()
        builtin.find_files({ follow = true, no_ignore = true, hidden = true })
    end,
    { desc = "[F]ind [F]iles in directory" }
)
vim.keymap.set("n", "<C-f>", builtin.git_files, { desc = "[F]ind [P]rojects files" })
vim.keymap.set("n", "<leader>fgh", builtin.git_bcommits, { desc = "[F]ind [G]it buffer [H]istory" })
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "[F]ind [G]it [C]ommits" })
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "[F]ind [G]it [B]ranches" })
vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "[F]ind [G]it [S]tatus" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep in project files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fvc", builtin.commands, { desc = "[F]ind [V]im [C]ommands" })
vim.keymap.set("n", "<leader>fvo", builtin.vim_options, { desc = "[F]ind [V]im [O]ptions" })
vim.keymap.set("n", "<leader>fvh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfix" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "[F]ind [M]an pages" })
vim.keymap.set("n", "<leader>fw", function()
    local word = vim.fn.expand('<cword>')
    builtin.grep_string({ search = word })
end, { desc = "[F]ind [w]ord under cursor" })
vim.keymap.set("n", "<leader>fWs", function()
    local word = vim.fn.expand('<cWORD>')
    builtin.grep_string({ search = word })
end, { desc = "[F]ind [W]ord under cursor" })
vim.keymap.set('n', '<leader>en', function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[E]dit [N]eovim configuration" })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        windblend = 10,
        previewer = false,
    }))
end, { desc = '[/] Fuzzy find in current buffer' })
