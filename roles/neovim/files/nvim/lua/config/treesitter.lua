require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "lua",
        "html",
        "css",

        "javascript",
        "typescript",
        "tsx",
        "c",

        "markdown",

        "markdown_inline",
        "rust",
        "elixir",
        "python",
        "terraform",
        "bash",

        "diff",
        "git_config",
        "go",
        "json",
        "make",
        "r",
        "sql",
        "toml",
        "yaml",
        "cmake",
        "haskell",
        "ocaml",
        "heex",
        "eex",
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
        }
    }
})
