require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "html",
        "css",

        "lua",
        "go",
        "python",
        "elixir",
        "heex",
        "eex",
        "sql",
        "tsx",
        "javascript",
        "typescript",
        "bash",
        "c",

        "make",
        "cmake",
        "json",
        "toml",
        "yaml",
        "diff",
        "git_config",
        "terraform",
        "markdown",
        "markdown_inline",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer"
            },
            goto_next_end = {
                ["]F"] = "@function.outer"
            },
            goto_prev_start = {
                ["[f"] = "@function.outer"
            },
            goto_prev_end = {
                ["[F"] = "@function.outer"
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        },
    }
})
