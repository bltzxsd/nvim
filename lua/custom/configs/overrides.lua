local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- 󰄳I  "clangd
		-- 󰄳I  "clang-format
		-- 󰄳I  prettier
		-- 󰄳I  stylua
		-- 󰄳I  shfmt
		-- 󰄳I  arduino-language-server
		-- 󰄳I  asmfmt
		-- 󰄳I  cpplint
		-- 󰄳I  glsl_analyzer
		-- 󰄳I  isort
		-- 󰄳I  lua-language-server
		-- 󰄳I  ruff
		-- 󰄳I  ruff-lsp
		-- 󰄳I  wgsl-analyzer
		-- 󰄳I  yaml-language-server
		-- lua stuff
		"stylua",

		-- web dev stuff
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- shell stuff
		"shfmt",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
