local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-f>",
    function()
        builtin.find_files({ follow = true, no_ignore = true, hidden = true })
    end,
    {}
)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fvc", builtin.commands, {})
vim.keymap.set("n", "<leader>fvo", builtin.vim_options, {})
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
