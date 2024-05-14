return {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'ray-x/cmp-treesitter' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
        end
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require('lspkind').init({
                mode = "symbol",
                preset = "default",
            })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require("config.cmp")
        end
    },
}
