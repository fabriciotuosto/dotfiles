return {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'ray-x/cmp-treesitter' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local ls = require("luasnip")
            ls.setup()
            vim.keymap.set({ "i" }, "<C-Y>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require('lspkind').init({
                mode = "symbol_text",
                preset = "default",
            })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local luasnip = require("luasnip")
            local lspkind = require('lspkind')
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        menu = {
                            buffer = "[buf]",
                            nvim_lsp = "[lsp]",
                            path = "[path]",
                            luasnip = "[snip]"
                        }
                    })
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'cmdline' },
                    { name = 'luasnip' },
                    { name = 'buffer',  keyword_length = 5 },
                    { name = 'vim-dadbod-completion'},
                },
                mapping = cmp.mapping.preset.insert({
                    ['C-m'] = cmp.mapping.complete(),
                    ['C-y'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    })
                }),
                sorting = {
                    comparators = {
                        cmp.config.compare.exact,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.score,
                        cmp.config.compare.locality,
                    }
                },
                experimental = {
                    ghost_text = false
                },
            })
        end
    },
}
