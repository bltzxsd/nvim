local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

lspconfig.clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.g.rustaceanvim = {
	server = {
		on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(bufnr)
		end,
	},
}

local function quickfix()
	vim.lsp.buf.code_action {
		filter = function(a)
			return a.isPreferred
		end,
		apply = true,
	}
end
