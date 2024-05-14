require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "cssls",
        "jsonls",
        "angularls",
        "dockerls",
        "docker_compose_language_service",
        "elixirls",
        "emmet_ls",
        "html",
        "lua_ls",
        "tsserver",
        "pyright",
        "sqlls",
        "templ",
        "yamlls",
        "gopls",
        "bufls",
        "zls",
    },
    handlers = require('config.lspservers')
})
