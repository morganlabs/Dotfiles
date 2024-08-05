return {
  "VonHeikemen/lsp-zero.nvim",
  branch = 'v3.x',
  lazy = true,
  config = function()
    local zero = require('lsp-zero')

    zero.on_attach(function(client, bufnr)
      zero.default_keymaps({ buffer = bufnr })
    end)
  end
}
