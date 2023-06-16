local keymap_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local my_util = require("user.my_util")
-- set leaderkey
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- easy motion among windows
keymap("n", "<C-h>", "<C-w>h", keymap_opts)
keymap("n", "<C-j>", "<C-w>j", keymap_opts)
keymap("n", "<C-k>", "<C-w>k", keymap_opts)
keymap("n", "<C-l>", "<C-w>l", keymap_opts)
-- easy resize
keymap("n", "<M-j>", ":resize -2<CR>", keymap_opts)
keymap("n", "<M-k>", ":resize +2<CR>", keymap_opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", keymap_opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", keymap_opts)
-- move between buffers (for bufferline)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", keymap_opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", keymap_opts)
-- TODO: file an issue on github?
-- This is a dummy keymap in visual mode
-- Wee need this, otherwise which-key somehow cannot pick up any vmap bindings
keymap("v", "<leader>?", "dummy", keymap_opts)

-- search at cursor position
keymap("n", "*", "*N", keymap_opts)

vim.api.nvim_create_augroup("MyFormat", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = "MyFormat",
    pattern = { "*.tex", "*.latex", "*.md", "*.org", "*.vimwiki" },
    callback = function()
        vim.opt.textwidth = 79
        vim.opt.fo:append { "l" }
        local opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_buf_set_keymap
        local bufnr = vim.api.nvim_get_current_buf()
        keymap(bufnr, "i", "<cr>", "<cmd>lua require(\"user.my_util\").format_line()<CR>", opts)
    end
})

function OpenFileInSystemRegister()
    local args = vim.fn.getreg("+")
    local arg_list = vim.split(args, ":")
    local filename = arg_list[1]
    filename = vim.fn.resolve(filename)
    local line = tonumber(1)
    local col = tonumber(1)
    if #arg_list == 3 then
        line = tonumber(arg_list[2])
        col = tonumber(arg_list[3])
    end
    print(string.format("Open: %s:%s:%s", filename, line, col))
    my_util.open_file_at_loc(filename, line, col)
end

keymap("n", "<leader>bg", "<cmd>lua OpenFileInSystemRegister()<CR>", keymap_opts)
