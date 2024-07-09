--type conform.options

local conform = require "conform"

-- Set up prettier rq
local options = {
	lsp_fallback = true,
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},

	-- stylua: ignore
	formatters_by_ft = {
		javascript	= {	 "prettier"	 },
		css			= {	 "prettier"	 },
		html		= {	 "prettier"	 },
		json		= {  "prettier"	 },
		clangd      = {  "prettier"  },
		lua			= {  "stylua"	 },
		rust		= {  "rustfmt"	 },
		sh			= {  "shfmt"	 },
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		conform.format()
	end,
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}
end, { desc = "Format file or range (in visual or normal mode)" })

conform.setup(options)
