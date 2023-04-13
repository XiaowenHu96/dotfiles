-- auto save/load session if in git, using repo_name + branch name
local function session_name()
    local repo_name = vim.fn.system("basename $(git rev-parse --show-toplevel) 2> /dev/null | tr -d '\n'")
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    -- do not save if not in git.
    if branch == "" then
        return ""
    end
    return repo_name .. ":" .. branch
end

-- auto load
vim.api.nvim_create_autocmd("User", {
    pattern = { "StartifyReady" },
    callback = function()
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
    end
})
-- auto save
vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = { "*" },
    callback = function()
        local branch = session_name()
        if branch == "" then return end
        local execute = "SSave! " .. branch
        vim.cmd(execute)
    end
})
