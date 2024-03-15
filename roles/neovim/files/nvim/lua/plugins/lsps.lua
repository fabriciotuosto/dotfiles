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
                    "bufls",
                },
                handlers = {
                    function(server_name)
                        local opts = { capabilities = capabilities }
                        require('lspconfig')[server_name].setup(opts)
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
                    ["clangd"] = function()
                        require('lspconfig').clangd.setup({
                            capabilities = capabilities,
                            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                        })
                    end,
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
                    ["denols"] = function()
                        require('lspconfig').denols.setup({
                            capabilities = capabilities,
                            root_dir = require('lspconfig').util.root_pattern("deno.json", "deno.jsonc")
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
                            settings = {
                                javascript = {
                                    inlayHints = {
                                        includeInlayEnumMemberValueHints = true,
                                        includeInlayFunctionLikeReturnTypeHints = true,
                                        includeInlayFunctionParameterTypeHints = true,
                                        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                        includeInlayPropertyDeclarationTypeHints = true,
                                        includeInlayVariableTypeHints = true,
                                    },
                                },
                                typescript = {
                                    inlayHints = {
                                        includeInlayEnumMemberValueHints = true,
                                        includeInlayFunctionLikeReturnTypeHints = true,
                                        includeInlayFunctionParameterTypeHints = true,
                                        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                        includeInlayPropertyDeclarationTypeHints = true,
                                        includeInlayVariableTypeHints = true,
                                    },
                                },
                            }
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
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(ev.buf, true)
                    end
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
