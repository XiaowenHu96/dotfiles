local ok, neorg = pcall(require, 'neorg')
if not ok then
    return
end


neorg.setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                folds = false,
            }
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[Neorg]"
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    main = "~/neorg",
                },
                default_workspace = "main",
                index = "index.norg"
            },
        },
        ["core.summary"] = {
            config = {
                strategy = "default",
            }
        },
        ["core.esupports.metagen"] = {
            config = {
                type = "auto"
            }
        }
    },
}

vim.api.nvim_create_augroup("MyNeorg", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = "MyNeorg",
    pattern = { "*.norg"},
    callback = function()
        vim.opt.conceallevel = 2
    end
})
