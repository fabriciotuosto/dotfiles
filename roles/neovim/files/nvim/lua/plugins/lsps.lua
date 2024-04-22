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
            local capabilities = vim.tbl_deep_extend(
                'force',
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )
            require("mason-lspconfig").setup({
                ensure_installed = {
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
                },
                handlers = {
                    function(server_name)
                        local opts = { capabilities = capabilities }
                        require('lspconfig')[server_name].setup(opts)
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    runtime = { version = "LuaJIT" },
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            "${3rd}/luv/library",
                                            unpack(vim.api.nvim_get_runtime_file('', true)),
                                        }
                                    }
                                }
                            }
                        })
                    end,
                    ["elixirls"] = function()
                        local elixirls = require('mason-registry').get_package('elixir-ls')
                        require('lspconfig').elixirls.setup({
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
                    end,
                    -- ["clangd"] = function()
                    --     require('lspconfig').clangd.setup({
                    --         capabilities = capabilities,
                    --         filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                    --     })
                    -- end,
                    ["gopls"] = function()
                        local util = require("lspconfig/util")
                        require('lspconfig').gopls.setup({
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
                    end,
                    ["pyright"] = function()
                        require('lspconfig').pyright.setup({
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
                    end,
                    ["tsserver"] = function()
                        require('lspconfig').tsserver.setup({
                            capabilities = capabilities,
                            root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json",
                                "jsconfig.json"),
                            init_options = {
                                preferences = {
                                    disableSuggestions = true,
                                }
                            },
                            commands = {
                                OrganizeImports = {
                                    function()
                                        vim.lsp.buf.execute_command({
                                            command = "_typescript.organizeImports",
                                            arguments = { vim.api.nvim_buf_get_name(0) }
                                        })
                                    end,
                                    description = "Organize Imports"
                                }
                            },
                        })
                    end
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
                    end
                    map("gd", require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                    map('gi', require('telescope.builtin').lsp_incoming_calls, '[G]oto [I]comming Calls')
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                    map("gD", vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map("gr", require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                    map("<leader>R", vim.lsp.buf.rename, "[R]ename")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                    vim.keymap.set({ 'i', 'n' }, "<A-K>", vim.lsp.buf.signature_help,
                        { buffer = ev.buf, desc = 'LSP: Signature Help' })
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
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
            },
        }
    }
}
