return {
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('config.mason')
        end,
    },
    -- {
    --     "frostplexx/mason-bridge.nvim"
    -- },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('config.lsp')
            require('keymaps.lsp')
        end
    },
    {
        'stevearc/conform.nvim',
    },
}
