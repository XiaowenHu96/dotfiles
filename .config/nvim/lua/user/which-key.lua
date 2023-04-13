local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    print "Cannot load which-key"
    return
end

which_key.setup({
    layout = {
        height = { min = 3, max = 25 },
        align = "center"
    },
}
)

which_key.register({
        d = {
            name = "dotfiles",
            p = {":e $MYVINRC<CR>", "vimrc"},
            h = {":e ~/.config/hypr/hyprland.conf<CR>", "hyprland"},
            w = {":e ~/.config/waybar/waybar<CR>", "waybar"}
        },
        e = {
            { ":NvimTreeOpen<cr>", "Nvim Tree" },
        },
        b = {
            name = "buffer",
            q = { ":bdelete <CR>", "Quit Buffer" },
            h = { ":BufferLineMovePrev<CR>", "Move Left" },
            l = { ":BufferLineMoveNext<CR>", "Move Right" },
        },
        f = {
            name = "file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
            g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
            r = { ":NvimTreeOpen<cr>", "Nvim Tree" },
        },
        s = {
            name = "search",
            g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
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
        h = {
            s = { ':Gitsigns stage_hunk<CR>', "Stage Hunk" },
            r = { ':Gitsigns reset_hunk<CR>', "Unset Hunk" },
            S = { 'gs.stage_buffer', "Stage Buffer" },
            u = { 'gs.undo_stage_hunk', "Undo Hunk" },
            R = { 'gs.reset_buffer', "Reset Buffer" },
            p = { 'gs.preview_hunk', "Preview" },
            b = { 'function() gs.blame_line{full=true} end', "Blame Line" },
        },
        L = {
            name = "latex",
            c = { ":VimtexClean<CR>", "clean" },
            C = { ":VimtexClean!<CR>", "clean pdf" },
            v = { ":VimtexView<CR>", "view" },
            r = { ":VimTexRSearch<CR>", "reverse search" },
            e = { ":VimtexError<CR>", "check error" },
            l = { ":VimtexCompile<CR>", "toggle compile" },
            L = { ":VimtexCompile<CR>", "toggle compile" },
        }
    },
    {
        prefix = "<leader>",
    }
)
