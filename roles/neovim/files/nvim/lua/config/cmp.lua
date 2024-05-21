local cmp = require('cmp')
local luasnip = require("luasnip")
local lspkind = require('lspkind')
require("luasnip.loaders.from_vscode").lazy_load()
lspkind.init({})

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 40,
            ellipsis_char = '...',
            show_labelDetails = true,
        })
    },
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect,popup'
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'treesitter' },
        {
            name = 'buffer',
            option = { keyword_length = 3 }
        },
        { name = 'path' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-x>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({
            -- behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { 'i', 's' })
    }),
    experimental = {
        ghost_text = true
    },
})


cmp.setup.filetype({ "sql" }, {
    sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
    }
})
