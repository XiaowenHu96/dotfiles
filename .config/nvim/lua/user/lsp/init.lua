local lspconfig = require('lspconfig')

-- server goes here
local servers   = {
    "rust_analyzer",
    "lua_ls",
    "grammarly",
    "texlab",
    "pyright",
    "gopls",
    "clangd"
}

local settings  = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.ERROR,
    max_concurrent_installers = 4,
}
-- setup manson
require("mason").setup(settings)
-- setup servers
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- server specific settings goes to user.lsp.'servername'
local opts = {}

for _, server in pairs(servers) do
    server = vim.split(server, "@")[1]
    local require_ok, conf = pcall(require, "user.lsp." .. server)
    if not require_ok then
        local err_msg = string.format("Cannot find lsp config for %s. At least an empty config file needs to present.",
            server)
        error(err_msg)
    end
    opts = {
        on_attach = function(client, bufnr)
            require("user.lsp.handlers").on_attach(client, bufnr)
            if conf.on_attach then
                conf.on_attach(client, bufnr)
            end
        end,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    opts = vim.tbl_deep_extend("force", conf.server_conf, opts)
    lspconfig[server].setup(opts)
end

vim.lsp.set_log_level("debug")
require("user.lsp.handlers").setup()
