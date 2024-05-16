local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff",
    function()
        builtin.find_files({ follow = true, no_ignore = true, hidden = true })
    end,
    { desc = "[F]ind [F]iles in directory" }
)
vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "[F]ind [P]rojects files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep in project files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fvc", builtin.commands, { desc = "[F]ind [V]im [C]ommands" })
vim.keymap.set("n", "<leader>fvo", builtin.vim_options, { desc = "[F]ind [V]im [O]ptions" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
vim.keymap.set("n", "<leader>fws", function()
    local word = vim.fn.expand('<cword>')
    builtin.grep_string({ search = word })
end, {})
vim.keymap.set("n", "<leader>fWs", function()
    local word = vim.fn.expand('<cWORD>')
    builtin.grep_string({ search = word })
end, {})
vim.keymap.set('n', '<leader>en', function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end)
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        windblend = 10,
        previewer = false,
    }))
end, { desc = '[/] Fuzzy find in current buffer' })
