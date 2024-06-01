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
        }
    }
})
pcall(require("telescope").load_extension, "ui-select")
pcall(require("telescope").load_extension, "fzf")
