return {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
    },
    {
        "onsails/lspkind.nvim",
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require("config.cmp")
        end
    },
}
