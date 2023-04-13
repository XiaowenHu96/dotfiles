local ok, _ = pcall(require, "vimtex")
if not ok then
    print("Unable to load vimtex")
end

vim.g.vimtex_view_method = 'zathura'
