local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	-- {
	-- 	"andweeb/presence.nvim",
	-- 	lazy = false,
	-- },

	-- {
	-- 	"0x00-ketsu/autosave.nvim",
	-- 	event = { "TextChanged" },
	-- 	prompt_style = "notify",
	-- 	config = function()
	-- 		require("autosave").setup {
	-- 			write_all_buffers = true,
	-- 		}
	-- 	end,
	-- },

	{
		"neovim/nvim-lspconfig",
		opts = { inlay_hints = { enabled = true } },
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		-- for users those who want auto-save conform + lazyloading!
		-- event = "BufWritePre"
		config = function()
			require "custom.configs.conform"
		end,
		lazy = false,
	},

	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	lazy = false,
	-- },

	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		lazy = false,
	},
}

return plugins
