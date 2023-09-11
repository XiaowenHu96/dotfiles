local ok, nord = pcall(require, "nord")
if ok then
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false
    nord.set()
end

local colorscheme = "gruvbox-material"
vim.cmd("colorscheme " .. colorscheme)

-- Gruvbox, this must be set after colorscheme is applied
if colorscheme == "gruvbox-material" then
    local config = vim.api.nvim_call_function("gruvbox_material#get_configuration", {})
    local palette = vim.api.nvim_call_function("gruvbox_material#get_palette",
        { config['background'], config['foreground'], config['colors_override'] })
    vim.api.nvim_call_function("gruvbox_material#highlight", { 'NvimTreeNormal', palette['fg0'], palette['bg0'] })
    vim.api.nvim_call_function("gruvbox_material#highlight", { 'NvimTreeEndOfBuffer', palette['bg0'], palette['bg0'] })
    vim.api.nvim_call_function("gruvbox_material#highlight", { 'NvimTreeVertSplit', palette['bg1'], palette['bg1'] })
    vim.api.nvim_call_function("gruvbox_material#highlight", { 'NvimTreeCursorLine', palette['none'], palette['bg1'] })
end

-- Only needed because nord does not support semantic tokens
-- local links = {
--   ['@lsp.type.namespace'] = '@namespace',
--   ['@lsp.type.type'] = '@type',
--   ['@lsp.type.class'] = '@type',
--   ['@lsp.type.enum'] = '@type',
--   ['@lsp.type.interface'] = '@type',
--   ['@lsp.type.struct'] = '@structure',
--   ['@lsp.type.parameter'] = '@parameter',
--   ['@lsp.type.variable'] = '@variable',
--   ['@lsp.type.property'] = '@property',
--   ['@lsp.type.enumMember'] = '@constant',
--   ['@lsp.type.function'] = '@function',
--   ['@lsp.type.method'] = '@method',
--   ['@lsp.type.macro'] = '@macro',
--   ['@lsp.type.decorator'] = '@function',
-- }
-- for newgroup, oldgroup in pairs(links) do
--   vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
-- end
