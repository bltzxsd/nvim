---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
	theme = "everforest",
	theme_toggle = { "rosepine", "everforest" },

	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = {
		theme = "minimal",
	},

	cheatsheet = {
		theme = "grid",
	},

	cmp = {
		icons = true,
		style = "flat_dark",
	},

	nvdash = {
		load_on_startup = true,
	},
	lsp = {
		signature = {
			silent = true,
			disabled = false,
		},
	},

	transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
