-- auto save/load session if in git, using repo_name + branch name
local function session_name()
    vim.fn.system("git remote -v")
    if vim.v.shell_error ~= 0 then
        return ""
    end
    local repo_name = vim.fn.system("basename $(git rev-parse --show-toplevel) 2> /dev/null | tr -d '\n'")
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    return repo_name .. ":" .. branch
end

local function StartifyLoadSessionMenu(session)
    local Menu = require("nui.menu")
    local title = "Load session " .. session .. "?"

    local popup_options = {
        relative = "editor",
        position = "50%",
        border = {
            style = "rounded",
            text = {
                top = title,
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal",
        }
    }

    local menu = Menu(popup_options, {
        lines = {
            Menu.separator(""),
            Menu.item("Yes"),
            Menu.item("No"),
        },
        min_width = vim.api.nvim_strwidth(title),
        max_width = vim.api.nvim_strwidth(title),
        keymap = {
            focus_next = { "j", "<Down>", "<Tab>" },
            focus_prev = { "k", "<Up>", "<S-Tab>" },
            close = { "<Esc>", "<C-c>", "q" },
            submit = { "<CR>", "<Space>" },
        },
        on_close = function()
        end,
        on_submit = function(item)
            vim.print(item)
            if string.find(item.text, "Yes") then
                local execute = "SLoad " .. session
                vim.cmd(execute)
            end
        end,
    })
    menu:mount()
end

vim.api.nvim_create_augroup("Startify", { clear = true })
-- auto session
vim.api.nvim_create_autocmd("User", {
    group = "Startify",
    pattern = { "StartifyReady" },
    nested = true, -- https://github.com/neovim/neovim/issues/8136
    callback = function()
        -- do not load if in headless mode
        local headless = vim.tbl_isempty(vim.api.nvim_list_uis())
        if headless then return end
        local branch = session_name()
        if branch == "" then return end
        StartifyLoadSessionMenu(branch)
    end
})
-- auto save
vim.api.nvim_create_autocmd("VimLeavePre", {
    group = "Startify",
    pattern = { "*" },
    callback = function()
        local branch = session_name()
        if branch == "" then return end
        local execute = "SSave! " .. branch
        vim.cmd(execute)
    end
})

-- TODO: this needs to be calculated better
local width = vim.api.nvim_win_get_width(0)
-- 25%?
vim.g.startify_padding_left = math.floor(width * 0.25)
local header = vim.fn['startify#center']({
    [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
    [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
    [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
    [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
    [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
    [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
})

vim.g.startify_custom_header = header
