local which_key = require("which-key")

which_key.setup({
    layout = {
        height = { min = 3, max = 25 },
        align = "center"
    },
}
)

-- TODO: Use keymap doc to manage keymaps.
which_key.register({
        a = {
            name = "AI",
            c = { ":ChatGPT<CR>", "ChatGPT" },
            a = { ":ChatGPTActAs<CR>", "ChatGPT ActAs" },
        },
        b = {
            name = "buffer",
            q = { ":bdelete <CR>", "Quit Buffer" },
            h = { ":BufferLineMovePrev<CR>", "Move Left" },
            l = { ":BufferLineMoveNext<CR>", "Move Right" },
        },
        d = {
            name = "dotfiles",
            p = { ":e $MYVIMRC<CR>", "vimrc" },
            o = { ":e ~/.org<CR>", "org" },
            h = { ":e ~/.config/hypr/hyprland.conf<CR>", "hyprland" },
            w = { ":e ~/.config/waybar/waybar<CR>", "waybar" }
        },
        e = {
            { ":NvimTreeOpen<cr>", "Nvim Tree" },
        },
        f = {
            name = "file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
            g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
            r = { ":NvimTreeOpen<cr>", "Nvim Tree" },
        },
        h = {
            s = { ':Gitsigns stage_hunk<CR>', "Stage Hunk" },
            r = { ':Gitsigns reset_hunk<CR>', "Unset Hunk" },
            S = { 'gs.stage_buffer', "Stage Buffer" },
            u = { 'gs.undo_stage_hunk', "Undo Hunk" },
            R = { 'gs.reset_buffer', "Reset Buffer" },
            p = { 'gs.preview_hunk', "Preview" },
            b = { 'function() gs.blame_line{full=true} end', "Blame Line" },
        },
        l = {
            name = "LSP",
            d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
            g = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
            K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
            b = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
            f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
            j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diag" },
            k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diag" },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
            E = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diag list" },
            e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Error" },
        },
        L = {
            -- name = "latex",
            -- c = { ":VimtexClean<CR>", "clean" },
            -- C = { ":VimtexClean!<CR>", "clean pdf" },
            -- v = { ":VimtexView<CR>", "view" },
            -- r = { ":VimTexRSearch<CR>", "reverse search" },
            -- e = { ":VimtexError<CR>", "check error" },
            -- l = { ":VimtexCompile<CR>", "toggle compile" },
            -- L = { ":VimtexCompile<CR>", "toggle compile" },
        },
        s = {
            name = "search",
            g    = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        },
        S = {
            name = "spell",
            o    = { ":set spell spelllang=en_us<cr>", "spell on" },
            q    = { ":set nospell<cr>", "spell off" },
            s    = { "z=", "spell correction" },
        }
    },
    {
        prefix = "<leader>",
    }
)
