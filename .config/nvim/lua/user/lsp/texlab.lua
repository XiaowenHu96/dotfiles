-- stolen from lspconfig/texlab.lua, since 'commands' is going be removed.
local util = require 'lspconfig.util'
local my_util = require 'user.my_util'
local texlab_client = nil

local texlab_build_status = vim.tbl_add_reverse_lookup {
    Success = 0,
    Error = 1,
    Failure = 2,
    Cancelled = 3,
}

local texlab_forward_status = vim.tbl_add_reverse_lookup {
    Success = 0,
    Error = 1,
    Failure = 2,
    Unconfigured = 3,
}

local function buf_build()
    local bufnr = vim.api.nvim_get_current_buf()
    -- local texlab_client = util.get_active_client_by_name(bufnr, 'texlab')
    local params = {
        textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    }
    if texlab_client then
        texlab_client.request('textDocument/build', params, function(err, result)
            if err then
                error(tostring(err))
            end
            print('Build ' .. texlab_build_status[result.status])
        end, bufnr)
    else
        print 'method textDocument/build is not supported by any servers active on the current buffer'
    end
end

local function buf_search()
    local bufnr = vim.api.nvim_get_current_buf()
    -- local texlab_client = util.get_active_client_by_name(bufnr, 'texlab')
    local params = {
        textDocument = { uri = vim.uri_from_bufnr(bufnr) },
        position = { line = vim.fn.line '.' - 1, character = vim.fn.col '.' },
    }
    if texlab_client then
        texlab_client.request('textDocument/forwardSearch', params, function(err, result)
            if err then
                error(tostring(err))
            end
            print('Search ' .. texlab_forward_status[result.status])
        end, bufnr)
    else
        print 'method textDocument/forwardSearch is not supported by any servers active on the current buffer'
    end
end

-- bridge between pdf viewer and nvim instances
-- forward request to all nvim servers
function TexlabInverseSearch(filename, line)
    local serverlists = vim.fn.system("find ${XDG_RUNTIME_DIR:-${TMPDIR}nvim.${USER}}/nvim* -type s")
    local servers = vim.split(serverlists, "\n")
    local cmd = string.format(":lua TexlabPerformInverseSearch(\"%s\", %d)", filename, line)
    for _, server in ipairs(servers) do
        local ok, socket = pcall(vim.fn.sockconnect, 'pipe', server, { rpc = 1 })
        if ok then
            vim.fn.rpcnotify(socket, 'nvim_command', cmd)
        end
    end
end

-- the actual function that handle the inverse search request.
function TexlabPerformInverseSearch(filename, line)
    -- check if texlab is running
    if not texlab_client then return end
    my_util.open_file_at_loc(filename, line, 1)
end

function TexlabFormatLine()
    vim.opt.textwidth = 79
    vim.opt.fo:append { "l" }
    if vim.fn.col(".") == vim.fn.col("$") then
        local keys = vim.api.nvim_replace_termcodes("<esc>gqqA<cr>", true, true, true)
        vim.api.nvim_feedkeys(keys, "n", true)
    else
        local keys = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
        vim.api.nvim_feedkeys(keys, "n", true)
    end
end

local M = {}

local function my_on_attach(client_id, bufnr)
    texlab_client = client_id
    local keymap = vim.api.nvim_buf_set_keymap
    -- do not show hover error in latex
    vim.api.nvim_clear_autocmds({
        buffer = bufnr,
        group = "LSP_HOVER_ERROR"
    })
    vim.api.nvim_create_user_command("TexlabBuild", buf_build, { desc = 'TexlabBuild' })
    vim.api.nvim_create_user_command("TexlabView", buf_search, { desc = 'TexlabView' })
    keymap(bufnr, "n", "<leader>Ll", ":TexlabBuild<CR>", { noremap = true, silent = true, desc = { "TexlabBuild" } })
    keymap(bufnr, "n", "<leader>Lv", ":TexlabView<CR>", { noremap = true, silent = true, desc = { "TexlabView" } })
end

M.on_attach = my_on_attach
M.server_conf = {
    -- for debug
    cmd = { "texlab", "-vvvv", "--log-file=/tmp/texlab.log" },
    filetypes = { "latex", "tex" },
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-recorder", "--shell-escape", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = true
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" }
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = true,
                ['local'] = "~/.config/latexindent.yaml"
            }
        }
    }
}
return M
