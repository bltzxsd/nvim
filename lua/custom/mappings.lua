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
			function(_, _)
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end,
			"toggle inlay hints",
		},
		["<leader>sd"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"show documentation of element below cursor",
		},
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

-- more keybinds!

return M
