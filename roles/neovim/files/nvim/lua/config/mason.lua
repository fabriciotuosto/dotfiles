require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {},
    handlers = require('config.lspservers')
})
require("mason-bridge").setup({})
-- Configure Mason installed formatters
require("conform").setup({
    notify_on_error = false,
    format_on_save = {
        timeout_ms = 200,
        lsp_fallback = true,
        async = true,
        -- dry_run = false,
    },
    formatters_by_ft = require("mason-bridge").get_formatters(),
})
-- Configure Mason installed linters
require('lint').linters_by_ft = require("mason-bridge").get_linters()
