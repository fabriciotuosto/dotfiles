require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "cssls",
        "jsonls",
        "angularls",
        "dockerls",
        "docker_compose_language_service",
        "emmet_ls",
        "html",
        "lua_ls",
        "tsserver",
        "pylsp",
        "sqlls",
        "templ",
        "yamlls",
        "gopls",
        "bufls",
        "zls",
    },
    handlers = require('config.lspservers')
})
require("mason-bridge").setup({})
require("config.lspservers.gleam")({})

require("conform").setup({
    notify_on_error = false,
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        -- async = true,
        -- dry_run = false,
    },
    formatters_by_ft = require("mason-bridge").get_formatters(),
})
require('lint').linters_by_ft = require("mason-bridge").get_linters()
