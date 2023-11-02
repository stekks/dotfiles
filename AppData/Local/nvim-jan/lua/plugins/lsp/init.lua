local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        "Decodetalkers/csharpls-extended-lsp.nvim",
    },
    config = function(_, _)
        local utils = require("utils")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lsp_utils = require("plugins.lsp.lsp-utils")
        lsp_utils.setup()

        mason_lspconfig.setup({
            ensure_installed = utils.lsp_servers,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                })
            end,

            ["pyright"] = function()
                lspconfig.pyright.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "off",
                            },
                        },
                    },
                })
            end,

            ["lua_ls"] = function ()
                lspconfig.lua_ls.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                    settings = {
                        Lua = {
                            -- disable warnings for 'vim' global in nvim config files.
                            diagnostics = {
                                globals = { 'vim' }
                            }
                        }
                    }
                })
            end,

            ["rust_analyzer"] = function ()
                lspconfig.rust_analyzer.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                    cmd = {
                         "rustup", "run", "stable", "rust-analyzer",
                    }
                })
            end,

            ["csharp_ls"] = function ()
                lspconfig.csharp_ls.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                    handlers = {
                        ["textDocument/definition"] = require('csharpls_extended').handler,
                    },
                    -- cmd = { csharpls },
                })
            end,
            --            ["clangd"] = function()
            --                local capabilities_cpp = lsp_utils.capabilities
            --                capabilities_cpp.offsetencoding = { "uts-16" }
            --                lspconfig.clangd.setup({
            --                    on_attach = lsp_utils.on_attach,
            --                    capabilities = capabilities_cpp,
            --                })
            --            end,
        })
    end,
}
return M
