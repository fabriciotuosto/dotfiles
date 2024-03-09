return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require('Comment').setup({})
        end
    },
    {
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup({})
        end
    },
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require('lint').linter_by_ft = {
                javascript = { 'eslint' },
                typescript = { 'eslint' }
            }
            vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                callback = function()
                    require('lint').try_lint()
                end
            })
        end
    },
}
