return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
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

            vim.keymap.set("n", "<C-f>",
                function() builtin.find_files({ follow = true, no_ignore = true, hidden = true })
                end,
                {}
            )
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            -- vim.keymap.set("n", "<C-f>", function() builtin.find_files({ follow = true, no_ignore = false, hidden = false }) end, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fc", builtin.commands, {})
            vim.keymap.set("n", "<leader>fv", builtin.vim_options, {})
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, {})
            vim.keymap.set("n", "<leader>fD", builtin.lsp_definitions, {})
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
