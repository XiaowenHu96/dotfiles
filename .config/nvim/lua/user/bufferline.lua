local bufferline         = require("bufferline")

local highlights         = {}
-- use nord bufferline if it is loaded
local loaded_colorscheme = vim.g.colors_name
if loaded_colorscheme == "nord" then
    highlights = require("nord").bufferline.highlights({
        italic             = true,
        bold               = true,
        buffer_bg_selected = "#4c566A",
        buffer_bg          = "#4c566A",
        bg                 = "#3B4252",
        buffer_bg_visible  = "#3B4252",
    })
end
if loaded_colorscheme == "gruvbox-material" then
    highlights = {
        fill  = {
            bg = '#282828',
        },
    }
end

-- Close the current buffer while moving to the next buffer
-- This is so we can avoid the split being closed when the buffer is closed
-- NB: this is different from the 'close_command' in bufferline settings,
-- which only applies to CloseLeft/Right actions.
-- Bufferline does not have a CloseCurrent cmd atm.
vim.api.nvim_create_user_command(
    "MyBufferLineCloseCur",
    function()
        local elements_tbl = bufferline.get_elements()
        if (elements_tbl.mode ~= "buffers") then
            return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        bufferline.cycle(1);
        vim.cmd("bdelete!" .. bufnr)
    end,
    {}
)

bufferline.setup({
    highlights = highlights,
    options = {
        mode = "buffers",                    -- set to "tabs" to only show tabpages instead
        numbers = "ordinal",
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
            -- icon = '▎',                    -- this should be omitted if indicator style is not 'icon'
            style = 'underline',
            -- style = 'icon' | 'underline' | 'none', --
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true,  -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = false,
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_buffer_default_icon = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "slant",
        -- enforce_regular_tabs = false | true,
        -- always_show_bufferline = true | false,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        sort_by = 'insert_after_current',
    }
})
