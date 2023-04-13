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
    tags="tags;/",
    timeoutlen = 500,
    updatetime = 250,
    filetype = "on",
}

for k, v in pairs(vim_opts) do
    vim.opt[k] = v
end

vim.opt.clipboard:append {"unnamedplus"}
vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
