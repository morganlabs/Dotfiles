local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("FileType", {
    desc = "Trim trailing white spaces",
    group = vim.api.nvim_create_augroup("trim_whitespace", { clear = true }),
    pattern = "*",
    callback = function()
        autocmd("BufWritePre", {
            pattern = "<buffer>",
            callback = function()
                local curpos = vim.api.nvim_win_get_cursor(0)
                vim.cmd([[keeppatterns %s/\s\+$//e]])
                vim.api.nvim_win_set_cursor(0, curpos)
            end,
        })
    end,
})
