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

vim.api.nvim_create_augroup("Startify", { clear = true })
-- auto load
vim.api.nvim_create_autocmd("User", {
    group = "Startify",
    pattern = { "StartifyReady" },
    callback = function()
        -- do not load if in headless mode
        local headless = vim.tbl_isempty(vim.api.nvim_list_uis())
        if headless then return end
        local branch = session_name()
        if branch == "" then return end
        local load
        vim.ui.input({
                prompt = "Detect startify session " .. branch .. ", load? (y/n)",
                default = "y",
            },
            function(input)
                if input == nil then input = "n" end
                load = string.lower(input)
            end
        )
        if not (load == "y") then return end
        local execute = "SLoad " .. branch
        vim.cmd(execute)
        vim.cmd(":filetype detect") -- update file type
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
