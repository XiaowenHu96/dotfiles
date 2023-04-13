local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    print "Cannot load lspconfig"
	return
end

-- server goes here
local servers = {
	"lua_ls",
    "rust_analyzer",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
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
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

require("user.lsp.handlers").setup()
