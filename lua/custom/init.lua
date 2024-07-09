local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- Alacritty Config
-- 17 |
-- 18 | [window.padding]
-- 19 | x = 25
-- 20 | y = 25
-- 21 |

-- local pad_x_line = 19
-- local pad_y_line = 20
-- local p = 25
-- local z = 0
-- local alacritty_config = "C:\\Users\\blissard\\AppData\\Roaming\\alacritty\\alacritty.toml"
--
-- function Sad(line_n, from, to, fname)
-- 	local command = ':silent !pwsh -Command "& {sad ' .. line_n .. " " .. from .. " " .. to .. " '" .. fname .. "'}\""
-- 	vim.cmd(command)
-- end
--
-- function IncreasePadding()
-- 	Sad(pad_x_line, z, p, alacritty_config)
-- 	Sad(pad_y_line, z, p, alacritty_config)
-- end
--
-- function DecreasePadding()
-- 	Sad(pad_x_line, p, z, alacritty_config)
-- 	Sad(pad_y_line, p, z, alacritty_config)
-- end
--
-- -- stylua: ignore
-- vim.cmd[[
-- 	augroup ChangeAlacrittyPadding
-- 	au!
-- 	au VimEnter * lua DecreasePadding()
-- 	au VimLeavePre * lua IncreasePadding()
-- 	augroup END
-- ]]
