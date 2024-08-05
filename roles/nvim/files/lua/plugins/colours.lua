return {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd("colorscheme oxocarbon")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
