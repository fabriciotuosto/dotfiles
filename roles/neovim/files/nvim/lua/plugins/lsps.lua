return {
    {
        "williamboman/mason.nvim",
        config = function()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('config.mason')
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('keymaps.lsp')
        end
    },
    {
        "zeioth/garbage-day.nvim",
        dependencies = "neovim/nvim-lspconfig",
        event = "VeryLazy",
        opts = {
            -- your options here
        }
    },
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
}
