return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lsp_zero = require("lsp-zero")
        local mason = require("mason-lspconfig")
        local lspc = require("lspconfig")
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local set = vim.keymap.set
            local buf = vim.lsp.buf
            local diagnostic = vim.diagnostic

            lsp_zero.buffer_autoformat()

            set("n", "gd", function()
                buf.definition()
            end, opts)
            set("n", "K", function()
                buf.hover()
            end, opts)
            set("n", "<leader>vd", function()
                diagnostic.open_float()
            end, opts) -- Diagnostics
            set("n", "<leader>ca", function()
                buf.code_action()
            end, opts) -- Code Actions
            set("n", "<leader>rn", function()
                buf.rename()
            end, opts) -- Rename
            set("n", "<leader>re", function()
                buf.references()
            end, opts) -- References
        end)

        local servers = {
            "tsserver",
            "rust_analyzer",
            "astro",
            "svelte",
            "emmet_ls",
            "cssls",
            "lua_ls",
            "pylsp",
            "pyright",
            "gopls",
        }
        lsp_zero.setup_servers(servers)

        lspc.astro.setup({
            typescript = {},
        })

        lspc.rust_analyzer.setup({})
        lspc.rust_analyzer.setup({
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        })

        -- LSPs
        mason.setup({
            automatic_installation = true,
            ensure_installed = servers,
            handlers = {
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspc.lua_ls.setup(lua_opts)
                end,

                emmet_ls = function()
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true

                    lspc.emmet_ls.setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html",
                            "javascriptreact",
                            "typescriptreact",
                            "astro",
                            "rust",
                            "md",
                            "mdx",
                        },
                    })
                end,
            },
        })
    end,
}
