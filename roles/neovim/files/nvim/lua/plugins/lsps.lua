return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "cssls",
                    "jsonls",
                    "angularls",
                    "denols",
                    "dockerls",
                    "docker_compose_language_service",
                    "elixirls",
                    "emmet_ls",
                    "html",
                    "lua_ls",
                    "tsserver",
                    "sqlls",
                    "marksman",
                    "templ",
                    "clangd",
                    "pyright",
                    "yamlls",
                    "zls",
                    "gopls",
                }
            })
        end,
        -- handlers = {
        --     function(server_name)
        --         local server = servers[server_name] or {}
        --         server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        --         require('lspconfig')[server_name].setup(server)
        --     end
        -- }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    -- if client.server_capabilities.inlayHintProvider then
                    --     vim.lsp.inlay_hint.enable(ev.buf, true)
                    -- end
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set({ "n", "x" }, "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set({ "n", "x" }, "<leader>bf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
                    vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require("cmp_nvim_lsp").default_capabilities())

            local opts = { capabilities = capabilities }
            lspconfig.lua_ls.setup(opts)
            lspconfig.clangd.setup(opts)
            lspconfig.angularls.setup(opts)
            lspconfig.dockerls.setup(opts)
            lspconfig.html.setup(opts)
            lspconfig.cssls.setup(opts)
            lspconfig.emmet_ls.setup(opts)
            lspconfig.jsonls.setup(opts)
            lspconfig.sqlls.setup(opts)
            lspconfig.rust_analyzer.setup(opts)
            lspconfig.marksman.setup(opts)
            lspconfig.terraformls.setup(opts)
            lspconfig.templ.setup(opts)
            lspconfig.yamlls.setup(opts)
            lspconfig.zls.setup(opts)
            lspconfig.docker_compose_language_service.setup(opts)

            local util = require("lspconfig/util")
            local mason_registry = require('mason-registry')
            local elixirls = mason_registry.get_package('elixir-ls')
            lspconfig.elixirls.setup({
                capabilities = capabilities,
                cmd = { elixirls:get_install_path() .. "/language_server.sh" },
                settings = {
                    elixirLS = {
                        dialyzerEnabled = true,
                        fetchDeps = false,
                        enableTestLenses = false,
                        suggestSpecs = false,
                    }
                }
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl", "tmpl" },
                root_dir = util.root_pattern("go.work", "go.mod"),
                settings = {
                    gopls = {
                        staticcheck = true,
                        completeUnimported = true,
                        analyses = {
                            unusedparams = true,
                        }
                    },
                },
            })

            lspconfig.denols.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
            })

            local function organize_imports()
                local params = {
                    command = "_typescript.organizeImports",
                    arguments = { vim.api.nvim_buf_get_name(0) }
                }
                vim.lsp.buf.execute_command(params)
            end

            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    pyright = {
                        autoImportCompletion = true,
                    },
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "basic"
                        }
                    }
                }
            })

            lspconfig.tsserver.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
                init_options = {
                    preferences = {
                        disableSuggestions = true,
                    }
                },
                commands = {
                    OrganizeImports = {
                        organize_imports,
                        description = "Organize Imports"
                    }
                }
            })
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true
            },
            formatter_by_ft = {
                lua = { 'stylua' },
            }
        }
    }
}
