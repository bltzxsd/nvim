local autocmd = vim.api.nvim_create_autocmd
local original_dir = vim.fn.getcwd()

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

autocmd("VimEnter", {
	callback = function()
		local target_dir = vim.fn.argv(0)
		if target_dir and vim.fn.isdirectory(target_dir) == 1 then
			vim.cmd("cd " .. target_dir)
		end
	end,
})

if (vim.fn.has "wsl") or (vim.fn.has "macunix") then
	if vim.fn.executable "wl-copy" == 0 then
		print "wl-clipboard not found, clipboard integration won't work"
	else
		vim.g.clipboard = {
			name = "wl-clipboard",
			copy = {
				["+"] = "wl-copy --foreground --type text/plain",
				["*"] = "wl-copy --foreground --primary --type text/plain",
			},
			paste = {
				["+"] = function()
					return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
				end,
				["*"] = function()
					return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
				end,
			},
			cache_enabled = true,
		}
	end
end

autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

if not vim.lsp.inlay_hint.is_enabled() then
	vim.lsp.inlay_hint.enable(true)
end

-- Restore padding when Neovim exits
autocmd("VimLeavePre", {
	callback = function()
		vim.cmd("cd " .. original_dir)
	end,
})

require("lsp_lines").setup()

autocmd({ "BufEnter", "FocusGained", "CursorHold" }, {
	callback = function()
		vim.diagnostic.config {
			virtual_lines = true,
			-- virtual_text = false,
			virtual_text = false,
			underline = true,
		}
	end,
})

autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		vim.opt_local.expandtab = true
	end,
})
-- https://github.com/folke/lazy.nvim/issues/620
