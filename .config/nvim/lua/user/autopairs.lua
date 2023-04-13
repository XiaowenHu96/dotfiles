-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

npairs.setup {
    check_ts = true, -- use treesitter
    ts_config = {
        -- lua = {'string'},-- it will not add a pair on that treesitter node
        -- javascript = {'template_string'},
        -- java = false,-- don't check treesitter on java
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

-- latex settings
local Rule = require('nvim-autopairs.rule')
npairs.add_rules({
  -- TODO: can't support $$ $$ and $ $ at the same time, file issue
  Rule("$", "$",{"tex", "latex"}),
  Rule("\\[", "\\]",{"tex", "latex"}),
  Rule("\\(", "\\)",{"tex", "latex"})
  }
)

npairs.add_rule(Rule("$$","$$","tex"))

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print "Cannot load nvim-autopairs"
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
