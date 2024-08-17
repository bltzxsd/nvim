local M = {}

M.original_padding = { x = 15, y = 15 } -- Default values, will be updated
M.config_path = ""

local function get_os()
	if vim.fn.has "win32" == 1 then
		return "win"
	elseif vim.fn.has "wsl" == 1 then
		return "wsl"
	else
		return "unix"
	end
end

local function get_alacritty_config_path()
	local os = get_os()
	local path = ""

	local function get_username()
		local whoami_output = vim.fn.trim(vim.fn.system "whoami")
		-- Extract username from "hostname\username" format if necessary
		return whoami_output:match "\\?([^\\]+)$"
	end

	if os == "win" then
		path = vim.fn.expand "$APPDATA\\alacritty\\alacritty.toml"
	elseif os == "wsl" then
		local username = get_username()
		path = "/mnt/c/Users/" .. username .. "/AppData/Roaming/alacritty/alacritty.toml"
	else -- unix
		path = vim.fn.expand "$HOME/.config/alacritty/alacritty.toml"
	end

	-- print("Detected OS: " .. os)
	-- print("Alacritty config path: " .. path)
	return path
end

local function file_exists(path)
	local f = io.open(path, "r")
	if f then
		f:close()
		return true
	end
	return false
end

local function read_config_file(path)
	if not file_exists(path) then
		-- print("Alacritty config file does not exist: " .. path)
		return nil
	end

	local f, err = io.open(path, "r")
	if not f then
		print("Could not open Alacritty config file: " .. path)
		print("Error: " .. (err or "unknown error"))
		return nil
	end
	local content = f:read "*all"
	f:close()
	return content
end

local function write_config_file(path, content)
	local f = io.open(path, "w")
	if not f then
		-- print "Could not open Alacritty config file for writing"
		return false
	end
	f:write(content)
	f:close()
	return true
end

local function extract_padding(content)
	local x, y = content:match "padding%s*=%s*{%s*x%s*=%s*(%d+)%s*,%s*y%s*=%s*(%d+)%s*}"
	return { x = tonumber(x), y = tonumber(y) }
end

function M.modify_alacritty_config()
	M.config_path = get_alacritty_config_path()

	if not file_exists(M.config_path) then
		-- print "Alacritty config file not found. Please check the path and ensure the file exists."
		return
	end

	local content = read_config_file(M.config_path)
	if not content then
		return
	end

	M.original_padding = extract_padding(content)

	-- Modify the padding settings
	content =
		content:gsub("padding%s*=%s*{%s*x%s*=%s*%d+%s*,%s*y%s*=%s*%d+%s*}", string.format "padding = { x = 0, y = 0 }")

	if not write_config_file(M.config_path, content) then
		print "Alacritty config not updated"
	end
end

function M.restore_alacritty_config()
	local content = read_config_file(M.config_path)
	if not content then
		return
	end

	-- Restore the original padding settings
	content = content:gsub(
		"padding%s*=%s*{%s*x%s*=%s*%d+%s*,%s*y%s*=%s*%d+%s*}",
		string.format("padding = { x = %d, y = %d }", M.original_padding.x, M.original_padding.y)
	)

	if not write_config_file(M.config_path, content) then
		print "Alacritty config could not be restored"
	end
end

return M
