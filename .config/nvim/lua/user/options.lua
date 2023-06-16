local vim_opts = {
    syntax = on,
    hidden = true,
    -- support scroll
    mouse = "a",
    -- tab and spaces
    tabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    expandtab = true,
    autoindent = true,
    -- line number
    relativenumber = true,
    number = true,
    visualbell = false,
    termguicolors = true,
    tags = "tags;/",
    timeoutlen = 500,
    updatetime = 250,
    filetype = "on",
}

for k, v in pairs(vim_opts) do
    vim.opt[k] = v
end

vim.opt.clipboard:append { "unnamedplus" }

-- restore cursor position
-- TODO: Needs improvement
-- buf handling
-- put this autocmd in another file
-- https://github.com/neovim/neovim/issues/16339#issuecomment-1457394370
vim.api.nvim_create_autocmd('BufRead', {
    callback = function(opts)
        vim.api.nvim_create_autocmd('BufWinEnter', {
            once = true,
            buffer = opts.buf,
            callback = function()
                local ft = vim.bo[opts.buf].filetype
                local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
                if
                    not (ft:match('commit') and ft:match('rebase'))
                    and last_known_line > 1
                    and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
                then
                    vim.api.nvim_feedkeys([[g`"]], 'x', false)
                end
            end,
        })
    end,
})

