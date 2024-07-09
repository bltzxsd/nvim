---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		--  format with conform
		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			"formatting",
		},
		["<leader>ih"] = {
			function(_, bufnr)
				vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(bufnr))
			end,
			"disable inlay hint",
		},
		["<leader>qf"] = {
			function()
				vim.lsp.buf.code_action {
					filter = function(a)
						return a.isPreferred
					end,
					apply = true,
				}
			end,
			"Apply the suggested quick-fix",
		},
		["<leader>cc"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"Shows the documentation of element below cursor",
		},
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

-- more keybinds!

return M
