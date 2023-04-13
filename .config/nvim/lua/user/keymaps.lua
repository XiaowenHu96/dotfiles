local keymap_opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
-- set leaderkey
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- easy motion among windows
keymap("n" , "<C-h>" , "<C-w>h" , keymap_opts)
keymap("n" , "<C-j>" , "<C-w>j" , keymap_opts)
keymap("n" , "<C-k>" , "<C-w>k" , keymap_opts)
keymap("n" , "<C-l>" , "<C-w>l" , keymap_opts)
-- easy resize
keymap("n" , "<M-j>" , ":resize -2<CR>"          , keymap_opts)
keymap("n" , "<M-k>" , ":resize +2<CR>"          , keymap_opts)
keymap("n" , "<M-h>" , ":vertical resize -2<CR>" , keymap_opts)
keymap("n" , "<M-l>" , ":vertical resize +2<CR>" , keymap_opts)
-- move between buffers (for bufferline)
keymap("n" , "<S-h>" , ":BufferLineCyclePrev<CR>" , keymap_opts)
keymap("n" , "<S-l>" , ":BufferLineCycleNext<CR>"     , keymap_opts)
-- TODO: file issue on github
-- This is a dummy keymap in visual mode
-- Wee need this, otherwise which-key somehow cannot pick up any vmap bindings
keymap("v", "<leader>?", "dummy", keymap_opts)

-- search at cursor position
keymap("n" , "*" , "*N"                       , keymap_opts)
