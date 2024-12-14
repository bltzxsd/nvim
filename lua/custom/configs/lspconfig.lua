local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
	html = {},
	cssls = {},
	ts_ls = {},
	clangd = {
		filetypes = { "cc", "cxx", "cpp", "c", "h", "cppm", "hpp" },
	},
	ruff = {},
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = lsp.filetypes or {},
	}
end

vim.g.rustaceanvim = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}
