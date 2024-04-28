return {
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
    -- {
    --     "mg979/vim-visual-multi",
    --     lazy = false,
    -- },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    -- {
    --     "mfussenegger/nvim-lint",
    --     config = function()
    --         require('lint').linter_by_ft = {
    --             javascript = { 'eslint' },
    --             typescript = { 'eslint' }
    --         }
    --         vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    --             callback = function()
    --                 require('lint').try_lint()
    --             end
    --         })
    --     end
    -- },
    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true
            },
            formatter_by_ft = {
                lua = { 'stylua' },
            },
        }
    },
    -- {
    --     "mhartington/formatter.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require('formatter').setup({
    --             filetype = {
    --                 javascript = {
    --                     require('formatter.filetypes.javascript').prettier
    --                 },
    --                 typescript = {
    --                     require('formatter.filetypes.typescript').prettier
    --                 },
    --                 ["*"] = {
    --                     require('formatter.filetypes.any').remove_trailing_whitespace
    --                 }
    --             }
    --         })
    --     end
    -- },
}
