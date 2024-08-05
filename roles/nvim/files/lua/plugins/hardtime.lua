return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
        disabled_filetypes = { "netrw", "lazy", "mason" },
    },
    config = function(_, opts)
        require("hardtime").setup(opts)
        vim.cmd("Hardtime enable")
    end
}
