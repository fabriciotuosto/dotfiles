vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end
        map("gd", require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('gi', require('telescope.builtin').lsp_incoming_calls, '[G]oto [I]comming Calls')
        map("gr", require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('<leader>T', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map("<leader>R", vim.lsp.buf.rename, "[R]ename")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        vim.keymap.set({ 'i', 'n' }, "<A-K>", vim.lsp.buf.signature_help,
            { buffer = ev.buf, desc = 'LSP: Signature Help' })
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), {})
            end, '[T]oggle Inlay [H]ints')
        end
    end,
})
