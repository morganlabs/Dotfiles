return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local lsp_zero = require("lsp-zero")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        lsp_zero.extend_cmp()

        cmp.setup({
            formatting = lsp_zero.cmp_format(),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = 'luasnip' }
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-h>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),

                ['<C-l>'] = cmp.mapping.scroll_docs(-4),
                ['<C-o>'] = cmp.mapping.scroll_docs(4),
            }),
        })
    end,
}
