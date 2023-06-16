--
-- Some of my common utils
--
local M = {}
-- Find a window that contains the buffer in the given tab
function M.find_win_in_buf(tab, buffer)
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
        if vim.api.nvim_win_get_buf(win) == buffer then
            return win
        end
    end
    return nil
end

-- Given a filename, either open it or find it in local buffers
-- and set cursor position
function M.open_file_at_loc(filename, line, col)
    filename = vim.fn.resolve(filename)
    local buf = vim.fn.bufnr(filename)
    if not vim.api.nvim_buf_is_loaded(buf) then
        buf = vim.fn.bufadd(filename)
        if buf == 0 then
            print("Cannot open ", filename)
            return
        end
        vim.fn.bufload(buf)
        vim.api.nvim_win_set_buf(0, buf)
    end
    local target_win;
    local target_tab = vim.api.nvim_get_current_tabpage()
    target_win = M.find_win_in_buf(target_tab, buf)
    if target_win == nil then
        -- search all tabs, use the first one
        for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
            target_win = M.find_win_in_buf(tab, buf)
            if target_win ~= nil then
                target_tab = tab
                break
            end
        end
    end
    -- in theory the buffer should already be loaded and shown in some window,
    -- but just in case
    if target_win == nil then return end
    -- switch to target tab, win, and set cursor
    vim.api.nvim_set_current_tabpage(target_tab)
    vim.api.nvim_set_current_win(target_win)
    vim.api.nvim_win_set_cursor(target_win, { line, col })
end

--
-- Formatting for latex, markdown, vimwiki and org
--
function M.format_line()
    if vim.fn.col(".") == vim.fn.col("$") then
        local keys = vim.api.nvim_replace_termcodes("<esc>gqqA<cr>", true, true, true)
        vim.api.nvim_feedkeys(keys, "n", true)
    else
        local keys = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
        vim.api.nvim_feedkeys(keys, "n", true)
    end
end

return M
