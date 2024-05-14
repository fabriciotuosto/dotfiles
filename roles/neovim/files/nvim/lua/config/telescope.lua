require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
        }
    },
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "_dist",
            "dist",
            ".git",
            ".idea",
            ".elixir_ls",
            ".elixir-tools",
            ".github",
            "deps",
            "target",
            ".mypy_cache"
        }
    }
})
local builtin = require("telescope.builtin")
pcall(require("telescope").load_extension, "ui-select")
pcall(require("telescope").load_extension, "fzf")

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
vim.keymap.set("n", "<leader>fws", function()
    local word = vim.fn.expand('<cword>')
    builtin.grep_string({ search = word })
end, {})
vim.keymap.set("n", "<leader>fWs", function()
    local word = vim.fn.expand('<cWORD>')
    builtin.grep_string({ search = word })
end, {})
