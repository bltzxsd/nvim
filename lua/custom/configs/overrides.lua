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
		"cpp",
		"rust",
		"haskell",
		"yaml",
		"toml",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- hardware tuff
		"asmfmt",
		"arduino-language-server",

		-- config stuff
		"yaml-language-server",

		-- shader stuff
		"wgsl-analyzer",
		"glsl_analyzer",

		-- python stuff
		"ruff",
		"ruff-lsp",
		"isort",

		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",
		"cpplint",

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
