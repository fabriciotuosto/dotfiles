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
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('config.mason')
        end,
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
