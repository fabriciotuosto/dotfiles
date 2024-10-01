return {
    {
        'stevearc/conform.nvim',
    },
    {
        'mfussenegger/nvim-lint',
    },
    {
        "williamboman/mason.nvim",
    },
    { "neovim/nvim-lspconfig" },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('config.mason')
        end,
        event = "VeryLazy",
    },
    {
        "frostplexx/mason-bridge.nvim"
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('keymaps.lsp')
        end
    },
}
