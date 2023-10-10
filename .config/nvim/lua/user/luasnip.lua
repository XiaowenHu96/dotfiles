-- load this before the cmp plugin
local ok, ls = pcall(require, "luasnip")
if not ok then
    return
end

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
ls.add_snippets("all", {
    s({
        trig = "/date:today",
        desc = "insert today's date",
        name = "date:today (yyyy-mm-dd)",
    }
    , {
        f(function(_, _, _)
            return os.date("%Y-%m-%d")
        end)
    }),
    s({
        trig = "/date:today",
        desc = "insert today's date",
        name = "date:today (yyyy/mm/dd)",
    }
    , {
        f(function(_, _, _)
            return os.date("%Y/%m/%d")
        end)
    }),
})
